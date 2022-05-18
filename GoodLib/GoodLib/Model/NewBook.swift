//
//  NewBook.swift
//  GoodLib
//
//  Created by Vladislav Smetanin on 12.02.2022.
//

import Foundation

protocol BookProtocol {
    var title: String { get set }
    var author: String { get set }
    var status: String { get set }
    var totalPages: Int { get set }
}

protocol BookStorageProtocol{
    // загрузка списка книг
    func load() -> [BookProtocol]
    //обновление списка книг
    func save(newBooks: [BookProtocol])
}

class BookStorage: BookStorageProtocol {
    
    // ссылка на хранилище
    private var storage = UserDefaults.standard
    // Ключ, по которому будет происходить сохранение хранилища
    private var storageKey = "newBooks"
    // Перечисление с ключами для записи в User Defaults
    private enum NewBookKey: String {
        case title
        case author
        case totalPages
        case status
    }
    
    //из массива словарей к массиву [newBook]
    func load() -> [BookProtocol] {
        var resultNewBooks: [BookProtocol] = []
        let newBooksFromStorage = storage.array(forKey: storageKey) as? [[String:Any]] ?? []
        for newBook in newBooksFromStorage {
            guard let title = newBook[NewBookKey.title.rawValue] as? String,
                  let author = newBook[NewBookKey.author.rawValue] as? String,
                  let status = newBook[NewBookKey.status.rawValue] as? String,
                  let totalPages = newBook[NewBookKey.totalPages.rawValue]
            else {
                continue
            }
            resultNewBooks.append(NewBook(title: title, author: author, status: status, totalPages: totalPages as? Int ?? 0))
        }
        return resultNewBooks
    }
    
    //сначала приводим newBooks к допустимому типу для хранения в User Defaults - к массиву словарей
    func save(newBooks: [BookProtocol]) {
        var arrayForStorage: [[String:Any]] = []
        newBooks.forEach { newBook in
            var newElementForStorage: Dictionary<String, Any> = [:]
            newElementForStorage[NewBookKey.title.rawValue] = newBook.title
            newElementForStorage[NewBookKey.author.rawValue] = newBook.author
            newElementForStorage[NewBookKey.status.rawValue] = newBook.status
            newElementForStorage[NewBookKey.totalPages.rawValue] = newBook.totalPages
            arrayForStorage.append(newElementForStorage)
        }
        storage.set(arrayForStorage, forKey: storageKey)
    }
}

//данные в приложении - книги, создадим сущность новая книга
struct NewBook: BookProtocol {
    var title: String
    var author: String
    var status: String
    var totalPages: Int
}
