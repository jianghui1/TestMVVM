//
//  ViewModel.swift
//  TestMVVM
//
//  Created by ys on 16/5/25.
//  Copyright © 2016年 jzh. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    
    var successBlock = {
        
    }
    
    
    func getData(successBlock: (array: NSMutableArray) -> Void) -> Void {
        let dataArray = NSMutableArray()
        for i in 0...10 {
            let name = "name\(i)"
            let sex = "sex\(i)"
            let model: Model = Model()
            model.name = name
            model.sex = sex
            dataArray.addObject(model)
        }
        successBlock(array: dataArray)
    }
    
    
    func pushDetailViewController(model: Model, vc: UIViewController) -> Void {
        let nextVC = NextController()
        nextVC.model = model
        vc.presentViewController(nextVC, animated: true, completion: nil)
    }
    
    
    
}
