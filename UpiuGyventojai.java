package ernadas_miestai;

public class UpiuGyventojai {

		// id
		private String pavadinimas;
		private int miestu_sk;
		private int gyvena_prie_upes;
		
		public UpiuGyventojai() {

		}		
		
		public UpiuGyventojai(String pavadinimas, int miestu_sk, int gyvena_prie_upes) {
			super();
			this.pavadinimas = pavadinimas;
			this.miestu_sk = miestu_sk;
			this.gyvena_prie_upes = gyvena_prie_upes;
		}

		public String getPavadinimas() {
			return pavadinimas;
		}

		public void setPavadinimas(String pavadinimas) {
			this.pavadinimas = pavadinimas;
		}

		public int getMiestu_sk() {
			return miestu_sk;
		}

		public void setMiestu_sk(int miestu_sk) {
			this.miestu_sk = miestu_sk;
		}

		public int getGyvena_prie_upes() {
			return gyvena_prie_upes;
		}

		public void setGyvena_prie_upes(int gyvena_prie_upes) {
			this.gyvena_prie_upes = gyvena_prie_upes;
		}
		
		
}
