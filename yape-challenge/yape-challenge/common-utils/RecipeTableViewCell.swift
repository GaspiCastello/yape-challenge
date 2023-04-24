//
//  RecipeTableViewCell.swift
//  yape-challenge
//
//  Created by devsodep on 24/04/2023.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    @IBOutlet weak var hStackView: UIStackView!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(with data: RecipeModel) {

    }
    
}
