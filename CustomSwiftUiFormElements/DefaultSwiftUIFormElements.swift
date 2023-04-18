//
//  DefaultSwiftUIFormElements.swift
//  CustomSwiftUiFormElements
//
//  Created by Mattosha on 17/04/2023.
//

import SwiftUI

struct DefaultSwiftUIFormElements: View {
    
    @State private var firstName : String = ""
    @State private var firstNameErrMsg : String = ""
    
    @State private var lastName : String = ""
    @State private var lastNameErrMsg : String = ""
    
    @State private var username : String = ""
    @State private var usernameErrMsg : String = ""
    
    @State private var email : String = ""
    @State private var emailErrMsg : String = ""
    
    @State private var passsword : String = ""
    @State private var passswordErrMsg : String = ""
    
    @State private var gender : String = ""
    @State private var genderErrMsg : String = ""
    
    @State private var country : String = ""
    @State private var countryErrMsg : String = ""
    
    @State private var interests : [String] = []
    
    var body: some View {
        VStack{
            Group{
                TextField("First name", text: $firstName)
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.gray.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                if !firstNameErrMsg.isEmpty {
                    Text(firstNameErrMsg).font(.caption).foregroundColor(.red).frame(maxWidth: .infinity, alignment: .leading)
                }
                
                TextField("Last name", text: $lastName)
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.gray.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                if !lastNameErrMsg.isEmpty {
                    Text(lastNameErrMsg).font(.caption).foregroundColor(.red).frame(maxWidth: .infinity, alignment: .leading)
                }
                
                TextField("Username", text: $username)
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.gray.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                if !usernameErrMsg.isEmpty {
                    Text(usernameErrMsg).font(.caption).foregroundColor(.red).frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
            Group{
                TextField("Email", text: $email)
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.gray.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                if !emailErrMsg.isEmpty {
                    Text(emailErrMsg).font(.caption).foregroundColor(.red).frame(maxWidth: .infinity, alignment: .leading)
                }
                
                TextField("Password", text: $passsword)
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.gray.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                if !passswordErrMsg.isEmpty {
                    Text(passswordErrMsg).font(.caption).foregroundColor(.red).frame(maxWidth: .infinity, alignment: .leading)
                }
            }
           
            Group{
                
                TextField("Gender", text: $gender)
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.gray.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                if !genderErrMsg.isEmpty {
                    Text(genderErrMsg).font(.caption).foregroundColor(.red).frame(maxWidth: .infinity, alignment: .leading)
                }
                
                TextField("Country", text: $country)
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.gray.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                if !countryErrMsg.isEmpty {
                    Text(countryErrMsg).font(.caption).foregroundColor(.red).frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
            Button {
                if firstName.isEmpty{
                    firstNameErrMsg = "First name is required!"
                }else if lastName.isEmpty{
                    lastNameErrMsg = "Last name is required"
                }else if username.isEmpty {
                    usernameErrMsg = "Username is required"
                }else{
                    
                }
            } label: {
                Text("Submit")
            }

        }
        .padding()
    }
}

struct DefaultSwiftUIFormElements_Previews: PreviewProvider {
    static var previews: some View {
        DefaultSwiftUIFormElements()
    }
}
