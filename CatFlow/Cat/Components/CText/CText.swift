//
//  CText.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

open class CText: UITextView ,UITextViewDelegate{

    
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
        self.delegate = self

    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        self.ob?.v_text(v: { () -> String? in
            return self.text
        })
        
        block?(textView.text)

        self.ob?.v_input?()

    }
    
    
    //v-change
    typealias changeBlock = (_ text:String) ->()
    var block:changeBlock?
    func v_change(ob:@escaping changeBlock){
        
        block = ob
        self.delegate = self
        
    }
    
   

}
