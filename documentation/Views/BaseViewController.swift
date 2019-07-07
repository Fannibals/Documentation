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
    
    convenience init() {
        print("pop vc init")
        self.init(nibName:nil, bundle:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basicUI()
        notification()
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
        
//        self.label.text = Singleton.singleton.share().text
        let popVC:POPViewController = self.tabBarController?.viewControllers?[3] as! POPViewController
        popVC.callback { (string) in
            self.label.text = string
        }
    }
    
    func notification() {
//        NotificationCenter.default.addObserver(self, selector: #selector(changeLabel), name: NSNotification.Name(rawValue: "changeValue"), object: nil)
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "changeValue"), object: nil, queue: OperationQueue.main, using: { (Notification) in
            self.changeLabel(data: Notification.userInfo?["labelTxt"] as! String)
        })
    }
    
    lazy var label: UILabel = {
        print("label view")
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return label
    }()
    
    lazy var imageView2: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "download")
        return imgView
    }()
    
    // the data cannot pass in until the vc has been initialized
    @objc func changeLabel(data:String){
        self.label.text = data
    }

}

extension BaseViewController: PopVCDelegate {
    func passData(data: String) {
        self.label.text = data
    }
}
