//
//  WebSiteViewController.swift
//  DemoApp
//
//  Created by Nguyen Duc Chau on 24/04/2022.
//

import UIKit
import WebKit

class WebSiteViewController: UIViewController {

    let webView: WKWebView = {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero,configuration: configuration)
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        // Do any additional setup after loading the view.
        
        guard let url = URL(string: "https://zingnews.vn") else {
            return
        }
        webView.load(URLRequest(url: url))
        webView.customUserAgent = "iPad/Chrome/SomethingRandom"
        DispatchQueue.main.asyncAfter(deadline: .now()+5) {
            self.webView.evaluateJavaScript("document.body.innerHTML") { result, error  in
                guard let html = result as? String, error == nil else {
                    return
                }
                print(html)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }


}
