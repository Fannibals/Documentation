//
//  Child2ViewController.swift
//  documentation
//
//  Created by Ethan  on 2/7/19.
//  Copyright © 2019 Ethan . All rights reserved.
//

import UIKit
import XLPagerTabStrip

class Child2ViewController: UIViewController, IndicatorInfoProvider {

    @IBOutlet weak var Label: UILabel!
    var childNumber: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 0.498996029, blue: 0.751634692, alpha: 1)
        self.Label.text = "Child 2222"
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
