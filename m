Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2102133wro;
        Fri, 2 Nov 2018 06:20:19 -0700 (PDT)
X-Google-Smtp-Source: AJdET5ckmdXpFZBfaRv1beQXx6sGQ23jjNVD1gHGg4ntq9VIG6YJM52AMnnjjrYSBc613UkK0e8A
X-Received: by 2002:a37:5cc6:: with SMTP id q189mr8638381qkb.235.1541164819540;
        Fri, 02 Nov 2018 06:20:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541164819; cv=none;
        d=google.com; s=arc-20160816;
        b=oIdw7fxvQbEZDf6wr+V5n7azUV/6t6sSw4llBUSCgeaEn2OyKEaxwAPk1W24XiFAwy
         TWpKN6SNkq1d5wK1GuyqeFydlcDW8+chW2tV2mSDBLrBsuKB+voASFhKrUtmDdJJdofK
         GRaM7HYhw5EEwNgseMgO0CSNu7L9vVQbEfAriICDU2xqzAiOiPr1vyC/1ekNo3FjXd4X
         PJ/1jG0ZRHJRQVgU+5zq9N4nYOq+cDBd6Du4o7ELq68rSfoR5eexf7Ec3a8Ct6iVr91s
         2k96TxQOSn0QyTQPrmN/vKU2OfHc/HCj1PNeFPKGaEs3EIGURqsRh67/bfzNt7S8xmkF
         432g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=CH1hkj0ugspNCMFXmYPxcvB5bjj11KyObhmJ+oepm6w=;
        b=rr/HGniRaI62zCIqMEaS//0kgzk+/0KS0ecuJqZvCU2pDCcIHEjTIm6HqgmXyN4gzm
         2lb3c813LT6WkBNtI6jRhryFEtsrywxlvQVfrVBNzotgz3K1RyaNlc6KY1xxAM30kcYR
         icHyPbjySBo3fDVCb+nRpMgPFLr/DeiQ8rUJXEaGrbFsciPKIqPCY66npKA2lRtb3+aY
         A2qvXVU+kE300mbRax2qq5waoO69vDzJeuIzaHtHz4Z+asxO4tOt1r/CxbUx8teRM3FV
         DgSl1PFdMUTbZUPlbCQaeJ7KzqwtQ0xoWiIqopz6d56t2r3RW1Cwo3lu1iMjk+0m2fBZ
         LFRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b="xDWU1Y/G";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t66-v6si348458qka.63.2018.11.02.06.20.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 06:20:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b="xDWU1Y/G";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51653 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIZN5-0000QZ-1C
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 09:20:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gIZMl-0000PT-Hb
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 09:20:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gIZMY-0002tS-55
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 09:19:55 -0400
Received: from mail-eopbgr740048.outbound.protection.outlook.com
	([40.107.74.48]:22304
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1gIZMW-0002j4-8G; Fri, 02 Nov 2018 09:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=CH1hkj0ugspNCMFXmYPxcvB5bjj11KyObhmJ+oepm6w=;
	b=xDWU1Y/GFcI5TvEOBx2pT2zo8Ck9+6AxuCBtMpBHu7NYhSz3FKeKYJZ8RrOXZV+Cm/xpdW0k6wkenebAWmRIBOsKzOXED0SbKdSrJV5his48Ex7lIpBqKoV9sXuPn6kCn/BTg2lqBeYaQ0MeKnT1DwL+NzIwOIzlnmaMLmI71O8=
Received: from BN7PR02CA0035.namprd02.prod.outlook.com (2603:10b6:408:20::48)
	by MWHPR0201MB3513.namprd02.prod.outlook.com (2603:10b6:301:77::10)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1294.20;
	Fri, 2 Nov 2018 13:19:32 +0000
Received: from CY1NAM02FT059.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::205) by BN7PR02CA0035.outlook.office365.com
	(2603:10b6:408:20::48) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1294.21 via
	Frontend Transport; Fri, 2 Nov 2018 13:19:31 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
	header.d=none;kernel.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT059.mail.protection.outlook.com (10.152.74.211) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1294.14
	via Frontend Transport; Fri, 2 Nov 2018 13:19:27 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:36544
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gIZMF-0003P8-6v; Fri, 02 Nov 2018 06:19:27 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gIZMA-0007bn-30; Fri, 02 Nov 2018 06:19:22 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wA2DJHBm021849; Fri, 2 Nov 2018 06:19:17 -0700
Received: from [10.71.119.87] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gIZM4-0007bH-5d; Fri, 02 Nov 2018 06:19:17 -0700
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Fri, 2 Nov 2018 14:19:11 +0100
Message-ID: <20181102131913.1535-1-edgar.iglesias@xilinx.com>
X-Mailer: git-send-email 2.17.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(376002)(136003)(39860400002)(396003)(2980300002)(438002)(54534003)(189003)(199004)(2616005)(6306002)(426003)(39060400002)(107886003)(4326008)(50466002)(48376002)(336012)(305945005)(77096007)(126002)(476003)(486006)(47776003)(186003)(478600001)(8936002)(81166006)(8676002)(81156014)(63266004)(2906002)(7696005)(50226002)(26005)(966005)(36386004)(51416003)(5660300001)(1076002)(9786002)(36756003)(356004)(6666004)(316002)(54906003)(110136005)(16586007)(106002)(106466001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0201MB3513;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT059;
	1:FMapat7g2KZzFxSCfnB5Kza74FmVNVQrzc3zIbZHwWjIoTE+VqHvRWx2SDPVZ7UOCzeOBc6FhbrjLjCXSYq/ss8Lo2ku4+vRoaTOXJGAYoRNQO2NboCUxSWFMNxJMuQL
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d0e24b7-b7bb-4cee-3eb2-08d640c5d313
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:MWHPR0201MB3513; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0201MB3513;
	3:OZk9pz062R8SnpJfNtgc8BkJOji3IOqFMQOimVO+JWlZhg/mTR/C04YVYH3qvTyNqyCwlTeeoE9DWCmzM+4gYhSAwh8EEsdCc7ghu9tjR3hb7nDisJ+scuwAU35BoB+Bo5jmobjsnDfjgiBM6PjleFruVucRA5IS7zOW9V9Rz9KIiflRKlQdcAd0E8jNGCG2yqPTMzLVyLSDsyJNvTcheYGB3+bXvI6DB1Pmp3qWRLK/s9am+u1Nq6+o0d+3kxDZQadNsS21/STeJ2/FtGbdlcOCp6DMioYLszMyy5M0kU7ggJGatjvYZrleWtYhLMx1MWD8bemdAyKAau6mX6/Sz51kC6CnZgEIULLT6KFEjbI=;
	25:LUwpqIPKayaZe0K8s/bv+cqbxf9CHs6MsHszSYnxFbgNNgkGdriy2Lqy1aIlpdYXkvs1/5ZikZuF/AMYPqiKbE3FyiPiqd0qJZN4glY5jUrbYu+PzHLwre+BxCv0SNgho5lXH8zwgT5uWk8Fa+xvUwBp8EVppFUcrFNvOZR6kOKXJkbEJVr52ASSV0UZshjj2Unh+ZOzwFv9juVSJ+Mkm9vX3gA7tmgMD3ay5fD+MdAqJ/a5smdN5E/n8wldmnzssk3jAF4FErmM5m0F9D5SyaXGKN/uuJeHrUNk2nGyNVEuQCHRpErNz/wpjXySOA/4rdS+yYTuNhPfX9RBT0/NmQ==
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3513:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0201MB3513;
	31:LGRBDhwqzX2fBD81VNOwUexrMqnNakKSiDaCJfc2kvNCUpZA4MMtYVgcjxX6LRmnrZdk6/bhocraowgJzggoNn62wRBwbTzqWNyKRwNCWRGrh2eZLneJrBnIg5ylWUxT2MJ0Ix5AbR5QDKytafeT80p9Bv0VvJwHF2y3wj8QcEX9D3TBo6cybRBcwMbe3+OphG0Pi4uO0aA4JqZen7Ca0YGRYz5u4QT+SrQTqXzTzYg=;
	20:zG30YpWZ02OTzLC/K6/RPSAuGlbSHK3cSBwtb78dlfQhyNPv8bVQb9zxpjbl5dDl6P0p2YBXo1Pcin49RZH8/16UAv2iMAt7lLYLM8iB58wlVHvHwqMMiaXFIP7rPsu4o8sXKGItu7YGO02BVibkgpasDukLDEiOiJgOY8ELX9MHB6bvJxtg38Rs8ujLngOpmqw6kz31Y8ABbfi9TlXwa+4NdGzrSQBUcPLWuXEcmDGooTU/r8yttRdIxVD8gi7jHZa/qwPnEWHRxblU1+HnKLG2psEiIZMfy6kbHlozswvkBIXKBUHujM1mNdEWO+509mVcQLPcyeXYnY+ExxkpPDLiTpd/8xVN8hJTZzNGdxzFakO8J4GaW7WIjsAWagXWEhbg+pkZ4r1/bPgU9DRIm6barsGPnrKK/vINDqfbjysVRcGH4AmJ3lq5n+ZvUF65jUYkp+Slvd7O8btTaCs69uswrtcW8R1jq4UGvhWCJ3CModtstkuWSXR3hNpmQSjn
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <MWHPR0201MB35139C8AA258128A53AE29D6ABCF0@MWHPR0201MB3513.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(189271028609987)(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231382)(944501410)(52105095)(3002001)(10201501046)(93006095)(93004095)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123564045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR0201MB3513; BCL:0; PCL:0; RULEID:;
	SRVR:MWHPR0201MB3513; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0201MB3513;
	4:pA3mWBqGF3AP9mMgf2WVKUJ40rlTBf4aIVuxL6m1ZFKhsDdbnOQyR6Gk9OYCxzcJ/mFRM7EzDQ+hipjNfMcIpxUl7zP6NgNcYvNbk0P6wKzS8RrOIzXcVSEfDQCXB6nRLOcZASeRhkEYBd6Wm/Fqo6QTyLGGLLH2uKfBfiaHRcAA0v7eFqtZa/+3gwL54z1DZ6+v6LIrPozYo5Ke6fJHIkE+QdLeSdmhiPGG+Qh4PsOwJaY3qan2vQUG/HUpEzRqfzdUzUSv4gYtEIsByZz26zfhUYRT/egJsyWzEX9Q86P+2Yz6EUVStzaRu/uyfqlMisZLCwgTOck3Qni1oDj19KvuGKoh3oJ1XCb+uPN9u48=
X-Forefront-PRVS: 08444C7C87
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR0201MB3513;
	23:OXlcpNMbLLdYYBTDe3Xn7URWE5smf2ICBNFXtg4?=
	=?us-ascii?Q?VPOU6vXw4EJD5yZIEp33DMZPUvpQl57oU8F9Ib2oZFsADEhsORjhFz4Tsgvn?=
	=?us-ascii?Q?SZf41lNL16rGdqp+TbfOj+5jh0uTt2ReAlXcpsJvymQDGodRefRUudaEj7mb?=
	=?us-ascii?Q?BWBYw2FrCTWuYfYb7VVLXW1RT6iTwxD/rzGghHIq4LHyzm+iMfeh4d4iQXJk?=
	=?us-ascii?Q?6kDmRP+5PySvmbytCwp7eaOpR2N75CWBahANBMYd8hwrsgkslQ5c0BU7BkDf?=
	=?us-ascii?Q?ugeWzp9/ex79YVgXLskqhCmlxNq6Avpqpx123rJfnk4i5M0I7sPHTdoF9OKb?=
	=?us-ascii?Q?yxmnxl3AqXceqcNwbbr6q4HHt+vCnsGCcmxkptpnIiLaOnJ0oR3L4Hkwvc3o?=
	=?us-ascii?Q?a+G1fHNQE7MLpJyciESeoWdViFitHkgSJpaS4SuIQpUK57y0G3lchk3Zt0jG?=
	=?us-ascii?Q?gwCiuoiDNSug3h/R4Uy1BEfxhY+fftV/99OyLOpg6vkECfZiGPjZxEV1fe4C?=
	=?us-ascii?Q?/utYRfX0/lRJ7w4smD2yuhE5TwqDOBwUK1g3shwkq25s1na7I2ZJrDV30+ss?=
	=?us-ascii?Q?Qfi2kAjP+gJcu0Tese8dxKZWVsYGvsQLZUsL086w7Hu6C3IH5Z007RTZ5bh0?=
	=?us-ascii?Q?jnVYVETbfmnF8XlHHwH0WxWFwX8wbgtg2d1nE6UQMRUQaXUzKIQvdQogRIv9?=
	=?us-ascii?Q?/5ZTd3oxA3k2GWOTWb6ge+HCYje/NnPWAYj/KJ5I1kmh8EdvYjUYAd5URYhc?=
	=?us-ascii?Q?eiI/4gF6vCJFRhpHiLHj9YUnSUxZo+ELboTkeViZfu5i3PGzEAIWEY+2C7uL?=
	=?us-ascii?Q?g3RZce1pEr6jP7GgtK1rVfbMBQNhGSC/oYMCWRo2x80wIMm58srBQgXLYSLL?=
	=?us-ascii?Q?+VpROQNKXajShHhRlIEbBYxdo0+Nud8sGqYXcyisKhmr9ZMTh8QBDEJOyYG6?=
	=?us-ascii?Q?HC72mICf57sdQZ415TIBOupFutZuKctC1vOXFLFHw+IpDJ4V9qHp0UlPorot?=
	=?us-ascii?Q?WTrYZkR1/DYiJAdVMZRw0INE37xjQRRzOUrRZLO0EeRDlALI5VjTuQXppUIS?=
	=?us-ascii?Q?wwmp4OadWNst/+FkBgGbqy2cJxUy89pmG7OAf1w3j7YQ5kWQ6cbjNrl7zYdY?=
	=?us-ascii?Q?TAlnKP4AqAB7DV6EiDEM25UWQAI8OEbrtFTMtQ3MlZlTTFKDaGoVcjHe+fwM?=
	=?us-ascii?Q?oBKFPEMwUZPU3Wqw=3D?=
X-Microsoft-Antispam-Message-Info: ix45sxlVl8co1MseVLGf8CNuc++a2+IOPldTsbR54kaOb7eOF4orO+SD2iLjQP78hhtmum8BfTdr8JPlE/stlIM0ly7Ml/OLG3bI57giVoLfPSzD3GlvmiipMULfuktVW9ufMaPQ1t/cpopj7vN+z8sihZmXr87CTdVaLUIkpAHmLPxVRz8DjA66QgADtrgADVKl1KjGo/6OgZI5Mifzjk54QvzrMM28Fnpo6HiG1J9V4QeIRdeiI9ANTquPFgD/IOdxIL0I6NsVKOCsaSvgiU+YP9foOgdAIPWnQsbed6AAucCRsoOnSCVGnLlAN4oOCHxpDHHL+/ExOLHtizjPRT8GexuqH2Yg/QZB3RKLNUk=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0201MB3513;
	6:2QhxzxnKivOHGYP4roEon7m7ekoCPS3ZLvPshEawu/RtjZfwWI337iolNihGvemW+PxJgD99jKIiFn3Nv6oTzHchBb6ZBJXIEyjcpjzaSH9L0iyPBRN9vdysYnAgD7wXBteyXAU6+hO8WpKbHi48pjscKrvec79bngW2L6ZcnoJRTVcFH4LDu/KI2OE9Bv9dZJiV7YX8zHgJUiOt9jP2XfZGOOp2xYeL6RlPP/fd4QkdbO8KBwj9ExV66pNTUOb0G1p7sfnPZZYHvCGjUPlt+h3umYZg/moca7rARAuZuHS2NHZ/zxSI7TEuHRBs90dPpX+JMmnTErlRmkwKU/eIz4F7WEEk4NfCSku1Wf3MxwjqXuoZznM8GHnMDfbdEuWVGQPgPjj+idp4uIMvfOyT/qZ0gDTpg0MILDlTHxP/dohTg2iTfk5CWl6co3YL+Ch+Mzd5vlTLdCs29UltQQRjqg==;
	5:xjVGl8z4DqkDPPDa7jDg8tmfieukD4SqBFVuImozEQbUB3OPXltgu6/DsZEJ3rf8REaNh+Z2jF4hHwaoWWumPfQivk0c3wVmnPhXv0Rnxu6pLyErJA1KAzLjieaqqOPCvafjJ8s9alDFT4sMfw2Ct08v/yc5yxCscbQ7agDFSbk=;
	7:lSW9G4Zn/AZKYPOq74PjOs5BrCEWuYnN1Lfe6S7HRNqbWNzKq7s2xhTcxO6Ldu/dmrfgzknTnQyerflIaKem8JYAJpzL2/IooBlgLMcNa9q0r7jPoLIHke9PHAZt1ZCkeS4FvHJXw4wD8MwHJPkpkw==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2018 13:19:27.9272 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d0e24b7-b7bb-4cee-3eb2-08d640c5d313
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3513
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.74.48
Subject: [Qemu-arm] [PATCH v5 0/2] arm: Add first models of Xilinx Versal SoC
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	richard.henderson@linaro.org, frederic.konrad@adacore.com,
	philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Sz707b5rncqh

This patch series adds initial support for Xilinx's Versal SoC.
Xilinx is introducing Versal, an adaptive compute acceleration platform
(ACAP), built on 7nm FinFET process technology. Versal ACAPs combine Scalar
Processing Engines, Adaptable Hardware Engines, and Intelligent Engines with
leading-edge memory and interfacing technologies to deliver powerful
heterogeneous acceleration for any application. The Versal AI Core series has
five devices, offering 128 to 400 AI Engines. The series includes dual-core Arm
Cortex-A72 application processors, dual-core Arm Cortex-R5 real-time
processors, 256KB of on-chip memory with ECC, more than 1,900 DSP engines
optimized for high-precision floating point with low latency.

More info can be found here:
https://www.xilinx.com/news/press/2018/xilinx-unveils-versal-the-first-in-a-new-category-of-platforms-delivering-rapid-innovation-with-software-programmability-and-scalable-ai-inference.html


In QEMU we'd like to have a virtual developer board with the Versal SoC
and a selected set of peripherals under the control of QEMU.
We'd like to gradually extend this board as QEMU gains more support
for Versal hardware components. QEMU will generate a device-tree
describing only the components it supports and includes in the virtual
dev board.

Before adding Versal support, this series starts with a few fixes to the
GEM that I ran into when running recent kernels on the Versal and ZynqMP
models.

I also noticed a problem with HVC insns not being enabled when using
QEMU's PSCI implementation on CPU's with EL2 and EL3 enabled. This causes
problems for Linux/KVM guests, also fixed in this series.

Best regards,
Edgar

ChangeLog:
v4 -> v5:
* Correct setting of boolean full-duplex fdt property

v3 -> v4:
* Improve error handling for CPU and GIC creation
* Remove KVM checks in GIC creation

v2 -> v3:
* Fix DESCONF6 queue mask generation for GEMs with only one queue.

v1 -> v2:
* Spell out OCM as On Chip Memory
* apperture -> aperture
* Remove copy+pasted virt board comment
* Remove VMSD for Versal SoC (with a comment on why it's not needed)
* Embedd AddressSpace dma object in GEM
* Remove debug left-overs in arm-powerctl
* Enable PMU in Cortex-A72
* Rename cortex_a57_a53_cp_reginfo -> cortex_a72_a57_a53_cp_reginfo


Edgar E. Iglesias (2):
  hw/arm: versal: Add a model of Xilinx Versal SoC
  hw/arm: versal: Add a virtual Xilinx Versal board

 default-configs/aarch64-softmmu.mak |   1 +
 hw/arm/Makefile.objs                |   1 +
 hw/arm/xlnx-versal-virt.c           | 494 ++++++++++++++++++++++++++++
 hw/arm/xlnx-versal.c                | 323 ++++++++++++++++++
 include/hw/arm/xlnx-versal.h        | 122 +++++++
 5 files changed, 941 insertions(+)
 create mode 100644 hw/arm/xlnx-versal-virt.c
 create mode 100644 hw/arm/xlnx-versal.c
 create mode 100644 include/hw/arm/xlnx-versal.h

-- 
2.17.1

