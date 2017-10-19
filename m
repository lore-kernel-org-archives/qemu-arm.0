Received: by 10.223.197.9 with SMTP id q9csp6988906wrf;
        Thu, 19 Oct 2017 09:23:06 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QZEJrBWXXH3oob+yG+s0bCbhyBlA5QB+qaoeAKEhoSPY8UFAZgvia2OEj5PfbfWZBAy19+
X-Received: by 10.55.21.99 with SMTP id f96mr2754689qkh.315.1508430186203;
        Thu, 19 Oct 2017 09:23:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508430186; cv=none;
        d=google.com; s=arc-20160816;
        b=F0z1OtMfYOlmv1g8v8B+FTo/CQZRaVisLB+4x6wrzuFBOfgDhrzZoid/aA4awyd4c9
         PNWwJp8yJUNH7HPfyuVqo6orMF/fA/rGhIvFva7u0lmeN6S/ZHkpzfRazSWutxR7R6Od
         k2pXK10czAbllIxdVrBdHFk0Jhz4d1tX6896Prrhu0+hrjOexrvNQY/Ygm+JyPQELToQ
         zgMNHtFtS5zoBGv4xevGN55jjxEOqNy3rGQaqdAQPjjwdVsVbZ2sxAYRUpyd+zzKDZQm
         5WqQAdlNsUKkpB6c15t/voPXnxR39nw0YtLkaKyENgbry3MEccqm0MdvLULuyn4DCPbf
         dypA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:to:from:dkim-signature
         :arc-authentication-results;
        bh=kKqEYdZHOChqGWfZoSood7d1SlYpBZKgWSEIBpbGVUs=;
        b=0RDVOPIteWaZy1Uc3/DkgRUBGC1Yan25OAMmejX0OijJ8+C/EsTHU+if88PHJZnROv
         JN1N0BKvMfLJ4XjcdIfgpdQY5Fk/+AiiY/B4jlu74d+gdW4xjMByr+cK6xMjgEnqjBtQ
         8HHlJnJRBafrKTfNu59dhwTQ6hF3jZ+IkEYT2b6zGtRxE4f9DZfk4oj5bTrrlTpgSZRj
         X1EAr7swhgFY6SFnydsD6TjQOumZb2WFHxatGhoNQ/STy7HC1PMxTOH/Mw/8CQkEH53N
         4xu1z9VjxEmLGArmK5qh8AnFzdXWYpJ4Wu5UyLdUUAq0+RMI+2oNLl//t3pF3FJknNTO
         hERw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=KhW/waQJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id i1si6850910qta.167.2017.10.19.09.23.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 09:23:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=KhW/waQJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5Db5-0006S6-IS
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 12:23:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1e5DY5-0003zX-FC
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 12:20:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1e5DY2-0000py-36
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 12:19:57 -0400
Received: from mail-by2nam03on0053.outbound.protection.outlook.com
	([104.47.42.53]:60416
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1e5DY1-0000pL-JK; Thu, 19 Oct 2017 12:19:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=fhgYYOR6d2p0s1BGiI8l9ZAqtp4Rd2lwqkLSZp1GUnE=;
	b=KhW/waQJettJjBC6Oxh4VjVmVxg6QidKP6zeitAabdPzuIz0Ag58t9pjRwY/56FTUDBQRBP7jIEV+cKGcHo5JaoM3BiDlKGC18I5vFmj68NM+qi/CDCIrUhpNTTour/yCMEj+yrE6ehzMdKHb4jqD7cUf3h973QXV0cBsiZBMmk=
Received: from BY2PR02CA0003.namprd02.prod.outlook.com (10.163.44.141) by
	CY1PR02MB1335.namprd02.prod.outlook.com (10.161.170.26) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Thu, 19 Oct 2017 16:19:49 +0000
Received: from CY1NAM02FT022.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::204) by BY2PR02CA0003.outlook.office365.com
	(2a01:111:e400:5261::13) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.156.4 via
	Frontend Transport; Thu, 19 Oct 2017 16:19:49 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT022.mail.protection.outlook.com (10.152.75.185) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.77.10
	via Frontend Transport; Thu, 19 Oct 2017 16:19:48 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e5DXw-0008UI-4t; Thu, 19 Oct 2017 09:19:48 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e5DXw-0002R4-1p; Thu, 19 Oct 2017 09:19:48 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v9JGJlRW003107; Thu, 19 Oct 2017 09:19:47 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e5DXu-0002Qz-Rq; Thu, 19 Oct 2017 09:19:46 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 19 Oct 2017 09:15:54 -0700
