//
//  PhotosViewController.swift
//  Tumblr Feed
//
//  Created by Stephanie Angulo on 6/16/16.
//  Copyright © 2016 Stephanie Angulo. All rights reserved.
//

import UIKit
import AFNetworking

class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var posts: [NSDictionary] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 240;
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
        let url = NSURL(string:"https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) in
            if let data = data {
                if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                    data, options:[]) as? NSDictionary {
                        print("responseDictionary: \(responseDictionary)")
                                                                                
                        // Recall there are two fields in the response dictionary, 'meta' and 'response'.
                        // This is how we get the 'response' field
                        let responseFieldDictionary = responseDictionary["response"] as! NSDictionary
                    
                        self.posts = responseFieldDictionary["posts"] as! [NSDictionary]

                        self.tableView.reloadData()
                    }
                }
            });
        task.resume()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        //let indexPath = tableView.indexPathForSelectedRow
        let vc = segue.destinationViewController as! PhotoDetailsViewController
        let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)
        
        let post = posts[indexPath!.row]
        let photos = post.valueForKeyPath("photos") as? [NSDictionary]
        let photoUrlString: String? = photos![0].valueForKeyPath("original_size.url") as? String
        
        vc.photoUrl = photoUrlString
        
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PhotoCell") as! PhotoCell
        let post = posts[indexPath.row]
        
        if let photos = post.valueForKeyPath("photos") as? [NSDictionary] {
            let imageUrlString = photos[0].valueForKeyPath("original_size.url") as? String
            if let imageUrl = NSURL(string: imageUrlString!) {
                cell.imagepost.setImageWithURL(imageUrl)
            } else {
               //url is nil
            }
        } else {
            //nothing to show
        
        }
        //cell.textLabel!.text = "This is row \(indexPath.row)"
        
        
        return cell
    }
    
    
    
}
