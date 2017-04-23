//
//  SubViewController1.swift
//  LoosenUP
//
//  Created by 黃麒安 on 2017/3/6.
//  Copyright © 2017年 黃麒安. All rights reserved.
//

import UIKit
import FSPagerView
import SnapKit

class MainViewController: UIViewController {
    
    fileprivate let sectionTitles = ["Configurations", "Item Size", "Interitem Spacing"]
    fileprivate let configurationTitles = ["Automatic sliding","Infinite"]
    fileprivate let imageNames = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg"]
    
    var times_viewDidLayoutSubviews:Int = 0
    
    //介面連結區
    @IBOutlet weak var scrolview: UIScrollView!
    @IBOutlet weak var subview_detect: UIView!{
        didSet{
            
        }
    }
    @IBOutlet weak var effect_container: UIView!{
        didSet{
            
        }
    }
    @IBOutlet weak var effect_collectionView: EffectCollectionView!{
        didSet{
            let rankCell = UINib(nibName: "RankingCollectionCell", bundle: nil)
            self.effect_collectionView.register(rankCell, forCellWithReuseIdentifier: "RankingCollectionCell")
            self.effect_collectionView.dataSource = self.effect_collectionView
            self.effect_collectionView.delegate = self.effect_collectionView
        }
    }
    
    
    @IBOutlet weak var popularity_Container: UIView!
    
    @IBOutlet weak var populartity_collectionView: PopularityCollectionView!{
        didSet{
            let rankCell = UINib(nibName: "RankingCollectionCell", bundle: nil)
            self.populartity_collectionView.register(rankCell, forCellWithReuseIdentifier: "PopularityCollectionCell")
            self.populartity_collectionView.dataSource = self.populartity_collectionView
            self.populartity_collectionView.delegate = self.populartity_collectionView
        }
    }
    
    
    @IBOutlet weak var subview_effect_ranking: UIView!
    @IBOutlet weak var subview_popularity_ranking: UIView!
    @IBOutlet weak var btn_Tired: UIButton!{
        didSet{
            UIButtonService.SetBackgroundColor(button: btn_Tired,color: Const.Main_Color)
            UIButtonService.SetCornerRadius(button: btn_Tired,cornerRadius: 5.0)
            UIViewService.addborder(view: btn_Tired, color: UIColor.black.cgColor, height: 1.0)
            UIViewService.addShadow(view: btn_Tired, color: UIColor.black.cgColor, width: 1.0, height:1.0,radius:5.0,opacity: 0.5)
        }
    }
    @IBOutlet weak var btn_Relax: UIButton!{
        didSet{
            UIButtonService.SetBackgroundColor(button: btn_Relax,color: Const.Main_Color)
            UIButtonService.SetCornerRadius(button: btn_Relax,cornerRadius: 5.0)
            UIViewService.addborder(view: btn_Relax, color: UIColor.black.cgColor, height: 1.0)
            UIViewService.addShadow(view: btn_Relax, color: UIColor.black.cgColor, width: 1.0, height:1.0,radius:5.0,opacity: 0.5)
        }
    }
    //介面事件連結
    @IBAction func btn_Tired_Detect(_ sender: Any) {
        print("to tired detect")
        
        let viewcontroller = SelectSituationViewController()
        viewcontroller.title = "情境選擇"
        self.navigationController?.pushViewController(viewcontroller, animated: true)
        
    }
    @IBAction func btn_Relax_Detect(_ sender: Any) {
        print("to relax detect")
    }
    
    @IBOutlet weak var FS_PagerView: FSPagerView!{
        didSet {
            self.FS_PagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
//            self.FS_PagerView.itemSize = self.FS_PagerView.frame.size.applying(CGAffineTransform(scaleX: 0.99, y: 0.99))
            self.FS_PagerView.interitemSpacing = 5.0
            self.FS_PagerView.automaticSlidingInterval = 3.0
            self.FS_PagerView.isInfinite = true
            self.FS_PagerView.transformer = FSPagerViewTransformer(type: .overlap)
            
        }
    }
    @IBOutlet weak var FS_PageControl: FSPageControl!{
        didSet {
            self.FS_PageControl.numberOfPages = self.imageNames.count
            self.FS_PageControl.contentHorizontalAlignment = .left
            self.FS_PageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
    }
    
    //畫面切換
    func pushViewController(title:String,viewcontroller:UIViewController){
        viewcontroller.title = title
        self.navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
    func swipe_tabs_left(){
        print("left")
        HomeTabBarController.swipe_tabs_left()
    }
    
    func swipe_tabs_right(){
        print("right")
        HomeTabBarController.swipe_tabs_right()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 加入左滑根右滑手勢
        let swipe_left = UISwipeGestureRecognizer(target: self, action: #selector(MainViewController.swipe_tabs_left))
        swipe_left.direction = .left
        self.view.addGestureRecognizer(swipe_left)
        
        let swipe_right = UISwipeGestureRecognizer(target: self, action: #selector(MainViewController.swipe_tabs_right))
        swipe_right.direction = .right
        self.view.addGestureRecognizer(swipe_right)
        
        
        
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("view did layoutSubviews width: ")
        print(self.effect_container.frame.width)
        print(self.effect_container.frame.height)
        print(Const.Screen_Width)
        
        times_viewDidLayoutSubviews = times_viewDidLayoutSubviews+1
        if(times_viewDidLayoutSubviews == 2){
            // 加入上邊界與下邊界   (加在viewdidload無法正確呈現)
            UIViewService.addtopborder(view: self.effect_container, color: UIColor.black.cgColor, height: 3.0)
            UIViewService.addbottomborder(view: self.effect_container, color: UIColor.black.cgColor, height: 3.0)
            
            UIViewService.addtopborder(view: self.popularity_Container, color: UIColor.black.cgColor, height: 3.0)
            UIViewService.addbottomborder(view: self.popularity_Container, color: UIColor.black.cgColor, height: 3.0)
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
//        print("view did appear width: ")
//        print(self.effect_container.frame.width)
//        print(self.effect_container.frame.height)
//        print(Const.Screen_Width)
        
        // 加入上邊界與下邊界   (加在viewdidload無法正確呈現)
//        UIViewService.addtopborder(view: self.effect_container, color: UIColor.black.cgColor, height: 3.0)
//        UIViewService.addbottomborder(view: self.effect_container, color: UIColor.black.cgColor, height: 3.0)
//        
//        UIViewService.addtopborder(view: self.popularity_Container, color: UIColor.black.cgColor, height: 3.0)
//        UIViewService.addbottomborder(view: self.popularity_Container, color: UIColor.black.cgColor, height: 3.0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
extension MainViewController: FSPagerViewDelegate,FSPagerViewDataSource{
    
    // MARK:- FSPagerView DataSource
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.imageNames.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
//            cell.imageView?.image = UIImage(named: "icon" + String(index+1))
//            cell.textLabel?.text = "第" + String(index+1) + "張"
        cell.imageView?.image = UIImage(named: self.imageNames[index])
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
        cell.textLabel?.text = index.description+index.description
        return cell
    }
    
    
    // MARK:- FSPagerView Delegate
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        FS_PagerView.deselectItem(at: index, animated: true)
        FS_PagerView.scrollToItem(at: index, animated: true)
        self.FS_PageControl.currentPage = index
    }
    
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
        guard self.FS_PageControl.currentPage != pagerView.currentIndex else {
            return
        }
        self.FS_PageControl.currentPage = pagerView.currentIndex // Or Use KVO with property "currentIndex"
    }
    
}


