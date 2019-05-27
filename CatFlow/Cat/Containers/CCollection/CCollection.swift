//
//  CCollection.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class CCollection: UICollectionView ,UICollectionViewDelegate,UICollectionViewDataSource{

    static var templates = Array<AnyClass>()
    var array:Array<Cat>?
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.backgroundColor = UIColor.clear
        self.delegate = self
        self.dataSource = self
        
        register(CCollection.templates)

        
    }
   
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = array?.count{
            return count
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let model = array?[indexPath.row]
        if let m = model,let palm = model?.v_palm{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: palm, for: indexPath) as! CollectionTemplate
            cell.setModel(m)
            cell.v_SelectOb?.v_on {
                
                self.block?(indexPath.row)
                self.ob?.v_index?(indexPath.row)
            }
            return cell
        }
        return CollectionTemplate()
        
    }
    
    func register(_ templates:Array<AnyClass>){

        for value in templates{
            let className:String=NSStringFromClass(value).components(separatedBy: ".").last!
            self.register(value, forCellWithReuseIdentifier: className)
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
    

    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        block?(indexPath.row)
//
//        self.ob?.v_index?(indexPath.row)
//    }
    

}
