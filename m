Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp189787wrw;
        Fri, 16 Nov 2018 02:12:11 -0800 (PST)
X-Google-Smtp-Source: AJdET5dC9ktZQJGBNFQUBHZNjuuYFnqklyUZ66+j5LY0PBEqq8Fshb/3AO4KEmsAkNDuviI04H3R
X-Received: by 2002:ac8:231a:: with SMTP id a26mr9805425qta.40.1542363131776;
        Fri, 16 Nov 2018 02:12:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542363131; cv=none;
        d=google.com; s=arc-20160816;
        b=BoZtc9b3SSvO8/Y+ShYKw/iIjPb/EIfc7dsnqp5Q4hBop0c6OkhkJmDQO/zsROr1dB
         0QyYzvfAQr+tPeQeF3mhtsgQ1WOqZh4ZNudpFKqNWpf+sGfQDDEC2HAL1VgoGLDhBxTT
         8fnq/+reJ1k6sHLrHPuXRXkCUmeCF7wJHweRgeGXHi0UFigYbn0mal/wEVsG/uk49b4K
         vzV9I/PTpZb45YjUdlX8NqHZpYX6kwu/tg3jbdUInmkBYYSVjWcxfBO/pyVgfDpnxVn0
         eVJx/moMRxUfXO49/5pbu82wcuMNcYHKYgMcWU+Ni2D66xMLNEQjXQc2lYQIwfmVmkuX
         cA3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature;
        bh=a61qKd3/xq2UFOxnFxLdA4P63nhzm6D2KPgg/B/Jm4Q=;
        b=T0qXYjo5bw6PNayQ8BbggKHojovkkPH/V8h5H/0dve7915Nan0p8qizROU8/xrUCa1
         4ndcQ/n/BlO71y2oOcDK2AOpXD0v0s8Yb9fQOSkZx9HAuoJP7Hyz3ZeUD4CkX2DXvvrb
         twgtmoweR2gbWk0fe4IsQ1MHH8aY+76TzoFMIXtXGr4EA422RpvzyRzrenbNn2F7Q6wq
         rbsoeskqRIURdYMwg1ntT+mUf3ZrjkNk9rah1BIsuf7H8zpAt8wW+uy5zr1HsHfUvXI2
         FD21V1TAINkIqggCMsGbeRn5XEDp0HzjenQ8kQA84N0PraMtX/jnWAuHhwgsB+iQ0ceu
         VL1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=PUkgveVF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z12si5885378qts.351.2018.11.16.02.12.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 02:12:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=PUkgveVF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43790 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNb6h-0006vB-6G
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 05:12:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47015)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gNb6U-0006uU-GD
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 05:11:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gNb6P-0004XY-KK
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 05:11:58 -0500
Received: from mail-eopbgr710072.outbound.protection.outlook.com
	([40.107.71.72]:3936
	helo=NAM05-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1gNb6O-0004OX-Ty; Fri, 16 Nov 2018 05:11:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=a61qKd3/xq2UFOxnFxLdA4P63nhzm6D2KPgg/B/Jm4Q=;
	b=PUkgveVFNrPGVxLlfzvM6gLolvTiR1PrYk2BFQJclY+XbKDInjM+GPigJxX9THKETNbJDRBmIgZVffVY6GzWPyjOQcMDcwlyc+d/V9VOzwUChHgIDeFPkw/+A15zdjzbWri84w7+3e8wKu4ShxsWpKtm/PRH4HtvTQItw6ka7Nw=
Received: from SN4PR0201CA0008.namprd02.prod.outlook.com
	(2603:10b6:803:2b::18) by SN4PR0201MB3517.namprd02.prod.outlook.com
	(2603:10b6:803:44::15) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1294.27;
	Fri, 16 Nov 2018 10:11:44 +0000
Received: from SN1NAM02FT026.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::202) by SN4PR0201CA0008.outlook.office365.com
	(2603:10b6:803:2b::18) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1339.21 via
	Frontend Transport; Fri, 16 Nov 2018 10:11:44 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT026.mail.protection.outlook.com (10.152.72.97) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1339.15
	via Frontend Transport; Fri, 16 Nov 2018 10:11:43 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:51391
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNb6D-0002wl-S1; Fri, 16 Nov 2018 02:11:41 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNb68-00075g-Nw; Fri, 16 Nov 2018 02:11:36 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wAGABRsw023482; Fri, 16 Nov 2018 02:11:28 -0800
Received: from [10.23.116.79] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNb5z-00073t-HS; Fri, 16 Nov 2018 02:11:27 -0800
Date: Fri, 16 Nov 2018 11:11:26 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Luc Michel <luc.michel@greensocs.com>
Message-ID: <20181116101126.GV7447@toto>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
	<20181115094207.22846-13-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20181115094207.22846-13-luc.michel@greensocs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(396003)(39850400004)(376002)(136003)(346002)(2980300002)(438002)(189003)(199004)(478600001)(81156014)(97756001)(5024004)(305945005)(46406003)(9786002)(9686003)(8676002)(4326008)(6246003)(5660300001)(6916009)(356004)(8936002)(229853002)(81166006)(50466002)(58126008)(16586007)(316002)(486006)(54906003)(426003)(126002)(23726003)(36386004)(186003)(1076002)(11346002)(33716001)(63266004)(476003)(76176011)(336012)(26005)(33656002)(2906002)(47776003)(446003)(77096007)(106002)(106466001)(18370500001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN4PR0201MB3517;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT026;
	1:il3vAkLlis23XUO3JemOS0ETQpvOPkwn5TsieC4X10gYBtXrcaRLjxWIj7/C29dbS7+Ycp2C1LBfFrDegSEafQE81G4YXRPXfRFRzgNNTaiorA11gL4eCRMFvsLOe1zr
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: defa4c3d-8b7d-4ed9-3b81-08d64babe8f9
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4608076)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
	SRVR:SN4PR0201MB3517; 
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0201MB3517;
	3:J8EaJfwK5oqcycT0RXH0uXvp4I8xOLKf97drvpcOkMh2o1r/AHk39fuurN9uyDJ4c2EJZdWeRFgjxf9aoYEl4DptP417Lh0LC+j76hmdQ/L7NTBObqQH5lvg60d5sMQYuzd+5GYW9f5P3JLUZV3K2ccaatBB71+n3okM9tJsM+PKO+J5VblmAoGjOAT4nrl5e6G6QlCzYSyR26cErBjs8shkPM+xKuUaeuRzfR7AGKZdrii0+/oat6x3dPMzOIXtViR0cRsvQSoLWONoIfH+buSLIFFPmGPcL1Tqwhuvi2KQ8k1aUqEXE+LoR90IYOF9fnE2/DCAOvyHbPjpQV5xxb8IMPI9YWn3Xy9ayXuy2L0=;
	25:NkK4tR2Up1dJC7XG4kcdtluedqqhC/HgslZshHL9SarK9idAohb5/1cBqqBO+iaclMGnPnQ9T8FIhV7bhHOLlxif6Ve1ay2952nHIAG4LcAoisAzzyoT8VxE+eOAcGeQsptoKq8USiWMz9/JiE0vrE5K2Oh7OGoa0om57KGC0jUbSf6NgTE/vSd/7cFYcamCnMDKUjFRMqvcAY6EJtUvndblwf7BNAuHpONceNLFwWGI4YK8gXst6SGPfwXb2H7rOH4n1qyo9DXdc41l/adcXWKfeP1d3/sCKgfD/sQXK2E6nY/z3SAkfe64sYgk+ZJlU1G4LHqNMkB3kyls5oTzpkLJGx0SihG9I12G3E/Dzxs=
