Received: by 10.223.159.74 with SMTP id f10csp4276717wrg;
        Wed, 6 Dec 2017 08:56:39 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbJFxwgso13TTKJVgZNOg/8WMnr5kHhygQXJ/+A2maq/Zm3NNLgwszACnlA4Z3Q3t+E6nJl
X-Received: by 10.129.236.2 with SMTP id j2mr12772113ywm.461.1512579398909;
        Wed, 06 Dec 2017 08:56:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512579398; cv=none;
        d=google.com; s=arc-20160816;
        b=M2Tqyj03HIdtQdqkP3xx+B8B5q1wmIgn7mvUUToiHYuDSWdV38r5q4dUL69wA1Tmry
         CHZcud6Fvl+HWn+mymXBPl7JPedZEQVq8+sQhmExVKMFB5lnY1IlGXL9EdYImolBfsZc
         ZcifvoG4uwUP1lhtQwa6P3KrsfZLqcsXZPpFDQUhRIp3rGO6bUPur4GR5W1JRX0+ictQ
         F7qStGKqvV2k4A6JYnGdQlUWTh8qV48WqJRfRWG9wdiZNNIGazoXccXSaPaQYTaSVpjA
         sTOW6PxPbkT52rnHF2uihaSOXAdDWYee+Q6wYby1IZeEtiDxS74zhshzAJWOYUVNf1EP
         049A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=9Lep0YacaNKj5+tZm6vT7g9CkRQswC+07942UupOa8M=;
        b=z64VHaxNCSWOZ83JVquZZyOXgTU4yGFSsH6iOSYopAuWKrR8R1t5+zWNOc1pOnNalY
         wk58tiQ0YXk4JIUqMPsrjbxEhUjCcfL/k1bV8h9GKCgwQ7tfsqOKJTHNfzmaEGghpE3M
         5nriAW3U/1tjAmedT1ftnm8eXTnBGlC0E+Cw0a91MwueaVOpKzEn1Qb3ckZMDoiHw3eQ
         tVRLDm6zNjPZ2kLRuIZtPS30yPLuQaTvTTcN+4SV6Omf5KLS7dbVFjzxxwRf2bt+s+g2
         5tfX2jzSJvOVU9Q83t4Je8ZsD7EWmuJ1w81FhX1siQglXDKNtjBcwRAHtCZyMzQfGSP0
         CYZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=l8OeADwI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z95si748576ybh.8.2017.12.06.08.56.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Dec 2017 08:56:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=l8OeADwI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56545 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eMczu-0005QG-B2
	for alex.bennee@linaro.org; Wed, 06 Dec 2017 11:56:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57847)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar@xilinx.com>) id 1eMczh-0005O6-Qm
	for qemu-arm@nongnu.org; Wed, 06 Dec 2017 11:56:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar@xilinx.com>) id 1eMcze-0004go-P3
	for qemu-arm@nongnu.org; Wed, 06 Dec 2017 11:56:25 -0500
Received: from mail-bn3nam01on0066.outbound.protection.outlook.com
	([104.47.33.66]:9760
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgar@xilinx.com>)
	id 1eMcze-0004g9-F6; Wed, 06 Dec 2017 11:56:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=9Lep0YacaNKj5+tZm6vT7g9CkRQswC+07942UupOa8M=;
	b=l8OeADwIAIbW2p2k7mqSi4ux6pJaaVyG2exy+l23P8uQ4WM7CRhffNuMZhG14ACGhmFpOpOYKvlG4y9LoTCejPjZ2iqz3tKbEtOCRUId9C5ij/s7ze+uNFHCbJapD8rQ97BlDS2dM/TY/4bVvXdBwFOaPNwZ0xsmXf9gEXMLqQs=
Received: from MWHPR0201CA0086.namprd02.prod.outlook.com (10.167.161.27) by
	DM5PR02MB3388.namprd02.prod.outlook.com (10.164.153.11) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.282.5; Wed, 6 Dec 2017 16:56:19 +0000
