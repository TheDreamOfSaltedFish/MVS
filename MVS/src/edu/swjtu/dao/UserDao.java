package edu.swjtu.dao;
import java.sql.Connection;
import java.sql.SQLException;

import edu.swjtu.model.User;

/**
 * δ���
 * 2016��6��7������6:33:16
 * @author jimolonely
 * TODO
 */
public interface UserDao {
	/**
	 * ��½��֤
	 * 2016��6��7������6:48:34
	 * @author jimolonely
	 * @param user
	 * @param con
	 * @return ʧ���򷵻�null
	 */
	public User login(User user,Connection con);
	/**
	 * ����һ���û�
	 * 2016��6��7������6:47:44
	 * @author jimolonely
	 * @param user
	 * @param con
	 * @return ������Ӱ�������
	 * @throws SQLException
	 */
	public int addUser(User user,Connection con) throws SQLException;
}
