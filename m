Received: by 10.25.221.202 with SMTP id w71csp2024091lfi;
        Sat, 12 Aug 2017 04:37:13 -0700 (PDT)
X-Received: by 10.55.52.201 with SMTP id b192mr22235533qka.213.1502537833374;
        Sat, 12 Aug 2017 04:37:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502537833; cv=none;
        d=google.com; s=arc-20160816;
        b=xIuufPJZagKu6jv8TCTftsvP8P2U5vybsDltq7RHO/vc1rGNCcQNbmWzKPMvyygXE9
         Z8ynYY3qA8Zyi4+r8gb8DgULT8+lrLxebf6ePLu6iI2PH0rIdxnD8bxNu+GCVJsI7jjy
         jlquUKkWiQpo/X1LZqcEmH6Py0Lmqhy0uis+ODkvM6/MOQWgDKsakK8ymZ8Uag/vruOX
         Pu6EN2sxb+O//y1rMq+VCgNmJP+omfRbcJDnI9I78AlSuoLlJ9FEROSYH4BiRhAfTZ19
         Lx6O0J1yPCf+hEHH5+vXIKjcS54lriN2ag4hEAGwx9y7262FiKRx5gXnbI2FGduOg9TK
         YsJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=HfbsY6vmf5f8umfQGo2nJzDB+Rom9e1cehZd1SIzTeE=;
        b=isBmOOOoYpHw40Lr0b+FvlRCnv/jsTnUZhVKtW8jX3Q1nH91kcsvjgilrUAIXo4heA
         ePhmIGx4Q93AP8VrIGAo6aJqv4HdjoVajRAHgoWCjGDeRlHj+tcqoI6yUDv0ffShq1Ad
         11ClJ3O/wjPxuZ75yQb/wJlNKl1I6rOedsWpSp7AI8kgzt41S4izLoaKvvtrrHR9uQyU
         /0Ryn2QPRQQbOvfCoKPBZjGK4C8FAe2tld7VkAj4pSHZV70CTuwYKOEZ1y34PuEj6hn0
         PLWFaIUdlJw1bwbTRopJ41zfqnumnm1XnVptw65OkJRlOhiCjjbomumOiVDFJaGNG8Y3
         uhSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=TVZ4t6uh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o42si2723331qkh.194.2017.08.12.04.37.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 12 Aug 2017 04:37:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=TVZ4t6uh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46503 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgUj8-0005Hp-NM
	for alex.bennee@linaro.org; Sat, 12 Aug 2017 07:37:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59826)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1dgUj3-0005HP-2O
	for qemu-arm@nongnu.org; Sat, 12 Aug 2017 07:37:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1dgUiy-0001IM-3X
	for qemu-arm@nongnu.org; Sat, 12 Aug 2017 07:37:05 -0400
