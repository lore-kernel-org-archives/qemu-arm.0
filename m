Received: by 10.223.172.38 with SMTP id v35csp1198970wrc;
        Wed, 20 Sep 2017 15:09:28 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCSYoKfGlNx9WVJUwB/jezuuO7IAPs51lB5LSaY9JF9sBKZ8dSmvoeRUsrOnCPJzB3FXAf/
X-Received: by 10.200.33.235 with SMTP id 40mr269169qtz.185.1505945368143;
        Wed, 20 Sep 2017 15:09:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505945368; cv=none;
        d=google.com; s=arc-20160816;
        b=f7lavr8jmSw8OiFYEYzLf/K1m7287isMVhw90pynQ2bo1G56QeBuiN2pVhU9iLRzAs
         EFSNmRuVqKz+EaXzSuXRVRs9AfqO3G8ThFL4JUJp+DjI/hUW8MwbfYy2kJFGNeJ570KF
         urPMuNnnSEfyhtxer9UaAVPCCMXBDru7aJSww6yjxyD0wn7KY11hhhzM9062wLmLX93n
         gx0GN97ZTk6JPQ85QqGVnoQCFCvPtjjL3GQYD7h0Yln5zYp/1ciOFchYXwOXbp4HR4zC
         L8I9/YEzu7aAsmYfr/7AkQ9mHqmL13uebxRBtHhG8RShgDP9SKQiuzT4hi25nXy3mnLF
         Ig5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=7VW2k/OHxNy6TkZ/r0t9CxmbY5Sz3LNDOhMxcPxFv08=;
        b=DwWX2esaUUScjJp6QzoFP8pg4Ui0eiS9Nxj0nxZ5IDvPG6UitkUW8CuFAG3YPN7ITz
         jEPfUgWBwrmcyq8nevQg8NN1ELYJwNyu7/sDezEJxFkHxm8auYXNhDnJbimHU0CicCYM
         sV/OgKt1EeC8xOItk/ITdCkTKoIzvVsboP3XTy5MwoWg7cDdBT6m5yBSnH1NHSMhQH6/
         ZQdHLwaUqurAtoksLvsCTpcgE3RH16VQuq7kRC0x0E7Va3HtICJ21hpvlM3lE7o8T9SP
         x4YK0pP33D1qQh8oezCNVtyZpuSacLz01Fs/9d4DLWpZnpVsJ1d/IFFDfu2Pm+2uD37f
         nkqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=mXgAmdmG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e9si2750416qka.106.2017.09.20.15.09.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 15:09:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=mXgAmdmG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50868 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dunBN-00045W-OA
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 18:09:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dun7r-00013i-0w
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 18:05:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dun7n-0000Pm-1u
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 18:05:47 -0400
Received: from mail-by2nam01on0053.outbound.protection.outlook.com
	([104.47.34.53]:47392
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dun7m-0000ME-Pv; Wed, 20 Sep 2017 18:05:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=7VW2k/OHxNy6TkZ/r0t9CxmbY5Sz3LNDOhMxcPxFv08=;
	b=mXgAmdmGBxgVfsCnVrgyktx5ytxgiB68NACxxDQTvCI0CWhjF1haNU1uSBmevLLDHBR+Dx0BfKXya6h5wR/2r3JQ/kBpV12pNUK7Olp/uGGUYuTQ+AjqC1McDTffOBnkvvKmbNjYwJ7UOsUtFCpRs75i60C7aCUy1/qyZG3sNBE=
Received: from SN4PR0201CA0030.namprd02.prod.outlook.com (10.162.76.16) by
	BY2PR0201MB1928.namprd02.prod.outlook.com (10.163.75.158) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.56.11; Wed, 20 Sep 2017 22:05:40 +0000
Received: from CY1NAM02FT018.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::203) by SN4PR0201CA0030.outlook.office365.com
	(2603:10b6:803:2e::16) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.56.8 via
	Frontend Transport; Wed, 20 Sep 2017 22:05:39 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT018.mail.protection.outlook.com (10.152.75.183) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.35.14
	via Frontend Transport; Wed, 20 Sep 2017 22:05:39 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:56538
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dun7i-0005il-BE; Wed, 20 Sep 2017 15:05:38 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dun7i-0002Pj-79; Wed, 20 Sep 2017 15:05:38 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v8KM5YFt025875; Wed, 20 Sep 2017 15:05:34 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dun7e-0002On-6f; Wed, 20 Sep 2017 15:05:34 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Wed, 20 Sep 2017 15:01:55 -0700
Message-ID: <062f70761df156e861bff162d02e6f0b7d8d0bff.1505929556.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(6009001)(376002)(39860400002)(346002)(2980300002)(438002)(189002)(199003)(50466002)(9786002)(356003)(2906002)(48376002)(106466001)(77096006)(5003940100001)(118296001)(478600001)(63266004)(50226002)(575784001)(2201001)(189998001)(8936002)(36386004)(4326008)(2950100002)(36756003)(47776003)(316002)(5660300001)(39060400002)(76176999)(8676002)(81166006)(50986999)(16586007)(54906003)(33646002)(81156014)(6666003)(110136005)(305945005)(107986001)(5001870100001)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR0201MB1928;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT018;
	1:m6u+5ERS+MOFaOoqdNnLVclBZS26W8QcbeQMAS1cBOJEBMkXbCE2Nwm4uRTyqvkt5egD6czAnm4YYH5KjZzeuQQK68LbdaX4Cgp6sjsUNPY1h3eazr4TJESdKrCruQYi
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ac63fda-7685-405c-41e0-08d50073ba9c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BY2PR0201MB1928; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1928;
	3:LYX446qcHeiB4Q5zJm7IfZ9Z9ik1EjdfwsNNk4qKObqe+tWTQaYzVEWs76PWV6aAXw9te4MCAJNuxGgzkQYMoOcSbG4JV43JOfNH4edo/7Q9hZipCkUEJ49QH1UTLI+WJL9msP4gv3Zs8bCV/Vp3JqrUnTXq6gdrzEumrG4AYvAD0EPfWBQZlH7Zbd3kDpDPEt62AHExj+jDzUcB2g70JU8lFqrntj2gTy6B0NVcceIK0ydjTiO+Lx+GNXMilKcvjCvoRoXTtZ4c3Qex5ol04KBGv8bLBwE6RNzIfDNZOMoXOBm5suhSepENnxytfWtOG9fXcNl6E/6DGo6oA8y6GndhgZ7rL95MhUQin8fftyM=;
	25:Pg765vm9lGr1itIMBzhofg33qMzYs1L+uXAd2iyxnnV9XbIeIuRV8sffCwcQPlER4mm/Nynt+t7Wt5cdJRu8VJbi/plqDZ8eRLJSz9aFoKhh4PuukNzM0c9IunDvWmSkl7nF/SqZdX95HLfIHFJiDtFONbBsv2zML796ykFyhABG8hsaIrHP2cXICXmfIIpiEHOkxWDJLFcllwgts4QBs/35npoD3pXe7fcbNa4PUuTij6R88CMG6C+2dfCBK5oqdOQLuwgs5MJSYySiU9vDZFLZbudg3h4sjdMPwt/HmMFj0EMO52VEfyQI94Gq9n9+xxnFDWGUrr2CcFXUinmkNg==
