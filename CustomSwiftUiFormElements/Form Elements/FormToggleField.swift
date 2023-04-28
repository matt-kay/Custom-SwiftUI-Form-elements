//
//  FormToggleField.swift
//  CustomSwiftUiFormElements
//
//  Created by Mattosha on 28/04/2023.
//

import SwiftUI

struct FormToggleField: View {
    let title : String
    @Binding var name : Bool
    let error  : String
    
    init(title: String, name: Binding<Bool>, error: String) {
        self.title = title
        self._name = name
        self.error = error
    }
    var body: some View {
        VStack(alignment: .leading){
            Toggle(title, isOn: $name)
            if !error.isEmpty{
                Text(error).font(.caption).foregroundColor(.red)
            }
        }
    }
}

struct FormToggleField_Previews: PreviewProvider {
    static var previews: some View {
        FormToggleField(title: "Agree", name: .constant(true), error: "")
    }
}
