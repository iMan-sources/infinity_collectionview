//
//  ViewController.swift
//  SGI_ScrollView
//
//  Created by Le Viet Anh on 26/6/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var centerTermView: TimetableView!
    
    private var leftTerm: TimetableView!
    private var rightTerm: TimetableView!
    let centerLessons = [   Lesson(name: "Art", teacher: "Alex"),
                            Lesson(name: "Science", teacher: "Morgan"),
                            Lesson(name: "Computer Science", teacher: "Casey"),
                            Lesson(name: "Math", teacher: "Drew"),
                            Lesson(name: "History", teacher: "Taylor"),
                            Lesson(name: "Music", teacher: "Jordan"),
                            Lesson(name: "English", teacher: "Riley"),
                            Lesson(name: "Physical Education", teacher: "Cameron"),
                            Lesson(name: "Art", teacher: "Jordan"),
                            Lesson(name: "Science", teacher: "Drew")]
    
    let leftLessons = [Lesson(name: "Art", teacher: "Alex"),
                       Lesson(name: "Science", teacher: "Morgan"),
                       Lesson(name: "Computer Science", teacher: "Casey"),
                       Lesson(name: "Math", teacher: "Drew"),
                       Lesson(name: "History", teacher: "Taylor")]
    
    let rightLessons = [Lesson(name: "Music", teacher: "Jordan"),
                        Lesson(name: "English", teacher: "Riley"),
                        Lesson(name: "Physical Education", teacher: "Cameron"),
                        Lesson(name: "Art", teacher: "Jordan"),
                        Lesson(name: "Science", teacher: "Drew")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        fetchLessons()
    }
    
    func fetchLessons(){
        leftTerm.updateLessons(lessons: leftLessons)
        rightTerm.updateLessons(lessons: rightLessons)
        centerTermView.updateLessons(lessons: centerLessons)
    }
    
    
    private func setupUI(){
        scrollView.delegate = self
        
        leftTerm = TimetableView(frame: CGRect(origin: CGPoint(x: self.view.bounds.width, y: 0),
                                               size: self.view.bounds.size))
        
        leftTerm.backgroundColor = .red
        rightTerm = TimetableView(frame: CGRect(origin: CGPoint(x: self.view.bounds.width * 2, y: 0),
                                                size: self.view.bounds.size))
        rightTerm.backgroundColor = .green
        scrollView.addSubview(leftTerm)
        scrollView.addSubview(rightTerm)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.contentSize.width = self.view.bounds.width * 3
        scrollView.scrollRectToVisible(CGRect(origin: CGPoint(x: self.view.bounds.width, y: 0), size: self.view.frame.size), animated: false)
        
        
    }
}

extension ViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}

