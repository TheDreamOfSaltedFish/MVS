package edu.swjtu.dao;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import edu.swjtu.model.Admin;

/**
 * 
 * AdminDao.java��
 * 2016��6��20��
 * @author wujunyu
 * TODo
 */
public interface AdminDao {
	/**
	 * 
	 * 2016��6��20������8:52:18
	 * @author wujunyu
	 * TODO ���ӽ�ɫ
	 * @param admin
	 * @param con
	 * @return int
	 * @throws SQLException
	 */
	public int addAdmin(Admin admin,Connection con) throws SQLException;
	/**
	 * 
	 * 2016��6��20������8:53:12
	 * @author wujunyu
	 * TODO  ����adminIdɾ����ɫ
	 * @param id
	 * @param con
	 * @return
	 * @throws SQLException
	 */
	public int deleteAdmin(int adminId,Connection con) throws SQLException;
	/**
	 * 
	 * 2016��6��20������8:56:12
	 * @author wujunyu
	 * TODO		���½�ɫ
	 * @param adminId
	 * @param admnin
	 * @param con
	 * @return
	 * @throws SQLException
	 */
	public int updateAdmin(Admin admin,Connection con) throws SQLException;
	/**
	 * 
	 * 2016��6��20������8:56:56
	 * @author wujunyu
	 * TODO		����adminId�õ���ɫ
	 * @param id
	 * @param con
	 * @return	
	 * @throws SQLException
	 */
	public Admin getAdminById(int adminId,Connection con) throws SQLException;
	/**
	 * 
	 * 2016��6��20������8:57:25
	 * @author wujunyu
	 * TODO	�õ����н�ɫ��Ϣ�������б�
	 * @param con
	 * @return list
	 * @throws SQLException
	 */
	public ArrayList getAllAdmin(Connection con) throws SQLException;
}
