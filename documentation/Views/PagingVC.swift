//
//  PagingVC.swift
//  documentation
//
//  Created by Ethan  on 2/7/19.
//  Copyright © 2019 Ethan . All rights reserved.
//

import UIKit
import XLPagerTabStrip

class PagingVC: ButtonBarPagerTabStripViewController {
    override func viewDidLoad() {
        setupButtonBar()
        super.viewDidLoad()
        
    }
    
    func setupButtonBar(){
        
        let buttonBarLayer = buttonBarView.layer
        buttonBarLayer.shadowColor = UIColor.black.cgColor
        buttonBarLayer.shadowOpacity = 0.1
        buttonBarLayer.shadowOffset = CGSize(width: 0, height: 4)
        buttonBarLayer.shadowRadius = 3
        buttonBarLayer.masksToBounds = false
        
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        
        settings.style.selectedBarHeight = 3
        settings.style.selectedBarBackgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController]{
        let child1VC = Child1ViewController();
        let child2VC = Child2ViewController();
        
        child1VC.childNumber = "One!!!!"
        child2VC.childNumber = "Two!!!!"
        
        return [child1VC, child2VC]
    }
}
