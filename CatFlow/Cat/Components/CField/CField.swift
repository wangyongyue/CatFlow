//
//  CField.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

open class CField: UITextField {

    //{{ msg }}
    func v_text(ob:Observe){
        
        ob.setupObserve {
            self.text = ob.v_text
        }
        
    }
    //v-bind
    func v_bind(ob:Observe){
        ob.setupObserve {
            
            if let dic = ob.v_blind{
                self.setValuesForKeys(dic)
            }
            
        }
        
    }
    //v-if
    func v_if(ob:Observe){
        
        ob.setupObserve {
            
            if let v = ob.v_if{
                self.isHidden = v
            }
        }
        
    }
    //v-input
    private var ob:Observe?
    func v_input(ob:Observe){
        
        self.ob = ob
        self.addTarget(self, action: #selector(changeText), for: .editingChanged)
        
    }
    @objc func changeText(){
        
        self.ob?.v_text(v: { () -> String? in
            return self.text
        })
        
        self.ob?.v_input?()
    }
    
    //v-change
    var block:observeBlock?
    func v_change(ob:@escaping observeBlock){
        
        block = ob
        self.addTarget(self, action: #selector(changeNewText), for: .editingChanged)
        
    }
    @objc func changeNewText(){
        
        block?()
    }

}
