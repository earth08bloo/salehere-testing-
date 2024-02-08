//
//  ProfileViewController.swift
//  SaleHereTesting
//
//  Created by admin on 8/2/2567 BE.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        NotificationRepository.shared.resetTotalCount()
        if let tabBarItem4 = self.tabBarController?.tabBar.items?[3] {
            tabBarItem4.badgeValue = nil
            
        }
    }


}
