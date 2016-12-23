//
//  MKWKWebViewViewController.swift
//  MKWKWebView
//
//  Created by https://github.com/minhechen on 12/23/16.
//  Copyright © 2016 MackChan. All rights reserved.
//

import UIKit


class MKWKWebViewViewController: UIViewController ,MKWKWebViewProtocol{
    
    let kMainScreenWidth = UIScreen.main.bounds.size.width
    let kMainScreenHeight = UIScreen.main.bounds.size.height

    var mainWKWebView: MKWKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initWebView()
        
        let url = Bundle.main.url(forResource: "test", withExtension: "html")
        self.loadUrl(url: url! as NSURL)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //init MKWKWebView
    func initWebView () -> Void {
        let webViewFrame = CGRect(x: 0, y: 0, width: kMainScreenWidth, height: kMainScreenHeight)
        mainWKWebView = MKWKWebView.init(frame: webViewFrame, delegate: self)
        self.view.addSubview(mainWKWebView!)
    }
    
    //load url
    func loadUrl(url:NSURL) {
        let req:NSURLRequest = NSURLRequest(url: url as URL)
        mainWKWebView!.load(req as URLRequest)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func didReceivedJSCallback(message: Dictionary<String, AnyObject>) {
        //deal with js callbac message here
        print("\(message)")
    }

}
