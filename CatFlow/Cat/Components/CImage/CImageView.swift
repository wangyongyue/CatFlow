//
//  CImage.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

open class CImageView: UIImageView {

    //v-image
    public func v_image(ob:Observe){
        
        ob.setupObserve {
            self.image = ob.v_image
        }
        
    }
    //v-bind
    public func v_bind(ob:Observe){
        ob.setupObserve {
            
            if let dic = ob.v_blind{
                self.setValuesForKeys(dic)
            }
        }
        
    }
    //v-if
    public func v_if(ob:Observe){
        
        ob.setupObserve {
            
            if let v = ob.v_if{
                self.isHidden = v
            }
        }
        
    }
}
