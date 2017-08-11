Received: by 10.25.221.202 with SMTP id w71csp1227202lfi;
        Fri, 11 Aug 2017 11:23:16 -0700 (PDT)
X-Received: by 10.55.113.5 with SMTP id m5mr20692829qkc.88.1502475795875;
        Fri, 11 Aug 2017 11:23:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502475795; cv=none;
        d=google.com; s=arc-20160816;
        b=jERzpeL2MxoaWop7Mc/fSBJu7OO6zEF8boHGakjWrmwcDL5XTw1zb5hD1ER0pmiCe9
         rafLh3EYSe9lsTEphDOPAIvgdkxqPPMigjQN2TaSjZv6YE8hSNeGYbXLs/Jsiwv2+rWs
         byROmRON60fyvE5tvite7R0tkquckepgGFjh8FDawL2ND4gm2/yndjnxKQTd8neCJU8y
         lAcQsyv4e/H67uKfmgwKOnoLdrLSYV2uF6+3HIsHSGEMdAvM2BReXRFNrn0MMdaJ3BKE
         0gxKzwBH55/bS5qfnVWaPKeReQm21WSEeR48GEZSvSLiUf6oqCauoVskK9efa5QuSBQy
         FtSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=aRyV4m8aNjrkGbTjm7ghD+WumYVX8a1P5VkfN1fzym8=;
        b=uiaPHevOoUM4heW/MNyPDzv0sM72brPgFvSnY5mEY/OT8JYw944jj2IyBBD/KjUyoB
         RQrkL2cRNZMJ2avylDb+DOKcfVOkg5VulxrzZMQq5gn8rVVbBg0dQApU4GxzGOgKggHW
         PEf3G1fjP4/WzYhdLxwmpZUYt8B+vkEr/VFd8oVwZzeNW7T6EIs+qJbwFgxx9k5sHUKB
         C4RjKGmZO2afJzPvnq/XXE7s6G4Q+t9fltguS9WsFSuZyXFB1Ys0RG4Q8+YXp5lSh7MB
         qEpxEYDBrOarWasPTlhgx+kOoIOIp1TNfS4xmG4HF51zN7vKXDnpjJDLc6zWMblkm2Nc
         dE1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=pRUaIPXL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v5si1301763qtc.58.2017.08.11.11.23.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 11:23:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=pRUaIPXL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35326 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgEaW-0000Dl-Tf
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 14:23:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dgEaK-0000Au-R7
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 14:23:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dgEaH-0007Rg-Mc
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 14:23:00 -0400
Received: from mail-co1nam03on0080.outbound.protection.outlook.com
	([104.47.40.80]:36672
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dgEaH-0007Qx-C1; Fri, 11 Aug 2017 14:22:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=aRyV4m8aNjrkGbTjm7ghD+WumYVX8a1P5VkfN1fzym8=;
	b=pRUaIPXL6PB5Fci7T4xzoyU18r3654FTrnywes/xHzZ5SNPTGUp4GxZGJdkvEBGuxMNlY2PUjl2z9Dkkza0LZNQcrN1+4vwh8stQ9lpstLqvwsemgipRUQz3UrLuWlb5ovMWN283AemkXxqWWo6NEZh3p3YTycz0waYlTlhmuH0=
Received: from MWHPR02CA0056.namprd02.prod.outlook.com (10.164.133.45) by
	DM5PR02MB2250.namprd02.prod.outlook.com (10.168.174.10) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1320.16; Fri, 11 Aug 2017 18:22:54 +0000
Received: from CY1NAM02FT017.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::201) by MWHPR02CA0056.outlook.office365.com
	(2603:10b6:301:60::45) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1341.17 via
	Frontend Transport; Fri, 11 Aug 2017 18:22:54 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT017.mail.protection.outlook.com (10.152.75.181) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1304.16
	via Frontend Transport; Fri, 11 Aug 2017 18:22:52 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:55456
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dgEaC-000418-Gw; Fri, 11 Aug 2017 11:22:52 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dgEaC-0006VW-EJ; Fri, 11 Aug 2017 11:22:52 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v7BIMlVB013583; Fri, 11 Aug 2017 11:22:47 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dgEa7-0006TI-Lg; Fri, 11 Aug 2017 11:22:47 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2017 11:19:24 -0700
Message-ID: <2fbcf76e4ff63d8527edd3662342948276e2cd37.1502474835.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1502474835.git.alistair.francis@xilinx.com>
References: <cover.1502474835.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23250.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(199003)(189002)(189998001)(36386004)(77096006)(47776003)(76176999)(50986999)(478600001)(2906002)(5003940100001)(9786002)(36756003)(48376002)(2950100002)(6666003)(50466002)(33646002)(81156014)(81166006)(8676002)(8936002)(118296001)(50226002)(5660300001)(54906002)(39060400002)(305945005)(63266004)(356003)(106466001)(4326008)(626005)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB2250; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT017;
	1:t7usNNjUzHU1vIJYakSt/jDgYvFEZuhmP+084K1DHmpK00BOqB0KnXE6BcNcunkQIhhetfZGTz+CJwvgsoCbSIQCXNUEbdJAfM/UzgjepZiWRCPwTDxap++3tiHK8AKsF+LUzJ+akGHJwk2Ge3Ms2d5O1lc5T4CAqtFxtRbhkt9wdIwhFPxp2IhtnkZBRt5zc6AyxJ6xWW/jnH8y8aLZJj8KwHO+3ozP2rCVog2F2FcRHQ/em15/8g2FUfbPUSlvNDRr+GhJ5c1OFL+j4uNIJqx+pHzdz59S202YWmBpuKS+egRKKPTVvVWTsk53eGy/wSveqe7idn6Vy25v9CWTMPJLa6F6bEilrgla4vVZ0w1I3SijnzKp8dxpAWPM3DIDSabaUJ8FKty3ogk+VV2R4kDPaNpcHIZE10DtFNdfQCZjT/8LgPaIuRFbTlqGD3cLn8vsVKrF6lnp7tWihsDnomlLJ2rDW3/I+8hsRIvMFhnry0A1blHa5qsf/qyYPoTsDGsyMn6HvBAPFQn/fRETNAPWbO/uvWKBVuPgWdibIJedG15FIj/7hFV0GQCQZKZixl7Hn6tHmrGSlu9CL/jjXa1iC+P71fxFdR0C/oew590nfTOEr8V34i1gwMISFHjJFuB/nWSUplkjV98sGBqV0kT+RlOFV+hOMtub8qoARtVTrjP07iVymsmLkrB+tgXC7J71vCTuVEMxQmH0m2/2LlATQmlQydk0ACRYROU9dORvo38kpES2Vz30vaeApcd/qvtzdoV+Pt0L1/mBUc9ZQTWBixf++wGy8A9wOAxpKIqZSUlCTFd4sb0Q3REFkvaBRhIffqFS04BPXBnf22Lzlw==
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9abd612e-e6fa-43c9-b5d7-08d4e0e5fb46
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:DM5PR02MB2250; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2250;
	3:a1KTqd3jD+L10/E57EiF3vz6dl7Md++IX98Zi1rZR7jp68C3Dm0cbB+bkyU/qqq5AOtIF8MldutHIjxULR/cMVy/y8JUZz7M+oid/d26LSHIpcqqQ1a5wFgNbh4k4Zt/y1clrCrTdeBDmJUi8WqcD73YeNY4HvJiaWuAOYBLK+aaR8X0sIoYz2vb1fVzCtGP+RG8c6x2Xo4ohqnbsKNtRinZy1N2OZNA8LYnQrubGX0SOOf1K56iKREIapI+7mtHfIQLir9y3vkxXW0StOuuGew/2OgFtlES3u7Y55MDAzJHPExteDKCMpXn+C2cHjCsu4EeiWmJqQb2hCt4ytMhWQM+/4ke4QZoZygnbrZq0YI=;
	25:lZMEFYw2zgFHPcnkkXmlDRw2Rj727o7ymw1nDG1r9dfNJiwWHILTCwxAgkgq4RnWFvowVk7vPg2gBD1WkzQbi+U0/mMGgu4uRztUBJH1rOtMHGxRAEfz4uEfD0sQDEh2So2IDe1GPSnFuCQO6vbq2as0dU6pMHuijmIMt5DKTHSc0e0VkhZLMLAb6oUKB+1QhPLkhv39BmKiUUd1tBUhqGlmxWN4G4MH+bEWQ4Ds2Fm1Y1CgB3SI+gWkKfgkHutfWBaPaYZDPF8xk8XnwAECBlbK0Yb1u7CwLt3/9JlkP9l+xfqdrCKPmcn2mnmxX0yrBYMiwRAX5oCRtdb+WtLFxQ==
