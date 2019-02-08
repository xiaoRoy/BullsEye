//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Jerry Li on 2019/2/7.
//  Copyright © 2019 Jerry Li. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
