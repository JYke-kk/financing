package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 financing_info
 * 
 * @author ruoyi
 * @date 2023-02-20
 */
public class FinancingInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 用户 */
    @Excel(name = "用户")
    private String user;

    /** 数量 */
    @Excel(name = "数量")
    private Integer count;

    /** 众筹金额 */
    @Excel(name = "众筹金额")
    private Long amount;

    /** 项目id */
    @Excel(name = "项目id")
    private String finaId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUser(String user)
    {
        this.user = user;
    }

    public String getUser()
    {
        return user;
    }
    public void setCount(Integer count) 
    {
        this.count = count;
    }

    public Integer getCount() 
    {
        return count;
    }
    public void setAmount(Long amount) 
    {
        this.amount = amount;
    }

    public Long getAmount() 
    {
        return amount;
    }
    public void setFinaId(String finaId)
    {
        this.finaId = finaId;
    }

    public String getFinaId()
    {
        return finaId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("user", getUser())
            .append("count", getCount())
            .append("amount", getAmount())
            .append("finaId", getFinaId())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
