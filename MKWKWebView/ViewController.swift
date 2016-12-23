//
//  ViewController.swift
//  MKWKWebView
//
//  Created by https://github.com/minhechen on 12/23/16.
//  Copyright © 2016 MackChan. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource{
    
    let kMainScreenWidth = UIScreen.main.bounds.size.width
    let kMainScreenHeight = UIScreen.main.bounds.size.height
    var mainTableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "MKWKWebView"
        self.setUpContentView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setUpContentView () -> Void {
        mainTableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: kMainScreenWidth, height: kMainScreenHeight))
        mainTableView?.delegate = self
        mainTableView?.dataSource = self
        self.view.addSubview(mainTableView!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "cellidentifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        cell?.textLabel?.text = "WKWebView"
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(
            MKWKWebViewViewController(), animated: true)
    }
}