X-MS-TrafficTypeDiagnostic: DM5PR02MB2250:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2250;
	31:VU7PIhyjpsNq/CigX1VLlzX/h9lpK9QibHhOPnJ8agvjW192CQYkvPtWajHFsgfO8bftX7Sa4TB5q0MHEIPWQ0uXWT1KFy//+FrzllNpCfRLnSA1Uo1FhBz2qVCDiCRK2O2/wVTIHU4LrHM8To1+OMA9UJJwiFseaw49sGsXsfzeMzxIPPFxJtpGz52kG56FoXsIalEEZR1zBy8ISpgESCw9EZnfQSc7xax5/1WE3YY=;
	20:nlrUC3P5iKZGjh2U8oNueYmOZ512KHiBdm4/3qihHygxQEFNWt+WAs7VzXrZL7xGMjaB4Zl4r4+SD61emeibogDltvizP+HRCm3Bd4u7PxLHAo6j5YCfXthT5D3jaIPrLMZ74tf+JcaFDVBZ3UrXxT/VuVkeFByI1YCHQP+kkEIuwB/fomE7x7DAlusm8NOTD3I1HoAIplJXjLFntBSJtMbfD2rWJNscO7q3TWb1aWW0LE2P6mvSWQDodzTbexReH4SjQeCKBegeiwMeAeabb8KVCvo61pYqGiOo19ZlnEBW0/z12MxoT++2kLKHwP33EeQ1kat5w/wJPjCUrSNVrTLG3MyfQJG1nh3L7kLqDwuZtEod0at1xn04OOJVctfZVGziVREn1gp4TNfFDhOr06EnE5hlzX6UplQvRf4REFL/VOAj5C80+pol2cMJ2mOGOPIQZ4uQC2YE/Cqf6AjmCweNKoLFbOHn/+4jScP5a8Gz0plB4X/dvoPEUCUzUY5O
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <DM5PR02MB2250688C5A5CBE624B3ABB31DC890@DM5PR02MB2250.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(13016025)(13018025)(8121501046)(93006095)(93004095)(100000703101)(100105400095)(3002001)(10201501046)(6055026)(6041248)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123555025)(20161123560025)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR02MB2250; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR02MB2250; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2250;
	4:7tOShZef+HSNwu+VlM6HjIg4TAiVxaH17DOpEDFy0elb4Plhv7KP1K7elC7CrS15+t363hSvKOO7pa6QCos+yHmCIltt6gdx2675qSsS0MYFZgtABPC/0stk5Ew8Ulw3ZkV09HyrgHJ/nMVEGdaebvLRoTw6CehUArNYl4FhZ/bCyqAMY3LM2cXCTFoij1RqUvvtstnofATvpdicFEb5rx3NZgL/A1szB6feZhs7JKj0+Lp8eLPnPdb574ypc8HvHoRs3N73Nw7fHix166qCwHP0JNhrVt62dtFrjZJGYTM=
