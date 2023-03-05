package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 financing_log
 * 
 * @author ruoyi
 * @date 2023-02-20
 */
public class FinancingLog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 项目id */
    @Excel(name = "项目id")
    private Long financingId;

    /** 管理员id */
    @Excel(name = "管理员id")
    private Long sysuserId;

    /** 状态(1=审核成功 2=审核失败) */
    @Excel(name = "状态(1=审核成功 2=审核失败)")
    private Long status;

    /** 备注 */
    @Excel(name = "备注")
    private String note;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setFinancingId(Long financingId) 
    {
        this.financingId = financingId;
    }

    public Long getFinancingId() 
    {
        return financingId;
    }
    public void setSysuserId(Long sysuserId) 
    {
        this.sysuserId = sysuserId;
    }

    public Long getSysuserId() 
    {
        return sysuserId;
    }
    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }
    public void setNote(String note) 
    {
        this.note = note;
    }

    public String getNote() 
    {
        return note;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("financingId", getFinancingId())
            .append("sysuserId", getSysuserId())
            .append("status", getStatus())
            .append("note", getNote())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
