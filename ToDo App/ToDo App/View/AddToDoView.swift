//
//  AddToDoView.swift
//  ToDo App
//
//  Created by AndyZett on 15/02/21.
//  Mantap josssss!!!

import SwiftUI

struct AddToDoView: View {
    
    //Mark: - Properties
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State private var name: String = ""
    @State private var priority: String = "High"
    
    let proirities = ["High", "Normal", "Low"]
    
    @State private var errorShowing: Bool = false
    @State private var errorTitle: String = ""
    @State private var errorMessage: String = ""
    
    
    @ObservedObject var theme = ThemeSettings.shared
    var themes: [Theme] = themeData
    
   
    //Mark: - Body
    var body: some View {
        NavigationView{
            
            VStack{
                VStack(alignment: .leading, spacing: 20){
                    
                    //ToDo name
                    TextField("ToDo", text: $name)
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(9)
                        .font(.system(size: 24, weight: .bold, design: .default))
                    
                    //Mark ToDo priorities
                    Picker("Priority", selection: $priority){
                        ForEach(proirities, id: \.self){
                            Text($0)
                            
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    Button(action: {
                        if self.name != ""{
                            let todo = ToDo(context: self.managedObjectContext)
                            todo.name = self.name
                            todo.priority = self.priority
                            
                            do {
                                try self.managedObjectContext.save()
                                print("New todo: \(todo.name ?? ""), priority: \(todo.priority ?? "")")
                            } catch {
                                print(error)
                            }
                            
                        } else {
                            self.errorShowing = true
                            self.errorTitle = "Invalid Name"
                            self.errorMessage = "Make sure to enter something for/n the new ToDo item"
                            return
                        }
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Save")
                            .font(.system(size: 24, weight: .bold, design: .default))
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(themes[self.theme.themeSettings].themeColor)
                            .foregroundColor(.white)
                            .cornerRadius(9)
                    }//MARK: save Button
                    
                }//VStack
                
                .padding(.horizontal)
                .padding(.vertical, 30)
                
                Spacer()
            }//VStack
            .navigationBarTitle("New ToDo", displayMode: .inline)
            .navigationBarItems(trailing:
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark")
            })
            
            .alert(isPresented: $errorShowing){
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
            
            
        }//Navigation
        .accentColor(themes[self.theme.themeSettings].themeColor)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

//Mark: - Preview
struct AddToDoView_Previews: PreviewProvider {
    static var previews: some View {
        AddToDoView()
    }
}

