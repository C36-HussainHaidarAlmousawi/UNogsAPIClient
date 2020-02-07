import Foundation
import Combine

public class UNogsAPIClient {

    private let apiKey: String

    public init (apiKey: String) {
        self.apiKey = apiKey
    }

    public func fetchCountries() -> AnyPublisher<CountriesResponse, Error> {
        let headers = [
            "x-rapidapi-host": "unogs-unogs-v1.p.rapidapi.com",
            "x-rapidapi-key": apiKey
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://unogs-unogs-v1.p.rapidapi.com/aaapi.cgi?t=lc&q=available")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let publisher = URLSession.shared.dataTaskPublisher(for: request as URLRequest)
            .map { $0.data }
            .decode(type: CountriesResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        return publisher
    }

}
