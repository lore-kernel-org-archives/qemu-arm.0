Received: by 10.223.188.70 with SMTP id a6csp1499468wrh;
        Fri, 1 Sep 2017 14:04:37 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb69hrWQ3Br05HXNnnEijerQNk+lzYIvren2IHD4FXhdnxsNFBWvQ/lWOY+/Wyspl9tjW4e7
X-Received: by 10.200.63.226 with SMTP id v31mr4977328qtk.214.1504299877788;
        Fri, 01 Sep 2017 14:04:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504299877; cv=none;
        d=google.com; s=arc-20160816;
        b=V/8sgZWdlSBQhW9VUzrwCUqUELoBb5NYWTX2TgraeERfzXZWzU448FzPo8jio4NM2a
         TWXvwc1qS2v5dR2DRyomqe8BOwP3iFil6W6o5C4iQFTcoLSI4wpav+tuO0eZKb1S4mZD
         26B7udgAiTlXWRWcSnAMVXP2JD7rpUoc+aSVm9kLItyO0GIR67on4f37HX7HkI6isE1l
         YJlEmjud+gVSiZIvlXdiABHi0J7GIAeEstWWvVUoBEU297Htg3vzGm0Q2JDO0ExKp9EJ
         HzoL0jDVFRyKQSKKoWyDSAIf8TC7CJIpX/OO5yxtGN8p5QlQ7MeJu1Pd/CA46h/1LF74
         g5ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=r/oCzN7daSCrEzmA/ntMi3DWADu5eCpF6MxSxjE58bo=;
        b=bj0/HXw9iMflr4t21j55Z4ZgjcTPMfW/VWlCsg6JdgpBElsjudkWtj3Qko49B34N+5
         sDQObilnSDHwUb/o9OMd9D7EqcrFLizXP49sZvKgyrbQjDMOPM9SUnSeSU7rxOKHJlZA
         0cbWEIi1fAsTEcps+ShoCidfgkcO0kamHLwBEZ2rlMcp3seUtB9lTSf2YPmnuM0eLoXQ
         b9/rlnbhXiFzRd6VOuCudhDLQs+O939xpVMPgU6IYfk1i7JeGK2hLZAmPGTA93lrGoJu
         fZjOTEmNvBLNg8vjl+d/AzEMqGCLesjb0UQrCUK6NvCwlqucva5nAjTlR0hKR6sjjzdD
         OESQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=mEma8X0Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q190si10885674qkb.430.2017.09.01.14.04.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Sep 2017 14:04:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=mEma8X0Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60598 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnt7D-0000PQ-CE
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 17:04:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52699)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dnt73-0000Lx-W3
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 17:04:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dnt6z-0006ic-1N
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 17:04:25 -0400
Received: from mail-dm3nam03on0066.outbound.protection.outlook.com
	([104.47.41.66]:35517
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dnt6y-0006hY-OD; Fri, 01 Sep 2017 17:04:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=r/oCzN7daSCrEzmA/ntMi3DWADu5eCpF6MxSxjE58bo=;
	b=mEma8X0Qj37czeeMdr4aBRyo+ZNwpkd1L3R1HD8n1jedTAfC5OopWR39lagh2+55hL8TdI0o99OQSNP98Jhaq/tB7oAL1YWBbnZPpiwwUMWHuZOMiWgHhQzIfZjKkInOp6/C74uQ5dKU154SYrVKNFd6frnJW1nPE99kVWCJ4Jc=
Received: from CY4PR02CA0001.namprd02.prod.outlook.com (10.169.188.11) by
	BLUPR02MB1121.namprd02.prod.outlook.com (10.163.79.147) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.13.10; Fri, 1 Sep 2017 21:04:18 +0000
Received: from CY1NAM02FT047.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::204) by CY4PR02CA0001.outlook.office365.com
	(2603:10b6:903:18::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.13.10 via
	Frontend Transport; Fri, 1 Sep 2017 21:04:18 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT047.mail.protection.outlook.com (10.152.74.177) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1385.11
	via Frontend Transport; Fri, 1 Sep 2017 21:04:16 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:38161
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnt6u-0002Q4-EB; Fri, 01 Sep 2017 14:04:16 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnt6u-0007fC-9T; Fri, 01 Sep 2017 14:04:16 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v81L4D6q021015; Fri, 1 Sep 2017 14:04:13 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnt6r-0007ee-EC; Fri, 01 Sep 2017 14:04:13 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Fri, 1 Sep 2017 14:00:37 -0700
Message-ID: <241130c59df31aebaf4f23b5f151b6b5c91f36fa.1504293917.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(199003)(189002)(36756003)(356003)(76176999)(50986999)(8936002)(54906002)(626005)(2950100002)(6666003)(63266004)(305945005)(106466001)(33646002)(9786002)(77096006)(478600001)(47776003)(50226002)(5660300001)(39060400002)(2906002)(4326008)(189998001)(2201001)(5003940100001)(50466002)(81156014)(48376002)(230783001)(8676002)(36386004)(118296001)(81166006)(107986001)(2101003)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR02MB1121; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT047;
	1:Iye/H7JRnJNXpEaiQZ2/WUtzfA4bSH6oHxJHuOqWYkU6oLjJZZvOYcOwQwwSl+azu/63CbKfTLuf8vXh1Xm5OuF5jTl+Znobh5Bdzwa+bNCk0oPd54hzk3Krii7LEnG3
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7036275-104e-46ea-7d0e-08d4f17d0217
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BLUPR02MB1121; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1121;
	3:/UNoEEjZoKhf+WNK7RfWTVBVmuxhtUymfHNeZtw2WYcPeB2uwqX3e6taxhKwvOVLWUTQsHr9E+bQoFF4rPogNNYvsL+3wZB1iBVr9glpiaCENREe94jYHY7WcAreECXWsFNmwk6EECARItKzLUxfns5Ij+XZH9yMNZ688w93PyQXu0LGxaEWfjn4svNCQ/30B32utCUtaKhoTKQlwhp3FwVrqmaqV7BdVe3TI5sKPCDKu7GES7t1Go9eIArvjcelcVlpNAmLrFk69qUh3KDlAlGE0SE6UlgdEAACfmQwpS77KqOHBsUdDNTMcwLCrivhiwubDeBekhVD0CbXIFwcE7nWw48dpHue4kYFKB4To2Y=;
	25:razIpMud3iWzC0B2sVZ5jcu2RmNJUjWM3huCVWiB1FlfizAr60ppSlPBc+PXTvSlXpVyo/x9TXx8DayGtGgHb5gLOA/Lu9nd6XHUfHLcAqt2l7fatgcBdmVWp/LzBgJevfVG1Gel9T2J9PAfoKYigaWrAgUAIvAhhXlsGpRae+Tq1CUWjxGBxgnr1ah7X4GMzZXMsZfwEaT+KPKHH02AqCDpAoN8zDY/YR2lVic72BnlYaBZOR5Jcjl/HQ8jbrNarUXKlYYBOXpfsy63KfxXVMohDQ3yDcL4WQjapopsYAv2U/XWxr23eN0y6sovYEcZwfwv//Azi/Mxtu7lnSebrg==
X-MS-TrafficTypeDiagnostic: BLUPR02MB1121:
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1121;
	31:/Qr2Fau/SFRpLXXYE4eGaz2dXenbCNUNEtrtpOxp1qxKBD/NPjNQzP0HQDl7VzecJIay8LKdUSXhFCS25cwHAKi42IZrXk6Uc0zsFj8tCNI7Nc6esdM66+dph3HuEirEQPZybFREjJJPpal5OK1sMYX0iKg8ABKMSXQCbyBY5fDY3ihCQab+PCG7EcaQno3s976iP0t7EutMfXqvZ91hHeEu/m8kKAHlTg+T5hKnJic=;
	20:LhFZ9mcSHZeZzMBRFKhil4IObQ2wxfoN1W+lMAF8p4/5MgFn7AAEHuXKhonocXVgDOEqmI941IrHhfclCbhgfe+3hPwZQpscikfI/I53QEsvPc/omsLjRvPvhbB7ET/1NoC9NBmznk5L1r5o6SQ4sgCVEBfEk/rs7UFq1Hyz/frFtOLYJdEy0AmqCAX6SaIzavkFrDr7hxWGIq+wauXRjX+AggOhjvMtoBVaXJuW5OMFgyYRglum3c6w0iskko8vTvWKKRewS0o5Ub6gQ3A8x8p12IEHftgxhsKwumGwuiGB60ZqLSpZIPucB8GbSLo23rut4yaFU80GGbALiebmZDHeqtUfphjGa+p4/gdSddgBuf9MtLRlDh8pRB1N41PQgG7opftMwdnSgDKFAq2RuH2n97+bqMwalutJ2WIb378rOln3F5UVbe7i6dAcag/zKngKHWhHMq/wLW1M3lV0mkMLQuf05bA7PS87cVG12e+RIN/MNz7cgckhi2pkgnXZ
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(21532816269658);
X-Microsoft-Antispam-PRVS: <BLUPR02MB112110E2C8F84E4F0BBC1691DC920@BLUPR02MB1121.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(13018025)(13016025)(10201501046)(3002001)(93006095)(93004095)(100000703101)(100105400095)(6055026)(6041248)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123558100)(20161123562025)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BLUPR02MB1121; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BLUPR02MB1121; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1121;
	4:6GOGKrm1rv8Mixy49PRZxEvSeD8f2+S3pwK1Zkog4ss8fl486RVat5GxMfZAR5V+NTOWJ7kmvjAbWAXsn1xrGLQbUp7YPGOK8XTa9nqQMZpa4J12e2O+20dtIBotRZcQH7LhlnaYJpEjDXbJdjZsymPeoLb4F/n8DOR57ss05hSbdgjZvuYqIVPkTSKvXoWPErz48MgLC77wvk5cwynza+W1/KOY1wORwiFl6m5drY7oUXfANdNPKqDH6jONd5CNfM3FXDXkFSASvtpsQ/sTSvHh5AYWjyMkz2p9D9SVc7bAw9Q6ugdux6Po5j8iKlQ/PjFehCcxeste/jxuQ44aWQ==
