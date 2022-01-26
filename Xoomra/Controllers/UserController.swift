//
//  UserController.swift
//  Xoomra
//
//  Created by Humaira Bodi on 2022-01-24.
//

import Foundation
import FirebaseFirestore
import Combine

class UserController: ObservableObject{
    
    @Published var userList = [Register]()
    private var ordercollection: CollectionReference!
   
    
    
    private let store : Firestore
    private static var shared : UserController?
    
    static func getInstance() -> UserController {
            if shared != nil{
                return shared!
            }else{
                shared = UserController(database: Firestore.firestore())
                return shared!
            }
        }
    
    private init(database : Firestore){
        self.store = database
    }
    
    func registerUser(newUser : Register){
        
        
        
        
        do{
            try store.collection("NewCollection").addDocument(from: newUser)
        }catch let error as NSError{
            print(#function, "Error while getting document change", error)
        }
        
    }
    
   
     
        
    func getAllTasks(newUser: Register){
        self.store.collection("Registration")
           
            .addSnapshotListener({ (querySnapshot, error) in
                
                guard let snapshot = querySnapshot else{
                    print(#function, "Error while getting documents from Firestore", error)
                    return
                }
                snapshot.documentChanges.forEach{ (docChange) in
                    var register = Register()
                    
                    do{
                        register = try docChange.document.data(as: Register.self)!
                        
                    
                            
                            let docemail = docChange.document.documentID
                            
                        let matchedIndex = self.userList.firstIndex(where: { ($0.email.elementsEqual(docemail))})
                         print("matchindex value is \(matchedIndex)")
                            if (matchedIndex == nil){
//                                self.userList[matchedIndex!] = register
                                do{
                                    try self.store.collection("Registration").addDocument(from: newUser)
                                }catch let error as NSError{
                                    print(#function, "Error while getting document change", error)
                                }
                                
                                
                            }
                                else{
                                    print("\(newUser.name) already have an account")
                                    print("Please sign up")
                                    
                            }
                        
                        
                    }catch let error as NSError{
                        print(#function, "Error while getting document change", error)
                    }
                }
                
            })
    }

    
    //    func getAllTasks(newUser : Register){
    //        self.store.collection("AnotherRegistration")
    ////            .order(by: "email", descending: false)
    //            .addSnapshotListener({ [self] (querySnapshot, error) in
    //                guard let snapshot = querySnapshot else{
    //                    print(#function, "Error while getting documents from Firestore", error as Any)
    //                    return
    //                }
    //                snapshot.documentChanges.forEach{ (docChange) in
    //
    //                    do{
    //                        var register = Register()
    //                        register = try docChange.document.data(as: Register.self)!
    //                            let docId = docChange.document.documentID
    //                            let matchedIndex = self.userList.firstIndex(where: { ($0.id?.elementsEqual(docId))!})
    //                            if (matchedIndex != nil){
    //                                print("Not allowed to register, email address already exist")
    //                            }else{
    //
    //                                do{
    //                                    try self.store.collection("AnotherRegistration").addDocument(from: newUser)
    //                                }catch let error as NSError{
    //                                    print(#function, "Error while getting document change", error)
    //                                }
    //
    ////                                print("New user")
    ////                                    try self.store.collection("XD").addDocument(from: newUser)
    //                            }
    //                    }catch let error as NSError{
    //                        print(#function, "Error while getting document change", error)
    //                    }
    //                }
    //            })
    //    }
    
//    func getAllTask(completion:@escaping TasksCompletion){
//            Firestore.firestore().collection("tasks")
//                .addSnapshotListener { taskSnap, error in
//                    taskSnap?.documentChanges.forEach({ (task) in
//                        let object = task.document.data()
//                        let json = try! JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
//                        var taskData = try! JSONDecoder().decode(Task.self, from: json)
//                        taskData.id = task.document.documentID
//
//                        if (task.type == .added) {
//                            Task.shared.append(taskData)
//                        }
//                        if (task.type == .modified) {
//                            let index = Task.shared.firstIndex(where: { $0.id ==  taskData.id})!
//                            Task.shared[index] = taskData
//                        }
//                    })
//                    if error == nil{
//                        completion(Task.shared,nil)
//                    }else{
//                        completion([],error?.localizedDescription)
//                    }
//                }
//        }
}
