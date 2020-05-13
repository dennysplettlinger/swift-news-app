//
//  Article.swift
//  newscollect
//
//  Created by dennys Plettlinger on 12.05.20.
//  Copyright © 2020 dennysplettlinger. All rights reserved.
//

import Foundation

struct ArticleResponse : Decodable {
    let status: String
    let articles: [Article]
  }

  struct Article : Decodable {
    let title: String
    let description: String
    let urlToImage: String
  }


