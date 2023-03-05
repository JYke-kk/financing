package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.web.controller.util.FastDfsUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

/**
 * 店铺logo上传
 */
@RestController
@RequestMapping("/dev-api/fastDfs/fastDfs")
public class FastDfsController {
    /**
     * 上传的接口
     * @param file
     * @return
     * @RequestPart：接收的是一个文件
     * required = true:必须上传一个文件
     */
    @PostMapping
    public AjaxResult upload(@RequestPart(value = "file",required = true) MultipartFile file){
        try {
            // 获取原始文件名称  saldfja.lsfsd.jpg
            String originalFilename = file.getOriginalFilename();
            // 获取文件的后缀，不要.
            String substring = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
            // 调用工具类中的upload方法
            String path = FastDfsUtils.upload(file.getBytes(), substring);
            //4.把path返回给前端
            System.out.println(path);
            return AjaxResult.success(path);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("上传失败");
        }
    }
    /**
     * 删除的接口
     * @RequestParam：接收请求参数11111
     * path:/group1/M00/00/E5/CgAIC2LdAZKAU79IAAMbwtByyoU518.jpg
     */
    @DeleteMapping
    public AjaxResult delete(@RequestParam(value = "path",required = true) String path){
        try {
            //截取索引1后面的全部
            String pathTmp = path.substring(1); // goup1/xxxxx/yyyy
            System.out.println(pathTmp);
            //截取索引0开始,第一个“/”结束
            String groupName =  pathTmp.substring(0, pathTmp.indexOf("/")); //goup1
            //截取第一个“/” 后面全部的
            String remotePath = pathTmp.substring(pathTmp.indexOf("/")+1);// M00/00/E5/CgAIC2LdAZKAU79IAAMbwtByyoU518.jpg
            //参数一:group1 参数二:/M00/00/E5/CgAIC2LdAZKAU79IAAMbwtByyoU518.jpg
            FastDfsUtils.delete(groupName, remotePath);
            return  AjaxResult.success();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("删除失败");
        }
    }
}
