Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp174583wrw;
        Fri, 16 Nov 2018 01:57:33 -0800 (PST)
X-Google-Smtp-Source: AJdET5dlyHXEjJj1WYOAXs4cqA8HCRyjzlHLt19t4VSK//lCSw5mYtsM4KT8YAzfzrkkXqIkl2DT
X-Received: by 2002:ac8:278a:: with SMTP id w10mr9525850qtw.149.1542362253485;
        Fri, 16 Nov 2018 01:57:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542362253; cv=none;
        d=google.com; s=arc-20160816;
        b=rcb6YH/VXA/ocYAp/C85w3OZK22hqJfgn0nL6RaQVZTtdz05R/rYmTb1Evsx5r9xez
         KUlMUxkhW0gLD7aJ9UOt85zC9Jt7Cwpgtv0w8Bp3Tjw+sLpJzUbCPZ8H/ZznK6t8czdW
         zRwipnrQFD+3DAdcASgc41GbLXIwY436RBVSHLq1xwBGhtF8zl19KY2sMAPbSJ/TfO82
         Gk2iiEZPUGEvoSbSOf2hw7PeQR6HgcbSEPkWThB3Oaj0+Togo326veKVfaBCTeodBrFX
         HfmEZ/rrtlGp/fEZ2wImrh2aMky4hAzRB4nHqF0Fiyb6AbvvigZM61N+d13cqj0LeReo
         M0Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:dkim-signature;
        bh=DVgmitVpPFnE2KwllSIe1Vr3VoukKbmVCw14ZH3G+r0=;
        b=RLtZWEbJqPLHJG1v+mdyRvmqPBbKmf6jckhMJdw5oqfbmTqURJsZNMpniLoRMzm8cR
         9cPJvRwuGTfwdGppUNTtt5ekG5y01FNyLxwX/NOaS5V8qEk2zJ/r7Czp1kAUUPpteuI0
         vmGFY2SWOn4AWFPDzb4Vh2W/F9rdGKKoIjE5clVZI9/JIDomgbZLIBzW/llZm2omFx34
         1VNEvgX98l8LlgZiReAcuYLkO/LUWw4hxjPj3ULMVfEzBOc9qJRPcIZ7tcPo/2oVlbZ6
         SSJ92VGHrPZQsA4JnYySEpCgmxMdW8F31f8m4r1teQzBHgmVR01YJ9ISpzaOa+2j2C9b
         6QAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=AFCqfH5m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h60si3157364qtd.228.2018.11.16.01.57.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 01:57:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=AFCqfH5m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43705 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNasX-0005ta-2D
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 04:57:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gNasI-0005sS-42
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 04:57:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gNasE-0001xQ-TQ
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 04:57:18 -0500
Received: from mail-eopbgr720040.outbound.protection.outlook.com
	([40.107.72.40]:5690
	helo=NAM05-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1gNasE-0001wb-Jm; Fri, 16 Nov 2018 04:57:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dvUmzhZh00ODbuJA8b3mwWtOaabWqM5GI4deuNVpn58=;
	b=AFCqfH5mY5hmTuHaanA6zWrQhr31MOaIAa9kTY+Gm9pzEpPy9ROSyLJDFWtdkFebzGT8YCY5WEtEysVo4ZRqMs1nH0uaMNRiyEyXHU4OEBXXzT3oW6RGWDi378Ig0KY6uPe9vtlH00yveU9coRcN0hVVTbK0wcuPhYdNUdhqRYs=
Received: from MWHPR02CA0003.namprd02.prod.outlook.com (2603:10b6:300:4b::13)
	by BYAPR02MB4453.namprd02.prod.outlook.com (2603:10b6:a03:57::26)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1294.23;
	Fri, 16 Nov 2018 09:57:12 +0000
Received: from CY1NAM02FT021.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::207) by MWHPR02CA0003.outlook.office365.com
	(2603:10b6:300:4b::13) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1339.21 via
	Frontend Transport; Fri, 16 Nov 2018 09:57:11 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT021.mail.protection.outlook.com (10.152.75.187) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1339.15
	via Frontend Transport; Fri, 16 Nov 2018 09:57:11 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNasA-0008T4-HN; Fri, 16 Nov 2018 01:57:10 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNas5-0002G1-EM; Fri, 16 Nov 2018 01:57:05 -0800
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wAG9v1oY029412; Fri, 16 Nov 2018 01:57:01 -0800
Received: from [10.23.116.79] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNas0-0002EX-Ud; Fri, 16 Nov 2018 01:57:01 -0800
Date: Fri, 16 Nov 2018 10:57:00 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Luc Michel <luc.michel@greensocs.com>
Message-ID: <20181116095659.GO7447@toto>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
	<20181115094207.22846-6-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181115094207.22846-6-luc.michel@greensocs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(376002)(346002)(39860400002)(396003)(136003)(2980300002)(438002)(189003)(199004)(106466001)(126002)(9786002)(316002)(5660300001)(58126008)(8676002)(81166006)(81156014)(63266004)(6916009)(8936002)(106002)(9686003)(50466002)(54906003)(6246003)(229853002)(4326008)(305945005)(478600001)(426003)(2906002)(36386004)(47776003)(356004)(33656002)(186003)(1076002)(76176011)(2870700001)(23756003)(26005)(33716001)(486006)(446003)(336012)(5024004)(476003)(77096007)(11346002)(18370500001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4453; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT021;
	1:Fq3nzC7GkOavnrctEUkJPZTHkWYGpHwzOelZdwuuz9r3iGL7+RbvO2UJtYTmNjL3wNwmezvh++CBoh5UB6B0HIQllXWOoAayqS3Y0V42L0sQYrAi52F/aY9dEKycXed1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7cfcd9dc-5060-4961-a251-08d64ba9e107
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BYAPR02MB4453; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4453;
	3:jlrQmPTPCIB2Aggmz6ZKnoATU9uO2NBUcKgx0qgYrlLpRKf4jENsF0urFxvGKiBDtxOWib1cLmwLWsCywpPAWTM13yn3+pYzDZuYSRBSBNW/jAbS39Khl3uL6yfCJ3BK17iBCCNNoIgXcMMRSCokVXFIs+MlruRWMjWQ5wwuay/NkGcDWDBaf2M0QPRcBQy8f6w1PI5TNDHWKUa0YXxdNd0tVAUGV3r7qiV+7aAGOVfflY7+xS61/ou4lm7dStnfI+dYypPJdjdN4orVImq+iT/YiTVytWKUtSRTnjfXqbxRNY1f4O3rYPmqjgmE626AEHT6QXuOB7Twy+q3KgiYkSsdnqr6Q25C8esb9oUyXbY=;
	25:/eKnsNZZ13MVOrDms/HSmNETNccPWAf+JsJbp39yxxERbfCl5gtDrf5LhdgDPJqZm2YVE4csE7a9rqL8zcvZWJK9jy43AMz0M7pYXEncIhs8gFVDsBQLi3NNzrbxcwBCg//M7cPb2sdA+enH7MR+/xKEirWepNX48ETbgbJKeAuGC+lblaXFXAkQNoaPe+HV62gu7qRKlbpzTUSUX7uL7owBwyDt98rWOj2fxNZgolXeuXuf1KHu5F1VTt6jTK0qFKpqPzTiRsMfK5C9mvI453hGEB8j/u/C7Lup3lKZE5EcnDrq/qCbXuo+d2a9buBC8ZKafFU8vWGMdtC7amylcA==
X-MS-TrafficTypeDiagnostic: BYAPR02MB4453:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4453;
	31:cRGvnadEEqZy5Rm2mOG+Ga1m6+A2imFryffh0hDW0vEzDgqWLSXgr6nERQci0LkWNFAVQwYOmSgE8vQtPIwkAbIBbGGUnbmQr7CIm2q9E971BQIeE8Ldo4CHzKNaLbjRCO7sly6SzqunjGnm3GbEevmBnZYA03WrvrufQF/K++RdLMIxwn34B+9e6dMKCkOnqKndTFhRjCq7VyRw0i+JO2fIzHVk0/9n6dSPlYoUAuI=;
	20:Sm8MTxDKBLnG0P8NYAgVh2UXeBux9vcPHKocYcVHQgvkmw4HpcTYr7MTZIiyiWmN34ycsYEUZpn19try01ISoWZg1rgvjXdVmnPMBXrzAR1D2okcePrP5IzeKQ58DwkqG7DUCHDVw5KQDFxOUCToz2PBbDmPcHKjBiLrNIXS3/pnTmlYElORstoaXfjKA/DQxTlGQqGz5T7qp5oxXo/EOH+W/oxJ5A02BVnGteBjI83dQwjyfQgQ0wo0OQSGp6ppuBlhe5yje0fTQWmP8uKJw/hKiw1et7CHNSKrlrYg043oPTBNvjJtHUj0SfGkpGKd7UJpASUOIK4cczc/QGCh5wRSu/7doyUkeBpSOpAUxCIavTDds8uoVYRmgdkq2TeHmv9dSn3e5/JtYHsVcfKWSpn56QCAF1Y+NflxRbkOQ2dwVpsOEqU7+C6bWWJvq1Rgl6b6eJRxO5Jvk8vRlnk2uAGORL8ALv4HLP9LOYqQnUuB96tr0lcH+jtdc7pAEUTU
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BYAPR02MB44535D4524D538387BE76F97ABDD0@BYAPR02MB4453.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93004095)(3231415)(944501410)(52105112)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:BYAPR02MB4453; BCL:0; PCL:0; RULEID:; SRVR:BYAPR02MB4453; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4453;
	4:I3V3+Q9ZhOarMiRuqpvNpXmCINSOdj7Q1Vxll4eZDXH0kKFYXVr5ouHzZQIbIeNlWsgMGH9xdgl4ZhFytrlTUmIJkbzLpeJyJsRrOMbfuibO5R6EYmj0nJInu2z5hzZ5NUcNsV7E0xjswHDZSjgF4ULqN1WtDuyKVktbw3nVW6s/Omk4EK8VXQzTtjOXA6+Q1+IpcmlU2XSFSch1U9Ts4dzCIApTwKG3TAnXH4ANWDQE7Yr81MKtLHjCEaoNB4LR70l0cw6kYHQ2qdsQYHUybRjvVxi+R2hZ4CC/XUMFhP33sPsYT52uKXJWlxPXrM/t
