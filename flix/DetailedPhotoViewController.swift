//
//  DetailedPhotoViewController.swift
//  flix
//
//  Created by Eric Huang on 2/4/15.
//  Copyright (c) 2015 Eric Huang. All rights reserved.
//

import UIKit

class DetailedPhotoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var photo: NSDictionary!

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        usernameLabel.text = photo.valueForKeyPath("user.username") as? String
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return 1;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
//        cell.detailTextLabel!.text = "WTF"
        
        return cell
    }

}