Message-ID: <40f44a01e122c59d5cb32c53dd2653e15145296f.1508390588.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1508390588.git.alistair.francis@xilinx.com>
References: <cover.1508390588.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23404.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(346002)(376002)(2980300002)(438002)(199003)(189002)(81166006)(106002)(50466002)(2906002)(6916009)(36386004)(118296001)(2870700001)(8936002)(77096006)(47776003)(5820100001)(4326008)(50986999)(63266004)(76176999)(6666003)(5890100001)(39060400002)(23676002)(5660300001)(8676002)(2351001)(54906003)(81156014)(106466001)(33646002)(478600001)(305945005)(2950100002)(316002)(189998001)(50226002)(356003)(575784001)(9786002)(36756003)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1335; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT022;
	1:TH3AkOKJiAyU/sRjeAjc4MayKajHH0wSdzEVlWYZ5ZyyyyFayi97WPDjozmabYI+qEhXo1zFMMCHmxqDeYY5Qc1DsF0LvyPcjTaLQBr0sY1ojHA8W9DUea63YTRVIP4/
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67127f40-8787-414f-6164-08d5170d3868
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254168)(8251501002)(4534016)(4602075)(4627075)(201703031133081)(201702281549075)(2017052603199)(201703131423091);
	SRVR:CY1PR02MB1335; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1335;
	3:5WcdAQNr2y8M8ZduXMGMQBqqrFL2WA3kk3Ghp7la0ksiRgGWe5VR5p+4IlTChGWeG1J4hZdgNjkexN1DCirYhZoIc4EvkgC8oJeVpIK/h7ev4t5V/rvnxzDfK+RqEaI8SB8+LBj7+aASMwnrPw5GcpeCXNKP8I4i/FbFfiGOk0Lsv9D7gwRpNVaEzL94vu8h0b6jzrENX934MSt+vrrs1TH+iw2jXusoIAZUy34yLEEPWImi90P9YaYqUMOqg2HVRWSV/JjsUqfBIqGtiVzRufzbVQFnQ/5fLiD7B6/Ro2SM5D/yifaB0QnblhQsxY1NeiLjGBJGM03RvKKqahahnJXvN3DjQeO4Kg6wET86fEQ=;
	25:wcP9gdcHj7b2s4CuPPmoVzPrv7ZBYfmM4X6iqLBSEC709pTiz4uHvBV1XMCdQ55sqAliaSDelZOoWR3rpTtv9Oitb0NRGqe7qVpmsraJH8d3gyqzgyPPBF4t7Y7Z4meQ8+3AviMgHZdYg9r0Rv+Rbol7VnNM7PtGIF6ZAsxsH+MxjggTCyfNuctBPmkOnq/raX3Yp4PDb9KMv395WVEVRhXPL1Af9pftjuTSxWjvYTXmSS+kfWQ4twxf3iISs/LahbJuZmvqLuxpNBcf2NaTjqYTcfZ+6PBMRPVicqZCvRurWRTzGhzZNnAT0ALxvWktZeW4AQ2FO5n904AbrkRF4A==
