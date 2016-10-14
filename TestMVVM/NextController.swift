//
//  NextController.swift
//  TestMVVM
//
//  Created by ys on 16/5/25.
//  Copyright © 2016年 jzh. All rights reserved.
//

import UIKit

class NextController: UIViewController {

    
    private var nameLabel: UILabel?
    private var sexLabel: UILabel?
    var model: Model?
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.backgroundColor = UIColor.whiteColor()
        nameLabel = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 30))
        nameLabel?.backgroundColor = UIColor.redColor()
        self.view.addSubview(nameLabel!)
        
        sexLabel = UILabel(frame: CGRect(x: 100, y: 200, width: 100, height: 30))
        sexLabel?.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(sexLabel!)
    
        let button: UIButton = UIButton(type: UIButtonType.System)
        button.frame = CGRect(x: 100, y: 300, width: 100, height: 30)
        button.setTitle("返回", forState: UIControlState.Normal)
        button.addTarget(self, action: #selector(NextController.buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
        self.nameLabel?.text = model?.name
        self.sexLabel?.text = model?.sex
    
    }
    
    func buttonAction() -> Void {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
