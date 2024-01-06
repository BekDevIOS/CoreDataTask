//
//  ContentView.swift
//  CoreDataTask
//
//  Created by Utkirbek Mekhmonboev on 1/5/24.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    @State var isModel = false
    var body: some View {
        NavigationView{
            List{
           
                ForEach(students, id:\.id){
                    student in CellStudent(student: student)
                }
            }.listStyle(PlainListStyle())
            .navigationBarTitle("Student List", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button("Add"){
                self.isModel = true
            }.sheet(isPresented: $isModel, content: {
                DetailScreen()
            })
            )
        }
    }
}

#Preview {
    ContentView()
}
