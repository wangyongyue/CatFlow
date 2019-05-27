//
//  MainDetailsTemplate.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class MainDetailsTemplate: TableTemplate {

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let label = CLabel()
        self.contentView.addSubview(label)
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 10)
        label.frame = CGRect.init(x: 20, y: 0, width:Screen.width()/2 - 20, height: 30)

        
        let field = CField()
        field.backgroundColor = UIColor.white
        field.borderStyle = .roundedRect
        field.textColor = UIColor.black
        field.placeholder = "请输入"
        self.contentView.addSubview(field)
        field.frame = CGRect.init(x: Screen.width()/2, y: 0, width: Screen.width()/2 - 20, height: 30)

        let h = MainDetailsHolder()
        field.v_input(ob: h.obModel)
        label.v_text(ob: h.obModel)

        holder = h
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        
    }
    override func setModel(_ amodel: Cat) {
        super.setModel(amodel)
        holder?.setModel(amodel)
    }
    
}
class MainDetailsModel: Cat {
    override init() {
        super.init()
        v_palm = "MainDetailsTemplate"
    }
    var name:String?
    
    
}
class MainDetailsHolder: Holder {
    var ob = Observe()
    var obModel = Observe()
    override func setModel(_ amodel: Cat) {
        super.setModel(amodel)
        if amodel is MainDetailsModel{
            let a = amodel as! MainDetailsModel
            obModel.v_input {[weak self] in
            
                a.name = self?.obModel.v_text

            }
        }
       
    }
    
    
}
