//
//  POPViewController.swift
//  documentation
//
//  Created by Ethan  on 3/7/19.
//  Copyright © 2019 Ethan . All rights reserved.
//

import UIKit
import SnapKit

var imgWidth:Double = 100.0
var imgHeight:Double = 100.0
var fieldWidth:Double = 300.0
var fieldHeight:Double = 60.0

extension UIView {
    func scale(){
        UIView.animate(withDuration: 0.5, animations: {
            self.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        }) { (_) in
            UIView.animate(withDuration: 0.5, animations: {
                self.transform = CGAffineTransform.identity
            })
        }
    }
}

class ScalableButton: UIButton {
//    func scale(){
//        UIView.animate(withDuration: 0.5, animations: {
//            self.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
//        }) { (_) in
//            UIView.animate(withDuration: 0.5, animations: {
//                self.transform = CGAffineTransform.identity
//            })
//        }
//    }
}

class BuzzableField: UITextField{
//    func buzz(){
//        UIView.animate(withDuration: 0.5) {
//            let midX = self.frame.origin.x + CGFloat(fieldWidth / 2.0)
//            let midY = self.frame.origin.y + CGFloat(fieldHeight / 2.0)
//
//            let animation = CABasicAnimation(keyPath: "position")
//            animation.duration = 0.06
//            animation.repeatCount = 4
//            animation.autoreverses = true
//            animation.fromValue = CGPoint(x: midX - 10, y: midY)
//            animation.toValue = CGPoint(x: midX + 10, y: midY)
//            self.layer.add(animation, forKey: "position")
//        }
//    }
}

protocol PopVCDelegate {
    func passData(data:String)
}

class POPViewController: UIViewController {
    
    var delegate: PopVCDelegate?
    typealias ClosureName = (String)->()
    var closure:ClosureName!
    
    convenience init() {
        print("pop vc init")
        self.init(nibName:nil, bundle:nil)
    }
    
    override func viewDidLoad() {
        print("pop vc viewdidload")
        super.viewDidLoad()
        setupUI()

    }
    
    // autolayout
    func setupUI(){
        // image view
        self.view.addSubview(self.ImageView)
        self.ImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-(2*imgHeight))
            make.centerX.equalToSuperview()
            make.height.equalTo(imgHeight)
            make.width.equalTo(imgWidth)
        }
        
        // passcodeTextField
        self.view.addSubview(self.passcodeTextField)
        self.passcodeTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.ImageView.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(fieldWidth)
            make.height.equalTo(fieldHeight)
        }
        
        // login button
        self.view.addSubview(self.loginBtn)
        self.loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.passcodeTextField.snp_bottom).offset(100)
            make.centerX.equalToSuperview()
            make.size.equalTo(self.passcodeTextField.snp_size)
        }
    }

    lazy var ImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "icon_app")
        // it is 0.0 due to
        print(imgView.frame.height)
        imgView.layer.cornerRadius = CGFloat(imgHeight / 2.0)
        // important to set clips to superview
        imgView.clipsToBounds = true
        return imgView
    }()
    
    lazy var passcodeTextField: BuzzableField = {
        let pass = BuzzableField()
        let placeholderStr:String = "please enter the code"
        // placeholder
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        let attributesDictionary:[NSAttributedString.Key : Any]  = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.paragraphStyle: style]
        pass.attributedPlaceholder = NSAttributedString(string: placeholderStr, attributes: attributesDictionary )
        pass.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        // text
        pass.textAlignment = NSTextAlignment.center
        return pass
    }()
    
    lazy var loginBtn: ScalableButton = {
        let btn = ScalableButton()
        // set title
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .highlighted)
        btn.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        btn.addTarget(self, action: #selector(didTapLoginBtn(_sender:)), for: .touchUpInside)
        return btn
    }()
    
    
    // callback func
    func callback(closure:@escaping ClosureName) {
        self.closure = closure
    }

    
    
    // PASS DATA Exercise
    @objc func didTapLoginBtn(_sender: UIButton) {
        // 1. passing data through delegate
        // we are using tabbar's vcs
//        let baseVC = self.tabBarController?.viewControllers?[1]
//        self.delegate = baseVC as? PopVCDelegate
//        delegate?.passData(data: self.passcodeTextField.text!)
        
        // 2. Notification
//        NotificationCenter.default.post(name: Notification.Name(rawValue: "changeValue"), object: nil, userInfo: ["labelTxt":self.passcodeTextField.text!])
        
        // 3. Singleton
//        let singleton = Singleton.singleton.share()
//        singleton.text = self.passcodeTextField.text!

        // 4. Using closure
        guard (self.closure != nil) else {return}
        closure(self.passcodeTextField.text!)
        
        // animation
        loginBtn.scale()
        passcodeTextField.scale()
    }

}
