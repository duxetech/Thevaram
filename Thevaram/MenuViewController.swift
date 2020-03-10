//
//  MenuViewController.swift
//  Thevaram
//
//  Created by Karthik on 10/03/20.
//  Copyright © 2020 Karthik. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    var books = ["திருமுறை 1","திருமுறை 2","திருமுறை 3","திருமுறை 4","திருமுறை 5","திருமுறை 6","திருமுறை 7","திருமுறை 8",]
    
    @IBOutlet var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
    }
    

    
    

}

extension MenuViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuCell
        cell.textLabel?.text = books[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let con = storyboard?.instantiateViewController(identifier: "main")
        AppDelegate().bookSelected = books[indexPath.row]
        
//        self.present(con!, animated: true, completion: nil)
        self.navigationController?.pushViewController(con!, animated: true)

    }
}
