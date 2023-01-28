package com.heima.estatemanagement.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.heima.estatemanagement.dao.CommunityMapper;
import com.heima.estatemanagement.domain.Community;
import com.heima.estatemanagement.service.CommunityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.util.StringUtil;

import java.util.*;

@Service
public class CommunityServiceImpl implements CommunityService {

    @Autowired
    private CommunityMapper communityMapper;

    @Override
    public List<Community> findAll() {
        List<Community> communities = communityMapper.selectAll();
        return communities;
    }

    @Override
    public Page<Community> search(Map searchMap) {
        //通用Mapper多条件搜索，标准写法
        Example example = new Example(Community.class);//指定查询的表tb_community
        //1.初始化分页条件
        int pageNum = 1;
        int pageSize = 2;
        if(searchMap != null){
            Example.Criteria criteria = example.createCriteria();//创建查询条件
            //时间区间
            if(StringUtil.isNotEmpty((String) searchMap.get("startTime"))){
                criteria.andGreaterThanOrEqualTo("createTime",searchMap.get("startTime"));
            }
            if(StringUtil.isNotEmpty((String) searchMap.get("endTime"))){
                criteria.andLessThanOrEqualTo("createTime",searchMap.get("endTime"));
                criteria.andLessThanOrEqualTo("createTime",searchMap.get("endTime"));
            }
            //名称模糊搜索
            if(StringUtil.isNotEmpty((String) searchMap.get("name"))){
                criteria.andLike("name", "%"+(String) searchMap.get("name")+"%");
            }
            //分页
            /*if(StringUtil.isNotEmpty((String) searchMap.get("pageNum"))){
                pageNum = Integer.parseInt((String) searchMap.get("pageNum"));
            }
            if(StringUtil.isNotEmpty((String) searchMap.get("pageSize"))){
                pageSize = Integer.parseInt((String) searchMap.get("pageSize"));
            }*/
            if((Integer) searchMap.get("pageNum") !=null){
                pageNum = (Integer) searchMap.get("pageNum");
            }
            if((Integer) searchMap.get("pageSize") !=null){
                pageSize = (Integer) searchMap.get("pageSize");
            }
        }
        PageHelper.startPage(pageNum,pageSize);//使用PageHelper插件完成分页
        Page<Community> communities = (Page<Community>) communityMapper.selectByExample(example);
        return communities;
    }

    @Override
    public Boolean add(Community community) {
        int row = communityMapper.insert(community);
        if(row>0){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public Community findById(Integer id) {
        return communityMapper.selectByPrimaryKey(id);
    }

    @Override
    public Boolean update(Community community) {
        int row = communityMapper.updateByPrimaryKeySelective(community);
        if(row>0){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public Boolean updateStatus(String status, Integer id) {
        Community community = new Community();
        community.setId(id);
        community.setStatus(status);
        int row = communityMapper.updateByPrimaryKeySelective(community);
        if(row>0){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public Boolean del(List<Integer> ids) {
        for (Integer id:ids) {
            communityMapper.deleteByPrimaryKey(id);
        }
        return true;
    }

}
