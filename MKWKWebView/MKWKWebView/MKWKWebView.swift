//
//  MKWKWebView.swift
//  MKWKWebView
//
//  Created by https://github.com/minhechen on 12/23/16.
//  Copyright © 2016 MackChan. All rights reserved.
//

import UIKit
import WebKit

class MKWKWebView: WKWebView ,WKNavigationDelegate ,WKUIDelegate ,WKScriptMessageHandler{
    
    weak var delegate: MKWKWebViewProtocol?
    
    public init(frame:CGRect ,delegate:MKWKWebViewProtocol) {
        super.init(frame:frame ,configuration:WKWebViewConfiguration())
        self.configuration.userContentController.add(self, name:"HelloMKWKWebView0")
        self.configuration.userContentController.add(self, name:"HelloMKWKWebView1")
        self.configuration.userContentController.add(self, name:"HelloMKWKWebView2")
        self.navigationDelegate = self;
        self.uiDelegate = self;
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:-
    //MARK: JS Call back
    // deal with js callback message
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("did clicked 👍:\(message.name)")
        if message.name == "HelloMKWKWebView0" {
            print("Hello MKWKWebView")
            let mDict = self.messageToDictionary(message: message)
            if self.delegate != nil {
                self.delegate?.didReceivedJSCallback(message: mDict)
            }
        }
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        //
    }
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        //
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        //
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        //
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        //
        print("load finished 👍")
    }
    
    //MARK:-
    //MARK:message to dictionary
    func messageToDictionary (message: WKScriptMessage) -> Dictionary<String , AnyObject> {
        let jsonBody = message.body

        let jsonData = jsonBody
        let dictionary = jsonData as? Dictionary<String, AnyObject>
        return dictionary!
    }
}
