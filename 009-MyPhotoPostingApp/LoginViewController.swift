//
//  LoginViewController.swift
//  009-MyPhotoPostingApp
//
//  Created by Takatoshi Miura on 2020/06/06.
//  Copyright © 2020 Takatoshi Miura. All rights reserved.
//
//  ＜概要＞
//  アカウントがない場合はアカウントを作成し、アカウントがある場合はログインができる。
//  アカウントの登録情報はFirebaseの"Cloud Firestore"に保存される。
//
//  ＜機能＞
//  アカウント作成機能
//      入力されたメールアドレスがデータベースに存在しなければ、アカウントが作成される。
//      すでにアカウントが存在している場合は、ダイアログでその旨を通知する。
//  ログイン機能
//      入力されたメールアドレス、パスワードの組み合わせがデータベースに存在すれば、タブ画面に遷移。
//      存在しなければ、入力ミスか、アカウント作成を促すメッセージをダイアログで通知。
//


import UIKit
import Firebase

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // テキストフィールド
    @IBOutlet weak var textFieldMailAddress: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldAccountName: UITextField!
    
    //「ログイン」ボタンの処理
    @IBAction func loginButton(_ sender: Any) {
    }
    
    
    //「アカウント作成」ボタンの処理
    @IBAction func createAccountButton(_ sender: Any) {
    }
    
}
