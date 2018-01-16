Received: by 10.28.173.206 with SMTP id w197csp4573829wme;
        Tue, 16 Jan 2018 15:30:17 -0800 (PST)
X-Google-Smtp-Source: ACJfBovGXr8n+fxRmqKPtCUEeN9DHCcVm5qe3GltmjPId3t5dCfnX4x2ZGOAxF0z/FNJJirQoUUX
X-Received: by 10.129.200.75 with SMTP id k11mr813757ywl.162.1516145417829;
        Tue, 16 Jan 2018 15:30:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516145417; cv=none;
        d=google.com; s=arc-20160816;
        b=CNiv5tiFPgt85lmQCvAtseEHt1cRB3m9H49kVIE2OP2tqTjAv9RM9S0TJLaXBjOW+u
         JD5bsuobfadc4PwDULNT7NbjVhQ26/NR/3zqOXNbXqRlEG2dCCmz5i71zznlpBbpYM7V
         rVEHQ9NIKwzQ2fuKQ0YDDoRN+IZ1oFQ75PB4jeVKQndERjAKu+4GSKfwzW8KAZPEm33J
         N9ogVxhBCfK7iLLw2wW+NOBTpyLmrFtsc41v1ATyLIW/DL7VshTszqWePRO/sJl6oE/4
         6kjLhxK5CBBL6u5JWdaLg8gJlYGHi7RrFTO1O5H8FfFs7ky+vvw7NUVYqtj1Q/h4/WJX
         joLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:to:from:dkim-signature
         :arc-authentication-results;
        bh=9cXrMvi4sS4uCjm+s1cSNv/rott3VZ9i/aEUl/4hVpI=;
        b=hPQdLNnwnVYPQUVqy4vCWYyp9Te9vpuyEaosuJwRALkgF20pJmeKNEnt9oB09t8PpC
         Y0sxGVAV2xQTIcQkaojwrVVoZTqdTK/HSToZ28fqAW8F702R4xwWcmm/3Ow4yscDgKuK
         hRvE/ketobXotkzOp+zO06kWXZfr8ujz0xCGaclmmUN0T02nsLbT7sF6kHxL6TJ/URJC
         K60+a1v79NsHg/z9aqQ04/NAOrC8Cseh7Xx8S2/SxBeGi2k3/szx6lBsgI19A0PhYFJY
         Om/P6FWfCw6OhUfuGJKF3n1dIS/IzAaVlE4V1F2rlCfs7EfJGLLLn5b+MApEoxMAEJUu
         MAnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=cioLs6VG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c190si762635ywb.694.2018.01.16.15.30.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 15:30:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=cioLs6VG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45550 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebagL-0006uJ-69
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 18:30:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1ebadK-0004OL-AB
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 18:27:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1ebadH-00027o-19
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 18:27:10 -0500
Received: from mail-sn1nam02on0057.outbound.protection.outlook.com
	([104.47.36.57]:47952
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1ebadG-00027O-Nh; Tue, 16 Jan 2018 18:27:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=9cXrMvi4sS4uCjm+s1cSNv/rott3VZ9i/aEUl/4hVpI=;
	b=cioLs6VGa08h8I4K2rjGi/CCmM5vdVRbJsb6BhIH1WeKnGgN/B+52npM5c31qwYPYA1jNViT3wid/8lVrKgeSppoUlMWDQXwmqLXXyR+PNIe/QS0jWsg/z0RScih2QoHBJ/LWcXdxScvdvoAFhXhW0k1ahgbvnQml0j24uicPQ0=
Received: from BN6PR02CA0048.namprd02.prod.outlook.com (10.173.146.162) by
	DM5PR02MB3388.namprd02.prod.outlook.com (10.164.153.11) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.407.7; Tue, 16 Jan 2018 23:27:04 +0000
Received: from SN1NAM02FT053.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::200) by BN6PR02CA0048.outlook.office365.com
	(2603:10b6:404:5f::34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.407.7 via
	Frontend Transport; Tue, 16 Jan 2018 23:27:03 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT053.mail.protection.outlook.com (10.152.72.102) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.345.12
	via Frontend Transport; Tue, 16 Jan 2018 23:27:02 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:56015
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebadC-0004O5-Fc; Tue, 16 Jan 2018 15:27:02 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebadC-0003M3-EI; Tue, 16 Jan 2018 15:27:02 -0800
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w0GNQvXI031061; Tue, 16 Jan 2018 15:26:58 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebad7-0003LW-Or; Tue, 16 Jan 2018 15:26:57 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Tue, 16 Jan 2018 15:22:37 -0800
Message-ID: <f77eea6ba39538e051e8a20bd1455e007b46e316.1516144891.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(346002)(396003)(39860400002)(39380400002)(376002)(2980300002)(438002)(189003)(199004)(2201001)(50466002)(118296001)(39060400002)(4326008)(478600001)(356003)(6666003)(8936002)(26005)(230783001)(575784001)(9786002)(48376002)(36386004)(316002)(305945005)(106002)(2906002)(5890100001)(110136005)(54906003)(2950100002)(50226002)(77096006)(59450400001)(106466001)(63266004)(36756003)(76176011)(47776003)(81166006)(8676002)(5660300001)(81156014)(51416003)(7696005)(8746002)(107986001)(2101003)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB3388; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT053;
	1:A7e/NO010bINb12cbhUcjKA62JdsehrLbIrIQMBQ687/zWl53GM+an1/Hey25DX8DQUDG6LX8LuI2ifkIh59EnOmujssSOlBalTvJT5a+49jsQRiYmLd/bH3zmaD4YRD
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7cf0235f-922a-4e95-e572-08d55d38a621
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:DM5PR02MB3388; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3388;
	3:lE9jNOkWSZvj5OE3T8NzZzzX9JG7N0FpuvN9BX6NcEY0s6BSEoMQ02bbT+NEd57dx+l8QACLC/xHUcY+AE2tTlpIqxTva7ElVbDscOvieAwQFsvY/iQpukyGT28jJqV9dR7gL/0C3VvvsJjDDZitxLVLAbvayIShhoxsu6UeDP99965tnlm2C2NnTCtZfkyy9Y/Zu03ypAgl4cT13CbPPoZQwTn8ljDtT4Q17H/aspYLnfFhXsYSwUZrRpWVDo+jPQIEQ6V8wN6ws16BNYhsB46lKHGJGgxCnvikCUnVDb4XCXXrXn3uHkIusNt1pkBcYJ1XY14rByc2KGdbNr2EzlTFNgE90ubindSc1bu+wDk=;
	25:WMu8BHSugoDcCOzJ0Fif+vybE0pU/hHF3/wWRNFgI4r8SXnJ1x0s4AwlLJpQN+H3FdPjPpX4RWQAZp42LgnsRst9qyJl/QLXY9r3UOLcW9RNkXdEztnW1WdMw1cMEB1mVIfW3zEtJ2SXBF5Fc5JEhsw/+Oh//o6Rf6PGXcS1p7WDEb2RJ9mJHN7ZulzljoPj0pNzr/DdAqDsEc/OjNmZGsWGZeXVg7sczXgttb5uvpiGVIhhBlwOIiimey12s1q2xBrykxm1xc1guBHaAn3XdH2L0AGM9mN0KzsQCPDCHMvvulHcmQuySUP92VQZNxIqnGgGtODbhGD5jwbwa+87RA==
X-MS-TrafficTypeDiagnostic: DM5PR02MB3388:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3388;
	31:hpkaXIJ5NW5hcOjJBIcz/zRbeooQ91CLUWNYEkQFekGuPBhG4gFiHSpOq83p0Knv84nkWHd/6/wsaUyOa3PLEo555BMm2wm2gV+9n67jxeesl4ZiLfxSAPNfZC6yhNOz6jcdXoi4Z7ESYvr6n+9T4sWTAwi7E4v+pVfmJ8/g+po2JDYclw1vNb1kRKwMeU1vQVp6V7YY3O5q7pmqsZjO8g23sq7bLaMkrvBIc53QVgU=;
	20:dQLk9gLr7XU970vVTRDHUKaKOKHzPXmHdCzR57kEcBkWNlwwEj0ZQfQjv8mnyaAalvagrio5B+ZOaaT+zxA4WALoKztOmbUsrAokIvtoycqOp457B0GKM5KPcicWK9tx00dGP7F73odE+4COalq4XtgfbKEO3jnMfn93/1AUIZWlhHND1AWflYCPV2/eBAFmQDyH5WFnIGuToQuNXPv/osrJTAijuDesq3qH+FE+Ur1UWVTV9/ptOddorgR/6qC9so/eHPfleSm4d13k+/8a15yvifE5EMrTAN8arNBRKO5Ppl6Dq3b5x0PP4XP5isw5fFlCatGd7uK0dzYMbPWEgrN0rlvLL3iOw1zNVmdnbNZOq8/AMH2M8xjglCgj8BeH+lJhW1w+yH7xwSzjqEEJKR/tjowuWqTpN2UeMjR4V6q3QFUCoP22jk3jzqHIGu/F3aLiN6Qijee0Ibha0R7pMCv5nw1s/HDny+/JNWy8NE+Qodnb01zs+V1jcfwOhvHc
Content-Transfer-Encoding: quoted-printable
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM5PR02MB33882100A5D3DA1865DA0FC0DCEA0@DM5PR02MB3388.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(3231023)(944501161)(10201501046)(93006095)(93004095)(3002001)(6055026)(6041268)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011);
	SRVR:DM5PR02MB3388; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:DM5PR02MB3388; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3388;
	4:aIfxlAR+LBzK9oh+C+24o+fV3Dw1+70rNpc+3apR+58C+T8Hf0SVJFVw34SlqUyqrpqy9+QuR1Vgg1AsWmxdzbCETJpEjf51jqSuUxpCbjHQUglzZhq/zh39UUQl6I6TRclA+S5J/X13PDo7+VClLqSQV3SuEZqU3rXjoCuBvwShQUq01bVNo4pPpTYxZuYK1ihhPQLfGLDt5w1s8iKfzSx++fosO6rJt/4iD2sMX4K4ylQER7EzQcgNGpI5KravyXQC7kXcsvKtPYUOp//X+NyPAXhNfCrtwhr9HgmYyHIYxtzEiRW2mHupYA0UYRy3
