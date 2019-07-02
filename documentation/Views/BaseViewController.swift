//
//  ViewController.swift
//  documentation
//
//  Created by Ethan  on 20/6/19.
//  Copyright © 2019 Ethan . All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basicUI()
        // Do any additional setup after loading the view.
    }
    
    func basicUI() {
        imageView.image = UIImage(named: "icon_friends")
        imageView2.frame = CGRect(x: 100, y:100, width: 100, height: 100)
        self.view.addSubview(imageView2)
    }
    
    lazy var imageView2: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "download")
        return imgView
    }()


}

