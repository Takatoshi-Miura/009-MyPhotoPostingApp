//
//  LoginViewController.swift
//  009-MyPhotoPostingApp
//
//  Created by Takatoshi Miura on 2020/06/06.
//  Copyright © 2020 Takatoshi Miura. All rights reserved.
//
//  ＜概要＞
//  アカウントがない場合はアカウントを作成し、アカウントがある場合はログインができる。
//  アカウントの登録情報はFirebaseの"Authentication"に保存される。
//
//  ＜機能＞
//  アカウント作成機能
//      入力されたメールアドレスがデータベースに存在しなければ、アカウントが作成される。
//      すでにアカウントが存在している場合は、その旨を通知する。
//  ログイン機能
//      入力されたメールアドレス、パスワードの組み合わせがデータベースに存在すれば、タブ画面に遷移。
//      存在しなければ、入力の誤りがないか確認を促すメッセージを通知。
//


import UIKit
import Firebase
import FirebaseAuth
import SVProgressHUD


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
        
        if let address = textFieldMailAddress.text, let password = textFieldPassword.text {

            // アドレスとパスワード名のいずれかでも入力されていない時は何もしない
            if address.isEmpty || password.isEmpty {
                SVProgressHUD.showError(withStatus: "必要項目を入力して下さい")
                return
            }

            // HUDで処理中を表示
            SVProgressHUD.show()

            // ログイン処理
            // アドレスとパスワードの組み合わせが一致しなければログインに失敗する
            Auth.auth().signIn(withEmail: address, password: password) { authResult, error in
                if let error = error {
                    print("DEBUG_PRINT: " + error.localizedDescription)
                    SVProgressHUD.showError(withStatus: "ログインに失敗しました。入力を確認して下さい。")
                    return
                }
                SVProgressHUD.showError(withStatus: "ログインしました。")

                // タブ画面に遷移
                self.performSegue(withIdentifier: "goTabBarController", sender: nil)
                
            }
        }
    }
    
    
    //「アカウント作成」ボタンの処理
    @IBAction func createAccountButton(_ sender: Any) {
        // アドレス,パスワード名,アカウント名の入力を確認
        if let address = textFieldMailAddress.text, let password = textFieldPassword.text, let accountName = textFieldAccountName.text {
            
            // アドレス,パスワード名,アカウント名のいずれかでも入力されていない時は何もしない
            if address.isEmpty || password.isEmpty || accountName.isEmpty {
                SVProgressHUD.showError(withStatus: "必要項目を入力して下さい")
                return
            }
            
            // アカウント作成処理
            // 入力されたアドレスのアカウントが存在する場合は、アカウント作成に失敗する
            Auth.auth().createUser(withEmail: textFieldMailAddress.text!, password: textFieldPassword.text!) { authResult, error in
                if let error = error {
                    print("DEBUG_PRINT: " + error.localizedDescription)
                    SVProgressHUD.showError(withStatus: "アカウントの作成に失敗しました。")
                    return
                }
                SVProgressHUD.showError(withStatus: "アカウントを作成しました。")
                
                // タブ画面に遷移
                self.performSegue(withIdentifier: "goTabBarController", sender: nil)
                
            }
        }
    }
    
}
