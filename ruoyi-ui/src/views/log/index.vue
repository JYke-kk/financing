<script src="../../api/financing/financing.js"></script>
<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch">
      <el-form-item label="项目名称" prop="projectName">
        <el-input
          v-model="queryParams.projectName"
          placeholder="请输入项目名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-table v-loading="loading" :data="financingList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="项目编号" align="center" prop="id" />
      <el-table-column label="项目名称" align="center" prop="projectName" />
      <el-table-column prop="createTime" label="创建时间" width="150" sortable>
      </el-table-column>
      <el-table-column label="众筹金额(单次)" align="center" prop="amount" />
      <el-table-column prop="pic" label="图标" min-width="80" sortable>
        <template scope="scope">
          <img :src="imgPrefix+scope.row.pic" width="50">
        </template>
      </el-table-column>
      <el-table-column label="用户名称" align="center" prop="userId" />
      <el-table-column prop="state" label="状态" width="80" sortable>
        <!-- 自定义模板：通过scope可以获取到当前行对象：scope.row -->
        <template scope="scope">
          <span style="color: green" v-if="scope.row.status==1">审核成功</span>
          <span style="color: red" v-else-if="scope.row.status==0">待审核</span>
          <span style="color: red" v-else-if="scope.row.status==2">审核失败</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope" v-if="scope.row.roleId !== 1">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-success"
            @click="auditSuccess(scope.row)"
          >审核通过</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="auditFail(scope.row)"
          >审核不通过</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改【请填写功能名称】对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="项目名称" prop="projectName">
          <el-input v-model="form.projectName" placeholder="请输入项目名称" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
    <!-- 分配角色数据权限对话框 -->

  </div>
</template>

<script>
import { listRole, getRole, delRole, addRole, updateRole, dataScope, changeRoleStatus, deptTreeSelect } from "@/api/system/role";
import { treeselect as menuTreeselect, roleMenuTreeselect } from "@/api/system/menu";
import {
  listFinancing,
  getFinancing,
  addFinancing,
  updateFinancing,
  delFinancing,
  getDelete, contributive
} from "@/api/financing/financing"

import {auditSuccess,auditFail} from "@/api/log/log"


