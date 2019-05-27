//
//  Observe.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit
typealias observeBlock = () -> ()
class Observe: NSObject {
    var array = Array<observeBlock>()

    
    var v_text:String?
    func v_text(v:()->String?){
        
        v_text = v()
        sendObserveMsg()
    }
    
    var v_image:UIImage?
    func v_image(v:()->UIImage?){
        
        v_image = v()
        sendObserveMsg()
    }
    var v_blind:[String:Any]?
    func v_blind(v:()->[String:Any]?){
        
        v_blind = v()
        sendObserveMsg()
    }
    
    var v_if:Bool?
    func v_if(v:()->Bool?){
        
        v_if = v()
        sendObserveMsg()
    }
    

    
    var v_on:observeBlock?
    func v_on(ob:@escaping observeBlock){
        
        self.v_on = ob
        
    }
    
    var v_input:observeBlock?
    func v_input(ob:@escaping observeBlock){
        
        self.v_input = ob
        
    }
   
    
    typealias observeIndexBlock = (_ index:Int) -> ()
    var v_index:observeIndexBlock?
    func v_index(ob:@escaping observeIndexBlock){
        
        self.v_index = ob
        
    }
        
    
    var v_array:Array<Cat>?
    func v_array(_ isPage:Bool,v:()->Array<Cat>?){
        if isPage{
            if let arr = v(),let v_arr = v_array{
                
                v_array = v_arr + arr
            }else{
                v_array = v()
                
            }
            
        }else{
            
            v_array = v()

        }
        sendObserveMsg()
    }
    
   
   
    func setupObserve(_ callBack:@escaping observeBlock){
        
        array.append(callBack)
        
    }
    func sendObserveMsg(){
        
        for value in array{
            
            value()
        }
    }
   
}
