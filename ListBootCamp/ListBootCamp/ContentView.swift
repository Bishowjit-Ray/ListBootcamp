//
//  ContentView.swift
//  ListBootCamp
//
//  Created by Bishowjit Ray on 15/9/22.
//

import SwiftUI

struct ContentView: View {
    @State var fruits: [String] = ["Apple","orange","banana","peach","mango"]
    @State var veggies: [String] = ["Tomato","potato","carrot"]
    var body: some View {
        
        NavigationView {
            List   {
                
                    Section(header:
                                HStack{
                        Text("Fruits")
                        Image(systemName: "heart.fill")
                           
                       Image(systemName: "flame.fill")
                      
                    }
                        .font(.title)
                        .foregroundColor(Color.purple)
                    )
                
                {
                        ForEach(fruits, id: \.self) { fruit in
                            Text(fruit.capitalized)
                }
                        .onDelete(perform: delete)
                        .onMove(perform: move)
                        .listRowBackground(Color.pink)
                    }
                Section(header: Text("Veggies")) {
                    ForEach(veggies, id: \.self) { veggies  in
                        Text(veggies.capitalized)
                    }
                }
                .listRowBackground(Color.blue)
                
            }
           
            //.listStyle(InsetGroupedListStyle())
            .navigationTitle("Grocery List")
            .navigationBarItems(
                leading: EditButton(),
                
                trailing: addButton  )
         
        }
        .accentColor(.red)
    }
    var addButton: some View{
        Button("Add" , action: {
            
    add()
    
})
    }
    
    func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    func move(indices: IndexSet, newOffSet:Int) {
        fruits.move(fromOffsets: indices, toOffset: newOffSet)
    }
    func add() {
        fruits.append("Cocunut")
    }
    
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
