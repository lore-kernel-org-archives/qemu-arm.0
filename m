Received: by 10.223.172.38 with SMTP id v35csp1195750wrc;
        Wed, 20 Sep 2017 15:05:53 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCOHt8DiSB686TUWbtGXN9BhO9duM3ARcTfri34aO5rKLGHmj0OEdyx3M4t21jo3c8mMb4e
X-Received: by 10.80.142.179 with SMTP id w48mr133138edw.215.1505945153052;
        Wed, 20 Sep 2017 15:05:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505945153; cv=none;
        d=google.com; s=arc-20160816;
        b=o/0iwxJSRIwHRsZgrYPBnxDkLo1rL/frWnp39608Aooz9jo2SJLq5HEKp/Nd7zCezd
         +NTl8Qm+cisMQonKGmLXF9XlQTerKVLh6bIFq9F+DgSiMlRmbaCpnsqzm0p/XTq6ORA1
         zBMVGIgmrhLKLpUZ6frxtAtNQ6txjk22Rd7BugGVnDT4nTw43CU9cnrD6PyTrgDu8LFL
         PGFT0eR3kjvUy8neU2BVDQ0i33t6Bt52YC4aQJ93LQbgTxBSCccuj+EnNf2U/CdEhG4S
         /wsLlk0ER6a/oL0f/zLwDz5BziHo8yq31U7VOaJQn/ZIAKeETCOy4GWPqvszm1fhkzos
         BtQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=ZfXuBbWSckWLjFZRIvCdK3Me6iosARxqu4q7MGMDWtE=;
        b=PihKZdvOg4hXdJkCFNHhs43yF54Ef+lQ8LaFubVvRs5y0X9AxLqDv29AFHqLm8aLF2
         0m1xPn91fxU6t0I8gjYDLnfeSiKBc2oiyUW06Oyrsgz7ggkp6fDyA3aR91qDd9UnC977
         4G6M/ArEFMWEhjJ+j3PSaVvL7Kci8Q7QjHdrPWe0jM+kQxN34dJxIE1AJAbED7d/K0Ib
         pE3jCLMkPmzDjsa/KoRc96hHSj6raTLPtNsHQU8ownPdKJ78WrsVem5uasAI77ei7t2A
         uAREqeGFJCSoM3388tRtjHFREoUY/XkoZKb0zN8m4x/Ai9BLP5kKuk9QhkXUHxJMwWnr
         S/2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=Qs5V2zza;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u10si224896edf.225.2017.09.20.15.05.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 15:05:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=Qs5V2zza;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50848 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dun7v-0000wx-Qt
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 18:05:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47759)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dun7g-0000uT-0t
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 18:05:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dun7c-0008Dl-15
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 18:05:36 -0400
Received: from mail-sn1nam01on0083.outbound.protection.outlook.com
	([104.47.32.83]:25952
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dun7b-000891-Oj; Wed, 20 Sep 2017 18:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ZfXuBbWSckWLjFZRIvCdK3Me6iosARxqu4q7MGMDWtE=;
	b=Qs5V2zzahX9WVLVodM3m1UCe9BSY68MOt4ukIom53E6YUK/f1mbz4vYRhKUkTYK2bnU82lnAPZLmMbFymAus0JIadbaAYpT7hBivBhxKypRThLBcwmpPS/DDr7Vqk4ZqqKxgeOtvO9Oe/uqYSpYXMKxbihfyYrSSzYNaUtn6lRA=
Received: from CY4PR02CA0012.namprd02.prod.outlook.com (10.169.188.22) by
	CY1PR02MB1135.namprd02.prod.outlook.com (10.163.15.149) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.56.11; Wed, 20 Sep 2017 22:05:29 +0000
Received: from BL2NAM02FT042.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::209) by CY4PR02CA0012.outlook.office365.com
	(2603:10b6:903:18::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.56.9 via
	Frontend Transport; Wed, 20 Sep 2017 22:05:29 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT042.mail.protection.outlook.com (10.152.76.193) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.35.14
	via Frontend Transport; Wed, 20 Sep 2017 22:05:28 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:56148
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dun7X-0005iU-Ut; Wed, 20 Sep 2017 15:05:27 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dun7X-0002LI-QN; Wed, 20 Sep 2017 15:05:27 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v8KM5G5V025692; Wed, 20 Sep 2017 15:05:16 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dun7M-0002I7-Bt; Wed, 20 Sep 2017 15:05:16 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Wed, 20 Sep 2017 15:01:37 -0700
Message-ID: <ab4b24b35e4b73354fbe79788217d5dc947d7002.1505929556.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(6009001)(346002)(376002)(39860400002)(2980300002)(438002)(199003)(189002)(50986999)(48376002)(63266004)(76176999)(47776003)(50466002)(50226002)(118296001)(230783001)(106466001)(316002)(36386004)(2201001)(33646002)(36756003)(9786002)(2906002)(77096006)(478600001)(4326008)(6666003)(2950100002)(39060400002)(5003940100001)(189998001)(356003)(16586007)(110136005)(305945005)(81166006)(81156014)(8936002)(54906003)(5660300001)(8676002)(107986001)(2101003)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1135; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT042;
	1:SOqidzD/OgVwcYccyPM9FWNe6Us5JI1xFfEpKTdwVJBy2ZCGQfux250/+m9460Hqz/qzKRw59GXkP1wRmJ+bEs2HIx4Y65luqIjabte+sYAHGeodip61oKszBLOf6vGM
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43a99376-c8c6-4f4f-1a02-08d50073b482
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CY1PR02MB1135; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1135;
	3:s89d/bO2g8I4srx8ImM7xmr7Ea77DlTuJlGf4Wci3pqOkFhZ4mVv86r3fshJHoS0yLJc7gHta4dmi1NLH++cozOdElPAUX/r43unfMCbGW7tafV+q+V7H6y3K3hATicHvwEhYLfqrFlUnmgDj963mr2NAqbDfr351Dc9k6tIDIlbb61WxdAEaQdJ28J/vz2sC98lfz5lfGnXjSibVi/UA0PqS4KqmEauEsAy/r/NEu7hLVGC7EBx5GUcTbfkWYb3l5G2fmvHMQA355K4EL6vhb+H6IU+csuQTVj1AOIWEjQnB3l4eN8tqtCHOc+cY4bRQoMt/Ex67eNzdAwmX8+EwMznGoCbZIwXpB5IOAxtRvE=;
	25:XMw+hf0JQEYJsiylsbYkUdnpginMjU27BfQ9TJCM14Cdg+HaQJNG5kigZcdG1vCKLdicXEl0XKpxSLHWx7LtEcCjIAWzDN6Yu9hv95pBW6+ZJK3j9XKfcp2MLv5NAMuZKv81ji6GTH8nNAxxnsFN6L1yNXsA1Mk4j2bOoXBXCZIx+DSabuJ9FZCzluW/UZBWh33fOkAiY/QaW6s0ENu8T2L5Ehw6c6CuGAvEHM15Wg3+Lxw9WMcNyPFJeEiGbyaaoma7QYpgLcUeW096icWhM8f/iI59gV7eqJUb7D9JAMTsRwgYC6hgFZjKl1B3InOpfHbcwwr88qTNavI+xh0ATA==
X-MS-TrafficTypeDiagnostic: CY1PR02MB1135:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1135;
	31:5/e1+xBrXQMuEiyN6ZNLm0r1eOVrIW3hW9drMEUVbjI5AmkudAn44hingmaeU+FNgr7YrxCxdbjXiM6HUgHM6ibp589cLv6oSid9YdClvKvExhMsXk3uncDyvtKgQdeqECHUTiAolEX0FjAvD3RiahojJAhaAKyeVkgLO2R8mEeCjblPPfPpjKZoVpC/6wwIbx7ubtZ/jDDWvCK1qu4bXMlItko41WzqPGmMrOSbb6M=;
	20:osMxOk3jlqHIoliXZQyBXJMoalxDAdrVP4aRjHQ7v5+BWbcB/fjFb+1UX3HL9Tfm78/A16mg3XpgVeUMTzsSiO3HKXwVKa/lz9a7jsTjHtlgypjzpcank7w/Lqzke6BNJaxxdbGSkIUwRvy9nuUAlhFn0jvwUeHSLV+iFJUAwWSQMVeYpmKqxICrOsLLcs3XEjX3lfmGfnPtFGZK/GnA4oJ5yUfxAoslwu1uOfoameg1SurIPvohIE5Y/7AT8fAOlMnZ4NETxC2PYF1/jxIldhzvAXovGgXlcd5iVOCHEVLhKDutzkSwkZ0QOj1kznHcen6iQs/HoU5P+OTWosf1Tql2PBBgBD4i6K7+tRjdBLe6blLsRnkWM25CUDlWPaPrc1XCJKx5OumDRrSnZ2w3Z9Q+UzsZVWMHL78Mj4aE+pgZS3uBm5Bqzj4FIRdusjHuFkvGKawU44M7f8tEXc3EM8ROkprWyVYefyzLicV2zNCmvAbhbs2brbSm1OvD4Arl
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(21532816269658);
X-Microsoft-Antispam-PRVS: <CY1PR02MB1135E99DED7C70A0553A7DD6DC610@CY1PR02MB1135.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93004095)(100000703101)(100105400095)(6055026)(6041248)(20161123564025)(20161123555025)(20161123558100)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY1PR02MB1135; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY1PR02MB1135; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1135;
	4:lL/QhugpLou/SgOueJyqE7EvuyPJFpH+84a/sHexEvfu8/2EQDzDjp0HUkMmZWzFrJ3p3p8NsM0GQkHtNBsX/kWr9vlvM2k2qdJ8GlgCxc5eG6cO/KFj+X7IFdvx5LUeDnzGgxTuW/b5pYk2Fv2ocoUIjnIl6QRvYSg/Hl91jK0BN6CZBqSVW80zuiZorSK7yFJA/xDi5Dek6evNREsM6q4YElYXreXSVmxHIQENlvYvPOqRSvk8soCEyJHvgN4RSK3rTutuGq8ssZrYg8q3vmR9j/X88eN+FF11YzUBmMuJe3hHektqx8xT4PlBeNd6K72cIX5YS6N19nb+5x4gsw==
