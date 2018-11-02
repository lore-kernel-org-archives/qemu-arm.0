Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2103213wro;
        Fri, 2 Nov 2018 06:21:15 -0700 (PDT)
X-Google-Smtp-Source: AJdET5f03uRZX5iY8DvsiCBZlpBUH0tcW+NOD8o4G2tvCuhvCqt0DuAo1UPqOYxgOVeWXFm6XuYR
X-Received: by 2002:a37:498a:: with SMTP id w132mr10807581qka.92.1541164875006;
        Fri, 02 Nov 2018 06:21:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541164875; cv=none;
        d=google.com; s=arc-20160816;
        b=U3qDvod2W0pCO1snRRL/hXdsbn4wIl2xJ5UTgw3veqAJdWDwIiw50bhX8r+PUF89jd
         WxWyer69gfTxkqUH23RB+iuZE2d+JefEfplqkq9IkGqYvLicdNWNs5D558tbqDeIU3GW
         zmoiCqnYScJSPDav0ZC1Y6GROt8QzkDtEytL+z0ClGQubi8P0yJxzquVIxnbFPBzbbuq
         kyaVYNjoTSau9kZ1wKqpwdrjklmrEjCgFZHS4cjz9DyCACoHNHcj+48XyZ1P/1fn6O3H
         vs7H32qg34A0khVHorj+XvmJ7es4LcfTahVHICEhX8z0mbfS4VXDHJi/wSKRiuOpdght
         FmNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature;
        bh=9Bb5eDduPwA53IcvSO/GywAcmxhwJ0p0tmEGmHffcDk=;
        b=CI7TkPcrlgwavBDiHmNHORXJijfNHBMFfI7kbMMw2XHgJrf81+IaChESPmwEc802wh
         3Wqvw8vi1QByLBUCZt12Kc+XqDQu0moGauBVgYZNQsjwv4/Ax/GqBP8MeLVZDcwbD0EW
         lT4+sVheMHJtsqfw03QRulUU6QYNJPgp5Bz+6vD6vRPOsPrNcHETQ3sq+oRlB7WiEV38
         f9LpRgQW6qS73IoiwR9VeknJRZQe2kOomYHmD3bh/zCa4Ve1OeGDFVkiL/le/3mnKruy
         48jVMseeCRODf0CWOL+x1M4JZUysJ7oEcpd+y8tUvDwP/Uyqa6j/RYhMWYQmV8jmXX0q
         xV6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=Telb5hE6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c85si9503287qkj.200.2018.11.02.06.21.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 06:21:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=Telb5hE6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51664 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIZNy-0000uB-Fl
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 09:21:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gIZNT-0000se-7Y
	for qemu-devel@nongnu.org; Fri, 02 Nov 2018 09:20:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gIZNP-0003mu-Ck
	for qemu-devel@nongnu.org; Fri, 02 Nov 2018 09:20:42 -0400
