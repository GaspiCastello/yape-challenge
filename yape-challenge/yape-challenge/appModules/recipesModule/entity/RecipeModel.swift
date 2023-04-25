//
//  RecipeModel.swift
//  yape-challenge
//
//  Created by devsodep on 23/04/2023.
//

import Foundation
import CoreLocation
import Kingfisher
import UIKit

struct RecipeListModel: Codable {
    let recipes: [RecipeModel]
}

struct RecipeModel: Codable {
    let vegetarian: Bool
    let vegan: Bool
    let glutenFree: Bool
    let dairyFree: Bool
    let veryHealthy: Bool
    let cheap: Bool
    let veryPopular: Bool
    let sustainable: Bool
    let lowFodmap: Bool
    let weightWatcherSmartPoints: Int
    let pricePerServing: Double
    let extendedIngredients: [Ingredients]
    let id: Int
    let title: String
    let readyInMinutes: Int
    let servings: Int
    let sourceUrl: String
    let image: String
    let summary: String
    let cuisines: [String]
    let origin: Coordinate
    let dishTypes: [String]
    let diets: [String]
    let occasions: [String]
    let instructions: String
}

struct Coordinate: Codable {
    let lat: Double
    let long: Double

    func locationCoordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.lat,
                                      longitude: self.long)
    }
}

struct Ingredients: Codable {
    let id: Int
    let aisle: String
    let image: String
    let consistency: String
    let name: String
    let nameClean: String
    let original: String
    let originalName: String
    let amount: Double
    let unit: String
    let measures: Measure
}

struct Measure: Codable {
    let us: MeasureAmount
    let metric: MeasureAmount
}

struct MeasureAmount: Codable {
    let amount: Double
    let unitShort: String
    let unitLong: String
}
