//
//  PostTableViewCell.swift
//  009-MyPhotoPostingApp
//
//  Created by Takatoshi Miura on 2020/06/09.
//  Copyright © 2020 Takatoshi Miura. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {


    @IBOutlet weak var postImage: UIImageView!  // 投稿画像
    @IBOutlet weak var postComment: UILabel!    // 投稿コメント
    @IBOutlet weak var postTime: UILabel!       // 投稿日時
    
    
    // 「返信」ボタンの処理
    @IBAction func replyCommentButton(_ sender: Any) {
    }
    
    
    // セルに投稿内容を表示するメソッド
    func printPostData(_ postImage:UIImage,_ postComment:String) {
        
        // 画像とコメントを表示
        self.postImage.image  = postImage
        self.postComment.text = postComment
        
        // 現在時刻を取得して表示
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        self.postTime.text  = dateFormatter.string(from: now)
        
    }
    

}
