package ernadas_miestai;

import java.util.List;

import org.hibernate.Session;
// import org.hibernate.query.Query;
import javax.persistence.*;

public class UpiuGyventojaiAtaskaita {
	
	  protected Session em;	
		
	  public UpiuGyventojaiAtaskaita(  Session em  ) {
		  
		    this.em = em;
	  }	
	  
	  public List<UpiuGyventojai> upiuGyventojai( int gyvena_daugiau_negu ) {
		  
		  	String qw_upiu_gyventojai =
		  				
		  		"SELECT \r\n"
		  		+ "`upes`.*\r\n"
		  		+ ", COUNT(`miestai`.`id`)  AS `miestu_sk`\r\n"
		  		+ ", SUM(`miestai`.`gyventojai`) AS `gyvena_prie_upes`\r\n"
		  		+ "FROM \r\n"
		  		+ "	`upes` \r\n"
		  		+ "LEFT JOIN `upes_miestai` ON ( \r\n"
		  		+ "    	`upes`.`id`=`upes_miestai`.`upes_id`\r\n"
		  		+ "    )\r\n"
		  		+ "LEFT JOIN `miestai` ON (\r\n"
		  		+ "    	`upes_miestai`.`miestai_id`=`miestai`.`id`\r\n"
		  		+ "   )\r\n"
		  		+ "WHERE 1\r\n"
		  		+ "GROUP BY `upes`.`id`\r\n"
		  		+ "HAVING\r\n"
		  		+ "	`gyvena_prie_upes`>" + gyvena_daugiau_negu + "\r\n"
				+	";";
		  	System.out.println ( qw_upiu_gyventojai );
		    Query query = em.createNativeQuery ( qw_upiu_gyventojai );
		    return (List<UpiuGyventojai>) query.getResultList();
	  }	  	  

}
