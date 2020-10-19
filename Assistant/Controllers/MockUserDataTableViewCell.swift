//
//  MockUserDataTableViewCell.swift
//  Assistant
//
//  Created by Jeffrey  on 10/18/20.
//

import UIKit

class MockUserDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var subTitleImageView: UIImageView!
    @IBOutlet weak var seeAllBtn: UIImageView!
    @IBOutlet weak var getInfoBtn: UIButton!
    
    @IBOutlet var companyTitle: [UILabel]!
    @IBOutlet var amountDue: [UILabel]!
    @IBOutlet var dataTypeIcon: [UIImageView]!
    
    //Override frame property to assign left and right spacer to tableview cell
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame = newFrame
            frame.origin.x += 10
            frame.size.width -= 2 * 10
            super.frame = frame
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
