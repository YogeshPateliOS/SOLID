//
//  OCP.swift
//  OCPAPI
//
//  Created by Yogesh Patel on 22/06/23.
//

import UIKit

let postURL = "https://jsonplaceholder.typicode.com/posts"
let commentURL = "https://jsonplaceholder.typicode.com/posts/1/comments"

class APIService {

    func fetchPosts(completion: @escaping ([PostModel]?, Error?) -> Void) {
        guard let url = URL(string: postURL) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else { return }
            do {
                let posts = try JSONDecoder().decode([PostModel].self, from: data)
                completion(posts, nil)
            }catch {
                completion(nil, error)
            }
        }.resume()
    }

    func request<T: Decodable>(
        url: String,
        type: T.Type,
        completion: @escaping (T?, Error?) -> Void
    ) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else { return }
            do {
                let apiResponse = try JSONDecoder().decode(type, from: data)
                completion(apiResponse, nil)
            }catch {
                completion(nil, error)
            }
        }.resume()
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//       fetchPosts()
        fetchComments()
    }

    func fetchPosts() {
        APIService().request(url: postURL, type: [PostModel].self) { posts, error in
            guard let posts else { return }
            print(posts)
        }
//        APIService().fetchPosts { posts, error in
//            guard let posts else { return }
//            print(posts)
//        }
    }

    func fetchComments() {
        APIService().request(url: commentURL, type: [CommentModel].self) { comments, error in
            guard let comments else { return }
            print(comments)
        }
    }

}
