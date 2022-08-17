package com.example.pokebook.repositories;

import java.util.*;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.pokebook.models.Book;

@Repository
public interface BookRepository extends CrudRepository<Book, Long>{

	// this method retrieves all the books from the database
		List<Book> findAll();

}
