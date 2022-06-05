# GoodLib
____
## iOS приложение "GoodLib" на языке Swift для формирования личной библиотеки и отслеживания текущего статуса книги.
___
#### iOS application "GoodLib" in the Swift language for creating a personal library and tracking the current status of the book.

___
### Основной использованный стек:

#### Main used stack:

UIKit, UITableViewController, UITabBarController, UINavigationController, UIAlertController, UISwipeActions, CoreData, UserDefaults, MVC

<html>
 <head>
  <meta charset="utf-8">
 </head>
 <body>
  <p>
    <img src="https://i.ibb.co/gwjknBS/1.png" alt="Фотография 1" width="200" height="410">
    <img src="https://i.ibb.co/wJ6CRTV/2.png" alt="Фотография 2" width="200" height="410">
    <img src="https://i.ibb.co/x8z30VN/3.png" alt="Фотография 3" width="200" height="410">
  </p>
 </body>
</html>

### Краткое описание приложения:

Приложение "GoodLib" позволяет добавлять новые книги в свою библиотеку с указанием названия, автора, статуса книги и количества страниц.

- Проект полностью написан на UIKit.
- Использованы UITabBarController, UINavigationController.
- Использован UITableView с кастомными ячейками UITableViewCell.
- Реализована возможность удаления книги из библиотеки по свайпу UISwipeActions.
- Использована архитектура MVС.
- Работа с памятью осуществляется с помощью UserDefaults.
- Добавление новой книги и описание заполняется через UIAlertController.
- Подобрана цветовая палитра, ассоциированная с процессом чтения книг, добавлены AppIcons.

Работа над приложением продолжается, планируется:

- Добавить LaunchScreen
- Разработать главную страницу с использованием UITableView - отображение текущего списка чтения с прогрессом (слайдер для добавления прочтенных страниц), UICollectionView - виджеты для перехода к основным разделам библиотеки (вишлист, прочитано и тд) с кастомными ячейками UICollectionViewCell и UITableViewCell.
- Разработать экраны с хранилищем книг разных категорий (вишлист, прочитано и тд).
- Возможность добавления обложки книги с помощью камеры iPhone или через галерею.
- Разработать экран пользователя со статистикой чтения.
- Реализовать работу с памятью через CoreData.
- Добавить страницу со списком книг полученных через JSON API популярного книжного магазина с возможностью добавления в личную библиотеку. 

### Short description: 

The "GoodLib" app allows you to add new books to your personal library with title, author, book status and number of pages.

- The project is completely written in UIKit.
- Used UITabBarController, UINavigationController.
- Used UITableView with custom UITableViewCell cells.
- Implemented the ability to delete a book from the library by swiping UISwipeActions.
- MVC architecture is used.
- Working with memory is done using UserDefaults.
- Adding a new book and the description is filled through UIAlertController.
- The color palette associated with the process of reading books has been selected, AppIcons have been added.

Work on the application continues, it is planned:

- Add LaunchScreen
- Develop the main page using UITableView - displaying the current reading list with progress (slider for adding read pages), UICollectionView - widgets for moving to the main sections of the library (wishlist, read, etc.) with custom cells UICollectionViewCell and UITableViewCell.
- Develop screens with a repository of books of different categories (wishlist, read, etc.).
- Ability to add a book cover using the iPhone camera or through the gallery.
- Design a user screen with reading statistics.
- Implement work with memory through CoreData.
- Add a page with a list of books received through the JSON API of a popular bookstore with the ability to add to your personal library.
