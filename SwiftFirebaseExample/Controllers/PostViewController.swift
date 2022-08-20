//
//  PostViewController.swift
//  SwiftFirebaseExample
//
//  Created by Mustafa Ali DİKÇINAR on 18.08.2022.
//

import UIKit

class PostViewController: UIViewController {

    @IBOutlet weak var category: UISegmentedControl!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    
    let authService: AuthProtocol = AuthService.instance
    let dataService: DataProtocol = DataService.instance

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSend(_ sender: Any) {
        let titleText = titleField.text
        let descriptionText = descriptionField.text
        let selectedCategory = category.selectedSegmentIndex
        
        guard authService.userModel != nil else{
            showToast(message: "Please login first!")
            return
        }
        
        guard titleText != nil, titleText != "", descriptionText != nil, descriptionText != "" else{
            showToast(message: "Title and description can't be empty!")
            return
        }
        let userId = AuthService.instance.userModel?.uuid
        let newPost = PostModel(id:nil, title: titleText, description: descriptionText, vote: 0, ownerId: userId, type: selectedCategory)
        
        dataService.sendPost(post: newPost){ error in
            self.showToast(message: error)
        } onSuccess: {
            self.tabBarController?.selectedIndex = 0
            self.showToast(message: "Post succesfully sended.")
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
