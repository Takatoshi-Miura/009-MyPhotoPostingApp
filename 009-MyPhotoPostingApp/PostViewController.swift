//
//  PostViewController.swift
//  009-MyPhotoPostingApp
//
//  Created by Takatoshi Miura on 2020/06/08.
//  Copyright © 2020 Takatoshi Miura. All rights reserved.
//
//  ＜概要＞
//  投稿内容編集画面での処理をまとめたクラス。
//  選択した画像と、テキストフィールドに入力したコメントをセットで投稿する。
//
//  ＜機能＞
//  投稿機能
//      選択した画像とコメントをホーム画面に渡し、以下の情報をCloud Firestoreに保存する。
//      投稿画像、投稿コメント、
//
//  投稿キャンセル機能
//      選択した画像、記入したコメントを消去し、投稿画面に戻る。
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 画像選択画面で選択された画像を表示
        postImage.image = selectedImage
    }
    
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postTextField: UITextField!
    
    var selectedImage:UIImage?   // 画像選択画面にて選択した画像を格納する変数
    
    // 「投稿」ボタンの処理
    @IBAction func postButton(_ sender: Any) {
        
        // 投稿内容を格納する
        let postComment:String = postTextField.text!
        let postData = PostData((selectedImage ?? UIImage(systemName: "questionmark"))!,postComment )
        
        // Cloud Firestoreに投稿データを保存する
        postData.savePostData()
    }
    
    // 「キャンセル」ボタンの処理
    @IBAction func canselButton(_ sender: Any) {
        // 投稿画面に遷移
    }
    
    
    


}
