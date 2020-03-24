//
//  File.swift
//  
//
//  Created by Brian Murphy on 18/02/2020.
//

import Foundation

public struct FilteredTitlesQuery {
    let queryType: QueryType
    let year: Year
    let netflixRating: NetflixRating
    let imdbRating: IMDBRating
    let sort: Sort
    let subtitle: Subtitle
    let audio: Audio
    let videoType: VideoType
    let genreIdentifiers: [GenreResponse.GenreIdentifier]
    let minimumIMDBVotes: MinimumIMDBVotes
    let downloadable: Downloadable
    let countriesFilter: CountriesFilter

    public init(queryType: QueryType =                              .default,
                year: Year =                                        .default,
                netflixRating: NetflixRating =                      .default,
                imdbRating: IMDBRating =                            .default,
                sort: Sort =                                        .default,
                subtitle: Subtitle =                                .default,
                audio: Audio =                                      .default,
                videoType: VideoType =                              .default,
                genreIdentifiers: [GenreResponse.GenreIdentifier] = .default,
                minimumIMDBVotes: MinimumIMDBVotes =                .default,
                downloadable: Downloadable =                        .default,
                countriesFilter: CountriesFilter =                  .default) {
        self.queryType = queryType
        self.year = year
        self.netflixRating = netflixRating
        self.imdbRating = imdbRating
        self.sort = sort
        self.subtitle = subtitle
        self.audio = audio
        self.videoType = videoType
        self.genreIdentifiers = genreIdentifiers
        self.minimumIMDBVotes = minimumIMDBVotes
        self.downloadable = downloadable
        self.countriesFilter = countriesFilter
    }

    var components: [QueryComponent] {
        [queryType,
         year,
         netflixRating,
         imdbRating,
         genreIdentifiers,
         videoType,
         audio,
         subtitle,
         minimumIMDBVotes,
         downloadable
        ]
    }

    public var queryString: String {
        return components.map { $0.stringValue }.joined(separator: "-!")
    }
}
