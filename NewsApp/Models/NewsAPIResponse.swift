//
//  NewsAPIResponse.swift
//  NewsApp
//
//  Created by Sachindra Fernando on 2022-08-21.
//

import Foundation
 
struct NewsAPIResponse: Decodable {
    let status: String
    let totalResults: Int?
    let articles: [Article]?
    
    let code: String?
    let message: String?
}
