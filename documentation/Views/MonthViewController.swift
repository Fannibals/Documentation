//
//  MonthViewController.swift
//  documentation
//
//  Created by Ethan  on 28/6/19.
//  Copyright © 2019 Ethan . All rights reserved.
//

import UIKit

class MonthViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        // Do any additional setup after loading the view.
    }
    
    func setUpUI() {
        imageView.frame = CGRect(x: 100, y:100, width: 300, height: 100)
        self.view.addSubview(imageView)
        self.view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    }
    
    
    // lazy vars
    lazy var imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "icon_friends")
        return imgView
    }()
}