Received: from BL2NAM02FT005.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::204) by MWHPR0201CA0086.outlook.office365.com
	(2603:10b6:301:75::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.302.9 via
	Frontend Transport; Wed, 6 Dec 2017 16:56:19 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT005.mail.protection.outlook.com (10.152.76.252) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.282.5
	via Frontend Transport; Wed, 6 Dec 2017 16:56:17 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:40450
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar@xilinx.com>)
	id 1eMczX-0003aq-W2; Wed, 06 Dec 2017 08:56:15 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar@xilinx.com>)
	id 1eMczX-0004Mz-Qy; Wed, 06 Dec 2017 08:56:15 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vB6Gu9fU032033; Wed, 6 Dec 2017 08:56:09 -0800
Received: from [172.19.116.86] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar@xilinx.com>)
	id 1eMczQ-0004M8-Jy; Wed, 06 Dec 2017 08:56:08 -0800
Date: Wed, 6 Dec 2017 23:56:07 +0700
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <20171206165607.GB1971@toto>
References: <cover.1508261326.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1508261326.git.alistair.francis@xilinx.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23512.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(376002)(346002)(2980300002)(438002)(189003)(199004)(24454002)(106002)(2950100002)(6636002)(76176011)(33896004)(33716001)(5660300001)(50466002)(478600001)(305945005)(356003)(106466001)(81156014)(36386004)(81166006)(229853002)(83506002)(8676002)(63266004)(2906002)(77096006)(1076002)(23726003)(47776003)(57986006)(33656002)(9786002)(8936002)(39060400002)(6862004)(9686003)(46406003)(4326008)(6246003)(54906003)(316002)(76506005)(16586007)(58126008)(97756001)(18370500001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB3388; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT005;
	1:lcaDNxEC7Tq72U4UehD6DHt8JmFlMPbVf1mZ+qspUGCCjEXDvXb0i/xT43A/a6cTvGrUkygjqQmScpm5kmb0awh9Ihl1CIkhL6vvH+Cv5PGHCHX8Bfw/+lHNCyWz2jw0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd4c54d6-a142-4b30-ad42-08d53cca4561
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603286);
	SRVR:DM5PR02MB3388; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3388;
	3:UH3Ll4VVzWNi/huNCMS8+TOdJ4LUDWXgre17AdRkq2kKtNJiA+dxJ2BnwKxlu9nItos7x6fVBRF0CD1YzoZ0AhaK2vHbquR3xIhbX2spKUsqXJN568ogPMVV8d5jiKMeMjOpiHTMeEAg1f2lRsvwoXRcEYUdru9G7lNDaNudDPC3jklkj/M18ntmx/OI1+3vaXla050VM1FE1R7B1iyxUfyVqK/PApCfV+5EryEG9gjjSwYbKhvKRTLIteGP890s5vFijSPaQKPg8EUOEQsFZwdTeKM+YjSxcg4dDX94s2CTSgtCSlQsj2xt1TXL+Dbwx7ADnFkPu1yNMA31FNQ5etzH3A2/OaNT/bB/IWFFy+E=;
	25:2BuiAkS6vFPhmA8kkMhjU1mwcwk8jPj/XQuoLDivNjJi/2gju/uooHtfmzEc33Gwd7EbhXQTLL+t4I4uwubsVTYOuELgMWf9AJh3yznsMlQPLH2xngPNEOOjnGCf+eUsXHWu2tbrgGYUEJA+F5QucRA7tv63uFIEHYvv+e2SSkjQ9XK/Z1nOI8gksUVOCzPREj/oeXgYg+lr5SCqf7kTvoq3DzAO9AxHuV38IPcZUWGqYQ1JbmzKa3ioTgaFCB1fJ7bldmKRfkbMCbns5tZkkxCen1sOwVQL7R4mjC1T/F6bq+9U4VLw8iJuvIn6LXdHCpQAi5KPsHG72a2Nfcp5Dg==
