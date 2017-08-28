Received: by 10.223.188.70 with SMTP id a6csp5075664wrh;
        Mon, 28 Aug 2017 15:21:18 -0700 (PDT)
X-Received: by 10.200.22.152 with SMTP id r24mr2909036qtj.252.1503958877970;
        Mon, 28 Aug 2017 15:21:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503958877; cv=none;
        d=google.com; s=arc-20160816;
        b=q2jqMdelAZdWMERcI+5L+KbmoecMnaIEUU8Zjo17YJWztJjvm+r6+fRT6PLZWGa5jC
         wbYrxlhivx3yHTd8xPkO7sBM+5tHzNjPQXD4w58+aJS6lRns+07ND9ETeHoQ7YNpawsk
         8GNXD6IySyEnAzfyn5eoyHbLHD67w9IGrfqhlB3iZpu9seMZxp21O77KhfHNDoKj8a/N
         0IxfquBqvFWcG5XU0TEiP7jLEAwGIh5pHKInjKtKXRnf15fIFcB6314sWs6go7FqVq2d
         E5lBsKiJCQuRUD8RN1ITeO1HccgS8Yvk9MY48uUJWk6kWXrGyGO84NSO0/GmP9A4sg5o
         6nXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=FglklcdKvIbmxVqwhMSIegdRX2SB07Q8XUnAjoBNru8=;
        b=QrUgcvyO6DU4Nt91v4IsCOKOR0hP46u9Iz5ZMRB1MJvW+R4bnVmdwnGhynkDgvWWrP
         axMmoEryGeIEILqoqpw1HdeC/mkVVI4txRObMEUHezURk3t82lpmAUzdnoavDPJUgxYB
         ohhhvPN7Kn/aHI0rNxVhBN7hKufESbosy6EKE6jqqALT4A6W5xFArIpxzjf+Sc8CaSfU
         EaY3QYBysbCiHxQDSBfIFhYprGU5a9smN1XzXao8eJ3olY+Kv0VqA7BHqLzL4/HpqT0/
         7fXbnFaM2hpOXuz077pTTWQpb7Lj4dWWGJmTo3x+sHJeIGisgJTMnc6e/33N4lmQeOqk
         kHnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=0k9uvH1G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t1si1309825qtb.379.2017.08.28.15.21.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Aug 2017 15:21:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=0k9uvH1G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41647 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmSPD-0008Mz-Iw
	for alex.bennee@linaro.org; Mon, 28 Aug 2017 18:21:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57105)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <portias@xilinx.com>) id 1dmSP7-0008LU-Jr
	for qemu-arm@nongnu.org; Mon, 28 Aug 2017 18:21:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <portias@xilinx.com>) id 1dmSP6-00040U-MR
	for qemu-arm@nongnu.org; Mon, 28 Aug 2017 18:21:09 -0400
Received: from mail-bn3nam01on0074.outbound.protection.outlook.com
	([104.47.33.74]:43487
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <portias@xilinx.com>)
	id 1dmSP0-0003wl-2a; Mon, 28 Aug 2017 18:21:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=FglklcdKvIbmxVqwhMSIegdRX2SB07Q8XUnAjoBNru8=;
	b=0k9uvH1GUDypVVazaE76rvoR3v29wG4zDepOfF5qbhOKdIvd9x3oH8fXMs8df7+B5AAieTXPD7y6aC+maC8dnzbOkAqYw4H7WDltJOvn60kCtVBzbvbe8uQG8r05+oJmIl/bdbgG0cTXuIwDxi4eNvd0iUmW3VzQ1BGZjxL/EX4=
Received: from MWHPR02CA0010.namprd02.prod.outlook.com (10.168.209.148) by
	BN3PR02MB1126.namprd02.prod.outlook.com (10.162.168.144) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1385.9; Mon, 28 Aug 2017 22:20:59 +0000
Received: from BL2NAM02FT029.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::201) by MWHPR02CA0010.outlook.office365.com
	(2603:10b6:300:4b::20) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1362.18 via
	Frontend Transport; Mon, 28 Aug 2017 22:20:58 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT029.mail.protection.outlook.com (10.152.77.100) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1341.15
	via Frontend Transport; Mon, 28 Aug 2017 22:20:57 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:39483
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <portia.stephens@xilinx.com>)
	id 1dmSOv-0002q9-20; Mon, 28 Aug 2017 15:20:57 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <portia.stephens@xilinx.com>)
	id 1dmSOu-0001Ch-Ui; Mon, 28 Aug 2017 15:20:57 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v7SMKnOo006258; Mon, 28 Aug 2017 15:20:49 -0700
