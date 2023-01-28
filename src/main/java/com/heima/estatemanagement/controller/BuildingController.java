package com.heima.estatemanagement.controller;

import com.github.pagehelper.Page;
import com.heima.estatemanagement.common.MessageConstant;
import com.heima.estatemanagement.common.PageResult;
import com.heima.estatemanagement.common.Result;
import com.heima.estatemanagement.common.StatusCode;
import com.heima.estatemanagement.domain.Building;
import com.heima.estatemanagement.domain.Community;
import com.heima.estatemanagement.service.BuildingService;
import com.heima.estatemanagement.service.CommunityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * @Auth: axing
 * @Desc:
 */
@RestController
@RequestMapping("/building")
public class BuildingController {
    
    @Autowired
    private BuildingService buildingService;

    @RequestMapping("/find")
    public Result find(){
        List<Building> all = buildingService.findAll();
        return new Result(false,200,"请求成功adasdasdas",all);
    }
    @RequestMapping("/search")
    public PageResult search(@RequestBody Map searchMap){
        Page<Building> page = buildingService.search(searchMap);
        return new PageResult(true, StatusCode.OK, MessageConstant.COMMUNITY_SEARCH_SUCCESS,page.getResult(),page.getTotal());
    }

    @RequestMapping("/add")
    public Result add(@RequestBody Building community){
        Boolean add = buildingService.add(community);
        return new Result(true,StatusCode.OK,MessageConstant.COMMUNITY_ADD_SUCCESS);
    }
    @RequestMapping("/findById")
    public Result findById(Integer id){
        Building community = buildingService.findById(id);
        return new Result(true,StatusCode.OK,MessageConstant.COMMUNITY_FIND_BY_ID_SUCCESS,community);
    }

    @RequestMapping("/update")
    public Result update(@RequestBody Building community){
        Boolean add = buildingService.update(community);
        return new Result(true,StatusCode.OK,MessageConstant.COMMUNITY_UPDATE_SUCCESS);
    }

    @RequestMapping("/del")
    public Result del(@RequestBody List<Integer> ids){
        Boolean flag = buildingService.del(ids);
        return new Result(true,StatusCode.OK,MessageConstant.COMMUNITY_DELETE_SUCCESS);
    }
}