X-MS-TrafficTypeDiagnostic: CY1PR02MB1335:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1335;
	31:7g/b7kBSh2TVmZRvdqfLnzfChEjtQsy6exd8hq02WvHVukDZ4A8ViRy+mEWlZWXckXLMIo4zOp6CePygk2IoxPL+T1Tt7zSzqk/foc0Wd/mxUYomkpnVw5jMdatlrximk6AmtpLxIEz4zjA79NMJPAYUE7vejwzzIa0rKtlWxW4WiJgSbSNRClsWBKosBDAMHBXMfAvA5n0f734F9Oeomdms3pbePmF0s0UT23GCASg=;
	20:yNLNONQZ+7R0Oupb5qaoQePrkiuWeMSEbapMzxVvnWeHA6hv0HABmDcnpBKz0qBAhm0PAPHCGHxYDaVCGgsl0kDwoY/ygiTb7R2lxK4oyrwW0rMueCRC6qY/PRGKke0yXhf/sZQsj5pKK7uKVZHm093Xr7gtHUxaCeQokXCMsU3EIKyyAbZO6a5wcoyJIG9ONjepAqd7PEEFcTrtwsbazwPJqu+Pk41cw+kuRbLJycZalppTJTFAXq6uelNxC21ruFNeverdjyK6OzXa4zIdOIIhcnCMWhxPwW2++Ed4ipLKOIx9y4cV4Jk0c3SJjek9VgTVDAQMB+HbxPRQu1MuKboPRcXpw/nEkH5BsYtcz/vtmJvwRKtQpfAOMME+cb3JE7ltwM5Ct395eeybc8XQhOlZyROTteGGfHsbljLTO4dzfyzppshsatZw0oJpwL127c+0OgLP+UaolC/Rc+cyYXkOk1hquwDDB1gd7L5uoNvOIaDKXPQ28SPBz36MTH8A
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Microsoft-Antispam-PRVS: <CY1PR02MB13350F1569A29EEAC10871E5DC420@CY1PR02MB1335.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(93006095)(93004095)(100000703101)(100105400095)(3002001)(10201501046)(6055026)(6041248)(20161123560025)(20161123564025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY1PR02MB1335; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY1PR02MB1335; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1335;
	4:PL6/Kf6dNkYipAN8HqOmQiRVkCM1fTWAfqVAjUy7YVab+ywq4ZtUzZsUm5bBM3B0WKnvkPNHNlQ7rwRKpeQ2iMm/iA/ZkR9RExByrhl+oWTh8M+WUccG4vB+GPcC8xFWeoXKDbyyfedjwV8RdM8rGUA5grbQhQ2C8o0j3tYxFaLHV5aaN0bSrLsT0xNdy85JSOCz9eFXF2QM5frKMQLUaA43+qmpbrQ75HLaTl2TPqXVqfTFjq+xeGAwZ/dmzbsNwHjvw/uLJd3zyjBImlOUCRs5n0hC6I+ZBVHCP6AQA0QWQhurRDwSXJSRcV+97TROeCBDChVDiVY2d9Oq7WgcIA==
X-Forefront-PRVS: 0465429B7F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR02MB1335;
	23:BfxdsVPBzuYUF94DPXBcuixzydKOa5bYRxpaxzJhj?=
	=?us-ascii?Q?pKdBdg27TRp5S5rBjJcKzvncSbrZhE7zyWjHTt7yhVFqnYpJigleMF0OG3FB?=
	=?us-ascii?Q?ZrM/+vocPWNkdVIGj9uzFd5Q3GECiSQkP1TznP232oj0qzzZV1Fw33gXyY5l?=
	=?us-ascii?Q?DFKsu52VrE13xKvIiZqBWuHKCiCGmYduOQlU7/k0IN7AyzZ3rNc1eaNYMWau?=
	=?us-ascii?Q?EAdlzyV8Nn6mP27fd1aI8CKxGPJ4qB5EkdwMhJkDJCoexPiSs9FXg7ieG8w2?=
	=?us-ascii?Q?3snCiiinu/Deh45gyMz/7cVg/W2anpuZysRa8u08oEsu3VDsfY5FPQK8k4+t?=
	=?us-ascii?Q?oujm9CtoKOMnloZ0+54zBw+2QlUYJf/wvqaKkuAhIU/B2CHSPBBS7+IjRgWk?=
	=?us-ascii?Q?4mMy6yVfUcFY/fXSvBlwFB1n7YytG3f7i9Bw+RfVGTlGRtiDM4xXyx2IkQsJ?=
	=?us-ascii?Q?KBc16yRNLxBZazbYWuH6BeletpAVMMCqK6ZNm5AShT23+fy07bWzj/B3MInq?=
	=?us-ascii?Q?koe5weRN/cnQ5UdWh93irHTq+WS07MAs6JNmaS5huCFFjsUGBiCRTDcOdIsl?=
	=?us-ascii?Q?OTjMs+TxpdpGIDKZCP/fUwDeWeawOSaV4QRG3CZFIIxI0B0foxnjRsJYsM7x?=
	=?us-ascii?Q?UnyaQESuysAtiYcEDQWDw7JG0V5wwV/HwuFyxJK6OYJaYTq93hX/KdWLyT49?=
	=?us-ascii?Q?zWdSsR7ghKRcgfTmSxU4kIz2ybE0aBStm8qc6Y6yE+QBMhIfq6ZRbKj3B7+q?=
	=?us-ascii?Q?d0+/qLetfdcA/I91v4eQ4bLeLB8wnD9D4Cn3Z9febwv/VK45ob9dc0GsWqck?=
	=?us-ascii?Q?F22fyz4ZLOKzrRlFoH8dcbVk7zyhm+ddPx9IX5wdy9vlzVY6WhqZavMFwEJO?=
	=?us-ascii?Q?VxV+aokFsrQoVAsqFOA9HBiTSbfEIcmtnQ1I/utnNrMBSl+HlW4T+a3jdM1I?=
	=?us-ascii?Q?4tUug04B6DatE5m59Fn5yvtGbdHpwah8CiUxj3lz6r3afarlcKy1ubaeH5b7?=
	=?us-ascii?Q?StgSskQcCQdDVcMdpE8y2P2IJ2pAxoEPKn0VJVc+EYQLPhWs6YbypEtnI8di?=
	=?us-ascii?Q?gNpFhGBlPhwcvSB8rXVZ59w9bkpXCle7HIJ/scDqgefH/BVaw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1335;
	6:JaufXwJc6Df4T+rmu1RqgxjgteajRuaBlrRtbcHKd5O4clEM5WoSnDAQuGBJO3G6c2TLCpXjP1TB7hLD26Ho1DzUJnMb4+hLRrKx8N1Nne7FfQsGLxkv33yiWEQKQdv0k/RNh/PSHNscesf3EE7wAXSH4OshzWCj1+itsjST/Oe7m5a/OIU5OuCo+YRjWggQU8cvydYxSqFFXLFFo5b6H7LVxfJsTNlB6pQp+u9mXN1SLqdHp/q5/FY8npNnd6rWI/yFPagxFCsQRsLEYSo3y+6L3UtrgeJ1LYoz/vOFuM2AIuNaVborbXp2hTWYWUXDr3FOICB2Jn+cBIoEY+/MZA==;
	5:SqrrLMBo7c6Vp3Hw8Gl9+To5liFjny1a/R1hy71hgVlGexWBWfgEOFkhoj2pYn5RHNYOP6V4sUoBQaBT6QFMYFbJsfBTDGez/NVY/H8EAGxog5IoRYCYVfE/7oKmrwviQrkvhFEpGjgp9l1c6I7/Wg==;
	24:8z5jmO6SD0x91gK1z49p7WH0gwoO0yI/QKRl7Df0K/xWDCiLduJiX26IX4cCtkPTPZuxuWD28BMZqJf7U7WxktJC2V3s6KIGNC5u3ioE3iQ=;
	7:PAAxOMsnPYxTA/9SiQci5IelyxcpAaiDCjUkY1QygV83Tk3ZOcmIBQZT5qGnwYVbYvj9wQ46MTOCtDJzB4CbdFnkCnT/9dKQ0qKTB07T0zF7p1BbiDuPH/xHmWzwXqrcb4zQ/T1uFv7in8kAcYYogvOzDgneKqQzAkHTfxHGJKsBPwIEWihElCnXhzcm8c9ZsIREvKbH+rRc6s6gE/hH9NAqrnk9wuumgbOZjGAU284=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2017 16:19:48.6796 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1335
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.53
Subject: [Qemu-arm] [PATCH v3 05/46] hw/arm: Replace fprintf(stderr,
 "*\n" with error_report()
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, armbru@redhat.com,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zvrS3gXRfceG

Replace a large number of the fprintf(stderr, "*\n" calls with
error_report(). The functions were renamed with these commands and then
compiler issues where manually fixed.

find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_=
report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_re=
port("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report=
("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("=
\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1=
"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\=
2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2)=
;|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|=
Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig=
}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}'=
 \
    {} +
find ./* -type f -exec sed -i \
    'N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +

Some lines where then manually tweaked to pass checkpatch.

The 'qemu: ' prefix was manually removed from the hw/arm/boot.c file.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Cc: qemu-arm@nongnu.org
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
V3:
 - Remoave 'qemu: ' prefix
V2:
 - Split hw patch into individual directories

 hw/arm/armv7m.c      |  2 +-
 hw/arm/boot.c        | 37 ++++++++++++++++++-------------------
 hw/arm/gumstix.c     | 13 +++++++------
 hw/arm/mainstone.c   |  7 ++++---
 hw/arm/musicpal.c    |  2 +-
 hw/arm/omap1.c       |  5 +++--
 hw/arm/omap2.c       | 23 ++++++++++++-----------
 hw/arm/omap_sx1.c    |  6 +++---
 hw/arm/palm.c        | 10 +++++-----
 hw/arm/pxa2xx.c      |  7 ++++---
 hw/arm/stellaris.c   |  3 ++-
 hw/arm/tosa.c        | 17 +++++++++--------
 hw/arm/versatilepb.c |  2 +-
 hw/arm/vexpress.c    |  8 ++++----
 hw/arm/z2.c          |  6 +++---
 15 files changed, 77 insertions(+), 71 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index bb2dfc942b..56770a7048 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -278,7 +278,7 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kernel=
_filename, int mem_size)
 #endif
=20
     if (!kernel_filename && !qtest_enabled()) {
-        fprintf(stderr, "Guest image must be specified (using -kernel)\n")=
;
+        error_report("Guest image must be specified (using -kernel)");
         exit(1);
     }
=20
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index c2720c8046..6e6b8c0c6a 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -8,6 +8,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include <libfdt.h>
 #include "hw/hw.h"
@@ -418,13 +419,13 @@ static int load_dtb(hwaddr addr, const struct arm_boo=
t_info *binfo,
         char *filename;
         filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, binfo->dtb_filena=
me);
         if (!filename) {
-            fprintf(stderr, "Couldn't open dtb file %s\n", binfo->dtb_file=
name);
+            error_report("Couldn't open dtb file %s", binfo->dtb_filename)=
;
             goto fail;
         }
=20
         fdt =3D load_device_tree(filename, &size);
         if (!fdt) {
-            fprintf(stderr, "Couldn't open dtb file %s\n", filename);
+            error_report("Couldn't open dtb file %s", filename);
             g_free(filename);
             goto fail;
         }
@@ -432,7 +433,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_=
info *binfo,
     } else {
         fdt =3D binfo->get_dtb(binfo, &size);
         if (!fdt) {
-            fprintf(stderr, "Board was unable to create a dtb blob\n");
+            error_report("Board was unable to create a dtb blob");
             goto fail;
         }
     }
@@ -451,7 +452,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_=
info *binfo,
     scells =3D qemu_fdt_getprop_cell(fdt, "/", "#size-cells",
                                    NULL, &error_fatal);
     if (acells =3D=3D 0 || scells =3D=3D 0) {
-        fprintf(stderr, "dtb file invalid (#address-cells or #size-cells 0=
)\n");
+        error_report("dtb file invalid (#address-cells or #size-cells 0)")=
;
         goto fail;
     }
=20
@@ -459,8 +460,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_=
info *binfo,
         /* This is user error so deserves a friendlier error message
          * than the failure of setprop_sized_cells would provide
          */
-        fprintf(stderr, "qemu: dtb file not compatible with "
-                "RAM size > 4GB\n");
+        error_report("dtb file not compatible with RAM size > 4GB");
         goto fail;
     }
=20
@@ -480,7 +480,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_=
info *binfo,
                                               acells, mem_base,
                                               scells, mem_len);
             if (rc < 0) {
-                fprintf(stderr, "couldn't set %s/reg for node %d\n", noden=
ame,
+                error_report("couldn't set %s/reg for node %d", nodename,
                         i);
                 goto fail;
             }
@@ -505,7 +505,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_=
info *binfo,
                                           acells, binfo->loader_start,
                                           scells, binfo->ram_size);
         if (rc < 0) {
-            fprintf(stderr, "couldn't set /memory/reg\n");
+            error_report("couldn't set /memory/reg");
             goto fail;
         }
     }
