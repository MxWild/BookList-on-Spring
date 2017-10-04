package system.service;

import system.model.Book;

import java.util.List;

public interface BookService {

    // Add book
    void addBook(Book book);

    // update book
    void updateBook(Book book);

    // remove book
    void removeBook(int id);

    // get book
    Book getBookById(int id);

    // get all books
    List<Book> getAllBooks();

}
