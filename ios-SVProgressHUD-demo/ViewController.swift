//
//  ViewController.swift
//  ios-SVProgressHUD-demo
//
//  Created by Kentaro on 2017/03/09.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit
import SVProgressHUD

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addObservers()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: アクション

    /*
     インジケータ
     */
    @IBAction private func didTapShowIndicator(_ sender: UIButton) {

        // インジケータのみのHUDを表示する
//        SVProgressHUD.show()

        // 文字付きのHUDを表示する
        SVProgressHUD.show(withStatus: "表示する文字列")

        // HUDを消去する（すぐ消す）
//        SVProgressHUD.dismiss()

        // 即時消去後に何かする
//        SVProgressHUD.dismiss(completion: {
//            print("HUDを消しました")
//        })

        // 3秒後に消す
//        SVProgressHUD.dismiss(withDelay: 3.0)

        // 3秒後に消した後に何かする
        SVProgressHUD.dismiss(withDelay: 3.0,
                              completion: {
                                print("HUDを消しました")
        })
    }
    
    /*
     ポップアップ
     */
    @IBAction func didTapShowPopup(_ sender: UIButton) {

        /*
         スタイル（SVProgressHUDStyle）
         */
        // （デフォルト）light
        SVProgressHUD.setDefaultStyle(.light)

        // dark
//        SVProgressHUD.setDefaultStyle(.dark)

        // カスタム
//        SVProgressHUD.setDefaultStyle(.custom)
//        SVProgressHUD.setForegroundColor(UIColor.yellow)
//        SVProgressHUD.setBackgroundColor(UIColor.blue)

        /*
         マスク
         */
        SVProgressHUD.setDefaultMaskType(.black)
//        SVProgressHUD.setDefaultMaskType(.clear)
//        SVProgressHUD.setDefaultMaskType(.custom)
//        SVProgressHUD.setDefaultMaskType(.gradient)
//        SVProgressHUD.setDefaultMaskType(.none)

        /*
         表示するポップアップ
         */
        // Info
        SVProgressHUD.showInfo(withStatus: "表示する文字列")

        // Success
//        SVProgressHUD.showSuccess(withStatus: "表示する文字列")

        // Error
//        SVProgressHUD.showError(withStatus: "表示する文字列")
    }
    
    // OBjective-Cで作った画面に遷移する
    @IBAction func didTapTransition(_ sender: UIButton) {
        guard let vc = UIStoryboard(name: "ObjCViewController", bundle: nil).instantiateInitialViewController() else { return }
        present(vc, animated: true)
    }

    // MARK: - 通知

    private func addObservers() {

        // 表示直前
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(willAppearNotification),
                                               name: .SVProgressHUDWillAppear,
                                               object: nil)

        // 表示直後
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didAppearNotification),
                                               name: .SVProgressHUDDidAppear,
                                               object: nil)

        // 消去直前
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(willDisappearNotification),
                                               name: .SVProgressHUDWillDisappear,
                                               object: nil)
        // 消去直後
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didDisappearNotification),
                                               name: .SVProgressHUDDidDisappear,
                                               object: nil)
    }

    @objc private func willAppearNotification() {
        print("willAppearNotification")
    }

    @objc private func didAppearNotification() {
        print("didAppearNotification")
    }

    @objc private func willDisappearNotification() {
        print("willDisappearNotification")
    }

    @objc private func didDisappearNotification() {
        print("didDisappearNotification")
    }
}

