//
//  WeekViewController.swift
//  documentation
//
//  Created by Ethan  on 28/6/19.
//  Copyright © 2019 Ethan . All rights reserved.
//

import UIKit

class WeekViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        // Do any additional setup after loading the view.
    }
    
    func setUpUI() {
        imageView2.frame = CGRect(x: 100, y:100, width: 300, height: 100)
        self.view.addSubview(imageView2)
        self.view.backgroundColor = #colorLiteral(red: 1, green: 0.498996029, blue: 0.751634692, alpha: 1)
    }
    
    
    // lazy vars
    lazy var imageView2: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "download")
        return imgView
    }()
}