X-MS-TrafficTypeDiagnostic: SN4PR0201MB3517:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0201MB3517;
	31:RoauT2CWBaWJWzrVPZAuGawzsh2mQvN3zuiB72V8feZZaWmQzjEKRQN16AyaH9UN+Oln7D9ZSyZ+eisFZRZpWQ9Umu7hlkoapGeniJ4DVtbU48UcTxR2JKV09detQacNXJJ6W+4adzJPYXNIoyAOoz2bcXOeWyu6moafqKwXW/euw4b2/ZqpmUSmA3+MvqJr93mSBHTTeJJaVm/slABVQ1ipiqDLfsLbaw1LelnJZog=;
	20:oX2RwpIX3Owr9UDJ6hIL5Xs8EvUUFHK1yThmt8lKF7IGta5V2Y3107jZmJfjs1jZMwR0eDTXWe7aBfx1pWZS3AmONzI2xeDhmpNp1RJNzjNVBsyXGQEND+xpkbnxS+BjTSklkw3GZ4pVRbaeQbcpZRUFEFPRHR2Pjhkht9uJ/ica2jwLY6LIp8et4kxbC73f/SwpfoqygFIlJEXelnX5F4tNxwLiUKTmqwNTQ+KtUhAPiwDVV23v8Ybdj2F/rTharvOcMBE1GKPBmnkgEtA/rHeJD+3HLQFSMji5c4OZ3bHaJ32v2aBb7/nLN708MB6Vq/hVzXn4IstwdncuUxKNB2CNP2x9L/Mc7rETWxYwyNk1lQ3lIa6UtvI7AT/6FTYmgAn9NxDHnOUbexBsp5P1gb24Nyd6NrAmghr+reUcFXGbuWp6re9hpTb75Hyyu/K17GzY6ouGaNQT4jg5Zud4d4FbsFdZxP6Iu65lrHUoH5H9wPsjjSiQecVcbCZE3+YP
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN4PR0201MB3517E93F7339AF8B7618B782ABDD0@SN4PR0201MB3517.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231415)(944501410)(52105112)(93006095)(93004095)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:SN4PR0201MB3517; BCL:0; PCL:0; RULEID:;
	SRVR:SN4PR0201MB3517; 
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0201MB3517;
	4:TVUT/CGNmr8sVZFju7blslvwlBzlyDDq39Y5258o2wT2heF6q5YN/fW+UoeXO3bLyjM09GEoBcaoSQMZk74dbQMCHrSbxxMp+KdmpMk3tv7e3yBQ6dTbMXYheLp/MCfyqDzPK0FC0TvaVD2hDpQ/qY2yEKlTM6SJDKReJuJQY+Ms7tFMconQ8DJHi4pAx+XHCPB8D4AI23mWgcFJO4vmAuskaWv6kSv7Cpa3bWFj2DEg7MDqVZrpSfPlgWelkdlJt5yLGlJa9m177DGDiT3EAivoLcPGQK7PmZ1FnNINggIdlcXibchzXqzWYXd2OUad
