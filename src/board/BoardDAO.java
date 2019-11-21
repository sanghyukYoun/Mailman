package board;

import java.sql.*;
import java.util.ArrayList;

import board.BoardDTO;


public class BoardDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;


	String jdbc_driver = "com.mysql.jdbc.Driver";
	
	String jdbc_url = "jdbc:mysql://127.0.0.1/jspdb?useSSL=true&verifyServerCertificate=false&serverTimezone=UTC";
	

	void connect() {
		try {
			Class.forName(jdbc_driver);

			conn = DriverManager.getConnection(jdbc_url,"jspbook","1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	

	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}


	public boolean insertDB(BoardDTO boardDTO) {
		
		
		connect();
		
				
		String sql ="insert into Board(user,title,date,content) values(?,?,?,?)";
		
		try {
			
			pstmt = conn.prepareStatement(sql);


			pstmt.setString(1,boardDTO.getUser());
			pstmt.setString(2,boardDTO.getTitle());
			pstmt.setString(3,boardDTO.getDate());
			pstmt.setString(4,boardDTO.getContent());
			

			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	

	public ArrayList<BoardDTO> getDBList() {
		
		connect();
		
		ArrayList<BoardDTO> boardList = new ArrayList<BoardDTO>();
		
		String sql = "select id,user,title,date,content from Board";

		try {
			
			pstmt = conn.prepareStatement(sql);
			

			ResultSet rs = pstmt.executeQuery();

			while(rs.next()) {
				

				BoardDTO boardDTO = new BoardDTO();
				

				boardDTO.setId(rs.getInt("id"));
				boardDTO.setUser(rs.getString("user"));
				boardDTO.setTitle(rs.getString("title"));
				boardDTO.setDate(rs.getString("date"));
				boardDTO.setContent(rs.getString("content"));
				
				boardList.add(boardDTO);
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return boardList;
	}


	public BoardDTO getDB(int id) {
		
		connect();
		
		BoardDTO boardDTO = new BoardDTO();
		
		String sql = "select * from Board where id = ?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			

			pstmt.setInt(1,id);


			ResultSet rs = pstmt.executeQuery();


			rs.next();
			

			boardDTO.setId(rs.getInt("id"));
			boardDTO.setUser(rs.getString("user"));
			boardDTO.setTitle(rs.getString("title"));
			boardDTO.setDate(rs.getString("date"));
			boardDTO.setContent(rs.getString("content"));
			
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return boardDTO;
	}

	public BoardDTO getRead(int id) {
		
		connect();
		
		BoardDTO boardDTO = new BoardDTO();
		
		String sql = "select * from Board where id = ?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			

			pstmt.setInt(1,id);


			ResultSet rs = pstmt.executeQuery();


			rs.next();
			

			boardDTO.setId(rs.getInt("id"));
			boardDTO.setUser(rs.getString("user"));
			boardDTO.setTitle(rs.getString("title"));
			boardDTO.setDate(rs.getString("date"));
			boardDTO.setContent(rs.getString("content"));
			
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return boardDTO;
	}

	public boolean updateDB(int id,BoardDTO boardDTO) {
		
		
		connect();
		
		
		String sql ="update Board set date=?, content=? where id=?";
		try {
			
			pstmt = conn.prepareStatement(sql);


			pstmt.setString(1,boardDTO.getDate());
			pstmt.setString(2,boardDTO.getContent());
			pstmt.setInt(3,id);
		

			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	

	public boolean deleteDB(int id) {
		
		
		connect();
		
			
		String sql ="delete from Board where id=?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);


			pstmt.setInt(1,id);
						

			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
		}
		return true;
	}
	
	
}

