//
//  CalendarViewController.swift
//  documentation
//
//  Created by Ethan  on 28/6/19.
//  Copyright © 2019 Ethan . All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {
    
    enum calendarTypes {
        case week
        case month
    }
    var weekViewToTop:Double = 200
    var seperateLineHeight:Double = 5
    // life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI(){
        self.view.addSubview(self.seperateLine)
    }
    
    lazy var seperateLine: UIView = {
        let width = self.view.bounds.width
        let line = UIView()
        line.frame = CGRect(x: 0, y: weekViewToTop-seperateLineHeight, width:Double(width), height: seperateLineHeight)
        line.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return line
    }()
    
    lazy var weekView: WeekViewController = {
        let view = WeekViewController()
        return view
    }()
    
    lazy var monthView: MonthViewController = {
        let view = MonthViewController()
        return view
    }()
    
}
