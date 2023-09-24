package com.gsm.finance.core.controller.admin;

import com.gsm.common.exception.Assert;
import com.gsm.common.exception.BusinessException;
import com.gsm.common.result.R;
import com.gsm.common.result.ResponseEnum;
import com.gsm.finance.core.entity.IntegralGrade;
import com.gsm.finance.core.service.IntegralGradeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;

/**
 * @author nightmare
 * @date 2023/9/19 9:29
 */
@Slf4j
@CrossOrigin
@RestController
@RequestMapping("/admin/core/integralGrade")
@Api(tags = "积分等级管理")
public class AdminIntegralGradeController {

    @Resource
    private IntegralGradeService integralGradeService;

    @ApiOperation("积分等级列表")
    @GetMapping("/list")
    public R listAll() {

//        log.info("hi i'm helen");
//        log.warn("warning!!!");
//        log.error("it's a error");

        List<IntegralGrade> list = integralGradeService.list();
        return R.ok().data("list", list);
    }

    @ApiOperation(value = "根据id删除积分等级", notes = "逻辑删除")
    @DeleteMapping("/remove/{id}")
    public R removeById(
            @ApiParam(value = "数据id", required = true, example = "1")
            @PathVariable Long id) {
        boolean result = integralGradeService.removeById(id);
        if (result) {
            //return R.setResult(ResponseEnum.UPLOAD_ERROR);
            return R.ok().message("删除成功");
        } else {
            return R.error().message("删除失败");
        }
    }


    @ApiOperation("新增积分等级")
    @PostMapping("/save")
    public R save(
            @ApiParam(value = "积分等级对象", required = true)
            @RequestBody IntegralGrade integralGrade){


        integralGrade.setUpdateTime(LocalDateTime.now());

        System.out.println(integralGrade);

        boolean result = integralGradeService.save(integralGrade);

        if (result) {
            return R.ok().message("保存成功");
        } else {
            return R.error().message("保存失败");
        }
    }

   /* @ApiOperation("新增积分等级")
    @PostMapping("/save")
    public R save(
            @ApiParam(value = "积分等级对象", required = true)
            @RequestBody IntegralGrade integralGrade) {

     *//*   //如果借款额度为空就手动抛出一个自定义的异常！
        if(integralGrade.getBorrowAmount().intValue() == 0){
            //BORROW_AMOUNT_NULL_ERROR(-201, "借款额度不能为空"),
            throw new BusinessException(ResponseEnum.BORROW_AMOUNT_NULL_ERROR);
        }*//*

        Assert.notNull(integralGrade.getBorrowAmount(), ResponseEnum.BORROW_AMOUNT_NULL_ERROR);

        boolean result = integralGradeService.save(integralGrade);

        if (result) {
            return R.ok().message("保存成功");
        } else {
            return R.error().message("保存失败");
        }
    }*/


    @ApiOperation("根据id获取积分等级")
    @GetMapping("/get/{id}")
    public R getById(
            @ApiParam(value = "数据id", required = true, example = "1")
            @PathVariable Long id) {
        IntegralGrade integralGrade = integralGradeService.getById(id);
        if (integralGrade != null) {
            return R.ok().data("record", integralGrade);
        } else {
            return R.error().message("数据不存在");
        }
    }


    //根据id修改
    @ApiOperation("更新积分等级")
    @PutMapping("/update")
    public R updateById(
            @ApiParam(value = "积分等级对象", required = true)
            @RequestBody IntegralGrade integralGrade) {
        boolean result = integralGradeService.updateById(integralGrade);
        if (result) {
            return R.ok().message("修改成功");
        } else {
            return R.error().message("修改失败");
        }
    }


}



