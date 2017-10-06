package system.model;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Entity
@Table(name = "Book")
public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private int id;

    @NotEmpty(message = "Пожалуйста заполните название книги")
    @Length(min = 3, max = 99, message = "Название книги должно быть от 3 до 100 символов")
    @Column(name = "TITLE")
    private String title;

    @NotEmpty(message = "Пожалуйста заполните описание книги")
    @Length(min = 3, max = 254, message = "Описание книги должно быть от 3 до 255 символов")
    @Column(name = "DESCRIPTION")
    private String description;

    @NotEmpty(message = "Пожалуйста заполните автора книги")
    @Length(min = 3, max = 99, message = "Поле автор книги должно быть от 3 до 100 символов")
    @Column(name = "AUTHOR")
    private String author;

    @NotEmpty(message = "Пожалуйста заполните поле ISBN")
    @Length(min = 3, max = 20, message = "Поле ISBN должно быть от 3 до 20 символов")
    @Column(name = "ISBN")
    private String isbn;

    @NotNull
    @Pattern(regexp = "[\\d]{4}", message = "Поле год должно быть в виде YYYY")
    //@NotEmpty(message = "Поле год должно быть в виде YYYY")
    @Column(name = "PRINT_YEAR")
    private String printYear = "2012";

    @Column(name = "READ_ALREADY")
    private boolean readAlready = false;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getPrintYear() {
        return printYear;
    }

    public void setPrintYear(String printYear) {
        this.printYear = printYear;
    }

    public boolean isReadAlready() {
        return readAlready;
    }

    public void setReadAlready(boolean readAlready) {
        this.readAlready = readAlready;
    }
}
