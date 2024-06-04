import Foundation
import Combine

class NetworkingManager {

    static func get(urlRequest: URLRequest) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { output in
                do {
                    return try handleURLResponse(output: output, url: urlRequest.url!)
                } catch {
                    throw NetworkingError.responseHandlingFailed(error: error, file: #file, function: #function, line: #line)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url, response: output.response, file: #file, function: #function, line: #line)
        }
        return output.data
    }

    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print("Completion error: \(error.localizedDescription)")
        }
    }

    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL, response: URLResponse, file: String, function: String, line: Int)
        case responseHandlingFailed(error: Error, file: String, function: String, line: Int)
        case unknown(file: String, function: String, line: Int)

        var errorDescription: String? {
            switch self {
            case .badURLResponse(let url, let response, let file, let function, let line):
                return "[🔥] Bad response from URL: \(url). Response: \(response). [File: \(file), Function: \(function), Line: \(line)]"
            case .responseHandlingFailed(let error, let file, let function, let line):
                return "[❗️] Response handling failed: \(error.localizedDescription). [File: \(file), Function: \(function), Line: \(line)]"
            case .unknown(let file, let function, let line):
                return "[⚠️] Unknown error occurred. [File: \(file), Function: \(function), Line: \(line)]"
            }
        }
    }
}

