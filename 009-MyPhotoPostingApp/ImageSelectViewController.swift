//
//  ImageSelectViewController.swift
//  009-MyPhotoPostingApp
//
//  Created by Takatoshi Miura on 2020/06/08.
//  Copyright © 2020 Takatoshi Miura. All rights reserved.
//
//  ＜概要＞
//  投稿タブでの処理をまとめたクラス。
//  画像をライブラリか、カメラから取得した後、投稿内容編集画面に遷移する。
//
//  ＜機能＞
//  ライブラリ画像選択機能
//      画像ライブラリへのアクセス許可を求めるダイアログを表示。
//      許可されたら画像ライブラリを表示。
//      画像を選択したら投稿内容編集画面に遷移。遷移時に選択した画像を渡す。
//  カメラ画像選択機能
//      カメラの使用許可を求めるダイアログを表示。
//      許可されたらカメラを起動。
//      撮影したら投稿内容編集画面に遷移。遷移時に撮影した画像を渡す。
//

import UIKit
import SVProgressHUD

class ImageSelectViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var selectImage:UIImage?   // 選択する画像を格納する変数
    
    // 「ライブラリ」ボタンの処理
    @IBAction func handleLibraryButton(_ sender: Any) {
        
        // ライブラリが利用可能か判定
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            print("ライブラリは利用可能です")
            // カメラを起動
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.delegate = self
            present(imagePickerController, animated: true, completion: nil)
        } else {
            print("ライブラリは利用できません")
            SVProgressHUD.showError(withStatus: "ライブラリにアクセスできません。アクセスを許可して下さい。")
        }
        
    }
    
    
    // 「カメラ」ボタンの処理
    @IBAction func handleCamaraButton(_ sender: Any) {

        // カメラが利用可能か判定
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("カメラは利用可能です")
            // カメラを起動
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .camera
            imagePickerController.delegate = self
            present(imagePickerController, animated: true, completion: nil)
        } else {
            print("カメラは利用できません")
            SVProgressHUD.showError(withStatus: "カメラを起動できません。カメラを許可して下さい。")
        }
        
    }
    
    
    // 「キャンセル」ボタンの処理
    @IBAction func handleCancelButton(_ sender: Any) {
    }
    
    
    // 画像選択時に呼ばれるメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 画像を投稿内容編集画面に渡す
        selectImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        // 投稿内容編集画面に遷移
        self.performSegue(withIdentifier: "goPostViewController", sender: nil)
        
    }
    
    
    // 画面遷移時に画像を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 投稿内容編集画面のインスタンスを作成し、画像を渡す
        if let nextViewController = segue.destination as? PostViewController {
            nextViewController.selectedImage = selectImage
        }
    }
    
    // 画像選択画面に戻ってくるときに呼び出される処理
    @IBAction func goToImageSelect(_segue:UIStoryboardSegue){
        SVProgressHUD.showSuccess(withStatus: "投稿をキャンセルしました")
    }
    
}
