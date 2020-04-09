//
//  ViewController.swift
//  Camera
//
//  Created by 開発アカウント on 2020/04/08.
//  Copyright © 2020 開発アカウント. All rights reserved.
//

import UIKit

//ViewControllerクラスに必要なプロトコルを批准させる
class ViewController: UIViewController,UIImagePickerControllerDelegate,
                                       UINavigationControllerDelegate {

    //UIImageViewと接続
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //カメラボタンと接続
    @IBAction private func launchCameraButton(_ sender: UIBarButtonItem) {
        
        //画像の取得方法を定数cameraに代入（カメラを起動し、撮影した写真を取得）
        let camera = UIImagePickerController.SourceType.camera
        
        //カメラの無い端末でコードが実行されない様に確認
        if UIImagePickerController.isSourceTypeAvailable(camera) {
            let picker = UIImagePickerController()
            picker.sourceType = camera
            picker.delegate = self
            self.present(picker, animated: true)
        }
        
        //撮影後の処理
        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            self.imageView.image = image
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            self.dismiss(animated: true)
        }
    }
}