X-Forefront-PRVS: 0858FF8026
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BYAPR02MB4453;
	23:3x2nLp7rF/pRi1O+/w2sbDG0JyLDrN3RKgAxjlC1F?=
	=?us-ascii?Q?Ued5wlt3xRPeYlEwfFh6Czgyf56v6wPbMfaDR7r8jY7vhzLzqLZXmbJdVWGg?=
	=?us-ascii?Q?SFtsqB5umkPdiMJC/bL7flFu83J11H+n93DXbPoCrwUKGz1oeSWK7977gf/Y?=
	=?us-ascii?Q?liz7B34/CLk7NRQJ2i40XtpJgD0MjM964+DKBFk8RmxNw7veAkMjHvu1iyKw?=
	=?us-ascii?Q?uLWbM6HwgasPhtnxGl9oZgv8luh0qWTEyl66hG+YdqDQXpwwhX5cR/EmoofL?=
	=?us-ascii?Q?q+ucSP2ST0rc+V4jaractIabz85skeKO6/L08aTYhNNhaLUuvxAchJYphUow?=
	=?us-ascii?Q?hbeQjDZxtdMsuUzg32BX8/SYslV/qvC+nE9SbHRkvviqVc4S3vQgn/bolsjv?=
	=?us-ascii?Q?v+Z13Ti4zJFKAldYG66V/lTOxT0LHpICfOqIweWHXIY4NJ7OP/ArVK2jko30?=
	=?us-ascii?Q?sk+k/+btHXXYapuAYiDzwuHxaRI8lqvJBTSvQZiweQLuKqn4BUrpvoM2bA/3?=
	=?us-ascii?Q?UdbcgySVdN4856a2Rys0G7qgzLvs+Y7oWDdNrMuWmjWQD7yAfto6mqIFp+BL?=
	=?us-ascii?Q?6fuhDXXBQFOsMwb0Vk55X1ZozDQvwWGeU/RY0SzQ2RJH3JD2qJQ9FPGn+K8L?=
	=?us-ascii?Q?e3u9va/FTP4KJqwtD8A346EvmyUbXnHVKdC8CwLnBg5FEp3SwCz4J1Ww8qL0?=
	=?us-ascii?Q?zw9P6Qyowb2tyCwY/lrIaTR3caM5UaLm+EGUZ90+S9OvGXN/jqbDm/HdtI33?=
	=?us-ascii?Q?Y378QOFGndh+vaqWJMVtGFftREzIpVeJohKa0KfzrBu3+HClPeecNni0b/zS?=
	=?us-ascii?Q?Hbv834gKMmcZ9UhmUlJU2ucWlGvIFLC2jVqNXhNKqO8i32VG3xIySswrPTxP?=
	=?us-ascii?Q?81VOdPTCPtd6q2rzQPQ4KGer6AEeUBp8Q3aoXv9roKXp9aqb6XrEIhQVFQoy?=
	=?us-ascii?Q?u4GFEdek3rzW4Wpd18yZgQaD733uGTTf7zbMYJ6dSVzCSDyCFCL0TxyiEY56?=
	=?us-ascii?Q?XbVj++jcfVOo2YEa6qBkOipLfXtS7LT4+ZDpXqQ7OsxetoDp8MmKBoOP7KP0?=
	=?us-ascii?Q?wZ2AEVL5skHpG2V97r+GKwdsHaPUgsZVJcJJsmBB2c6mSFwz+LZtYj9hoKpX?=
	=?us-ascii?Q?EQ/h0jijlAdEW6TQXdRQsa2f0RDndtZL0v+7bKgs5GVjAny0gafiwtdiKZvO?=
	=?us-ascii?Q?O8+VFyQCWGF3Tg=3D?=
