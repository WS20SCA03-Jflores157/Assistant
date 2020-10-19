//
//  AssistantTabBarViewController.swift
//  Assistant
//
//  Created by Jeffrey  on 10/17/20.
//

import UIKit

class AssistantTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.standardAppearance.backgroundColor = UIColor.white
        
        let image = UIImage()
        tabBar.shadowImage = image
        tabBar.backgroundImage = image
        
    }
    
}
