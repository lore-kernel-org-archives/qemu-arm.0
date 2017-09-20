Received: by 10.223.172.38 with SMTP id v35csp1199143wrc;
        Wed, 20 Sep 2017 15:09:38 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCHYjvqIBbF4eppg3MCLyiPcw4xK/hLg7tGHemdz+K+FVFMyZuxMrbnorMPdg389LVZGRiG
X-Received: by 10.200.25.183 with SMTP id u52mr306008qtj.102.1505945378047;
        Wed, 20 Sep 2017 15:09:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505945378; cv=none;
        d=google.com; s=arc-20160816;
        b=ToWjv5GzOaMtQ7WbOPWDLT+NCUr7tRqjPFbhXogQs/61iucwmZbpyp2uvQrtMrydG7
         Bm+UyCRKPVx0aUUCBka8fW7kHBwto7TSt7KL+y3wMgRJG4Gf8rTFVlFiSb31KYt5vH3X
         AbAqZYn3o7yg7V/l/vS7Avdtm1rywAAsSroVWB54nwIsjBqNGFTr4f+IPvM22Mrsmw8t
         5huAteKstlEDSrJ5jVgYShAw1e+1HMsjc6EbSbopDaR+9C3/wqrmDXovqPTqROXzlOAT
         mXvLSJK5+7hiiYpvYtnGLiCgEbbZcuZQZu7CKpBUYzoxaF8HXhLLJAA0rWuBCyOmURbA
         S6kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=GWBzmC0nxls+1+1GbTw2ChPNol9jt0y8owOEPKmYAVM=;
        b=b7gSuLA6UeKRWW5u9eO6e7/kiSf+ooovQw9eVsp1aA2WoPzMGzFcIa1rjA1Xvm8jiR
         sp9rSOzXnxzFgh9ic2H3JXz8sc8JHSlCi1zJkITrkDDgq+Rsa6YVBdS83SZ1srfnGbv+
         eG1ifPatwKkkqHbM+eDyJDyzJrUgve2RJ9DOdGSVBO83bz49JJnsJJhSxA13QFHnJ5sc
         Jlhb9KqU0kbKYD9vqTkVsVDl+C7Vi+um9kQGsd3e5TnafNByyb0ZOBPquaz5kR4DtF4G
         mxho0PqPT10ZuXb4Pn/btgPKdi/qipbm6rrLsAJGC8sKGyWNH775B1N/Se0lJBQ8ELqi
         IJCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=5iPLWCLi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v26si2625719qtf.378.2017.09.20.15.09.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 15:09:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=5iPLWCLi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50870 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dunBX-0004Cd-FT
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 18:09:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47872)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dun7r-000147-H1
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 18:05:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dun7n-0000RG-Eq
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 18:05:47 -0400
Received: from mail-by2nam03on0041.outbound.protection.outlook.com
	([104.47.42.41]:61447
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dun7n-0000Mj-1C; Wed, 20 Sep 2017 18:05:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=GWBzmC0nxls+1+1GbTw2ChPNol9jt0y8owOEPKmYAVM=;
	b=5iPLWCLiF7zehPXJxB6iVYH5ln53SlYFYxV/ki13OWpkVFZHxzVQcqDaGIgJ2iJpmjBMhyaHyo3IARLqWqs8l1KmOLXWVuNzhr6ctOIfKF7nE0ajLhLfRDXg/5hVKrwmqNqiAZdonhynfiDv4oW5QnoV7mh9VIgcFHL5M5sk1wE=
Received: from MWHPR02CA0024.namprd02.prod.outlook.com (10.168.209.162) by
	BLUPR02MB1122.namprd02.prod.outlook.com (10.163.79.148) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Wed, 20 Sep 2017 22:05:40 +0000
Received: from BL2NAM02FT038.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::207) by MWHPR02CA0024.outlook.office365.com
	(2603:10b6:300:4b::34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.56.11 via
	Frontend Transport; Wed, 20 Sep 2017 22:05:40 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT038.mail.protection.outlook.com (10.152.77.25) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.35.14
	via Frontend Transport; Wed, 20 Sep 2017 22:05:39 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:56532
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dun7i-0005ig-8P; Wed, 20 Sep 2017 15:05:38 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dun7i-0002Pj-5a; Wed, 20 Sep 2017 15:05:38 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v8KM5T5r003853; Wed, 20 Sep 2017 15:05:29 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dun7Z-0002M6-0Q; Wed, 20 Sep 2017 15:05:29 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Wed, 20 Sep 2017 15:01:50 -0700
Message-ID: <036217613544270ed280f8beddb846bc6b78b4b6.1505929556.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1505929556.git.alistair.francis@xilinx.com>
References: <cover.1505929556.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23340.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(39860400002)(346002)(2980300002)(438002)(199003)(189002)(50986999)(47776003)(36386004)(356003)(76176999)(106466001)(2201001)(2906002)(77096006)(316002)(39060400002)(54906003)(50226002)(5003940100001)(9786002)(63266004)(305945005)(230783001)(118296001)(48376002)(6666003)(4326008)(16586007)(575784001)(50466002)(110136005)(189998001)(478600001)(36756003)(81166006)(2950100002)(8936002)(33646002)(5660300001)(81156014)(8676002)(107986001)(2101003)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR02MB1122; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT038;
	1:LJRhdU9v0OAAp33Vb9meIM9Iyej5hAbYkYC/VgPZDEEWMPOoEJ93eQcoMaTe95PnKEozLqRwEmjgAdDjTQMtE2jSpCk+SwV6JmC19kXSZwyVEwaQcjTdKg7rbOQFdGL0
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f16f6797-917c-4a11-3da4-08d50073badc
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BLUPR02MB1122; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1122;
	3:ZHai5ALTumgoKWf7bB3DIFv0MO2rqrNJH++glZJPrW8kFblrPs68982y0tixrMvmVQxSNgysmaXwCAVU4FtaY/v1T4S1qJPGS0UQOjsma5uG+N17BtMBIacd7ZyN5ivpOMIpxtvNWhXL3kRwi+j1irsrsDtPcBCw2i8J3v2QjfF3eprYe26sJPT/Y8ZPhfs9B7DAtG0klD/DIr0tijU1eLgZPcnG6J+9H+zjLHAKXK8b20wzBmcB/Jt1NiALnp2DsReQDaFb7KIlcsZY/VsHZsib38f81/BYFinWSv/QtS+zG2t4Q/k7Ta6Cw01JE4ZSFUjHQTJK9GukHdSD4yfPfg2MvLHtWwx3XAtZ69D88Fo=;
	25:cB0FsC8rjkrPIM/UfvRfaec30h1dX5bIrzWZ2Cq6+PMc962B9iZx5OaNWhNAxuUUDuUDKHeo5ov7eP+zYJR6C47DGLgy/Qhv3uGXokIjtIHoLyD30kFo9pyjqkaGwIZ4EqMtzSzA0Auk/3hm/p2w8EaXRr7brBWvsW9neatTxg1Oj6XFKa7CvMJwLfDrotDQk2BqKmoaCmZ2KVKSA6H82c9glqXXBWTtzPCDfZ6i6SylhDAzN5bFViUCf6bY8Zltn1FnlyQ6lXA25gr3KWTW83KpMKMvMf33wnzfssz76mlnqKJOaS4w+2/ZtpbyZUloJSdK5h0t8gAXgeXLU+tkXw==
X-MS-TrafficTypeDiagnostic: BLUPR02MB1122:
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1122;
	31:SsOX8el7tAG9ZCtcvA9ykGDiAL5gtGOLl/eaJk4ivJgqO6b6fG5DLcspZFrXkXo7yZRblfiLfqm0wVW2sZkK3dgshtySFhymqt3tiSeICfSTRERbFBUZ9IjFezQZ2GVuRUeTbTb6rNXcfikyjYvlnHBnsD6REgL5i2ZrRsk8jzGWmGjS1Mtq29G0pwJ0irDUcNX9pkcK/7nGqPOWje9UcJxdzv7vMUEkWBX9jdhFeus=;
	20:DA8fy1oSQavVVknzilmzeN7guuXkyMBp19w94hcTa6PVskiKV9BdjHYyZMMlutB8LtD8TkLM7358ZAdhY80OFX0ytMYHd06r5Ulaf3PeyYljg6f2+4fOLnoTUn4lvCBGzfmCxTE3G6jWzHKAwtrDAy8ZMpXKA/LLFaw0Hn03SmHRYmpnSPnk5jSdjO5klf+VIe8jRfdteKCVdKP2d1+GL/gNzVuPOEggZqdMxt5Z86Zao4zumwTnTC3A+aOObmLaE1+ggsrfjsBBOBiBmABpdiJ5Kyx7lDJZ5gDpwHFa48sfEB3ZexgjlZNkgq8m+GrjS7wd2G+ZZuHHWDD/MF8uGVZbV/YqUO6kXGNW8LYfaeYUDnC1ow0hFy8seJL6gA5Iuce8/VUoUh5U7u5xAe51QzdAPPqW0uZeOthVAmhoy5OFcMnxW9a8nkt97ggGi8Qg2ORFlTsJRXYUI0LimSja2nOd+H+o8kKsuB/fH/qVyvaNENe7DX2oIY2H2drpmLD3
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <BLUPR02MB11223BA749558C64DDED0B46DC610@BLUPR02MB1122.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93004095)(10201501046)(100000703101)(100105400095)(3002001)(6055026)(6041248)(20161123560025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123558100)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BLUPR02MB1122; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BLUPR02MB1122; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1122;
	4:tsUW5agyan6/SQmATpPWU0K1Y2V5107AqKnB0aWHkbKJcoglcqx4TQCcUQe83TT99cu5KqKfTXMpG4BZYb9J8f7L44kwp4CIlKKrEytZEd69B5wgdPaEc2jKptbr75Obm6uJgoEQhRlk7zpuUINDGIpdazLgmcXaoolCWSb8o6czC8x0cdChOWVwt2sl/9utBNzQ5NVFg2xtMCqRy0+O24rhNfq/vBc3zPgtthY+xYcdvAJQHT7et+mXnen7ADAW4rGpPRm642dFSIaiABlDvgslGIr/txynNwfyp4Kb+aI=
