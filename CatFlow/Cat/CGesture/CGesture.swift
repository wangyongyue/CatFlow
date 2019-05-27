//
//  CGesture.swift
//  CatFlow
//
//  Created by wangyongyue on 2019/5/26.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

typealias TapBlock = () -> ()
class CGesture: UITapGestureRecognizer {
    
    var tap:TapBlock?
   
    convenience init(_ block:@escaping TapBlock){
        self.init()
        tap = block
        self.addTarget(self, action: #selector(tapEvent))
    }
    
    var eventOb:Observe?
    convenience init(ob:Observe){
        self.init()
        eventOb = ob
        self.addTarget(self, action: #selector(tapEvent))
    }

    @objc func tapEvent(){
        tap?()
        eventOb?.v_on?()
        
    }
}
