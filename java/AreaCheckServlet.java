import beans.History;
import model.Point;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class AreaCheckServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect(this.getServletContext().getContextPath());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        History history = (History) req.getSession().getAttribute("history");
        double x;
        double y;
        double r;
        int offset;
        try {
            x = Double.parseDouble(req.getParameter("X"));
            y = Double.parseDouble(req.getParameter("Y"));
            r = Double.parseDouble(req.getParameter("R"));
            boolean b  = x < -5 || x > 3 || y < -3 || y > 3 || (r != 1 && r != 2 && r != 3 && r != 4 && r != 5);
            if (b) {
                throw new NumberFormatException();
            }
        } catch (NumberFormatException e) {
            resp.getWriter().println("<h1>Incorrect parameters</h1>");
            return;
        }
        try {
            offset = Integer.parseInt(req.getParameter("offset"));
        } catch (NumberFormatException e) {
            offset = 0;
        }

        Point point = new Point(x, y, r, offset);
        PrintWriter out = resp.getWriter();


        if (req.getParameter("type") != null && req.getParameter("type").equals("ajax")) {
            history.addPoint(point);
            resp.setContentType("text/json; charset=UTF-8");
            out.println("{\"x\": " + point.getX() + ", \"y\": " + point.getY() + ", \"r\": " + point.getR() + ", \"inArea\": \"" + point.isInArea() + "\", \"time\": \"" + point.getTime() + "\"}");
        } else if (req.getParameter("type") != null && req.getParameter("type").equals("ajax-no-cache")) {
            resp.setContentType("text/json; charset=UTF-8");
            out.println("{\"x\": " + point.getX() + ", \"y\": " + point.getY() + ", \"r\": " + point.getR() + ", \"inArea\": \"" + point.isInArea() + "\", \"time\": \"" + point.getTime() + "\"}");
        }


    }


}
