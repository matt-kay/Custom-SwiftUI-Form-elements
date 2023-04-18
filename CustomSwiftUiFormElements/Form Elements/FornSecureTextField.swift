//
//  FornSecureTextField.swift
//  CustomSwiftUiFormElements
//
//  Created by Mattosha on 18/04/2023.
//

import SwiftUI

struct FornSecureTextField: View {
    let title : String
    @Binding var name : String
    let error : String
    
    let max : Int
    let showCount : Bool
    
    @State private var hide : Bool = false
    
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
                if hide{
                    SecureField(title, text: $name)
                        .onChange(of: name) { newValue in
                            if newValue.count >= max {
                                name = String(newValue.prefix(max))
                            }
                        }
                }else{
                    TextField(title, text: $name)
                        .onChange(of: name) { newValue in
                            if newValue.count >= max {
                                name = String(newValue.prefix(max))
                            }
                        }
                }
                
                Spacer()
                Button {
                    hide.toggle()
                } label: {
                    if hide {
                        Image(systemName: "eyebrow")
                    }else{
                        Image(systemName: "eye.fill")
                    }
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

struct FornSecureTextField_Previews: PreviewProvider {
    static var previews: some View {
        FornSecureTextField(title: "first name", name: .constant("name"), error: "", showCount: true)
    }
}
