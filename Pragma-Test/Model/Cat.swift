//
//  Cat.swift
//  Pragma-Test
//
//  Created by Renzo Rodrigo Figueroa Fernández on 9/06/23.
//

import Foundation

struct Cat: Decodable, Encodable {
    var name:String
    var origin:String
    var affection_level:Int
    var intelligence: Int
    //var imageUrl:String
}
