package tags;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class TagHandaler extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	public int doStartTag() {
		try {
			JspWriter out=pageContext.getOut();
			out.println("<h1>This is my custom tag</h1>");
		}catch(Exception e) {
			
		}
		
		return SKIP_BODY;
		
	}
	

}