X-Microsoft-Antispam-Message-Info: 6k7F0kGVFJUsT24sBZjqCc9PjSWP7C2QTiNjCf0A0dcv1AjIQKDKIyaTED+MQJFp/vFIRFdWetiG5TqUnPLwcQNXg30aEV8d4G/6r40+rvk6ICBfx8d0VXLiJLznEP5v1lOqdIJn9YwE5VHMrbSTotk/5gBg8e4IFhVj9o7m75qasRvM8912lqX85YCkPqi3oxVg3D3OcEJUYV8dc5Nk7XyadTJvOT6X9nQR7ACXxrfEokAkt7mPguOBtaTgfs/0vw+gAZnsr/1faa8uOoNRv5y92xlgt5c1TdUyMn8GRAXGqqUbEp3l8WxK6HbqyJXXcS833JwvAgHU5AngpWlWNAQeTzOfX3FIC3qNCubS4w4=
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4453;
	6:+YIMNIwP3iCCRlPmrIk/xbObaBZOb1yoBMKzVnQTeeJjNleA9kVVJafC1/pGHLvwpmrxpz4+75jDTvjrOkFuErfyyD87MgXQdQEftdv3Jo+Mj++vndy2Df8IvAnwThRouWdxhKC1rtT/58mZUkN3Y1UuDxaZyhKqC3nJgVnTurHe4/BnM4bo/zKZ/3xWdJ/6satKJdTDe529BEG3DnE8ZB2z8mh/AAdzaHUXm0+ehpYIm760sy8oLey0yRkgejcRcyQwoj68vjOLZ1HwAUUtDErOfaTCx2uBrn7xC0L0/QDReV4NVYMShYe4ljIfGEProtd1SGrvMOVBqpGhfWsiUIAJhEfl+A2SAQslZX97iSrvIL/GszfahnipIh2p7L3KLEwB4UiAicriQN0T145G6j7Wadf/mnnp7Pfn1uDUmwBDGgEYqtgwkU/GHVu8xy39pjxOEld9GG6Jmf98WW+T1Q==;
	5:rH5KYZi/nED0JW/GpbD9C+BBJEb/HQL2PGM1yakxduUI87fGqkgyT51vLimSJCjTEHu5oN7OApTSdRgVaJM0SKj9PIixReSFRsK+uFp3xNf8URn8aSzOk9Xi7qG2iGntxgUnrdpEbBEE5AzaC9Ibsx2nGSYXfG65/DZFzyaY5X8=;
	7:GfKWTIl4614sZtw2Xx5TbB2B6ewxpgQQu2439TFrPRtWZ6QRvpzXztKpMcZc+wShILq9dyf0azzaUECQ/wyzgpA7J7z7dZ0rIodmgTsfJpDhoajPt0ME+vhBZXfe2gUBxnNY6viPsrAe6YzRmSni9g==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2018 09:57:11.0098 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cfcd9dc-5060-4961-a251-08d64ba9e107
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4453
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.72.40
Subject: Re: [Qemu-arm] [PATCH v6 05/16] gdbstub: add multiprocess support
 to vCont packets
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com, qemu-devel@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1ZPYmi834FCY