Received: from mail-co1nam04on0623.outbound.protection.outlook.com
	([2a01:111:f400:fe4d::623]:48576
	helo=NAM04-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1gIZMt-0002nl-8g; Fri, 02 Nov 2018 09:20:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9Bb5eDduPwA53IcvSO/GywAcmxhwJ0p0tmEGmHffcDk=;
	b=Telb5hE641hL+PE4QhcRcJS1TKH6sI8DZqvHuyoTxFFd4WYr8grZ49yT1B8U8uqbAHZIGIPW1mKSBp+qbb5nWo4frhunq5O69a/1C7GD6koHs3oNLCKQBybk8yKPlyaMGzMz3FeCeqRbUsO4RRRkJbKCh8fwlFZz1cCJ3QJfZeU=
Received: from BL0PR02CA0050.namprd02.prod.outlook.com (2603:10b6:207:3d::27)
	by SN4PR0201MB3519.namprd02.prod.outlook.com (2603:10b6:803:44::17)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1273.27;
	Fri, 2 Nov 2018 13:19:41 +0000
Received: from CY1NAM02FT022.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::201) by BL0PR02CA0050.outlook.office365.com
	(2603:10b6:207:3d::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1273.27 via
	Frontend Transport; Fri, 2 Nov 2018 13:19:41 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
	header.d=none;kernel.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT022.mail.protection.outlook.com (10.152.75.185) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1294.14
	via Frontend Transport; Fri, 2 Nov 2018 13:19:38 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:36637
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gIZMP-0003PF-D7; Fri, 02 Nov 2018 06:19:37 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gIZMK-0007dW-9z; Fri, 02 Nov 2018 06:19:32 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wA2DJNpr007919; Fri, 2 Nov 2018 06:19:23 -0700
Received: from [10.71.119.87] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gIZM9-0007bm-IW; Fri, 02 Nov 2018 06:19:23 -0700
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Fri, 2 Nov 2018 14:19:12 +0100
Message-ID: <20181102131913.1535-2-edgar.iglesias@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181102131913.1535-1-edgar.iglesias@xilinx.com>
References: <20181102131913.1535-1-edgar.iglesias@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(376002)(39860400002)(136003)(396003)(2980300002)(438002)(199004)(189003)(51416003)(486006)(2616005)(36756003)(316002)(575784001)(63266004)(16586007)(77096007)(7696005)(126002)(106002)(5660300001)(76176011)(186003)(4326008)(81166006)(26005)(81156014)(50226002)(39060400002)(14444005)(8936002)(36386004)(11346002)(426003)(478600001)(8676002)(336012)(47776003)(476003)(446003)(107886003)(2906002)(9786002)(305945005)(1076002)(106466001)(48376002)(356004)(6666004)(4744004)(50466002)(54906003)(110136005)(2004002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN4PR0201MB3519;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT022;
	1:JzP1ZcDh1t9pAoJgz45198/hteda3owF9pc30TyEBZN0wvWSa7U/vYetYcuvflBdCABuHq0aim+hOga7EeVQPqa6/fyI2MvYjWF7crMSh/QzZglsezRrhdLg9gJ5rreU
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9282770b-9df0-4a99-2ed9-08d640c5d8ce
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4608076)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
	SRVR:SN4PR0201MB3519; 
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0201MB3519;
	3:7zpbCJfz6pM1Z+WXzrw9K/bS6tNAEpp4ntVl+SCNZVXkRPoZ61pApWI8WfT5hWcfSQXhxvN4nnZYZKXlTqZzn8PrHhSIQbC1WL7/W98Jp3N8ePevCvyfQYRtzWkLenuocPsE7/ZwiEQXQCrMPLYJSQA5O6eBEsrSwDGVOGOtORoueWg2NdSCGtmJBnkVM3rDcMeYnN97erK9tsumVluduu5AB4Z2aL40sPAXt9LIDU+n0DLPfIMiBorqUGdA9DpICTaoAzJfmwljaBnyVABz7CVattJUxbmVpwc+ttkhxpN5duN2A3MQqOu87Fou0hHPcsyC9Zvu3cP1DgpkFkmOyjmEB7CfemP4UkB1DBCi7ek=;
	25:+kdklnnAgPztZe2EVZB2I8SlWIKReO06RfW0Yr/uSv30LUMzX3OClGknZyPGDT/k+ehHMYpUkwwgcqAJYRxwqpKKbAWmTxIGal8ocOc/GZshQCyxUc/6j1oPZtAqO0tjh0rWy1XSYZ0YmGFQyNwr5mWbJSmI+pewgCUVgblySUG0wC6KRlH+ICJkphPWBDMY7iKitCFj+Sk31XkJZ1FWVhDRmgWCmMxePiELpiJr7aIjeaNM/Oosz10i0WGQwfJpUXL4rVsWPtShDhwty+cLDe1l9JxxZTAtWlswz3cbT+D9LR63QdVVmho+LrYVHQJvmd9JKEShwU3W/uGdzVGj6g==
X-MS-TrafficTypeDiagnostic: SN4PR0201MB3519:
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0201MB3519;
	31:7jZhjjhMXEUHglT7ouj5+9Ud5RYlq8+q3pxuU5T7vPi8fCJ2pi8kPtNwoyEI7wOTiboknYHzggBuY6Dwzy/dFup9fAF7Y7FN56NKywr5tOPHcX7IauifnzzpM9/PeGEfkCPA9V3SSvBjARJiv2Sx6e3g+NVhxDlsHxh1bcuR70KHYuECl6g+7F6y/yVF0ls4mE34gB8QqB6grqgF6BlVYOU/7T1+2LgouEv2ktMulgQ=;
	20:5zJtJWoCbkIaaQmffvBDhad/Ff3NCG90lMW6dq5K+7pkNKUs7DugwdWD/y+/FqBBmtr677oIo/jfyLd/kSQ8dZ+GHd9j9ChbB8rBFvZxsgVK8fnGBDsufVJzCfwVtmA8Jxt2j+zuM6d7gwV397rozSKDcHJCc6b/QkQ3D2pyFwlPilU5Y3wCd1Dn8Co68owR0WMFKm072/aPT6FR1ZZ6WbLNJstwVeDcqmSrk8+fbzoUz2rNyqty/juwCorhxQ6EKgCAvErj0WIL/t/lg0Kh7PO7nFBhob8rnam2m7Pba/vgw2etodCNexgIyTIqRvBpTjBx94wbh5InKff/c5THQL6jYAHC9u+To/fyTH/vbwJob28nMWF2FlsXTKl78F40zpFDC1VriIYVsSCuSrZFqy2Rfrr9Vgfkxs+HoiLBpSMr1Len/JDrU/f7wHfmQDBLIeTwZaTvGNOPEfPJnVUBQXNUvIK6Vj7d1X9OPviXdG+tWx4+YLV1C9SPnrF4Q/qT
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN4PR0201MB3519F448A41A956A393B33E0ABCF0@SN4PR0201MB3519.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93004095)(10201501046)(3002001)(3231382)(944501410)(52105095)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:SN4PR0201MB3519; BCL:0; PCL:0; RULEID:;
	SRVR:SN4PR0201MB3519; 
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0201MB3519;
	4:+t1HBM81TyMhVUPVluOkyFsGsdx9677KJJ0eIB9wa2LOgmjkyNIVr1Q4mmHo4lWy5NFoil2JKjNl2hZaCLSj3JbLDCDdgQeTSjkhLDERLdoUk+IZpgBK+yaOBKZFlwByEO2K5QWlWbzhRPemF9PuNKTXVcTCQaCsMArVWPQB3eLB29VgzrlDetjvGd2iGypt9zZe+av5J9hDUY+wmOb2s6hH/GNif9oZDPmJC9/H7evZCy/aM+AMhabzPRBNG0GxtmC9qVdXeldbSTsXMdueuXSPeytNuOmMkarF+zumOSAnD3dGtZLAriK6/AZGh+Xm