X-MS-TrafficTypeDiagnostic: BY2PR0201MB1928:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1928;
	31:XOa7DB7iPr8vUWQ1s6jZInK/EONpbbQ4j5VhjdlH67UrCBY8MQ7e2HVcPkEYflKfB9rYynx2ZFW1dEeLJ4aQuZkga6S65a+rAh61hltydZ1zDsxHh3YC+qew+OPNQXeIDm0rThsdeGRV+SuMzWexlzvQY4lIAFgzUCUWZ2M5vfxfyq3aOZbmhKGHjcg1U7mRZGCAdgbgR9L7nXslHFUQvuJd3e/dHkrIrgLlPdZACm8=;
	20:/lx2X93Kw+4neuLVFtgUCKqu8GdDaL1UPgtuz4aaMw4GTc2wHMJZbIlkUiRE+1IpDyS3c/S69GsD3ELppcnFVGbkNr7EjfIPJJCYGXOo/vJn3IqdDhhhICZWfo9PIG/90KBFikpiv1YxS+MLYBybXpbDJ39sQbAtnYyA1WYdQGrsBrdjd2dJR4d6ss8T1I2/19oKdxje5fmNgTzIb/YVfaMcz5DtyPMm3dw4ojHReDj/37NHBLCbVRRwlxDPAjLgTRgvXiYytUVoroRRomDpFES6OWbcpe6FL2kd6tQy3lMg+bVGgTEoFYa8RF/5SKCfDBUgsP7vn2khji1L5iM2VV+wuNZ6xVJ+2Rn80RL1bwSigTQV6zyDuwCaRMN1RJMCKjiI8vGGSyK8GU8t6ZXRgmTnXvL9BO9knXFMesjUW+alHdBBKFchCYNh0fMdrRnVMwiTJg0VqAV9tvGcIlHD1myh1im1kJjgsQ1NP5mNdCEMk/yfoKW/3ajosegUJaMg
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(21532816269658);
X-Microsoft-Antispam-PRVS: <BY2PR0201MB192864DE5E87AE14FDCADC04DC610@BY2PR0201MB1928.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93004095)(10201501046)(100000703101)(100105400095)(3002001)(6055026)(6041248)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123562025)(20161123558100)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BY2PR0201MB1928; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BY2PR0201MB1928; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1928;
	4:zJyjbRYfuI8MY4inWRJhvxCeM8lCaF56D7pHzzLycmTjxT+pixDtP+nCa5F/GC8SKhbRvP8IOzzGYrmTqe4efPlq8ggahNfKvOlnNrR820pJe0KNGbt3iOqnsdiDOrKO12a0m5pG7xrpH6iAkqLWJV3LubR3YcuSaChTilLMR9CISSx3ksgqLnB1JKwKzvG7priTi1SclxD2I32dOB/ANBFPWKWbxrycMKJpRLIUTBxlJXRZplulU7ptoQy/5Cyaex+KmNbAiGTdcNezDmktI9RnMxF4o0aKCFgHXQvX4FWc5YsMCqCPtdWQphxoFYmyJl41naGB50qKFSnFyna2JA==
