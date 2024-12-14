//
//  ContentView.swift
//  todo app
//
//  Created by Hemant Mehta on 13/12/24.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.mint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}

struct ContentView:View {
    @State private var tasks:[String]=[]
    @State private var name=""
    var body: some View {
        VStack
        {
            ScrollView{
                VStack(alignment: .leading){
                                ForEach(tasks,id:\.self){
                                    name in
                                    HStack{Text(name)
                                        .font(.title)
                                        .padding()
                                    
                                    Spacer()
                                    Button(action:{
                                        removeIndex(name)
                                    }){
                                        Image(systemName: "trash")
                                            .foregroundStyle(.red)
                                            .padding(.horizontal)
                                    }}
                        }
                            }
                    TextField("Enter Task",text:$name)
                        .onSubmit {
                            addtask()
                        }
                    
                HStack{
                        Button(action:addtask)
                        {
                            Text("Add")
                        }
                        Button(action:removeTask){
                            Text("Remove All Tasks")
                        }
                    }
                
            }
        }
        .padding()
    }
    private func addtask(){
            if !name.isEmpty{
                tasks.append(name)
                name=""
            }
        }
    
    private func removeTask()
    {
        if !tasks.isEmpty
            {
            // Removes from the last
//            tasks.removeLast()
//            
//            // Removes all the elements
            tasks.removeAll()
//            
//            // Removes from the first
//            tasks.removeFirst()
        }
    }
    
    private func removeIndex(_ name:String)
    {
//        tasks.removeAll(where: { $0 == name})
        tasks.removeAll(where: {$0==name})
    }
}

#Preview {
    ContentView()
}
