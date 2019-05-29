//
//  CButton.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

open class CButton: UIButton {

    //{{ msg }}
    public func v_text(ob:Observe){
        
        ob.setupObserve {
            self.setTitle(ob.v_text, for: .normal)
        }
        
    }
    //v-image
    public func v_image(ob:Observe){
        
        ob.setupObserve {
            self.setImage(ob.v_image, for: .normal)
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
    //v-on
    private var ob:Observe?
    public func v_on(ob:Observe){
        
        self.addTarget(self, action: #selector(clickEvent), for: .touchUpInside)
        self.ob = ob
        
    }
    @objc func clickEvent(){
        
        self.ob?.v_on?()

    }

    //v-click
    public var block:observeBlock?
    public func v_click(ob:@escaping observeBlock){
        
        self.addTarget(self, action: #selector(clickNewEvent), for: .touchUpInside)
        block = ob
        
    }
    @objc func clickNewEvent(){
        
        block?()
    }

}
