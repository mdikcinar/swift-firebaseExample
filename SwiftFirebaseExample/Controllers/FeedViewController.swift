//
//  ViewController.swift
//  SwiftFirebaseExample
//
//  Created by Mustafa Ali DİKÇINAR on 16.08.2022.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var btnLogOut: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    let authService: AuthProtocol = AuthService.instance
    let dataService: DataProtocol = DataService.instance
    
    var postList = [PostModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataService.getPosts(onLoaded: { postList in
            self.postList = postList
            self.tableView.reloadData()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let currentUser = authService.userModel{
            navBar.topItem?.title = currentUser.email
            btnLogOut.isEnabled = true
        }else{
            navBar.topItem?.title = "List"
            btnLogOut.isEnabled = false
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FeedTableViewCell
        let post = postList[indexPath.row]
        cell?.lblTitle.text = post.title
        cell?.lblDescription.text = post.description
        cell?.lblCategory.text = post.type?.getCategoryName()
        cell?.btnVote.tag = indexPath.row
        cell?.btnDelete.tag = indexPath.row
        cell?.btnVote.addTarget(self, action: #selector(btnVoteOnPressed), for: .touchUpInside)
        cell?.btnDelete.addTarget(self, action: #selector(btnDeleteOnPressed), for: .touchUpInside)

        return cell ?? UITableViewCell()
    }
    
    @IBAction func btnLogOut(_ sender: Any) {
        do {
            try authService.signOut()
            navBar.topItem?.title = "List"
            btnLogOut.isEnabled = false
            showToast(message: "Succesfully logged out.")
        } catch _ {
        }
    }
    
    @objc func btnVoteOnPressed(_ sender: UIButton){
        
    }
    
    @objc func btnDeleteOnPressed(_ sender: UIButton){
        
    }

}