X-Forefront-PRVS: 04362AC73B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR0201MB1928;
	23:BhHkqUYmt98foBhK9Mvo9mEjxuxfFbyB5CigiLX?=
	=?us-ascii?Q?uyYKrt0cZ7xM9UdiUbyAOnG4Bi6zl31t1aro+Vlzc6ON84kebiE2fxxM0RHr?=
	=?us-ascii?Q?jQfb+OljKCQtx5Caq+C51+JGQnIWfIGJJbROxW3Vf9tdZnKUSQOds5osbPy7?=
	=?us-ascii?Q?wtkrXVlQOh6ubmKOm6uMn2bYKVVN19pl5ZdJUZrroozfdCpoLeMWeGGXQps5?=
	=?us-ascii?Q?KaYzeX6UBsKDzmk1JKo7VZpG6FfIwkqwe8tOO8BxFfsA8KDjOCQZpljEW5TN?=
	=?us-ascii?Q?o4bIQBGgJPUrGMv81m6ibsxyOVGc5vcePan8ssTnk8xEMheeiwJ3l9czB0F9?=
	=?us-ascii?Q?n+GiY5tMsS++Ggtbaqfcb3eUZDuub9MMDdwC9FJo4wZ6h0zd0VjMdWlTkso4?=
	=?us-ascii?Q?bH7x87NIHYBo0CDWulqaX2yEOnltI9VHxzcaQZIpXJI11LBufmkm88lm5F7t?=
	=?us-ascii?Q?ZWqbhOHWuZ5ptZbn8hv9+MDCOsuI9rjDRmA37l8SBCSYEwIqX6a/VI6Ni0OK?=
	=?us-ascii?Q?Nse8auZ4W1eaZ7hmAbyZr0O3wpyLdISxmQaIYD0SpoyAR+vgzBuaOnPRLH1e?=
	=?us-ascii?Q?NV11E/Ec8VnCAvOEwWpaYzoFOQGyEtHopkTy/yYPfQT8yM1Ol4JsR8YV21gW?=
	=?us-ascii?Q?8h/drRKrp+UtPQcsxndJkpV3vC4uBFEzcdrBc9gDqwCKpPEUB/66tHF6QSZd?=
	=?us-ascii?Q?J+BZxKyZOiC1V2VpcWNtJiA3wFq4br3haglC7/7n4HmkU6Bttb/dI48av+ok?=
	=?us-ascii?Q?YxoWBWnXv5IWxaEAEb7yI5LVt44qqQNOWMFIXIrtS3q+T6GIw66mOzhFCaEh?=
	=?us-ascii?Q?C3EW0M8+3z1W7rrEeAmB0L4gXXvcUxtbPv/f2v7Ck8RL2uIndttT4jicWAYL?=
	=?us-ascii?Q?mpRqG/DYlscDyKf9i+Py7zIJL51iXL5nNlMq0NVUZjRe7lO95GcCYamww8yF?=
	=?us-ascii?Q?5Pzbs6tJTQbffcOYiq8iP8jvG5NfkxzCZB192sRynKblI17duNXsRzr0voCo?=
	=?us-ascii?Q?e9hEZ1i24ToYGVQq3qLDtHktoEEjDzQSysX3YSxA9HE/7Gg+vt0DebPA/2ct?=
	=?us-ascii?Q?JygFDihAoVABKEE1GaMsef4oDpw8XzOze4hjrWk14s8pWw1N3FFYzs2j/e3x?=
	=?us-ascii?Q?mbiCQHZkUsK4=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1928;
	6:F5WRk22KubnChK5/x7qQ4wC3wVOsETTDdIh2ietme48VCBpvUxePwCkVX6lC6kSEHxt/dv80QDLWiWNLvbALUa3QImc3qkpUgOyvnem9V3BI3Z0DlMLOahyhgvMNYyfTwrQHDMfAHXisr7AJrjpiNW9wC5+QTTeXHtd0Q1M2OZacDvxnajBEKG+Yif7iUpuPr0rC+1tljvJtvN7lmLh3O94fiF+Ticd2YaIr/P5+GKQCabJl7tzjDWxpVRklkaOIdl+YEwHvAA/UIgXBJ8UML5pknLjEoW3Uy4tWpTkXKxvMfkBuRdUOMAmYnXslWodF/atHpcUugJXBiyskITjGhA==;
	5:KitEVf3XS4l0g7FJ5UOYjXWt+fJU2wr412PU5MCRmMxuIflY2B/zUXFvjjzkPEEFZfMjS7eAJ3Aq8cICntP6SSRAUAtlgOmn+Cdli/04Ux+jYI6TzzXZIRqInQ7rmYFDadpMLJfX0Al7PQhvRvj2Pg==;
	24:dIRiSuTrohkdUYJpBko/dK+BZWiND2NIPESF7rOO4v4MmqK4pH9ZLC+Q5zvfDnI2LIiXWwGfrXqunS3W8T1EkRRrkZTXIRDpw9gdg06UVSo=;
	7:j+wesUR2ShQLRpLPobOr32AdKZtMqMbnZGJGfOz5ZENXifOfUpfqbDNh70e8hyIqxIUpXiQRMEzRkiLNlkhEs/mEQRk5zqxicInCztji0M0R1RQ61Rs5XxoCq/yRZJYNmo+8IZ1pthdnz6HHvpHaEd3hYAqKVmxyHFpbMg2vjeBXesYip1/06IZxaKOmohTsWEUVAeDf6AcKe6lOZWKE0VF4kxdkuQIqkUdzwFv7y+I=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2017 22:05:39.2022 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0201MB1928
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.53
Subject: [Qemu-arm] [PATCH v3 8/8] xlnx-zynqmp: Connect the IPI device to
 the ZynqMP SoC
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
X-TUID: f2dBrCYsMDya

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 hw/arm/xlnx-zynqmp.c         | 14 ++++++++++++++
 include/hw/arm/xlnx-zynqmp.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 2b27daf51d..8aa1f02c62 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -46,6 +46,9 @@
 #define DPDMA_ADDR          0xfd4c0000
 #define DPDMA_IRQ           116
 
