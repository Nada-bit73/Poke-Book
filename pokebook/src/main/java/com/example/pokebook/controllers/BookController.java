package com.example.pokebook.controllers;

import java.util.*;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.example.pokebook.controllers.BookController;
import com.example.pokebook.models.Book;
import com.example.pokebook.services.BookService;



@Controller
@RequestMapping("/books")
public class BookController {

	private final BookService bookService;
	public BookController(BookService bookService) {
		this.bookService = bookService;
	}
	
	@RequestMapping("")
	public String display(Model model,@ModelAttribute("book") Book book) {
		List<Book> books = bookService.allBooks();
		model.addAttribute("books", books);
		return "Book/bookpage.jsp";
	}
	
	    // create book, handle data
		@RequestMapping(value = "/create", method = RequestMethod.POST)
		public String create(@Valid @ModelAttribute("book") Book book,
				BindingResult bindingResult,
				RedirectAttributes redirectAttributes,
				Model model
				) {
			 if (bindingResult.hasErrors()) {
				 	List<Book> books = bookService.allBooks();
					model.addAttribute("books", books);
				     return "Book/bookpage.jsp";
			} else {
				bookService.createBook(book);
				redirectAttributes.addFlashAttribute("success", "Book added !");
				return "redirect:/books";
		}
		   
		}
		
		// display book data in the fields 
		@RequestMapping("/{id}/edit")
	    public String edit(@PathVariable("id") Long id, Model model) {
	        Book book = bookService.findBook(id);
	        model.addAttribute("book", book);
	        return "Book/edit.jsp";
	    }
	    
		@RequestMapping(value="/{id}", method=RequestMethod.PUT)
		public String update(@Valid @ModelAttribute("book") Book book,
				BindingResult result,
				@PathVariable("id") Long id) {
	        if (result.hasErrors()) {
	            return "Book/edit.jsp";
	        } else {
	            bookService.updateBook(id,book);
	            return "redirect:/books";
	        }
	    }
		
		
		    @RequestMapping(value="/{id}", method=RequestMethod.DELETE)
		    public String destroy(@PathVariable("id") Long id) {
		        bookService.deleteBook(id);
		        return "redirect:/books";
		    
		}
		    

			@RequestMapping("/{id}/view")
		    public String display(@PathVariable("id") Long id, Model model) {
		        Book book = bookService.findBook(id);
		        model.addAttribute("book", book);
		        return "Book/view.jsp";
		    }
}