X-Forefront-PRVS: 04362AC73B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR02MB1135;
	23:DCtZ5Z2kLkj3Y59RljwU8XeR/ANJePMon3jq31n+Y?=
	=?us-ascii?Q?E6+ywupZuwD6rRBR5EeuH94FEEl9+jpU5H0rHT0K/dknEonp/cGcjZ8qkrm7?=
	=?us-ascii?Q?D34Kha/uv0mE6y6qt5PZUWQOpTSNp4ikzvdgnFHf6bw6flb3GGd9hM3cCX7t?=
	=?us-ascii?Q?OkI7+p+nqLoNcXbi7S8xq2wmH1eZuF7qIAUIdZkT6cN5IISAEEuUXwuE9KHc?=
	=?us-ascii?Q?3aseDcIpFzU+5MEKh0js/jtrWZDxAEX3JpknJdgHIwLzD9kCSFIOwnCR23++?=
	=?us-ascii?Q?JeaGH2cT5L9g0SnLoNvdnXASUIjfgQb1G3+ol7qPkv4KPBGwD9fyzkNx4Vwr?=
	=?us-ascii?Q?MteP4gdtXFaPLT7qtTMFOXpIan5YDRhsGbzXg/u2tcmHlZMD18fS1/gDsgYA?=
	=?us-ascii?Q?5RA07+ft6eyuF5glirXHkuRyapDMANchV8T9CeK74RNWgyleEDEOkR2WAjcN?=
	=?us-ascii?Q?VVRllBGzOoKN/RTWNRPjJD7nCD+4xShve4Pza9Ma9/1MHqrp/IpTgiH0/lTN?=
	=?us-ascii?Q?Q+oeuwd2MmY14Vvo2Tf4yiMJbZjPc7MhmhjIQQExHF/aUVIab/KBQuYVvw5u?=
	=?us-ascii?Q?g1QhhaeayIrzPBZK6ZgvH12qk6OuPyo5W/vXFAhMsvrWWo1TYulJ7obN5U8q?=
	=?us-ascii?Q?pp6klk6e8lOYeaaEbEHXjuHiNNz1Kymr0N13bRdyaYCwbupOmZuYB6lUFLMi?=
	=?us-ascii?Q?eP/9yXJ4wVcGybuJoKgQ2PF4Wev9ZYVT7P/Mpn3BMfc7CC4nsTkvp1SpHDpn?=
	=?us-ascii?Q?y7nK07uQ+r6/q7XdlEc7Kl3NOVi8ipn5P1RkVle4nBKCs8kLfjZUzL03lhhZ?=
	=?us-ascii?Q?2zpa4cnIY74CkYxe2kmoCP7OxdOq/AWwIWvtk1ZC3ZsS1k07KqagOQ3okJ7I?=
	=?us-ascii?Q?NN8nhKeNR2ktRx48DnU8Jciu2EEfF5OAZ9zh2a3JhKfRnP6LtBJqelGhXbrS?=
	=?us-ascii?Q?GxK97Y4dEDbS86dwMhTp0jBBgnrHw8+9wn6CGnk+5AwzieA5KoihdSViP0+9?=
	=?us-ascii?Q?TBNwTuYkNAxxQ60raGVRVqqL9iNnleVcRrF6XqPOZSZFZBdPspc9Fdhria/O?=
	=?us-ascii?Q?BjFQS2GFsHXmOIor4l4kwGDUhaT1UBR/Ctm/7/uc6aOS1skvoLrNdalvPCD0?=
	=?us-ascii?Q?hrGUMa8cl4=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1135;
	6:4S3xU8CQXNX6v8Z0f7HGE1UBcst7AR9J3HzI7pPmneZiCg0komE68Uh9wv3118L8BKVQmcPv2vzh6xoivnWKdZGoP/waTc2aaB9QH2RDRc36ncmYDpbaKpEFCLWJwqjzBpUY3Az6738mYdavOjgE3QxjnqiBQitLPV2O8EQhfs9Q8lv2if60Q76DBB/+UBvt/WSOAj+QlZGfC1AAHLEyhy/MrFotG/PYHMP720nRFGnGsWhzsp4zzo7uWKxd0lXpusZixh+yDmq8MXWjedQaIDMgqnIEwUaWqs+uf2/4Q1GPX99opco6TQSIJY5xu5rKo8Elc4n4Lz9tYRt3Bau2UQ==;
	5:xPyTPGPvqzO1Ln1YOZHGXrUP7eFmwgAu1AnFqapi/FKQobx1z2iKsK2K/09olNXKnpx5Ho9V930ZMHWdmreoh0YqM1XZReZoyFHf1CWGQb+J71rAAkJ9AAFWc2vDu9dO5cd4MUP772qTZKg0oJRggg==;
	24:gJV3aiJZkscr2QMRJ3dQU7U+AQtWx4tYr/TK3oU4/nhQdBFVs8nhh2bJgiXlgDiig1je3nuS0G3rnVyC8QyL+PEupKvw2DZWGwDA74i+BNc=;
	7:6aw0lBmkc/rYk4UXetuLryWGyl3ptoXB8epu8D1KVk+1v1dt/2Il4Lw0XhS5Olu+HQZDRq2zX87sD6XuLBDWwafwZ7gPTRVW9wgMK7TJmE2BGPK/5bbM5+IaIPu109K2bPtNJbKtzTlQAEmpv8xxQr1AyknRW6bBYHJVrjx5dDoU+3OKugcTd6AVBOvwYMXyGDJXHkeqe0H/jTPKAHXgVwyIX9ErJUwmwxOJPhvbiEE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2017 22:05:28.8552 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1135
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.83
Subject: [Qemu-arm] [PATCH v3 2/8] xlnx-zynqmp-pmu: Add the CPU and memory
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
X-TUID: kNJ8SxBy4f9y

