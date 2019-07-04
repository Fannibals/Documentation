//
//  BaseViewController.swift
//  documentation
//
//  Created by Ethan  on 20/6/19.
//  Copyright © 2019 Ethan . All rights reserved.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var Label: UILabel!
    
    var labelStr = "123"
    
    convenience init() {
        print("pop vc init")
        self.init(nibName:nil, bundle:nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(self.label.text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basicUI()
        
        // Do any additional setup after loading the view.
    }
    
    func basicUI() {
        imageView.image = UIImage(named: "icon_friends")
        imageView2.frame = CGRect(x: 100, y:100, width: 100, height: 100)
        self.view.addSubview(imageView2)
        self.Label.textAlignment = .center
        self.Label.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.Label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        self.view.addSubview(self.label)
        self.label.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-200)
            make.width.equalTo(200)
            make.height.equalTo(60)
        }
    }
    
    func notification() {
        NotificationCenter.default.addObserver(self, selector: #selector(changeLabel), name: NSNotification.Name(rawValue: "changeLabel"), object: nil)
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = labelStr
        label.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return label
    }()
    
    lazy var imageView2: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "download")
        return imgView
    }()
    
    @objc func changeLabel(){
        DispatchQueue.main.async {
            self.labelStr = "333"
        }
    }

}

extension BaseViewController: PopVCDelegate {
    func passData(data: String) {
        self.label.text = data
    }
}
