package edu.swjtu.model;

import java.util.ArrayList;
import java.util.Set;

/**
 * 用于存储权限编号与对应的内容
 * 2016年7月10日下午5:26:15
 * @author jimolonely
 * TODO
 */
public class Powers {
	
	final static String[]power={
			"增加人员","删除人员","修改人员","查询人员",
			"增加线路","删除线路","修改线路","查询线路",
			"增加班次","删除班次","修改班次","查询班次","班次数据导出",
			"增加站点","删除站点","修改站点","查询站点","站点数据导出",
			"新车入厂","删除车辆","更新车辆信息","查询车辆信息","车辆数据导出"};
	final static String[]powerType = {
		"人员管理","线路管理","排班管理","站点管理","车辆管理"	
	};
	/**
	 * 通过ids返回所有权限
	 * 2016年7月10日下午6:09:25
	 * @author jimolonely
	 * @return
	 */
	public static ArrayList<String> getPower(String[]ids){
		ArrayList<String>list = new ArrayList<String>();
		for(String s : ids){
			int i = Integer.parseInt(s);
			list.add(power[i]);
		}
		return list;
	}
	/**
	 * 通过传过来的id返回权限大类
	 * 2016年7月10日下午6:08:35
	 * @author jimolonely
	 * @param ids
	 * @return
	 */
	public static String getPowerType(Set<Integer>ids){
		String re = "";
		for(int i : ids){
			re+=powerType[i]+" ";
		}
		return re;
	}
}
