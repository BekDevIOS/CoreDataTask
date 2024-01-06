//
//  DetailScrenn.swift
//  CoreDataTask
//
//  Created by Utkirbek Mekhmonboev on 1/5/24.
//

import SwiftUI

struct DetailScreen: View {
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) var moc
    
    @State var firstname = ""
    @State var lastname = ""
    @State var gender = ""
    let genders = ["Male", "Female"]
    @State var phone = ""
    @State var email = ""
    @State var address = ""
   
    
    func saveStudent(firstname: String, lastname: String, gender: String, phone: String, email: String, address: String){
        let student = Student(context: moc)
        student.id = UUID()
        student.firstname = firstname
        student.lastname = lastname
        student.gender = gender
        student.phone = phone
        student.email = email
        student.address = address
        try? moc.save()
    }
    var body: some View {
        NavigationView{
            Form{
                Section{
                  TextField("Firstname", text: $firstname)
                    TextField("Lastname", text: $lastname)
                    Picker("Gender", selection: $gender){
                        ForEach(genders, id: \.self){
                            Text($0)
                        }
                    }
                }
                Section{
                    TextField("Phone", text: $phone)
                    TextField("Email", text: $email)
                    TextField("Address", text: $address)
                }
            }
            .navigationBarTitle("Add Student", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button("Add"){
                saveStudent(firstname: firstname, lastname: lastname, gender: gender, phone: phone, email: email, address: address)
                presentation.wrappedValue.dismiss()
            }
            )
        }
    }
}

#Preview {
    DetailScreen()
}