export default {
  name: "Role",
  dicts: ['sys_normal_disable'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 角色表格数据
      financingList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      imgPrefix: "http://123.207.27.208/",
      // 是否显示弹出层（数据权限）
      openDataScope: false,
      menuExpand: false,
      menuNodeAll: false,
      deptExpand: true,
      deptNodeAll: false,
      // 日期范围
      dateRange: [],
      // 数据范围选项
      dataScopeOptions: [
        {
          value: "1",
          label: "全部数据权限"
        },
        {
          value: "2",
          label: "自定数据权限"
        },
        {
          value: "3",
          label: "本部门数据权限"
        },
        {
          value: "4",
          label: "本部门及以下数据权限"
        },
        {
          value: "5",
          label: "仅本人数据权限"
        }
      ],
      // 菜单列表
      menuOptions: [],
      // 部门列表
      deptOptions: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        status: 0,
        projectName: ''
      },
      //资源图片
      fileList: [],
      // 表单参数
      form: {},
      defaultProps: {
        children: "children",
        label: "label",

      },
      // 表单校验
      rules: {
        projectName: [
          { required: true, message: "项目名称不能为空", trigger: "blur" }
        ],
        pic: [
          { required: true, message: "项目图片不能为空", trigger: "blur" }
        ],
        amount: [
          { required: true, message: "众筹金额不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    //资源图片点击删除时的处理
    handleRemove(file, fileList) {
      if(fileList==null || fileList.length==0){
        return;
      }
      console.log("=====图片删除的回调======")
      console.log(file)

      //删除fastDfs上的图片
      var filePath =file.url; // http://123.207.27.208/group1/M00/02/1E/rBE3kWHL_GWAAv5mAADpQr0XCJA99.jpeg
      //删除接口需要：/group1/M00/02/1E/rBE3kWHL_GWAAv5mAADpQr0XCJA99.jpeg
      var path = filePath.substring(filePath.indexOf("/group1")); // /group1/M00/02/1E/rBE3kWHL_GWAAv5mAADpQr0XCJA99.jpeg
      getDelete(path).then(response => {
        this.$modal.msgSuccess("删除成功");
      });
      // /group1/M00/02/1B/rBE3kWHB-cCASterAACabDprSz419.jpeg,/group1/M00/02/1E/rBE3kWHL_GWAAv5mAADpQr0XCJA99.jpeg,/group1/M00/02/1B/rBE3kWHB-caAQ3dYAABiwl7Ttcc206.jpg
      //处理resources - 数据库操作
      if(this.form.pic){
        //["/group1/M00/02/1B/rBE3kWHB-cCASterAACabDprSz419.jpeg","/group1/M00/02/1E/rBE3kWHL_GWAAv5mAADpQr0XCJA99.jpeg"]
        var pathArr = this.form.pic.split(",");
        console.log(pathArr);
        for(var i = 0 ;i<pathArr.length;i++){
          var pathTemp = pathArr[i];
          if(pathTemp == path){ //你要删除的图片找到了
            //从下标为i的地方开始删除，删1个
            pathArr.splice(i,1);
            break;
          }
        }
        this.form.pic = pathArr.join(",");
      }

      //处理fileList - 页面回显的
      this.fileList = [];//清空
      if(this.form.pic){
        // /group1/M00/02/1B/rBE3kWHB-cCASterAACabDprSz419.jpeg,/group1/M00/02/1B/rBE3kWHB-caAQ3dYAABiwl7Ttcc206.jpg
        var resourcesArr = this.form.pic.split(",");
        for(var i=0;i<resourcesArr.length;i++){
          this.fileList.push({url:"http://123.207.27.208"+resourcesArr[i]})
        }
      }
    },
    //资源图片上传成功之后的处理
    handleSuccess(response, file, fileList){
      console.log("=====图片上传成功的回调======")
      console.log(response);  //{ success: true, message: "操作成功", resultObj: "/group1/M00/02/1E/rBE3kWHL2xmANGvhAADIJRxVcQ896.jpeg" }

      //处理resources - 数据库操作
      if(this.form.pic){ //有值  /group1/M00/00/72/rBEAA2BHkmaAbEOhAAEUusLjqqk505.png
        this.form.pic = this.form.pic + "," + response.msg;
      }else{
        this.form.pic = response.msg;
      }

      //处理fileList - 页面回显的
      this.fileList = [];//清空
      if(this.form.pic){
        // /group1/M00/02/1B/rBE3kWHB-cCASterAACabDprSz419.jpeg,/group1/M00/02/1B/rBE3kWHB-caAQ3dYAABiwl7Ttcc206.jpg
        var resourcesArr = this.form.pic.split(",");
        for(var i=0;i<resourcesArr.length;i++){
          this.fileList.push({url:"http://123.207.27.208"+resourcesArr[i]})
        }
      }
    },
    /** 查询角色列表 */
    getList() {
      this.loading = true;
      listFinancing(this.queryParams).then(response => {
        this.financingList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 查询菜单树结构 */
    getMenuTreeselect() {
      menuTreeselect().then(response => {
        this.menuOptions = response.data;
      });
    },
    // 所有菜单节点数据
    getMenuAllCheckedKeys() {
      // 目前被选中的菜单节点
      let checkedKeys = this.$refs.menu.getCheckedKeys();
      // 半选中的菜单节点
      let halfCheckedKeys = this.$refs.menu.getHalfCheckedKeys();
      checkedKeys.unshift.apply(checkedKeys, halfCheckedKeys);
      return checkedKeys;
    },
    // 所有部门节点数据
    getDeptAllCheckedKeys() {
      // 目前被选中的部门节点
      let checkedKeys = this.$refs.dept.getCheckedKeys();
      // 半选中的部门节点
      let halfCheckedKeys = this.$refs.dept.getHalfCheckedKeys();
      checkedKeys.unshift.apply(checkedKeys, halfCheckedKeys);
      return checkedKeys;
    },
    /** 根据角色ID查询菜单树结构 */
    getRoleMenuTreeselect(roleId) {
      return roleMenuTreeselect(roleId).then(response => {
        this.menuOptions = response.menus;
        return response;
      });
    },
    /** 根据角色ID查询部门树结构 */
    getDeptTree(roleId) {
      return deptTreeSelect(roleId).then(response => {
        this.deptOptions = response.depts;
        return response;
      });
    },
    // 角色状态修改
    handleStatusChange(row) {
      let text = row.status === "0" ? "启用" : "停用";
      this.$modal.confirm('确认要"' + text + '""' + row.roleName + '"角色吗？').then(function() {
        return changeRoleStatus(row.roleId, row.status);
      }).then(() => {
        this.$modal.msgSuccess(text + "成功");
      }).catch(function() {
        row.status = row.status === "0" ? "1" : "0";
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 取消按钮（数据权限）
    cancelDataScope() {
      this.openDataScope = false;
      this.reset();
    },
    // 表单重置
      reset() {
      if (this.$refs.menu != undefined) {
        this.$refs.menu.setCheckedKeys([]);
      }
      this.menuExpand = false,
      this.menuNodeAll = false,
      this.deptExpand = true,
      this.deptNodeAll = false,
      this.form = {
        id: null,
        projectName: null,
        personSum: null,
        amount: null,
        amountSum: null,
        createTime: null,
        updateTime: null,
        status: null,
        pic: null,
        userId: null
      };
        //清空列表
        this.fileList = [];
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.dateRange = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.roleId)
      this.single = selection.length!=1
      this.multiple = !selection.length
    },
    // 更多操作触发
    handleCommand(command, row) {
      switch (command) {
        case "handleDataScope":
          this.handleDataScope(row);
          break;
        case "handleAuthUser":
          this.handleAuthUser(row);
          break;
        default:
          break;
      }
    },
    // 树权限（展开/折叠）
    handleCheckedTreeExpand(value, type) {
      if (type == 'menu') {
        let treeList = this.menuOptions;
        for (let i = 0; i < treeList.length; i++) {
          this.$refs.menu.store.nodesMap[treeList[i].id].expanded = value;
        }
      } else if (type == 'dept') {
        let treeList = this.deptOptions;
        for (let i = 0; i < treeList.length; i++) {
          this.$refs.dept.store.nodesMap[treeList[i].id].expanded = value;
        }
      }
    },
    // 树权限（全选/全不选）
    handleCheckedTreeNodeAll(value, type) {
      if (type == 'menu') {
        this.$refs.menu.setCheckedNodes(value ? this.menuOptions: []);
      } else if (type == 'dept') {
        this.$refs.dept.setCheckedNodes(value ? this.deptOptions: []);
      }
    },
    // 树权限（父子联动）
    handleCheckedTreeConnect(value, type) {
      if (type == 'menu') {
        this.form.menuCheckStrictly = value ? true: false;
      } else if (type == 'dept') {
        this.form.deptCheckStrictly = value ? true: false;
      }
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加众筹项目";
    },
    /** 修改按钮操作 */
    // handleUpdate(row) {
    //   this.reset();
    //   //const roleId = row.roleId || this.ids
    //   //const roleMenu = this.getRoleMenuTreeselect(roleId);
    //   getRole(roleId).then(response => {
    //     this.form = response.data;
    //     this.open = true;
    //     this.$nextTick(() => {
    //       roleMenu.then(res => {
    //         let checkedKeys = res.checkedKeys
    //         checkedKeys.forEach((v) => {
    //             this.$nextTick(()=>{
    //                 this.$refs.menu.setChecked(v, true ,false);
    //             })
    //         })
    //       });
    //     });
    //     this.title = "修改角色";
    //   });
    // },
    /** 修改按钮操作 */
    auditSuccess(row) {
      this.reset();
      const id = row.id || this.ids
      auditSuccess(id).then(response => {
        this.getList();
        this.$modal.msgSuccess("审核成功");
      });
    },
    auditFail(row) {
      this.reset();
      const id = row.id || this.ids
      auditFail(id).then(response => {
        this.getList();
        this.$modal.msgSuccess("操作成功！！！");
      });
    },
    /** 分配数据权限操作 */
    handleDataScope(row) {
      this.reset();
      const deptTreeSelect = this.getDeptTree(row.roleId);
      getRole(row.roleId).then(response => {
        this.form = response.data;
        this.openDataScope = true;
        this.$nextTick(() => {
          deptTreeSelect.then(res => {
            this.$refs.dept.setCheckedKeys(res.checkedKeys);
          });
        });
        this.title = "分配数据权限";
      });
    },
    /** 分配用户操作 */
    handleAuthUser: function(row) {
      const roleId = row.roleId;
      this.$router.push("/system/role-auth/user/" + roleId);
    },
    /** 提交按钮 */
    // submitForm: function() {
    //   this.$refs["form"].validate(valid => {
    //     if (valid) {
    //       if (this.form.roleId != undefined) {
    //         this.form.menuIds = this.getMenuAllCheckedKeys();
    //         updateRole(this.form).then(response => {
    //           this.$modal.msgSuccess("修改成功");
    //           this.open = false;
    //           this.getList();
    //         });
    //       } else {
    //         this.form.menuIds = this.getMenuAllCheckedKeys();
    //         addRole(this.form).then(response => {
    //           this.$modal.msgSuccess("新增成功");
    //           this.open = false;
    //           this.getList();
    //         });
    //       }
    //     }
    //   });
    // },


    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateFinancing(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addFinancing(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 提交按钮（数据权限） */
    submitDataScope: function() {
      if (this.form.roleId != undefined) {
        this.form.deptIds = this.getDeptAllCheckedKeys();
        dataScope(this.form).then(response => {
          this.$modal.msgSuccess("修改成功");
          this.openDataScope = false;
          this.getList();
        });
      }
    },

    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除【请填写功能名称】编号为"' + ids + '"的数据项？').then(function() {
        return delFinancing(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    contributiveTwo(row){
      const ids = row.id || this.ids;
      this.$modal.confirm('是否出资编号为"' + ids + '"的项目？').then(function() {
        contributive(ids).then(res=>{
          this.$modal.msgSuccess("出资成功");
        })
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("出资成功");
      }).catch(() => {});

    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/role/export', {
        ...this.queryParams
      }, `role_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
