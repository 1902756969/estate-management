package com.heima.estatemanagement.domain;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
 * @Auth: axing
 * @Desc: 小区实体类（具体属性含义，可以参考小区表tb_community）
 */
@Table(name="tb_community")
public class Community implements Serializable {

    @Id
    private Integer id;

    private String code;
    private String name;
    private String address;
    private Double area;
    private Integer totalBuildings;
    private Integer totalHouseholds;
    private Integer greeningRate;
    private String thumbnail;
    private String developer;
    private String estateCompany;
    private Date createTime;
    private Date updateTime;
    private String status;

    //getter/setter生成快捷键 [Alt+Shift+S]

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Double getArea() {
        return area;
    }

    public void setArea(Double area) {
        this.area = area;
    }

    public Integer getTotalBuildings() {
        return totalBuildings;
    }

    public void setTotalBuildings(Integer totalBuildings) {
        this.totalBuildings = totalBuildings;
    }

    public Integer getTotalHouseholds() {
        return totalHouseholds;
    }

    public void setTotalHouseholds(Integer totalHouseholds) {
        this.totalHouseholds = totalHouseholds;
    }

    public Integer getGreeningRate() {
        return greeningRate;
    }

    public void setGreeningRate(Integer greeningRate) {
        this.greeningRate = greeningRate;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getDeveloper() {
        return developer;
    }

    public void setDeveloper(String developer) {
        this.developer = developer;
    }

    public String getEstateCompany() {
        return estateCompany;
    }

    public void setEstateCompany(String estateCompany) {
        this.estateCompany = estateCompany;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