X-Forefront-PRVS: 08444C7C87
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN4PR0201MB3519;
	23:bgmwXMPVCWCMVloPA5sK7YSS+NWigGiTrGPW3se?=
	=?us-ascii?Q?qyAS78RyxJbgE0L3k7uaWeAne9avmWZ5heDynRBmbQ3B4l1B0Q/XcMouZi2S?=
	=?us-ascii?Q?2/WuMjNBlJqwEP/aMQGBbNTtO1SSh4o6vuOw50trbdb8gHZpigirhmD3T+Kz?=
	=?us-ascii?Q?2MO+ohMTUJCZgvIsY7ZKM6u+ukyjFrbCKQLAiBHe3LmJ9mxkDAKVrHz5GscW?=
	=?us-ascii?Q?TWVmjQISmVJiIvlNlY9rrT9SpUKO4C1LTJ4jzS363QJgUG8KVrSwjWO5rlJT?=
	=?us-ascii?Q?3Q2dAZK3+oHTU8t6BCSB5jq4lORw6lp2NdyLvRQVXDJvlms9fCpF4iw4ll6r?=
	=?us-ascii?Q?Ws6U9MjncNcLBtrlplw4E1QPMybX+DbZKl/FRTmxWUhATJga5E1pJVGfFLy/?=
	=?us-ascii?Q?E20GuSkkYBlX87u28dsBuPbt2W/aMWAvamCuHpOrnsrzTIuviMSfGnP+6Dfw?=
	=?us-ascii?Q?o2EDLF6KWl4QwN827Ubj1MQYvG1fsGWdc5VfKTB6rBBGAhhVfxnyrisGepe5?=
	=?us-ascii?Q?o9AJnJWCxQRPPnJbq85Qqi8PW6MWvQ5qg9ytsN0Cec6eaA7UHVGdVzexHjlu?=
	=?us-ascii?Q?yWT1AE3evP5hHn/mjFBLSa0/cU4RpofyxBPGaN5u3MKXnCD4BQAKFZeqWoW7?=
	=?us-ascii?Q?dRuo+MqvCJ+43eEnvqey6oQQz5CYkZ1VmCkFyZlTROscLdjCGx5dDOPTS2Ml?=
	=?us-ascii?Q?OqqQG1uDglJmjKxQkMWNg29EnCySFLyarXN8OsIo3y3QQw9kiBDZ9EJkoEBv?=
	=?us-ascii?Q?bSmiOhFDnv0Ux8ez36hqjhI97HLopW5yVih4R3ZjdjEW8cwZrrB89TMAHJgF?=
	=?us-ascii?Q?WSgzItmlUrFjMew/LucOjV7TFERmJIF5qFKi/mbCbimQX33GFuoq1t5vNCgV?=
	=?us-ascii?Q?avjvgPl4iw9zyf/Rfp7xY9g4wQgLFXm+npPrzNPlR0SNsAlnx0qJnEBYjA0P?=
	=?us-ascii?Q?T/71POBvdF1H2J1fUqZ/LFgCQbLSqILmC5koZ43cSxX6aR9QqlMLgsJ2dWU/?=
	=?us-ascii?Q?nBOQUDfqkTMQReCN/ZcsAu3YLoPziLa6XI21AmbWc/M0nMNfIR5gJyX+FZOB?=
	=?us-ascii?Q?LOVvVlZIBqfdmD/joSjwvC9cKyb+e4yMgtIcwFYSot3M5FgsNpFfyVS/CV7R?=
	=?us-ascii?Q?vOItF4OpE0VlUPoTxA+KZkQXwxRZ89Et2m6iclYW16Di/seAIsyWpbd0OXCk?=
	=?us-ascii?Q?Ssvs8XGOa5p4IJ7cUt1eTWqT0jc40KXJmhxacetw1AkdsngbIdjAYBx40oTg?=
	=?us-ascii?Q?hjE3+oATObljfdG7sun/6cpM571stO5IzWeCg7eCh?=
