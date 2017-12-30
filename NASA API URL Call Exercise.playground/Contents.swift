import UIKit
import PlaygroundSupport

//Enables the playground to wait for the network request to finish and run the completion handler.
PlaygroundPage.current.needsIndefiniteExecution = true

//Create a URL obj that points to a website: has protocol, subdomain, domain, path
let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!

//Extension on URL that adds a withQueries(_:) method that accepts a [String: String] and uses URLComponents to return a new URL. Func takes the current URL, maps the queries dictionary to URLQueryItem instances, adds them to the URL, and returns a new copy out of the function.
extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.flatMap { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

//A dictionary with keys and values that match my queries
let query: [String: String] = [
    "api_key": "DEMO_KEY",
    "date": "2011-07-13"
]

//Update my baseUrl by adding the above queries using the withQueries(_:) method --> generate the full URL
let url = baseURL.withQueries(query)!

//Create a data task
let task = URLSession.shared.dataTask(with: url) { (data,
    response, error) in
    if let data = data, let string = String(data: data, encoding: .utf8) {
        //fetches HTML for NASA APOD home page
        print(string)
    }
}

//Sends the request
task.resume()

