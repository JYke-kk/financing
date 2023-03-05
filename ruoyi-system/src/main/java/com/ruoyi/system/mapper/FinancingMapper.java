package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Financing;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2023-02-20
 */
public interface FinancingMapper 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public Financing selectFinancingById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param financing 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<Financing> selectFinancingList(Financing financing);

    /**
     * 新增【请填写功能名称】
     * 
     * @param financing 【请填写功能名称】
     * @return 结果
     */
    public int insertFinancing(Financing financing);

    /**
     * 修改【请填写功能名称】
     * 
     * @param financing 【请填写功能名称】
     * @return 结果
     */
    public int updateFinancing(Financing financing);

    /**
     * 删除【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteFinancingById(Long id);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFinancingByIds(Long[] ids);
}