Received: from mail-cys01nam02on0083.outbound.protection.outlook.com
	([104.47.37.83]:30228
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1dgUix-0001Hh-Ik; Sat, 12 Aug 2017 07:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=HfbsY6vmf5f8umfQGo2nJzDB+Rom9e1cehZd1SIzTeE=;
	b=TVZ4t6uhYP72UgXJEyQ9a5yWA67BKBVsz+YTIq5AOW0lu8U+BEtYbew4lSmWgCfgNdFuCcD6npy/jNwDSUwly8qWejvASh9eHZvzkuorGMrdnN5mzcnQbEdHo2RL1PJYb8iH24zDotPE491o4bQis8y3z6yNhVIaLDK26QcDrn4=
Received: from BLUPR0201CA0033.namprd02.prod.outlook.com (10.163.116.43) by
	MWHPR02MB2256.namprd02.prod.outlook.com (10.168.243.138) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1320.16; Sat, 12 Aug 2017 11:36:56 +0000
Received: from BL2NAM02FT039.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::206) by BLUPR0201CA0033.outlook.office365.com
	(2a01:111:e400:52e7::43) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1341.17 via
	Frontend Transport; Sat, 12 Aug 2017 11:36:55 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT039.mail.protection.outlook.com (10.152.77.152) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1304.16
	via Frontend Transport; Sat, 12 Aug 2017 11:36:55 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:33139
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1dgUis-0003MD-Hy; Sat, 12 Aug 2017 04:36:54 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1dgUis-00022h-FO; Sat, 12 Aug 2017 04:36:54 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v7CBakuf017487; Sat, 12 Aug 2017 04:36:46 -0700
Received: from [172.19.116.66] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1dgUik-00022U-Bk; Sat, 12 Aug 2017 04:36:46 -0700
Date: Sat, 12 Aug 2017 13:36:45 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <20170812113645.GW12347@toto>
References: <cover.1502488636.git.alistair.francis@xilinx.com>
	<bc18dddca56e8c2ea4a3def48d33ceb5d21d1fff.1502488636.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bc18dddca56e8c2ea4a3def48d33ceb5d21d1fff.1502488636.git.alistair.francis@xilinx.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23252.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(24454002)(199003)(189002)(6636002)(97756001)(4326008)(356003)(2950100002)(9686003)(9786002)(8936002)(77096006)(54906002)(23726003)(106466001)(229853002)(1076002)(81166006)(81156014)(8676002)(46406003)(33656002)(83506001)(189998001)(63266004)(626005)(50466002)(47776003)(2906002)(4001350100001)(76176999)(478600001)(50986999)(54356999)(36386004)(6246003)(33716001)(39060400002)(6862004)(110136004)(5660300001)(305945005)(18370500001)(40753002)(133343001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB2256; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT039;
	1:6Q4vuQT9x9PFs13QwUEvT+eZcarUIJS1BtbEqkwvKq7Cu1M5kqdmxu/XqL7yOnOJYtex9ezt/yRgOE1ylsbOolc1L4WOm/CfZpTAdrWavTroBEOP1sUW9TAIDG3EXas1vEcc7Y+chG+nnpRrBkNyMv4FdNT5VEOQUKDDe4t+s2Sl54NLPhxE/n1pmwNUj9XMmp3z/Ft6RV/+anO8mNFJOuOrjtWGlOUBy+kSu892M26tZV9hOSri1ToUJN+L6854w2y2HIuPt6aQifKAsvVG6sErYn4/gRDc0ntO58TdiH/xaizrZJpZqIpyWDOU3xa7Es0Mm/kcOJUjH19/XMkYeS7gbUrGwGT4nex+7yx6uFz6rr6uUrBDrdKsz8vXh/iAsTFMpp/2A5NY0f8DECtcKDBGXXVbjGIua3JZscvt8Q2exbPdPFFnlV0tIgTtg1SW+DTDsCvf2X4jGuFflDGYFE0yfTiYU6EvIsGeLn9q2uAzwYy1OAey+MI7bCJglAKAg1kBIMjlQs51JjkCYVOtLisj10EncSh6Gs0JXfuLb5Hz3xlNuJYjii1hzkuVugwJX/Zvt2Dh74SXQigg08Xnb/r7wcQQ2ueJEpb7ynVYfQLISUrA4JUT5UZsLGU1WTVrslWAPTYJscbOei3USuxhqSxtDJ5NHhdELtcahBhGFnDKdWyAWrvWTXEH6XEOY3uk7IG/07YCDg+i5zkvJdzJRLCQeh0r/yHkmb7kMKjtAu4fPGAQB4sq9rzzQD2B0J6+BNJkc6Y2THb0oeWapw+PCZYRfzuqnqZiS9za8m2RUlk0Fj02tXFwLv+CwIrMf8pfZ/+vqGNk+Z1ngCK0u2i1tw==
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f8ac4a5-1c2c-4969-0b67-08d4e1766f32
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:MWHPR02MB2256; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2256;
	3:dpeJVQudB2n/dddaUQSepcyBivB5m8+bO03hSlebmCCmiw28p4GaduzXwqo4J9yGAn2V3dDrNPUeQUjyb5g1ZgBdslf+1i2XpNj7skRxVM0u3pkF8Zkla49Rl0524M/X9zlEM2PFmjW8DXoxE8ujdpEFQbhbxVHKGifBECuJQzJP29owA4O3N2RZ8jq08VChnqt9TI99SCiDG/8aDgKsV5ZtPwOQlE4WUSQt00Zqu7CDwtSHAroLMn/g39kqM3oQOn9isbAWaGxnOPFduv8O5Jx+5iYAevEJDPMB0pnq/EHNZHYAl8TK8sEb++BqH7/qKnxtm2eaqxW3Pnz1z/9SydOTBAVdDaxFzDB75K/JSZ8=;
	25:0KSMJbpSFkXimBr0VSTZtzitAz49bZ60G6trylXLZIgGgyqG9fvasipgh++MEMsoijFdqMm99xYd8BXJF72X/KVsVc0BOwThjZ+2Eq2vgQLixR0qjqZOLH0KSATG4DuvHVk9cM2h8QF0TQsb2Oe1QzdOfs6B4rbok3okJx6J7dLv4i8WxKpdDBJyV5K2HQu0BAWjZalq4iOuSurwh/zoyN0w63gYcPGAJZLj6UKnEfPYwztnLXh7AiUpA08mVJEXiOlQyp5p7WC8xMqk08QZHWWoxckBpfJBcj6NtyEcwEDVSFxZIyxPUhXko7fCiMWAbMYTbm4A7DknXNbJDUTVCQ==
X-MS-TrafficTypeDiagnostic: MWHPR02MB2256:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2256;
	31:BL4zEnymwRpH44wHNWcNrmij6mhwB/HvWkstpv+E46e8Wkrn/T4S1e03fIr9FmaQI3jLeLB0WyKAY47tW/poyxqCf2g86v5nxtI9VvpgW1XvbNYORa9wOY4TBCMpWQOWIbDR1ulFiKVqUpeI2F/qXLESEcXtY/X2rv37ZVwJ5Y/KGp1vBOV+WSZ7k7Fxu9WZss+f6PpxvhJzeEI6WiQcPqHeyjNjnSpaC1pdSft7pB0=;
	20:8vTpEPx9IU9foi6ZhYAQK/wRjIPTgz9Ypen3IlrJEY/sk79hOYg2ZoZ5o7HSCIDdL5eIoE/Zmhjvc0JnSflQokQ+rv+t4iCzTqAAUZqzs4Oe2UwitaaNHamVualDM+QgVzxg/c3iOS96wKjSjE4J7r8CsNeH4eKZZUzDg5smbsXbC9L+mBJnzW0MCPRAw87CIf3+lb0JpAhovP54irrUEUt0AdA9HadUzopZdn0tTnlgatCXtUCfv6y0/4jvX6hRWQDQYjFg6o3XrXa6kn4klJ1UJV5my0jGyKehtrHrv6TBIbMC0it+Ukvfc8c9cLkgtOfQ+iM6Ar+iW9zu8nRppoV8UD7lRw83BNYiNpLPTrH2U54MtKTudp9ZynlbF35FO7+fKE3UWZLYCY+T3izbvrpS4NrSM28bkAkMJ/A7nPS6Pw28PWvNMcSsW1pcqwoL9B2mQ6Q5DUnXUfUQBvHkjYEWfLA447kbq7gYFTOFgVwn5P5nLn9VSm7/M85v27MD
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <MWHPR02MB2256D3FDEB323ABC742F0E65AB8E0@MWHPR02MB2256.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(13016025)(13018025)(10201501046)(3002001)(100000703101)(100105400095)(93006095)(93004095)(6055026)(6041248)(20161123558100)(20161123560025)(20161123555025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR02MB2256; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR02MB2256; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2256;
	4:qR4UQfgU5Jw5mW/vzXRmCpTZQlhyEam56cIQwSxn0EKmv8Woq+rJUqwPaN+6LmrGCg3Bf7lEauUXytK/bM9okIkuxTWexuz1lDEhbZVk6l1JUJto6QJ4rSN28CIZQxrtyudbSorwOHtZKNiK2UFw+RYacIb7WKszK2mzdp5yGvp9+oixEDtQFn/Dh8WpFzENHflBTXH7hwhdqDiTVSYfocCVQ7iUapee22157TGiDHIOL+28bEH8Z2sCDcJsT/XNkGYg5TgNSLdWpmSXHmJAj+FK0lmRDgoPuqkag5mCpzg=
X-Forefront-PRVS: 039735BC4E
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR02MB2256;
	23:B/cjp1MahFQrNyY5beDyMR3nfpvF5yg6W+g0o1hBl?=
	=?us-ascii?Q?DQ7xsJe8Vv06jS4I/4i5tbeLaS7Hrz5LK748oIsCemEJbsH/TlRfDXNeu6aM?=
	=?us-ascii?Q?gR+Mxc32Tw/JDdOAbDhUGs+7wNbknCEoStXkEPjMb2+Pt/A7SEUI38YYSVj3?=
	=?us-ascii?Q?NU+KSP794Tq08vz2bKD7NfYbK9LxL9DB19t3TNTsjr2NRa+3NUxApON+Gvsk?=
	=?us-ascii?Q?F5bM+a5waX5KrHIRZ3IZxH5wXySpsLDsMmD8rbRupbO014fTiKabiN1DL9BR?=
	=?us-ascii?Q?gXzffZkPCV9fln7e1JxZJirfl0PDpkltV3EfbdW5j1/pG5AAIT1FPNgLPsDy?=
	=?us-ascii?Q?ICNKMTQtFNxUYKcyrZjswCs5XvsuwJ0SNJ1pFbWMXZY2uv6PguHSzUx9Sg1f?=
	=?us-ascii?Q?Mog4aIr2RGTFG+5jd0K8Kws1KykYvwy/04eCrEAvSkpeo78C0b4FBKswJ4x0?=
	=?us-ascii?Q?q5gKeHt8y6cFCEo8liCh8ItaWSC+Y5hCNmbbJl7s/GQM6RaIPiULjNcALY6T?=
	=?us-ascii?Q?GJSOw1EN5yTcOjm/Ym8H+UTKyqAaBZ57WWV/raLpmUYdEao/QawSXPSOR0/n?=
	=?us-ascii?Q?VLXGrYiOdK3PiHjeB0z8SKVTKYWAq0ztzGQIyE/ie0dow1WX+uSNgLGp0KaA?=
	=?us-ascii?Q?1vhm7BXl7OOuc6k/cAuUmFrJghFfFlX4VhgyTXcXdJBFuH/cVIa5YYOovRLG?=
	=?us-ascii?Q?t7kJmYyoGPacyue3YNpbVcRcLjARYiLx4Pc3TBdiU2KL6sOKW2OHDOmXbii4?=
	=?us-ascii?Q?rSjeiNqrPZRTONufznbfw9vqTSGF/Jb23orRSewkeIWvMx3CBQXF/wGklJeL?=
	=?us-ascii?Q?oL3VssPj+GayqJrcotNeqPswWtrp943vGtj7vTC9Xqe0+U0lnc8DCZecJAey?=
	=?us-ascii?Q?r2aLOp96O+ipcpPgjj7RY9rXBpmD4C+UsWtfl1JovxlJZrTKKfmtg4226db2?=
	=?us-ascii?Q?b1/7kqgSOaP4w/sTVYkmX/vQqxiRct0lYtHEybPp3u5u82fI49Fvv8c/kEif?=
	=?us-ascii?Q?lXPpy+UR6YpyrKcTb8EhURmZpZ4SG/lYXQliIBPVTtWXH7O4HN4T6Eyk1Tqp?=
	=?us-ascii?Q?h5pjSBjXwZSc6SND/QZSNUpPazOZdkUiZfDt/1xrTjbV7JiEMAlUS3LtA5W+?=
	=?us-ascii?Q?RPq6yjbU4gbfXlJnxOCL9XA3WtQOnqopNVCkxmb7zmYf3nvdNHm0YHGQlS1M?=
	=?us-ascii?Q?ZjiDIkJWi1T84AfB2yXJxVtgWMVhcZwa5/PcyK2Axi2ZmYqzNVVQal4Hg=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2256;
	6:66RQ2Unxed4plzetq8dIapHIJYsxcS5/zyVYY9y2X26ebsxQ+80iTWEBHwTRcPDoDclojuv84p0OY4k/w4mR/b0mHSIe6Xhq/ILAUw1oxxuus0oDT5tKLr/o4LMSmtYpFpX0IV+WcBSDEBwQIhwvIJgNT6g5Nck/A1OMZcZ6H9HuYcIRMwvMd7WouzNt9/VxyW71dzWeg7CV/qQsp1hptP8WyKW6u9xZCf7LxVq6NWhp2bvF3aEOL0Rr5rHC7zujU1n2UPl2L79bGEzCUiWTW8NaQYbd02DgmkCMf6FQvta0sOGL3/d2Taa0wEBjFDjkyPnxs8NwuOZdP2b0CPWdLw==;
	5:dyak5J3jiH8EHFxNVPRRkL3wGikb6XiOyXe+mHbY3qRxANMvqdNVUJqXQLgAmuTTyDxZeK+Wz1CnbV0DgbaAYFHj2mg4/u5hdq0bUQBi/xoj4t10UPX/uXLmjxasB5mvkiKoF66zmvdaxQ5jcBoOcA==;
	24:dc1Q901daSSzPSVIOBRswwjAh7WFovyFMkBwKO4sZUC2TOqYj9yaojBiy/MIYPiltICRY9egbB+z1RFWEn+vRd4GfnG3DwrJ0g/shUX5VOM=;
	7:Vfe/oPzDp+VNYypZxXab4aA9Lkw1BZBi1iEZoAowvsEb32memXZiPFwRdjBCqzzElzJJvtNI3PgQbAv3oWD2EzMyS2tYc4/vHVqu0hQHz0H7f2rvJ7WB3uqV6/U+e9dz3bcC0Fid0FGsXCQhygexfIc93r4kKECXIRhLd5M621A/bZRuRZv7/Sygl+ojGtE1FEwTg6dcCQkRrpc/APtldkcpQyR3GSGTJHk1PwalqKE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2017 11:36:55.2148 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2256
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.83
Subject: Re: [Qemu-arm] [PATCH v1 3/3] target/arm: Correct exclusive store
 cmpxchg memop mask
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g7Ukii0B95Bj

On Fri, Aug 11, 2017 at 03:17:41PM -0700, Alistair Francis wrote:
> When we perform the atomic_cmpxchg operation we want to perform the
> operation on a pair of 32-bit registers. Previously we were just passing
> the register size in which was set to MO_32. This would result in the
> high register to be ignored. To fix this issue we hardcode the size to
> be 64-bits long when operating on 32-bit pairs.

Good catch Alistair!
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
> 
> This was caught with an internal fuzzy tester. These patches fix the
> Xilinx 2.10-rc2 tree. I tested with the fuzzy tester (single CPU) and
> Linux boot (4 CPUs) on the Xilinx tree. I don't have a good test case to
> run on mainline, but am working with some internal teams to get one.
> Also linux-user is fully untested.
> 
> All tests were with MTTCG enabled.
> 
>  target/arm/translate-a64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 245175e2f1..49b4d6918d 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -1913,7 +1913,7 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
>              tcg_gen_concat32_i64(val, cpu_exclusive_val, cpu_exclusive_high);
>              tcg_gen_atomic_cmpxchg_i64(tmp, addr, val, tmp,
>                                         get_mem_index(s),
> -                                       size | MO_ALIGN | s->be_data);
> +                                       MO_64 | MO_ALIGN | s->be_data);
>              tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, val);
>              tcg_temp_free_i64(val);
>          } else if (s->be_data == MO_LE) {
> -- 
> 2.11.0
> 