@@ -519,7 +519,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_=
info *binfo,
         rc =3D qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
                                      binfo->kernel_cmdline);
         if (rc < 0) {
-            fprintf(stderr, "couldn't set /chosen/bootargs\n");
+            error_report("couldn't set /chosen/bootargs");
             goto fail;
         }
     }
@@ -528,14 +528,14 @@ static int load_dtb(hwaddr addr, const struct arm_boo=
t_info *binfo,
         rc =3D qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start",
                                    binfo->initrd_start);
         if (rc < 0) {
-            fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n");
+            error_report("couldn't set /chosen/linux,initrd-start");
             goto fail;
         }
=20
         rc =3D qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
                                    binfo->initrd_start + binfo->initrd_siz=
e);
         if (rc < 0) {
-            fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");
+            error_report("couldn't set /chosen/linux,initrd-end");
             goto fail;
         }
     }
@@ -690,7 +690,7 @@ static void load_image_to_fw_cfg(FWCfgState *fw_cfg, ui=
nt16_t size_key,
         gsize length;
=20
         if (!g_file_get_contents(image_name, &contents, &length, NULL)) {
-            fprintf(stderr, "failed to load \"%s\"\n", image_name);
+            error_report("failed to load \"%s\"", image_name);
             exit(1);
         }
         size =3D length;
@@ -956,8 +956,7 @@ static void arm_load_kernel_notify(Notifier *notifier, =
void *data)
         is_linux =3D 1;
     }
     if (kernel_size < 0) {
-        fprintf(stderr, "qemu: could not load kernel '%s'\n",
-                info->kernel_filename);
+        error_report("could not load kernel '%s'", info->kernel_filename);
         exit(1);
     }
     info->entry =3D entry;