X-Forefront-PRVS: 03965EFC76
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR02MB2250;
	23:eZnwBE2492PKaqBJiFKtQRpvOvlN6+GKngB61nGrW?=
	=?us-ascii?Q?2WMnc2JnJvfgJQnvjfP7vkoQL9+8qWqz/Fl1Dx5Ok+VmBspL9yf0X6u7c8Fu?=
	=?us-ascii?Q?/yTDtI480aQIL/9iUIrXTtzWdgqON6mH0N/x/9Iba1Yp1lXAlxzeIBSGtyOG?=
	=?us-ascii?Q?gzX/huO8e6AGQJB4yfY1q60wfzXglVkphh4zocpeVc4pDLfKjZEcCAe/t2R/?=
	=?us-ascii?Q?4IM2BZkf909lyhN6f2bRDRWqzpA0xEV7R8iVJVko19S9xnV3/4DbfNtCFmKu?=
	=?us-ascii?Q?5Tt7T7lEC503DomgjBeL1kyaybBWVGyqxmVNgljaMyPCaU982o/uQvaVccG8?=
	=?us-ascii?Q?6d20ETbdw2OMXWVSZ38IKRLtVRARYI0XpbYvV38ir6oC0YKJXOWfpcpczmGa?=
	=?us-ascii?Q?y7z2zI5DWY7g2z3dFkDn6W/7ceN//Lxtz3BL28AbO80FueVui5+pZF+uWamE?=
	=?us-ascii?Q?25xioqlLL+68rpfF5+JOHiircJWymTj2dgK3t7dxCR6z/rdAgKmSLBtT2BE/?=
	=?us-ascii?Q?haVSHlhNmoAzNeEHwGoae8vhlnvspqddxAXMTr1V7JPI3rM4JnaoDbWG0/du?=
	=?us-ascii?Q?qF0lM/2NHOBEkMJSCIjVXt6U2TrbIXdbWjh+L/SfAa/hFW8pv9+ZctqePAnB?=
	=?us-ascii?Q?nuKwERTiJB6GLp6OlVmMVrPSxrU3GTjJDVOJfRWP3muFDzXz80yUXx3aRFw+?=
	=?us-ascii?Q?qvFyizshec9BK23Ln9BBwLGZpT7iWxCxGB8B99sEON6J3QzKArHQrmIN2mjr?=
	=?us-ascii?Q?x4USAMo7zzXSRIdDAnoSS9AQsflUAVguIHdOdMqqdH+RHHxbusPiMBccfwRD?=
	=?us-ascii?Q?JVQFOhQo6mV1sQ2sHiq0P1P8fKvtZe3DHGocc3pNOwaPKW6Oq1Jk+yTB/25H?=
	=?us-ascii?Q?Z/wQIr1OEuCJ9F3ziqPr3aQHJQqLnltCjtylRkSgMi5VjVP4hrP3z9zlaUdD?=
	=?us-ascii?Q?FdZWIdO4bstVk0Eo/iuY/JhkCpboKncyHPcu/pTRw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2250;
	6:kRhqkDQ3yulNc2V95LKmWGypMpgPMJl8MSKwkOxFCTGFSES7WYvArjpGB9o6z66Tp9+EIWwqoJWdMk7trbqdUnyBGJdDpFsj2ND/by4yY9mqULjqHP1N6L69cFiTc7uv+KknVQBn2CpG8HqZ7ccJJl1fz+gzMTmu+1brZkFLzrx5HYRH9/L4jbkIZF3dOGOWhdl7cOE2lBplpPCSvHC+uXwCD5de7QrmWocVHEOAsMau7fmNmxawRg5rBNIY7xm5RKJOdoocTGY9oqMjwsbX59/Pwyg8JERbSWOPfJmNgeCg5w3HsdyXH/aeWx1YR8aeux39OKQvBRj2NIUR9JkFfQ==;
	5:wD+aan/sHpRpUyleVW+MQuuQGUxJTIN3q8zGop3naRpFiU6S9ME+IwDiS8WaF+iBFPGFTTir5Ooclus/21mC0PRaCIjxsfBCu7IPtB1XJoRTKFVR6EUyEE+h+s+DXZsg4921R4B1K7L2IPSnRiJZgw==;
	24:P4sF203vS+8CkNdnsJkpliq0JDtw/3cejpyIGUIyjLKsMYWeer80/CedFrrC0GHEQw6rkDvbeEDooKbkn8JDvCaX/PFKAIdi1ECK34UPhjI=;
	7:LGUee5ZklgPxa2iHlulA1JSQ4ugX4i7aYaLew7yk7SXSlBSjOQkhPgIuwrR/DyBG1W4kkT7kmp1BnH01y9wrCE3a1P4BKlpeOakPFVlefviScNezvYrqafeabL1Wy8r8jXy46kXomK4ND9xPPpGBgOo8lQA5jaBE3yP6lauKJxROmvvTDsKEdeeEC5ZhEeunrfLdRBc+B7rzrYRV1d6leX0qYNc+AnWTDNxdhgMezLI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2017 18:22:52.9555 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2250
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.80
Subject: [Qemu-arm] [RFC v1 3/3] target/arm: Correct exclusive store return
 value
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
Cc: edgar.iglesias@xilinx.com, alistair23@gmail.com, qemu-arm@nongnu.org,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wam/sLZbTgV3

