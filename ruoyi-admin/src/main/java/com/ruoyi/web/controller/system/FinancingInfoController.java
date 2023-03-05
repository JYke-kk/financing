package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.FinancingInfo;
import com.ruoyi.system.service.IFinancingInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 【请填写功能名称】Controller
 * 
 * @author ruoyi
 * @date 2023-02-20
 */
@RestController
@RequestMapping("/system/info")
public class FinancingInfoController extends BaseController
{
    @Autowired
    private IFinancingInfoService financingInfoService;

    /**
     * 查询【请填写功能名称】列表
     */
    @GetMapping("/list")
    public TableDataInfo list(FinancingInfo financingInfo)
    {
        startPage();
        List<FinancingInfo> list = financingInfoService.selectFinancingInfoList(financingInfo);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FinancingInfo financingInfo)
    {
        List<FinancingInfo> list = financingInfoService.selectFinancingInfoList(financingInfo);
        ExcelUtil<FinancingInfo> util = new ExcelUtil<FinancingInfo>(FinancingInfo.class);
        util.exportExcel(response, list, "【请填写功能名称】数据");
    }

    /**
     * 获取【请填写功能名称】详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(financingInfoService.selectFinancingInfoById(id));
    }

    /**
     * 新增【请填写功能名称】
     */
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FinancingInfo financingInfo)
    {
        return toAjax(financingInfoService.insertFinancingInfo(financingInfo));
    }

    /**
     * 修改【请填写功能名称】
     */
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FinancingInfo financingInfo)
    {
        return toAjax(financingInfoService.updateFinancingInfo(financingInfo));
    }

    /**
     * 删除【请填写功能名称】
     */
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @PreAuthorize("@ss.hasPermi('system:financingInfo:remove')")
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(financingInfoService.deleteFinancingInfoByIds(ids));
    }
}
