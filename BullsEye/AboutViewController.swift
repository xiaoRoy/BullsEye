//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Jerry Li on 2019/2/7.
//  Copyright © 2019 Jerry Li. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        initWebView()
        // Do any additional setup after loading the view.
    }
    
    func initWebView() {
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func close () {
        dismiss(animated: true, completion: nil)
    }

}
