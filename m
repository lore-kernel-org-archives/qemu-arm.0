Received: by 10.223.188.70 with SMTP id a6csp1499586wrh;
        Fri, 1 Sep 2017 14:04:43 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb7KQdK9rAYXsN5dNiH8kxbFPqRyV+gCveIbU9Fb1G5WGKGKhFbo2KOyUk5Q1TNvghXslq1S
X-Received: by 10.237.61.116 with SMTP id h49mr4498561qtf.195.1504299883701;
        Fri, 01 Sep 2017 14:04:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504299883; cv=none;
        d=google.com; s=arc-20160816;
        b=X0J4Id/+BjR9VtsrZXGt+wyicC7699Qz9clmCBFmLwIRMMltox2+7GFwGnIBRZXiwQ
         R4sfyWVLHzjYGsZIED69OiCIiqi/5oSWOozmZLu9I4jYHkQVGdYsEIptDQ4REKjG3klZ
         Cy8usGGUxJFEHyYs1JTCvzkrh/7ADqFlG++ar/7stO0bPpHT5Gh2wsUWxlWl54ZPwqo+
         oaWR7OlL6QKK5AF0Su/IMycfFWKHlAEoSI0GBprpJ8iiVHJz5HuNbcGqdxmtJsD5BQxd
         S6Sl1MflNW0jUf3EFp1o6oaSUbTX9h1A+wvqlXL0eLv6eC2xzfkjhEBEEgPLWyG5itOD
         qgMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=4Vy8GN1f+Gh0EFmMNgS1fToRjwqn4CXLjy1G63yC4P8=;
        b=lG1445x4zp9TNxIa1f04lBY0RkOH9tFL2HnAXO3EBLj6fNNw+XM79Unpr8Yy4owrOr
         Y1ldm51riRxdDXv4o+jBHkwYUay+gtwzgNa+NFja/Zf6JXtTTHssOc3uwSERkTzkxv/V
         TCevJ5OmKVLTbJLAk09rAfJY/AsMccX3CxRnsa+8kDbal79GWfaSkwyFNtLrJdIxXNDE
         d2wTYCKfcJrCnD/4kkkW3A/kZBoXz18zz/Lv8zzQ20c17Ro4/jnuiEG0E6s+LoDDn8D/
         mRV0zLWREmM5pNio4Zq4PlNth+jKqs4yO4vskKPvjAXmbML4lLNvozFHT+cjOoXG+oBF
         itug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=cSfEkyf0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v44si1048470qtj.169.2017.09.01.14.04.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Sep 2017 14:04:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=cSfEkyf0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60599 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnt7J-0000PY-CI
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 17:04:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dnt74-0000MI-Dv
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 17:04:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dnt6z-0006k0-F3
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 17:04:26 -0400
Received: from mail-by2nam03on0065.outbound.protection.outlook.com
	([104.47.42.65]:29616
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dnt6z-0006ht-5P; Fri, 01 Sep 2017 17:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=4Vy8GN1f+Gh0EFmMNgS1fToRjwqn4CXLjy1G63yC4P8=;
	b=cSfEkyf0sSaEfwoXweOOKH/ZaHSMwKbjOkzqi3s4qxWARrye8ZJ/fmk7Q7LL7lUyS2ccpe/Uud0ixfi3fXxeWq61B9PgrH9uoxwbGayfM7ELDXBoQ7EyX3vtUhfPwA8PK4pxbai7yRYBtxvlyCGHqRyG5R6aVz+xcGnQ3/mZ1+s=
Received: from MWHPR0201CA0028.namprd02.prod.outlook.com (10.167.160.169) by
	CY1PR02MB1135.namprd02.prod.outlook.com (10.163.15.149) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.13.10; Fri, 1 Sep 2017 21:04:18 +0000
Received: from SN1NAM02FT048.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::209) by MWHPR0201CA0028.outlook.office365.com
	(2603:10b6:301:74::41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.13.10 via
	Frontend Transport; Fri, 1 Sep 2017 21:04:18 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT048.mail.protection.outlook.com (10.152.72.202) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1385.11
	via Frontend Transport; Fri, 1 Sep 2017 21:04:17 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnt6u-0004gD-Kz; Fri, 01 Sep 2017 14:04:16 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnt6u-0007fC-FQ; Fri, 01 Sep 2017 14:04:16 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v81L48CT027495; Fri, 1 Sep 2017 14:04:08 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnt6m-0007dX-H8; Fri, 01 Sep 2017 14:04:08 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Fri, 1 Sep 2017 14:00:32 -0700
Message-ID: <cover.1504293917.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23296.003
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(199003)(189002)(47776003)(50466002)(356003)(2906002)(5660300001)(6666003)(36386004)(36756003)(48376002)(81156014)(9786002)(81166006)(8676002)(54906002)(77096006)(2201001)(63266004)(106466001)(4326008)(626005)(305945005)(8936002)(50986999)(50226002)(478600001)(189998001)(33646002)(5003940100001)(39060400002)(107986001)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1135; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT048;
	1:PgXuTWs1ex7YUc3IHoSKm/u77n3KZErMSS72s20HFykXLEhycrfm5AZYdsoH1Hps18lIUCbpEkjbs8to7Fmzn1tAhUrFyW/fDI/lSlZ2809TbpjcrkDesxpf+oZEUHS1
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 488b6693-e759-4852-b990-08d4f17d0218
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CY1PR02MB1135; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1135;
	3:aisMV+Q5NCEZrJqSD9A3wxGwldc8bGlx565XyInVZXhUZrtRmldQzTFVy6TSJ5vJljBcvFXpITDEswXwgoCzkOGYx2Ua/g1S33X0kLal91qjo/wB+wEDLOr3ob+w+eVrLXU/os+7JyTe+vnpnkNy7xUOSBaDNcUMFUdQyKM4wsFW/TK/tZeYs5vuan63BxIJFmOK/3WvZmYPclv80tguqwSfA7foLaQJWbIs9ccm8uAWtn4eWzFE1lcdthT+9iOsPUmuoLMZZoVLKkM80ancKJ6EYp+3I+QAQRFlQ2boOgAIy8xUbkvxpsOILx4PHKLNVxLMcNr1DPA78cwCGvPQ6nogsHchojeBTtiF3PO9PFw=;
	25:qymsULnrO1EYkFIv2jDI9QwP4Ixe1q6v2m/JpR8aG+njkrnN9jKVSX5tDY700Z6oFO9pICT8rHbHIib9ipktLiw/fpGvooeA4XWLtfojNhg8Ryi6pob0UNBQM8qbC0M1MOSAbbO8vrCbOIhUeVUV7V2FFHOfg7l1MD3Y7P+GhPzRxW75yRZGFvR9+Naj73V1Mt3Tjj5v2CS//qPG9nl0L1DqU40yOn90j8kFwUxLcZYxNhI1XP6dxKYExfJVCgqyU2bKv8o2JGpAvn7MQdvww3pRbFlU6/YkPhwxiDawLUC5p+CVgGRlT8BwRMZA6zLdG50XY8gTEsjNwY+ZQa9t9w==
X-MS-TrafficTypeDiagnostic: CY1PR02MB1135:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1135;
	31:suRIIoyEE03/SOM1dUbetMMqqgevkGSyitBwdut1NQI18qlePtP0/xnJ7FEO6YKGx0sxgepuyRFM3EiRJUysyALqnK027MpjJlXG5tptME5H6M6lx8YBoYXaT+X6BHjh/+8Jcm5jm28flQQq4kjFdV0rD9kOeTzzCvGpbBGdiPRRh6waR3KSkHhj4+Yr6GloCKsWOpgNq8VQJvvLC1jv7ZSGGnFjmJ5aYqxUe7jxKv0=;
	20:uuNXCQjLo3bG+kfM6wKBn6pKT5erwtvVQybCvRS9+uOWIpDKePDwYPOvWz1uadAH0RikpyEY/HI5WZ4g9Kp6brR4FCQnu+OCgGhbc5XZsw+/cDKNlhsdzltRrwCaPhHYy486Hq37Z8mKS2Ibv7gUvwxhkCHaTwKr5YS6n4W/8Dr7vJaxC/CgzKY5YC154Tn1ei72j/6IYX1Estqt4zeYSlCjV0wCzyRZtGKP9QTbScrbB8ruiC0GgG9Cv7yyCW3K6z2YA7w2X0uclonYcVbUmRw02bXZUNtHiniNVEw+BYLwWenUa8XsrHQrs3ftct7R9OtBOL95t75oEzVe2H9yzyUxuAgZMDDH35zMkl2HhoIqrbCP8VK1BmKSt6cMLPcW6Z0KLsGe6NzOcnqscVHqiWlBXRMGWXVfk3N3c8EZCWshh2ksb9i2dlIb/9PtU8CkWsnWtzz6PmCOg5QltKJYCc/FzEE+0h/p1mZ/geMl3W0f0hYRt25/n5MLtV99RCCi
X-Exchange-Antispam-Report-Test: UriScan:(21532816269658);
X-Microsoft-Antispam-PRVS: <CY1PR02MB1135B11528ACECBD7533B2A5DC920@CY1PR02MB1135.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(13016025)(13018025)(8121501046)(3002001)(10201501046)(93006095)(93004095)(100000703101)(100105400095)(6055026)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123555025)(20161123558100)(20161123564025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY1PR02MB1135; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY1PR02MB1135; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1135;
	4:Cs3oJSz+eV9GmzIoVPqGrlFuvoexnwPGQC0C3VwEmoN43NvK9jd9W7jht/GI3X3RQuOyidsKmKs435KzRG9Itfz1MPydD2l+1LKo1wmBqBq5j7evZ/tMpMenjASeJ+Koa3HJW38ymlUGbLhEPB2xUcgpQ8y2YreY+oljAurXB/5dum0EwDKDMSkq/EJzC67uGtEnLzeots2RXkOaUeLwmeIu02uYBPdhiZxRiB8fB3++NiMDIQwkLg5ymKJUXnsSXMHKLuJXRttIeDXAOzNjc6P1uYAt+rw93bXR01jDnM4=
X-Forefront-PRVS: 0417A3FFD2
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1135;
	23:4riqRe9Fo9y8YmofV/+SfOgzNvFNVG0wSfjWPGt1593aLXCYBtotLIV437SKOhKi77ToaZew47Y5ZBDs2YUJr3EnA8/gjvgdChKu+zwaUEbmCyAtZ7Me09CWH720nHNL2WmM8dcAJq4DRsyYASRXo6fWT6No4M4Y0MUXp16+19jmRKKlHKxjMz5aGudoDfucnKvqvy2/wlwj9tVzCWEkrzSFb60OPFs/xQiPTqzRiS0ltoo2Y7YqFGnRLRnc2+/cUUoeCIW53tuI3X0KKeAEpY6mFT/czCT3Uzg9333UGnlfEubJwMMwPM1YGYH7bylufcHQr5kZDIuiRk24BbFqrA2B6tPYJJWNZTl8gfbYnMDCxSHYq/oUBfpthdpv6paOgCUFI8x0CbKUs/8UuqLNiaGcMaPOSYVyrRYWAs804QrjrCOfqNLDYnnM1jW4dJKnrQA/TUvdNVlUL2E/OmjgwAqb5pPHvq2Go6EdMxZ51Xs9HU+aYtcAgzzdCUdyUCCuTvD5nIS9rSt73+LN8K1Dxpna+Nw3LQUgN6IA1JV9qij0yxjf7+JOhmZGhf65fAJZ/Whufj9L7JkxiuN7XgykSulfIFZlG/W41xAujcc68vRG7715cbgHOaeFDvzn4AY8uRhScN25tfubtwUE11eZS2ScAKVAkVk5SrBtzIUKlGt1lEE3zP4ECyRSAiXV8sC5RyiLi9uSh7chbW4S5+3q6DrJi0iPD/n9bUzqTkTfv/X5h4U4tMCt9EIH0vRSaBY8mleqRZh/SOBafoOtgiVvBQcgdxXMqpSd6uLVG4x/ZfLB4qTO7rbGuXj/BtOgYC2aQriRrRA6+IUufQM1RGSnXpe0/Xqkp19fMWbxHPBg2tLI2buW4pDyIdKWcKhPPhsp4iUrkCuhu3AjaRCOK9q1eCENXI9MpvrB0d7jFrArMqM=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1135;
	6:RhCM/9zHvqdseAKTBlWv6rOjLKKUDY+kkoP29Wx8ssYKzHJlzcCT2Q1joAU9zChzxLWCR+hgO9N9mG2XlCCs+EgdeMSAdapw0Ubh//EG/wA1X7PJlPnpKZTyt0J+FK0N84Vz0Q7svWvOq1xPSE4iDc96SnJ3+L3z1oczc39UzJ6rTWP1N0ZhfMK0Fb5Q3apKGP09IJDebGGQUrId7cOrgAe2Q+jgWmr2iBxLWbv9bzRpX0ZVvDi0vIdXASXZV3PTazueOECEHoM7Xo2KfaKdsPv2GhZl1etWaqF/5z6FrSTO0ZBtZnZqy6xcvWTxdwnNhsHuBbggzmbtTNE9L2WhFw==;
	5:H/IKxvJ1HYjsJGAsTlJVClvQnU4HGiEeZpj6u2XOoF2t5JSW/+/yYXBDZyBTz9UT5Zjud959qNW7PaNYv1gzE59+kqALWix2GrSIJ3DpMfUsYhafkYxjIgaHEvwJgiFAn8XbVRMiEtPtb/9KkA/wcQ==;
	24:25/NJmBoJXx6jKWi8qBBJqiH3qtgSJOm7T9oy4V22m3OWVAiVWAQUPw1bAgceU1K9w7KOG0YcwY2hhBHhMqx3ktvBxZBr1J8PVNLd0S3oT0=;
	7:r6Zn88p6uMXVTZmZ5cExPaVz5wEN4PloDYIcBOahsOZRhWyHffXR267Eh4nNYbOTg64mC7ZsxxukxUdLdKSvIVvjDFzOS7PEtK514fZPqcRvSvwwEbeuvJNJ06NTJkfE1AEDsoAUt8XiwXNRAYkli1gFFGbjXbahSg2IGGRJXD6RjtPyvYZqiTkZFxp9UVAlPfPlaFJ1wIU5APoyQuXoBkILUSbsM3/+qS6IVEX7O/Q=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2017 21:04:17.1807 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1135
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.65
Subject: [Qemu-arm] [PATCH v2 0/6]  Add the ZynqMP PMU and IPI
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
X-TUID: 5ULCRDd4aI1+


This series adds the ZynqMP Power Management Unit (PMU) machine with basic
functionality.

The machine only has the CPU and memory connected, but that is enough
to run some of the ROM code on the machine.

The series also adds the IPI device and connects it to the ZynqMP ARM
side and the ZynqMP PMU. These IPI devices don't connect between the ARM
and MicroBlaze instances though.

The PMU machine is missing an interrupt controller, which needs to be
added later on.


Alistair Francis (6):
  xlnx-zynqmp-pmu: Initial commit of the ZynqMP PMU
  xlnx-zynqmp-pmu: Add the CPU and memory
  aarch64-softmmu.mak: Use an ARM specific config
  xlnx-zynqmp-ipi: Initial version of the Xilinx IPI device
  xlnx-zynqmp-pmu: Connect the IPI device to the PMU
  xlnx-zynqmp: Connect the IPI device to the ZynqMP SoC

 default-configs/aarch64-softmmu.mak    |   1 +
 default-configs/microblaze-softmmu.mak |   1 +
 hw/arm/Makefile.objs                   |   2 +-
 hw/arm/xlnx-zynqmp.c                   |  14 ++
 hw/display/Makefile.objs               |   2 +-
 hw/dma/Makefile.objs                   |   2 +-
 hw/intc/Makefile.objs                  |   1 +
 hw/intc/xlnx-zynqmp-ipi.c              | 377 +++++++++++++++++++++++++++++++++
 hw/microblaze/Makefile.objs            |   1 +
 hw/microblaze/xlnx-zynqmp-pmu.c        | 172 +++++++++++++++
 include/hw/arm/xlnx-zynqmp.h           |   2 +
 include/hw/intc/xlnx-zynqmp-ipi.h      |  57 +++++
 12 files changed, 629 insertions(+), 3 deletions(-)
 create mode 100644 hw/intc/xlnx-zynqmp-ipi.c
 create mode 100644 hw/microblaze/xlnx-zynqmp-pmu.c
 create mode 100644 include/hw/intc/xlnx-zynqmp-ipi.h

-- 
2.11.0

