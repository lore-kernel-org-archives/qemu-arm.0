Received: by 10.25.205.13 with SMTP id d13csp701600lfg;
        Fri, 16 Dec 2016 06:01:09 -0800 (PST)
X-Received: by 10.55.112.65 with SMTP id l62mr3398718qkc.76.1481896869233;
        Fri, 16 Dec 2016 06:01:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y142si3221847qkb.180.2016.12.16.06.01.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Dec 2016 06:01:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=nokia.com
Received: from localhost ([::1]:60707 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHt4K-0006hz-T8
	for alex.bennee@linaro.org; Fri, 16 Dec 2016 09:01:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1cHt4B-0006Y1-Lr
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 09:00:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1cHt47-00012n-Hp
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 09:00:55 -0500
Received: from mail-db5eur01on0133.outbound.protection.outlook.com
	([104.47.2.133]:19904
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcin.krzeminski@nokia.com>)
	id 1cHt3x-0000ro-3j; Fri, 16 Dec 2016 09:00:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Ldh84lqfM45IJMHyG+XRRxQgru2k85pCYbiQHfytIpY=;
	b=GvthN+5Fr29dGLrL2yLMzSlRnfoBLOTIdQY+ssPBEoPts+RdZkAnftTpZ2U4SftPH7A84OMTZ4AMvW+UrFMgHJWp+wqSLUchTtA5cutN/bi0z9npzFLm8E8L0/EBbkmh9v035NDZfHUcb0VJ2UG4aRr12XAnMhFyNb+4Xmk4d9w=
Received: from VI1PR07CA0079.eurprd07.prod.outlook.com (10.164.94.175) by
	AM5PR0701MB2705.eurprd07.prod.outlook.com (10.173.93.19) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.789.5; Fri, 16 Dec 2016 13:28:07 +0000
Received: from AM1FFO11FD004.protection.gbl (2a01:111:f400:7e00::173) by
	VI1PR07CA0079.outlook.office365.com (2a01:111:e400:5967::47) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.803.5 via
	Frontend Transport; Fri, 16 Dec 2016 13:28:07 +0000
Authentication-Results: spf=pass (sender IP is 131.228.2.35)
	smtp.mailfrom=nokia.com; nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
	131.228.2.35 as permitted sender) receiver=protection.outlook.com;
	client-ip=131.228.2.35; helo=hybrid2.ext.net.nokia.com;
Received: from hybrid2.ext.net.nokia.com (131.228.2.35) by
	AM1FFO11FD004.mail.protection.outlook.com (10.174.64.86) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.771.7 via Frontend Transport; Fri, 16 Dec 2016 13:28:06 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:; UpperCasedChecksum:;
	SizeAsReceived:1500; Count:17
Received: from fihe3nok1347.nsn-intra.net (10.158.36.135) by
	fihe3nok1346.nsn-intra.net (10.158.36.134) with Microsoft SMTP Server
	(TLS) id 15.1.466.34; Fri, 16 Dec 2016 15:28:04 +0200
Received: from mailrelay.int.nokia.com (10.130.128.21) by
	fihe3nok1347.nsn-intra.net (10.158.36.135) with Microsoft SMTP Server
	(TLS)
	id 15.1.466.34 via Frontend Transport; Fri, 16 Dec 2016 15:28:03 +0200
Received: from fihe3nok0734.emea.nsn-net.net (localhost [127.0.0.1])
	by fihe3nok0734.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id
	uBGDRjBi011502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 16 Dec 2016 15:27:45 +0200
Received: from CNU418C7XK.nsn-intra.net ([10.154.154.85])
	by fihe3nok0734.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id
	uBGDRhR7011449; Fri, 16 Dec 2016 15:27:44 +0200
