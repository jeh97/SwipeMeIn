//
//  ViewController.swift
//  SwipeMeIn
//
//  Created by Jacob Hausmann on 7/8/19.
//  Copyright © 2019 Jacob Hausmann. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    // MARK: - Properties
    var slides:[Slide] = []

    // MARK: - Outlets
    @IBOutlet var logoImageView: UIImageView!
    @IBOutlet var subtitleTextView: UITextView!
    @IBOutlet var infoImageView: UIImageView!
    @IBOutlet var infoTitleTextView: UITextView!
    @IBOutlet var infoSubtitleTextView: UITextView!
    @IBOutlet var infoPageControl: UIPageControl!
    @IBOutlet var copyrightTextView: UITextView!
    @IBOutlet var scrollView: UIScrollView!

    @IBOutlet var getStartedButton: UIButton!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        initializeScrollView()

    }

    // MARK: - Actions
    @IBAction func infoPageControlValueChanged(_ sender: Any) {
        self.scrollView
            .scrollRectToVisible(CGRect(
                x: Int(self.scrollView.frame.size.width) * self.infoPageControl.currentPage,
                y: 0,
                width: Int(self.scrollView.frame.size.width),
                height: Int(self.scrollView.frame.size.height)),
                                 animated: true)
    }

    // MARK: - Methods
    func initializeScrollView() {
        scrollView.delegate = self

        slides = createSlides()
        setupSlideScrollView(slides: slides)

        infoPageControl.numberOfPages = slides.count
        infoPageControl.currentPage = 0
        view.bringSubviewToFront(infoPageControl)
    }

    func setupSlideScrollView(slides: [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true

        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }

    func createSlides() -> [Slide] {
        let slide1:Slide = Bundle.main.loadNibNamed("WelcomeSlide", owner: self, options: nil)?.first as! Slide
        slide1.imageView.image = UIImage(named: "sellswipe")
        slide1.titleLabel.text = "Sell a Meal, Make Money"
        slide1.subtitleLabel.text = "Swipe others into dining halls and get real money in return"

        let slide2:Slide = Bundle.main.loadNibNamed("WelcomeSlide", owner: self, options: nil)?.first as! Slide
        slide2.imageView.image = UIImage(named: "buyswipe")
        slide2.titleLabel.text = "Buy a Meal, Save Money"
        slide2.subtitleLabel.text = "Eat on campus at J2 or Kins for just $5"

        let slide3:Slide = Bundle.main.loadNibNamed("WelcomeSlide", owner: self, options: nil)?.first as! Slide
        slide3.imageView.image = UIImage(named: "help")
        slide3.titleLabel.text = "Help a Longhorn in Need"
        slide3.subtitleLabel.text = "100% of profit is donated to UT's Food Pantry and Student Emergency Services"

        return [slide1, slide2, slide3]
    }
}

extension WelcomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 || scrollView.contentOffset.y < 0 {
            scrollView.contentOffset.y = 0
        }
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        infoPageControl.currentPage = Int(pageIndex)
    }
}

