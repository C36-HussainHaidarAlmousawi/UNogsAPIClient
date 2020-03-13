//
//  UNogsAPIClient+NetflixTitle.swift
//  
//
//  Created by Brian Murphy on 13/03/2020.
//

import Foundation
import Combine

public extension UNogsAPIClient {
    
    func newReleasesPublisher() -> AnyPublisher<ItemsResponse<NetflixTitle>, Error>  {
        return publisher(for: createGetRequest(queryItems: [
            URLQueryItem(name: "p", value: "1"),
            URLQueryItem(name: "q", value: "get:new7:GB"),
            URLQueryItem(name: "t", value: "ns"),
            URLQueryItem(name: "st", value: "adv"),
        ]))
    }

    func expiringPublisher() -> AnyPublisher<ItemsResponse<NetflixTitle>, Error>  {
        return publisher(for: createGetRequest(queryItems: [
            URLQueryItem(name: "p", value: "1"),
            URLQueryItem(name: "q", value: "get:exp:GB"),
            URLQueryItem(name: "t", value: "ns"),
            URLQueryItem(name: "st", value: "adv"),
        ]))
    }

    func filteredTitlesPublisher(query: FilteredTitlesQuery) -> AnyPublisher<ItemsResponse<NetflixTitle>, Error> {
        return publisher(for: createGetRequest(queryItems: [
            URLQueryItem(name: "q", value: query.queryString),
            URLQueryItem(name: "t", value: "ns"),
            URLQueryItem(name: "cl", value: "all"),
            URLQueryItem(name: "st", value: "adv"),
            URLQueryItem(name: "ob", value: query.sort.rawValue),
            URLQueryItem(name: "p", value: "1"),
            URLQueryItem(name: "sa", value: "and"),
        ]))
    }

}