X-Forefront-PRVS: 0417A3FFD2
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR02MB1121;
	23:GS6U7Xw5zZimDSmiKChRGb6mqxmwWiNm58MEy+2Zv?=
	=?us-ascii?Q?Yau5YyFtvPLb6XMO+g2v8tNChYdRSztr1ao7kKiiBSlwOpdBNxc4bVjmGrBg?=
	=?us-ascii?Q?rum69219l0HzGqWX6y5ukde6urc6lGGxFM3l30bMEIRWGGqIXcBMR42ZQmQE?=
	=?us-ascii?Q?pccnqcSKCFlucvO/vPREsco3g76zOopScImt0ZNGvNYDDiF1jgykg/GQsywA?=
	=?us-ascii?Q?NHMk0Wqhs93q9oR5J4Ivzr15Fo5KcVdmuHQdeNxPLXh7aS2q+eSDikxQLZ3i?=
	=?us-ascii?Q?k9jdn9sUZjn/QEAzj5Ipr6KYxD5rn1uZZtcx2N0+ay2OeK5g3ynJ97qvZhtS?=
	=?us-ascii?Q?2MQ1SIE4Bd5eUqECNExZu+cVNfDM4Yu8u/jWDyk8lL2M5Tvzb+55qf2Ls5kN?=
	=?us-ascii?Q?UCBvwbluogJI2AVmmS5+X1XJ3GkqHLt1zn2t1K5T+6bj7pXBFYII+R8CzmL9?=
	=?us-ascii?Q?gTXAu4LIgsAmRLJDmVFbkRfGPVwVY2m760k8rCAW5pXp4Y8feHMhsgSh+7f5?=
	=?us-ascii?Q?mGUJM8vZ7MJtBz7Rlrj0nI0RoDVASgkZD2D6cPu8YJTDyPGbU+jlMhpHK+1z?=
	=?us-ascii?Q?v+qi8a+JlSHnat+66KSY+0Sl4SoLiqj263WDYKEshN24XbseDj+RdK8W5glC?=
	=?us-ascii?Q?j51T3tABChjn+mLbJoORDYzXWKirWt/kzee6QW5RyTjFulUk1FifSBzgkz/W?=
	=?us-ascii?Q?axHA/3rim0P8fxlU2UCm8GeSC8zj5Dwl3ZWa9KYIrnB9KoVcfUaoH1UQFhFT?=
	=?us-ascii?Q?PRAN+ttaPlYEN+bM0tbDXHfPkTK7s5O1+E2Kjpft7o+ayFfmn2/NkUg4WGzF?=
	=?us-ascii?Q?Wb57JmLAozKb2QdnE2DG3RrvoBUm/sMms73nBXKW/FvIF+wjIjQcyEbB7Q7/?=
	=?us-ascii?Q?abwdrIvFyN9g1yoMwUMCXGAucU2YzgQ8Wv+EL2At1gxP7BNCf3gRhYspJJIp?=
	=?us-ascii?Q?SI4SsfcT1CNWZe+loyv+uCOffbvaTgmXSlII/r1jUC5Rhk5xi4IWRUxGeCe9?=
	=?us-ascii?Q?ICEt7mLU1luoICwqQDuCdWxBmqoiyLiejI6JSD4zQi6kg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1121;
	6:CPV8uQztpTmezf5jxCIZSpqXq3adv9ih6D9dYfCzOWTeYyU2UaZbdsuyTbVBSQY85HOnXHrdDzNN+5PhUOGLRzAkDZuZhLw7KuypNJwESfTdM2uXKYLC3rv2/wrimBHVUkDL0Slb53rhsLJkXNBxaXC2/V+f//SqLQOFZDM6cYuGwnIxioDtg7ZsQimVadMOHIrFVYfnLaCKL6nDliGXpX7G850L34/KidCMSbsrPfpwWF/DfEiKIOESsnYJzBVV/KoNJQcceHYysAseERgb8hK05LT1J4anayobBK+/G7NY4K+tshRydfnCg558GQ9uvBzRHL+pfFLb64DYH7upxQ==;
	5:SSnruznjo4beRgbKITYh+IRdfTi0Ox8Mm8VO6QZjyA+c8E2PTgP9j8uv6oYUCniQk57OTiSi6fCLwpzJFRsHZ+/+A9xRtiEasxXB6d2KfrrvdBmPqhzcuM+8DrRk4ojDyMVIPAxJNLstvEY5XlIo1g==;
	24:Vq2LdqNrffu9y55mXCDztbBU5jWnLeu4tvRATH84jkoITuG8DiiK6WJzVvRB9KdIUmfoTLZXfAbQwibcI2cSWkb9N/9Bg5ZLj3LJYCy9BYY=;
	7:PTJRe3e0k7eR4MfSo6zjbe8zq2daS+xaz8tGl8ZLu7fYgnihLo6/nJk9gbnYssDy1p5E0NJLvN8u5r4VwoERJH/tuo7mBb7tEdXmWuNMRDjCCA1xY/LpsgWgULvKP6jDkNitpnU7UgNGhSqGUL1Ql641A7yAdxZzqYid4MkH/CaS/Nk1HOk2ZmQ5lQ7+ngm5Am7EqQWJUkoxro7tLr60c8uWgtImWKCCVLJTkGbDaWA=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2017 21:04:16.6725 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR02MB1121
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.41.66
Subject: [Qemu-arm] [PATCH v2 2/6] xlnx-zynqmp-pmu: Add the CPU and memory
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
X-TUID: kJLhO84KCPHg