@@ -976,8 +975,8 @@ static void arm_load_kernel_notify(Notifier *notifier, =
void *data)
                                                   info->initrd_start);
             }
             if (initrd_size < 0) {
-                fprintf(stderr, "qemu: could not load initrd '%s'\n",
-                        info->initrd_filename);
+                error_report("could not load initrd '%s'",
+                             info->initrd_filename);
                 exit(1);
             }
         } else {
@@ -1021,9 +1020,9 @@ static void arm_load_kernel_notify(Notifier *notifier=
, void *data)
         } else {
             fixupcontext[FIXUP_ARGPTR] =3D info->loader_start + KERNEL_ARG=
S_ADDR;
             if (info->ram_size >=3D (1ULL << 32)) {
-                fprintf(stderr, "qemu: RAM size must be less than 4GB to b=
oot"
-                        " Linux kernel using ATAGS (try passing a device t=
ree"
-                        " using -dtb)\n");
+                error_report("RAM size must be less than 4GB to boot"
+                             " Linux kernel using ATAGS (try passing a dev=
ice tree"
+                             " using -dtb)");
                 exit(1);
             }
         }
diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index bba9e9f57a..8f11b03066 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -35,6 +35,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "hw/hw.h"
 #include "hw/arm/pxa.h"
 #include "net/net.h"
@@ -62,8 +63,8 @@ static void connex_init(MachineState *machine)
=20
     dinfo =3D drive_get(IF_PFLASH, 0, 0);
     if (!dinfo && !qtest_enabled()) {
-        fprintf(stderr, "A flash image must be given with the "
-                "'pflash' parameter\n");
+        error_report("A flash image must be given with the "
+                     "'pflash' parameter");
         exit(1);
     }
=20
@@ -76,7 +77,7 @@ static void connex_init(MachineState *machine)
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                                sector_len, connex_rom / sector_len,
                                2, 0, 0, 0, 0, be)) {
-        fprintf(stderr, "qemu: Error registering flash memory.\n");
+        error_report("Error registering flash memory.");
         exit(1);
     }
=20
@@ -99,8 +100,8 @@ static void verdex_init(MachineState *machine)
=20
     dinfo =3D drive_get(IF_PFLASH, 0, 0);
     if (!dinfo && !qtest_enabled()) {
-        fprintf(stderr, "A flash image must be given with the "
-                "'pflash' parameter\n");
+        error_report("A flash image must be given with the "
+                     "'pflash' parameter");
         exit(1);
     }
=20
@@ -113,7 +114,7 @@ static void verdex_init(MachineState *machine)
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                                sector_len, verdex_rom / sector_len,
                                2, 0, 0, 0, 0, be)) {
-        fprintf(stderr, "qemu: Error registering flash memory.\n");
+        error_report("Error registering flash memory.");
         exit(1);
     }
=20
diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index d07972a966..189febf8b7 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -12,6 +12,7 @@
  * GNU GPL, version 2 or (at your option) any later version.
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
 #include "hw/arm/pxa.h"
@@ -143,8 +144,8 @@ static void mainstone_common_init(MemoryRegion *address=
_space_mem,
             if (qtest_enabled()) {
                 break;
             }
-            fprintf(stderr, "Two flash images must be given with the "
-                    "'pflash' parameter\n");
+            error_report("Two flash images must be given with the "
+                         "'pflash' parameter");
             exit(1);
         }
