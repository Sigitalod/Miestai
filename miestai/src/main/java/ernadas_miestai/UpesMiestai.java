package ernadas_miestai;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import java.util.List;


@Entity
public class UpesMiestai {
	
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer Id;
	
	private String miestai_id;
    
    private String upes_id;
	
	public Integer getId() {
		return Id;
	}
	
	public void setId(Integer id) {
		Id = id;
	}

	public String getMiestai_id() {
		return miestai_id;
	}

	public void setMiestai_id(String miestai_id) {
		this.miestai_id = miestai_id;
	}

	public String getUpes_id() {
		return upes_id;
	}

	public void setUpes_id(String upes_id) {
		this.upes_id = upes_id;
	}
	
}
