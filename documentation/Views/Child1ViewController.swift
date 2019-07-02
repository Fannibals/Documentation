//
//  Child1ViewController.swift
//  documentation
//
//  Created by Ethan  on 2/7/19.
//  Copyright © 2019 Ethan . All rights reserved.
//

import UIKit
import XLPagerTabStrip

class Child1ViewController: UIViewController, IndicatorInfoProvider {
    @IBOutlet weak var Label: UILabel!
    var childNumber:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        self.Label.text = "Child 1111"
        // Do any additional setup after loading the view.
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "\(childNumber)")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
