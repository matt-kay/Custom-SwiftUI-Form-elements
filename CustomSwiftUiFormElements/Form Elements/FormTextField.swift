//
//  FormTextField.swift
//  CustomSwiftUiFormElements
//
//  Created by Mattosha on 17/04/2023.
//

import SwiftUI

struct FormTextField: View {
    let title : String
    @Binding var name : String
    let error : String
    
    let max : Int
    let showCount : Bool
    
    init(title: String, name: Binding<String>, error: String, max: Int = 30, showCount: Bool = false) {
        self.title = title
        self._name = name
        self.error = error
        self.max = max
        self.showCount = showCount
    }
    
    var body: some View {
        VStack{
            HStack{
                TextField(title, text: $name)
                    .onChange(of: name) { newValue in
                        if newValue.count >= max {
                            name = String(newValue.prefix(max))
                        }
                    }
                Spacer()
                if showCount{
                    Text("\(name.count) / \(max)")
                }
            }
                .padding()
                .foregroundColor(Color.white)
                .background(Color.gray.opacity(0.6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            if !error.isEmpty {
                Text(error).font(.caption).foregroundColor(.red).frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct FormTextField_Previews: PreviewProvider {
    static var previews: some View {
        FormTextField(title: "first name", name: .constant("name"), error: "", showCount: true)
    }
}
