package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.FinancingLog;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2023-02-20
 */
public interface IFinancingLogService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public FinancingLog selectFinancingLogById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param financingLog 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<FinancingLog> selectFinancingLogList(FinancingLog financingLog);

    /**
     * 新增【请填写功能名称】
     * 
     * @param financingLog 【请填写功能名称】
     * @return 结果
     */
    public int insertFinancingLog(FinancingLog financingLog);

    /**
     * 修改【请填写功能名称】
     * 
     * @param financingLog 【请填写功能名称】
     * @return 结果
     */
    public int updateFinancingLog(FinancingLog financingLog);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteFinancingLogByIds(Long[] ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteFinancingLogById(Long id);

    void auditSuccess(Long id);

    void auditFail(Long id);
}