Connect the MicroBlaze CPU and the ROM and RAM memory regions.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
V2:
 - Fix the pmu-cpu name
 - Use err and errp for CPU realise instead of error_fatal

 hw/microblaze/xlnx-zynqmp-pmu.c | 70 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 68 insertions(+), 2 deletions(-)

diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
index fc3c8b236f..b643125704 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -18,8 +18,11 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
+#include "exec/address-spaces.h"
 #include "hw/boards.h"
+#include "hw/qdev-properties.h"
 #include "cpu.h"
+#include "boot.h"
 
 /* Define the PMU device */
 
@@ -27,21 +30,56 @@
 #define XLNX_ZYNQMP_PMU(obj) OBJECT_CHECK(XlnxZynqMPPMUState, (obj), \
                                           TYPE_XLNX_ZYNQMP_PMU)
 
+#define XLNX_ZYNQMP_PMU_ROM_SIZE    0x8000
+#define XLNX_ZYNQMP_PMU_ROM_ADDR    0xFFD00000
+#define XLNX_ZYNQMP_PMU_RAM_ADDR    0xFFDC0000
+
 typedef struct XlnxZynqMPPMUState {
     /*< private >*/
     DeviceState parent_obj;
 
     /*< public >*/
+    MicroBlazeCPU cpu;
 }  XlnxZynqMPPMUState;
 
 static void xlnx_zynqmp_pmu_init(Object *obj)
 {
+    XlnxZynqMPPMUState *s = XLNX_ZYNQMP_PMU(obj);
 
+    object_initialize(&s->cpu, sizeof(s->cpu),
+                      TYPE_MICROBLAZE_CPU);
+    object_property_add_child(obj, "pmu-cpu", OBJECT(&s->cpu),
+                              &error_abort);
 }
 
 static void xlnx_zynqmp_pmu_realize(DeviceState *dev, Error **errp)
 {
-
+    XlnxZynqMPPMUState *s = XLNX_ZYNQMP_PMU(dev);
+    Error *err = NULL;
+
+    object_property_set_uint(OBJECT(&s->cpu), XLNX_ZYNQMP_PMU_ROM_ADDR,
+                             "base-vectors", &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "use-stack-protection",
+                             &error_abort);
+    object_property_set_uint(OBJECT(&s->cpu), 0, "use-fpu", &error_abort);
+    object_property_set_uint(OBJECT(&s->cpu), 0, "use-hw-mul", &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "use-barrel",
+                             &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "use-msr-instr",
+                             &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "use-pcmp-instr",
+                             &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), false, "use-mmu", &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "endianness",
+                             &error_abort);
+    object_property_set_str(OBJECT(&s->cpu), "8.40.b", "version",
+                            &error_abort);
+    object_property_set_uint(OBJECT(&s->cpu), 0, "pvr", &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
 }
 
 static void xlnx_zynqmp_pmu_class_init(ObjectClass *oc, void *data)
