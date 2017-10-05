package system.dao;

import system.model.Book;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookDaoImpl implements BookDao {

    private SessionFactory sessionFactory;
    private Session session;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void addBook(Book book) {
        session = sessionFactory.getCurrentSession();
        session.persist(book);
    }

    public void updateBook(Book book) {
        session = sessionFactory.getCurrentSession();
        session.update(book);
    }

    public void removeBook(int id) {
        session = sessionFactory.getCurrentSession();
        Book book = session.load(Book.class, id);

        if (book != null) session.delete(book);
    }

    public Book getBookById(int id) {
        session = sessionFactory.getCurrentSession();
        Book book = session.get(Book.class, id);

        return book;
    }

    @SuppressWarnings("unchecked")
    public List<Book> getAllBooks() {
        session = sessionFactory.getCurrentSession();
        List<Book> booksList = session.createQuery("from Book c").list();

        return booksList;
    }

    @Override
    public List<Book> getBooksByTitle(String title) {
        session = sessionFactory.getCurrentSession();
        List<Book> booksList = session.createQuery("from Book c where TITLE like '%" + title + "%'").list();

        return booksList;
    }


}
