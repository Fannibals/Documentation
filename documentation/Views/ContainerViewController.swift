//
//  ContainerViewController.swift
//  documentation
//
//  Created by Ethan  on 2/7/19.
//  Copyright © 2019 Ethan . All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let nav = UINavigationController()
        nav.viewControllers = [PagingVC()]
        present(nav, animated: true, completion: nil)
        // Do any additional setup after loading the view.
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