X-Forefront-PRVS: 04362AC73B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR02MB1122;
	23:8nxtFfFJroEKrr0L33lCN92JQJztedJcDEtKV4L4t?=
	=?us-ascii?Q?OIm2TNPz88OQQPSDdWFC334qRPO9mqlaoSKE624+3Ww8NYoV/wsR/jiXXLZj?=
	=?us-ascii?Q?fGe45TNTsLhOiBhpUae4Y9ePZOaj3Qn1HmsYB7F//1AQ9Z8xlwjHznAE0v0E?=
	=?us-ascii?Q?vfZ+5tVbwhuNgNmtNbPbx66Ry8qDj6g365bztTKXOBgWGYR6rgO0tMOZOqLk?=
	=?us-ascii?Q?9xQKDL6FwLdom1RZs8ufpCNr6ttyz1rJp8TL4OGJj6z9/qy2P3cmWHDo5JES?=
	=?us-ascii?Q?2M6xOUwWkKh6MVoRFXMhrDyupo1LJwuWjN2nv1z7MRAaYPxXrLaz2oHujzwx?=
	=?us-ascii?Q?qtc5ChwfhEUV4M6bgMhyBidt6h1/EuMB72E2+TKwVG6ui6/IlphIc+rkkZpb?=
	=?us-ascii?Q?6qcT1v5DQzwIhl2BpjajF5mKvAFdOw5etSLHy19+WTn64u2Tb/W4cHBY/r2z?=
	=?us-ascii?Q?8lYGkqS8LfDcuNcLOVcH48r9I2laDcU/E2621UZ9UbD5Zfb+9y2ER5elgTei?=
	=?us-ascii?Q?KfLz63TUPoQqDk9rW7wCONEuIiuV+KFSDsKERLx67SVg+K+Fs+MZR2iSPkPh?=
	=?us-ascii?Q?whcNJMGMFkEkr9UbLT6tBoK1BLtjmLjZyRG/xhy8lGWBK0dwhpzG0A4O4Cbe?=
	=?us-ascii?Q?3JzFB6sEHSjv/IBRf/PptIuu/46Vf+Q8ZSXEQ1zbXM1hhV2BiVpSY87//yr0?=
	=?us-ascii?Q?teiDCFravx40Gw4AOjPHNjWwVga83SdHwIbpjOFlbfzDFD1nIdNxd2CLg/LE?=
	=?us-ascii?Q?zy9Jte8frTStd+72idl0rA93SCNzCb3i9pmpghcAoAf/ToQozSjdNT4JN0Cp?=
	=?us-ascii?Q?5pjQuQhRp335dTa3Gh3giyzDbQUJucBS/h+zGn1TfEPH/+QnFCQkDZ6Ny7yK?=
	=?us-ascii?Q?I3L2heqCVD7wVYZJuHNv20l2CmpOq5XHzbUBjl1a9bq0Xsvl9YtIHQYlkF/g?=
	=?us-ascii?Q?fvM5zSkDmHvi0qVgfnkFrnDaJQJSdfQAxI1ZFPPnJDVevICSM6jDOD9iLX+o?=
	=?us-ascii?Q?jAr3J1gud33N996Tst04fPP+G0qwQXGrQ/TIlBu+td9KwZd/KnCLzVhsOAAV?=
	=?us-ascii?Q?YxuR5RI+eM8FcUBaMxnGioGn1JSHNfStGCaVfSMdaqy5QdA2EfH/h8bcSWIG?=
	=?us-ascii?Q?4Y3Uy1/twZWKN6UHUcYctNwE8Wu2U/n?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1122;
	6:yDVGgLGS2ckK4U0095EV23BqpRDVfNFebKiP7fbbYyrv5AoFs3qjZlIsKse5CDUbAJPG+MSr3SSi/XmyGRalMjGSqOvUZkfO1+Jlcn5hHxxILqoA1BTil6CZ4WDAcXf4rHpnDWlGgzI02x+DPmMGlHjKzD3/7qrk3rePCzAzWEoPg68hPI+Gm/JpUqBDdxbe0y5gxsck7EdgcX4Tcorm9bAhT+9WK27LHMeIwu9FzfPwwYbPTil3UIZtjz71G+U1l4Mywrt51/0SqV8+89HrGuthhleBBahatj2UMnc3guHq+5jW/v7ulyBTwS/GmfBfJaJz0WDVVa/LGA8D61R5YQ==;
	5:11O1afzOZ2BcbNY5DX07yKwE/vEUs5yMC7bccifQHvXcjYQ0lwMNCYDARY22O0tfMLblSW74yMyT0mppgJRzNX4Hc/kgFtBJ9V35F+ysrv8soNxhDJuOu5uAqM3em8flPWn8IkmT30RWveXlkgUnUg==;
	24:6ZSVyckgrR5ZbDC5BK6Tnwxc9DyrzoSupqbuRso3tzT3SKqBiN5MrOpVZ+FNtzoitW0vNkKsD7XGdvvJdmUGxjgwpO1KfEDXtsCPb7l6ER0=;
	7:UwMGlxJ+rd7iNATKgL1lpyrTsKHR33OqYTkYz7jk+KmYIk2VlHe9UM7CQjFQLylnQ0SJZgQjfvK1h9VKII8XJjBVrIdjjeX26fI8F46frogloawj+cT/uxRxxB0Al1w3H9AeRjLLBmir77wJEf7ZqH39vr6PWCt4GKVs3SQx6Bs48GCmz9zhKttHLTyi2HXyfrl+J/+W6oNt2E6xtnBUGmvySGTNLdn0gG5huQ4nkYI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2017 22:05:39.4027 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR02MB1122
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.41
Subject: [Qemu-arm] [PATCH v3 6/8] xlnx-zynqmp-ipi: Initial version of the
 Xilinx IPI device
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yGujDGR3ipJT

