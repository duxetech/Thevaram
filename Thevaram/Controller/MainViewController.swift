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
    
    @IBOutlet var titleLabel: UILabel!
        
    var booktitles = ["திருஞானசம்பந்தர் தேவாரம்","திருஞானசம்பந்தர் தேவாரம்","திருஞானசம்பந்தர் தேவாரம்",
                  "திருநாவுக்கரசர் தேவாரம்","திருநாவுக்கரசர் தேவாரம்","திருநாவுக்கரசர் தேவாரம்",
                  "சுந்தரர் தேவாரம்","மாணிக்கவாசகர் திருவாசகம்"]


    var books = [Thirumurai]()
    
    let index = AppDelegate.bookSelected
    
    @IBOutlet var topMenu: UIButton!
    @IBOutlet var detailsTextView : UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        books = [thiru1,thiru2]
        let titles = books[index].padhigam.map{$0.temple}
        titleLabel.text = "திருமுறைகள்"
        
        ThevDropDown.optionArray = titles
        ThevDropDown.didSelect { (a, b, c) in
            print(a, b, c)
            self.detailsTextView.text = self.books[self.index].padhigam[b].songs
            self.detailsTextView.scrollRangeToVisible(NSMakeRange(0, 0))
        }
        ThevDropDown.listHeight = self.view.frame.height - 200
        ThevDropDown.isEnabled = true
        topMenu.addTarget(SWRevealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        detailsTextView.text = thiru1.padhigam[0].songs
        detailsTextView.isEditable = false
        self.view.addGestureRecognizer(revealViewController().tapGestureRecognizer())
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        ThevDropDown.isSearchEnable=false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        detailsTextView.text = ""
        titleLabel.text = booktitles[index]
            
        print(AppDelegate.bookSelected)
    }
    
   


}



