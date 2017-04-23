//
//  UIButtonService.swift
//  LoosenUP
//
//  Created by 黃麒安 on 2017/3/20.
//  Copyright © 2017年 黃麒安. All rights reserved.
//

import Foundation
import UIKit

class UIButtonService {
    
    static func SetBackgroundColor(button:UIButton,color:UIColor){
        //擴充UIColor，增加得到rgb數字的方法
        if #available(iOS 10.0, *) {
            button.backgroundColor = UIColor(displayP3Red: CGFloat(255.0/255.0), green: CGFloat(170.0/255.0), blue: CGFloat(0.0/0.0), alpha: 1.0)
        } else {
            button.backgroundColor = Const.Main_Color
        }
        
    }
    
    static func SetCornerRadius(button:UIButton,cornerRadius:CGFloat){
        button.layer.cornerRadius = cornerRadius
    }
    
    
}
