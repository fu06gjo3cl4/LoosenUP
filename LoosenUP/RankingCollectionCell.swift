//
//  RankingCollectionCell.swift
//  LoosenUP
//
//  Created by 黃麒安 on 2017/3/16.
//  Copyright © 2017年 黃麒安. All rights reserved.
//

import UIKit

class RankingCollectionCell: UICollectionViewCell {
    
    
    @IBOutlet weak var view_container: UIView!
    @IBOutlet weak var image_no: UIImageView!
    
    var test:String = "0"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        UIViewService.addborder(view: self.view_container, color: Const.Main_Color.cgColor, height: 1.0)
        
    }

}
