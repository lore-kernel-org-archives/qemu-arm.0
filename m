Received: by 10.223.188.70 with SMTP id a6csp1506183wrh;
        Fri, 1 Sep 2017 14:11:49 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb7R9g5/x1J1k4Q0rEtPTiQe/Lt7ElZlcM7/KMYuVsVK9hf69ZDqx89DlrQt6BEY6lK9zjMT
X-Received: by 10.200.41.53 with SMTP id y50mr4665996qty.48.1504300309197;
        Fri, 01 Sep 2017 14:11:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504300309; cv=none;
        d=google.com; s=arc-20160816;
        b=0WLQM7gghvIGDTsjbtNTqPjIFOig4Zdt2Y6ChvPI8j1Tj8NSZZZUwJQ533rg0FORon
         L1MXrzwjBQpQtg+3x0e5SHD4zjqQ9bzE/NuW2pNvme4junOdoY2QozP4D1SNxOJkw6BQ
         btQEVrcxPXDudGlnKHwp86Q2z5eeWRrNc5gu8rL4GN4E4D27b6TuZKBzY5HFuZq5BVfr
         u2cNYpGxE2IMK+CaBJ+wGefYsRPMubiQBrpy8x34yIgIk4lTvEweu7FKrhxhqe4kKESh
         lZPWc3VQgSJxEySK15BhmLk5Sda4SShOajh2hQ7uJETNNJ9jShnmg40Ps//EzpKaR+Gk
         9gUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=6s8IlTG7rJAoxlkF/dEU8PPQJ/D0rkbTxO/7xjwCW8Q=;
        b=kUBSuEaC76ROMdwtiwRYA1Gd6Wp6ItAmgeQSDSkwZUMXqU41ZZ3PzgLsdcDRURpY5o
         CY5h7eKmCIC/el5f1eYyF6AP6tDD4i8CmKAoZJjcjpLiTUgnQbKPJzQSgBzG4w5BkjSz
         SL6EhurTZwPf8JQJqj8SWRwLbnRCdNrnrxRpWPfkaZirXQAsZOr/HE/pNOuA+f0kBIwO
         Wp80PqZrHKLgSZrbEwJxGHox2WGS8aIxTtDwPY6+ZPkpuw8jbIWwqUMhVvg+L4h4kz09
         BUwXnUksAxXtawix+XybyT2FET2p9YbEYzs9g9RBkAw3HQ1QweJl/dFx8ujT8f0jXoum
         tFBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=sSwhiMRB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l65si11264906qki.241.2017.09.01.14.11.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Sep 2017 14:11:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=sSwhiMRB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60856 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dntEA-0006gJ-KV
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 17:11:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dnt7E-0000St-3m
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 17:04:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dnt79-0006oz-JZ
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 17:04:36 -0400
Received: from mail-sn1nam02on0081.outbound.protection.outlook.com
	([104.47.36.81]:39053
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dnt79-0006nz-AJ; Fri, 01 Sep 2017 17:04:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=6s8IlTG7rJAoxlkF/dEU8PPQJ/D0rkbTxO/7xjwCW8Q=;
	b=sSwhiMRBtmOTeiiDZDPp9Hp/ek6eusZNdvjQuXpb7/z7hU7CcpbNkosfDr/9a5sHe2kBNgVIeG1LY9EUyOz21ejP/myCwyM3LI1aG+EdZ6F9tKC0jPpCEIQjfQ3bk2Rh0hXdP7XX50z/yFP68e3j0XU96K7+2d0nxBGymcCgO2Y=
Received: from BLUPR0201CA0020.namprd02.prod.outlook.com (10.163.116.30) by
	CY1PR0201MB1930.namprd02.prod.outlook.com (10.163.56.28) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.13.10; Fri, 1 Sep 2017 21:04:28 +0000
Received: from SN1NAM02FT060.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::200) by BLUPR0201CA0020.outlook.office365.com
	(2a01:111:e400:52e7::30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.13.10 via
	Frontend Transport; Fri, 1 Sep 2017 21:04:28 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT060.mail.protection.outlook.com (10.152.72.192) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1385.11
	via Frontend Transport; Fri, 1 Sep 2017 21:04:27 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:38307
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnt74-0002QH-Qs; Fri, 01 Sep 2017 14:04:26 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnt74-0007gz-MY; Fri, 01 Sep 2017 14:04:26 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v81L4Ipr027555; Fri, 1 Sep 2017 14:04:18 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnt6w-0007fj-BO; Fri, 01 Sep 2017 14:04:18 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Fri, 1 Sep 2017 14:00:42 -0700
Message-ID: <e6193a53cd039029628c0e69bf267e0fe031b2eb.1504293917.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1504293917.git.alistair.francis@xilinx.com>
References: <cover.1504293917.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23296.003
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(189002)(199003)(50986999)(76176999)(118296001)(6666003)(2950100002)(63266004)(5003940100001)(33646002)(77096006)(106466001)(54906002)(189998001)(626005)(478600001)(36386004)(9786002)(230783001)(5660300001)(356003)(305945005)(81166006)(8936002)(81156014)(8676002)(2201001)(50226002)(50466002)(4326008)(48376002)(47776003)(36756003)(39060400002)(575784001)(2906002)(107986001)(2101003)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0201MB1930;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT060;
	1:Z8hA5WCVrmLG+Ki6l9ix8nyebIZoWmI1fnqm6NJFJhTCHpLd3VEzHUvR9lYdpNYrpWqGAFOD8PmAJykdiWAa4WykzgQ7nDoqVPe5x2XoraV08r0BdV4SU1WZKVF9MXMx
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 976f1976-ad2f-4a07-ed83-08d4f17d0832
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CY1PR0201MB1930; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1930;
	3:b451EjS5aPyfE6NZ3Dwb9c3f5rDAQX3eIDR7nFDPGVfw4gdHV3hS1NaXVylfKNAK1ia70XTVkyeudu3tb8IfifSmU9hUp1Lnio3slxedD1rmwpWyCuStwFBUti2a3MxZTrO5a5Tg3NtHMexFRl9YS1ItFIapeWDicl7P5/K+x8pcF5Mww6FRAM7uuNkI0nQRmEPXKFULdqmmPDyOmRGviriusGlcEGVBGLmEZRww2MPsydj0So+XCzPdga7hYtweHvxjKoPQNuQKuIqHqhqWlo8MADMQqkvrwGOmIyT0445cCb+CdokY0tuMlHCH3lvVoMpKT5forl0NEhihG3ocH5nTJMTXXN0j/7yGpjuQIlE=;
	25:0KHGhBAHQFt6phm79jinnD/HxAFdhulP7m4z/pBgoupsbnZ51domO3BYRmcO0xAadbikpftpCMGD++xQurq/LMoMRu6JIXGggXBCUxTzQAOlRTXWmzIKgadm9zKkMiLzWdIfumF/RMjifffz6F3YYPJf36qeruvP2oP7ZlOtLzIoxRcn4zeijPHeaiKqJydZz6MjEzn4k1ydZMuNcEFM4z6yDK+5tA5Q01e3L9fTG9QuX4tEiykSb4MF972LtaEwJ1CpLNFXQJwZbnCWrOn15mpVH/XKh3wLkboPB8e/ij5JSv1/B2bGQaQXUKQ95+pIe79m7a/IQdKkjDIgg+CrHQ==
X-MS-TrafficTypeDiagnostic: CY1PR0201MB1930:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1930;
	31:C8DZi8N7WXD6YoieiUFGz2OG0lq7YZLpoF50IhJYWjr5P+VNr1togmTYrdhHZC1dPZ99F9lyCbR7SCTObfhSFkfDQF44dqxqJBD0vyqf40fsNkcL50SlfMtCIxZTY3vmOy0KUsBm5xSKINtjjKQlsV8hsIN6oHSUBEFPv+cFW4GHs2rs2k93xppcQWxu9HrLbmSkukTjIFASoTwF9yy34PCHzVyxaa2EUZVKMwZ+DyQ=;
	20:oJSIIcCucpPNQ15B/Zi1GTDViuE2YYrJAx/MOg6tmIZYZJBertBBlmROaYaG6iZcVXXqjvF3HtwoXveTGks+6EUOESCsg928sWbVqbj/WxjQDnLTqD1198lJndh9/5v1ekPXX8JaFaGVaOes9GB+l21E6btTcHLHgNIux0q8qQlP6JrxHxrY8rJriFONvux3ak0FPwCvPsqmk5anjZlpLbYQw8UrF3OfjDRz/kvtGH/M9UIUfRjkJvKY9Y8EksFmtfavxVq0s0pFyiFqMTTknjseEXDp25+AZPolUrNmLbK5bvtQTgq+sFBJXmUGwWysE31WvAW1rduYk33J/TRFGXZj32hZWCFa2YiRn4Y8DVgvYiGuOXLbSq/lGfieIjdoluIcbjohMPBCyVChXepte9syC1vSlhsxUco8uXF5WwXZ4LGw66dgV54QN1CwVnCE5Picu9oDM6gSN0vm1pzXK8oF3TOqn6yUTjdVf5/tDifFJdwU3iCf5W3bPuN+6yv0
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <CY1PR0201MB19309279A0ED241D1A23A207DC920@CY1PR0201MB1930.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(13018025)(13016025)(100000703101)(100105400095)(10201501046)(93006095)(93004095)(3002001)(6055026)(6041248)(20161123555025)(20161123564025)(20161123558100)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY1PR0201MB1930; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY1PR0201MB1930; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1930;
	4:tOXbp7NzD+OlNrQwK8k7mRZJ9RllOIk1gXcjx9uttYbT+UmdwtSRsa7UXMVa5x5sM3CRo3RtsppB4XhY3rnHGTqffyeyZV71jzlFi2ARJwTtPDCVyDAcAyxuO3JCoNewO18ecTI+xVjSqSvshnQawzrwQyzIMI5mZwPduqsPFQNrN2ucy4Qkgjy56KW1EflVOhYhZvYtyXBAq/m109u4zio9mRBvv7og6sY89LWnJbqW+KA87/zoS9EixtNn2T7bzkBBXdOtXyvjWHT2F/XNLE6evEcvjKLrLB6OfHnl64A=
X-Forefront-PRVS: 0417A3FFD2
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0201MB1930;
	23:8CqCx14qZjyFgQFm7g7Y5lE0/w2nA5ki8mFNYoc?=
	=?us-ascii?Q?F6f/EsJV66chfRVypYDdVHiAoTB5HOX17dAPQORs8OgNbFKa5OB9me9rgdDG?=
	=?us-ascii?Q?iZeRTexvsvJJFyEDP5ZHodhVyZGa2K+Dj1egOzqiXT0unwpBXrof4o+Bs2UG?=
	=?us-ascii?Q?4/xL1d8TbeRe7qa4L98guYyeEXTTujc2gwVDFP5SOiHKzQZQeUpnXJeHvuIm?=
	=?us-ascii?Q?jQgW2DAzI1qnCw0DoA3ry+ybzqG4SwFqcSTUuJZZWjFdyvv6I4j+m5pexDRf?=
	=?us-ascii?Q?OcHDeQilSdL6cDohffaLNHYj8zaAOvCJyKNMTUu/A1tk+7WaBt/ZHmt9QOSB?=
	=?us-ascii?Q?L3xMlKGLbmW3XPJwKUHTkSzqhgeNffvN1rjx6N18Mpn8330RxZQkr4RNpiBD?=
	=?us-ascii?Q?b/Ov2c1MjnAp2ZbnQ1iEExUt+qZ+IrlGxdgaGq6Wp3KXlQfmdV3wu6OBpHso?=
	=?us-ascii?Q?hM9mjAZu0TPFIWzEA2LuppHmFs9quRhZHyXXAkNPYknQgJzSz8PMncaoDNrr?=
	=?us-ascii?Q?9RyV0LRtuKaECwtJJmX2Wix8eVZRu/4YSUdp5v6qPi8jAoisXPC45F0vYaV/?=
	=?us-ascii?Q?xmZZGMb3XoUjrG11PVGu663fHU8VyeyAbQ4VQxHzBYrCK5G1OP68EnQKB1mc?=
	=?us-ascii?Q?kHqqKLHAy2tJylc81sdf71qB2Q4QrOP9F5JxqqNCsOuBfbbuhm771uPSUYDk?=
	=?us-ascii?Q?hH6LeW3u0vEaWf+sIiDId3F+XHfC3icWbE2S0qsl5zA96m5106xva5QYKiLi?=
	=?us-ascii?Q?jbWuY66F7PJ5EqlcYyLLljroKKwvhw0cllJy68NipSHTOQvTqJwd5ZmDhwI9?=
	=?us-ascii?Q?23y2s/aukFiuyde8n2+BYjELyQzLO1vHZ9858y7G+tMz5wH4DD1oNxOHId/4?=
	=?us-ascii?Q?fL9l+i5ORhR2bk3zQvJSzGFn3M4nTGkzy1TFEYUiW+u7cECpsIGEywc3865P?=
	=?us-ascii?Q?dyRy/nmjDhU90RD2zYA6186fLS63t/riGtCMMIy6B9hVGEyPAGfx5koJ+CsA?=
	=?us-ascii?Q?Ar9rSUs3d8bCkDB2nbVIKWiv5S/Jej/6Vb2nLRKG55A6dz5FFK4heY1V4Zuo?=
	=?us-ascii?Q?4THGnirQ=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1930;
	6:JbDik1vE1Vu6rF7AuOc29zXzdCr4a55Y1oAo2C0qhmP3T5cKd20Y6do+F4jRI2GafG3Uc5Tqyd+uuZ2vpd/zTcdZN6hyAADP+4iTZ9gJMXMRsZNKQhO8oTjPMxQualu/F8ZTRCPJ1ydatBbvLuea5Dx9YGyjM/diDUq888kA8BtXAPVZ+ntp8/cIUNnWwjpxIFpXVDIVVKPPwKXa6c9J/0wEIfnoz7KPQam7TwdkoKByoP3JDF5lY7myw8loMv4d59uFW4t5usGr5u70n7/4q7YFrko47ifCkhwhDuQSwxYxlixglaApAZkmNNH0PhLZV8NNn10/JoBIg37cFbEiyQ==;
	5:pOR2OLk+VPL7Yu8EKcm3OHbLbmSl6589AfB3jL16o3bT63QxLhpF3KJojKkZvqhoJ8F4eCyNU/ANK8sl5TfdaAY3gEnMGnrOprHzyLyUFSeB5FYhcv4EOG8N9aML3uskmjt/nYIEys83t7E4N5nnLg==;
	24:hOvB6rUduVt3YFey1P57x904QtdNkzs8yPKP1LjdiH7YZOyFSbccFUmiuLk1kvxQ6vFRt0fOqwbaG/lyS0UAtfRl5TYFQFKiYT7toUxFfXA=;
	7:DT+EQz/xlgkra5d2+B9KEEzOWxbGD0ik3lHp+zaJFQD2txbtkc5E9GwRtQlsM1cwOjt2EJKHb8hBvjERND0UrT6LyQ/4f4jZFwscS32lGzvLXsOYpAIpjIGvE6T9qkqILFoBSPMC1PYE7Tywc3qNeg4RlNZcyaJyMw8OgPDLTPdx75klnEUUYKoS8UBOexJ9fqO3du44C7Hzg7TRs8eOYEZ0CazM7VflR+0Laq4fcVs=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2017 21:04:27.3718 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0201MB1930
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.81
Subject: [Qemu-arm] [PATCH v2 4/6] xlnx-zynqmp-ipi: Initial version of the
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
X-TUID: pdpR9LAACv76

This is the initial version of the Inter Processor Interrupt device.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 default-configs/microblaze-softmmu.mak |   1 +
 hw/intc/Makefile.objs                  |   1 +
 hw/intc/xlnx-zynqmp-ipi.c              | 377 +++++++++++++++++++++++++++++++++
 include/hw/intc/xlnx-zynqmp-ipi.h      |  57 +++++
 4 files changed, 436 insertions(+)
 create mode 100644 hw/intc/xlnx-zynqmp-ipi.c
 create mode 100644 include/hw/intc/xlnx-zynqmp-ipi.h

diff --git a/default-configs/microblaze-softmmu.mak b/default-configs/microblaze-softmmu.mak
index ce2630818a..7fca8e4c99 100644
--- a/default-configs/microblaze-softmmu.mak
+++ b/default-configs/microblaze-softmmu.mak
@@ -9,3 +9,4 @@ CONFIG_XILINX_SPI=y
 CONFIG_XILINX_ETHLITE=y
 CONFIG_SSI=y
 CONFIG_SSI_M25P80=y
+CONFIG_XLNX_ZYNQMP=y
diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
index 78426a7daf..be3a1873d1 100644
--- a/hw/intc/Makefile.objs
+++ b/hw/intc/Makefile.objs
@@ -3,6 +3,7 @@ common-obj-$(CONFIG_I8259) += i8259_common.o i8259.o
 common-obj-$(CONFIG_PL190) += pl190.o
 common-obj-$(CONFIG_PUV3) += puv3_intc.o
 common-obj-$(CONFIG_XILINX) += xilinx_intc.o
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

