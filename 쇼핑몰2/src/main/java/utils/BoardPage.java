package utils;

public class BoardPage {
	public static String pagingStr(int listCount, int pageSize, int blockPage, int pageNum) {
		String pagingStr = "";

		int totalpages = (int) (Math.ceil(((double) listCount / pageSize)));
		int pageTemp = (((pageNum - 1) / blockPage) * blockPage) + 1;
		int blockCount = 1;

		while (blockCount <= blockPage && pageTemp <= totalpages) {
			if (pageTemp == pageNum) {
				pagingStr += "&nbsp;" + "<font color='red'>" + pageTemp + "&nbsp;";
			} else {
				pagingStr += "&nbsp;<a href='List.jsp?pageNum=" + pageTemp + "'>" + pageTemp + "</a>&nbsp;";
			}
			pageTemp++;
			blockCount++;
		}
		return pagingStr;
	}
}