X-Forefront-PRVS: 0858FF8026
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN4PR0201MB3517;
	23:cJFTp94qfqw/UYbD/lpEiasxsY1i6vmV6IqZi0F?=
	=?us-ascii?Q?2XerP3Odi/GI2HStj7+J0eM8HbBc95u3BP9eT8FtabGc36dGTKiynMJ+SU29?=
	=?us-ascii?Q?FK2BirlZXxVf170pebU3NTYrhWNiAYKRXLKNd8/LvVy7gREEe81iBG6lJQff?=
	=?us-ascii?Q?aLj66GXViW3zJzrQMu9ZiX1K/wZaB9P//Uy8vH0D1Kk+ypnPVHlhm5OEAs/O?=
	=?us-ascii?Q?WGnyep+sA6tHRb/Cb9IWQheRXc1GpYl7XKd4tklGI0SwfTow778x5PrAUKGI?=
	=?us-ascii?Q?ssOfHQbfXt4KSEVes9enPEYE7zSSTiv/5qCxTq6pJQlqiKN3NeuFi871NE8d?=
	=?us-ascii?Q?sqjceoQ7foOY6F5GUT5Z3DeX3YDgvyip9ccx1ALuNBsC1BX3PuZpNgiM96rS?=
	=?us-ascii?Q?s8bDe37CPpaNc0Twv1KjATRUo+0t/nJjIcHhOB546bTEfeCdsyAuYs60Hvoc?=
	=?us-ascii?Q?BqREfkw2QpltqV+4ZyirALTQq6ImWSi5NCH3JlN/F58EF7KdWY1pp4AAtf/o?=
	=?us-ascii?Q?iZrvHDR0qnochUZrQCJUECZudX7nmG9CTHM26pVuXbboDIeGn7rvMZI32AOm?=
	=?us-ascii?Q?ZaFuSQKgRH69i41cX0Dyt8IdvPNBz1hX2BFO2oX11nxaiEncW+oSRLKcWroB?=
	=?us-ascii?Q?YcRf2+SZ3apdQNj/jHWCoYbC8zKHKcCG3e5CqLSCQ7O0X6E72Glty7K/JVGx?=
	=?us-ascii?Q?980cS69Q66Gd2nqmoev2ua9iC3bD7139veZ4zf0SKMyRINXdgpwIjLEN6Y7n?=
	=?us-ascii?Q?Q8S+tQxRofa+ks1Tme8eGTUtemGHGm9t5kDh1WKR9xcVdOqT6BjBANGS/EwH?=
	=?us-ascii?Q?2v2FyTdEzKXQLk3KFzYmmin6eD1eFF31uLlLiYnV96CJfb5CuNjCZIOn2/mk?=
	=?us-ascii?Q?GAnkl6cIqHcSoRSQTXgjeK1EIzie7x7CoGFoWSPH2dfs07Bx1wZXTukWdJp5?=
	=?us-ascii?Q?gB8FBZfiOb72JKlECUAwU0YS00BCkWWwOHNYfoHMTEhGfUqO9zMxY8gQUddj?=
	=?us-ascii?Q?T1iDbRdw/ZjXUyyI6hC+iai25tBd9zysxh0wpKSk812GP6MMjUpMgqWxpaFG?=
	=?us-ascii?Q?ychLhO1NHrPArUkNnvzo+3KG0FFaHUkCGr+AkT2aAIfJRs+x9uCG9a+pbl2Y?=
	=?us-ascii?Q?mjg0VJC6c8nyMsePJlukzLYpSIDXFdtJUp5pn4RTboqaUOHnEODlPT1O/4rO?=
	=?us-ascii?Q?i6yYBNoWuXPW6ICJtatxiNx0rFu1sxdBz1jNhvK/v56IULTY3FX7cuiKoUwQ?=
	=?us-ascii?Q?qhraIyiVsWVmxkxZXnV8=3D?=
