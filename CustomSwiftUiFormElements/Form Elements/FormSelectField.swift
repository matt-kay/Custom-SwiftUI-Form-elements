//
//  FormSelectField.swift
//  CustomSwiftUiFormElements
//
//  Created by Mattosha on 19/04/2023.
//

import SwiftUI

struct FormSelectField: View {
    let title : String
    @Binding var name : String
    let error : String
    
    let options : [String]

    @State private var isPresentedSheet : Bool = false
    
    init(title: String, name: Binding<String>, error : String, options : [String]) {
        self.title = title
        self._name = name
        self.error = error
        self.options  = options
    }
    
    var body: some View {
        VStack{
            HStack{
                Text(name.isEmpty ? title : name)
                Spacer()
                Image(systemName: "chevron.up.chevron.down")
                
            }
            .padding()
            .foregroundColor(Color.white)
            .background(Color.gray.opacity(0.6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .onTapGesture {
                isPresentedSheet.toggle()
            }
            .sheet(isPresented: $isPresentedSheet) {
                VStack{
                    List(options, id : \.self){ item in
                        HStack{
                            Text(item)
                                .onTapGesture {
                                    name = item
                                    isPresentedSheet.toggle()
                                }
                            Spacer()
                            if name == item {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(Color.green)
                            }
                        }
                    }
                    .listStyle(.plain)
                }
                .presentationDetents([.medium])
            }
            if !error.isEmpty {
                Text(error).font(.caption).foregroundColor(.red).frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct FormSelectField_Previews: PreviewProvider {
    static var previews: some View {
        FormSelectField(title:"Gender", name: .constant("Male"), error: "", options: ["Male","Female"])
    }
}