X-Microsoft-Antispam-Message-Info: qq9fHIglNo+3lKdVO8ol3GfOAvgCJ/1dig+ihX25+DW3MtzYB1qYvP4IMpu1s+Ooq6UUMuKQP6reNwcYaJV7KS/l9ePNk9pGLwP7/JDNVIOg6S2b5vQ/jGyJqpqqxU8+wkSvB3UltoIQ6TNdH0bu3uR/usOTSeEhHMkBIZOP/vvviBjrDkgNnAQlsCHGb+32wsGNKin9xYrfb2m87LE5PDItifs15vGZTNzlr6Fi0p6BhWSzkjusy6RSa3QyhItfJF5w/TjXd0lYpd19K1t+sf+L2TD0nKisSKJ0uUIO00taG52JUyi3CnZ5S/ZzSZY4fvu6zfgpubvSG7W1hzk3cpUjakdpMrUOdhy1QnOVyzs=
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0201MB3519;
	6:en2vsAZUSvwZHHjLD3eq94x6u//CeCUMT9+ZjgPBk9X7In5IHacPGcPBG3L+nDAwMzWtj6oxbLFoH7rjQfmh4HbXV4+aDnIb8yJ+NsuJPkCxDIk7Kuj5w91V8e/CMoARGfgqQjfW6rO+bxNbr9CdnqQjr8DUNp6pBczkZIl5Gzrq0QfECb7TNNDMPylR15ZnyYOtwZ14xsyfwgy7ViBogOnnvCZrx6hH8D6pGTIX7bvo6KOqx8+CoY1fMgsD3/GqaY4ixqFnM2etrleXZU+z0YVNGPtZs+fGNvYJb1XDuePGzWand4dh7Dr7FvtVtrNuHjMZZ57oBCnr2qYQD/TMEhv4ryh/GJYjwg1wrO1/wypfvdwtLIpwnfpcKqGJGqZ9KkkxHqLKBFhzv9CgtOiIip4Ye2Knyl1dUruObZZiEtZOIqgdq+5zx37Buk3oRrIvIi5Il/7z9w5Z6faN4o+R6w==;
	5:SFmD6woXiSuotulc3TfJBVkVL86HFSZ7MBcm44HiNWBjVrdtbxODvsrb7oFvC8XPQBOfe8/9baxcuqNHO6lAFyem6eYrgmDx5BPARj5OWy0drL4nCjv/Ciie69xB/rszTUY+ZOa6unaLH6CkER30Eq7aaFxO3avWswLgTpUP4xI=;
	7:23Wq89QitrbJWG4oWF2jgqUNpkm/6psNTr8jmbZVYP3xi2UqccEBLFmEr7wW+HNo1CGHU4v4pnGMW/YS+70vk/W1FShBxG3ZaAZuNHvEWTay1/GsGWT8WmPbCNouBKSxmkugPoCA3hfiXgJ/XJM03Q==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2018 13:19:38.1504 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9282770b-9df0-4a99-2ed9-08d640c5d8ce
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3519
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe4d::623
Subject: [Qemu-devel] [PATCH v5 1/2] hw/arm: versal: Add a model of Xilinx
 Versal SoC
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	richard.henderson@linaro.org, frederic.konrad@adacore.com,
	philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pwFIXJL9Btz8

Add a model of Xilinx Versal SoC.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 default-configs/aarch64-softmmu.mak |   1 +
 hw/arm/Makefile.objs                |   1 +
 hw/arm/xlnx-versal.c                | 323 ++++++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h        | 122 +++++++++++
 4 files changed, 447 insertions(+)
 create mode 100644 hw/arm/xlnx-versal.c
 create mode 100644 include/hw/arm/xlnx-versal.h

diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch64-softmmu.mak
index 6f790f061a..4ea9add003 100644
--- a/default-configs/aarch64-softmmu.mak
+++ b/default-configs/aarch64-softmmu.mak
@@ -8,4 +8,5 @@ CONFIG_DDC=y
 CONFIG_DPCD=y
 CONFIG_XLNX_ZYNQMP=y
 CONFIG_XLNX_ZYNQMP_ARM=y
