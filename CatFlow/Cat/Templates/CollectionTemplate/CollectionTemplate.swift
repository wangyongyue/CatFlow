//
//  CollectionTemplate.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class CollectionTemplate: UICollectionViewCell {
    
    var v_SelectOb:Observe?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func setModel(_ amodel:Cat){}
   
}