Received: from [172.19.2.217] (helo=xsjportias50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <portia.stephens@xilinx.com>)
	id 1dmSOn-0001CN-9K; Mon, 28 Aug 2017 15:20:49 -0700
From: Portia Stephens <portia.stephens@xilinx.com>
To: <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>
Date: Mon, 28 Aug 2017 15:19:01 -0700
Message-ID: <20170828221901.12827-1-portia.stephens@xilinx.com>
X-Mailer: git-send-email 2.14.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23286.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(6009001)(39860400002)(2980300002)(438002)(189002)(199003)(77096006)(39060400002)(107886003)(478600001)(63266004)(50986999)(54906002)(626005)(575784001)(4326008)(6666003)(1076002)(106466001)(33646002)(5003940100001)(189998001)(305945005)(36386004)(5660300001)(50226002)(50466002)(48376002)(47776003)(9786002)(36756003)(2906002)(81156014)(81166006)(8676002)(356003)(8936002)(107986001)(5001870100001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN3PR02MB1126; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT029;
	1:pjM/LYiPj53PDDcqcAnrUVGAK8WoHNdgZuCRxVF6sfJoTOMnbHCkp0ejFqLjOjjjcic53wQ13Q8eNCT5liciyc8ins5hqWF2O/e3BpgbYr/nSLvRR8jhf0rltGVha1Ak
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6dd08431-a024-4f0f-2a27-08d4ee630e93
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BN3PR02MB1126; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR02MB1126;
	3:oZ8MPWd1hKLIoqgdeiUQHibwqi6Hd2GBUOHurNMoS26/qxbV/fi1kwQf4SPXyA75Zh4sm1N8IsAnD2SnLEkwUlBQSRVfdf6VkVlgy3qib2gV3/19O4x+fNytlWMjf+L8XaNV4yFWs6+Sr64wZN9B+xO+pYA9stMDQUwJELWvcS1Q27p+/hBOzdh3zpZqHCRli/lzWEdXbw2gNXiID0mEAHS8k+Qw4ltW6KDl3lu8qh7tLJCqx0rspkyzjcFpSVkJvL+QQR1EV/UDOiciqIrjIZh2sSy3Vs/MgouJhQ6YYNpd6/jo4ndQvlWyO9eiQr8N9PEerGcV7IuAdCtVCse+tHseLG+rxNnWfs2Y3DMvrXY=;
	25:N3Cf58X0Fr5lSyBmpmSHcRcW78JsTYiRIx7IBH7472jmGdgnkynLaaDU5yEpRUbm5Qkdf+axdZsMH+sAfk+WTpvOhgBv3di2j0P8FjEGA29h3789/b5n8E5sg6hx58g2CnOK9fxOp2kVZ+qlP9yDJlHsHh4fE9AHL9yaYSk8z+GfDetqPLtxiEefQxywXDaiE41t81lNm2khabQzqqMiZjYWdx7jSeym6yFfnbdSdEhkr9EvBW2kOV+4UNcICzZE6rBkA4rJqXKuLkZPsGIPQQGUUXtcRcRmxWcY9crI9J9mpXN0E4MbL8hqGrwjVxWVIa1YV8VsWGhRwHseGZ4MVw==
X-MS-TrafficTypeDiagnostic: BN3PR02MB1126:
X-Microsoft-Exchange-Diagnostics: 1; BN3PR02MB1126;
	31:Wa2OSuCHqOKsWxDTdgJuwq0LOcIi7f+uDvlALiDcUABok7hCp+z6MkcFucaVMNcBGG1qdvJaCGLmNnAnSYd22S6jiWrWx5cnbN/90C6F3xlyP1IABxrNZr7/E3ktG9r7jDxwG4smvzefW56uTC4zzdRY+Ed73PiYGxnLMl7aNSJuAlhoAp+tG1cqlB92S0XycJ7QLJXXnBCDK+OL+XIkpgHEcmCyyKjuMaBoC/LfxKo=;
	20:ujzmg+u2xztbEeFUagHNYBR+DCWysvQ41hUSAbYsk0PbRmyAP7JkWLTtXVnYCWc7k5HAofDcwYZyRogwjlfhM7UD/7uaJwq3I+7spM13dg896MTv3JRqMgxlo/L6UZx0IPuh3iuczrVQvBv0jTMXdhOnN6kf5vUZFJXUIvlsesr8QVRrdNk14Rhw7w5hfJ2yGnZ8usQwroXlIhORblabXHX8kKyCpM4WoTahbVHs4GjraD3vjlxeRrLafzHbQf1KYEp7MjS94jj6eImDgigyXGLGpOuHzmYwAW4wxlpXG9xW6lYg3etdl8N6sKK/2EJLZF2XxiyP7CJsOQgINHw9t7b/d2yuFf4Le0sywSGtk1FSUVAsOD70W9UqVPIVGW6hED6XyOXBgopn2bvfvBQMFtOnP0D+eR4l1k+vYFTaynqES8EZWpiBFxpoOli03mMKc2U0bfFKHWYz754LGfEi7VI64tf67wyEnCdhpdaPnRvfaSFKvUOVASbzfN3VFmDN
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <BN3PR02MB112656C28F604D05F1BC0CADD59E0@BN3PR02MB1126.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(13016025)(5005006)(13018025)(8121501046)(93006095)(93004095)(100000703101)(100105400095)(3002001)(10201501046)(6055026)(6041248)(20161123558100)(20161123564025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN3PR02MB1126; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN3PR02MB1126; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR02MB1126;
	4:uOvJdZO65El16mMt4uvRq9Z8moLktJeCH3d4jDMniYi9CrcpeF40FhM9OO7EALk7lk9+D19NDJcNxt3h2ED+9RrLa90Qz2ZhQ10EUv42ad6pDrGl8gnr+12dqiGIYOPzKUQ8bZmJ8pC6n7Qnq6lzrYSZ1x7Sj2Xp/8Qwi65RTHezQUTeUtPno+oBikGGOyLU4KKmAhTegJ43f8WhFatYRpArBUjy7PA9WTYm5zpMKgixmtkukUCz5vUlExcKNHedB9DqHtF3M6J5mMim4QE3kBUuy4msAap/44UcH7A/vVw=
X-Forefront-PRVS: 0413C9F1ED
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR02MB1126;
	23:Msohjfzc58Z8rl01uApPo+fWxwbWavaYUtu9UmW61?=
	=?us-ascii?Q?NYjpkinwneAo7iEZzcb6ggTf9qV/2yB/Uxz0TPtjugEmsJS1Xwl4kDEWZRZG?=
	=?us-ascii?Q?9BMGN4fY+OEbQUEQaKc4O68UMqWgjT+6BCKXFe0Hx0vb7Xg1OGXKoJxixNJI?=
	=?us-ascii?Q?KJuGMp5u3hUkj2/fgi9rbBq5oTQ24edqCHfozM6zYa3gSrAt7FP9G1YCr1Rx?=
	=?us-ascii?Q?Lts1csWQmZ9c0K/44kYp5H4aPbxTRjuNisdt1aNLelnKC2B5hsyS7V++U8vD?=
	=?us-ascii?Q?O7/9pAOP42l96dFvdnHqzJVOhpXWbT1EJqIXB3al7isOsteD6S5PjCJQCwEE?=
	=?us-ascii?Q?UQFkxk1ELqeWVBz2LHbpnzcLm1UzTQz2Zs7gSEt1LhV9lujG5xctv4o0tuhi?=
	=?us-ascii?Q?gbxkK9HyoDCJgKKmaMxYrdCaTPfaoiVZvNm/8GPuXFKHiVaJL4ptj2MHtpZj?=
	=?us-ascii?Q?LPvjhrrjLSjlc2mP/cZzSykNZw68aCR4y8Q2WrzUGLG1gQ7yJI3OhOVhAlBP?=
	=?us-ascii?Q?JSGH1wGEDV9y/9xSxH58D74k7U/7U4jD7l4UYAQnsL9UUgtGve8+i73eph3C?=
	=?us-ascii?Q?LCuLuJrUcOV9UMY7g88UVhfTtUpU+pyQcZRU/zEl6vcE7/Q0iOTBf9EFwy6w?=
	=?us-ascii?Q?oPafZ13qh9bLn6g6kJpS2RqIlRZLMY8CFjVh0hK1rLDeADrO7Aon7iOtkud8?=
	=?us-ascii?Q?DfnqJLieskEtCC/4loJxluICsDTEg0BME91MYjnWObANgtFmfeGFYznVVFaR?=
	=?us-ascii?Q?Z9kWmJFm8CG4paIbRsWCS3zgCD4yeNMWIXIN845GJnve1ITU3Mo71SEZ155X?=
	=?us-ascii?Q?rdaCF/EhDf6s0HfRGJEYNIZogw7+wb0Lcj2hLDp1RGQ5Er3MdsikyPlXu8qA?=
	=?us-ascii?Q?N3L9uXuKFVNdRZGygUcp4gVAEx7ehqoHInbN0EhS/uSFJs8D+vOMBB8yliGO?=
	=?us-ascii?Q?7bVf+8nWbKg1Y3v2vzzdPFXBTmZPtlog62Y6R4vex+S4zHFXl0eOCEunfnJa?=
	=?us-ascii?Q?4F/iT5sEQxZ1IHCTa3AIBwd31pVR54+mw4+yBBf7+xBgcNSHQBa4OUBLSQYT?=
	=?us-ascii?Q?+AIqA3tSmljux9h6sij4a7x/qGd?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR02MB1126;
	6:egle4tVt0rDhEUjZzKlS4d8xXGPXfgthRw/fZGZ2nNjHbp66WrpmdBlPROMrC195pCzmP9h+Ku5OMQKfuBzR1Q2sITq6bPPeW9qeBixrHrKRVd85c6jYA+WxN3Xp8tsS829J1z3xP6vkeWFwXBQ+WOpuAnpfM69Fas4lwmUge57psy65UyQQcgvlR/nrnHDqSpLaiAUkkkbQtLsEJE8FOKyng9VFOAoJ/Ha6vn15Z0N1E5BlOT5asNbdQHzzzHYRJnDrp4z0nJ436bkt19rRBeq3yXjraKsSR6RoDE0rEzKzSV0BTzn4q6Z0M/2ipKefmPo6aahGXYvBxtePaDNPJQ==;
	5:66gwihJVvpLkodV5kXS9KvmOF30YULtdEIAn6RI9EoMXuPcuk5Kjs1N1VpJAfloAG5GOZdUUmK3yv4E9QSGSd+R+ibBfpU/QyJ1KKmYxFijX8DBvCDLQHEm7vDnaYa8wQK3G+TGmNcEmhHjnjmHvMA==;
	24:phPIBu7mQtjFb40j8U5azyk1RQqERvMDiwcK8GCZDCZnSRXiAC3yvGfKKetiHgaPeDvyu7VQapfi/8ike9zXcyPpSb+xCuwkJagGMKfvV4k=;
	7:mdX8MCT1a7y/n0ApCZGCEVcVue9Mfhpe6QEtdEgBKBkPoeGhxF4HqZaDNY8aCpq1QCM8jPHNBRoCHe9C8zsEBY9UPhYxEwKWpZOd2yGyYIDaEWlCix1yYalHIkAqjpZLvK/swE2o24aoQcoJeCPZv8RTV5zdShB/yIIzI1jfBIcq6bL7yBOhnKptLgPHD4EH0IOsiTg/EyPMe8UneQO5QtAVYHFYcuGceyRjJvMPQOw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2017 22:20:57.7749 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR02MB1126
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.33.74
Subject: [Qemu-arm] [PATCH] target/arm: Remove 5J architecture
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
Cc: portia.stephens@xilinx.com, qemu-devel@nongnu.org, stephensportia@gmail.com,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SysrYhzuq5X0

This fixes the issue that any BXJ instruction will result in an illegal_op.
This is because the 5J archiecture is always unsupported.
5J architecture doesn't have a feature set and ENABLE_ARCH_5J is hardcoded
to 0, causing any ARCH(5J) to result in an illegal_op. The only use of
ARCH(5J) is in the BXJ instruction disassembly.

This patch replaces that ARCH(5J) with ARCH(6) and removes the 5J architecture,
this isn't technically correct since the v5J ISA does support the BXJ
instruction. This change means that running a BXJ instruction on any v5 will
cause an illegal_op but it is better than the current state where any
architecture running a BXJ would cause an illegal_op. The correct solution
would be to create a feature set for v5J but that doesn't seem worth it as the
v5J is so old.

Signed-off-by: Portia Stephens <portia.stephens@xilinx.com>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 target/arm/translate.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index d1a5f56998..4a30c0d7e0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -41,7 +41,6 @@
 #define ENABLE_ARCH_5     arm_dc_feature(s, ARM_FEATURE_V5)
 /* currently all emulated v5 cores are also v5TE, so don't bother */
 #define ENABLE_ARCH_5TE   arm_dc_feature(s, ARM_FEATURE_V5)
-#define ENABLE_ARCH_5J    0
 #define ENABLE_ARCH_6     arm_dc_feature(s, ARM_FEATURE_V6)
 #define ENABLE_ARCH_6K    arm_dc_feature(s, ARM_FEATURE_V6K)
 #define ENABLE_ARCH_6T2   arm_dc_feature(s, ARM_FEATURE_THUMB2)
@@ -8389,7 +8388,10 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             break;
         case 0x2:
             if (op1 == 1) {
-                ARCH(5J); /* bxj */
+                /* This should actually be ARCH(5J) but there is currently no
+                 * 5J architecture in QEMU.
+                 */
+                ARCH(6); /* bxj */
                 /* Trivial implementation equivalent to bx.  */
                 tmp = load_reg(s, rm);
                 gen_bx(s, tmp);
-- 
2.14.1

