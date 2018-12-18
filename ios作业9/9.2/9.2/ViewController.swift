//
//  ViewController.swift
//  9.2
//
//  Created by nxc on 18/11/18.
//  Copyright © 2018年 nxc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate{
    @IBOutlet weak var scrollView1: UIScrollView!

    @IBOutlet weak var scrollView2: UIScrollView!
    @IBOutlet weak var pageContrpl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //放大缩小
        let image = UIImage(named: "pic4")
        let imageView = UIImageView(image: image)
        scrollView1.addSubview(imageView)
        scrollView1.contentSize = imageView.bounds.size
        scrollView1.minimumZoomScale = 0.1
        scrollView1.maximumZoomScale = 10
        scrollView1.delegate = self
        
        //相册浏览
        scrollView2.isPagingEnabled = true
        scrollView2.delegate = self
        scrollView2.showsHorizontalScrollIndicator = false
        for i in 1...8{
            let imageView = UIImageView(image: UIImage(named: "pic\(i)"))
            imageView.frame = CGRect(x: Int(scrollView2.bounds.width)*(i-1), y: 0, width: Int(scrollView2.bounds.width), height: Int(scrollView2.bounds.height))
            imageView.contentMode = .scaleAspectFit
            scrollView2.addSubview(imageView)
        }
        scrollView2.contentSize = CGSize(width: Int(scrollView2.bounds.width*8), height: Int(scrollView2.bounds.height))
        pageContrpl.currentPage = 8
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scrollView.subviews.first
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == scrollView2 {
            let offset = scrollView.contentOffset
            
            pageContrpl.currentPage = Int(offset.x / scrollView.bounds.width)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

