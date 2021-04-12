package Mail;

import databaseconnection.databasecon;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/update")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)

public class UpdateProfile extends HttpServlet {

    /*
     create images folder at, C:\Users\Dharmesh Mourya\Documents\NetBeansProjects\ImageProject\build\web\images
     */
    public static final String UPLOAD_DIR = "icards";
    public String dbFileName = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String utype = request.getParameter("utype");
        String name = request.getParameter("name");
        String username = request.getParameter("email");
        String password = request.getParameter("password");
        String jobrole = request.getParameter("jobrole");
        String company = request.getParameter("company");
        session.setAttribute("cname", company);
        String cmobile = request.getParameter("cmobile");
        String pmobile = request.getParameter("pmobile");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");
        String college = request.getParameter("college");

        Part part = request.getPart("icard");//
        String fileName = extractFileName(part);//file name

        /**
         * *** Get The Absolute Path Of The Web Application ****
         */
        String applicationPath = getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
        System.out.println("applicationPath:" + applicationPath);
        File fileUploadDirectory = new File(uploadPath);
        if (!fileUploadDirectory.exists()) {
            fileUploadDirectory.mkdirs();
        }
        String savePath = uploadPath + File.separator + fileName;
        System.out.println("savePath: " + savePath);
        String sRootPath = new File(savePath).getAbsolutePath();
        System.out.println("sRootPath: " + sRootPath);
        part.write(savePath + File.separator);
        File fileSaveDir1 = new File(savePath);
        /*if you may have more than one files with same name then you can calculate some random characters
         and append that characters in fileName so that it will  make your each image name identical.*/
        dbFileName = UPLOAD_DIR + File.separator +"//" +fileName;
        System.out.println("dbFileName: " + dbFileName);
        part.write(savePath + File.separator);
        //out.println(id+" "+firstName+" "+lastName+" "+fileName+" "+savePath);
        /*
         You need this loop if you submitted more than one file
         for (Part part : request.getParts()) {
         String fileName = extractFileName(part);
         part.write(savePath + File.separator + fileName);
         }*/
        try {
            if (utype.equals("recruiter")) {
                Connection con = databasecon.getconnection();
                PreparedStatement pst = con.prepareStatement("update recruiter set username ='"+username+"', password ='"+password+"', name ='"+name+"', jobrole ='"+jobrole+"',company ='"+company+"',cmobile ='"+cmobile+"',pmobile ='"+pmobile+"',address ='"+address+"',icard ='"+dbFileName+"' where username='"+username+"'");
                int i = pst.executeUpdate();
                if (i == 1) {
                    response.sendRedirect("rviewprofile.jsp?msg=Success");
                } else {
                    response.sendRedirect("rviewprofile.jsp?m3=failed");
                }
            } else {
                Connection con = databasecon.getconnection();
                PreparedStatement pst = con.prepareStatement("update user set username ='"+username+"', password ='"+password+"', name ='"+name+"', gender ='"+gender+"',college ='"+college+"',address ='"+address+"',icard ='"+dbFileName+"' where username='"+username+"'");
                int i = pst.executeUpdate();
                if (i == 1) {
                    response.sendRedirect("updateprofile.jsp?msg=Success");
                } else {
                    response.sendRedirect("updateprofile.jsp?m3=failed");
                }
            }

        } catch (Exception e) {
            out.println(e);
        }

    }
    // file name of the upload file is included in content-disposition header like this:
    //form-data; name="dataFile"; filename="PHOTO.JPG"

    private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
