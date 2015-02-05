//
//  PhotosViewController.swift
//  flix
//
//  Created by Eric Huang on 2/4/15.
//  Copyright (c) 2015 Eric Huang. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    @IBOutlet weak var tableView: UITableView!
    var medias: [NSDictionary]! = []
    var refreshControl: UIRefreshControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsetsZero
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(refreshControl)
        
        refresh()
    }
    
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return medias.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("PhotoCell") as PhotoCell
        var media = medias[indexPath.row]
        
        cell.usernameLabel.text = media.valueForKeyPath("user.username") as? String
        
        var mediaImageURL = media.valueForKeyPath("images.standard_resolution.url") as String
        cell.mediaImage.setImageWithURL(NSURL(string: mediaImageURL))
        
        var profileImageURL = media.valueForKeyPath("user.profile_picture") as String
        cell.profileImage.setImageWithURL(NSURL(string: profileImageURL))
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var detailedPhotoViewController = segue.destinationViewController as DetailedPhotoViewController

        var indexPath = tableView.indexPathForCell(sender as UITableViewCell)
        detailedPhotoViewController.photo = medias[indexPath!.row]
    }

    
    func refresh() {
        var clientId = "dbd1b0e4190744158b367fbc28ffe81d"
        
        var url = NSURL(string: "https://api.instagram.com/v1/media/popular?client_id=\(clientId)")!
        var request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var responseDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
            self.medias = responseDictionary["data"] as [NSDictionary]
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
        
    }
}
