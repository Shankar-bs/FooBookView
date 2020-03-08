//
//  DataProvider.swift
//  FooBook
//
//  Created by Shankar B S on 22/02/20.
//  Copyright © 2020 Slicode. All rights reserved.
//

import Foundation
class DataProvider {
    
    func populateData() -> [FeedModel] {
        var feeds: [FeedModel] = []
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        
        let feed_1 = FeedModel(
                     name: "Peter Parkar",
                     dateString: formatter.string(from: Date()),
                     subTitle: """
                     Yes, you can bathe a puppy at 8 weeks old if he needs a bath
                     Most puppies will at some point.
                     After all, they are prone to falling and stepping in poops and puddles!.
                     But, this doesn’t mean your puppy will need a full bath every day. A small puppy’s fur doesn’t need washing with shampoo on a daily basis.
                     And little marks, a bit of spilled food for example, can be simply wiped off a short-coated puppy with a damp sponge
                     """,
                     shares: "20k+ Shares",
                     likes: "2k+ likes",
                     comments: "1.3 commens",
                     feedImageName: "a_1",
                     profileImageName: "p_1")
        
       
        let feed_2 = FeedModel(
        name: "My Friend",
        dateString: formatter.string(from: Date()),
        subTitle: """
        After the discussion, one must agree that ‘Save Animals’ must be a made into an awareness program for all to understand the value of animal life. Special reserve areas for protecting the endangered species where the human presence is controlled. They feel safe in their areas, and that is the only chance for them to breed and thrive. If you are really passionate about saving animals, you can even volunteer at the local animal shelter. You can help by walking dogs or cleaning out water bowls – anything that makes a difference in the lives of homeless animals
        """,
        shares: "1.7k+ Shares",
        likes: "3k+ likes",
        comments: "30k+ commens",
        feedImageName: "a_2",
        profileImageName: "p_2")
        
        
        let feed_3 = FeedModel(
        name: "Baby doll",
        dateString: formatter.string(from: Date()),
        subTitle: """
        These kaomoji dogs are pretty cute. There’s all kinds of dogs here including Jake from Adventure Time! The main thing about Japanese dog emoticons are the ears. These are what will make the emotes look like dogs instead of cats. Use a U for big floppy ears, u for little ears or even V’s for ears as well. You can also use ∵ on either side of the mouth to make it look more dog like. ᴥ is perfect for a cute little doggy nose and ૮ and ა make very dog-like ears as well.
        """,
        shares: "15.4k+ Shares",
        likes: "70k+ likes",
        comments: "3k+ commens",
        feedImageName: "a_3",
        profileImageName: "p_3")
        
        feeds.append(contentsOf: [feed_1, feed_2, feed_3])
        return feeds
    }
}
