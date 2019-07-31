//package com.github.zuihou.authority.controller.auth;
//
//
//import com.baomidou.mybatisplus.core.metadata.IPage;
//import com.github.zuihou.authority.dto.auth.UserRoleSaveDTO;
//import com.github.zuihou.authority.dto.auth.UserRoleUpdateDTO;
//import com.github.zuihou.authority.entity.auth.UserRole;
//import com.github.zuihou.authority.service.auth.UserRoleService;
//import com.github.zuihou.base.BaseController;
//import com.github.zuihou.base.R;
//import com.github.zuihou.base.entity.SuperEntity;
//import com.github.zuihou.database.mybatis.conditions.Wraps;
//import com.github.zuihou.database.mybatis.conditions.query.LbqWrapper;
//import com.github.zuihou.dozer.DozerUtils;
//import com.github.zuihou.log.annotation.SysLog;
//
//import io.swagger.annotations.Api;
//import io.swagger.annotations.ApiOperation;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.validation.annotation.Validated;
//import org.springframework.web.bind.annotation.DeleteMapping;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.PutMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
///**
// * <p>
// * 前端控制器
// * 角色分配
// * 账号角色绑定
// * </p>
// *
// * @author zuihou
// * @date 2019-07-22
// */
//@Slf4j
//@Validated
//@RestController
//@RequestMapping("/userRole")
//@Api(value = "UserRole", tags = "角色分配账号角色绑定")
//public class UserRoleController extends BaseController {
//
//    @Autowired
//    private UserRoleService userRoleService;
//    @Autowired
//    private DozerUtils dozer;
//
//    /**
//     * 分页查询角色分配
//     *
//     * @param data 分页查询对象
//     * @return 查询结果
//     */
//    @ApiOperation(value = "分页查询角色分配", notes = "分页查询角色分配")
//    @GetMapping("/page")
//    @SysLog("分页查询角色分配")
//    public R<IPage<UserRole>> page(UserRole data) {
//        IPage<UserRole> page = getPage();
//        // 构建值不为null的查询条件
//        LbqWrapper<UserRole> query = Wraps.lbQ(data);
//        userRoleService.page(page, query);
//        return success(page);
//    }
//
//    /**
//     * 查询角色分配
//     *
//     * @param id 主键id
//     * @return 查询结果
//     */
//    @ApiOperation(value = "查询角色分配", notes = "查询角色分配")
//    @GetMapping("/{id}")
//    @SysLog("查询角色分配")
//    public R<UserRole> get(@PathVariable Long id) {
//        return success(userRoleService.getById(id));
//    }
//
//    /**
//     * 新增角色分配
//     *
//     * @param data 新增对象
//     * @return 新增结果
//     */
//    @ApiOperation(value = "新增角色分配", notes = "新增角色分配不为空的字段")
//    @PostMapping
//    @SysLog("新增角色分配")
//    public R<UserRole> save(@RequestBody @Validated UserRoleSaveDTO data) {
//        UserRole userRole = dozer.map(data, UserRole.class);
//        userRoleService.save(userRole);
//        return success(userRole);
//    }
//
//    /**
//     * 修改角色分配
//     *
//     * @param data 修改对象
//     * @return 修改结果
//     */
//    @ApiOperation(value = "修改角色分配", notes = "修改角色分配不为空的字段")
//    @PutMapping
//    @SysLog("修改角色分配")
//    public R<UserRole> update(@RequestBody @Validated(SuperEntity.Update.class) UserRoleUpdateDTO data) {
//        UserRole userRole = dozer.map(data, UserRole.class);
//        userRoleService.updateById(userRole);
//        return success(userRole);
//    }
//
//    /**
//     * 删除角色分配
//     *
//     * @param id 主键id
//     * @return 删除结果
//     */
//    @ApiOperation(value = "删除角色分配", notes = "根据id物理删除角色分配")
//    @DeleteMapping(value = "/{id}")
//    @SysLog("删除角色分配")
//    public R<Boolean> delete(@PathVariable Long id) {
//        userRoleService.removeById(id);
//        return success(true);
//    }
//
//}
