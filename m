Received: by 10.28.173.206 with SMTP id w197csp4571723wme;
        Tue, 16 Jan 2018 15:27:32 -0800 (PST)
X-Google-Smtp-Source: ACJfBosFNeYj/jXoLnC90uq+NCcwGK1xuzKjevMm2uasy1XDqQziNXoijnmeKXaXmhdctQlULSSI
X-Received: by 10.37.66.17 with SMTP id p17mr35700549yba.76.1516145252893;
        Tue, 16 Jan 2018 15:27:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516145252; cv=none;
        d=google.com; s=arc-20160816;
        b=CYm+c3YSqH0X8lpAuczPmJew7O2sSbE95u1JkyxnIyBMJ2bMLvO+HteCM2kLjWoRF7
         2HIoiPcFL/iKw0AQdet0Z4khpHJiHwTHXhloBQPKwXaZCCKpwpWcPzQZVfhhhzOauXzR
         jW0Tcg2csVDpN6eaZYOVYNWjAs009Hs3ub77MRMYZ4bpV9NsCLEGw+L8bDPYYM7MNXO/
         2+H9Zosm6PuqwgWz1GvepBkvJuPqTK1m2eMLVf5RL/eDjyRuLjlTbKkDXiQefgrLBVyt
         ld29y6RqIe9Bg3tTom/aFujrxyovG4IvPmXDW51RHMZ/hAkwWR4jrqXCslCAhPASByGV
         j17Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:to:from:dkim-signature
         :arc-authentication-results;
        bh=4+13ndKvdm+NMXVUJO1qUJtn9+xN/3sqO/Cdwz9Fp90=;
        b=ocGzwOPehoLRCHMNH+lc0tG7fgsg6Yj5ZmqIhVIa9U3yCd5w2EL/AG/BRzEd6C9b5U
         Nszc0SUCCyoYgS8bZ68m6L1TF4cU/SKntBTBoxcCsZGBx73EJeVGjHS0e/Yt4L2rsNNI
         TIgtgOTBTHL5Oq83zxRyrRSNURJob/nwp/ZD3eCA1EhdL/VdnUq6+O3MRQl/LHYQQoZ8
         Li5orTRA5qGFJIjVvIteMa3ausCbpoNh5BBMNGnkVEOdD1bjTUdubC5Qo2NOMw8X/79f
         nOeLVzE4LfrcQrlz4qGySnQ48VLiINCKY2yyu7IQCYAFuRxKCZEvA2zRKUajYjMMVpHq
         l/fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=lkQ4OFrm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d25si792818yba.142.2018.01.16.15.27.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 15:27:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=lkQ4OFrm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45522 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebadg-0004WL-9L
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 18:27:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1ebadB-0004Fk-9o
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 18:27:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1ebad8-00023G-3q
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 18:27:01 -0500
Received: from mail-by2nam01on0048.outbound.protection.outlook.com
	([104.47.34.48]:31025
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1ebad7-00022e-Qo; Tue, 16 Jan 2018 18:26:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=4+13ndKvdm+NMXVUJO1qUJtn9+xN/3sqO/Cdwz9Fp90=;
	b=lkQ4OFrmHdKBBSo+VJA8hfW1A62heir+GwErBEZNKRlSLdcbBfVJyFdjz6HXcKsZDdnMZ5urYZ4rQ+bMg2UnE+KXXUrHBTa1FdKkH+VURXYa4ElfuAIOpQp0NNuyWWh5uwlP0TtzqAd+NO1N9iGDM3oljIapK+tbmdQ8Qs3Jvfc=
Received: from CY4PR02CA0040.namprd02.prod.outlook.com (10.175.57.154) by
	SN1PR02MB1344.namprd02.prod.outlook.com (10.162.0.15) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.407.7; Tue, 16 Jan 2018 23:26:52 +0000
Received: from SN1NAM02FT027.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::206) by CY4PR02CA0040.outlook.office365.com
	(2603:10b6:903:117::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.407.7 via
	Frontend Transport; Tue, 16 Jan 2018 23:26:52 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT027.mail.protection.outlook.com (10.152.72.99) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.345.12
	via Frontend Transport; Tue, 16 Jan 2018 23:26:52 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:55886
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebad1-0004Nb-O4; Tue, 16 Jan 2018 15:26:51 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebad1-0003Kp-MP; Tue, 16 Jan 2018 15:26:51 -0800
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w0GNQftK030945; Tue, 16 Jan 2018 15:26:41 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebacr-0003K6-48; Tue, 16 Jan 2018 15:26:41 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Tue, 16 Jan 2018 15:22:20 -0800
Message-ID: <d1049a00a3c00d8310584f7732492a2064a982ae.1516144891.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1516144891.git.alistair.francis@xilinx.com>
References: <cover.1516144891.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23598.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(39380400002)(396003)(376002)(346002)(2980300002)(438002)(189003)(199004)(5890100001)(36756003)(54906003)(2906002)(4326008)(8676002)(9786002)(50226002)(8936002)(76176011)(356003)(106002)(39060400002)(81156014)(81166006)(59450400001)(26005)(305945005)(2201001)(110136005)(478600001)(8746002)(63266004)(51416003)(7696005)(50466002)(118296001)(2950100002)(48376002)(316002)(106466001)(47776003)(36386004)(5660300001)(77096006)(6666003)(37363001)(107986001)(2101003)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR02MB1344; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT027;
	1:jJKgOiFBuq6XrR724TIzIMrJibujzXXDS1eRLMFtsikk0315338Fyg6r1e3yUmA1qqhk/JmEge/d/HY/VNIVSCp6W0QgCMymjb0nqHSibx9rYFbbgW5a2LHU8X0mIlig
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36626571-89af-4c5b-be66-08d55d389fe2
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:SN1PR02MB1344; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1344;
	3:zaNOEM4uvna50AujnBgPXbsCdjQ8Y9yX/mqlYoBynPEbtNyFk/ZqxGJEFp5Q4lzakoDNJLXSg87j2eQHaiynMqzGy0sxDviMXfS+5oCkUgbe+amdqaC4NMZOox9rBXxlGKssVcEzWXjOpVI/F3BNGcxA51Rz2YWza5GnlgjwDDOnruQ/vFGBL2q0vPb51UEnNEVrNH+kXF0+1n0FSppfL0QXvwsEGmHdWJefqDmBC3qM5WGN40oVqv0tVLW743pDFE2ndWRNawjNU/T1IW0FN4PwLvq6acZ6YmrCB5MFFzspGv0z9aMaVqWd5KUNaPJHGNfJNG3lR63XCx9ZHHKP9JuGFJbV6rv4rePzJWrEcKQ=;
	25:Ynw0RaaLU5sZmEmocmH6uOPfx+zeSwqPECYpynKAOM00Ept1ptjVwWEbXiDdn2v/bWXWCE1becn67ErZBU3mDKSH3tLaIPp/CX39zvyENKjjllLJLP1cmmwmlackMOLBGrUalw1ojdYzLeu4bOCpW/kFCiyMyPsF6TF8xalW+GtuS/GRi+BGI/lTwUEApwBdXdEF9DzpRWAeh9lKkRm8mOESboawXUKRNJxaEvlT6VU3bXHAElMCTF5IIHilR4TffrCCF+AbdivzG93aeDBdbUFgqYzrM3k3+F9l73HHXHNLTDNCtL7GjZEzD+eE36eGHGY4YZD3YCrchlZd2oFifg==
X-MS-TrafficTypeDiagnostic: SN1PR02MB1344:
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1344;
	31:PTVubWhaWQJAIWjSvNj0JyNaTp4BEWFMVpUGxw2mIGaAdnr8f7rcQLlVMZ3Eo48GRjp9SR8rOAxwieCUyzV5XyIydbc7gwK+ZaMjv6I3tr7mbRUbOCNf6o2/O7BEU2rooWYt4PSz0ErVru3X/kf8ikYXy/6N0tTN91WiuTVpiic2fMFw0R5VRaVuH44NM9a/aleIj40+Som0g39y473wwnt6bTSm6ghENKxn5aDnIeU=;
	20:Bk8bAXWBQ83gxxs/3bNzz/hPJsxKSU4BIDBqfk1sQ+Cw/xJQQtf5BrI4DY0KqREYJRpDibklliRZ0K7WlO60ggwrHSO7ETkkCkKRh6PvjjQf6zhZR8lHdBFki0hxOjGf79c9f+OeoXr+5wVu5jkS8dK75KoZvmmNo+vLbjcZxGKCv8OiB/Y1VvPgYx8lnHz/DOt0hb8TzksH46Q/vB/TsyQGei6CYgIEo3mO8W284w/f31Dchu6UUnPoL+YhoFpwL1lFfgqMVOykkXPIq4HtjCSCPlFamNl1NragcbLZ7FC8kWLHOvq2JBcTqD4qiQ9wnUVawzJoPKDCTsBmzChPEUso9iGX5WI2+FjiytSEWf73nRy4ydG83TAqa6M7ExpemXugdWcZlbNp/gf66B7xCcVlILeEuPT0Ag2bqEiXurwOfeZks2297MOgHFiPlcfJOXzLM0JqeoxReoYyvb6oPiV46DLiWhcpd+0vY/M7CHMy+eCnhvo07uUqb1Tlyc/+
Content-Transfer-Encoding: quoted-printable
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN1PR02MB13445D5F69F748058E43E9D1DCEA0@SN1PR02MB1344.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(10201501046)(3231023)(2400039)(944501161)(3002001)(93006095)(93004095)(6055026)(6041268)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(20161123558120)(20161123560045)(6072148)(201708071742011);
	SRVR:SN1PR02MB1344; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:SN1PR02MB1344; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1344;
	4:EFXARsQDXdtBaIk3RUcySHRQc2SwK4CIBrVr82DNOsXmn/QiChPJLPWMaxVnMCRzuNmilweoAe9Npl8qvshCGctswhGPeAIE7XSf8HM0VS9R8BDwVSbSpoBxchya5EbzltLUTsOQYFfFdxxCKaiqzQLZLFH/JvZb9K6aLhlrKrRfbW2wTgzWhb4ukg2Jl/H6tzJ354i7OS8rXX6vG/7z2q/FBTQiCAT7xDvVYoBYKK14PWdmzOp4wHFmjNebcZkbQtuQ/vASB5TOsMtsl+r6K2X5Va5vIM1TuYyzcyAXWd8xt++J2bnD1UuI0mIONCwD
X-Forefront-PRVS: 0554B1F54F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR02MB1344;
	23:7uHISMZLmaPLxGXFxvccCa/22GvAr3t7fVnybS00B?=
	=?us-ascii?Q?soBlWdD9Xf/Y1dc8f/9mppvJtU7cZYjGMkrHWk78ZALljJ7PieBxopyB3SBw?=
	=?us-ascii?Q?YVXgbHzw0ZzxgcTXNCEYvU9cBmZgFPvCak/fvAzpmtVVQ1Jd1JVey68O59jF?=
	=?us-ascii?Q?IO9S2JT07LSjRZ9NswzK9wz8XaUda8ocL7fPKw7QJZdsBHjT1kVMNUKL5v76?=
	=?us-ascii?Q?mHPB2MHHfE8auRJg2HqtT82Q2BKa1kFwvFn4A9XbNBWBAHq0T3ZQPOhlAumO?=
	=?us-ascii?Q?IbL/A8gdyeCvD/yBQC6PzbWNSsAJiMxfmU4scg4lznL/AKmN9HyA0y40q/Fv?=
	=?us-ascii?Q?3NB6UwU0c0EczG+ikrLzMcIq8EhQXTyjHeB8Mf8iYK6EYc1q9ztPUp3xG3Wn?=
	=?us-ascii?Q?yzuH1dPQSY9om/yQMrf2pZOteuTL1gIHXRIS4HU/mfISP2aTt2TAFayH/mCY?=
	=?us-ascii?Q?d06xDv84aZ5gP9h5aKgoDX12GUmIKznpJse2dt7J0pDu46GSVrzck+nvRDzl?=
	=?us-ascii?Q?W+mGxtfhN6iXfY1c4y9BleHr6T7Inft4taw0dSGVd9fJT7aBeyciwV+6kVIz?=
	=?us-ascii?Q?MaiV3g+NrObxzip0uiaHniSHzn7n+Ln3HmtNVTYU2wQyAwRYvsT2BujCehiH?=
	=?us-ascii?Q?duGY3dacGNHkiVgzXPbac1buuCScTdxzDNjN+wOceddQM1C52pTBlF4Ro/7G?=
	=?us-ascii?Q?SsXKMZ6T1WO1NVGtm6ENxqCs2XKF+z+zy0wXz3PJTvdzXjLFNJLk4FC0WgD5?=
	=?us-ascii?Q?rr5QrKV2LCQRRYvlJqT/q9Qn4GVLTyQRCKAz3uLOqEfsqKM+U8orshCjszkO?=
	=?us-ascii?Q?sEi5Vo3FkGckXc+78TbWKt8+lOV0mN2ZUErv98azceKWpey9HD1ewqqpZu/f?=
	=?us-ascii?Q?dGRy0buWeJjwXldYUMacAS/LCxpqHVEOe2RT9y8FEF8OTRuAQSGHRaU3vIvo?=
	=?us-ascii?Q?aELwz3Ux/IGFNJSpuMOGwzDX+P8XU5kxq+6aiPkpgTADWE/0heje6PHjP/tl?=
	=?us-ascii?Q?hH26Gkku6fyHGKV0Mq1bBHTdN9wiKnqIBxkuYLJS7HH/mGkBlEiPdhO2dfEU?=
	=?us-ascii?Q?qHWJ519IWiz6TKlke/vEOM0Ol0yzPMNDC12+7ztlfc1fpW1nz3mS+FON8KDl?=
	=?us-ascii?Q?RZpjDXB1HfbzR0QscKhYQ3Ilt8/QNPRg314fNS95l5q2Xgqmmprhg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1344;
	6:RhyhxGrWBipYPtAL+4chCi9UeNWkmNq7IexfZYnguPRA9pzuSwWylZLwYk+Sh8ZKdkls4dlROoW/6aWHFY7tmQKNoa6Ajq/AjVuE0WmDogZ9V/FYYF773Tl9JMUZPcuFgyzT7DjYjYP4sTHocdHOQikXmf7h6q1g+ZbdSo5gmB2K3iBQxYZHAybresI8M5VhpqtnDpteApw80H6HFpgLiwpvvT12jrUdgFRTBvT5GIzvK8pm5dzOu8rFK4lt8jtOH3q/0t6v8osoNqXkGcD2cWzQADZlftbcDAA7PbGgt3gCkugDt5hcq/JufOxD9WphlGnBvssYcoeSu42F6i4eFS8Y41rlLiExn2lgpXXC9ck=;
	5:F0EpUFPQwv1INsU8tgLyD1d1uPVto9hMv7qfkFDSdaX24p3oZRN1UiasLB2GIr6Zmd30IpUX+S/eQifujWMHWYo8+r9d1o37niXzfxwwr5tE8DY06miqHmzrP8HQ+iIzpgVZ59K/W8FwKUTIGckxSxIj4pCI4fxqVyYjDHXinPg=;
	24:XGWNm1SmlYL6exdoLXTtxbMbIe9zVeYHPL72x7Cdi8L/1KtNJ62V+ePaEkLHzmhznAl7mV1Oz8/iQJd+JgV7mylKrhOGp4VxUjGKXgtvOKM=;
	7:sZgd7OiL5zKRhSJs/mZ8QmZPjdobrM3tIkKs0P5XUfFM3BDGd/xUgAuGufx7SWPtG4EA5EEdZNmSwe0roOOE808Q8eSP0m11ktlKU8MHKEgARZ8RpHz6r0KT3H3+kZkBLgyTloXvySN/hMQOY7K3ghzAQx7jo+2b4c7JrNmTdchWNuhbNuk0MbZsmYbTA/+d50i40TKREakfeJgdmosM0ov8hItfc9R9Kk7lHGSENFRx4y8BLbv0VKd9xBXeo1QH
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2018 23:26:52.2751 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36626571-89af-4c5b-be66-08d55d389fe2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB1344
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.48
Subject: [Qemu-arm] [PATCH v5 1/9] microblaze: boot.c: Don't try to find
 NULL pointer
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
X-TUID: bqNnmh6e99b3

Previously if no device tree was passed to microblaze_load_kernel() then
qemu_find_file() would try to find a NULL pointer. To avoid this put a
check around qemu_find_file().

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
---

 hw/microblaze/boot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
index 457a08a2fe..35bfeda7aa 100644
--- a/hw/microblaze/boot.c
+++ b/hw/microblaze/boot.c
@@ -124,7 +124,7 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr =
ddr_base,
     kernel_cmdline =3D qemu_opt_get(machine_opts, "append");
     dtb_arg =3D qemu_opt_get(machine_opts, "dtb");
     /* default to pcbios dtb as passed by machine_init */
-    if (!dtb_arg) {
+    if (!dtb_arg && dtb_filename) {
         filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, dtb_filename);
     }

--
2.14.1

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
