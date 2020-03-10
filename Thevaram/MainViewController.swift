//
//  ViewController.swift
//  Thevaram
//
//  Created by Karthik on 10/03/20.
//  Copyright © 2020 Karthik. All rights reserved.
//

import UIKit
import iOSDropDown



class MainViewController: UIViewController {


    @IBOutlet var ThevDropDown: DropDown!
    
    var items = ["001 திருப்பிரமபுரம்","002 திருப்பிரமபுரம்","002 திருப்பிரமபுரம்","003 திருப்பிரமபுரம்","004 திருப்பிரமபுரம்","005 திருப்பிரமபுரம்","006 திருப்பிரமபுரம்","007 திருப்பிரமபுரம்",
                 "008 திருப்பிரமபுரம்","009 திருப்பிரமபுரம்","010 திருப்பிரமபுரம்","003 திருப்பிரமபுரம்","004 திருப்பிரமபுரம்","005 திருப்பிரமபுரம்","006 திருப்பிரமபுரம்","007 திருப்பிரமபுரம்",
    "திருப்பிரமபுரம்","005 திருப்பிரமபுரம்","006 திருப்பிரமபுரம்","007 திருப்பிரமபுரம்"]
    

    
    @IBOutlet var topMenu: UIButton!
    @IBOutlet var titleLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "திருவாசகம்"
        ThevDropDown.optionArray = items
        ThevDropDown.didSelect { (a, b, c) in
            print(a, b, c)
            self.title = AppDelegate().bookSelected
        }
        ThevDropDown.listHeight = self.view.frame.height - 200
        ThevDropDown.isEnabled = true
        topMenu.addTarget(SWRevealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(revealViewController().tapGestureRecognizer())
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        titleLabel.text = AppDelegate().bookSelected
        print(AppDelegate().bookSelected)
    }
    
   


}



