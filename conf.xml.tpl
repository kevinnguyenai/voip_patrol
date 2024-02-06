<?xml version="1.0"?>
<config>
	<actions>
		<!--
		<action type="alert" email="????@gmail.com" email_from="test@voip-patrol.org" smtp_host="smtp://gmail-smtp-in.l.google.com:25"/>
		-->

		<!-- UDP tests -->
		<action type="register" transport="udp" expected_cause_code="200" username="demo_000001" password="UGNnvccw" realm="leap.expert" registrar="35.179.77.242"/>
		<action type="wait"/>
		<action type="accept" label="server1" wait_until="2" callee="demo_000001" hangup="2"/>
		<action type="call" label="server1" wait_until="3" expected_cause_code="200" caller="demo_000001@147.75.65.193" callee="12062091234@10.0.0.193" max_duration="4" hangup="20"/>
		<action type="wait"/>
		<!-- <action type="accept" label="server1" wait_until="2" callee="username" hangup="20" max_duration="4"/>
		<action type="call" label="server1" wait_until="3" expected_cause_code="200" caller="username@147.75.65.193" callee="12062091234@10.0.0.193" hangup="2"/>
		<action type="wait"/> -->
		<!-- <action type="accept" label="server2" wait_until="2" callee="username" hangup="2"/>
		<action type="call" label="server2" wait_until="3" expected_cause_code="200" caller="username@147.75.65.193" callee="12062091234@10.0.0.194" max_duration="4" hangup="20"/>
		<action type="wait"/> -->
		<!-- <action type="accept" label="server2" wait_until="2" callee="username" hangup="20" max_duration="4"/>
		<action type="call" label="server2" wait_until="3" expected_cause_code="200" caller="username@147.75.65.193" callee="12062091234@10.0.0.194" hangup="2"/>
		<action type="wait"/> -->
		<!-- <action type="accept" label="server3" wait_until="2" callee="username" hangup="2"/>
		<action type="call" label="server3" wait_until="3" expected_cause_code="200" caller="username@147.75.65.193" callee="12062091234@10.0.0.195" max_duration="4" hangup="20"/>
		<action type="wait"/> -->
		<!-- <action type="accept" label="server3" wait_until="2" callee="username" hangup="20" max_duration="4"/>
		<action type="call" label="server3" wait_until="3" expected_cause_code="200" caller="username@147.75.65.193" callee="12062091234@10.0.0.195" hangup="2"/>
		<action type="wait"/> -->
		<!-- <action type="accept" label="server4" wait_until="2" callee="username" hangup="2"/>
		<action type="call" label="server4" wait_until="3" expected_cause_code="200" caller="username@147.75.65.193" callee="12062091234@10.0.0.196" max_duration="4" hangup="20"/>
		<action type="wait"/> -->
		<!-- <action type="accept" label="server4" wait_until="2" callee="username" hangup="20" max_duration="4"/>
		<action type="call" label="server4" wait_until="3" expected_cause_code="200" caller="username@147.75.65.193" callee="12062091234@10.0.0.196" hangup="2"/> -->

		<action type="wait-complete"/>

		<!-- TCP tests -->

		<!-- <action type="register" transport="tcp" expected_cause_code="200" username="username" password="M4C6JA9gzpzz" realm="sip.yordomain.com" registrar="10.0.0.193"/>
		<action type="wait"/>
		<action type="accept" label="server1" wait_until="3" callee="username" hangup="2"/>
		<action type="call" label="server1" wait_until="3" expected_cause_code="200" caller="username@147.75.65.193" callee="12062091234@10.0.0.193" max_duration="4" hangup="20"/>
		<action type="wait"/>
		<action type="accept" label="server1" wait_until="3" callee="username" hangup="20" max_duration="4"/>
		<action type="call" label="server1" wait_until="3" expected_cause_code="200" caller="username@147.75.65.193" callee="12062091234@10.0.0.193" hangup="2"/>
		<action type="wait"/>
		<action type="accept" label="server2" wait_until="3" callee="username" hangup="2"/>
		<action type="call" label="server2" wait_until="3" expected_cause_code="200" caller="username@147.75.65.193" callee="12062091234@10.0.0.194" max_duration="4" hangup="20"/>
		<action type="wait"/>
		<action type="accept" label="server2" wait_until="3" callee="username" hangup="20" max_duration="4"/>
		<action type="call" label="server2" wait_until="3" expected_cause_code="200" caller="username@147.75.65.193" callee="12062091234@10.0.0.194" hangup="2"/>
		<action type="wait"/>
		<action type="accept" label="server3" wait_until="3" callee="username" hangup="2"/>
		<action type="call" label="server3" wait_until="3" expected_cause_code="200" caller="username@147.75.65.193" callee="12062091234@10.0.0.195" max_duration="4" hangup="20"/>
		<action type="wait"/>
		<action type="accept" label="server3" wait_until="3" callee="username" hangup="20" max_duration="4"/>
		<action type="call" label="server3" wait_until="3" expected_cause_code="200" caller="username@147.75.65.193" callee="12062091234@10.0.0.195" hangup="2"/>
		<action type="wait"/>
		<action type="accept" label="server4" wait_until="3" callee="username" hangup="2"/>
		<action type="call" label="server4" wait_until="3" expected_cause_code="200" caller="username@147.75.65.193" callee="12062091234@10.0.0.196" max_duration="4" hangup="20"/>
		<action type="wait"/>
		<action type="accept" label="server4" wait_until="3" callee="username" hangup="20" max_duration="4"/>
		<action type="call" label="server4" wait_until="3" expected_cause_code="200" caller="username@147.75.65.193" callee="12062091234@10.0.0.196" hangup="2"/>
		
		<action type="wait-complete"/> -->
		<!--
		-->
	</actions>
</config>
<!-- expected_useragent expected_reason max_delay -->
