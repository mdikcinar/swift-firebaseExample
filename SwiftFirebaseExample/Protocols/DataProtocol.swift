//
//  DataProtocol.swift
//  SwiftFirebaseExample
//
//  Created by Mustafa Ali DİKÇINAR on 18.08.2022.
//
import Foundation

protocol DataProtocol{
    func sendPost(post:PostModel,onError:((String) -> Void)?, onSuccess:(() -> Void)?)
    func deletePost(postId:String,onError:((String) -> Void)?, onSuccess:(() -> Void)?)
    func votePost()
    func getPosts(onLoaded:@escaping(([PostModel]) -> Void))
}
