package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 financing
 * 
 * @author ruoyi
 * @date 2023-02-20
 */
public class Financing extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 项目名称 */
    @Excel(name = "项目名称")
    private String projectName;

    /** 众筹人数 */
    @Excel(name = "众筹人数")
    private Long personSum;

    /** 众筹金额(单次) */
    @Excel(name = "众筹金额(单次)")
    private Integer amount;

    /** 总金额 */
    @Excel(name = "总金额")
    private Integer amountSum;

    /** 状态(1=待审核 2= 审核成功) */
    @Excel(name = "状态(0=待审核 1==审核成功，2= 审核失败)")
    private Long status;

    /** 图片 */
    @Excel(name = "图片")
    private String pic;

    /** 用户id */
    @Excel(name = "用户id")
    private String userId;

    private Integer type = 0;

    private Integer person = 0;

    public Integer getPerson() {
        return person;
    }

    public void setPerson(Integer person) {
        this.person = person;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setProjectName(String projectName) 
    {
        this.projectName = projectName;
    }

    public String getProjectName() 
    {
        return projectName;
    }
    public void setPersonSum(Long personSum) 
    {
        this.personSum = personSum;
    }

    public Long getPersonSum() 
    {
        return personSum;
    }
    public void setAmount(Integer amount)
    {
        this.amount = amount;
    }

    public Integer getAmount()
    {
        return amount;
    }
    public void setAmountSum(Integer amountSum)
    {
        this.amountSum = amountSum;
    }

    public Integer getAmountSum()
    {
        return amountSum;
    }
    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }
    public void setPic(String pic) 
    {
        this.pic = pic;
    }

    public String getPic() 
    {
        return pic;
    }
    public void setUserId(String userId)
    {
        this.userId = userId;
    }

    public String getUserId()
    {
        return userId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("projectName", getProjectName())
            .append("personSum", getPersonSum())
            .append("amount", getAmount())
            .append("amountSum", getAmountSum())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("status", getStatus())
            .append("pic", getPic())
            .append("userId", getUserId())
            .toString();
    }
}
