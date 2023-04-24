//
//  Extensions.swift
//  yape-challenge
//
//  Created by devsodep on 24/04/2023.
//

import Foundation

extension String {
    func cleanHTMLTags() -> String? {
        try? NSAttributedString(
            data: Data(self.utf8),
            options: [.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil).string
    }
}