+#define IPI_ADDR            0xFF300000
+#define IPI_IRQ             64
+
 static const uint64_t gem_addr[XLNX_ZYNQMP_NUM_GEMS] = {
     0xFF0B0000, 0xFF0C0000, 0xFF0D0000, 0xFF0E0000,
 };
@@ -174,6 +177,9 @@ static void xlnx_zynqmp_init(Object *obj)
 
     object_initialize(&s->dpdma, sizeof(s->dpdma), TYPE_XLNX_DPDMA);
     qdev_set_parent_bus(DEVICE(&s->dpdma), sysbus_get_default());
+
+    object_initialize(&s->ipi, sizeof(s->ipi), TYPE_XLNX_ZYNQMP_IPI);
+    qdev_set_parent_bus(DEVICE(&s->ipi), sysbus_get_default());
 }
 
 static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
@@ -422,6 +428,14 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
                              &error_abort);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->dpdma), 0, DPDMA_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->dpdma), 0, gic_spi[DPDMA_IRQ]);
+
+    object_property_set_bool(OBJECT(&s->ipi), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->ipi), 0, IPI_ADDR);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->ipi), 0, gic_spi[IPI_IRQ]);
 }
 
 static Property xlnx_zynqmp_props[] = {
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 6eff81a995..dad2bda7b2 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -28,6 +28,7 @@
 #include "hw/ssi/xilinx_spips.h"
 #include "hw/dma/xlnx_dpdma.h"
 #include "hw/display/xlnx_dp.h"
+#include "hw/intc/xlnx-zynqmp-ipi.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx,zynqmp"
 #define XLNX_ZYNQMP(obj) OBJECT_CHECK(XlnxZynqMPState, (obj), \
@@ -85,6 +86,7 @@ typedef struct XlnxZynqMPState {
     XilinxSPIPS spi[XLNX_ZYNQMP_NUM_SPIS];
     XlnxDPState dp;
     XlnxDPDMAState dpdma;
+    XlnxZynqMPIPI ipi;
 
     char *boot_cpu;
     ARMCPU *boot_cpu_ptr;
-- 
2.11.0

