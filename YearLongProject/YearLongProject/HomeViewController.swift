//
//  ViewController.swift
//  YearLongProject
//
//  Created by Derek Stengel on 2/29/24.
//

import UIKit

struct Post {
    let title: String
    let imageName: String
    let body: String
    let date: String
    let user: String
    let numberOfComments: String
}

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        table.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
    }
    
    var posts = [
        Post(title: "Post #1", imageName: "gear", body: "This is a picture of a gear.", date: "12/2/2024", user: "derek.stengel1", numberOfComments: "Comments: 10"),
        Post(title: "Post #2", imageName: "heart", body: "This is a picture of a heart.", date: "12/4/2024", user: "derek.stengel1", numberOfComments: "Comments: 2"),
        Post(title: "Post #3", imageName: "pencil", body: "This is a picture of a pencil.", date: "12/14/2023", user: "derek.stengel1", numberOfComments: "Comments: 6"),
        Post(title: "Post #4", imageName: "eraser", body: "This is an eraser.", date: "8/2/2023", user: "derek.stengel1", numberOfComments: "Comments: 9"),
        Post(title: "Post #5", imageName: "tray", body: "This is a tray", date: "4/26/2022", user: "derek.stengel1", numberOfComments: "Comments: 5"),
        Post(title: "Post #6", imageName: "folder", body: "This is a folder!", date: "2/2/2022", user: "derek.stengel1", numberOfComments: "Comments: 15"),
        Post(title: "Post #7", imageName: "trash", body: "This represents your sense of humor.", date: "8/16/2021", user: "derek.stengel1", numberOfComments: "Comments: 6"),
        Post(title: "Post #8", imageName: "lasso", body: "This is a lasso.", date: "2/20/2021", user: "derek.stengel1", numberOfComments: "Comments: 48"),
        Post(title: "Post #9", imageName: "scribble", body: "This a scribble I drew up!", date: "9/17/2020", user: "derek.stengel1", numberOfComments: "Comments: 38"),
        Post(title: "Post #10", imageName: "paperplane", body: "Happy New Year! Have a paper airplane.", date: "1/1/2020", user: "derek.stengel1", numberOfComments: "Comments: 12")
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        let post = posts[indexPath.row]
        customCell.configure(with: post)
        
        return customCell
    }
}

