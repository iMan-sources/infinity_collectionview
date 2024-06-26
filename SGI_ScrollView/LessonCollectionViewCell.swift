//
//  LessonCollectionViewCell.swift
//  SGI_ScrollView
//
//  Created by Le Viet Anh on 26/6/24.
//

import UIKit

class LessonCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lesson: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func updateLesson(withLesson les: Lesson){
        lesson.text = les.name
    }

}
