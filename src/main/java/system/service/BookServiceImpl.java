package system.service;

import org.springframework.transaction.annotation.Transactional;
import system.dao.BookDao;
import system.model.Book;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    private BookDao bookDao;

    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    @Transactional
    public void addBook(Book book) {
        bookDao.addBook(book);
    }

    @Transactional
    public void updateBook(Book book) {
        bookDao.updateBook(book);
    }

    @Transactional
    public void removeBook(int id) {
        bookDao.removeBook(id);
    }

    @Transactional
    public Book getBookById(int id) {
        return bookDao.getBookById(id);
    }

    @Transactional(readOnly = true)
    public List<Book> getAllBooks() {
        return bookDao.getAllBooks();
    }

    @Override
    @Transactional
    public List<Book> getOnlyTenBooks() {
        return bookDao.getOnlyTenBooks();
    }

    @Override
    @Transactional
    public List<Book> getBooksByTitle(String title) {
        return bookDao.getBooksByTitle(title);
    }
}
