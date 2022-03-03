//
//  Showpiece.swift
//  museum
//


import Foundation
import UIKit

struct Showpiece {
    let title:String
    let description: String
    let time: Int
    let country: String
    let publisher: String
    let language: String
    let image: UIImage
    
    static func findByName(name: String) -> Showpiece {
        for item in K.showpieces {
            if item.title == name {
                return item
            }
        }
        return Showpiece(title: "nope", description: "nope", time: 0, country: "nope", publisher: "nope", language: "nope", image: #imageLiteral(resourceName: "fr")
        )
    }
    
    static func findByCountry(country: String) -> [Showpiece] {
        var result:[Showpiece] = []
        for item in K.showpieces {
            if item.country == country {
                result.append(item)
            }
        }
        return result
    }
    
    static func findByYear(year: Int) -> [Showpiece] {
        var result:[Showpiece] = []
        for item in K.showpieces {
            if item.time >= year && item.time < year + 100 {
                result.append(item)
            }
        }
        return result
    }
}


struct ShowpieceTime {
    let title: String
    let time: String
}





