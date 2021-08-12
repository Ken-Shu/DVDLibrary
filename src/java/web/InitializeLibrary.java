package web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import model.DVDItem;

public class InitializeLibrary implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        String libraryFile = context.getInitParameter("libraryFile");
        List<DVDItem> dvdList = new LinkedList<>();
        try (InputStream is = context.getResourceAsStream(libraryFile);
                BufferedReader br = new BufferedReader(new InputStreamReader(is))) {
            String record;
            while ((record = br.readLine()) != null) {
                try {
                    String [] data = record.split("\\|");
                    DVDItem dvd = new DVDItem(data[0], data[1], data[2]);
                    dvdList.add(dvd);
                } catch (Exception e) {
                    context.log("資料錯誤" + record);
                }
            }
            
            context.setAttribute("DVDList", dvdList);
            context.log("檔案載入成功");
        } catch (IOException e) {
            context.log("處理檔案失敗" + e);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        sce.getServletContext().log("Context Destoryed");
    }
}
