package com.github.zuihou.authority.dto.common;

import java.io.Serializable;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.github.zuihou.base.entity.SuperEntity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;
import org.hibernate.validator.constraints.Length;

/**
 * <p>
 * 实体类
 * 字典目录
 * </p>
 *
 * @author zuihou
 * @since 2019-07-28
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = false)
@Builder
@ApiModel(value = "DictionaryUpdateDTO", description = "字典目录")
public class DictionaryUpdateDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @NotNull(message = "id不能为空", groups = SuperEntity.Update.class)
    private Long id;

    /**
     * 编码
     * 一颗树仅仅有一个统一的编码
     */
    @ApiModelProperty(value = "编码")
    @NotEmpty(message = "编码不能为空")
    @Length(max = 64, message = "编码长度不能超过64")

    private String code;
    /**
     * 父级id
     * 顶级的字典父级id是自己
     */
    @ApiModelProperty(value = "父级id")
    @NotNull(message = "父级id不能为空")

    private Long parentId;
    /**
     * 字典名称
     */
    @ApiModelProperty(value = "字典名称")
    @NotEmpty(message = "字典名称不能为空")
    @Length(max = 64, message = "字典名称长度不能超过64")

    private String name;
    /**
     * 字典描述
     */
    @ApiModelProperty(value = "字典描述")
    @Length(max = 200, message = "字典描述长度不能超过200")

    private String describe;
    /**
     * 是否启用
     */
    @ApiModelProperty(value = "是否启用")

    private Boolean isEnable;
    /**
     * 是否删除
     */
    @ApiModelProperty(value = "是否删除")

    private Boolean isDelete;

}
