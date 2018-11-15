/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lamtt.action;

import java.net.HttpURLConnection;
import java.net.URL;

/**
 *
 * @author royal
 */
public class DeleteConfigAction {
    private String id;
    private final String SUCCESS = "success";
    private final String URL_DELETE_CONFIG = "https://swd-backend-admin.herokuapp.com/configurations/%s";
    public DeleteConfigAction() {
    }
    
    public String execute() throws Exception {
        try {
            URL url = new URL(String.format(URL_DELETE_CONFIG, id));
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("DELETE");
            conn.setRequestProperty("Accept", "application/json");
            if (conn.getResponseCode() != HttpURLConnection.HTTP_OK) {
                throw new RuntimeException("Failed : HTTP error code : "
                        + conn.getResponseCode());
            }
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return SUCCESS;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    
    
}
