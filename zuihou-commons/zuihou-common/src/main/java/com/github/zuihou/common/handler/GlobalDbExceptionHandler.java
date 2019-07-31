package com.github.zuihou.common.handler;

import java.sql.SQLException;

import com.github.zuihou.base.R;
import com.github.zuihou.exception.code.ExceptionCode;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


/**
 * @author zuihou
 * @createTime 2017-12-13 17:04
 */
@ControllerAdvice(annotations = {RestController.class, Controller.class})
@ConditionalOnClass(value = {
        DataIntegrityViolationException.class
})
@ResponseBody
@Slf4j
public class GlobalDbExceptionHandler {

    @ExceptionHandler(SQLException.class)
    public R sqlException(SQLException ex) {
        log.error("SQLException:", ex);
        return R.result(ExceptionCode.SQL_EX.getCode(), null, ExceptionCode.SQL_EX.getMsg());
    }

    @ExceptionHandler(DataIntegrityViolationException.class)
    public R dataIntegrityViolationException(DataIntegrityViolationException ex) {
        log.error("DataIntegrityViolationException:", ex);
        return R.result(ExceptionCode.SQL_EX.getCode(), null, ExceptionCode.SQL_EX.getMsg());
    }

    @ExceptionHandler(PersistenceException.class)
    public R<String> persistenceException(PersistenceException ex) {
        log.error("PersistenceException:", ex);
        return R.result(ExceptionCode.SQL_EX.getCode(), "", ExceptionCode.SQL_EX.getMsg());
    }

}
