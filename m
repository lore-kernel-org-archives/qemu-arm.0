Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp192662wrw;
        Fri, 16 Nov 2018 02:15:28 -0800 (PST)
X-Google-Smtp-Source: AJdET5ccCU1EyszFtCFvW7cwKzXO5yMB1gPaKrwF9ekbhzgSZQxAEQiiYz7lbWEnPZWO9siTjcvf
X-Received: by 2002:ad4:510f:: with SMTP id g15mr9897038qvp.46.1542363328541;
        Fri, 16 Nov 2018 02:15:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542363328; cv=none;
        d=google.com; s=arc-20160816;
        b=V/ga2MOyl7f45+s8DVeEvXoZu//zbhF76FR2UU5DL2ovktgO+Ld5+x9OFD5HoNe32e
         mJvFuAv2KsCnUFC/R7XhNkbMeHBzeAYalHZJWTm1kgziM1uowCiuDpriOnFDqotWylkB
         z3bmpneJLRdfME54bf34oSSIn+WF6dOpYalZcKoRALuTtsAaib0KF0EKX48icdZKWBuM
         5BgSfqM3qh6PS9Kz6nWNHWslnSWHTpsF6kerYbuANR9eR7946by8YIlqlTXcS7aGlOfc
         8V0i3bd6pSn29Hai5ebTZAnvk7LsZaAHzatkFT0DbfXKfFuoE8bMsjVZuL1hE9L/FCGS
         MDPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:dkim-signature;
        bh=HIfrrbPIOwPTMeWa9xV8EXNSULEZfWAaPbeCrry8D7w=;
        b=Pr8n1D/J+JcWFt/BOyQXfC0jxBpntvbN4og4nSs9/bfqFvzf+RVABlfwhWhNq91C79
         yDrgMfjZy8M5+b5q+Bi7wpkUT5IeDgbvefvP8cQWBeZeDo1OXYqZarL5ZYw0/DIa5hq1
         kJGgplURwHn4OCIjVC+0ZbLCYXceP4/EB8VwqDLqGoo9NlpoyyTf3oIkT2P9/rYlRo0S
         3sA5NUHFIF9/lOB1kjGgCzzmpMNt1UDqrQuvAF4Jt/fcoxMd32+rTJYQo4UaFGJaCHK2
         Lkf+67MXBg0bx+Zg98a1/b3EWX8HsYjFua1YOr4UKQ1dOIOXnQy/W1arDE4xb1BO4aZC
         vUbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=YFda+lar;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a6si1800402qtj.202.2018.11.16.02.15.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 02:15:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=YFda+lar;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43814 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNb9r-0001D1-Uj
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 05:15:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48296)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gNb9R-0000wE-NT
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 05:15:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gNb9N-00064C-QP
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 05:15:01 -0500
Received: from mail-eopbgr710044.outbound.protection.outlook.com
	([40.107.71.44]:31680
	helo=NAM05-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1gNb9N-000633-GA; Fri, 16 Nov 2018 05:14:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=nTBTd+kFKeTJ/nnHubXFWfL8TvdufnuS9WTM3K/8A4w=;
	b=YFda+larMq9hvmhL55R1RieuIHrH4NuE/QtIMcZBU4Qn5aFEsDiEAgRLJWgO8W20pdDBAwv91rMdJRyHKXRNHFNmUuAU+s1gb+hKb+OnDEA3JfMTWAah0ELYYvVGFnczq305gAZK3Hgof9ZLfsk00xu1A4vTTzD/Zys81+STNFE=
Received: from MWHPR0201CA0069.namprd02.prod.outlook.com
	(2603:10b6:301:73::46) by DM6PR02MB4459.namprd02.prod.outlook.com
	(2603:10b6:5:29::28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1294.27;
	Fri, 16 Nov 2018 10:14:54 +0000
Received: from CY1NAM02FT062.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::204) by MWHPR0201CA0069.outlook.office365.com
	(2603:10b6:301:73::46) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1339.22 via
	Frontend Transport; Fri, 16 Nov 2018 10:14:53 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT062.mail.protection.outlook.com (10.152.75.60) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1339.15
	via Frontend Transport; Fri, 16 Nov 2018 10:14:53 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNb9I-0000BW-M6; Fri, 16 Nov 2018 02:14:52 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNb9D-0007eY-IW; Fri, 16 Nov 2018 02:14:47 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wAGAEdN5025343; Fri, 16 Nov 2018 02:14:40 -0800
Received: from [10.23.116.79] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNb95-0007dq-HI; Fri, 16 Nov 2018 02:14:39 -0800
Date: Fri, 16 Nov 2018 11:14:38 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Luc Michel <luc.michel@greensocs.com>
Message-ID: <20181116101438.GY7447@toto>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
	<20181115094207.22846-16-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181115094207.22846-16-luc.michel@greensocs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(396003)(136003)(39860400002)(346002)(376002)(2980300002)(438002)(189003)(199004)(336012)(356004)(186003)(426003)(11346002)(305945005)(126002)(446003)(486006)(476003)(575784001)(23756003)(5660300001)(9786002)(63266004)(106466001)(77096007)(33656002)(26005)(2870700001)(47776003)(9686003)(1076002)(8676002)(81166006)(81156014)(36386004)(229853002)(76176011)(33716001)(8936002)(4326008)(106002)(2906002)(54906003)(6916009)(478600001)(50466002)(58126008)(316002)(6246003)(18370500001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB4459; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT062;
	1:X3qiHPrTU5pVxZ5P5kEpSkEGJoqhccWuZrit0F5XGAo/08aRGhnLChLlUklbpIwvfAoqzCeRl+pw/uBwiGL3pisVQGleV0k/I+tsE6WdI9ChdqghiR+aAiCYXSmgx1qB
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66cfdef1-c433-459e-3aca-08d64bac59fc
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4608076)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
	SRVR:DM6PR02MB4459; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4459;
	3:z1IVX+K1Ars42iAuGT+ij+8tHL37A6e0wL6+TeIRwnWVRsBq6dALgNi2ZI/w39zovURUZwrbthnZTY1uNeX+xfkK/Z+uRbPPX8rl5kpi8loYDOdjFpm5RERZfdN4OwO06WyLHYcQAb5mMLjtuMXcm/QE+R7a6iUtjvGBGoNqKLmDrJqY1Ci41kw/DwhcZuDRnL1nNnPhomom2/RcFIVWL2gC4RcgegWaSInpnvtEnHrdWyMwhCEhGc1IjsWCu1ZY13pCGNbaYvL9BxfYt+G2erbAZ87V6AtpRKxdabnY5ZgQ8G19VlUdewt6XQiTmZoYJVMaCUSrQzejUfrHGYPvJVOCMN137K6j2wnX9IdiGCU=;
	25:nfb1CU3TcNeheaGt7DNxKQgm3M/HW3fcZBO+gp95e5ggZKi09WuTaSQ/3tzYxYijkiG4/bMu9FUDnanonvCdGCLX0HDEj1zi1egsILgbHHXhyq9us7GCIIgJ2H4VqlGj1uSn+7Tvyna13dVktuCBEXaNghIKgFscOZYhdw1kbdm+RzWL92QWqCL+lHH2Vrmu68JsO0akou5v2tjbdE4XJeIXyzCk6JEsopYovfDemT3s0Q2TctCFN7G18tsKOiZayMJ9IjIbauZxCI4X2ekxvhOsgh8eSgT/raucl8VNao6n3NB71KzCpKkDptVBI1u6onRH3IM8nmLpJ/7IfB0hiQzl4Sw3T8JF9fWiR/KtfyA=
X-MS-TrafficTypeDiagnostic: DM6PR02MB4459:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4459;
	31:Cj1Yrn+YUaKtTiyeTGzPu3J2U1IdaXo7yd+2dktcLzsCDx7N6AHSyqaGV3R6KDtUqN5+gMQ9mHR11OYH20MQBbkew5tcCr9QKXRFWsaDVPRI+bqw9n5LXFoqG5vkIPPuhkKdD02vnO3n1UezVGfNfGlUYycIWbL9XZLNa09ll1xvL2diQANJAKiNg9XzY3xrVv++xJIvy2ZiSpLeoq6DjP0DFJIFJNjv0phqU6qQI3I=;
	20:M/hHlKlmm657MzFE0kDsCWyhsym4tKXsqLP1blG6AcZhcCbHocgdVK4+rFtXenbVzJApKv8GCwvJL8Db8O9XfPf/clvekXh2HMuQLbQP74OgzYDWCqkhe+OpI8x2qfG5Z+PugD907O9/6oTQxpSYfB4SSiE6OnEn+xfOELcbJu5Y08EOYGYH0GP+5JvHrr/oGRvx3tc55Jg4vNRbkRloIlJhTiUeftMsScXdVLghVlnYOMuUQm2DGB8gXYxjdlAFeEcHKdL6TGarvArxoTihiwF+zF0Y9s9F8zzOsWeO2iRgyVnVh7l72IkVh6qHDUhB4N4936VtlKOnNFMhIW0cqXUo2HNAEEn7a031Y8dgP52HkOq3UlZR+5dXin1sGa7Q1opOk29vAHV9bqeiy9FXT1rmeoa5dazQVaTkbqspVhflimiWM+Migd5IU+mbxS9Ahag2jbNZJthrprCWzA2rSa9Qw3Sy+6B5Xf2z/SMy3S67QEdd/TY7V5V+WY0D13FA
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM6PR02MB445922FF66A60038FA3956A7ABDD0@DM6PR02MB4459.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231415)(944501410)(52105112)(93006095)(93004095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR02MB4459; BCL:0; PCL:0; RULEID:; SRVR:DM6PR02MB4459; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4459;
	4:AGD+VbqJ8xjZWzSms/DT/cTqtpsBtjt0+9eJEqGy8VAx1X85/3lGggNmXKObRrGau6+CHkMbNwqH7NHMqjt6LPcO+3XlDnVO/Qz6NQaqVvQ/05g72sYdVX4LhoiC66iMQwIlEgxgfMlzolYZTi6COmb9QHPTfDQYz/Gz64KwioDOT7Jv3RPMzibnscMMyJjasdAip4VgpRhTlOCNkrwzYsWBhjlaAPZss+voBg6FsfbRsFYPjPYg2GcgsPMdOmanQVZc2keJPpY0uCpDBbww8NGKjr1b4fannGJYYBzQtqArUVYFUDhw3xW9KKUF4h67
X-Forefront-PRVS: 0858FF8026
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM6PR02MB4459;
	23:067cmnMSTRmjoMXoZRyZXSUhoQYbdydg6Q+555Un9?=
	=?us-ascii?Q?iSYf5G3xCTldwV82nqvFZDHdjMiEDuxyUopzqE9gWNZ461WadrfUwODldvWa?=
	=?us-ascii?Q?Tb16s9Myseda9vVFiIH9V68tx1bppgFjQN6Sd8pFseMHMz91iG9+b+pfUXIn?=
	=?us-ascii?Q?4nlJjglZe0VMIjRQqNlzhd756YXZx5FNvqOVdPWGo7R2lkMk7gcHFgO0/itX?=
	=?us-ascii?Q?G45ceqwqc40d9oYhh5nbMp5YLRqbk/O2nB17UgcHR+aVrPJp9epz31BzHa8b?=
	=?us-ascii?Q?il13WTjmTAqydu4PJs+ESN97hAYNjFpAoQbpTkPoL0c+er27ab5Nc8wsuD6T?=
	=?us-ascii?Q?p4tYP6365g2TdX/ORvD6Z1D07jnQPcdJsT4uIcd60lilVrdHt3fuUwfKuFNc?=
	=?us-ascii?Q?7CbwKdy1KgTjUnzEE1fiUHm20P1EsG3TFm2j9FnBq/qtzJYu9k5HLpgUI1xI?=
	=?us-ascii?Q?FPt7bRebmFVrvw4o21KystLshijCuPYBinmeGp8HpQcogV8Ulw+NiO3XgYMj?=
	=?us-ascii?Q?jYSuAt6xMzNMyiS8ibn5WDvoITMU/3VAVGKQADhusxM3sP4zSYxiWT97JrBZ?=
	=?us-ascii?Q?fuvDGeuD6FR8UhkyHrmfFdvj0aV7QG61vbMWnr3Uhf110piXv/AZMhdplm0C?=
	=?us-ascii?Q?XU017OZZl0wjZM3qk1zApFkQSIZWKrP1T6JWd9Z4ae4nkHOIrNTfHaBqt6+I?=
	=?us-ascii?Q?QAu6yJnoevV0N3D9DreNEH2+jO90mDRw7+pfd+W5thgK3Xi9YHexXcgThutQ?=
	=?us-ascii?Q?5diqvHYI+EjhTBaBkblZ97N0tjIVoKWEKMFWOhzUZzUepWNrKHHlzMwS/Nzw?=
	=?us-ascii?Q?96ZcszW2eXsCV0b8cLIwCYi/Q42G59xpzRY/B0FUvM7jqQhpqV5iUvXj3k8t?=
	=?us-ascii?Q?bq8JFThgb5LrwlPJfTbaDQj+vfdc0gjbQZNeitOGgoWLX371A9P9AEzKWHZR?=
	=?us-ascii?Q?WliEiad572W8QeR4emU9wT7/3sj0Dok6HDhK3gHieUyqhh5iBXC3P6Fwce9J?=
	=?us-ascii?Q?NXtxmAdCm0/ud1QVEUK+X941vlE0XXPpUpw1ZTKGBrwoehiDwn3sHk2C6Sbk?=
	=?us-ascii?Q?xv5w56SnGutt4SwInsBibNZabVTalStjCmdIukNtydccAbk4rP6ikAMWCi+b?=
	=?us-ascii?Q?M/hL2NvzVWQVJvJytDIyLChPpUy+ETv+V4Sv60rGKCFyy3ndaZ/bDdd8Dt4n?=
	=?us-ascii?Q?1FSBcIWmCsUS4A=3D?=
X-Microsoft-Antispam-Message-Info: d1zVZMe7UN5Zt7VrJjeWsg5kMb92YOlhoR0LPMXbpTvKZrHhmP7a7cb4O8OqwCswUoR/EI+vPUsrnTHehJnJpvCTOkhgwYvWGjo4+jOK141+LMljsptnLAkxJC2KqQYiLTDSyZu2Uk+kpynXEsL64HmDETjs0f80oYOUGQDjhgm9ftsIRWrZsrgmw2y/780OwNau6gPIUuz+CFxOu/V3JoS8ugfRD2Sxs614FHjhBX8QikWIQiVTttcHqo3jN6AjGc1Zi0eTFYe2obPBpawPEVv9dgxlpqzcnCUKOgXGfa2VKJGpCxNJGZHf/QrOoR9OHI8Jpor1uyYetIfTDq4EygdKwnfn1tYExgjwZdMlwl4=
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4459;
	6:mTvKMwjYiZOUq1+B2oRR42uezWSHrhvJNTkuxjV+eQJg2LuvMb5MPT4DzyyfK59K+l9P68hzgE15uRYNDITKwo5SGo4fDUQxm/yFj1Pz2pD20VKoIF0tvrPVss5MWbI2TwU4DVMeZbYrlxEU2d4vQDLGNsXkN8gICmRhAIiPSy7QOng8FmG512RkvSQa95Wfe3PlVu2Gpou65UnKnmRX67bpi6nBfnLr67V98F248S4/8eerlmqXjXaQBu3wbxHXdsV+2YVZYT+AK6t5VOhTzH886ijph7GscS8klg4Ca5kTVqPXOANZ5rFxBtvWQpMytNoUECytaJxKFo3WDiG9cTcXy+MasvlNtoDMtw3t2qKHd6OAx6JNuk9aOMKKciksE2yMriFPYH7TeCGx/lj2c06qjAb0enHKXFSIxxVsdOSmuRxUVa1vPCePLJr4J5l8J+f8pd0+beLfvtL/k8YHCQ==;
	5:mpQUyjp5dRIHD922RjRSx1ajDrl5r8EySO2PRDx02ievYT9k4T4eq1lO8mbY9n9RM8zhkOjEYJYYQvYnkwojxH72Ei/vyZdwwzcWFRSIFC1oxO5aM9CDS8Pc5MZHkLkO/nJNNnrhJq2a7NYlS5NgWZdIo/WatcxryQsj2LM6hVY=;
	7:LRKVoAJuG2faaMiYVGvY6NVlfD+b1zHbMmkjXPZDl8xDQxAf0BTLxXmXWApNsUFSixUD2bwwPQvicm44N6qQv8l04ML/Ua/02JBPMcDfNbb45QayZ5c6JiM26W8sHHUZumwn4bp18uAbnAjtK3Dnlw==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2018 10:14:53.0820 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66cfdef1-c433-459e-3aca-08d64bac59fc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4459
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.71.44
Subject: Re: [Qemu-arm] [PATCH v6 15/16] gdbstub: add multiprocess extension
 support
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
X-TUID: ZUQ5Bs9rGtdP

On Thu, Nov 15, 2018 at 10:42:06AM +0100, Luc Michel wrote:
> Add multiprocess extension support by enabling multiprocess mode when
> the peer requests it, and by replying that we actually support it in the
> qSupported reply packet.
>=20
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> ---
>  gdbstub.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/gdbstub.c b/gdbstub.c
> index 89819a6a72..e0b844c040 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1721,10 +1721,16 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
>              snprintf(buf, sizeof(buf), "PacketSize=3D%x", MAX_PACKET_LEN=
GTH);
>              cc =3D CPU_GET_CLASS(first_cpu);
>              if (cc->gdb_core_xml_file !=3D NULL) {
>                  pstrcat(buf, sizeof(buf), ";qXfer:features:read+");
>              }
> +
> +            if (strstr(p, "multiprocess+")) {
> +                s->multiprocess =3D true;
> +            }
> +            pstrcat(buf, sizeof(buf), ";multiprocess+");
> +
>              put_packet(s, buf);
>              break;
>          }
>          if (strncmp(p, "Xfer:features:read:", 19) =3D=3D 0) {
>              const char *xml;
> --=20
> 2.19.1
>=20
