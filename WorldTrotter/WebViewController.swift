//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Tyler Helwig on 6/6/18.
//  Copyright © 2018 Tyler Helwig. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.load(URLRequest(url: URL(string: "https://www.bignerdranch.com")!))
    }
}
