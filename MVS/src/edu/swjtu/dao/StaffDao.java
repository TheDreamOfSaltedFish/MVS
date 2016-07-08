package edu.swjtu.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import edu.swjtu.model.Staff;

/**
 * 
 * StaffDao.java��
 * 2016��7��8��
 * @author wujunyu
 * TODo
 */
public interface StaffDao {

	/**
	 * 
	 * 2016��7��8������4:21:55
	 * @author wujunyu
	 * TODO ���һ��Ա��
	 * @param staff
	 * @param con
	 * @return
	 */
	public int addOneStaff(Staff staff,Connection con);
	/**
	 * 
	 * 2016��7��8������4:22:58
	 * @author wujunyu
	 * TODO ���һȺԱ��
	 * @param staffList
	 * @param con
	 * @return
	 */
	public int addListStaff(ArrayList<Staff> staffList,Connection con);
	/**
	 * 
	 * 2016��7��8������4:24:15
	 * @author wujunyu
	 * TODO ɾ��һ��Ա��
	 * @param staffId
	 * @param con
	 * @return
	 */
	public int deleteOneStaff(int staffId,Connection con);
	/**
	 * 
	 * 2016��7��8������4:26:20
	 * @author wujunyu
	 * TODO ɾ��һȺԱ��
	 * @param staffList
	 * @param con
	 * @return
	 */
	public int deleteListStaff(ArrayList<Staff> staffList, Connection con);
	/**
	 * 
	 * 2016��7��8������4:28:16
	 * @author wujunyu
	 * TODO ����Ա����Ϣ
	 * @param staff
	 * @param con
	 * @return
	 */
	public int updateStaff(Staff staff, Connection con);
	
	/**
	 * 
	 * 2016��7��8������4:28:37
	 * @author wujunyu
	 * TODO ����id��ѯԱ��
	 * @param staffId
	 * @param con
	 * @return
	 */
	public Staff getStaffByStaffId(int staffId,Connection con);
	/**
	 * 
	 * 2016��7��8������4:37:19
	 * @author wujunyu
	 * TODO ���ݹ��Ų�ѯԱ��
	 * @param staffId
	 * @param con
	 * @return
	 */
	public Staff getStaffByNumber(String number,Connection con);
	/**
	 * 
	 * 2016��7��8������4:38:01
	 * @author wujunyu
	 * TODO ����Ա��������ѯԱ��
	 * @param name
	 * @param con
	 * @return
	 */
	public ArrayList getStaffByName(String name,Connection con);
	/**
	 * 
	 * 2016��7��8������4:38:47
	 * @author wujunyu
	 * TODO ���ݲ��Ų�ѯԱ��
	 * @param department
	 * @param con
	 * @return
	 */
	public ArrayList  getStaffByDepartment(String department,Connection con);
	/**
	 * 
	 * 2016��7��8������4:39:07
	 * @author wujunyu
	 * TODO ��������ѯԱ��
	 * @param group
	 * @param con
	 * @return
	 */
	public ArrayList getStaffByGroup(String group,Connection con);
	/**
	 * 
	 * 2016��7��8������4:39:23
	 * @author wujunyu
	 * TODO ���ݰ��id��ѯԱ��
	 * @param arrangeId
	 * @param con
	 * @return
	 */
	public ArrayList  getStaffByArrangeId(int arrangeId,Connection con);
	/**
	 * 
	 * 2016��7��8������4:39:56
	 * @author wujunyu
	 * TODO ������·id��ѯԱ��
	 * @param lineId
	 * @param con
	 * @return
	 */
	public ArrayList getStaffByLineId(int lineId,Connection con);
	/**
	 * 
	 * 2016��7��8������4:40:15
	 * @author wujunyu
	 * TODO ����վ��id��ѯԱ��
	 * @param siteId
	 * @param con
	 * @return
	 */
	public ArrayList getStaffBySiteId(int siteId,Connection con);
}
