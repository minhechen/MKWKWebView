//
//  MKWKWebViewProtocol.swift
//  MKWKWebView
//
//  Created by https://github.com/minhechen on 12/23/16.
//  Copyright © 2016 MackChan. All rights reserved.
//

import UIKit

public protocol MKWKWebViewProtocol: NSObjectProtocol {

    func didReceivedJSCallback (message: Dictionary<String, AnyObject>)
    
}