Connect the MicroBlaze CPU and the ROM and RAM memory regions.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 hw/microblaze/xlnx-zynqmp-pmu.c | 65 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 63 insertions(+), 2 deletions(-)

diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
index fc3c8b236f..33584cfa4d 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -18,8 +18,11 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
+#include "exec/address-spaces.h"
 #include "hw/boards.h"
+#include "hw/qdev-properties.h"
 #include "cpu.h"
+#include "boot.h"
 
 /* Define the PMU device */
 
@@ -27,21 +30,51 @@
 #define XLNX_ZYNQMP_PMU(obj) OBJECT_CHECK(XlnxZynqMPPMUState, (obj), \
                                           TYPE_XLNX_ZYNQMP_PMU)
 
+#define XLNX_ZYNQMP_PMU_ROM_SIZE    0x8000
+#define XLNX_ZYNQMP_PMU_ROM_ADDR    0xFFD00000
+#define XLNX_ZYNQMP_PMU_RAM_ADDR    0xFFDC0000
+
 typedef struct XlnxZynqMPPMUState {
     /*< private >*/
     DeviceState parent_obj;
 
     /*< public >*/
+    MicroBlazeCPU cpu;
 }  XlnxZynqMPPMUState;
 
 static void xlnx_zynqmp_pmu_init(Object *obj)
 {
+    XlnxZynqMPPMUState *s = XLNX_ZYNQMP_PMU(obj);
 
+    object_initialize(&s->cpu, sizeof(s->cpu),
+                      TYPE_MICROBLAZE_CPU);
+    object_property_add_child(obj, "pmu-cpu[*]", OBJECT(&s->cpu),
+                              &error_abort);
 }
 
 static void xlnx_zynqmp_pmu_realize(DeviceState *dev, Error **errp)
 {
-
+    XlnxZynqMPPMUState *s = XLNX_ZYNQMP_PMU(dev);
+
+    object_property_set_uint(OBJECT(&s->cpu), XLNX_ZYNQMP_PMU_ROM_ADDR,
+                             "base-vectors", &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "use-stack-protection",
+                             &error_abort);
+    object_property_set_uint(OBJECT(&s->cpu), 0, "use-fpu", &error_abort);
+    object_property_set_uint(OBJECT(&s->cpu), 0, "use-hw-mul", &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "use-barrel",
+                             &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "use-msr-instr",
+                             &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "use-pcmp-instr",
+                             &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), false, "use-mmu", &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "endianness",
+                             &error_abort);
+    object_property_set_str(OBJECT(&s->cpu), "8.40.b", "version",
+                            &error_abort);
+    object_property_set_uint(OBJECT(&s->cpu), 0, "pvr", &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &error_fatal);
 }
 
 static void xlnx_zynqmp_pmu_class_init(ObjectClass *oc, void *data)
