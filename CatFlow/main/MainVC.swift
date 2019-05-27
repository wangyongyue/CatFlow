//
//  MainVC.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit


class MainVC: CViewController {

    
    var obArray = Observe()
    var obEvent = Observe()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        
        let table = CTable()
        self.view.addSubview(table)
       
        table.v_array(ob: obArray)
        table.frame = CGRect.init(x: 0, y: 100, width: Screen.width(), height: Screen.height() - 200)
        table.register([MainTemplate.classForCoder()])
        
        let button = CButton()
        button.setTitle("button", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        self.view.addSubview(button)
        button.frame = CGRect.init(x: 100, y: Screen.height() - 100, width:100, height: 30)

        
        let m = Main()
        button.v_click {
            
            m.loadData(ob: self.obArray)
            
        }
        
        
        table.v_didSelect { (index) in

            let model = self.obArray.v_array?[index] as! MainModel
            print(model.eventIdentifier)
            Router.push(MainDetailsVC(), ["id":10], { (obj) in
                print(obj)
            })
        }
 
        
        
    }
    

}
class Main:NSObject{
    
    func loadData(ob:Observe?){
        
        
        var array = Array<Cat>()
        for i in 1...3{
            
            let m = MainModel()
            m.name = "wyy\(i)"
            array.append(m)
           
        }
        

        ob?.v_array(true, v: { () -> Array<Cat>? in
            
            return array
        })
        
       
        
    }
   
    
}
class Screen{
    
    static func width() -> CGFloat{
        
        return UIScreen.main.bounds.width
    }
    static func height() -> CGFloat{
        
        return UIScreen.main.bounds.height
    }
}
