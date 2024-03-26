//
//  MyTableViewCell.swift
//  YearLongProject
//
//  Created by Derek Stengel on 3/25/24.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    static let identifier = "MyTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyTableViewCell", bundle: nil)
    }
    
    public func configure(with post: Post) {
        myImageView.image = UIImage(systemName: post.imageName)
        postTitle.text = post.title
        bodyText.text = post.body
        date.text = post.date
        user.text = post.user
        comments.text = post.numberOfComments
    }
    
    @IBOutlet var myImageView: UIImageView!
    @IBOutlet var postTitle: UILabel!
    @IBOutlet var bodyText: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var user: UILabel!
    @IBOutlet var comments: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        myImageView.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