This is the initial version of the Inter Processor Interrupt device.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 hw/intc/Makefile.objs             |   1 +
 hw/intc/xlnx-zynqmp-ipi.c         | 377 ++++++++++++++++++++++++++++++++++++++
 include/hw/intc/xlnx-zynqmp-ipi.h |  57 ++++++
 3 files changed, 435 insertions(+)
 create mode 100644 hw/intc/xlnx-zynqmp-ipi.c
 create mode 100644 include/hw/intc/xlnx-zynqmp-ipi.h

diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
index 0fce61e2ce..8497d05695 100644
--- a/hw/intc/Makefile.objs
+++ b/hw/intc/Makefile.objs
@@ -4,6 +4,7 @@ common-obj-$(CONFIG_PL190) += pl190.o
 common-obj-$(CONFIG_PUV3) += puv3_intc.o
 common-obj-$(CONFIG_XILINX) += xilinx_intc.o
 common-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-pmu-iomod-intc.o
+common-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp-ipi.o
 common-obj-$(CONFIG_ETRAXFS) += etraxfs_pic.o
 common-obj-$(CONFIG_IMX) += imx_avic.o
 common-obj-$(CONFIG_LM32) += lm32_pic.o
diff --git a/hw/intc/xlnx-zynqmp-ipi.c b/hw/intc/xlnx-zynqmp-ipi.c
new file mode 100644
index 0000000000..6203b27e56
--- /dev/null
+++ b/hw/intc/xlnx-zynqmp-ipi.c
@@ -0,0 +1,377 @@
+/*
+ * QEMU model of the IPI Inter Processor Interrupt block
+ *
+ * Copyright (c) 2014 Xilinx Inc.
+ *
+ * Written by Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+ * Written by Alistair Francis <alistair.francis@xilinx.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/register.h"
+#include "qemu/bitops.h"
+#include "qemu/log.h"
+#include "hw/intc/xlnx-zynqmp-ipi.h"
+
+#ifndef XLNX_ZYNQMP_IPI_ERR_DEBUG
+#define XLNX_ZYNQMP_IPI_ERR_DEBUG 0
+#endif
+
+#define DB_PRINT_L(lvl, fmt, args...) do {\
+    if (XLNX_ZYNQMP_IPI_ERR_DEBUG >= lvl) {\
+        qemu_log(TYPE_XLNX_ZYNQMP_IPI ": %s:" fmt, __func__, ## args);\
+    } \
+} while (0);
+
+#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
+
+REG32(IPI_TRIG, 0x0)
+    FIELD(IPI_TRIG, PL_3, 27, 1)
+    FIELD(IPI_TRIG, PL_2, 26, 1)
+    FIELD(IPI_TRIG, PL_1, 25, 1)
+    FIELD(IPI_TRIG, PL_0, 24, 1)
+    FIELD(IPI_TRIG, PMU_3, 19, 1)
+    FIELD(IPI_TRIG, PMU_2, 18, 1)
+    FIELD(IPI_TRIG, PMU_1, 17, 1)
+    FIELD(IPI_TRIG, PMU_0, 16, 1)
+    FIELD(IPI_TRIG, RPU_1, 9, 1)
+    FIELD(IPI_TRIG, RPU_0, 8, 1)
+    FIELD(IPI_TRIG, APU, 0, 1)
+REG32(IPI_OBS, 0x4)
+    FIELD(IPI_OBS, PL_3, 27, 1)
+    FIELD(IPI_OBS, PL_2, 26, 1)
+    FIELD(IPI_OBS, PL_1, 25, 1)
+    FIELD(IPI_OBS, PL_0, 24, 1)
+    FIELD(IPI_OBS, PMU_3, 19, 1)
+    FIELD(IPI_OBS, PMU_2, 18, 1)
+    FIELD(IPI_OBS, PMU_1, 17, 1)
+    FIELD(IPI_OBS, PMU_0, 16, 1)
+    FIELD(IPI_OBS, RPU_1, 9, 1)
+    FIELD(IPI_OBS, RPU_0, 8, 1)
+    FIELD(IPI_OBS, APU, 0, 1)
+REG32(IPI_ISR, 0x10)
+    FIELD(IPI_ISR, PL_3, 27, 1)
+    FIELD(IPI_ISR, PL_2, 26, 1)
+    FIELD(IPI_ISR, PL_1, 25, 1)
+    FIELD(IPI_ISR, PL_0, 24, 1)
+    FIELD(IPI_ISR, PMU_3, 19, 1)
+    FIELD(IPI_ISR, PMU_2, 18, 1)
+    FIELD(IPI_ISR, PMU_1, 17, 1)
+    FIELD(IPI_ISR, PMU_0, 16, 1)
+    FIELD(IPI_ISR, RPU_1, 9, 1)
+    FIELD(IPI_ISR, RPU_0, 8, 1)
+    FIELD(IPI_ISR, APU, 0, 1)
+REG32(IPI_IMR, 0x14)
+    FIELD(IPI_IMR, PL_3, 27, 1)
+    FIELD(IPI_IMR, PL_2, 26, 1)
+    FIELD(IPI_IMR, PL_1, 25, 1)
+    FIELD(IPI_IMR, PL_0, 24, 1)
+    FIELD(IPI_IMR, PMU_3, 19, 1)
+    FIELD(IPI_IMR, PMU_2, 18, 1)
+    FIELD(IPI_IMR, PMU_1, 17, 1)
+    FIELD(IPI_IMR, PMU_0, 16, 1)
+    FIELD(IPI_IMR, RPU_1, 9, 1)
+    FIELD(IPI_IMR, RPU_0, 8, 1)
+    FIELD(IPI_IMR, APU, 0, 1)
+REG32(IPI_IER, 0x18)
+    FIELD(IPI_IER, PL_3, 27, 1)
+    FIELD(IPI_IER, PL_2, 26, 1)
+    FIELD(IPI_IER, PL_1, 25, 1)
+    FIELD(IPI_IER, PL_0, 24, 1)
+    FIELD(IPI_IER, PMU_3, 19, 1)
+    FIELD(IPI_IER, PMU_2, 18, 1)
+    FIELD(IPI_IER, PMU_1, 17, 1)
+    FIELD(IPI_IER, PMU_0, 16, 1)
+    FIELD(IPI_IER, RPU_1, 9, 1)
+    FIELD(IPI_IER, RPU_0, 8, 1)
+    FIELD(IPI_IER, APU, 0, 1)
+REG32(IPI_IDR, 0x1c)
+    FIELD(IPI_IDR, PL_3, 27, 1)
+    FIELD(IPI_IDR, PL_2, 26, 1)
+    FIELD(IPI_IDR, PL_1, 25, 1)
+    FIELD(IPI_IDR, PL_0, 24, 1)
+    FIELD(IPI_IDR, PMU_3, 19, 1)
+    FIELD(IPI_IDR, PMU_2, 18, 1)
+    FIELD(IPI_IDR, PMU_1, 17, 1)
+    FIELD(IPI_IDR, PMU_0, 16, 1)
+    FIELD(IPI_IDR, RPU_1, 9, 1)
+    FIELD(IPI_IDR, RPU_0, 8, 1)
+    FIELD(IPI_IDR, APU, 0, 1)
+
+/* APU
+ * RPU_0
+ * RPU_1
+ * PMU_0
+ * PMU_1
+ * PMU_2
+ * PMU_3
+ * PL_0
+ * PL_1
+ * PL_2
+ * PL_3
+ */
+int index_array[NUM_IPIS] = {0, 8, 9, 16, 17, 18, 19, 24, 25, 26, 27};
+static const char *index_array_names[NUM_IPIS] = {"APU", "RPU_0", "RPU_1",
+                                                  "PMU_0", "PMU_1", "PMU_2",
+                                                  "PMU_3", "PL_0", "PL_1",
+                                                  "PL_2", "PL_3"};
+
+static void xlnx_zynqmp_ipi_set_trig(XlnxZynqMPIPI *s, uint32_t val)
+{
+    int i, ipi_index, ipi_mask;
+
+    for (i = 0; i < NUM_IPIS; i++) {
+        ipi_index = index_array[i];
+        ipi_mask = (1 << ipi_index);
+        DB_PRINT("Setting %s=%d\n", index_array_names[i],
+                 !!(val & ipi_mask));
+        qemu_set_irq(s->irq_trig_out[i], !!(val & ipi_mask));
+    }
+}
+
+static void xlnx_zynqmp_ipi_set_obs(XlnxZynqMPIPI *s, uint32_t val)
+{
+    int i, ipi_index, ipi_mask;
+
+    for (i = 0; i < NUM_IPIS; i++) {
+        ipi_index = index_array[i];
+        ipi_mask = (1 << ipi_index);
+        DB_PRINT("Setting %s=%d\n", index_array_names[i],
+                 !!(val & ipi_mask));
+        qemu_set_irq(s->irq_obs_out[i], !!(val & ipi_mask));
+    }
+}
+
+static void xlnx_zynqmp_ipi_update_irq(XlnxZynqMPIPI *s)
+{
+    bool pending = s->regs[R_IPI_ISR] & ~s->regs[R_IPI_IMR];
+
+    DB_PRINT("irq=%d isr=%x mask=%x\n",
+             pending, s->regs[R_IPI_ISR], s->regs[R_IPI_IMR]);
+    qemu_set_irq(s->irq, pending);
+}
+
+static uint64_t xlnx_zynqmp_ipi_trig_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(reg->opaque);
+
+    xlnx_zynqmp_ipi_set_trig(s, val64);
+
+    return val64;
+}
+
+static void xlnx_zynqmp_ipi_trig_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(reg->opaque);
+
+    /* TRIG generates a pulse on the outbound signals. We use the
+     * post-write callback to bring the signal back-down.
+     */
+    s->regs[R_IPI_TRIG] = 0;
+
+    xlnx_zynqmp_ipi_set_trig(s, 0);
+}
+
+static uint64_t xlnx_zynqmp_ipi_isr_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(reg->opaque);
+
+    xlnx_zynqmp_ipi_set_obs(s, val64);
+
+    return val64;
+}
+
+static void xlnx_zynqmp_ipi_isr_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(reg->opaque);
+
+    xlnx_zynqmp_ipi_update_irq(s);
+}
+
+static uint64_t xlnx_zynqmp_ipi_ier_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_IPI_IMR] &= ~val;
+    xlnx_zynqmp_ipi_update_irq(s);
+    return 0;
+}
+
+static uint64_t xlnx_zynqmp_ipi_idr_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_IPI_IMR] |= val;
+    xlnx_zynqmp_ipi_update_irq(s);
+    return 0;
+}
+
+static const RegisterAccessInfo xlnx_zynqmp_ipi_regs_info[] = {
+    {   .name = "IPI_TRIG",  .addr = A_IPI_TRIG,
+        .rsvd = 0xf0f0fcfe,
+        .ro = 0xf0f0fcfe,
+        .pre_write = xlnx_zynqmp_ipi_trig_prew,
+        .post_write = xlnx_zynqmp_ipi_trig_postw,
+    },{ .name = "IPI_OBS",  .addr = A_IPI_OBS,
+        .rsvd = 0xf0f0fcfe,
+        .ro = 0xffffffff,
+    },{ .name = "IPI_ISR",  .addr = A_IPI_ISR,
+        .rsvd = 0xf0f0fcfe,
+        .ro = 0xf0f0fcfe,
+        .w1c = 0xf0f0301,
+        .pre_write = xlnx_zynqmp_ipi_isr_prew,
+        .post_write = xlnx_zynqmp_ipi_isr_postw,
+    },{ .name = "IPI_IMR",  .addr = A_IPI_IMR,
+        .reset = 0xf0f0301,
+        .rsvd = 0xf0f0fcfe,
+        .ro = 0xffffffff,
+    },{ .name = "IPI_IER",  .addr = A_IPI_IER,
+        .rsvd = 0xf0f0fcfe,
+        .ro = 0xf0f0fcfe,
+        .pre_write = xlnx_zynqmp_ipi_ier_prew,
+    },{ .name = "IPI_IDR",  .addr = A_IPI_IDR,
+        .rsvd = 0xf0f0fcfe,
+        .ro = 0xf0f0fcfe,
+        .pre_write = xlnx_zynqmp_ipi_idr_prew,
+    }
+};
+
+static void xlnx_zynqmp_ipi_reset(DeviceState *dev)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(dev);
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->regs_info); ++i) {
+        register_reset(&s->regs_info[i]);
+    }
+
+    xlnx_zynqmp_ipi_update_irq(s);
+}
+
+static void xlnx_zynqmp_ipi_handler(void *opaque, int n, int level)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(opaque);
+    uint32_t val = (!!level) << n;
+
+    DB_PRINT("IPI input irq[%d]=%d\n", n, level);
+
+    s->regs[R_IPI_ISR] |= val;
+    xlnx_zynqmp_ipi_set_obs(s, s->regs[R_IPI_ISR]);
+    xlnx_zynqmp_ipi_update_irq(s);
+}
+
+static void xlnx_zynqmp_obs_handler(void *opaque, int n, int level)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(opaque);
+
+    DB_PRINT("OBS input irq[%d]=%d\n", n, level);
+
+    s->regs[R_IPI_OBS] &= ~(1ULL << n);
+    s->regs[R_IPI_OBS] |= (level << n);
+}
+
+static const MemoryRegionOps xlnx_zynqmp_ipi_ops = {
+    .read = register_read_memory,
+    .write = register_write_memory,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static void xlnx_zynqmp_ipi_realize(DeviceState *dev, Error **errp)
+{
+    qdev_init_gpio_in_named(dev, xlnx_zynqmp_ipi_handler, "IPI_INPUTS", 32);
+    qdev_init_gpio_in_named(dev, xlnx_zynqmp_obs_handler, "OBS_INPUTS", 32);
+}
+
+static void xlnx_zynqmp_ipi_init(Object *obj)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(obj);
+    DeviceState *dev = DEVICE(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    RegisterInfoArray *reg_array;
+    char *irq_name;
+    int i;
+
+    memory_region_init(&s->iomem, obj, TYPE_XLNX_ZYNQMP_IPI,
+                       R_XLNX_ZYNQMP_IPI_MAX * 4);
+    reg_array =
+        register_init_block32(DEVICE(obj), xlnx_zynqmp_ipi_regs_info,
+                              ARRAY_SIZE(xlnx_zynqmp_ipi_regs_info),
+                              s->regs_info, s->regs,
+                              &xlnx_zynqmp_ipi_ops,
+                              XLNX_ZYNQMP_IPI_ERR_DEBUG,
+                              R_XLNX_ZYNQMP_IPI_MAX * 4);
+    memory_region_add_subregion(&s->iomem,
+                                0x0,
+                                &reg_array->mem);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->irq);
+
+    for (i = 0; i < NUM_IPIS; i++) {
+        qdev_init_gpio_out_named(dev, &s->irq_trig_out[i],
+                                 index_array_names[i], 1);
+
+        irq_name = g_strdup_printf("OBS_%s", index_array_names[i]);
+        qdev_init_gpio_out_named(dev, &s->irq_obs_out[i],
+                                 irq_name, 1);
+        g_free(irq_name);
+    }
+}
+
+static const VMStateDescription vmstate_zynqmp_pmu_ipi = {
+    .name = TYPE_XLNX_ZYNQMP_IPI,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, XlnxZynqMPIPI, R_XLNX_ZYNQMP_IPI_MAX),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void xlnx_zynqmp_ipi_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = xlnx_zynqmp_ipi_reset;
+    dc->realize = xlnx_zynqmp_ipi_realize;
+    dc->vmsd = &vmstate_zynqmp_pmu_ipi;
+}
+
+static const TypeInfo xlnx_zynqmp_ipi_info = {
+    .name          = TYPE_XLNX_ZYNQMP_IPI,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XlnxZynqMPIPI),
+    .class_init    = xlnx_zynqmp_ipi_class_init,
+    .instance_init = xlnx_zynqmp_ipi_init,
+};
+
+static void xlnx_zynqmp_ipi_register_types(void)
+{
+    type_register_static(&xlnx_zynqmp_ipi_info);
+}
+
+type_init(xlnx_zynqmp_ipi_register_types)
diff --git a/include/hw/intc/xlnx-zynqmp-ipi.h b/include/hw/intc/xlnx-zynqmp-ipi.h
new file mode 100644
index 0000000000..4afa4ff313
--- /dev/null
+++ b/include/hw/intc/xlnx-zynqmp-ipi.h
@@ -0,0 +1,57 @@
+/*
+ * QEMU model of the IPI Inter Processor Interrupt block
+ *
+ * Copyright (c) 2014 Xilinx Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef XLNX_ZYNQMP_IPI_H
+#define XLNX_ZYNQMP_IPI_H
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/register.h"
+
+#define TYPE_XLNX_ZYNQMP_IPI "xlnx.zynqmp_ipi"
+
+#define XLNX_ZYNQMP_IPI(obj) \
+     OBJECT_CHECK(XlnxZynqMPIPI, (obj), TYPE_XLNX_ZYNQMP_IPI)
+
+/* This is R_IPI_IDR + 1 */
+#define R_XLNX_ZYNQMP_IPI_MAX ((0x1c / 4) + 1)
+
+#define NUM_IPIS 11
+
+typedef struct XlnxZynqMPIPI {
+    /* Private */
+    SysBusDevice parent_obj;
+
+    /* Public */
+    MemoryRegion iomem;
+    qemu_irq irq;
+
+    qemu_irq irq_trig_out[NUM_IPIS];
+    qemu_irq irq_obs_out[NUM_IPIS];
+
+    uint32_t regs[R_XLNX_ZYNQMP_IPI_MAX];
+    RegisterInfo regs_info[R_XLNX_ZYNQMP_IPI_MAX];
+} XlnxZynqMPIPI;
+
+#endif /* XLNX_ZYNQMP_IPI_H */
-- 
2.11.0

