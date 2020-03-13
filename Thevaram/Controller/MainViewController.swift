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
        
    var booktitles = ["திருஞானசம்பந்தர் தேவாரம் 1",
                      "திருஞானசம்பந்தர் தேவாரம் 2",
                      "திருஞானசம்பந்தர் தேவாரம் 3",
                      "திருநாவுக்கரசர் தேவாரம் 1",
                      "திருநாவுக்கரசர் தேவாரம் 2",
                      "திருநாவுக்கரசர் தேவாரம் 3",
                       "சுந்தரர் தேவாரம்",
                       "மாணிக்கவாசகர் திருவாசகம்"]


    var books = [Thirumurai]()
    
    let index = AppDelegate.bookSelected
    
    
    var padhigam1 = ["திருப்பிரமபுரம்","திருப்பிரமபுரம்1","திருப்பிரமபுரம்1","திருப்பிரமபுரம்1"
    ,"திருப்பிரமபுரம்1","திருப்பிரமபுரம்1","திருப்பிரமபுரம்1","திருப்பிரமபுரம்1","திருப்பிரமபுரம்1"
    ,"திருப்பிரமபுரம்1","திருப்பிரமபுரம்1","திருப்பிரமபுரம்1","திருப்பிரமபுரம்1","திருப்பிரமபுரம்1"
    ,"திருப்பிரமபுரம்1","திருப்பிரமபுரம்1","திருப்பிரமபுரம்1","திருப்பிரமபுரம்1","திருப்பிரமபுரம்1","திருப்பிரமபுரம்1"
    ,"திருப்பிரமபுரம்1","திருப்பிரமபுரம்1","திருப்பிரமபுரம்1","திருப்பிரமபுரம்1","திருப்பிரமபுரம்1"]
    
    @IBOutlet var topMenu: UIButton!
    @IBOutlet var detailsTextView : UITextView!
    var temp = [""]
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
        books = [thiru1,thiru2,thiru3,thiru4,thiru5,thiru6,thiru7,thiru8]
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
    
    @IBAction func increaseFont(){
        let size = detailsTextView.font!.pointSize
        if size > CGFloat(40) {
            return
        }
        detailsTextView.font = UIFont(name: "georgia", size: size+2)
    }
    
    
   @IBAction func decreaseFont(){
       let size = detailsTextView.font!.pointSize
    if size < CGFloat(10) {
        return
    }
    
       detailsTextView.font = UIFont(name: "georgia", size: size-2)
   }
   

    func getDir(i : Int) {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path =  paths[0]
        let str = ""
        let filename = path.appendingPathComponent(String(i)+".txt")

        do {
            try str.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
        }

    }

}