+CONFIG_XLNX_VERSAL=y
 CONFIG_ARM_SMMUV3=y
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 5f88062c66..ec21d9bc1f 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -26,6 +26,7 @@ obj-$(CONFIG_ALLWINNER_A10) += allwinner-a10.o cubieboard.o
 obj-$(CONFIG_RASPI) += bcm2835_peripherals.o bcm2836.o raspi.o
 obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
 obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx-zynqmp.o xlnx-zcu102.o
+obj-$(CONFIG_XLNX_VERSAL) += xlnx-versal.o
 obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
 obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
 obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
new file mode 100644
index 0000000000..5ee58c09be
--- /dev/null
+++ b/hw/arm/xlnx-versal.c
@@ -0,0 +1,323 @@
+/*
+ * Xilinx Versal SoC model.
+ *
+ * Copyright (c) 2018 Xilinx Inc.
+ * Written by Edgar E. Iglesias
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 or
+ * (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu-common.h"
+#include "qemu/log.h"
+#include "hw/sysbus.h"
+#include "net/net.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/kvm.h"
+#include "hw/arm/arm.h"
+#include "kvm_arm.h"
+#include "hw/misc/unimp.h"
+#include "hw/intc/arm_gicv3_common.h"
+#include "hw/arm/xlnx-versal.h"
+
+#define XLNX_VERSAL_ACPU_TYPE ARM_CPU_TYPE_NAME("cortex-a72")
+#define GEM_REVISION        0x40070106
+
+static void versal_create_apu_cpus(Versal *s)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->fpd.apu.cpu); i++) {
+        Object *obj;
+        char *name;
+
+        obj = object_new(XLNX_VERSAL_ACPU_TYPE);
+        if (!obj) {
+            /* Secondary CPUs start in PSCI powered-down state */
+            error_report("Unable to create apu.cpu[%d] of type %s",
+                         i, XLNX_VERSAL_ACPU_TYPE);
+            exit(EXIT_FAILURE);
+        }
+
+        name = g_strdup_printf("apu-cpu[%d]", i);
+        object_property_add_child(OBJECT(s), name, obj, &error_fatal);
+        g_free(name);
+
+        object_property_set_int(obj, s->cfg.psci_conduit,
+                                "psci-conduit", &error_abort);
+        if (i) {
+            object_property_set_bool(obj, true,
+                                     "start-powered-off", &error_abort);
+        }
+
+        object_property_set_int(obj, ARRAY_SIZE(s->fpd.apu.cpu),
+                                "core-count", &error_abort);
+        object_property_set_link(obj, OBJECT(&s->fpd.apu.mr), "memory",
+                                 &error_abort);
+        object_property_set_bool(obj, true, "realized", &error_fatal);
+        s->fpd.apu.cpu[i] = ARM_CPU(obj);
+    }
+}
+
+static void versal_create_apu_gic(Versal *s, qemu_irq *pic)
+{
+    static const uint64_t addrs[] = {
+        MM_GIC_APU_DIST_MAIN,
+        MM_GIC_APU_REDIST_0
+    };
+    SysBusDevice *gicbusdev;
+    DeviceState *gicdev;
+    int nr_apu_cpus = ARRAY_SIZE(s->fpd.apu.cpu);
+    int i;
+
+    sysbus_init_child_obj(OBJECT(s), "apu-gic",
+                          &s->fpd.apu.gic, sizeof(s->fpd.apu.gic),
+                          gicv3_class_name());
+    gicbusdev = SYS_BUS_DEVICE(&s->fpd.apu.gic);
+    gicdev = DEVICE(&s->fpd.apu.gic);
+    qdev_prop_set_uint32(gicdev, "revision", 3);
+    qdev_prop_set_uint32(gicdev, "num-cpu", 2);
+    qdev_prop_set_uint32(gicdev, "num-irq", XLNX_VERSAL_NR_IRQS + 32);
+    qdev_prop_set_uint32(gicdev, "len-redist-region-count", 1);
+    qdev_prop_set_uint32(gicdev, "redist-region-count[0]", 2);
+    qdev_prop_set_bit(gicdev, "has-security-extensions", true);
+
+    object_property_set_bool(OBJECT(&s->fpd.apu.gic), true, "realized",
+                                    &error_fatal);
+
+    for (i = 0; i < ARRAY_SIZE(addrs); i++) {
+        MemoryRegion *mr;
+
+        mr = sysbus_mmio_get_region(gicbusdev, i);
+        memory_region_add_subregion(&s->fpd.apu.mr, addrs[i], mr);
+    }
+
+    for (i = 0; i < nr_apu_cpus; i++) {
+        DeviceState *cpudev = DEVICE(s->fpd.apu.cpu[i]);
+        int ppibase = XLNX_VERSAL_NR_IRQS + i * GIC_INTERNAL + GIC_NR_SGIS;
+        qemu_irq maint_irq;
+        int ti;
+        /* Mapping from the output timer irq lines from the CPU to the
+         * GIC PPI inputs.
+         */
+        const int timer_irq[] = {
+            [GTIMER_PHYS] = VERSAL_TIMER_NS_EL1_IRQ,
+            [GTIMER_VIRT] = VERSAL_TIMER_VIRT_IRQ,
+            [GTIMER_HYP]  = VERSAL_TIMER_NS_EL2_IRQ,
+            [GTIMER_SEC]  = VERSAL_TIMER_S_EL1_IRQ,
+        };
+
+        for (ti = 0; ti < ARRAY_SIZE(timer_irq); ti++) {
+            qdev_connect_gpio_out(cpudev, ti,
+                                  qdev_get_gpio_in(gicdev,
+                                                   ppibase + timer_irq[ti]));
+        }
+        maint_irq = qdev_get_gpio_in(gicdev,
+                                        ppibase + VERSAL_GIC_MAINT_IRQ);
+        qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt",
+                                    0, maint_irq);
+        sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
+        sysbus_connect_irq(gicbusdev, i + nr_apu_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
+        sysbus_connect_irq(gicbusdev, i + 2 * nr_apu_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
+        sysbus_connect_irq(gicbusdev, i + 3 * nr_apu_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
+    }
+
+    for (i = 0; i < XLNX_VERSAL_NR_IRQS; i++) {
+        pic[i] = qdev_get_gpio_in(gicdev, i);
+    }
+}
+
+static void versal_create_uarts(Versal *s, qemu_irq *pic)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->lpd.iou.uart); i++) {
+        static const int irqs[] = { VERSAL_UART0_IRQ_0, VERSAL_UART1_IRQ_0};
+        static const uint64_t addrs[] = { MM_UART0, MM_UART1 };
+        char *name = g_strdup_printf("uart%d", i);
+        DeviceState *dev;
+        MemoryRegion *mr;
+
+        dev = qdev_create(NULL, "pl011");
+        s->lpd.iou.uart[i] = SYS_BUS_DEVICE(dev);
+        qdev_prop_set_chr(dev, "chardev", serial_hd(i));
+        object_property_add_child(OBJECT(s), name, OBJECT(dev), &error_fatal);
+        qdev_init_nofail(dev);
+
+        mr = sysbus_mmio_get_region(s->lpd.iou.uart[i], 0);
+        memory_region_add_subregion(&s->mr_ps, addrs[i], mr);
+
+        sysbus_connect_irq(s->lpd.iou.uart[i], 0, pic[irqs[i]]);
+        g_free(name);
+    }
+}
+
+static void versal_create_gems(Versal *s, qemu_irq *pic)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->lpd.iou.gem); i++) {
+        static const int irqs[] = { VERSAL_GEM0_IRQ_0, VERSAL_GEM1_IRQ_0};
+        static const uint64_t addrs[] = { MM_GEM0, MM_GEM1 };
+        char *name = g_strdup_printf("gem%d", i);
+        NICInfo *nd = &nd_table[i];
+        DeviceState *dev;
+        MemoryRegion *mr;
+
+        dev = qdev_create(NULL, "cadence_gem");
+        s->lpd.iou.gem[i] = SYS_BUS_DEVICE(dev);
+        object_property_add_child(OBJECT(s), name, OBJECT(dev), &error_fatal);
+        if (nd->used) {
+            qemu_check_nic_model(nd, "cadence_gem");
+            qdev_set_nic_properties(dev, nd);
+        }
+        object_property_set_int(OBJECT(s->lpd.iou.gem[i]),
+                                2, "num-priority-queues",
+                                &error_abort);
+        object_property_set_link(OBJECT(s->lpd.iou.gem[i]),
+                                 OBJECT(&s->mr_ps), "dma",
+                                 &error_abort);
+        qdev_init_nofail(dev);
+
+        mr = sysbus_mmio_get_region(s->lpd.iou.gem[i], 0);
+        memory_region_add_subregion(&s->mr_ps, addrs[i], mr);
+
+        sysbus_connect_irq(s->lpd.iou.gem[i], 0, pic[irqs[i]]);
+        g_free(name);
+    }
+}
+
+/* This takes the board allocated linear DDR memory and creates aliases
+ * for each split DDR range/aperture on the Versal address map.
+ */
+static void versal_map_ddr(Versal *s)
+{
+    uint64_t size = memory_region_size(s->cfg.mr_ddr);
+    /* Describes the various split DDR access regions.  */
+    static const struct {
+        uint64_t base;
+        uint64_t size;
+    } addr_ranges[] = {
+        { MM_TOP_DDR, MM_TOP_DDR_SIZE },
+        { MM_TOP_DDR_2, MM_TOP_DDR_2_SIZE },
+        { MM_TOP_DDR_3, MM_TOP_DDR_3_SIZE },
+        { MM_TOP_DDR_4, MM_TOP_DDR_4_SIZE }
+    };
+    uint64_t offset = 0;
+    int i;
+
+    assert(ARRAY_SIZE(addr_ranges) == ARRAY_SIZE(s->noc.mr_ddr_ranges));
+    for (i = 0; i < ARRAY_SIZE(addr_ranges) && size; i++) {
+        char *name;
+        uint64_t mapsize;
+
+        mapsize = size < addr_ranges[i].size ? size : addr_ranges[i].size;
+        name = g_strdup_printf("noc-ddr-range%d", i);
+        /* Create the MR alias.  */
+        memory_region_init_alias(&s->noc.mr_ddr_ranges[i], OBJECT(s),
+                                 name, s->cfg.mr_ddr,
+                                 offset, mapsize);
+
+        /* Map it onto the NoC MR.  */
+        memory_region_add_subregion(&s->mr_ps, addr_ranges[i].base,
+                                    &s->noc.mr_ddr_ranges[i]);
+        offset += mapsize;
+        size -= mapsize;
+        g_free(name);
+    }
+}
+
+static void versal_unimp_area(Versal *s, const char *name,
+                                MemoryRegion *mr,
+                                hwaddr base, hwaddr size)
+{
+    DeviceState *dev = qdev_create(NULL, TYPE_UNIMPLEMENTED_DEVICE);
+    MemoryRegion *mr_dev;
+
+    qdev_prop_set_string(dev, "name", name);
+    qdev_prop_set_uint64(dev, "size", size);
+    object_property_add_child(OBJECT(s), name, OBJECT(dev), &error_fatal);
+    qdev_init_nofail(dev);
+
+    mr_dev = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
+    memory_region_add_subregion(mr, base, mr_dev);
+}
+
+static void versal_unimp(Versal *s)
+{
+    versal_unimp_area(s, "psm", &s->mr_ps,
+                        MM_PSM_START, MM_PSM_END - MM_PSM_START);
+    versal_unimp_area(s, "crl", &s->mr_ps,
+                        MM_CRL, MM_CRL_SIZE);
+    versal_unimp_area(s, "crf", &s->mr_ps,
+                        MM_FPD_CRF, MM_FPD_CRF_SIZE);
+    versal_unimp_area(s, "iou-scntr", &s->mr_ps,
+                        MM_IOU_SCNTR, MM_IOU_SCNTR_SIZE);
+    versal_unimp_area(s, "iou-scntr-seucre", &s->mr_ps,
+                        MM_IOU_SCNTRS, MM_IOU_SCNTRS_SIZE);
+}
+
+static void versal_realize(DeviceState *dev, Error **errp)
+{
+    Versal *s = XLNX_VERSAL(dev);
+    qemu_irq pic[XLNX_VERSAL_NR_IRQS];
+
+    versal_create_apu_cpus(s);
+    versal_create_apu_gic(s, pic);
+    versal_create_uarts(s, pic);
+    versal_create_gems(s, pic);
+    versal_map_ddr(s);
+    versal_unimp(s);
+
+    /* Create the On Chip Memory (OCM).  */
+    memory_region_init_ram(&s->lpd.mr_ocm, OBJECT(s), "ocm",
+                           MM_OCM_SIZE, &error_fatal);
+
+    memory_region_add_subregion_overlap(&s->mr_ps, MM_OCM, &s->lpd.mr_ocm, 0);
+    memory_region_add_subregion_overlap(&s->fpd.apu.mr, 0, &s->mr_ps, 0);
+}
+
+static void versal_init(Object *obj)
+{
+    Versal *s = XLNX_VERSAL(obj);
+
+    memory_region_init(&s->fpd.apu.mr, obj, "mr-apu", UINT64_MAX);
+    memory_region_init(&s->mr_ps, obj, "mr-ps-switch", UINT64_MAX);
+}
+
+static Property versal_properties[] = {
+    DEFINE_PROP_LINK("ddr", Versal, cfg.mr_ddr, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
+    DEFINE_PROP_UINT32("psci-conduit", Versal, cfg.psci_conduit, 0),
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static void versal_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = versal_realize;
+    dc->props = versal_properties;
+    /* No VMSD since we haven't got any top-level SoC state to save.  */
+}
+
+static const TypeInfo versal_info = {
+    .name = TYPE_XLNX_VERSAL,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(Versal),
+    .instance_init = versal_init,
+    .class_init = versal_class_init,
+};
+
+static void versal_register_types(void)
+{
+    type_register_static(&versal_info);
+}
+
+type_init(versal_register_types);
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
new file mode 100644
index 0000000000..9da621e4b6
--- /dev/null
+++ b/include/hw/arm/xlnx-versal.h
@@ -0,0 +1,122 @@
+/*
+ * Model of the Xilinx Versal
+ *
+ * Copyright (c) 2018 Xilinx Inc.
+ * Written by Edgar E. Iglesias
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 or
+ * (at your option) any later version.
+ */
+
+#ifndef XLNX_VERSAL_H
+#define XLNX_VERSAL_H
+
+#include "hw/sysbus.h"
+#include "hw/arm/arm.h"
+#include "hw/intc/arm_gicv3.h"
+
+#define TYPE_XLNX_VERSAL "xlnx-versal"
+#define XLNX_VERSAL(obj) OBJECT_CHECK(Versal, (obj), TYPE_XLNX_VERSAL)
+
+#define XLNX_VERSAL_NR_ACPUS   2
+#define XLNX_VERSAL_NR_UARTS   2
+#define XLNX_VERSAL_NR_GEMS    2
+#define XLNX_VERSAL_NR_IRQS    256
+
+typedef struct Versal {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    struct {
+        struct {
+            MemoryRegion mr;
+            ARMCPU *cpu[XLNX_VERSAL_NR_ACPUS];
+            GICv3State gic;
+        } apu;
+    } fpd;
+
+    MemoryRegion mr_ps;
+
+    struct {
+        /* 4 ranges to access DDR.  */
+        MemoryRegion mr_ddr_ranges[4];
+    } noc;
+
+    struct {
+        MemoryRegion mr_ocm;
+
+        struct {
+            SysBusDevice *uart[XLNX_VERSAL_NR_UARTS];
+            SysBusDevice *gem[XLNX_VERSAL_NR_GEMS];
+        } iou;
+    } lpd;
+
+    struct {
+        MemoryRegion *mr_ddr;
+        uint32_t psci_conduit;
+    } cfg;
+} Versal;
+
+/* Memory-map and IRQ definitions. Copied a subset from
+ * auto-generated files.  */
+
+#define VERSAL_GIC_MAINT_IRQ        9
+#define VERSAL_TIMER_VIRT_IRQ       11
+#define VERSAL_TIMER_S_EL1_IRQ      13
+#define VERSAL_TIMER_NS_EL1_IRQ     14
+#define VERSAL_TIMER_NS_EL2_IRQ     10
+
+#define VERSAL_UART0_IRQ_0         18
+#define VERSAL_UART1_IRQ_0         19
+#define VERSAL_GEM0_IRQ_0          56
+#define VERSAL_GEM0_WAKE_IRQ_0     57
+#define VERSAL_GEM1_IRQ_0          58
+#define VERSAL_GEM1_WAKE_IRQ_0     59
+
+/* Architecturally eserved IRQs suitable for virtualization.  */
+#define VERSAL_RSVD_HIGH_IRQ_FIRST 160
+#define VERSAL_RSVD_HIGH_IRQ_LAST  255
+
+#define MM_TOP_RSVD                 0xa0000000U
+#define MM_TOP_RSVD_SIZE            0x4000000
+#define MM_GIC_APU_DIST_MAIN        0xf9000000U
+#define MM_GIC_APU_DIST_MAIN_SIZE   0x10000
+#define MM_GIC_APU_REDIST_0         0xf9080000U
+#define MM_GIC_APU_REDIST_0_SIZE    0x80000
+
+#define MM_UART0                    0xff000000U
+#define MM_UART0_SIZE               0x10000
+#define MM_UART1                    0xff010000U
+#define MM_UART1_SIZE               0x10000
+
+#define MM_GEM0                     0xff0c0000U
+#define MM_GEM0_SIZE                0x10000
+#define MM_GEM1                     0xff0d0000U
+#define MM_GEM1_SIZE                0x10000
+
+#define MM_OCM                      0xfffc0000U
+#define MM_OCM_SIZE                 0x40000
+
+#define MM_TOP_DDR                  0x0
+#define MM_TOP_DDR_SIZE             0x80000000U
+#define MM_TOP_DDR_2                0x800000000ULL
+#define MM_TOP_DDR_2_SIZE           0x800000000ULL
+#define MM_TOP_DDR_3                0xc000000000ULL
+#define MM_TOP_DDR_3_SIZE           0x4000000000ULL
+#define MM_TOP_DDR_4                0x10000000000ULL
+#define MM_TOP_DDR_4_SIZE           0xb780000000ULL
+
+#define MM_PSM_START                0xffc80000U
+#define MM_PSM_END                  0xffcf0000U
+
+#define MM_CRL                      0xff5e0000U
+#define MM_CRL_SIZE                 0x300000
+#define MM_IOU_SCNTR                0xff130000U
+#define MM_IOU_SCNTR_SIZE           0x10000
+#define MM_IOU_SCNTRS               0xff140000U
+#define MM_IOU_SCNTRS_SIZE          0x10000
+#define MM_FPD_CRF                  0xfd1a0000U
+#define MM_FPD_CRF_SIZE             0x140000
+#endif
-- 
2.17.1

