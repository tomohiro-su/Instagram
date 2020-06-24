//
//  PostData.swift
//  Instagram
//
//  Created by 須田　知弘 on 2020/06/17.
//  Copyright © 2020 tomohiro.suda. All rights reserved.
//

import UIKit
import Firebase

class PostData: NSObject {
    var id: String
    var name: String?
    var caption: String?
    var date: Date?
    var likes: [String] = []
    var isLiked: Bool = false
    var iineText:  [String] = []
    var iines:  [String] = [] //コメント
    var isIine: Bool = false
    var iineNumber: Int = 0
    var iNumber: Int = 0
    
    init(document: QueryDocumentSnapshot) {
        self.id = document.documentID
        
        let postDic = document.data()
        
        self.name = postDic["name"] as? String
        
        self.caption = postDic["caption"] as? String
        
        let timestamp = postDic["date"] as? Timestamp
        self.date = timestamp?.dateValue()
        
        if let likes = postDic["likes"] as? [String] {
            self.likes = likes
        }
        if let myid = Auth.auth().currentUser?.uid {
            // likesの配列の中にmyidが含まれているかチェックすることで、自分がいいねを押しているかを判断
            if self.likes.firstIndex(of: myid) != nil {
                // myidがあれば、いいねを押していると認識する。
                self.isLiked = true
            }
        }
        
        //iineの配列
        if let iines = postDic["iines"] as? [String] {
            self.iines = iines
        }
        if let iineText = postDic["iineText"] as? [String] {
            self.iineText = iineText
            
        }
     
    }

}