X-Microsoft-Antispam-Message-Info: 1mwOsAdlQgGhJ2XHe0iTKPM5/zmQRVO2mVfBXAAXVYobW2owTRBC8gwWAvPIiouj22NtABb3OxWI+0UHEkRGh1GWG2f/XIm8VZCzv1DaGPKjORItMMP4R/G77ibk/PxcbXA1DII9MNsODFNbG4XJz7ydH9KQJmZhSDlT6F/wjRtDH32vfHraiR3acyN3VYR55DHBCVuHEl1kUys2ae1gFmWEklYVbiyDyudd9z+6DyaMy68nM+lgaMVTXcmiWY/8QMS/2HPc1zJO4v+kNwYcdx7QRdKLn0sPPlEwMNX6eG/gytZdCX7NXnS1oSsjwBvYstmXKUmbx1apqa0Qm3xgfr4HqJqZhD6k9d7GBTDQOYU=
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0201MB3517;
	6:4Tobfwa1Nq8TUCWOSWgVZKBhDEo2OcAfNdJQSYOnJCqBlJSM/vmxhWmSDQAc2BoiFnMgv5POj/9RUmOyvO/4TbzXPDjJ9sXgPPXEVI7PUvU4UCiy8MJ9wbcCtbgfB+ktNOGfUb3xPe2itDHfZv4zfTP45/Aft0gL+94CK8WM8W7B+0PNkEtI9C9r5/hCkk5zmptHx6ww7iLrE0+vyAyj6m/OM8scxKIJLOeh7K0bXkx1yo+kbeLAAlVqudsaTsJEZcmeD5Bue4qIHLVLlmsjX8zmXWuFLr1APjVSzlJWoXjrz41riDipVhe2kvYf7MZqI0rqGpJx6Vgog50KXi7icND/Ls/7LjocCtylVlbYg7riu1nE2NK5/ke6kb/Ka1kypr3vKh8w8RrhSllCosvA4y8rTlzHo19bS89cHRtVF0az1ziRi3NoED1ljR7oMT7qRk/cmGPCvbGbCcaYdKbzog==;
	5:nF7he1ASHdNd/RbSa4xvYdaHJwStYAY6qn+9gMXt/UdtA7S+vSiwT/DvjkqldD6Ycy/2ihDyQq0cyuWQ0ZE5VD5jfCq6QaDFiEqWWgI9acA6tm//9GOcNUygrI45lcbydSnAcIpyIwGqkK1S1vdAhLAPrZE7Dut3aXfY33jRLxI=;
	7:LMYZY5N/ircqvj4UfzhMQ23hapRlSEOEJ28l/TRDN0a0EEJEosvZwY3bja2Fn+kTF8K1L+UixKXEjUlU182g3M+Id9cjWzlbgzOEdXTFxzPPavuSf20hp7o17U2ou8efXRrEWkO7VkdfVFjt0YexJw==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2018 10:11:43.6048 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: defa4c3d-8b7d-4ed9-3b81-08d64babe8f9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3517
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.71.72
Subject: Re: [Qemu-arm] [PATCH v6 12/16] gdbstub: add support for vAttach
 packets
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
X-TUID: 0rPnphe6cOig

