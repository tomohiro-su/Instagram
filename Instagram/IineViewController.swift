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
    
    @IBOutlet weak var iineName: UITextField!
    
    @IBOutlet weak var iineText: UITextView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    
    var postData: PostData!
    var postArray: [PostData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景をタップしたらdismissKeyboardメソッドを呼ぶように設定する
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
        //     print(postData.name,postData.caption)
        // キャプションの表示
        self.textField.text = "\(postData.name!) : \(postData.caption!)"
    }
    @objc func dismissKeyboard(){
        // キーボードを閉じる
        view.endEditing(true)
    }
    
    // Do any additional setup after loading the view.
    
    // いいねボタンをタップしたときに呼ばれるメソッド
    @IBAction func iineButton(_ sender: Any) {
        
//         // タップされたセルのインデックスを求める
//               let touch = event.allTouches?.first
//               let point = touch!.location(in: self.tableView)
//               let indexPath = tableView.indexPathForRow(at: point)
//
//               // 配列からタップされたインデックスのデータを取り出す
//               let postData = postArray[indexPath!.row]
//
//               // likesを更新する
//               if let myid = Auth.auth().currentUser?.uid {
//                   // 更新データを作成する
//                   var updateValue: FieldValue
//                   if postData.isLiked {
//                       // すでにいいねをしている場合は、いいね解除のためmyidを取り除く更新データを作成
//                       updateValue = FieldValue.arrayRemove([myid])
//                   } else {
//                       // 今回新たにいいねを押した場合は、myidを追加する更新データを作成
//                       updateValue = FieldValue.arrayUnion([myid])
//                   }
//                   // likesに更新データを書き込む
//                   let postRef = Firestore.firestore().collection(Const.PostPath).document(postData.id)
//                   postRef.updateData(["likes": updateValue])
//               }
//
        
//        var updateValue: FieldValue!
//        let myid = Auth.auth().currentUser?.uid
//        updateValue = FieldValue.arrayUnion([iineName.text!])
//        //                             if postData.isLiked {
//        //                                 // すでにいいねをしている場合は、いいね解除のためmyidを取り除く更新データを作成
//        //                                 updateValue = FieldValue.arrayRemove([myid])
//        //                             } else {
//        //                                 // 今回新たにいいねを押した場合は、myidを追加する更新データを作成
//
//        //                             }
//        // 名前といいねデータの保存場所を定義する
//                var iname = iineName.text!
//        var iines = iineText.text!
//           let nameRef = Firestore.firestore().collection(Const.NamePath).document(postData.id)
//                nameRef.updateData(["iname": updateValue])
//        let iineRef = Firestore.firestore().collection(Const.IinePath).document(postData.id)
//         iineRef.updateData(["iines": updateValue])
//
//        //                             // likesに更新データを書き込む
//        var iname = iineName.text!
//        var iines = iineText.text!
//        let nameRef = Firestore.firestore().collection(Const.NamePath).document(postData.id)
//
//        let iineRef = Firestore.firestore().collection(Const.IinePath).document(postData.id)
//
        
        //                            let PostRef = Firestore.firestore().collection(Const.IinePath).document(postData.id)
        //                            postRef.updateData(["iines": updateValue])
        
        
        
        
        // 名前といいねデータの保存場所を定義する
        //   let postRef = Firestore.firestore().collection(Const.NamePath).document()
        //   let iineRef = Firestore.firestore().collection(Const.IinePath).document()
        // HUDで投稿処理中の表示を開始
        //SVProgressHUD.show()
        
        //        var ref: DatabaseReference!
        //        ref = Database.database().reference()
        //        self.ref.child("users").child(user.uid).setValue(["username": username])
        //
        
        // FireStoreに投稿データを保存する
        //        let postDic = [
        //            "iname": iineName.text!,
        //            "iines": iineText.text!,
        //            ] as [String : Any]
        //        postRef.setData(postDic)
        //        // HUDで投稿完了を表示する
        //        SVProgressHUD.showSuccess(withStatus: "投稿しました")
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
