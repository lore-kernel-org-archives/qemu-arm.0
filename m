Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp192353wrw;
        Fri, 16 Nov 2018 02:15:10 -0800 (PST)
X-Google-Smtp-Source: AJdET5duf5kjgPfb72eLkvo5XRyDWS9A4KUwAv8wR/TVc+JSYVn8GMzWI/1M82lLbpzlbpUGLkMl
X-Received: by 2002:a37:9101:: with SMTP id t1mr9000279qkd.243.1542363310801;
        Fri, 16 Nov 2018 02:15:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542363310; cv=none;
        d=google.com; s=arc-20160816;
        b=K2nRMaBPJJw5b1RYL3vYRd82rTOSZNk7kOGyUMy/4bkT2HUy2fZ2M2L0l64jgndmGl
         4OtFHhYl3rSFkH7zY5XaBuxX6lUfFSxroRS92qOtiu5zN1ra1CaRusxmWe2Dh+xEpY9a
         ydFO8HZicFlIAXM8iZfvKC0AO1U2s8TMS3vWMUl9MyYxDyijiJThJ2vkXqHvhpKs778b
         xZZOLIdZICxi4xnAapqxsRtBTa4fYHM/YEsnnVdXfqKveDuRzbmWL0SOYJWPOWUR5fGQ
         hxPH8dpkQmUOCQsJEhPH9jxlPynYVfph7gfGtPDPOAjZ//x+AgPXR82Ps59Ok/UvVsO8
         +oSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature;
        bh=JPOv/DUzaemkP3H2R7CRJwftKn5P8egcUgLY/w26V4Y=;
        b=xXcZOoHWs5MpHR50bYhU6D3Boz9M+msWFETifm5zODtBOwh4oITlch+99NwMowzArN
         nhsNsG+dDahSG4L1ZS7ZYl2vHYfj8ng7l07ArEnpKGaARttv5QdCSN+sVj2hM4BhLxt6
         u+L5owSoV6p57P50Tw/uP3hN55D01aA9U888ve3J8x8wpquhHbwgh78j3lZWJnwraOQp
         0+z4G/49Gn6zgVGMA7PCfcfMvHccG591Z2YhtUipxP5yihpXdWkQ0SX2TyLkzCH1uwwG
         7dhlhX+mqgOHhsVGegqGskpZtzzibyPDwvU5dhDnzZLMfPZf1x6RgCjrlXCXvFfI81HE
         T5hQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=RzKVmQNE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y22si3140959qtc.39.2018.11.16.02.15.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 02:15:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=RzKVmQNE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43807 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNb9a-0000rZ-5m
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 05:15:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gNb9I-0000no-B3
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 05:14:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gNb9E-0005u0-5Y
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 05:14:52 -0500
Received: from mail-eopbgr700073.outbound.protection.outlook.com
	([40.107.70.73]:36393
	helo=NAM04-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1gNb9D-0005jY-9t; Fri, 16 Nov 2018 05:14:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JPOv/DUzaemkP3H2R7CRJwftKn5P8egcUgLY/w26V4Y=;
	b=RzKVmQNEGjpypEk30DJUiyoIC7dCllu/CPApVTMcT8qBALCRWQ571wUzwMCzEV5KKHGLSpqRknZ2PI60KCBziPHzcBFFxfZ7CZ9AVTZN3z+HgKcR6lXkfQJVERhfFbWUP/vuzWAruQLkLSKgDAG20Wu51+O2u9eQFoGOjnVp3sw=
Received: from SN4PR0201CA0060.namprd02.prod.outlook.com
	(2603:10b6:803:20::22) by BL0PR02MB4450.namprd02.prod.outlook.com
	(2603:10b6:208:45::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1339.21;
	Fri, 16 Nov 2018 10:14:33 +0000
Received: from SN1NAM02FT019.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::204) by SN4PR0201CA0060.outlook.office365.com
	(2603:10b6:803:20::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1339.21 via
	Frontend Transport; Fri, 16 Nov 2018 10:14:33 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT019.mail.protection.outlook.com (10.152.72.130) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1339.15
	via Frontend Transport; Fri, 16 Nov 2018 10:14:32 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:54064
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNb8y-0002xs-HV; Fri, 16 Nov 2018 02:14:32 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNb8t-0007d4-E7; Fri, 16 Nov 2018 02:14:27 -0800
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wAGAEJ38025287; Fri, 16 Nov 2018 02:14:19 -0800
Received: from [10.23.116.79] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNb8l-0007cU-Ci; Fri, 16 Nov 2018 02:14:19 -0800
Date: Fri, 16 Nov 2018 11:14:18 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Luc Michel <luc.michel@greensocs.com>
Message-ID: <20181116101418.GX7447@toto>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
	<20181115094207.22846-15-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20181115094207.22846-15-luc.michel@greensocs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(396003)(136003)(346002)(376002)(39860400002)(2980300002)(438002)(199004)(189003)(106466001)(106002)(2906002)(77096007)(4326008)(356004)(8936002)(186003)(54906003)(316002)(478600001)(486006)(16586007)(81166006)(58126008)(63266004)(81156014)(26005)(33716001)(33656002)(9786002)(229853002)(6916009)(6246003)(5024004)(76176011)(5660300001)(47776003)(426003)(11346002)(14444005)(305945005)(8676002)(46406003)(9686003)(476003)(126002)(50466002)(1076002)(97756001)(23726003)(36386004)(336012)(446003)(18370500001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR02MB4450; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT019;
	1:CkdOrH+S4c0D2+92QK819pb5gdpPAJiZCYzaLHnfGKIap3fhVq3tFOhaHs5PqM5U78Wrergtr7uf6Fj06zCKh0oLcLNPbQSjkTYB6iry1Lq7WVwoUw8QsV7PvLeuY4HQ
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72520fee-037a-45b3-d5d1-08d64bac4ddb
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BL0PR02MB4450; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4450;
	3:1D08dNlWmq/hc1JLsk0GGAQDCT0MiCjMHJ231Hm3AJjbm3xHwfoLhI4eGh8WO3nV4ZrGiztzMG827GZ0bh1x2x+WnY/C+IxGMWwlp+8gVYqVJSXi96tWbEUMk5jvL5ZwaLV5iFsIE6/3Wbuvqc0dNpz552zSw5zcJNQszUWJBeYp0JTUV1wf4PmJcloCG6vRdHMPd46TYBtJHr7vTWSD7EHBKJmf5w6a7Nqsbh4STxeY66ueAv88OZ/n7lcARTfufC8FN9V8WKS1SXGURBGqEM7SVI+R0mZ1ClNMWePLnE9IugASSqkSJ8lFmIEiccv08ShFE/igx8wRZJZ10BIQlNvtytlpwlhoi8Mjsa2dhVM=;
	25:ErjwsvHhaKDAeWuHI9DVHIuVKc6HLrybrf2HQt5aGhIAcKlBK8ALegBtLhpqtjbpOUOEU3xvrINzDnUCJRdreXP1xxFDeO8j9gMdvAZWKdW1C5BFa66Z9m16/rFWLF4hirspTee0qrJBKGAmN/pJSqtBORxLdKjV4/BLPhsZ39NcEXYGmXsXQ7kq/+5hJZm4FGk7q4djQOOOqo/+Sdusj4CfuRYewspm4leR8WwnLIArIDemdKxXuWwau/p9FaK6xvQYiv5q6uz95GhyM38ZlAEP0ndJqBMKgDYu/9wbMiGnbJWmQAzVaDh0W8NxBGzVbjw6bDdtvW51MxCP58eJug==
X-MS-TrafficTypeDiagnostic: BL0PR02MB4450:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4450;
	31:g+XUtrcwma2SXSVcnSKjEYYHgZidrHsobkqlYasaYBKiyQ0dBFg+XoIZE5IPOPyYpz9RI0RAh6cZhjTucoa7F6CoYzL9iohP7OBEHg7NMbs9z1Llh6LYZzVhsBwYSzvb+o7N/O3hzos+mQ/tbRq3LGD3dm5V9/Q9EXuSflFaO3rTzs2yPy8e16I35NfVE93PKGMaR3Ybsunj2zl2c4l3T5qk0mNROo/HX0d3DIwCFj4=;
	20:nt6wwirFpriVpm+rnMep2/IfZYnOQlxhfBrEChl6BMempW+MPaDEgG9VKDJVQg3W1H5m8QUy/e2gaI5uauYcAQJ89e3ernyh+9YrHaRPcYip4Lex0Bi1eU/Vaa+oyoEZeQKtUuUaL3dukyXKYSEGsFWEijDK5QtB1cIcWCv8L9MCNwPDpeeX1wRBNWpCtHj3jQ6gNVkfe+n8zBLNxo1awuAaR57uzWZvgZKe4ejrE9FKX3BMTZF1VmvYgCpn2uEV5n+s+0z1W4vSGcPPGAjpKcBVhoAmB5cJGqCs6m/OukydQ8w+jSVlqxEJPwFEBtJzXtK48y7uYjGfBNue0XALbVwq9TWs7Q1LDUTrA4Fn6msHy7PWy3j7N2YaUr/oKIyznHiv8DRYKfFxglmFqBsjti/4hDZehvBOTUUeWELWfbFtCKm4iV2BqmG7gV8evQl1oevUsoHZw8KjjdPNVaf840F2hSC2LwK3RdQnXNExN6kNoUkU8D3Kv5GxOZF81uwp
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BL0PR02MB44500B289BC10C55C7166664ABDD0@BL0PR02MB4450.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93004095)(3002001)(3231415)(944501410)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:BL0PR02MB4450; BCL:0; PCL:0; RULEID:; SRVR:BL0PR02MB4450; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4450;
	4:YaFphiyTpomM2rpTW4utPyiJjnpawiVsfwNYx7nK69XahUG5QhT/ol2sDIPXyhNdL3Jza00N+FWYWr/mbEmrbDhzIBkHFPDnShROwQWqa2g9LQcsgIT3JMaQYwLaJcZEw+R3ISk8WAv68eXwMRB38K7TOLMGugdXdWeCc4HkLoIe7iG25RuiM/tl3CE6OmMm9S5W9wVP3mO5H/yL6suG+leJuEm3HHFZ+g06B/TOTXNdKRaRMOTB8abBKhhWM7B4hD32N9vzXRfx4JdqE/7fuA==
X-Forefront-PRVS: 0858FF8026
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL0PR02MB4450;
	23:V4EQoTrsDsBiq2psNKxBJONqppwx3WZvhV0AROgXs?=
	=?us-ascii?Q?yFBcNJHVEmrGex/UyZ0EOfGS4hLOCMFuavF0MvuNWz37QYv5dq16vpRreWQ7?=
	=?us-ascii?Q?TIINpAazQXz0wjVHSyqcQTXN7eA41dHl3KsoIP43urF3u5Qt8N/MpXblFeL+?=
	=?us-ascii?Q?i9Ehl4XHdRrrpG7zLKj6/FmsSnk4CqeLPF9WWgevrR9mV3FeNxrabRMQ5EVz?=
	=?us-ascii?Q?32yM/h0Ba9rgVteosUnhXTOJdG31pg5q60c1spPywdfGt2N0p/VoAyNi+Kew?=
	=?us-ascii?Q?cAEQpEX4RLp353wbmFYjdMZMIDKZWRSyQ9uEYBF64VAUw/A/EDaIxBFktDIl?=
	=?us-ascii?Q?aE9714AWD4HGMaHM2SylJobkii1nTca1n1OZt3UtM950eF6Q4cSermpbYcd6?=
	=?us-ascii?Q?tUMBhA60T3/n3CHGaUhirmYbv6YsuM6NyrOXcVm9wqwI40/nbFkvhlM856bA?=
	=?us-ascii?Q?VEqGepmTJbGrYTzunTgQ52ClD5EXxKtL94lpbb3SYpi+ucwmVFkRE46jFhp6?=
	=?us-ascii?Q?lI91ECu5lEmrFfmENOghuY4/lIBJHgMNDlgpF1pDxtlMuCnKwEzJa+gCqjJK?=
	=?us-ascii?Q?XvT01tyVJQB8YwgRP9JWswvW5GvkzHjvg6an93WiNGqKgBkI5HnIpLw5dH7F?=
	=?us-ascii?Q?lBz3dW61ReZHtSvTjzduUlliPklLUM/zrabDqQ55MtmSPYtm4OivFuH+S9Uh?=
	=?us-ascii?Q?dDyzk4Rlr3E18MUoYst4z1GLgV7yBlj26yHKrwJOUQj6kELMCc475auDbn0d?=
	=?us-ascii?Q?I/k7PXZGEAiF6KjVR+V8h58iGcoJxJbozpQX7+cMJJTKjwccoRUmkdXAwQlI?=
	=?us-ascii?Q?t7mC7GnI2QyCLxd1HoKS8uXdc51maUliLmnIzgp3uGao7tpiaBoS8iSL5gOz?=
	=?us-ascii?Q?xEcVVwgMczY8Q5ymGR+W67tih99DjDttZ7yAt4V54pZdKdnm1+NEyRS5Q33W?=
	=?us-ascii?Q?V7FwloURmGiPsKb8ol/kJbI3zGKZVH2uMuLqRgtrFDxnGW4UYv0tx2FKDzG7?=
	=?us-ascii?Q?e+MNjCs1msTLzOGvoYwsPyUUqUenBSMv1b+MWeYDYbU0AziFASj7JQhzWeAj?=
	=?us-ascii?Q?mn6U0ttyW/Cg1+zr1SS/xZMx9kkjzbB4DD7zH5YkIwfghbg77UkRYZx/9oiK?=
	=?us-ascii?Q?KwEdZK7JUVWESehQJo2NFKOa0F7r286xhePDKrWmRPmCazQxw+4wYgywOccV?=
	=?us-ascii?Q?ELBGifoDmlVHMZZX23e/2CwPFaMalbj29WTgzNPZLAFiyv7G2zNewvvHfIqP?=
	=?us-ascii?Q?03+d3dwmVIjae/0vEPFm1Dq2Cp7Fdhie8aFWDID?=
X-Microsoft-Antispam-Message-Info: tBRF5ZNNOtL1NTM47361tD6OMfldXiOvYqJGjnIr4+fNx3bfjY30r/w+97GlwhTEU2fZXEfcBGxB7LhNdPPcgJxnBfijHzrzqNOxxbITNbAUV8B92R222/CYrEKjmhzpmyBobukN2KeFPOOfxA+4Gw1cgJgsbp2wj6lTCudfcL+0sVkrjtlIzVe3PVUpqYaJg4Siz5SfP43djfodCdUQD2dWSXjDT6JIc4xC7t59uv2htbenioeXIBQVSeQXaL0p4Akea5osmjOlXUmep132Utnl8yk5ULccbpSovuOrQqlg8iVPGb6AuIYgoXWAto4rXS+IXnel+5v2uy45GFqx57T2nscDA/UGqTg5nA4J49o=
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4450;
	6:QhZNYhFzfXHJaVbtkDX/1iu2q4Wh3P0u7gZM8BS7ltAJLK3YdKUWpeLziK7JdsKfHcwq4uIeBtL0tuNADe/299dKwqCisU9La/dawwc+aUV7Ds1+3+zlym/WokBdBxtbKAFk5vV3oplFuM6tz/v/gtiWZKqJk5XRp8f8KtUTahpZt6tXyJoOG9jls0c78hygfHrC0QZVd39tCLS4+iJnpNikv0wkORis6DpUaxKeT607B1ksV4oXuW6tz4DhoXeLhZBdN2to4Z5QKcwDguH6Nx4asX9K8yQy3zZ6vQ+dMjg8ISubmRsS+x/8eXOWt9qXlgcWY/ykpkQCn3TAY3v8NwRsP56OFPmhi0AL/Bj5cOJ1D/AhoZMIIceVJP4BbrjxBJQ5mqFqoxgBsYjow2Y/UGBaIfkjRUj/o8znAdB5w4vBkrsKMneCfwHaGQMASjBJTm9YKE3bw1C6pGyXIw1btQ==;
	5:IBT0RCuquqpvhbVoFwXITJXawSnoIsX/gQnFgBP8ViwcEHuZCxQH/Jon3p0Puq5U9sFbxe9xFiRWoXzoBjJdViZA5k4S8gb6glaWhvYXPY61DkLait6NzK0P3B3ZXQhz9TKfSRPwB3pMRdJ8jM40WZyA2y0icLHnjqpBBRn4Bvk=;
	7:/UgIRg5Ghb35f8/9MiMRQvQluI5w6Z5akLe7Kw5EJw90AcbqRgMw6ThcMPXgxg4lwfS+b5WtQhgz/V8xlfgC/qphvEYcnl459V1QfOZ+e4TqhvKyg3fnlhj+RGjIH+8WKS9jZMrawOhl+LzqNK+yrg==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2018 10:14:32.9089 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72520fee-037a-45b3-d5d1-08d64bac4ddb
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4450
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.70.73
Subject: Re: [Qemu-arm] [PATCH v6 14/16] gdbstub: gdb_set_stop_cpu: ignore
 request when process is not attached
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com, qemu-devel@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: feUkXYY3Yam5

On Thu, Nov 15, 2018 at 10:42:05AM +0100, Luc Michel wrote:
> When gdb_set_stop_cpu() is called with a CPU associated to a process
> currently not attached by the GDB client, return without modifying the
> stop CPU. Otherwise, GDB gets confused if it receives packets with a
> thread-id it does not know about.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  gdbstub.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index 59eed3b878..89819a6a72 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1787,10 +1787,19 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
>      return RS_IDLE;
>  }
>  
>  void gdb_set_stop_cpu(CPUState *cpu)
>  {
> +    GDBProcess *p = gdb_get_cpu_process(gdbserver_state, cpu);
> +
> +    if (!p->attached) {
> +        /* Having a stop CPU corresponding to a process that is not attached
> +         * confuses GDB. So we ignore the request.
> +         */
> +        return;
> +    }
> +
>      gdbserver_state->c_cpu = cpu;
>      gdbserver_state->g_cpu = cpu;
>  }
>  
>  #ifndef CONFIG_USER_ONLY
> -- 
> 2.19.1
> 