X-MS-TrafficTypeDiagnostic: DM5PR02MB3388:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3388;
	31:EUvy9+KsrXlOvFyHbA6PFW51qGIMz24ckx8z2VvmU6n4PS1hflYfHgwlJ3nq4AD4FLo4v051o/gUa/8eqRWDimit1SKLfXd6bg0ufcbt5lKQ/XPMY/1KhPsKXRuDTKnf2wLiYTyKGkwywQtX9bWSdQ3GBVNgI0RjiFsYDBw5Kb6Q2RPPjVU00HBog4ZvwK2sAecHMlmnwsrV3xxxejyPrHXhp4Tlh+aqB+V7UX5CECQ=;
	20:LFJ6qRDRJhnFqB7eSVhniNAxm/bdjKzqEk1VJvglUj1P06yTZ7dqZPs2L5uYa1F05B1mDBPtsySIG77u0Rtq5JS0WVbFIOBBBh30Ut7L+Ob+s5vhl/mKCGuuhJW/ccr009JY1ABRFJ2YtZ6kBKLPT/geTq9Q2hkmD+r6xcsNNWNpySRUUz3Ig1pgZmsKA7BHmeo9a5GpBG+hpLb1WEcdweu3sMEjJMv6ykKptt0NZ4VKYTmI+FKXSmidV7sUVjKJfNtfiERxWgYtZiE45SmfptOjcHSEUAjzgziHgBW4TAm0HPEaP6rpNBhOZOI7K4PDRMW14udwJ5ygw/tkw/zZOzBqEKthr2wzScUAa6W1UqAN17tXCYVkP0N6Tb2sGNmunkxRBDeqFcz1eE1rQn5J8fjElyXDDxC2KGuGXY8Cop6/LMIMnWErL1C31ItbA1Tnva0wRP2DN5LK9ipkFujdWeqCLOWrWou9hAAY39MOWkzFEktP3F+voz2zW6EnzsCy
