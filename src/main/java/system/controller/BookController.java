package system.controller;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.*;
import system.model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import system.service.BookService;

@Controller
public class BookController {

    private BookService bookService;

    @Autowired
    @Qualifier(value = "bookService")
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    // List of books
    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String listAllBooks(Model model) {
        model.addAttribute("allBooks", bookService.getAllBooks());

        return "index";
    }

    @RequestMapping(value = "/search")
    public String searchBookByTitle(@RequestParam("searchString") String searchString, Model model) {

        if(searchString != null){
            model.addAttribute("searchedBooks", bookService.getBooksByTitle(searchString));
        }

        return "search";
    }

    // form add book
    @RequestMapping(value="/add", method=RequestMethod.GET)
    public String addBookForm(Model model) {
        model.addAttribute("book", new Book());

        return "add";
    }

    // method add book -> submit
    @RequestMapping(value="/add", method=RequestMethod.POST)
    public String addBookSubmit(@ModelAttribute("book") Book book, Model model) {
        model.addAttribute("book", new Book());
        bookService.addBook(book);

        return "redirect:/";
    }

    // form edit book
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String editBookForm(@PathVariable int id, Model model) {
        model.addAttribute("book", bookService.getBookById(id));

        return "edit";
    }

    // method edit book -> submit
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String editBookSubmit(@ModelAttribute Book book) {
        //System.out.println(book.getId());
        bookService.updateBook(book);

        return "redirect:/";
    }

    // method read -> Take book for reading, and read her
    @RequestMapping(value = "/read/{id}")
    public String readTheBook(@PathVariable int id) {
        Book book = bookService.getBookById(id);
        book.setReadAlready(true);
        bookService.updateBook(book);

        return "redirect:/";
    }

    // method remove book
    @RequestMapping("/remove/{id}")
    public String removeBook(@PathVariable int id) {
        bookService.removeBook(id);

        return "redirect:/";
    }

}
