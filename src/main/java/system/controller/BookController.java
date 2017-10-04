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

    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String listAllBooks(Model model) {
        model.addAttribute("allBooks", bookService.getAllBooks());

        return "index";
    }

    @RequestMapping(value="/add", method=RequestMethod.GET)
    public String addBookForm(Model model) {
        model.addAttribute("book", new Book());

        return "add";
    }

    @RequestMapping(value="/add", method=RequestMethod.POST)
    public String addBookSubmit(@ModelAttribute("book") Book book, Model model) {
        model.addAttribute("book", new Book());
        bookService.addBook(book);

        return "redirect:/";
    }
}