=20
@@ -154,7 +155,7 @@ static void mainstone_common_init(MemoryRegion *address=
_space_mem,
                                    blk_by_legacy_dinfo(dinfo),
                                    sector_len, MAINSTONE_FLASH / sector_le=
n,
                                    4, 0, 0, 0, 0, be)) {
-            fprintf(stderr, "qemu: Error registering flash memory.\n");
+            error_report("Error registering flash memory.");
             exit(1);
         }
     }
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index b648770882..06127a873d 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1626,7 +1626,7 @@ static void musicpal_init(MachineState *machine)
         flash_size =3D blk_getlength(blk);
         if (flash_size !=3D 8*1024*1024 && flash_size !=3D 16*1024*1024 &&
             flash_size !=3D 32*1024*1024) {
-            fprintf(stderr, "Invalid flash image size\n");
+            error_report("Invalid flash image size");
             exit(1);
         }
=20
diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 92e58f09c8..b3a23a83d1 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -18,6 +18,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -2313,7 +2314,7 @@ void omap_uwire_attach(struct omap_uwire_s *s,
                 uWireSlave *slave, int chipselect)
 {
     if (chipselect < 0 || chipselect > 3) {
-        fprintf(stderr, "%s: Bad chipselect %i\n", __func__, chipselect);
+        error_report("%s: Bad chipselect %i", __func__, chipselect);
         exit(-1);
     }
=20
@@ -3987,7 +3988,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryRegio=
n *system_memory,
=20
     dinfo =3D drive_get(IF_SD, 0, 0);
     if (!dinfo) {
-        fprintf(stderr, "qemu: missing SecureDigital device\n");
+        error_report("missing SecureDigital device");
         exit(1);
     }
     s->mmc =3D omap_mmc_init(0xfffb7800, system_memory,
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index b53878b8b9..3a1d995d6a 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -19,6 +19,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -1311,8 +1312,8 @@ static void omap_prcm_apll_update(struct omap_prcm_s =
*s)
     /* TODO: update clocks */
=20
     if (mode[0] =3D=3D 1 || mode[0] =3D=3D 2 || mode[1] =3D=3D 1 || mode[1=
] =3D=3D 2)
-        fprintf(stderr, "%s: bad EN_54M_PLL or bad EN_96M_PLL\n",
-                        __func__);
+        error_report("%s: bad EN_54M_PLL or bad EN_96M_PLL",
+                     __func__);
 }
=20
 static void omap_prcm_dpll_update(struct omap_prcm_s *s)
@@ -1331,7 +1332,7 @@ static void omap_prcm_dpll_update(struct omap_prcm_s =
*s)
     s->dpll_lock =3D 0;
     switch (mode) {
     case 0:
-        fprintf(stderr, "%s: bad EN_DPLL\n", __func__);
+        error_report("%s: bad EN_DPLL", __func__);
         break;
     case 1:	/* Low-power bypass mode (Default) */
     case 2:	/* Fast-relock bypass mode */
@@ -1358,7 +1359,7 @@ static void omap_prcm_dpll_update(struct omap_prcm_s =
*s)
         omap_clk_reparent(core, dpll_x2);
         break;
     case 3:
-        fprintf(stderr, "%s: bad CORE_CLK_SRC\n", __func__);
+        error_report("%s: bad CORE_CLK_SRC", __func__);
         break;
     }
 }
