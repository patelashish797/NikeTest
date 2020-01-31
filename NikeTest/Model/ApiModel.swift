//
//  ApiModel.swift
//  NikeTest
//
//  Created by Ashish Patel on 1/27/20.
//  Copyright © 2020 Ashish. All rights reserved.
//

import Foundation
import UIKit

struct Album: Codable
{
    var artistName: String?
    var name: String?
    var artworkUrl100: String?
    var releaseDate: String?
    var copyright: String?
    var genres: [GenreList]?
    var url: String?
}

struct GenreList: Codable
{
    var genreId: String?
    var name: String?
    var url: String?
}

extension Array where Element == GenreList {
    
     func getCommaSeparatedValues() -> String {
        
        var value = ""
        for genre in self {
            if let name = genre.name {
                if value.isEmpty {
                    value = name
                } else {
                    value = value + ", \(name)"
                }
            }
        }
        
        return value
    }
}
