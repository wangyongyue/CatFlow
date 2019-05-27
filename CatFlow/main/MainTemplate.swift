//
//  MainTemplate.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class MainTemplate: TableTemplate {


    var holder = MainHolder()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let label = CLabel()
        self.contentView.addSubview(label)
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 10)
        label.frame = CGRect.init(x: 20, y: 0, width:Screen.width()/2 - 20, height: 30)
        
        let button = CButton()
        button.setTitle("点赞", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        self.contentView.addSubview(button)
        button.frame = CGRect.init(x: Screen.width()/2, y: 0, width: Screen.width()/2 - 20, height: 30)

        label.v_text(ob: holder.ob)
        button.v_on(ob: holder.clickOb)
        
        self.v_SelectOb = holder.defaultOb
        
        let g = CGesture.init(ob: holder.tapOb)
        self.contentView.addGestureRecognizer(g)
                
    }
   
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    override func setModel(_ amodel: Cat) {
        super.setModel(amodel)
        
        holder.setModel(amodel)
    }


}


class MainModel: Cat {


    override init() {
        super.init()
        v_palm = "MainTemplate"
    }

    var name:String?

}
class MainHolder: Holder {
    var ob = Observe()
    var clickOb = Observe()
    var tapOb = Observe()

    var defaultOb = Observe()
    
    override func setModel(_ amodel: Cat) {
        super.setModel(amodel)
        if amodel is MainModel{
            let a = amodel as! MainModel
            //            ob.v_text = a.name
            
            ob.v_text { () -> String? in
                
                return a.name
            }
            
            clickOb.v_on {
                
                a.eventIdentifier = 1
                self.defaultOb.v_on?()
                
            }
           
            tapOb.v_on {
                
                a.eventIdentifier = 0
                self.defaultOb.v_on?()
            }
            
            
        }
    }
    
    
}
