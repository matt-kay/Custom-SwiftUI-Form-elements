//
//  FormHashTagField.swift
//  CustomSwiftUiFormElements
//
//  Created by Mattosha on 03/05/2023.
//

import SwiftUI

struct FormHashTagField: View {
    let title : String
    @Binding var name : [String]
    let error : String
    
    @State var hashtag : String = ""
    
    init(title: String, name: Binding<[String]>, error: String) {
        self.title = title
        self._name = name
        self.error = error
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                ForEach(name , id : \.self) { hash in
                    HStack{
                        Button {
                            name = name.filter{$0 != hash}
                        } label: {
                            Image(systemName: "xmark.circle")
                        }
                        Text("#\(hash)")
                    }
                }
            }
            TextField(title, text: $hashtag)
                .padding()
                .border(.secondary)
            if !hashtag.isEmpty {
                HStack{
                    Spacer()
                    Button {
                        name.append(hashtag)
                        hashtag = ""
                    } label: {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .foregroundColor(.green)
                            .frame(width: 30, height: 30)
                    }
                    
                    Button {
                        hashtag = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .foregroundColor(.red)
                            .frame(width: 30,height: 30)
                    }

                    Spacer()
                }
                .padding()
            }
            
            if !error.isEmpty {
                Text(error).font(.caption).foregroundColor(.red).frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct FormHashTagField_Previews: PreviewProvider {
    static var previews: some View {
        FormHashTagField(title: "hash tag", name: .constant([]), error: "")
    }
}
