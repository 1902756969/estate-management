package com.heima.estatemanagement.dao;

import com.heima.estatemanagement.domain.Building;
import com.heima.estatemanagement.domain.Community;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

@Repository
public interface BuildingMapper extends Mapper<Building> {
}
