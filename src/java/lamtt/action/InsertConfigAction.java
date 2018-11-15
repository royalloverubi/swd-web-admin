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
import lamtt.dto.ConfigurationDTO;
import lamtt.dto.CyberGamingDTO;

/**
 *
 * @author royal
 */
public class InsertConfigAction {
    private final String URL_INSERT_CONFIG = "https://swd-backend-admin.herokuapp.com/configurations";
    private final String SUCCESS = "success";
    private String id;
    private String name;
    private String cpu;
    private String gpu;
    private String ram;
    private String mouse;
    private String keyboard;
    private String headphone;
    private String price;
    public InsertConfigAction() {
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        CyberGamingDTO cyberGamingDTO = (CyberGamingDTO) session.get("CYBERDETAIL");
        ConfigurationDTO dto = new ConfigurationDTO(null, name, cyberGamingDTO.getId(), cpu, gpu, ram, mouse, keyboard, headphone, Double.parseDouble(price), Boolean.TRUE, Boolean.FALSE);
        Gson gson = new Gson();
        String json = gson.toJson(dto);
        try {
            URL url = new URL(URL_INSERT_CONFIG);
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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getCpu() {
        return cpu;
    }

    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    public String getGpu() {
        return gpu;
    }

    public void setGpu(String gpu) {
        this.gpu = gpu;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public String getMouse() {
        return mouse;
    }

    public void setMouse(String mouse) {
        this.mouse = mouse;
    }

    public String getKeyboard() {
        return keyboard;
    }

    public void setKeyboard(String keyboard) {
        this.keyboard = keyboard;
    }

    public String getHeadphone() {
        return headphone;
    }

    public void setHeadphone(String headphone) {
        this.headphone = headphone;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    
    
    
    
}
