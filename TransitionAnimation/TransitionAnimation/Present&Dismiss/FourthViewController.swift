//
//  FourthViewController.swift
//  TransitionAnimation
//
//  Created by boco on 2017/12/19.
//  Copyright © 2017年 ZhangLe. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    var img: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Fourth VC"
        
        self.img = UIImageView.init()
        self.img?.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
        self.img?.image = UIImage.init(named: "android_icon")
        self.img?.isUserInteractionEnabled = true
        self.view.addSubview(self.img!)
        
        let tapGR = UITapGestureRecognizer.init(target: self, action: #selector(dismissAction))
        self.img?.addGestureRecognizer(tapGR)
    }
    
    @objc func dismissAction() {
        self.dismiss(animated: true, completion: nil)
    }

}
