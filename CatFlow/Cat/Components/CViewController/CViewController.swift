//
//  CViewController.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit
typealias popCallBack = (_ obj:AnyObject?) -> ()
open class CViewController: UIViewController {
    var params:[String:Any]?
    
    var call:popCallBack?
    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    


}
