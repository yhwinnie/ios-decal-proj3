//
//  DetailViewController.swift
//  Photos
//
//  Created by Tracy Chen on 11/16/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    var photo : Photo?
    var hearts : [UIImage]!
    
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var datePosted: UILabel!
    @IBOutlet weak var likes: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var photoLarge: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        username.text = String(photo!.username)
        print(username.text)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        dateFormatter.timeStyle = .MediumStyle
        datePosted.text = dateFormatter.stringFromDate(photo!.datePosted)
        // datePosted.text = String(photo!.datePosted)
        likes.text = String(photo!.likes) + " likes"
        let url = NSURL(string: photo!.url)
        let data = NSData(contentsOfURL: url!)
        photoLarge.image = UIImage(data: data!)
        
        hearts = [UIImage]()
        hearts.append(UIImage(named: "whiteheart")!)
        hearts.append(UIImage(named: "redheart")!)
    }
    
    @IBAction func heartClicked(sender: AnyObject) {
        heartButton.tag = 1 - heartButton.tag
        heartButton.setBackgroundImage(hearts[heartButton.tag], forState: .Normal)
        likes.text = "\(photo!.likes + heartButton.tag) likes"
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
    
}