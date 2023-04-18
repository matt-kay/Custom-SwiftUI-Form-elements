//
//  CustomFormElements.swift
//  CustomSwiftUiFormElements
//
//  Created by Mattosha on 17/04/2023.
//

import SwiftUI

struct Shake: AnimatableModifier {
    var shakes: CGFloat = 0
    
    var animatableData: CGFloat {
        get {
            shakes
        } set {
            shakes = newValue
        }
    }
    
    func body(content: Content) -> some View {
        content
            .offset(x: sin(shakes * .pi * 2) * 5)
    }
}

func errorShake(_ numberOfShakes : Binding<Double>){
    withAnimation {
        if numberOfShakes.wrappedValue > 0 {
            numberOfShakes.wrappedValue =  0
        }else{
            numberOfShakes.wrappedValue = 4
        }
        
    }
}

extension View {
    func shake(with shakes: CGFloat) -> some View {
        modifier(Shake(shakes: shakes))
    }
}


struct CustomFormElements: View {
    
    @State private var firstName : String = ""
    @State private var firstNameErrMsg : String = ""
    
    @State private var lastName : String = ""
    @State private var lastNameErrMsg : String = ""
    
    @State private var username : String = ""
    @State private var usernameErrMsg : String = ""
    
    @State private var password : String = ""
    @State private var passwordErrMsg : String = ""
    
    @State private var about : String = ""
    @State private var aboutErrMsg : String = ""
    
    @State private var numberOfShakes : Double = 0
    
    var body: some View {
        VStack{
            FormTextField(title: "Enter first name", name: $firstName, error: firstNameErrMsg,max: 7, showCount: true).shake(with: numberOfShakes)
            
            FormTextField(title: "Enter last name", name: $lastName, error: lastNameErrMsg).shake(with: numberOfShakes)
            
            FormTextField(title: "Enter username", name: $username, error: usernameErrMsg).shake(with: numberOfShakes)
            
            FormTextArea(title: "About", name: $about, error: aboutErrMsg, showCount: true).shake(with: numberOfShakes)
            
            FornSecureTextField(title: "Enter password", name: $password, error: passwordErrMsg, max: 10)
            
            Button {
                if firstName.isEmpty{
                    firstNameErrMsg = "first name is required!"
                    errorShake($numberOfShakes)
                }else if lastName.isEmpty{
                    lastNameErrMsg = "last name is required!"
                    errorShake($numberOfShakes)
                }else if username.isEmpty{
                    usernameErrMsg = "user name is required!"
                    errorShake($numberOfShakes)
                }else{
                    
                }
            } label: {
                Text("Submit")
            }

        }
        .padding()
    }
}

struct CustomFormElements_Previews: PreviewProvider {
    static var previews: some View {
        CustomFormElements()
    }
}
