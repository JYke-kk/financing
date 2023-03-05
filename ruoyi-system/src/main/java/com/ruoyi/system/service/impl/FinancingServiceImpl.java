package com.ruoyi.system.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.FinancingInfo;
import com.ruoyi.system.mapper.FinancingInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.FinancingMapper;
import com.ruoyi.system.domain.Financing;
import com.ruoyi.system.service.IFinancingService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-02-20
 */
@Service
public class FinancingServiceImpl implements IFinancingService 
{
    @Autowired
    private FinancingMapper financingMapper;

    @Autowired
    private FinancingInfoMapper financingInfoMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public Financing selectFinancingById(Long id)
    {
        return financingMapper.selectFinancingById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param financing 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<Financing> selectFinancingList(Financing financing)
    {
        List<Financing> financings = financingMapper.selectFinancingList(financing);
        return financings;
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param financing 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertFinancing(Financing financing)
    {
        String username = SecurityUtils.getUsername();
        financing.setCreateTime(DateUtils.getNowDate());
        financing.setAmountSum(financing.getAmount());
        financing.setPersonSum(0L);
        financing.setUserId(username);
        financing.setStatus(0L);
        return financingMapper.insertFinancing(financing);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param financing 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateFinancing(Financing financing)
    {
        boolean equals = SecurityUtils.getUsername().equals(financing.getUserId());
        if (financing.getPerson() != 1){
            if (equals){
                throw new RuntimeException("没有权限");
            }
        }
        financing.setUpdateTime(DateUtils.getNowDate());
        return financingMapper.updateFinancing(financing);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteFinancingByIds(Long[] ids)
    {
        return financingMapper.deleteFinancingByIds(ids);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteFinancingById(Long id)
    {
        return financingMapper.deleteFinancingById(id);
    }

    @Override
    @Transactional
    public void contributive(Long id) {
        String username = SecurityUtils.getUsername();
        Financing financing = selectFinancingById(id);
        FinancingInfo financingInfo = new FinancingInfo();
        financingInfo.setFinaId(financing.getProjectName());
        financingInfo.setUser(username);
        financingInfo.setAmount(1L);
        financingInfo.setCount(1);
        financingInfo.setAmount(financingInfo.getAmount());
        financingInfo.setCreateTime(new Date());
        financingInfoMapper.insertFinancingInfo(financingInfo);
        financing.setPersonSum(financing.getPersonSum() + 1);
        financing.setAmountSum((int) (financing.getPersonSum() * financing.getAmount()));
        financing.setPerson(1);
        updateFinancing(financing);
    }
}
