//
//  IineViewController.swift
//  Instagram
//
//  Created by 須田　知弘 on 2020/06/18.
//  Copyright © 2020 tomohiro.suda. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class IineViewController: UIViewController {
    
  
    @IBOutlet weak var iineText: UITextField!
        

    var postData: PostData!
    var postArray: [PostData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景をタップしたらdismissKeyboardメソッドを呼ぶように設定する
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
        }
    @objc func dismissKeyboard(){
        // キーボードを閉じる
        view.endEditing(true)
    }
    
    // Do any additional setup after loading the view.
    
    // いいねボタンをタップしたときに呼ばれるメソッド
    @IBAction func iineButton(_ sender: Any) {
        


               // likesを更新する
               if let userName = Auth.auth().currentUser?.displayName {
                   // 更新データを作成する
                   var updateValue: FieldValue

//               // 今回いいねを押した場合は、名前とコメントを追加する更新データを作成
                let iineT = "\(userName) : \(iineText.text!)"
                updateValue = FieldValue.arrayUnion([iineT])
//                updateValue1 = FieldValue.arrayUnion([iineText.text])
                          
//                   }
                   // likesに更新データを書き込む
                   let postRef = Firestore.firestore().collection(Const.PostPath).document(postData.id)
                   postRef.updateData(["iines": updateValue])
//                postRef.updateData(["iineText": updateValue1])
                             
               }


        // 投稿処理が完了したので先頭画面に戻る
        UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    override func viewDidAppear(_ animated: Bool) {
        print(self.postData)
    }
    
}
