//
//  ContentView.swift
//  BarnerToDo
//
//  Created by Dave Barner on 12/29/22.
//

import SwiftUI

struct ContentView: View {
    @State private var todoItems: [String] = []
    @State private var newTodoItem = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                HStack {
                    TextField("Add new todo", text: $newTodoItem)
                        .textFieldStyle(.roundedBorder)
                        .onSubmit {
                            addNewTodo()
                        }.padding([.leading], 10)
                    Button("Add", action: addNewTodo)
                        .padding([.trailing], 10)
                        .padding([.leading], 5)
                }.padding(10)
                
                Group {
                    if todoItems.count > 0 {
                        List {
                            ForEach(todoItems, id: \.self) { todo in
                                Text("\(todo)")
                            }.onDelete(perform: deleteToDo)
                        }
                    } else {
                        ScrollView {
                            Text("Add a to do above. Then, get it done!")
                                .padding(.top, 40)
                        }
                    }
                }
            }  .toolbar {
                EditButton()
            }
                .navigationTitle("GSD")
        }
     }
    
    func addNewTodo() {
        todoItems.append(newTodoItem)
        newTodoItem = ""
    }
    
    func deleteToDo(at offsets: IndexSet) {
         todoItems.remove(atOffsets: offsets)
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