On Thu, Nov 15, 2018 at 10:41:56AM +0100, Luc Michel wrote:
> Add the gdb_first_cpu() and gdb_next_cpu() to iterate over all
> the CPUs in currently attached processes.
>=20
> Add the gdb_first_cpu_in_process() and gdb_next_cpu_in_process() to
> iterate over CPUs of a given process.
>=20
> Use them to add multiprocess extension support to vCont packets.
>=20
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  gdbstub.c | 117 +++++++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 102 insertions(+), 15 deletions(-)
>=20
> diff --git a/gdbstub.c b/gdbstub.c
> index fa2b7077b2..f1ec3481cb 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -716,10 +716,40 @@ static CPUState *find_cpu(uint32_t thread_id)
>      }
> =20
>      return NULL;
>  }
> =20
> +static CPUState *get_first_cpu_in_process(const GDBState *s,
> +                                          GDBProcess *process)
> +{
> +    CPUState *cpu;
> +
> +    CPU_FOREACH(cpu) {
> +        if (gdb_get_cpu_pid(s, cpu) =3D=3D process->pid) {
> +            return cpu;
> +        }
> +    }
> +
> +    return NULL;
> +}
> +
> +static CPUState *gdb_next_cpu_in_process(const GDBState *s, CPUState *cp=
u)
> +{
> +    uint32_t pid =3D gdb_get_cpu_pid(s, cpu);
> +    cpu =3D CPU_NEXT(cpu);
> +
> +    while (cpu) {
> +        if (gdb_get_cpu_pid(s, cpu) =3D=3D pid) {
> +            break;
> +        }
> +
> +        cpu =3D CPU_NEXT(cpu);
> +    }
> +
> +    return cpu;
> +}
> +
>  static CPUState *gdb_get_cpu(const GDBState *s, uint32_t pid, uint32_t t=
id)
>  {
>      GDBProcess *process;
>      CPUState *cpu =3D find_cpu(tid);
> =20
> @@ -743,10 +773,41 @@ static CPUState *gdb_get_cpu(const GDBState *s, uin=
t32_t pid, uint32_t tid)
>      }
> =20
>      return cpu;
>  }
> =20
> +/* Return the cpu following @cpu, while ignoring
> + * unattached processes.
> + */
> +static CPUState *gdb_next_cpu(const GDBState *s, CPUState *cpu)

