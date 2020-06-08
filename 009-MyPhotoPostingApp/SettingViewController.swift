//
//  SettingViewController.swift
//  009-MyPhotoPostingApp
//
//  Created by Takatoshi Miura on 2020/06/08.
//  Copyright © 2020 Takatoshi Miura. All rights reserved.
//
//  ＜概要＞
//  設定タブでの処理をまとめたクラス。ログアウトと、アカウント名の変更ができる。
//
//  ＜機能＞
//  ログアウト機能
//      「ログアウト」ボタンタップでログアウトし、ログイン画面に遷移。
//      なお、ログアウトしたことを通知する。
//  アカウント名変更
//      テキストフィールドの入力名をアカウント名に適用する。
//      なお、アカウント名を変更したことを通知する。
//


import UIKit
import FirebaseAuth
import SVProgressHUD

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // テキストフィールド
    @IBOutlet weak var textFieldAccountName: UITextField!
    
    // 「表示名変更」ボタンの処理
    @IBAction func changeAccountNameButton(_ sender: Any) {
    }
    
    
    // 「ログアウト」ボタンの処理
    @IBAction func logoutButton(_ sender: Any) {
        // ログアウト処理
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            SVProgressHUD.showSuccess(withStatus: "ログアウトしました。")
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
            SVProgressHUD.showError(withStatus: "ログアウトに失敗しました。")
        }
    }
    
}
