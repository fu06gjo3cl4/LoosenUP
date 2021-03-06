//
//  ManageViewController.swift
//  LoosenUP
//
//  Created by 黃麒安 on 2017/3/6.
//  Copyright © 2017年 黃麒安. All rights reserved.
//

import UIKit

class ManageViewController: UIViewController {
    
    @IBOutlet weak var view_AccountManage: UIView!
    
    @IBOutlet weak var view_personalManage: UIView!
    
    @IBOutlet weak var view_logout: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationService.setedgefor_navigationbar(viewcontroller: self)
        
        let swipe_left = UISwipeGestureRecognizer(target: self, action: #selector(ManageViewController.swipe_tabs_left))
        swipe_left.direction = .left
        self.view.addGestureRecognizer(swipe_left)
        
        let swipe_right = UISwipeGestureRecognizer(target: self, action: #selector(ManageViewController.swipe_tabs_right))
        swipe_right.direction = .right
        self.view.addGestureRecognizer(swipe_right)
        
        
        let tap_account = UITapGestureRecognizer(target: self, action: #selector(self.toAccountManage))
        self.view_AccountManage.addGestureRecognizer(tap_account)
        
        let tap_personalmanage = UITapGestureRecognizer(target: self, action: #selector(self.toPersonalManage))
        self.view_personalManage.addGestureRecognizer(tap_personalmanage)
        
        let tap_logout = UITapGestureRecognizer(target: self, action: #selector(self.logout))
        self.view_logout.addGestureRecognizer(tap_logout)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func toAccountManage(){
        print("to account manage")
        
        let viewcontroller = AccountManageViewController()
        viewcontroller.title = "帳戶管理"
        self.navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
    func toPersonalManage(){
        print("to personal manage")
        
        let viewcontroller = PersonalManageViewController()
        viewcontroller.title = "個人化管理"
        self.navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
    func logout(){
        print("logout")
    }

    func swipe_tabs_left(){
        print("left")
        HomeTabBarController.swipe_tabs_left()
        //        rootvc?.tabBarController?.selectedIndex = (rootvc?.tabBarController?.selectedIndex)!-1
        //    [rootVC.tabBarController setSelectedIndex:selectedIndex + 1];
    }
    
    func swipe_tabs_right(){
        print("right")
        HomeTabBarController.swipe_tabs_right()
        //        rootvc?.tabBarController?.selectedIndex = (rootvc?.tabBarController?.selectedIndex)!-1
    }
}