Perhaps a better name would be gdb_next_attached_cpu() ?

With that name change:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>




> +{
> +    cpu =3D CPU_NEXT(cpu);
> +
> +    while (cpu) {
> +        if (gdb_get_cpu_process(s, cpu)->attached) {
> +            break;
> +        }
> +
> +        cpu =3D CPU_NEXT(cpu);
> +    }
> +
> +    return cpu;
> +}
> +
> +/* Return the first attached cpu */
> +static CPUState *gdb_first_cpu(const GDBState *s)
> +{
> +    CPUState *cpu =3D first_cpu;
> +    GDBProcess *process =3D gdb_get_cpu_process(s, cpu);
> +
> +    if (!process->attached) {
> +        return gdb_next_cpu(s, cpu);
> +    }
> +
> +    return cpu;
> +}
> +
>  static const char *get_feature_xml(const char *p, const char **newp,
>                                     CPUClass *cc)
>  {
>      size_t len;
>      int i;
> @@ -1081,14 +1142,16 @@ static int is_query_packet(const char *p, const c=
har *query, char separator)
>   * returns -ENOTSUP if a command is unsupported, -EINVAL or -ERANGE if t=
here is
>   *         a format error, 0 on success.
>   */
>  static int gdb_handle_vcont(GDBState *s, const char *p)
>  {
> -    int res, idx, signal =3D 0;
> +    int res, signal =3D 0;
>      char cur_action;
>      char *newstates;
>      unsigned long tmp;
> +    uint32_t pid, tid;
> +    GDBProcess *process;
>      CPUState *cpu;
>  #ifdef CONFIG_USER_ONLY
>      int max_cpus =3D 1; /* global variable max_cpus exists only in syste=
m mode */
> =20
>      CPU_FOREACH(cpu) {
> @@ -1127,29 +1190,52 @@ static int gdb_handle_vcont(GDBState *s, const ch=
ar *p)
>          } else if (cur_action !=3D 'c' && cur_action !=3D 's') {
>              /* unknown/invalid/unsupported command */
>              res =3D -ENOTSUP;
>              goto out;
>          }
> -        /* thread specification. special values: (none), -1 =3D all; 0 =
=3D any */
> -        if ((p[0] =3D=3D ':' && p[1] =3D=3D '-' && p[2] =3D=3D '1') || (=
p[0] !=3D ':')) {
> -            if (*p =3D=3D ':') {
> -                p +=3D 3;
> -            }
> -            for (idx =3D 0; idx < max_cpus; idx++) {
> -                if (newstates[idx] =3D=3D 1) {
> -                    newstates[idx] =3D cur_action;
> +
> +        if (*p++ !=3D ':') {
> +            res =3D -ENOTSUP;
> +            goto out;
> +        }
> +
> +        switch (read_thread_id(p, &p, &pid, &tid)) {
> +        case GDB_READ_THREAD_ERR:
> +            res =3D -EINVAL;
> +            goto out;
> +
> +        case GDB_ALL_PROCESSES:
> +            cpu =3D gdb_first_cpu(s);
> +            while (cpu) {
> +                if (newstates[cpu->cpu_index] =3D=3D 1) {
> +                    newstates[cpu->cpu_index] =3D cur_action;
>                  }
> +
> +                cpu =3D gdb_next_cpu(s, cpu);
>              }
> -        } else if (*p =3D=3D ':') {
> -            p++;
> -            res =3D qemu_strtoul(p, &p, 16, &tmp);
> -            if (res) {
> +            break;
> +
> +        case GDB_ALL_THREADS:
> +            process =3D gdb_get_process(s, pid);
> +
> +            if (!process->attached) {
> +                res =3D -EINVAL;
>                  goto out;
>              }
> =20
> -            /* 0 means any thread, so we pick the first valid CPU */
> -            cpu =3D tmp ? find_cpu(tmp) : first_cpu;
> +            cpu =3D get_first_cpu_in_process(s, process);
> +            while (cpu) {
> +                if (newstates[cpu->cpu_index] =3D=3D 1) {
> +                    newstates[cpu->cpu_index] =3D cur_action;
> +                }
> +
> +                cpu =3D gdb_next_cpu_in_process(s, cpu);
> +            }
> +            break;
> +
> +        case GDB_ONE_THREAD:
> +            cpu =3D gdb_get_cpu(s, pid, tid);
> =20
>              /* invalid CPU/thread specified */
>              if (!cpu) {
>                  res =3D -EINVAL;
>                  goto out;
> @@ -1157,10 +1243,11 @@ static int gdb_handle_vcont(GDBState *s, const ch=
ar *p)
> =20
>              /* only use if no previous match occourred */
>              if (newstates[cpu->cpu_index] =3D=3D 1) {
>                  newstates[cpu->cpu_index] =3D cur_action;
>              }
> +            break;
>          }
>      }
>      s->signal =3D signal;
>      gdb_continue_partial(s, newstates);
> =20
> --=20
> 2.19.1
>=20