@@ -70,7 +103,35 @@ type_init(xlnx_zynqmp_pmu_register_types)
 
 static void xlnx_zcu102_pmu_init(MachineState *machine)
 {
-
+    XlnxZynqMPPMUState *pmu = g_new0(XlnxZynqMPPMUState, 1);
+    MemoryRegion *address_space_mem = get_system_memory();
+    MemoryRegion *pmu_rom = g_new(MemoryRegion, 1);
+    MemoryRegion *pmu_ram = g_new(MemoryRegion, 1);
+
+    /* Create the ROM */
+    memory_region_init_rom(pmu_rom, NULL, "xlnx-zcu102-pmu.rom",
+                           XLNX_ZYNQMP_PMU_ROM_SIZE, &error_fatal);
+    memory_region_add_subregion(address_space_mem, XLNX_ZYNQMP_PMU_ROM_ADDR,
+                                pmu_rom);
+
+    /* Create the RAM */
+    memory_region_init_ram(pmu_ram, NULL, "xlnx-zcu102-pmu.ram",
+                           machine->ram_size, &error_fatal);
+    memory_region_add_subregion(address_space_mem, XLNX_ZYNQMP_PMU_RAM_ADDR,
+                                pmu_ram);
+
+    /* Create the PMU device */
+    object_initialize(pmu, sizeof(XlnxZynqMPPMUState), TYPE_XLNX_ZYNQMP_PMU);
+    object_property_add_child(OBJECT(machine), "pmu", OBJECT(pmu),
+                              &error_abort);
+    object_property_set_bool(OBJECT(pmu), true, "realized", &error_fatal);
+
+    /* Load the kernel */
+    microblaze_load_kernel(&pmu->cpu, XLNX_ZYNQMP_PMU_RAM_ADDR,
+                           machine->ram_size,
+                           machine->kernel_filename,
+                           machine->dtb,
+                           NULL);
 }
 
 static void xlnx_zcu102_pmu_machine_init(MachineClass *mc)
-- 
2.11.0

