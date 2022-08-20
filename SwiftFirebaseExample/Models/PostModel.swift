//
//  PostModel.swift
//  SwiftFirebaseExample
//
//  Created by Mustafa Ali DİKÇINAR on 18.08.2022.
//


struct PostModel: Identifiable, Codable{
     let id: String?
     let title: String?
     let description: String?
     let vote: Int?
     let ownerId: String?
     let type: Int?
}
