//
//  SearchViewController.swift
//  BookWishlistI
//
//  Created by Artemis on 3/18/18.
//  Copyright © 2018 Artemis. All rights reserved.
//
// Using the Google Books API call, book.volumes.list, takes user input to
// search for a given book.

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
	
	var apiKey = "AIzaSyAZsMlB2tJ1N0P35QLLLDGypL47wqIUlZU"
	var maxResults = 25

	@IBOutlet weak var searchBar: UISearchBar!
	//var searchActive : Bool = false
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		print("opening search")
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	

	
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		print(String(searchBar.text!))
		let userInput = String(searchBar.text!)
		
		if userInput != "" {
			let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=\(userInput.replacingOccurrences(of: " ", with: "+"))&maxResults=\(maxResults)&key=\(apiKey)")
			let task = URLSession.shared.dataTask(with: url!) {
				(data, response, error) in
				
				if error != nil {
					print(error)
				}else{
					
					if let urlContent = data {
						
						do{
							//tries to get json as an array
							let json = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: Any]
							print(json)
							
							
						} catch{
							print("error!")
						}
					}
				}
			}
			task.resume()
			
		} else {
			print("empty string!")
		}
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
