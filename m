Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp552554wru;
        Wed, 15 Aug 2018 04:02:14 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyCUAkLbp8b+UXMIVuwbUg+H1/mvz8F5BDjt4JDhhw1oIX3BBIgBDg9LdXJZfG+TsvWdali
X-Received: by 2002:a37:5e82:: with SMTP id s124-v6mr22879354qkb.313.1534330934735;
        Wed, 15 Aug 2018 04:02:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534330934; cv=none;
        d=google.com; s=arc-20160816;
        b=ThIOojojeXLqYYrFmd2epHEx1u41TpP2BNseP6m9arVrw+yo8EuUHzzE+iBoZ1VXm0
         7OaWOMAGSEW+UYr93hUth7uSUXr06bYGX/cisUfoQvNzN3J9BlbZ0Dqj0oioI/Pprd5R
         +DGjUdtiq91mr3YXnsTvy0aknL+ZFNF6JuIzpY9KiuAJgvyfvfXIX9th0fbIeI5C8hWn
         ZjL3IONwYvwS3Vb/Vzog6G/icKlho7OJFtSHqkTuGaT4GOKND+tmkNUS8mDZwei5bnf2
         A/MlfeCI+oblg4opFdD76elTKhaEtgoK1eI6UtlUj/K8oxeXd/mzf8A3Ma8Jpscdq/qL
         4SSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=dxsZENzHKI0/f68XqjXYUBSHrcgwqZ44cljt7H8sXj8=;
        b=lTknm3HdTqcm4yk6i81HGSI5hruHCvnRQQnRdU+rIKlYNkTfEDLQia3DzUzf2YTrYK
         33Ld9zHcdVMBwAL1h/ssa8O2FZo0LSCWQR17MKcK2dGt+beqptIGXWtC6NE0pzNs4yuW
         9v1AXSniDu+eaaWUdLoGLFMHaysYzQ43v/Omm2jJU5UE7EJ1NxB0xqB9/eK/LtdIm8w0
         DHFMOAz1Tti8cZn27F5vQwh1Acwdzrv4l44rnkgyXzNUzk4NihmmeoTK6HliAHPl7rlV
         zZZFldEf1PPomdnvfeqE0aYYoMRWRBzCYSa5gXV+MLxf2EY7uLsTK55iVFdSSwOzU510
         bikA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=Ymc079pW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h185-v6si6339667qkf.234.2018.08.15.04.02.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Aug 2018 04:02:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=Ymc079pW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48571 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fptZ8-0008LL-9U
	for alex.bennee@linaro.org; Wed, 15 Aug 2018 07:02:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fptXk-0007nm-27
	for qemu-devel@nongnu.org; Wed, 15 Aug 2018 07:00:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fptXe-00044I-Gm
	for qemu-devel@nongnu.org; Wed, 15 Aug 2018 07:00:47 -0400
Received: from mail-sn1nam02on0078.outbound.protection.outlook.com
	([104.47.36.78]:17376
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1fptXe-0003zH-5n; Wed, 15 Aug 2018 07:00:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dxsZENzHKI0/f68XqjXYUBSHrcgwqZ44cljt7H8sXj8=;
	b=Ymc079pWeF9MiwPGANCrWV/7s1CpHegwFXGZyxe3IWe+ptC08mwCpKoupQsKcdCjam74boVT7Vi9Et3yiB8/YHJ53FMB0u/nRlHEmya7LkxU2Uez/MgXxXGa0AfTmGCfpCB59U3MPWim4sv0v+Z8gR/6Cp+F2okudh6oewLEkzA=
Received: from BL0PR02CA0063.namprd02.prod.outlook.com (2603:10b6:207:3d::40)
	by SN6PR02MB4334.namprd02.prod.outlook.com (2603:10b6:805:a4::27)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1038.23;
	Wed, 15 Aug 2018 11:00:40 +0000
Received: from BL2NAM02FT043.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::204) by BL0PR02CA0063.outlook.office365.com
	(2603:10b6:207:3d::40) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1038.23 via
	Frontend Transport; Wed, 15 Aug 2018 11:00:40 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; greensocs.com; dkim=none (message not signed)
	header.d=none;greensocs.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT043.mail.protection.outlook.com (10.152.77.95) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1059.14
	via Frontend Transport; Wed, 15 Aug 2018 11:00:39 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fptXa-0007w6-Pk; Wed, 15 Aug 2018 04:00:38 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fptXV-0003VX-LG; Wed, 15 Aug 2018 04:00:33 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w7FB0BP0030277; Wed, 15 Aug 2018 04:00:11 -0700
