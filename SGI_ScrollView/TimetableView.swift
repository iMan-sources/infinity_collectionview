//
//  TimetableView.swift
//  SGI_ScrollView
//
//  Created by Le Viet Anh on 26/6/24.
//

import UIKit

class TimetableView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var lessons: [Lesson] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("TimetableView", owner: self, options: nil)
        guard let contentView = contentView else { return }
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(contentView)
        setupCollectionView()
    }
    
    private func setupCollectionView(){
        collectionView.register(UINib(nibName: "LessonCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LessonCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func updateLessons(lessons: [Lesson]){
        self.lessons = lessons
        collectionView.reloadData()
        
    }
    
}

extension TimetableView: UICollectionViewDelegate{
    
}

extension TimetableView: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width / 7, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

extension TimetableView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lessons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LessonCollectionViewCell", for: indexPath) as? LessonCollectionViewCell else {
            return UICollectionViewCell()
        }
        let lesson = lessons[indexPath.row]
        cell.updateLesson(withLesson: lesson)
        return cell
    }
    
}
