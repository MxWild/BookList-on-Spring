package system.controller;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import system.model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import system.service.BookService;
import javax.validation.Valid;

// TODO Добавить пагинацию по странично (10 книг на странице)
// TODO Добавиь сортировку по колонкам (прочитанные, по автору, по название)

@Controller
public class BookController {

    private BookService bookService;
    private int startPage = 1;
    private int endPage = 0;
//    private int endPage = (bookService.getAllBooks().size() % 10 > 0) ? (bookService.getAllBooks().size()/10 + 1) : (bookService.getAllBooks().size());

    @Autowired
    @Qualifier(value = "bookService")
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    // List of books
    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String listAllBooks(Model model) {
        endPage = bookService.getAllBooks().size() / 10;
        if (endPage % 10 > 0) endPage++;
//        model.addAttribute("allBooks", bookService.getAllBooks());
        model.addAttribute("allBooks", bookService.getOnlyTenBooks(0));
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);

        return "index";
    }

    //TODO Нужно это сделать, вывод по страницам
    // List For Page Number N
    @RequestMapping(value = "/page", method = RequestMethod.GET)
    public String listBookOnPage(@RequestParam(value = "pageNum", required = false) Integer id, Model model) {

        model.addAttribute("allBooks", bookService.getOnlyTenBooks(id * 10 - 10));
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);

        return "page";
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
    public String addBookSubmit(@ModelAttribute("book") @Valid Book book, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "add";
        }
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
    public String editBookSubmit(@ModelAttribute @Valid Book book, BindingResult result) {
        if (result.hasErrors()) {
            return "edit";
        }
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
