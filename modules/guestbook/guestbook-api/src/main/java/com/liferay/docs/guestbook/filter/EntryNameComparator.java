package com.liferay.docs.guestbook.filter;

import com.liferay.docs.guestbook.model.Entry;
import com.liferay.portal.kernel.util.OrderByComparator;

public class EntryNameComparator extends OrderByComparator<Entry> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3513557967305374454L;

	public static final String ORDER_BY_ASC = "Entry.name ASC";

	public static final String ORDER_BY_DESC = "Entry.name DESC";

	public static final String[] ORDER_BY_FIELDS = { "name" };

	public EntryNameComparator() {
		this(false);
	}

	public EntryNameComparator(boolean ascending) {
		_accending = ascending;
	}

	@Override
	public int compare(Entry entry1, Entry entry2) {
		// TODO Auto-generated method stub
		String name1 = entry1.getName();
		String name2 = entry2.getName();

		int value = name1.compareTo(name2);

		if (_accending) {
			return value;
		} else {
			return -value;
		}
	}

	@Override
	public String getOrderBy() {
		// TODO Auto-generated method stub
		if (_accending) {
			return ORDER_BY_ASC;
		} else {
			return ORDER_BY_DESC;
		}
	}

	@Override
	public String[] getOrderByFields() {
		return ORDER_BY_FIELDS;
	}

	@Override
	public boolean isAscending() {
		// TODO Auto-generated method stub
		return _accending;
	}

	private final boolean _accending;
}