On Thu, Nov 15, 2018 at 10:42:03AM +0100, Luc Michel wrote:
> Add support for the vAttach packets. In multiprocess mode, GDB sends
> them to attach to additional processes.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  gdbstub.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index ada53ac559..0427d1c4f0 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1340,10 +1340,45 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
>                      break;
>                  }
>                  goto unknown_command;
>              }
>              break;
> +        } else if (strncmp(p, "Attach;", 7) == 0) {
> +            unsigned long pid;
> +
> +            p += 7;
> +
> +            if (qemu_strtoul(p, &p, 16, &pid)) {
> +                put_packet(s, "E22");
> +                break;
> +            }
> +
> +            process = gdb_get_process(s, pid);
> +
> +            if (process == NULL) {
> +                put_packet(s, "E22");
> +                break;
> +            }
> +
> +            cpu = get_first_cpu_in_process(s, process);
> +
> +            if (cpu == NULL) {
> +                /* Refuse to attach an empty process */
> +                put_packet(s, "E22");
> +                break;
> +            }
> +
> +            process->attached = true;
> +
> +            s->g_cpu = cpu;
> +            s->c_cpu = cpu;
> +
> +            snprintf(buf, sizeof(buf), "T%02xthread:%s;", GDB_SIGNAL_TRAP,
> +                     gdb_fmt_thread_id(s, cpu, thread_id, sizeof(thread_id)));
> +
> +            put_packet(s, buf);
> +            break;
>          } else {
>              goto unknown_command;
>          }
>      case 'k':
>          /* Kill the target */
> -- 
> 2.19.1
> 
