/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lamtt.action;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;
import lamtt.dto.CyberGamingDTO;
import lamtt.dto.RoomDTO;

/**
 *
 * @author royal
 */
public class InsertRoomAction {
    private final String URL_INSERT_ROOM = "https://swd-backend-admin.herokuapp.com/rooms";
    private final String SUCCESS = "success";
    private String name;
    private String description;
    private String price;
    public InsertRoomAction() {
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        CyberGamingDTO cyberGamingDTO = (CyberGamingDTO) session.get("CYBERDETAIL");
        RoomDTO dto = new RoomDTO();
        dto.setName(name);
        dto.setDescription(description);
        dto.setPrice(Double.parseDouble(price));
        dto.setCyberGamingId(cyberGamingDTO.getId());
        dto.setActive(Boolean.TRUE);
        dto.setDeleted(Boolean.FALSE);
        Gson gson = new Gson();
        String json = gson.toJson(dto);
        try {
            URL url = new URL(URL_INSERT_ROOM);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            conn.setRequestProperty("Content-Type", "application/json");
            OutputStream os = conn.getOutputStream();
            os.write(json.getBytes());
            os.flush();
            if (conn.getResponseCode() != HttpURLConnection.HTTP_OK) {
                throw new RuntimeException("Failed : HTTP error code : "
                        + conn.getResponseCode());
            }
            conn.disconnect();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return SUCCESS;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }
    
    
    
}
