package ernadas_miestai;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

@Controller
public class AtaskaitosController {
	
	@Autowired 
	EntityManagerFactory factory;	
	
	// @Bean
	public SessionFactory sessionFactory() {

		
	        if (factory.unwrap(SessionFactory.class) == null) {
	            throw new NullPointerException("factory is not a hibernate factory");
	        }
	        return factory.unwrap(SessionFactory.class);
	}	

	
	@RequestMapping(path="/upiu-gyventojai", method={ RequestMethod.GET, RequestMethod.POST })
    public String miestai( @RequestParam(name="gyvena_daugiau_negu", required=false, defaultValue="0") Integer gyvena_daugiau_negu 
			, @RequestParam(name="ieskoti", required=false, defaultValue="neieskoti") String ieskoti			
			, Model model) {
		
		String rez = "Neatlikta";
		
		Miestai miestas = new Miestai();
		
		if ( gyvena_daugiau_negu == null ) {
			
			gyvena_daugiau_negu = 100000;
			

		    rez = "Saugoti";
		    
		}
		
		Session session = this.sessionFactory().openSession();
		
		UpiuGyventojaiAtaskaita top_patieklai_ataskaita =  new UpiuGyventojaiAtaskaita( session );
        model.addAttribute("lst_upiu_gyventojai", top_patieklai_ataskaita.upiuGyventojai( gyvena_daugiau_negu ) ); 		
		return "upiu_gyventojai";
	}	
}
