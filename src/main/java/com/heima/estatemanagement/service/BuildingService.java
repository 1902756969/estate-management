package com.heima.estatemanagement.service;

import com.github.pagehelper.Page;
import com.heima.estatemanagement.domain.Building;
import com.heima.estatemanagement.domain.Community;
import java.util.List;
import java.util.Map;

public interface BuildingService {

    public List<Building> findAll();

    public Page<Building> search(Map searchMap);

    public Boolean add(Building building);

    public Building findById(Integer id);

    public Boolean update(Building building);

    public Boolean del(List<Integer> ids);
}
