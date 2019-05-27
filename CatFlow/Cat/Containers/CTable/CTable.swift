//
//  CTable.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class CTable: UITableView ,UITableViewDataSource,UITableViewDelegate{

    static var templates = Array<AnyClass>()
    var array:Array<Cat>?
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        self.backgroundColor = UIColor.clear
        self.delegate = self
        self.dataSource = self
        self.separatorStyle = .none
        self.rowHeight = UITableView.automaticDimension
        self.estimatedRowHeight = 50.0
        
        register(CTable.templates)

    }
    override func numberOfRows(inSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = array?.count{
            return count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = array?[indexPath.row]
        if let m = model ,let palm = model?.v_palm {
            let cell = self.dequeueReusableCell(withIdentifier: palm, for: indexPath) as! TableTemplate
            cell.selectionStyle = .none
            cell.setModel(m)
            
            cell.holder?.v_selectOb.v_on {
                
                self.block?(indexPath.row)
                self.ob?.v_index?(indexPath.row)
            }
            return cell
        }
       
        return TableTemplate()
        
    }
    
    func register(_ templates:Array<AnyClass>){
        
        for value in templates{
            
            let className:String=NSStringFromClass(value).components(separatedBy: ".").last!
            self.register(value, forCellReuseIdentifier: className)
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
    
    //v-array
    func v_array(ob:Observe){
        
        ob.setupObserve {
            self.array = ob.v_array
            self.reloadData()
            
            
        }
        
    }
    
    //v_didSelect
    typealias selectBlock = (_ index:Int) -> ()
    var block:selectBlock?
    func v_didSelect(ob:@escaping selectBlock){
        
        block = ob
        
    }
    
    
    //v-index
    var ob:Observe?
    func v_index(ob:Observe){
        
        self.ob = ob
        
    }
   
   
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        block?(indexPath.row)
//
//        self.ob?.v_index?(indexPath.row)
//    }
    

}
