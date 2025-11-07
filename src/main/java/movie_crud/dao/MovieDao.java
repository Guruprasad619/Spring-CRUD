package movie_crud.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import movie_crud.entity.Movie;

@Component
public class MovieDao {
	
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("m17");
	EntityManager manager = factory.createEntityManager();
	EntityTransaction ef = manager.getTransaction();
	
	public void save(Movie movie) {
		ef.begin();
		manager.persist(movie);
		ef.commit();
		
	}
	public List<Movie> getMovies(){
		return manager.createNativeQuery("select distinct * from movie",Movie.class).getResultList();
	}
	
	public Movie findById(int id) {
		return manager.find(Movie.class, id);
	}
	public void delete(int id) {
		ef.begin();
		manager.remove(findById(id));
		ef.commit();
	}
	public void update(Movie movie) {
		ef.begin();
		manager.merge(movie);
		ef.commit();
		
	}

}