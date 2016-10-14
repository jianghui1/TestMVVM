//
//  ViewController.swift
//  TestMVVM
//
//  Created by ys on 16/5/25.
//  Copyright © 2016年 jzh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var tableView: UITableView?
    private lazy var dataArray: NSMutableArray = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        tableView?.backgroundColor = UIColor.redColor()
        tableView?.delegate = self
        tableView?.dataSource = self
        self.view.addSubview(tableView!)
        
        let viewModel = ViewModel()
        viewModel.getData { (array) in
            self.dataArray = array
            self.tableView?.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cellId")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cellId")
        }
        let model: Model = self.dataArray[indexPath.row] as! Model
        cell?.textLabel?.text = model.name
        cell?.detailTextLabel?.text = model.sex
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let model = self.dataArray[indexPath.row]
        let viewModel = ViewModel()
        viewModel.pushDetailViewController(model as! Model, vc: self)
    }

}