X-Forefront-PRVS: 0554B1F54F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR02MB3388;
	23:fna8qSteeSyy4vhwx1yTP3yw7bGKO6IQEdLrw9aA4?=
	=?us-ascii?Q?HcwGW3Vw3uzw01CN2qVPD4y5ryIYbuxkQM9hNOvIryKZAEyaMbvS2CY1cVpW?=
	=?us-ascii?Q?rXhNbGyN4lNnd1Ss7pbtacbD0qvW+mo8fFVz3smNFuRGDrw8TnqC5+sTuuy4?=
	=?us-ascii?Q?zVCz28rV18Ier8cS3GA4drcHoBkHPQfJ+TJJAvga2Y/gVyIdF7ruQ7u25FXv?=
	=?us-ascii?Q?0vF/8KeJscs9QiWDETRi5h/5ahoSVzvOI98qFWvC8YBIqO9ZH90ugMLI9tHG?=
	=?us-ascii?Q?ltrH8cbv0XqVkVgFsUCDKruX4BBnVJCUgBsYPYwA3O/+cnjNrY9Yj8/fWQu4?=
	=?us-ascii?Q?4tsleBMCTOSTt1xMTBMM1sVEg9z1y2t/S3n2P8yneqY7U7hv6q2LsHkJAyA+?=
	=?us-ascii?Q?K6dQbXxy48qVKZ7Nfzqr5lL0Y7vj88bu6Ko+AGv55J6gzAIESmRWSlNrBVvk?=
	=?us-ascii?Q?UUTDQ7VzMbw8wVsu89VpLSWCofuCmFItzuBx2u9uPobKXA1xUMIYYFP+TQFK?=
	=?us-ascii?Q?NoNSdYu3wh5QlSomomOknG5CeLi+y3xTpdIXJ3CMSLWIqlFSCtuZ6TsxySPq?=
	=?us-ascii?Q?4XrfyiQjaSdI3MK40+TKvD8IzQVzKqgmub1+ngpiFZ/65901/X4Jvm5fD0kX?=
	=?us-ascii?Q?i9yAx2VI3odCOBKYNVh7A7tAonlKAaTAw2UGmP59dVSmalli+LuoDjnp0BRE?=
	=?us-ascii?Q?dw96L5hiz6y6LivJsO7MM8O9seNUpOKl52+kb/D60Y4ksICcjZj54PHE4/Vd?=
	=?us-ascii?Q?/PFA+6BRBeKXw1KpSbyXDTXVfdVysADHY7MwsyoEw97iUaICZobC+8qFmTU9?=
	=?us-ascii?Q?Sfms39yfUkya+g82OdsqcBZep+LoAz1SnKdJwTciSPd6UeS89MIMGODWAmYT?=
	=?us-ascii?Q?5IqBaqAQ/Hz83kNXw5uoEunHmbx9BhIx0Im6Qk6shbeGZUHdB/8RDhMg+KjI?=
	=?us-ascii?Q?QtwlPMN38PFH+XcfGNqsCMfEYkpeLmuZ8AqMJAN8uZaLjrNnAWV7Svg1/6se?=
	=?us-ascii?Q?/HF4aqpxK757b17O7/sdF7Undyh/izAPFY+4awcMxbFhstZHWgx3ZlF5m41P?=
	=?us-ascii?Q?QLLTE4EH/M5WgeJNeaU6DBDiyrhdwnukI1pIQHExKyW/7nBclqgvc/kH3h5Z?=
	=?us-ascii?Q?Muy8R95scQZLgLzbN/bT9aZlGfd/WIuIuSO46HxrtyNyodGEjKgNOHkPNKwU?=
	=?us-ascii?Q?V9buB55NREDPEU=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3388;
	6:fvdHK+oWv+F7GkVUhuTBhzAxyU1Q9XigNFtrvuwpMI8/hByIZSqg3ixpCrJXvsK8DMc56J0hAma+38eMAfarpMjcOsOJdaWaLe94hnIeFVbDJhBuLq3ZwZkBN4WAJMs6gBRhvL3AbvkIb5aZ4b1CRmBJbpOb3t8R9MiYcLu/QSP5HdioB612tqI52i4TmlhaoGNxDjWcHahnT/CqAKplR/hI59bixfs5GvCNDfzxLMl9YEE0r44NWymYY96uyY/ltfmFBml4liJ+YgdSWuHhxQH32xJYZiuBmjMKRWI1e3A9p4E9YnmdV30ZrxQtw3px3If+PQ28eNmMk4NnuJB+Vcpr1biKdOil/cQvGKSTK5g=;
	5:bWlfEJ4ilJSDzC9dFqwQaPSdUWUDkhWMgAymR52NSIrHVO7uB3fmR6DjLjaQEbi+kQBSYniOGTcV9J+AD8iHd7e0sBqeZ+/oVu+mbvbfkRntN1cVNEwrNNgt1YNz9lZ5oiMgxn5aXbprYGd3a8eM9ql0iZjPnk6BjKtBChG4Yvk=;
	24:s82ep5yiMcQ4Y6uP6gcdOO7GBlbBre/hz8k7/2L3LIqdYXjzDizz9T/QfBnbSfxkaVPCODSjA7eZB8Hb/wsGcJ++Pt/+CzrEw5f/D6mWOhI=;
	7:m2+rJ91vdzTEIbYVPVZTfGswp2uNsPUU/MVJnuF0BoebGixCHuoFTDYrxCMhCxujCdC2768/mqMaI8zQmL/1VNKbc9FhY8rIFff+7XFqmKdVgsR1vIltVtDuyc+2mlAY5Hoic26xX1xA0I/aXFNWXgbqXMKJWWqhnnfNUhh7aiyLb6yb14SslTn4++LnIEmIu2bWsQy1cWeLOrkK5xHOO+6/7HAr8kFibAsnGtwf1A293G+r1PwxaYKQx2B1zjLs
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2018 23:27:02.6615 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf0235f-922a-4e95-e572-08d55d38a621
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3388
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.57
Subject: [Qemu-arm] [PATCH v5 7/9] xlnx-zynqmp-ipi: Initial version of the
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
X-TUID: FU2zhBL8rYdb

