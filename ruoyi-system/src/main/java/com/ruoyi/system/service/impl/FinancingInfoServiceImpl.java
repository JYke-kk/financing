package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.mapper.SysRoleMapper;
import com.ruoyi.system.mapper.SysUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.FinancingInfoMapper;
import com.ruoyi.system.domain.FinancingInfo;
import com.ruoyi.system.service.IFinancingInfoService;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-02-20
 */
@Service
public class FinancingInfoServiceImpl implements IFinancingInfoService 
{
    @Autowired
    private FinancingInfoMapper financingInfoMapper;

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private SysRoleMapper sysRoleMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public FinancingInfo selectFinancingInfoById(Long id)
    {
        return financingInfoMapper.selectFinancingInfoById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param financingInfo 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<FinancingInfo> selectFinancingInfoList(FinancingInfo financingInfo)
    {
        String username = SecurityUtils.getUsername();
        List<SysRole> sysRoles = sysRoleMapper.selectRolesByUserName(username);
        boolean b = sysRoles.get(0).getRoleId() == 1;
        if (!b){
            financingInfo.setUser(username);
        }
        return financingInfoMapper.selectFinancingInfoList(financingInfo);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param financingInfo 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertFinancingInfo(FinancingInfo financingInfo)
    {
        financingInfo.setCreateTime(DateUtils.getNowDate());
        return financingInfoMapper.insertFinancingInfo(financingInfo);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param financingInfo 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateFinancingInfo(FinancingInfo financingInfo)
    {
        financingInfo.setUpdateTime(DateUtils.getNowDate());
        return financingInfoMapper.updateFinancingInfo(financingInfo);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteFinancingInfoByIds(Long[] ids)
    {
        return financingInfoMapper.deleteFinancingInfoByIds(ids);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteFinancingInfoById(Long id)
    {
        return financingInfoMapper.deleteFinancingInfoById(id);
    }
}
