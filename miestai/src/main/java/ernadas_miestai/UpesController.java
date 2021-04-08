package ernadas_miestai;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UpesController {
	
	@Autowired
	private UpesRepository upes_repository;	
	
	@RequestMapping(path="/upes", method={ RequestMethod.GET, RequestMethod.POST })
    public String upes(@RequestParam(name="id", required=false, defaultValue="0") Integer id 
			, @RequestParam(name="pav", required=false, defaultValue="") String pav
			, @RequestParam(name="saugoti", required=false, defaultValue="nesaugoti") String saugoti			
			, Model model) {
		
		String res = "Neatlikta";
		
		Upes upes = new Upes();
		
		if ( saugoti.equals( "saugoti" ) ) {
		
			if (id > 0) {
				
				Optional <Upes> found = upes_repository.findById( id );
			
				// variantas trynimuiui
				// uzsakymaiRepository.deleteById(id);
			
				if ( found.isPresent() ) {
				
				   upes = found.get();
				   upes.setId ( id );
				   
				} else {
					
					res = "Klaida įrašas galėjoi būti pašalintas";
				}
			}	
			
		    upes.setPavadinimas( pav );


		  
		    upes_repository.save ( upes );
		    res = "Saugota";
		    
		}
    	model.addAttribute("upes", upes_repository.findAll() );
    	model.addAttribute("res", res );		
   
		return "upes";	
	}		
}