X-HPESVCS-Source-Ip: 10.154.154.85
From: <marcin.krzeminski@nokia.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 16 Dec 2016 14:27:42 +0100
Message-ID: <1481894862-14102-3-git-send-email-marcin.krzeminski@nokia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481894862-14102-1-git-send-email-marcin.krzeminski@nokia.com>
References: <1481894862-14102-1-git-send-email-marcin.krzeminski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-IncomingHeaderCount: 17
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:131.228.2.35; IPV:NLI; CTRY:FI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39410400002)(39840400002)(39450400003)(39860400002)(39850400002)(2980300002)(438002)(189002)(199003)(2950100002)(22756006)(2876002)(38730400001)(47776003)(5003940100001)(86362001)(81156014)(189998001)(68736007)(86152002)(81166006)(92566002)(8936002)(356003)(33646002)(77096006)(50226002)(97736004)(2906002)(2351001)(305945005)(8676002)(110136003)(626004)(6916009)(36756003)(76176999)(48376002)(106466001)(50986999)(50466002)(4326007)(5660300001)(53416004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM5PR0701MB2705;
	H:hybrid2.ext.net.nokia.com; FPR:; SPF:Pass;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; AM1FFO11FD004;
	1:FA1oqVfNI8gqZnGTaT9WpqNuMMHzkcfP+kI7647q1Mbchay34+LwE6pcTRn2G/+hVmW7dlY6pLN8k8GtBbEjkBuGTb8vkNrXB46gqNCP+G+2AATuSHMa1ZBQEQJtMpwq3/rWVMibsrVVWfpcSnuwgDNtUnqSLZ4mM65Srg/6Fq5mVmsF4HW19XXvwSIYDCbLZqaraar1Nq+XjXNehuJu+MKomiHgg2so1mi1il/PfJKx5tHMz2al6Ddl9RuSxFoD5rO2SfREABl5jEg9kmOOp6+BOVydnzRHduFbUmQGKcH1xJLzLWPhPoDfQM+BqC0NBhGUMaEbHeAaU1IusNE0CTAppE5LsPSYmfaKuyr1VfsIIsbgpBXBQ4VNVuvmhWtu+23cocGLOVfdkzyFDZVOrM1DxcsKEJRH2RkYfs4XimwqK3NOrusbOKkb0L2PFRWxyJ4Xkj7E5vxz6Ym18pddObdVjowdBsSZCtpsk0o2pZUJYYsO2YUIMGJm8yThMeJIvcBL6oFTOA88YxrnXFrjvg==
X-MS-Office365-Filtering-Correlation-Id: 47bb480f-ce52-4b00-6149-08d425b75f0c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:AM5PR0701MB2705; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0701MB2705;
	3:y3oOXSP5i/2VUxTGU4Z8+jCP4BDlrsZBeZWaX8ua0Qd2ewvbS6X7h8xHPkYtkxyOqfzZN1DIlACoXPflkpuiLKgSZr8SW10eXSQmVB2cb0ksyusXxMqCzqEPwT1HYmM6qm77RvgYvFZDIhYbpKss7ihl1T38NCrSrqZFv7faZPwJp4G+vPaMlONuGLHBEFom//i/vAAe9D5JbOqdF9iKUw70upbev8FPYLQpVq2U6zeRF3c23pqAzAbjNQZ9T+qDv1VFopmFQJQTrJRXCG3O4CXtrEi8FwTNPyTvWMammL8doA//XXlVkg/wZ3mqNW3PhYwE0prMo0IHCLefUgndbsv75iW1fyqTCHhVGqDJXkkn81zaAMkmuNiRKexR1Gq5QMLAr4Epg8BO9fqxx9HH2g==;
	25:eKUUnYUN6oSjP28qfB961E3wrDV3fRlYgkK3tDsv7gBnE+VPt1TrZEpIHCL1Kc4oV7gDQY0HvTrJ+wZ7f14L/Mu0c79ph9zT9I1QjylwEZe2rxWfay6XDZf0VBJ5zLiGBr7r5VbYsLZBvirkRxrlVxzs5ev+opr8N0eFsmNHlOLH5mIxgf+m3GkftkROerwjr1d0oNc7GiNFYfv8V1jt2bSqx4eVZBl0YSrbnXg1yJaRDA8Q6o0C9mF81AJr1k5Uijd0MrbupKydjncCz7pORYflh6uYSrBLIHPSmO4q3TOxRU3nZ9wErpJ4skyEYUHMF1h7tw8mtUwebdxo2BB/uHRX8IjKO54B0B54bFCiq1m7vVUfASxkbVVzAdJz+GWC1g7o74E0rxTGrytfEQgkzwwAr0jFwSWyHUWYY1xJPz2Wl9AXL8g2khulcq/0C4mLW495+jq806N9vfpQp8TBDQ==
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0701MB2705;
	31:WbOnt1uniDL5uODur31z7GQNPapZYLU0ayRkdchdmkDCvBJ7fx4AUtBn4Y6JeDLYluRJ5TWDal00lD/RFm4vDuysmjsp9aGOUAPyF7nJoEiLGiVW6qD3yBIbBn07iorOSOAuiWjGZ89Q8fsthMeHnowVzs1QLxeAcWatrfLIQrbW5z1gHKn6886qfbdznbaTJSjEgWhxSWLfJV6nWttaehfzNfPddHcjM1TbW5UldMg99Dd8fqa+Lt1Y7eMRsa4X3pIP1czVHqpnDXWEzS/N9g==;
	20:YjQpyjdr6qrPXvNav0F4k9Nw6FjhjZafX2GuTpcF9uhAK5jrbcmSWxSuaTs9+d2uHTIInL4HM6MTQzm/jdeWIZdlVNXgjMivPR8dIsGf3nfJ9uPeRmWxjdSe3nfbdvw99pP7Bqvl6C8Wg2y9mLWq8Mg8Ou+0G0E3i48I9jX1IHhE9GuKbe5oKUdIGYXs+ixPm+YGdWKbnMA8CqkjGB9AeEoC2n9N8Zv/V1qgpIDEMMrR+liR5u1YRq9WJPGNzSyafCZs4KXxqp0ZQ4Mg5eWXbio2L8oZnC+s0v4iCoP83hJcfAzHax8EoROAMt/u4RTuzYjx7v0rDlM0y018MlyZ/Wnorgt2mnTZyEJVYli04/v6dcKvW/CVcT0Caj/uQ8gARYst0WqpK7rbDcKyNo+ovrAP9cBNZ5dQKThGRquEbYQfQ+XeQRfGTQj/HFtSt7lsTTmvn/SbTPyOL9/ZDjDWt45+JmwdYaNjg2GQcrZYMvyGIRI8ZEoJ3W49N4eVrcE6FsLL1AqLJ47IQ9+HWstxyjHWsqeS8YSCHI+KBdvNKR8vODnv+TgeDhbyRwfa1Fi9fE+813Y3zb9nBtfZsBsS8GLE/wMVsfz2QHmrCygT8ik=
X-Microsoft-Antispam-PRVS: <AM5PR0701MB27055BBB2F91852B57BB75DEFE9C0@AM5PR0701MB2705.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(82608151540597);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(5005006)(8121501046)(13016025)(13018025)(10201501046)(3002001)(6055026)(6041248)(20161123562025)(20161123564025)(20161123555025)(20161123560025)(6072148);
	SRVR:AM5PR0701MB2705; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0701MB2705; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0701MB2705;
	4:3EoKirR7xIhIAKJnzEIORnJKTocAcATeuSXX9sup2RzHdv0tfF7XX1wShMIHKQ+GFiua9BFBSzntr1DKOa7kn67xXvqqU0Q36TLYWqoAGGWLvQd0B13rs2Z8wwO8XqbAlEgD6TIizUTNUlKT26vg4/e7NoGFCT/2ZgfY7jeuoxW8D8youatL/zATaKjkJFhlzlQlrBelSevHNK92oITyaGg93AUvML/TJwHu7QeOBYSQLC7K953JM+iW9UP85XSN2XgRblCc6bmMi2XpqroIC77FitJ8wJ0KDfTTrvLt9laUnBPnsEHIp1Rgl0bGv0RN3G6Q1DZ7dgbqPztK3WwrppHKFwphiGuGXhWcxgQhfil+Q8Mqs+xfdf8QaBbyW683zTIYn8xJNJLIyMhDkDTkJBuf5nf61ksU+nWb8n4/k6Q/4YpbqcCcUwGn5LsTx8KFaafMg73OCC0mEzTNK/GDNdwve44Am8vO/CpR1zUJRDpADPWNFukcLGwVDHyEtwYRiY0Esrzbw3Pp+XCv/0XwbBOvjgE/KwsVaW/maAFFazbcaJyDVeM/PHREAhKeUngFBYE7t37eDEDQWdYOxaJSU+MJnMrqzcJAE11EZ7EERLPN2VYtrz+GdeSBaudmEy8GLdU7MYZVTg+YSw9OAJvvzOckwXFukf+gCgW+kuw5yYo=
X-Forefront-PRVS: 01583E185C
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM5PR0701MB2705;
	23:ZekGn+EDiy3Df42fNHxunodjTYnMTDul5CDPddF?=
	=?us-ascii?Q?IkOngytLurwPK3ViabO+3Q8Z6C0gRCQ3AZZnS54P110h2U4jGF5dBLGq25ie?=
	=?us-ascii?Q?3Zn1WNlmDsRr7JCFHsyWDWFUc6sRqeQrjWoujnpogmNuX1Mng+99P0JRAlbK?=
	=?us-ascii?Q?nruyW3UtDWWydi2PHVCrHn1arJdA+pv89DKWiywOxiUGyU/ynlEAhSLYgOOf?=
	=?us-ascii?Q?lnAozyseOaEptx2drUNwVNYJeQZO7IEMAu6ybly55MJ05I3SsQ5aRFZ2ZZuT?=
	=?us-ascii?Q?VXLLKRf1cdFmLD2KHjYqmgXQ5Z7vjSPzDB6gTvZ7RLsy5F4Jp/bK3kBPqHu0?=
	=?us-ascii?Q?H528tFpLhf0AqITBS6WWyoMVcKLxVzDtdGTPVJ5Pe+Cmay8AB0tQCVPuQvj9?=
	=?us-ascii?Q?81EJGCGNjbIt606UNpvlHRJexvx+qj5aTbYx9PY9TpfhVsxLFxkbf8N3Th9M?=
	=?us-ascii?Q?AL+ZWkH5Bsvr+On0/SGQkbAztOCgv9c7fywHiZ9VIpYKuMgvf/cBm9q2teDF?=
	=?us-ascii?Q?aeEfSrZwhGGJV9PvphsEczkEcxRHGREtUTLfVU/6Q1v5U3OcC8pYMK4dxUrK?=
	=?us-ascii?Q?B9dqXKBDSVplleUmfzjVx3sI0gM/9U5ycTXbbekky7HfhIam+yHddR+0w/fn?=
	=?us-ascii?Q?8t0Yd4prRQtHvplQrSkoz+Y6e9zM8cHKaT+y1cRLz224vYSPUSB+Oyuie5+d?=
	=?us-ascii?Q?R1XLiWKjHhcapNiMwdp9sYYn+VYt6oQK5efSFdLZBYD4UwVXXAiEMVuoBOsS?=
	=?us-ascii?Q?x3Y8ZeMoOmfcGQbAqDTq+5H9YSH9CWIDbzEbYZNTqW8Qc/fejcQxXbQK9K0m?=
	=?us-ascii?Q?go91ZhZqU5DMbRxfG+CwesL1Hy1RNS/i0uojXv35RGk+4/+xvFbtAKoswU+a?=
	=?us-ascii?Q?ChqbNhaiDFd2+2figsjM9DqCRDOBNDkoWDALUYb+nKq6LrdGlVUJnUNKDWmP?=
	=?us-ascii?Q?szVKWbhTULp1VL1q/PS7aNA1rouep4rNYddDfCycxa8bPSg0DHcqyxBJD0Gh?=
	=?us-ascii?Q?DHwO+I1rLAfXOQQovb6gz68Y9ZT4FvYYuEvaVUweUITzVRq5rzSvPlxlwSEz?=
	=?us-ascii?Q?SEHEDFO8i6etJk7h1Fm1EFrPBvQnOEd4EzSU7pDWq/y8P8lXBQgjjGJAsrXf?=
	=?us-ascii?Q?5p9awt7pQve8sMphrdhrzAnTleUs6uZpm?=
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0701MB2705;
	6:OMp9BQliF/lrO5/zU44XRtSUUTWcwVljxrkekFao2IJxe90gGoqJo73ZHWfVyxNguQ/6qTTALFG7vVQlCVfRS1/AQgPfsoewHDoAASKdbL7p4ExiqysSAaeOxMaWa3UL4/Xtn8kx7D3rTbFFDkz93P5bBBbh3StRel466dVflJ7gZ36EUEjuVjdoubu4XtItv7acgjRgUld4YIOwm7HP5Vqm7TWl0N8zomIUX7GhIVQECD+jDDy/ro9hFX6bWXDNWBFKhC15iaqJKf9d61X/kFIMhMK5fLW3FFK/tM8sFfy/0U+n7daig1DKheu5jphAAEQR3XkIqRIA9fZlv03kMw6+QFb6bb78TqWgDr+jRDNUDxZopPmJmyo9tXExWF50Z2XXMnGGkdZL4mD6EuvfbP5ilWeanWOq2w9Mz67HF5ddd7JOi/XP8jpsHv3HJu8hCLsak704toWb6/VJ7+zGMA==;
	5:mjdvEC9qPHiuZ/BHR/mGgEztiaaiLjoar1Y95v/+XUc5iWx8W9tzyE2iWsvXuqX/Pjtm3mkWlub1CdW2m6U9eKUwWsAP/I2Z2+PZuLAPAebIQPoABhDs6tkexvnpRtCwOfFJhlvK6maQ6KqfWQ/v2w==;
	24:lhDA8kN9drrnOCOaTHJ1w35B93YD1rqeM0SFfVJ87+h2GJqooDaoZlXjDUUmouzV7mBS4gEhwwsHBhVv9Y4YQnFAdRdEs7QN6YhcYcdy84w=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0701MB2705;
	7:m0FxHeFf59LadkKupJFN1ylaCwxyVOo/Albc8LH2YMCQe8Ne7BjfB7WCAF52ZhjsNmJ+nMAnjwwFmLpvez9nzyU0B3x/vPpThK41imxCU7B+Rd23YnRsY/uDwNUYNrgtEHNes8YNAowB1Cia9HFlYwMgIzKm5pD+nV0pNYvVU5aACqt9t9KBX16k3ckvlKw5U+6XlrWh25engDlwM8M47fwuYYyLQa9mQYSoMtCpL+AC2cID//D+3xMVQ9vzVP0ilYrgtmNsKMMSu5De3c9QXMh6mtix8/XHhTE8TtVvn2pWnAk/yX08uQVRff94+JO3hIZtniillmKM0oKCfN+gvKOJtDpz31AkMnpM0zksqKnC7jsG8jlDqJDHXqC/U/kfrcaGzC4qRvBu5K4HKZcotKuE3FnYF80OZZqPsRRBIuesrcbB2MVvyGBebFL6uq0ZitVjtWIGhJENBMiVJRsIIQ==
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2016 13:28:06.9192 (UTC)
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0; Ip=[131.228.2.35];
	Helo=[hybrid2.ext.net.nokia.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0701MB2705
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.133
Subject: [Qemu-arm] [PATCH 2/2] block: m25p80: Introduce Die Erase command
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
Cc: peter.maydell@linaro.org, rfsw-patches@mlist.nokia.com, qemu-arm@nongnu.org,
	clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GLohcR5F4jnR

From: Marcin Krzeminski <marcin.krzeminski@nokia.com>

Big flash chips (like mt25qu01g) are consisted from dies.
Because of that some manufactures remove support for Chip
Erase giving Die Erase command instead.To avoid unnecessary
code complication, support for chip erase for mt25qu01g
is not removed.

Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
---
 hw/block/m25p80.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 2bc7028..0bc1fbf 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -216,8 +216,8 @@ static const FlashPartInfo known_devices[] = {
     { INFO("n25q128",     0x20ba18,      0,  64 << 10, 256, 0) },
     { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512, ER_4K) },
     { INFO("n25q512a",    0x20ba20,      0,  64 << 10, 1024, ER_4K) },
-    { INFO("mt25ql01g",   0x20ba21,      0,  64 << 10, 2048, ER_4K) },
-    { INFO("mt25qu01g",   0x20bb21,      0,  64 << 10, 2048, ER_4K) },
+    { INFO("mt25ql01g",   0x20ba21, 0x1040,  64 << 10, 2048, ER_4K) },
+    { INFO("mt25qu01g",   0x20bb21, 0x1040,  64 << 10, 2048, ER_4K) },
 
     /* Spansion -- single (large) sector size only, at least
      * for the chips listed here (without boot sectors).
@@ -358,6 +358,8 @@ typedef enum {
 
     REVCR = 0x65,
     WEVCR = 0x61,
+
+    DIE_ERASE = 0xC4,
 } FlashCMD;
 
 typedef enum {
@@ -411,6 +413,7 @@ typedef struct Flash {
     bool reset_enable;
     bool quad_enable;
     uint8_t ear;
+    uint32_t die_cnt;
 
     int64_t dirty_page;
 
@@ -492,7 +495,7 @@ static inline void flash_sync_area(Flash *s, int64_t off, int64_t len)
 
 static void flash_erase(Flash *s, int offset, FlashCMD cmd)
 {
-    uint32_t len;
+    uint32_t len = 0;
     uint8_t capa_to_assert = 0;
 
     switch (cmd) {
@@ -513,6 +516,16 @@ static void flash_erase(Flash *s, int offset, FlashCMD cmd)
     case BULK_ERASE:
         len = s->size;
         break;
+    case DIE_ERASE:
+        if (s->die_cnt) {
+            len = s->size / s->die_cnt;
+            offset = offset & (~(len-1));
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: %d die erase not supported by"
+                          " device\n", len);
+            return;
+        }
+        break;
     default:
         abort();
     }
@@ -634,6 +647,7 @@ static void complete_collecting_data(Flash *s)
     case ERASE4_32K:
     case ERASE_SECTOR:
     case ERASE4_SECTOR:
+    case DIE_ERASE:
         flash_erase(s, s->cur_addr, s->cmd_in_progress);
         break;
     case WRSR:
@@ -684,6 +698,7 @@ static void reset_memory(Flash *s)
     s->write_enable = false;
     s->reset_enable = false;
     s->quad_enable = false;
+    s->die_cnt = 0;
 
     switch (get_man(s)) {
     case MAN_NUMONYX:
@@ -716,7 +731,15 @@ static void reset_memory(Flash *s)
             s->four_bytes_address_mode = true;
         }
         if (!(s->nonvolatile_cfg & NVCFG_LOWER_SEGMENT_MASK)) {
-            s->ear = s->size / MAX_3BYTES_SIZE - 1;
+            s->ear = ( s->size > MAX_3BYTES_SIZE ? s->size / MAX_3BYTES_SIZE - 1 : 0);
+        }
+        /* 1GiB devices */
+        if (s->pi->id[2] == 0x21) {
+            /* MT25Q00 has 2 dies N25Q00 has 4 */
+            if (s->pi->id[4] & BIT(6))
+                s->die_cnt = 2;
+            else
+                s->die_cnt = 4;
         }
         break;
     case MAN_MACRONIX:
@@ -880,6 +903,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
     case PP:
     case PP4:
     case PP4_4:
+    case DIE_ERASE:
         s->needed_bytes = get_addr_length(s);
         s->pos = 0;
         s->len = 0;
@@ -1217,6 +1241,7 @@ static const VMStateDescription vmstate_m25p80 = {
         VMSTATE_UINT8(spansion_cr2nv, Flash),
         VMSTATE_UINT8(spansion_cr3nv, Flash),
         VMSTATE_UINT8(spansion_cr4nv, Flash),
+        VMSTATE_UINT32(die_cnt, Flash),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.7.4

