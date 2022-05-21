//
//  ViewController.swift
//  GoodLib
//
//  Created by Vladislav Smetanin on 12.02.2022.
//

import UIKit

class LibraryViewController: UIViewController {

    private var newBooks: [BookProtocol] = [] {
        didSet { // наблюдатель свойства
            newBooks.sort{ $0.title < $1.title } // сортировка
            // сохранение контактов в хранилище
            storage.save(newBooks : newBooks)
        }
    }
    var storage: BookStorageProtocol!
    @IBOutlet var tableView: UITableView!

    @IBAction func showAddBookAlert() {
        createAddBookAlert()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storage = BookStorage()
        loadNewBooks()
        configureNavigationBar()
        configureTableViewCell()
    }
}

extension LibraryViewController: UITableViewDelegate { // расширение для класса вьюконтроллера, подписываем на протокол для реализации шаблона делегирование (теперь вьюконтроллер - делегат для tableview) ДЕЛЕГАТ-РАСШИРЕНИЕ
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //реализация свайпа влево
        // UISwipeActionsConfiguration? – определяет множество доступных действий для конкретной строки таблицы.
        //cоздается действие удаления, доступное при свайпе влево
        let actionDelete = UIContextualAction(style: .destructive, title: "Удалить"){ _,_,_ in
            self.newBooks.remove(at: indexPath.row)
            tableView.reloadData()
        }
        // формируем экземпляр, описывающий доступные действия
        let actions = UISwipeActionsConfiguration(actions: [actionDelete])
        return actions
    }
}

extension LibraryViewController: UITableViewDataSource { // расширение для класса вьюконтроллера, подписываем на источник данных для реализации шаблона ДАТАСОРС РАСШИРЕНИЕ
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newBooks.count //возвращаем общее количество строк которые потенциально могут быть отображены на вьюшке в 1 секции
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 84
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bookData = newBooks[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LibraryBookCell.identifier, for: indexPath) as? LibraryBookCell else{
            return UITableViewCell()
        }
        cell.configureCellData(bookData: bookData)
        return cell
    }
    
    //метод загрузки новых книг
    private func loadNewBooks(){
        newBooks = storage.load()
    }
}

extension LibraryViewController {
    
    private func configureNavigationBar(){
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "GoodLibPastelYellow")
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "GoodLibBrown") ?? UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "GoodLibBrown") ?? UIColor.black]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func configureTableViewCell(){
        tableView.register(UINib(nibName: String(describing: LibraryBookCell.self), bundle: nil), forCellReuseIdentifier: LibraryBookCell.identifier) //регистрация ячейки
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 85
        tableView.separatorStyle = .none
    }
    
    private func createAddBookAlert(){
        let alertController = UIAlertController(title: "Добавьте новую книгу", message: "Введите название книги, автора, статус и количество страниц", preferredStyle: .alert)
        // добавляем первое текстовое поле в Alert Controller
        alertController.addTextField { textField in
            textField.placeholder = "Название книги"
        }
        alertController.addTextField { textField in
            textField.placeholder = "Автор"
        }
        alertController.addTextField { textField in
            textField.placeholder = "Статус"
        }
        alertController.addTextField { textField in //замыкание, объяснение на стр 183 Книга2
            textField.placeholder = "Количество страниц"
        }
        let addButton = UIAlertAction(title: "Добавить", style: .default) { _ in
            guard let bookTitle = alertController.textFields?[0].text,
                  let bookAuthor = alertController.textFields?[1].text,
                  let bookStatus = alertController.textFields?[2].text,
                  let bookPagesString = alertController.textFields?[3].text
            else{
                return
            }
            var totalBookPages = 0
            if let bookPages = Int(bookPagesString){
                totalBookPages += bookPages
            } else {
                totalBookPages = 0
            }
            let book = NewBook(title: bookTitle, author: bookAuthor, status: bookStatus, totalPages: totalBookPages)
            self.newBooks.append(book)
            self.tableView.reloadData()
        }
        let cancelButton = UIAlertAction(title: "Отменить", style: .cancel, handler: nil)
        alertController.addAction(addButton)
        alertController.addAction(cancelButton)
        self.present(alertController, animated: true, completion: nil)
    }
}