@@ -1627,8 +1628,8 @@ static void omap_prcm_write(void *opaque, hwaddr addr=
,
=20
     case 0x500:	/* CM_CLKEN_PLL */
         if (value & 0xffffff30)
-            fprintf(stderr, "%s: write 0s in CM_CLKEN_PLL for "
-                            "future compatibility\n", __func__);
+            error_report("%s: write 0s in CM_CLKEN_PLL for "
+                         "future compatibility", __func__);
         if ((s->clken[9] ^ value) & 0xcc) {
             s->clken[9] &=3D ~0xcc;
             s->clken[9] |=3D value & 0xcc;
@@ -1646,8 +1647,8 @@ static void omap_prcm_write(void *opaque, hwaddr addr=
,
         break;
     case 0x540:	/* CM_CLKSEL1_PLL */
         if (value & 0xfc4000d7)
-            fprintf(stderr, "%s: write 0s in CM_CLKSEL1_PLL for "
-                            "future compatibility\n", __func__);
+            error_report("%s: write 0s in CM_CLKSEL1_PLL for "
+                         "future compatibility", __func__);
         if ((s->clksel[5] ^ value) & 0x003fff00) {
             s->clksel[5] =3D value & 0x03bfff28;
             omap_prcm_dpll_update(s);
@@ -1658,8 +1659,8 @@ static void omap_prcm_write(void *opaque, hwaddr addr=
,
         break;
     case 0x544:	/* CM_CLKSEL2_PLL */
         if (value & ~3)
-            fprintf(stderr, "%s: write 0s in CM_CLKSEL2_PLL[31:2] for "
-                            "future compatibility\n", __func__);
+            error_report("%s: write 0s in CM_CLKSEL2_PLL[31:2] for "
+                         "future compatibility", __func__);
         if (s->clksel[6] !=3D (value & 3)) {
             s->clksel[6] =3D value & 3;
             omap_prcm_dpll_update(s);
@@ -2486,7 +2487,7 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRegi=
on *sysmem,
=20
     dinfo =3D drive_get(IF_SD, 0, 0);
     if (!dinfo) {
-        fprintf(stderr, "qemu: missing SecureDigital device\n");
+        error_report("missing SecureDigital device");
         exit(1);
     }
     s->mmc =3D omap2_mmc_init(omap_l4tao(s->l4, 9),
diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index 9a14270795..e510465137 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -158,7 +158,7 @@ static void sx1_init(MachineState *machine, const int v=
ersion)
                                    blk_by_legacy_dinfo(dinfo),
                                    sector_size, flash_size / sector_size,
                                    4, 0, 0, 0, 0, be)) {
-            fprintf(stderr, "qemu: Error registering flash memory %d.\n",
+            error_report("Error registering flash memory %d.",
                            fl_idx);
         }
         fl_idx++;
@@ -182,7 +182,7 @@ static void sx1_init(MachineState *machine, const int v=
ersion)
                                    blk_by_legacy_dinfo(dinfo),
                                    sector_size, flash1_size / sector_size,
                                    4, 0, 0, 0, 0, be)) {
-            fprintf(stderr, "qemu: Error registering flash memory %d.\n",
+            error_report("Error registering flash memory %d.",
                            fl_idx);
         }
         fl_idx++;
@@ -194,7 +194,7 @@ static void sx1_init(MachineState *machine, const int v=
ersion)
     }
=20
     if (!machine->kernel_filename && !fl_idx && !qtest_enabled()) {
-        fprintf(stderr, "Kernel or Flash image must be specified\n");
+        error_report("Kernel or Flash image must be specified");
         exit(1);
     }
=20
diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index 285f43709d..7f3637041a 100644
--- a/hw/arm/palm.c
+++ b/hw/arm/palm.c
@@ -233,8 +233,8 @@ static void palmte_init(MachineState *machine)
     if (nb_option_roms) {
         rom_size =3D get_image_size(option_rom[0].name);
         if (rom_size > flash_size) {
-            fprintf(stderr, "%s: ROM image too big (%x > %x)\n",
-                            __func__, rom_size, flash_size);
+            error_report("%s: ROM image too big (%x > %x)",
+                         __func__, rom_size, flash_size);
             rom_size =3D 0;
         }
         if (rom_size > 0) {
@@ -243,13 +243,13 @@ static void palmte_init(MachineState *machine)
             rom_loaded =3D 1;
         }
         if (rom_size < 0) {
-            fprintf(stderr, "%s: error loading '%s'\n",
-                            __func__, option_rom[0].name);
+            error_report("%s: error loading '%s'",
+                         __func__, option_rom[0].name);
         }
     }
=20
     if (!rom_loaded && !kernel_filename && !qtest_enabled()) {
-        fprintf(stderr, "Kernel or ROM image must be specified\n");
+        fprintf(stderr, "Kernel or ROM image must be specified");
         exit(1);
     }
=20
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index db860c238e..0386a0d8bf 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -8,6 +8,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -2062,7 +2063,7 @@ PXA2xxState *pxa270_init(MemoryRegion *address_space,
     s =3D g_new0(PXA2xxState, 1);
=20
     if (strncmp(cpu_type, "pxa27", 5)) {
-        fprintf(stderr, "Machine requires a PXA27x processor.\n");
+        error_report("Machine requires a PXA27x processor.");
         exit(1);
     }
=20
@@ -2095,7 +2096,7 @@ PXA2xxState *pxa270_init(MemoryRegion *address_space,
=20
     dinfo =3D drive_get(IF_SD, 0, 0);
     if (!dinfo) {
-        fprintf(stderr, "qemu: missing SecureDigital device\n");
+        error_report("missing SecureDigital device");
         exit(1);
     }
     s->mmc =3D pxa2xx_mmci_init(address_space, 0x41100000,
@@ -2220,7 +2221,7 @@ PXA2xxState *pxa255_init(MemoryRegion *address_space,=
 unsigned int sdram_size)
=20
     dinfo =3D drive_get(IF_SD, 0, 0);
     if (!dinfo) {
-        fprintf(stderr, "qemu: missing SecureDigital device\n");
+        error_report("missing SecureDigital device");
         exit(1);
     }
     s->mmc =3D pxa2xx_mmci_init(address_space, 0x41100000,
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index de7c0fc4a6..f6f295b363 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -8,6 +8,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "hw/ssi/ssi.h"
@@ -559,7 +560,7 @@ static void ssys_write(void *opaque, hwaddr offset,
     case 0x040: /* SRCR0 */
     case 0x044: /* SRCR1 */
     case 0x048: /* SRCR2 */
-        fprintf(stderr, "Peripheral reset not implemented\n");
+        error_report("Peripheral reset not implemented");
         break;
     case 0x054: /* IMC */
         s->int_mask =3D value & 0x7f;
diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index a55b1a369c..a069c95f1c 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -12,6 +12,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
 #include "hw/arm/pxa.h"
@@ -70,19 +71,19 @@ static void tosa_out_switch(void *opaque, int line, int=
 level)
 {
     switch (line) {
         case 0:
-            fprintf(stderr, "blue LED %s.\n", level ? "on" : "off");
+            error_report("blue LED %s.", level ? "on" : "off");
             break;
         case 1:
-            fprintf(stderr, "green LED %s.\n", level ? "on" : "off");
+            error_report("green LED %s.", level ? "on" : "off");
             break;
         case 2:
-            fprintf(stderr, "amber LED %s.\n", level ? "on" : "off");
+            error_report("amber LED %s.", level ? "on" : "off");
             break;
         case 3:
-            fprintf(stderr, "wlan LED %s.\n", level ? "on" : "off");
+            fprintf(stderr, "wlan LED %s.", level ? "on" : "off");
             break;
         default:
-            fprintf(stderr, "Uhandled out event: %d =3D %d\n", line, level=
);
+            fprintf(stderr, "Uhandled out event: %d =3D %d", line, level);
             break;
     }
 }
@@ -133,7 +134,7 @@ static void tosa_gpio_setup(PXA2xxState *cpu,
=20
 static uint32_t tosa_ssp_tansfer(SSISlave *dev, uint32_t value)
 {
-    fprintf(stderr, "TG: %d %02x\n", value >> 5, value & 0x1f);
+    error_report("TG: %d %02x", value >> 5, value & 0x1f);
     return 0;
 }
=20
@@ -159,13 +160,13 @@ static int tosa_dac_send(I2CSlave *i2c, uint8_t data)
     s->buf[s->len] =3D data;
     if (s->len ++ > 2) {
 #ifdef VERBOSE
-        fprintf(stderr, "%s: message too long (%i bytes)\n", __func__, s->=
len);
+        error_report("%s: message too long (%i bytes)", __func__, s->len);
 #endif
         return 1;
     }
=20
     if (s->len =3D=3D 2) {
-        fprintf(stderr, "dac: channel %d value 0x%02x\n",
+        error_report("dac: channel %d value 0x%02x",
                 s->buf[0], s->buf[1]);
     }
=20
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index 418792cd02..56f9d60bed 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -364,7 +364,7 @@ static void versatile_init(MachineState *machine, int b=
oard_id)
                           VERSATILE_FLASH_SECT_SIZE,
                           VERSATILE_FLASH_SIZE / VERSATILE_FLASH_SECT_SIZE=
,
                           4, 0x0089, 0x0018, 0x0000, 0x0, 0)) {
-        fprintf(stderr, "qemu: Error registering flash memory.\n");
+        error_report("Error registering flash memory.");
     }
=20
     versatile_binfo.ram_size =3D machine->ram_size;
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index efb5a29475..508629dfe9 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -266,7 +266,7 @@ static void a9_daughterboard_init(const VexpressMachine=
State *vms,
=20
     if (ram_size > 0x40000000) {
         /* 1GB is the maximum the address space permits */
-        fprintf(stderr, "vexpress-a9: cannot model more than 1GB RAM\n");
+        error_report("vexpress-a9: cannot model more than 1GB RAM");
         exit(1);
     }
=20
@@ -355,7 +355,7 @@ static void a15_daughterboard_init(const VexpressMachin=
eState *vms,
          */
         uint64_t rsz =3D ram_size;
         if (rsz > (30ULL * 1024 * 1024 * 1024)) {
-            fprintf(stderr, "vexpress-a15: cannot model more than 30GB RAM=
\n");
+            error_report("vexpress-a15: cannot model more than 30GB RAM");
             exit(1);
         }
     }
@@ -640,7 +640,7 @@ static void vexpress_common_init(MachineState *machine)
     pflash0 =3D ve_pflash_cfi01_register(map[VE_NORFLASH0], "vexpress.flas=
h0",
                                        dinfo);
     if (!pflash0) {
-        fprintf(stderr, "vexpress: error registering flash 0.\n");
+        error_report("vexpress: error registering flash 0.");
         exit(1);
     }
=20
@@ -655,7 +655,7 @@ static void vexpress_common_init(MachineState *machine)
     dinfo =3D drive_get_next(IF_PFLASH);
     if (!ve_pflash_cfi01_register(map[VE_NORFLASH1], "vexpress.flash1",
                                   dinfo)) {
-        fprintf(stderr, "vexpress: error registering flash 1.\n");
+        error_report("vexpress: error registering flash 1.");
         exit(1);
     }
=20
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 60561c7b7c..ee59142667 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -319,8 +319,8 @@ static void z2_init(MachineState *machine)
 #endif
     dinfo =3D drive_get(IF_PFLASH, 0, 0);
     if (!dinfo && !qtest_enabled()) {
-        fprintf(stderr, "Flash image must be given with the "
-                "'pflash' parameter\n");
+        error_report("Flash image must be given with the "
+                     "'pflash' parameter");
         exit(1);
     }
=20
@@ -329,7 +329,7 @@ static void z2_init(MachineState *machine)
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                                sector_len, Z2_FLASH_SIZE / sector_len,
                                4, 0, 0, 0, 0, be)) {
-        fprintf(stderr, "qemu: Error registering flash memory.\n");
+        error_report("Error registering flash memory.");
         exit(1);
     }
=20
--=20
2.11.0

