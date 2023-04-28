//
//  FormMultipleSelectField.swift
//  CustomSwiftUiFormElements
//
//  Created by Mattosha on 28/04/2023.
//

import SwiftUI

struct FormMultipleSelectField: View {
    let title : String
    @Binding var name : [String]
    let error : String
    
    let options : [String]
    
    let max : Int

    @State private var isPresentedSheet : Bool = false
    
    init(title: String, name: Binding<[String]>, error : String, options : [String],max : Int) {
        self.title = title
        self._name = name
        self.error = error
        self.options  = options
        self.max = max
    }
    
    var body: some View {
        VStack{
            HStack{
                Text(name.count > 0 ? "\(name.count) \(title)" : title)
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
                    Text(name.count > 0 ? "\(max - name.count) remaining" : "")
                    List(options.indices, id : \.self){ index in
                        HStack{
                            Text(options[index])
                                .onTapGesture {
                                    if name.contains(options[index]){
                                        if let elemIndex = name.firstIndex(of: options[index]){
                                            name.remove(at: elemIndex)
                                        }
                                    }else{
                                        if name.count != max{
                                            name.append(options[index])
                                        }
                                    }

                                }
                            Spacer()
                            if name.contains(options[index]) {
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

struct FormMultipleSelectField_Previews: PreviewProvider {
    static var previews: some View {
        FormMultipleSelectField(title:"Gender", name: .constant(["Male"]), error: "", options: ["Male","Female"], max: 2)
    }
}
