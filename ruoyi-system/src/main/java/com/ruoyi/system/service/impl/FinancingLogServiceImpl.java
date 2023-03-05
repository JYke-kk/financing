package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.Financing;
import com.ruoyi.system.mapper.FinancingMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.FinancingLogMapper;
import com.ruoyi.system.domain.FinancingLog;
import com.ruoyi.system.service.IFinancingLogService;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-02-20
 */
@Service
public class FinancingLogServiceImpl implements IFinancingLogService 
{
    @Autowired
    private FinancingLogMapper financingLogMapper;

    @Autowired
    private FinancingMapper financingMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public FinancingLog selectFinancingLogById(Long id)
    {
        return financingLogMapper.selectFinancingLogById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param financingLog 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<FinancingLog> selectFinancingLogList(FinancingLog financingLog)
    {
        return financingLogMapper.selectFinancingLogList(financingLog);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param financingLog 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertFinancingLog(FinancingLog financingLog)
    {
        financingLog.setCreateTime(DateUtils.getNowDate());
        return financingLogMapper.insertFinancingLog(financingLog);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param financingLog 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateFinancingLog(FinancingLog financingLog)
    {
        financingLog.setUpdateTime(DateUtils.getNowDate());
        return financingLogMapper.updateFinancingLog(financingLog);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteFinancingLogByIds(Long[] ids)
    {
        return financingLogMapper.deleteFinancingLogByIds(ids);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteFinancingLogById(Long id)
    {
        return financingLogMapper.deleteFinancingLogById(id);
    }

    @Override
    public void auditSuccess(Long id) {
        Financing financing = financingMapper.selectFinancingById(id);
        financing.setStatus(1L);
        financingMapper.updateFinancing(financing);
    }

    @Override
    public void auditFail(Long id) {
        Financing financing = financingMapper.selectFinancingById(id);
        financing.setStatus(2L);
        financingMapper.updateFinancing(financing);


    }
}