X-Microsoft-Antispam-PRVS: <DM5PR02MB338867976F5ED635803927F2C2320@DM5PR02MB3388.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592)(21532816269658); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(5005006)(8121501046)(3231022)(3002001)(10201501046)(93006095)(93004095)(6055026)(6041248)(20161123560025)(20161123555025)(20161123562025)(20161123564025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:DM5PR02MB3388; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:DM5PR02MB3388; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3388;
	4:VrELCoY6HQNgd9YPJQ2MlRTzBE+blezp7EbPRqv+IjL8yPUq81JhmQGH+o1RW8avgrAK9UIcXonFvslfFfcPB95/Bq1Q+MS7FQ9X2pAObBQQirKpCYbagw2oEnypHFW0sTmAWKq/w/r1vefDGpgQ4twPrwxHgo4pJ+6Xu7XR3RbX/EG1cVKhesBCS2MR32MCJRts0pXyr/ADWMnmMBW+zNCPnu39RQnbd8EsNsyVJ6LqHOBPTq6c+C0EKWnBUvS4qD70OphqaadQMYbyMG1//LXo3QMJvC9v5Kcr1PCm82nFkc8nFJ1kXBiAn09NLvr6F+5Iibea8YP8CnVxttM+bM4dkDM89SXnjb3yUDI4rO5QAB6WBbNFNEvi34ww+uBY
X-Forefront-PRVS: 05134F8B4F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR02MB3388;
	23:b+nLUoCPdWCoAw3T5Wyh4GfesBnFqp+g7XCRH1hvx?=
	=?us-ascii?Q?Okfnio0fKnx+XhuYLyWV1XR7XlQFslVr8FG5Z7YClk+w4sxOAbxU25uwDDtt?=
	=?us-ascii?Q?m/JeKkRFZsaN3Ng5k1m7bQtfh5s4PI0LxasC673uIyvWc+dGOvGT/Nolzp7b?=
	=?us-ascii?Q?cpFOt6sDJbnqXxPU2nqSvhYiM914jh8cTROvpsVro4EZJRVPgg18Zx8W9Ssb?=
	=?us-ascii?Q?U1UUV51jPVjuQSITO92PmJsN77J61+YlnA7OXAgOYAEGVfhgFMAVaBKgkmSj?=
	=?us-ascii?Q?rZFJsjCSdEq7E5SeIuuUhKdnrAjr5AYXtIalsQUdl4/NrzVq/H3SXx+m+V9G?=
	=?us-ascii?Q?f2f5z8uwCJJ2Da7SsgfaFYtSFbGm02MirJeWyGh/Rf+oq/yXVwG9UOwWiZZ1?=
	=?us-ascii?Q?OsRyJGRkBKVALrN8JhoiuMt0hDSHKdB/MZ+PW61+tUki/6Sgvb8DsrssG3tu?=
	=?us-ascii?Q?IJy0XAgM93cRLpt3y6e+ixF+z+L0NqF8C3iRxaXxl0R8o4fNAXixJnc8P/Cr?=
	=?us-ascii?Q?593hw3BZUKq7GFDpTUAlwxgbUoNJmaLL7AfgWJPLXSgFVdw2MtQLrZ4IX921?=
	=?us-ascii?Q?pO614kd9e3dVTXDAk875PluhYHt7jXhOiOBUGKrgkin7h6azveRpcRF6ldgi?=
	=?us-ascii?Q?G1mT99MyJ/Npo6mr3Wu6X9NJ8+h97pdgoGw2G/PpjBnuqgQLY/AsI85GeiFm?=
	=?us-ascii?Q?Yz4oIR2vMeS5WYnOymMSNTPynB63PrSemq7h3jLBSfOM0mtmHSnzQR0n32cr?=
	=?us-ascii?Q?paB1d9oWXmGVfajBeJH30O/YXanbb01XtyB5Y/8yIFHEGFMjq1tmf9bzODLh?=
	=?us-ascii?Q?/Y9p1WoRh+79TZZzmdDnGs68LdRlBoxtxkPNFNicRhJuUBWTeY656TMrk6X4?=
	=?us-ascii?Q?1z7U8E0YtgMNw1eMZcporSbuukBAv2h/+PB7CtndCJjnHgx1nHCN+x47rdG4?=
	=?us-ascii?Q?bxvpwk01OnMZ6lrpA1rLOiT32lRQ4u0ks1MJ4K4e4pTO4m0StmSAeV9q9ILf?=
	=?us-ascii?Q?5MyLis0n6ITa1KwAvm4dvY3JGKRB4OZYJHGUqFomrAjg1se5H+zxKlOdsOyR?=
	=?us-ascii?Q?f0/bXM5rI5pjHnhu2PidwqeBo2HQp0jzKBiNXIKmM4EFDYkaZky921pyZwwG?=
	=?us-ascii?Q?yfjbJ2sy3cfE+fWkgaM60YvyTugRkZxQq+ZHmXKEEAl2T2QKU7kM01s4wwrx?=
	=?us-ascii?Q?v+zkOtcIZuAipqWcoroRzJmx/i5eW3Ep1DX?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3388;
	6:gKc4qx3/0cECX5XVkyoVxOzLx58crGGIdYXQdLahsx1VJtfSM8ui1gX1D5G6TJAQDWMRFargcOY1dPCgHCNBGC9jXtnJjPT5z2VdzFp4X+EqMr4fra/09pSeShQ+vEKokFUPEVZnnRHBL1eUXjPXXiS/GkCRw6NlcrYNqY/2qkS0KhWB0rgMcEiH1rxCl/UlVCOd8nO+aEItvMDDA5r2HSWkqze/cXHWXqcQg5mlnx7DjMYpia5miXLTnRxQIJgMCK34kjl/mZ4p8N+P9s28lmZ9W3gnhAU2Jfz1C3la8RNFhcW9Qsrz/puSoPrzKFrUvIt8x2IH4QTFhqLCDVAe7ceMhTzWb7DH6uzvKkXsckg=;
	5:0709nEkZnEW3v3JcC9FyCu5+tKxVRmQ1fVm+T7CglZU7tK8JBXMDn60j6HsdRxYLWQCgho1mWyY7ATF8RN8Vub8jSpNfMEoyyOGYmAyAtpRKSkkUNrAUNrmHrOqv+MpdmuTvvr7nYCYo2Kn3GqF3XEbTpS7zxUOhY8/AY2ZAC/c=;
	24:3Xr7LwLvaPNnAdEOxnY4bessg6Gc8gn5MlCXG8WKFk0PgjhGf5ma9vHSPqDWslxMkuYwT97kZ8bz6LK0WOfyiIVOM/iLg5Yh/Bo3/Un++AM=;
	7:jXa50ZGqjnowmUXeKLIRoJ4Ai+j01GwWaC5Hlnotr8Zwe+jRjDOzb17fdPUynUR/wI8wFOgoPUGA1HmwtqPct3tNZqdyRhNHiSC8plT+jkP8H5twjuoZCJNYYgPrn6q/fKR+UZ8IZmSgfm1DrtOmNzNVeAGBxgoV9e/2I5rN9iqZMuftMJIDsImBC8XC0NST/mpSpx7m6r4ouBf9wUZwEOCY3QOAl8ETtPf9cEbF6+B9dFsTjPaTYPhFbukuNSrJ
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2017 16:56:17.2101 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4c54d6-a142-4b30-ad42-08d53cca4561
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3388
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.33.66
Subject: Re: [Qemu-arm] [PATCH v4 0/8]  Add the ZynqMP PMU and IPI
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qpcvue1obVdf

On Tue, Oct 17, 2017 at 10:29:41AM -0700, Alistair Francis wrote:
> This series adds the ZynqMP Power Management Unit (PMU) machine with basic
> functionality.
> 
> The machine only has the
>  - CPU
>  - Memory
>  - Interrupt controller
>  - IPI device
> 
> connected, but that is enough to run some of the ROM and firmware
> code on the machine
> 
> The series also adds the IPI device and connects it to the ZynqMP ARM
> side and the ZynqMP PMU. These IPI devices don't connect between the ARM
> and MicroBlaze instances though.


Thanks Alistair,

I've merged this into mb-next for 2.12.
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Best regards,
Edgar


> 
> V4:
>  - Rename the ZCU102 machine to just ZynqMP
>  - Rename the PMC SoC to "xlnx,zynqmp-pmu-soc"
>  - Move the IPI device to the machine instead of the SoC
> V3:
>  - Add the interrupt controller
>  - Replace some of the error_fatals with errp
>  - Fix the PMU CPU name
> 
> 
> Alistair Francis (8):
>   xlnx-zynqmp-pmu: Initial commit of the ZynqMP PMU
>   xlnx-zynqmp-pmu: Add the CPU and memory
>   aarch64-softmmu.mak: Use an ARM specific config
>   xlnx-pmu-iomod-intc: Add the PMU Interrupt controller
>   xlnx-zynqmp-pmu: Connect the PMU interrupt controller
>   xlnx-zynqmp-ipi: Initial version of the Xilinx IPI device
>   xlnx-zynqmp-pmu: Connect the IPI device to the PMU
>   xlnx-zynqmp: Connect the IPI device to the ZynqMP SoC
> 
>  default-configs/aarch64-softmmu.mak    |   1 +
>  default-configs/microblaze-softmmu.mak |   1 +
>  hw/arm/Makefile.objs                   |   2 +-
>  hw/arm/xlnx-zynqmp.c                   |  14 +
>  hw/display/Makefile.objs               |   2 +-
>  hw/dma/Makefile.objs                   |   2 +-
>  hw/intc/Makefile.objs                  |   2 +
>  hw/intc/xlnx-pmu-iomod-intc.c          | 554 +++++++++++++++++++++++++++++++++
>  hw/intc/xlnx-zynqmp-ipi.c              | 377 ++++++++++++++++++++++
>  hw/microblaze/Makefile.objs            |   1 +
>  hw/microblaze/xlnx-zynqmp-pmu.c        | 204 ++++++++++++
>  include/hw/arm/xlnx-zynqmp.h           |   2 +
>  include/hw/intc/xlnx-pmu-iomod-intc.h  |  58 ++++
>  include/hw/intc/xlnx-zynqmp-ipi.h      |  57 ++++
>  14 files changed, 1274 insertions(+), 3 deletions(-)
>  create mode 100644 hw/intc/xlnx-pmu-iomod-intc.c
>  create mode 100644 hw/intc/xlnx-zynqmp-ipi.c
>  create mode 100644 hw/microblaze/xlnx-zynqmp-pmu.c
>  create mode 100644 include/hw/intc/xlnx-pmu-iomod-intc.h
>  create mode 100644 include/hw/intc/xlnx-zynqmp-ipi.h
> 
> -- 
> 2.11.0
> 