This is the initial version of the Inter Processor Interrupt device.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---

 hw/intc/Makefile.objs             |   1 +
 hw/intc/xlnx-zynqmp-ipi.c         | 377 ++++++++++++++++++++++++++++++++++=
++++
 include/hw/intc/xlnx-zynqmp-ipi.h |  57 ++++++
 3 files changed, 435 insertions(+)
 create mode 100644 hw/intc/xlnx-zynqmp-ipi.c
 create mode 100644 include/hw/intc/xlnx-zynqmp-ipi.h

diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
index 211655023e..571e094a14 100644
--- a/hw/intc/Makefile.objs
+++ b/hw/intc/Makefile.objs
@@ -4,6 +4,7 @@ common-obj-$(CONFIG_PL190) +=3D pl190.o
 common-obj-$(CONFIG_PUV3) +=3D puv3_intc.o
 common-obj-$(CONFIG_XILINX) +=3D xilinx_intc.o
 common-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-pmu-iomod-intc.o
+common-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-zynqmp-ipi.o
 common-obj-$(CONFIG_ETRAXFS) +=3D etraxfs_pic.o
 common-obj-$(CONFIG_IMX) +=3D imx_avic.o
 common-obj-$(CONFIG_LM32) +=3D lm32_pic.o
diff --git a/hw/intc/xlnx-zynqmp-ipi.c b/hw/intc/xlnx-zynqmp-ipi.c
new file mode 100644
index 0000000000..aa50a8ac08
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
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy
+ * of this software and associated documentation files (the "Software"), t=
o deal
+ * in the Software without restriction, including without limitation the r=
ights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included=
 in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN
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
+    if (XLNX_ZYNQMP_IPI_ERR_DEBUG >=3D lvl) {\
+        qemu_log(TYPE_XLNX_ZYNQMP_IPI ": %s:" fmt, __func__, ## args);\
+    } \
+} while (0)
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
+int index_array[NUM_IPIS] =3D {0, 8, 9, 16, 17, 18, 19, 24, 25, 26, 27};
+static const char *index_array_names[NUM_IPIS] =3D {"APU", "RPU_0", "RPU_1=
",
+                                                  "PMU_0", "PMU_1", "PMU_2=
",
+                                                  "PMU_3", "PL_0", "PL_1",
+                                                  "PL_2", "PL_3"};
+
+static void xlnx_zynqmp_ipi_set_trig(XlnxZynqMPIPI *s, uint32_t val)
+{
+    int i, ipi_index, ipi_mask;
+
+    for (i =3D 0; i < NUM_IPIS; i++) {
+        ipi_index =3D index_array[i];
+        ipi_mask =3D (1 << ipi_index);
+        DB_PRINT("Setting %s=3D%d\n", index_array_names[i],
+                 !!(val & ipi_mask));
+        qemu_set_irq(s->irq_trig_out[i], !!(val & ipi_mask));
+    }
+}
+
+static void xlnx_zynqmp_ipi_set_obs(XlnxZynqMPIPI *s, uint32_t val)
+{
+    int i, ipi_index, ipi_mask;
+
+    for (i =3D 0; i < NUM_IPIS; i++) {
+        ipi_index =3D index_array[i];
+        ipi_mask =3D (1 << ipi_index);
+        DB_PRINT("Setting %s=3D%d\n", index_array_names[i],
+                 !!(val & ipi_mask));
+        qemu_set_irq(s->irq_obs_out[i], !!(val & ipi_mask));
+    }
+}
+
+static void xlnx_zynqmp_ipi_update_irq(XlnxZynqMPIPI *s)
+{
+    bool pending =3D s->regs[R_IPI_ISR] & ~s->regs[R_IPI_IMR];
+
+    DB_PRINT("irq=3D%d isr=3D%x mask=3D%x\n",
+             pending, s->regs[R_IPI_ISR], s->regs[R_IPI_IMR]);
+    qemu_set_irq(s->irq, pending);
+}
+
+static uint64_t xlnx_zynqmp_ipi_trig_prew(RegisterInfo *reg, uint64_t val6=
4)
+{
+    XlnxZynqMPIPI *s =3D XLNX_ZYNQMP_IPI(reg->opaque);
+
+    xlnx_zynqmp_ipi_set_trig(s, val64);
+
+    return val64;
+}
+
+static void xlnx_zynqmp_ipi_trig_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPIPI *s =3D XLNX_ZYNQMP_IPI(reg->opaque);
+
+    /* TRIG generates a pulse on the outbound signals. We use the
+     * post-write callback to bring the signal back-down.
+     */
+    s->regs[R_IPI_TRIG] =3D 0;
+
+    xlnx_zynqmp_ipi_set_trig(s, 0);
+}
+
+static uint64_t xlnx_zynqmp_ipi_isr_prew(RegisterInfo *reg, uint64_t val64=
)
+{
+    XlnxZynqMPIPI *s =3D XLNX_ZYNQMP_IPI(reg->opaque);
+
+    xlnx_zynqmp_ipi_set_obs(s, val64);
+
+    return val64;
+}
+
+static void xlnx_zynqmp_ipi_isr_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPIPI *s =3D XLNX_ZYNQMP_IPI(reg->opaque);
+
+    xlnx_zynqmp_ipi_update_irq(s);
+}
+
+static uint64_t xlnx_zynqmp_ipi_ier_prew(RegisterInfo *reg, uint64_t val64=
)
+{
+    XlnxZynqMPIPI *s =3D XLNX_ZYNQMP_IPI(reg->opaque);
+    uint32_t val =3D val64;
+
+    s->regs[R_IPI_IMR] &=3D ~val;
+    xlnx_zynqmp_ipi_update_irq(s);
+    return 0;
+}
+
+static uint64_t xlnx_zynqmp_ipi_idr_prew(RegisterInfo *reg, uint64_t val64=
)
+{
+    XlnxZynqMPIPI *s =3D XLNX_ZYNQMP_IPI(reg->opaque);
+    uint32_t val =3D val64;
+
+    s->regs[R_IPI_IMR] |=3D val;
+    xlnx_zynqmp_ipi_update_irq(s);
+    return 0;
+}
+
+static const RegisterAccessInfo xlnx_zynqmp_ipi_regs_info[] =3D {
+    {   .name =3D "IPI_TRIG",  .addr =3D A_IPI_TRIG,
+        .rsvd =3D 0xf0f0fcfe,
+        .ro =3D 0xf0f0fcfe,
+        .pre_write =3D xlnx_zynqmp_ipi_trig_prew,
+        .post_write =3D xlnx_zynqmp_ipi_trig_postw,
+    },{ .name =3D "IPI_OBS",  .addr =3D A_IPI_OBS,
+        .rsvd =3D 0xf0f0fcfe,
+        .ro =3D 0xffffffff,
+    },{ .name =3D "IPI_ISR",  .addr =3D A_IPI_ISR,
+        .rsvd =3D 0xf0f0fcfe,
+        .ro =3D 0xf0f0fcfe,
+        .w1c =3D 0xf0f0301,
+        .pre_write =3D xlnx_zynqmp_ipi_isr_prew,
+        .post_write =3D xlnx_zynqmp_ipi_isr_postw,
+    },{ .name =3D "IPI_IMR",  .addr =3D A_IPI_IMR,
+        .reset =3D 0xf0f0301,
+        .rsvd =3D 0xf0f0fcfe,
+        .ro =3D 0xffffffff,
+    },{ .name =3D "IPI_IER",  .addr =3D A_IPI_IER,
+        .rsvd =3D 0xf0f0fcfe,
+        .ro =3D 0xf0f0fcfe,
+        .pre_write =3D xlnx_zynqmp_ipi_ier_prew,
+    },{ .name =3D "IPI_IDR",  .addr =3D A_IPI_IDR,
+        .rsvd =3D 0xf0f0fcfe,
+        .ro =3D 0xf0f0fcfe,
+        .pre_write =3D xlnx_zynqmp_ipi_idr_prew,
+    }
+};
+
+static void xlnx_zynqmp_ipi_reset(DeviceState *dev)
+{
+    XlnxZynqMPIPI *s =3D XLNX_ZYNQMP_IPI(dev);
+    int i;
+
+    for (i =3D 0; i < ARRAY_SIZE(s->regs_info); ++i) {
+        register_reset(&s->regs_info[i]);
+    }
+
+    xlnx_zynqmp_ipi_update_irq(s);
+}
+
+static void xlnx_zynqmp_ipi_handler(void *opaque, int n, int level)
+{
+    XlnxZynqMPIPI *s =3D XLNX_ZYNQMP_IPI(opaque);
+    uint32_t val =3D (!!level) << n;
+
+    DB_PRINT("IPI input irq[%d]=3D%d\n", n, level);
+
+    s->regs[R_IPI_ISR] |=3D val;
+    xlnx_zynqmp_ipi_set_obs(s, s->regs[R_IPI_ISR]);
+    xlnx_zynqmp_ipi_update_irq(s);
+}
+
+static void xlnx_zynqmp_obs_handler(void *opaque, int n, int level)
+{
+    XlnxZynqMPIPI *s =3D XLNX_ZYNQMP_IPI(opaque);
+
+    DB_PRINT("OBS input irq[%d]=3D%d\n", n, level);
+
+    s->regs[R_IPI_OBS] &=3D ~(1ULL << n);
+    s->regs[R_IPI_OBS] |=3D (level << n);
+}
+
+static const MemoryRegionOps xlnx_zynqmp_ipi_ops =3D {
+    .read =3D register_read_memory,
+    .write =3D register_write_memory,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 4,
+        .max_access_size =3D 4,
+    },
+};
+
+static void xlnx_zynqmp_ipi_realize(DeviceState *dev, Error **errp)
+{
+    qdev_init_gpio_in_named(dev, xlnx_zynqmp_ipi_handler, "IPI_INPUTS", 32=
);
+    qdev_init_gpio_in_named(dev, xlnx_zynqmp_obs_handler, "OBS_INPUTS", 32=
);
+}
+
+static void xlnx_zynqmp_ipi_init(Object *obj)
+{
+    XlnxZynqMPIPI *s =3D XLNX_ZYNQMP_IPI(obj);
+    DeviceState *dev =3D DEVICE(obj);
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
+    RegisterInfoArray *reg_array;
+    char *irq_name;
+    int i;
+
+    memory_region_init(&s->iomem, obj, TYPE_XLNX_ZYNQMP_IPI,
+                       R_XLNX_ZYNQMP_IPI_MAX * 4);
+    reg_array =3D
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
+    for (i =3D 0; i < NUM_IPIS; i++) {
+        qdev_init_gpio_out_named(dev, &s->irq_trig_out[i],
+                                 index_array_names[i], 1);
+
+        irq_name =3D g_strdup_printf("OBS_%s", index_array_names[i]);
+        qdev_init_gpio_out_named(dev, &s->irq_obs_out[i],
+                                 irq_name, 1);
+        g_free(irq_name);
+    }
+}
+
+static const VMStateDescription vmstate_zynqmp_pmu_ipi =3D {
+    .name =3D TYPE_XLNX_ZYNQMP_IPI,
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, XlnxZynqMPIPI, R_XLNX_ZYNQMP_IPI_MAX),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void xlnx_zynqmp_ipi_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->reset =3D xlnx_zynqmp_ipi_reset;
+    dc->realize =3D xlnx_zynqmp_ipi_realize;
+    dc->vmsd =3D &vmstate_zynqmp_pmu_ipi;
+}
+
+static const TypeInfo xlnx_zynqmp_ipi_info =3D {
+    .name          =3D TYPE_XLNX_ZYNQMP_IPI,
+    .parent        =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(XlnxZynqMPIPI),
+    .class_init    =3D xlnx_zynqmp_ipi_class_init,
+    .instance_init =3D xlnx_zynqmp_ipi_init,
+};
+
+static void xlnx_zynqmp_ipi_register_types(void)
+{
+    type_register_static(&xlnx_zynqmp_ipi_info);
+}
+
+type_init(xlnx_zynqmp_ipi_register_types)
diff --git a/include/hw/intc/xlnx-zynqmp-ipi.h b/include/hw/intc/xlnx-zynqm=
p-ipi.h
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
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy
+ * of this software and associated documentation files (the "Software"), t=
o deal
+ * in the Software without restriction, including without limitation the r=
ights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included=
 in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN
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
2.14.1

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
