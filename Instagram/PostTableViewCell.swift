//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by 須田　知弘 on 2020/06/17.
//  Copyright © 2020 tomohiro.suda. All rights reserved.
//

import UIKit
import FirebaseUI

class PostTableViewCell: UITableViewCell,UITableViewDelegate  {
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var iineButton: UIButton!
    
    @IBOutlet weak var iineData:  UILabel!
    
  //  @IBOutlet weak var iineTableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        iineTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")        // Configure the view for the selected state
    }
    // PostDataの内容をセルに表示
    func setPostData(_ postData: PostData) {
        // 画像の表示
        postImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        let imageRef = Storage.storage().reference().child(Const.ImagePath).child(postData.id + ".jpg")
        postImageView.sd_setImage(with: imageRef)
        
        // キャプションの表示
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        
        // 日時の表示
        self.dateLabel.text = ""
        if let date = postData.date {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateString = formatter.string(from: date)
            self.dateLabel.text = dateString
        }
        
        // いいね数の表示
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        // いいねボタンの表示
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: .normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: .normal)
        }
        
//        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return 2
//        }
        self.iineData.text = ""
       
       // for i in 0...postData.iines.count{
        self.iineData.text = "\(postData.iines) : \(postData.iineText)"
       // }
//        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
//            let cell = tableView.dequeueReusableCell(withIdentifier : "Cell", for: indexPath) as! UITableViewCell
//            cell.textLabel?.text = String(indexPath.row)
//            return cell
//        }
//
    }
}