The exclusive store operation should return 0 if the operation updates
memory and 1 if it doesn't. This means that storing tmp in the rd
register is incorrect.

This patch updates the succesful opertion to store 0 into the rd
register instead of tmp. It also adds a branch to fail if the memory
isn't updated.

In order to add a branch for the pair case when size equals 2 we first
need to apply the same memory operation on the exclusive value in order
for the comparison to work.

There is still no value checks added if we are doing a 64-bit store with
pairs.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
This was caught with an internal fuzzy tester. These patches fix the
Xilinx 2.10-rc2 tree. I tested with the fuzzy tester (single CPU) and
Linux boot (4 CPUs) on the Xilinx tree. I don't have a good test case to
run on mainline at the moment, but I'm working on getting one. Also
linux-user is fully untested.

All tests were with MTTCG enabled.

 target/arm/translate-a64.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 245175e2f1..ea7c61bc6f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1894,10 +1894,11 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
      * }
      * env->exclusive_addr = -1;
      */
+    TCGMemOp memop = size | MO_ALIGN | s->be_data;
     TCGLabel *fail_label = gen_new_label();
     TCGLabel *done_label = gen_new_label();
     TCGv_i64 addr = tcg_temp_local_new_i64();
-    TCGv_i64 tmp;
+    TCGv_i64 tmp, val;
 
     /* Copy input into a local temp so it is not trashed when the
      * basic block ends at the branch insn.
@@ -1907,15 +1908,15 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
 
     tmp = tcg_temp_new_i64();
     if (is_pair) {
+        val = tcg_temp_new_i64();
         if (size == 2) {
-            TCGv_i64 val = tcg_temp_new_i64();
             tcg_gen_concat32_i64(tmp, cpu_reg(s, rt), cpu_reg(s, rt2));
             tcg_gen_concat32_i64(val, cpu_exclusive_val, cpu_exclusive_high);
             tcg_gen_atomic_cmpxchg_i64(tmp, addr, val, tmp,
                                        get_mem_index(s),
-                                       size | MO_ALIGN | s->be_data);
-            tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, val);
-            tcg_temp_free_i64(val);
+                                       memop);
+            tcg_gen_ext_i64(val, val, memop);
+            tcg_gen_brcond_i64(TCG_COND_NE, tmp, val, fail_label);
         } else if (s->be_data == MO_LE) {
             gen_helper_paired_cmpxchg64_le(tmp, cpu_env, addr, cpu_reg(s, rt),
                                            cpu_reg(s, rt2));
@@ -1924,22 +1925,23 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
                                            cpu_reg(s, rt2));
         }
     } else {
-        TCGv_i64 val = cpu_reg(s, rt);
+        val = cpu_reg(s, rt);
         tcg_gen_atomic_cmpxchg_i64(tmp, addr, cpu_exclusive_val, val,
                                    get_mem_index(s),
-                                   size | MO_ALIGN | s->be_data);
-        tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, cpu_exclusive_val);
+                                   memop);
+        tcg_gen_brcond_i64(TCG_COND_NE, tmp, cpu_exclusive_val, fail_label);
     }
 
     tcg_temp_free_i64(addr);
 
-    tcg_gen_mov_i64(cpu_reg(s, rd), tmp);
-    tcg_temp_free_i64(tmp);
+    tcg_gen_movi_i64(cpu_reg(s, rd), 0);
     tcg_gen_br(done_label);
 
     gen_set_label(fail_label);
     tcg_gen_movi_i64(cpu_reg(s, rd), 1);
     gen_set_label(done_label);
+    tcg_temp_free_i64(tmp);
+    tcg_temp_free_i64(val);
     tcg_gen_movi_i64(cpu_exclusive_addr, -1);
 }
 
-- 
2.11.0

