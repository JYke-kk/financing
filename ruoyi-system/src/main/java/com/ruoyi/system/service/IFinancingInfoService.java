package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.FinancingInfo;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2023-02-20
 */
public interface IFinancingInfoService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public FinancingInfo selectFinancingInfoById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param financingInfo 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<FinancingInfo> selectFinancingInfoList(FinancingInfo financingInfo);

    /**
     * 新增【请填写功能名称】
     * 
     * @param financingInfo 【请填写功能名称】
     * @return 结果
     */
    public int insertFinancingInfo(FinancingInfo financingInfo);

    /**
     * 修改【请填写功能名称】
     * 
     * @param financingInfo 【请填写功能名称】
     * @return 结果
     */
    public int updateFinancingInfo(FinancingInfo financingInfo);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteFinancingInfoByIds(Long[] ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteFinancingInfoById(Long id);
}
