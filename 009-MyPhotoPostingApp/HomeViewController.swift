//
//  HomeViewController.swift
//  009-MyPhotoPostingApp
//
//  Created by Takatoshi Miura on 2020/06/12.
//  Copyright © 2020 Takatoshi Miura. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBOutlet var postTableView: UITableView!
    
    // 遷移元からの受け取り用
    var postImage:UIImage?
    var postComment:String = ""
    
    
    //PostDataを格納した配列
    var postDataArray = [PostTableViewCell]()
    
    
    // PostDataArray配列の長さ(項目の数)を返却する
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postDataArray.count
    }
    
    //テーブルの行ごとのセルを返却する
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Storyboardで指定したtodoCell識別子を利用して再利用可能なセルを取得する
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath)

        return cell
    }
    

}