Received: from [10.23.118.101] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fptX1-0002v2-A4; Wed, 15 Aug 2018 04:00:03 -0700
Date: Wed, 15 Aug 2018 13:00:02 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180815110002.y5jmolo4bwp5fhm6@toto>
References: <20180814124254.5229-1-peter.maydell@linaro.org>
	<20180814124254.5229-10-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180814124254.5229-10-peter.maydell@linaro.org>
User-Agent: NeoMutt/20170609 (1.8.3)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(376002)(136003)(39860400002)(346002)(396003)(2980300002)(438002)(199004)(189003)(8676002)(107886003)(47776003)(81156014)(476003)(356003)(186003)(6246003)(50466002)(97756001)(81166006)(46406003)(305945005)(426003)(126002)(76176011)(106466001)(486006)(446003)(1076002)(8936002)(23726003)(33716001)(36386004)(478600001)(9786002)(229853002)(63266004)(336012)(4326008)(11346002)(9686003)(26005)(54906003)(77096007)(106002)(16586007)(575784001)(316002)(2906002)(6916009)(58126008)(5660300001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB4334; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT043;
	1:sWEVzphU8oPY3SkcffEXlDM+ylSQensXbhyi7M4chAwqFgCbKedP7Oc0dWITHJOfBrrUxx2wGqwM15zaYRqJlDzgaObg0Af/uh5XPNed7V+fz+5ihvmYJcgNJUxU1KFk
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1660acc6-48e8-498f-e008-08d6029e565d
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:SN6PR02MB4334; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4334;
	3:cfeQwLx3XtbbF4+8p5PuQBvACkbRYyepyfpx8+h2xprfC/zecQ/lIJUEP6zoHB1E61tkQYkYsSwwbv70N5zNjFZqIQJAmTzRBVfZ/oV623Mqm7kaa7eKoWCFdu3NlqMQB94BI7H5eDjOEI/holuhqqp+isdsu/lGhuylcuAgtWzrr9bR65NJxOa9rqJSgKPsGkCig/eiIR1JdHu4YOGpBBhmqaCEYzsVGEn9PAtm4OiqqZRJM4Bb4+VejY0NnI4J8zCtPxnn1Jl5/xKV16UjFxQUyEko/ofCC0bwOTIuKgZZdg8IdqGwHSwERKdpmvxMbwHUbV2CbQwSl/fejoyU/ly5YMC1yuhMcdqZUlHLCFY=;
	25:HFup8dzc9HZ8DuR6YSZaQzuV72814FuesnJu5uEXw9H/GXUbi0MY5jg0X5T6KS9NIGnee9pHxYNHpVvkGYl5hgctaCqi1FlGrL4TNmg9sVYH+P1oyHckBXlwodzAfg0BPdPFZuteY+Ghj5iXcvjoduDg0VkD6bTCq8+fHReiejA45fQBZS7Ts+vn6mS6V8CYOn6XLxfr7C48Zw9gKkPwWqUQMEMoj6wa4X7eHfT03IGUj4k0Q0a1qma1fkqsbH1+IczDjL6gIwFMs1T6L4wffcc2991jkPIIO4YRg9nBHFK1s9YSLBA5cgXmt/1hDmnDL2IHW+aqi2Wlx73OTyQ0tA==
X-MS-TrafficTypeDiagnostic: SN6PR02MB4334:
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4334;
	31:t03aIyAF52gO/Vpx/i3bRZJEqsyyXpD0hfOJt5SvumstrYzqLFRledKXU4vwfh4LJS9fPuUwR9vfgcMOGhSZ6w0Jm2vwd6FkYmlvfv3EuO6jA7tH9Nvbg7duI2q7p49nYL57ZOIZQXwWIwz2p/2afMoP7AszagVZ6bYQ52a6kn7DYJcGtUf4LEjAxXYqyEE+ETpgLzLQX9k92Y2Jyq4hvIXWbgbQQqw7HZXkoc7JGRo=;
	20:hoadPHG97QZcFIN56pLTKo7mqPnxbR2HS2Tf5tg0BgUESSm+yUSmOU2DXJZRgrJb2Gdsq1/gxoBcXcAAWppEVqUKsdEYm/oLykPvIYq3Iu7eUhOwse3st/6PT5vV54FOgMqasBG/9bdhcTr/sg8EK6b5khcyEJauK4ZS62KPa85wTFx+3yh0Au9yU7EE5mkt5l22Ei//H0YU+Gqqsf8r7VXbNF8IL6SwoPVRl7lhe9KyqeiEex2rlfbUPjXvE+YbVzqPCzVkiXX28tUtzW4mYRGDyXKj4vZtsn9gyQq736oCZhddNFI4F+LPvIS2QvaOfGnboy4Bnk/EPzhoeC25ByiK5ycx4yenS9X4nw+0AyfhYudqVd30ijQOO2a1BIjZutbiUOqFkNweeIKf1WdCcly1FV3A74TBoYT5dYcv5eDmZ3FG6if8b6bO6KgOLBXesfqY3jz31vqRoOwdpmIs57qS+D+fu1Fp4oCWclzZEwmwnle410N1V6ynbCwr12UT
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB43346F30C13E9C1FF2EBF850AB3F0@SN6PR02MB4334.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(3231311)(944501410)(52105095)(93006095)(93004095)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:SN6PR02MB4334; BCL:0; PCL:0; RULEID:; SRVR:SN6PR02MB4334; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4334;
	4:Oq2k8VuKTnlopFitX3OA+ieyDyGBWsbPqTQZ6Y9+mqee8EVaUDXUUzrelpuLZc1jd9jvihZMMe1pCI4OTQsSy62zJWivrjaMvXL+CKc/Lh8HhmSqQXhFSg++el2+ppjZQYIS9qjy5s7gnX/qm1uewShR0ofLJpyZNma0aE0k+P6kc+M9ESZ4mQfYs/Ae9Sdn8IUK7Ffjuun5LqDIJwuZcf7LwtmBds/SbO29kRoJKVs/dHEIHLyCVNSdLuZfuWYYuWTuEkEVUlIYQBlFZiRoVybhpqqEy7hn8Qjk6KsAviD2kb3rhtUzBMUrYd7tKos/
X-Forefront-PRVS: 07658B8EA3
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN6PR02MB4334;
	23:jPQMG47sPr3OzGM/ZzKRaLeNBN/n4czUXRFURS+81?=
	=?us-ascii?Q?M+t+yXcxwrdVJcwOrWYNKKPiGJHpPa0FbP8UfGnSYbIENkz4vCkyrtV/HgSq?=
	=?us-ascii?Q?4Iu/+vaKZneozArTld1kWwgr6AZK+yxEIr0Cs/96apwpowQnaxQAxvTIBE+3?=
	=?us-ascii?Q?1MWkS8GnNkAKXHJHwMplRvb6zb9db1mo+hSiftepyIFZYc+7J7y1hLIrDAH2?=
	=?us-ascii?Q?MbIQB2U+DWGo1VGWN4oLiKeY1YSZ47t/+W3E/D0KQxd/ngs/1juAL6x5Q5uK?=
	=?us-ascii?Q?zgp5yYUibd7a5TvjpaTWUxnCmtck5ZbG8tpaR2kLXsBDy5Yv9BSozLubYjpB?=
	=?us-ascii?Q?cZmkSPFG1qDf/IzMaZ5IRjSqV2nxS/KM9Ai7aJmvRu7pm0R4B9UFrBwzEAEJ?=
	=?us-ascii?Q?twa8ymWGHIGvQz5SOC2WQApV0+8vdDOsPYloLqKBYIdwtX8MH30yeQyzFxAR?=
	=?us-ascii?Q?un0FY+gWbalRio7ejEG8PZlZqtO3lNjechHZSBvK0QjbP9HnsB8vt5BH7PYM?=
	=?us-ascii?Q?F3QKmPDJ+7T54KUX4lqzWonkewoPqpDuv2XpnaJrVHB62CKRqgVOYTcf26fy?=
	=?us-ascii?Q?7B/QKbUjmFPwV87fttEuthg/vYp6B8w8KLFJSMVuiVJfEz5h+252Zxf1eYuN?=
	=?us-ascii?Q?vo0rwsxCBTo7TRaENrGzS28i/Tnm6wkPHaLCNlomsaIJdICtGpUk+Q4Go60b?=
	=?us-ascii?Q?/Uh5MTWnq9JI0fi8NqytkpVEpgT11QzdV0zI8OPTInroJzNHqRjAyZsZAi+c?=
	=?us-ascii?Q?4XgW1R01ZlSoMM4Rp+0hjSuhyDBCBjR2zkgeQf7Skywbp3iby5pB4OTIvswG?=
	=?us-ascii?Q?hVPZB+nqM5A2kwVpttZKkbf1rok9SYLCco4RHh73CmQYI/ymLLy0F4tjKTJX?=
	=?us-ascii?Q?k7gMYkmGgiaLK4ukmu2ft6C38j2C09DZa8uNjdvVAEbc75MwYLR9z0xKT5Lm?=
	=?us-ascii?Q?ssvNqYvaRz1i1Da2J4qOkoTxYH5UR7A1b5zCpT07GYVOv7J7E+JzSolLOEXt?=
	=?us-ascii?Q?U2SAQn62ooImxu+NmkyFX8AI7NxcCt0R29ZLJSNLfaxlMyjdY5uw7kZfL5GS?=
	=?us-ascii?Q?vrfySWZ5um2EZTrP0Lzowp9sK6NbQnVDfkU+AHsskmWCEgsOZHxZSyRWW/hu?=
	=?us-ascii?Q?rnyB6QcR0KogVleAUEG8KTLeuQoR9Zq+rwai1+ahdKaQWJzZtzXHvXoVobAE?=
	=?us-ascii?Q?m1WYueg6IYTYBw=3D?=
X-Microsoft-Antispam-Message-Info: Q9IcaHtVnsvyW7kFlwAHQ4jzvj0jJ5zle6cUzHBPJXgtKiBDHlRPn27f3i8Xy3P+lVxHT//Wh6LNde1H4kLDMcBQzvGB0QpbZnFge1dH8wrVKcB15HIz3NAFEJHCGJFGjXSCNK1DTb1XYM/xQSvU49q2zg4lEtMwqKAqy+K8FNnUlsL/Nk6+Dud0kWNVNMPllAX/2ZdaOY/0BJQun6ALbLPSfiup0FihDJ/TPViF41n8wWmU0LGi7AzkeVJ9NadsonES64qffj8fUSrBKSO1c5cVYMvK4oeiCwI5i1gsnr6bt/ch9GYmYLmvfPstob35kCv5k5AfxqkoBbLUPKwNr6Adh46iDFNGwOkp3/x2Ma0=
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4334;
	6:xdxHztbXKe0DsAA9jNLhGnO4gmWgqxO/Eio6XS8+VtZqT3VQEFNSLCtZholMkEFEOi9QnP4xC3ES9v1jIfzfkHrkwhF8NVpLp5tIcWOgCGL68SWWBAJsWROKTVQO9FkKmkgPbR4ZkIUjSnVWss0mp3JPSXTuK+aTPzPU3kZEtZCKad0NMkiy13iSXBg2t9dY8LHGAlpZhDDMpJZPtTOxrSboqltfGH6T01kyhFQd8+8CMrL9XBb+YJRK5aKkR+gyS8CRZ3hUfEEtoX1FR0lNJ62nP0/c4C/nmm5ArxIc6+6npeGKqfod+q3vm0f8cqd05s/ZBEWYvvtUmMD4ilC2fuz1Uk5GfJJQ365TUX22wfLg4mOztjd3ayuSjvV8Z8QuTqLJjx8/2X7JFs6SW0+u6DE4DPJCdreNJwhmPeMcYKazX2dknbpdmOZGKiM2VFziUb5AeCswgqfhgkgUDby5vg==;
	5:4dkFI/brMNn0bKdiACJ/sLUVviDRG7Zsh+8aDixoo8kQ+D3hp42W6lHKvFgDLqHJJTC3NnFuRHkmg8YVRgAGhcRScmVKA4mMShCk5c8jWKBn977AR/87biTpjvHcg90NgHA5xnQlWdHenv3cXPc3qmSJBzZ7gSyDsKEz4AG4Fz4=;
	7:qdvxuJr0usMEawnsU3b2Ym3lkVgZRpaCxUa7+1ytyV5syMgfHVExGfkq4gairO6N+CYAbNIjSY7v7nc7ltt4t3xqTnStnN+imzqd+Es+s492sUGlcClCbKtYH2q+FNGFayhFZ8LkJmCjeUio+YpLg+C4vTd9riu2ESBaIW31HnpfZiCFoqRMSmBHzVBpo/iIEjiTaRcWNgnAuOLMpUTAbm7C06cocB5R/H38Ek+hx5m3VlbdvazpW2b+tV9k9Icl
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2018 11:00:39.4084 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1660acc6-48e8-498f-e008-08d6029e565d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4334
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.78
Subject: Re: [Qemu-devel] [PATCH 09/10] target/arm: Implement AArch32 ERET
 instruction
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
Cc: edgari@xilinx.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kO4PAIrWI27k

On Tue, Aug 14, 2018 at 01:42:53PM +0100, Peter Maydell wrote:
> ARMv7VE introduced the ERET instruction, which is necessary to
> return from an exception taken to Hyp mode. Implement this.
> In A32 encoding it is a completely new encoding; in T32 it
> is an adjustment of the behaviour of the existing
> "SUBS PC, LR, #<imm8>" instruction.


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 31 +++++++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 3f5751d4826..5ecc24f12fb 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -8887,6 +8887,25 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>              tcg_temp_free_i32(tmp2);
>              store_reg(s, rd, tmp);
>              break;
> +        case 0x6: /* ERET */
> +            if (op1 != 3) {
> +                goto illegal_op;
> +            }
> +            if (!arm_dc_feature(s, ARM_FEATURE_V7VE)) {
> +                goto illegal_op;
> +            }
> +            if ((insn & 0x000fff0f) != 0x0000000e) {
> +                /* UNPREDICTABLE; we choose to UNDEF */
> +                goto illegal_op;
> +            }
> +
> +            if (s->current_el == 2) {
> +                tmp = load_cpu_field(elr_el[2]);
> +            } else {
> +                tmp = load_reg(s, 14);
> +            }
> +            gen_exception_return(s, tmp);
> +            break;
>          case 7:
>          {
>              int imm16 = extract32(insn, 0, 4) | (extract32(insn, 8, 12) << 4);
> @@ -11144,8 +11163,16 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
>                          if (rn != 14 || rd != 15) {
>                              goto illegal_op;
>                          }
> -                        tmp = load_reg(s, rn);
> -                        tcg_gen_subi_i32(tmp, tmp, insn & 0xff);
> +                        if (s->current_el == 2) {
> +                            /* ERET from Hyp uses ELR_Hyp, not LR */
> +                            if (insn & 0xff) {
> +                                goto illegal_op;
> +                            }
> +                            tmp = load_cpu_field(elr_el[2]);
> +                        } else {
> +                            tmp = load_reg(s, rn);
> +                            tcg_gen_subi_i32(tmp, tmp, insn & 0xff);
> +                        }
>                          gen_exception_return(s, tmp);
>                          break;
>                      case 6: /* MRS */
> -- 
> 2.18.0
> 
