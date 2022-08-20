//
//  DataService.swift
//  SwiftFirebaseExample
//
//  Created by Mustafa Ali DİKÇINAR on 18.08.2022.
//

import Firebase

let BASE_URL = "https://swiftfirebaseexample-8a1c8-default-rtdb.europe-west1.firebasedatabase.app/"

class DataService: DataProtocol {

    static let instance = DataService()
    
    let BASE_REF = Database.database().reference(fromURL: BASE_URL)
    let POST_REF = Database.database().reference(fromURL: BASE_URL + "/posts")

    private init(){}
    
    func sendPost(post:PostModel,onError:((String) -> Void)? = nil, onSuccess:(() -> Void)? = nil) {
        let firebaseNewItem = POST_REF.childByAutoId()
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(post)
            let json = try JSONSerialization.jsonObject(with: data)
            
            firebaseNewItem.setValue(json){ (error: Error?, ref: DatabaseReference) -> Void in
                guard error == nil else{
                    if onError != nil {
                        onError!(error?.localizedDescription ?? "DataService UnkownError")
                    }
                    return
                }
                if onSuccess != nil {
                    onSuccess!()
                }
                
            }
            
        } catch  {
            print("DataService: An error accured while encoding postModel")
        }
        

    }
    
    func deletePost(postId:String,onError:((String) -> Void)? = nil, onSuccess:(() -> Void)? = nil) {
        
    }
    
    func votePost() {
                
    }
    
    func getPosts(onLoaded:@escaping (([PostModel]) -> Void)) {
        
        POST_REF.observe(.value, with: {(snapshot: DataSnapshot?) in
            if let snapshots = snapshot?.children.allObjects as? [DataSnapshot] {
                let decoder = JSONDecoder()
                var postList = [PostModel]()
                for snap in snapshots{
                    if var postJson = snap.value as? [String: Any]{
                        postJson["id"] = snap.key
                        do{
                            let data = try JSONSerialization.data(withJSONObject: postJson)
                            let post = try decoder.decode(PostModel.self, from: data)
                            postList.insert(post, at: 0)
                        }catch{
                            print("GetPosts: An error occurred", error)
                        }
                    }
                }
                onLoaded(postList)
            }
            
        })
       
    }
}
