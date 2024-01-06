//
//  CellStudent.swift
//  CoreDataTask
//
//  Created by Utkirbek Mekhmonboev on 1/5/24.
//

import SwiftUI

struct CellStudent: View {
    @Environment(\.managedObjectContext) var moc
    var student: Student
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                HStack{
                    Text(student.firstname!).font(.system(size: 14)).fontWeight(.bold)
                    Text(student.lastname!).font(.system(size: 14)).fontWeight(.bold)
                }
                HStack{
                    Text(student.phone!).font(.system(size: 11))
                    Text("|")
                    Text(student.email!).font(.system(size: 11))
                }
                Text(student.address!).font(.system(size: 11))
            }
            Spacer()
                Text(student.gender!).font(.system(size: 14)).foregroundColor(.blue)
                Button("delete"){
                    moc.delete(student)
                }.font(.system(size: 14)).foregroundStyle(Color.red)
        }.padding(.top, 5).padding(.bottom, 5)
    }
}

#Preview {
    CellStudent(student: Student())
}
