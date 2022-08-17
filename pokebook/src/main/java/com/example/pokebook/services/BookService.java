package com.example.pokebook.services;

import java.util.*;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.example.pokebook.models.Book;
import com.example.pokebook.repositories.BookRepository;


@Service
public class BookService {
	// adding the book repository as a dependency
		private final BookRepository bookRepository;

		public BookService(BookRepository bookRepository) {
			this.bookRepository = bookRepository;
		}

		// returns all the books
		public List<Book> allBooks() {
			return bookRepository.findAll();
		}

		// creates a book
		public Book createBook(Book b) {
			return bookRepository.save(b);
		}
		
		// retrieves a book
		public Book findBook(Long id) {
			Optional<Book> optionalBook = bookRepository.findById(id);
			if (optionalBook.isPresent()) {
				return optionalBook.get();
			} else {
				return null;
			}

		}

		// updateBook
		public Book updateBook(Long id, @ModelAttribute("book") Book book) {
			if(findBook(id) == null) {
				return null;
			}else{
				Optional<Book> optionalBook = bookRepository.findById(id);
				Book book2 = optionalBook.get();
				book2.setExpenseName(book.getExpenseName());
				book2.setDescription(book.getDescription());
				book2.setAmount(book.getAmount());
				book2.setVendor(book.getVendor());
				
				
				return bookRepository.save(book2);
			}
			
			
		
		}

		public void deleteBook(Long id) {
			bookRepository.deleteById(id);
		}

		

		
}
