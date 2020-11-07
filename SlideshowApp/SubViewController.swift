//
//  SubViewController.swift
//  SlideshowApp
//
//  Created by MikaYamashita on 2020/11/07.
//  Copyright © 2020 mika.yamashita. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {
    
    var num = 1
    
    @IBOutlet weak var subImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        subImageView.image = UIImage(named: "\(num).png")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
