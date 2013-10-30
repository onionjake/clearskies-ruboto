package com.clearskies;

public class ClearSkiesService extends org.ruboto.RubotoService {
	public void onCreate() {
		getScriptInfo().setRubyClassName(getClass().getSimpleName());
		super.onCreate();
	}

}