@@ -70,7 +108,35 @@ type_init(xlnx_zynqmp_pmu_register_types)
 
 static void xlnx_zcu102_pmu_init(MachineState *machine)
 {
-
+    XlnxZynqMPPMUState *pmu = g_new0(XlnxZynqMPPMUState, 1);
+    MemoryRegion *address_space_mem = get_system_memory();
+    MemoryRegion *pmu_rom = g_new(MemoryRegion, 1);
+    MemoryRegion *pmu_ram = g_new(MemoryRegion, 1);
+
+    /* Create the ROM */
+    memory_region_init_rom(pmu_rom, NULL, "xlnx-zcu102-pmu.rom",
+                           XLNX_ZYNQMP_PMU_ROM_SIZE, &error_fatal);
+    memory_region_add_subregion(address_space_mem, XLNX_ZYNQMP_PMU_ROM_ADDR,
+                                pmu_rom);
+
+    /* Create the RAM */
+    memory_region_init_ram(pmu_ram, NULL, "xlnx-zcu102-pmu.ram",
+                           machine->ram_size, &error_fatal);
+    memory_region_add_subregion(address_space_mem, XLNX_ZYNQMP_PMU_RAM_ADDR,
+                                pmu_ram);
+
+    /* Create the PMU device */
+    object_initialize(pmu, sizeof(XlnxZynqMPPMUState), TYPE_XLNX_ZYNQMP_PMU);
+    object_property_add_child(OBJECT(machine), "pmu", OBJECT(pmu),
+                              &error_abort);
+    object_property_set_bool(OBJECT(pmu), true, "realized", &error_fatal);
+
+    /* Load the kernel */
+    microblaze_load_kernel(&pmu->cpu, XLNX_ZYNQMP_PMU_RAM_ADDR,
+                           machine->ram_size,
+                           machine->kernel_filename,
+                           machine->dtb,
+                           NULL);
 }
 
 static void xlnx_zcu102_pmu_machine_init(MachineClass *mc)
-- 
2.11.0

