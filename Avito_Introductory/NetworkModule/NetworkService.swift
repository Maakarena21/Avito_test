


import Foundation
import Combine

enum NetworkServiceError: Error {
    case internalError
    case networkError(Error)
}

protocol NetworkService {
    func load() -> AnyPublisher<CompanyWorkers, NetworkServiceError>
}

class NetworkServiceImpl: NetworkService {
    
    func load() -> AnyPublisher<CompanyWorkers, NetworkServiceError> {

        guard let url = URL(string: "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c") else { return Future { $0(.failure(NetworkServiceError.internalError)) }.eraseToAnyPublisher()}
        
        return URLSession
            .shared
            .dataTaskPublisher(for: url)
            .tryMap { (data: Data, response: URLResponse) -> CompanyWorkers in
                try JSONDecoder().decode(CompanyWorkers.self, from: data)
            }.mapError {
                .networkError($0)
            }
            .eraseToAnyPublisher()
    }
}
