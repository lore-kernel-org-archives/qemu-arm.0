Received: by 10.28.173.206 with SMTP id w197csp4576493wme;
        Tue, 16 Jan 2018 15:33:28 -0800 (PST)
X-Google-Smtp-Source: ACJfBosh5MkqMlCvbsVvl+HJ0eyuXw0gRTys59ca+n2lm6+Dy5PNOjBypkva+HdRsqMlKlbU2wUK
X-Received: by 10.37.66.79 with SMTP id p76mr28000971yba.26.1516145608025;
        Tue, 16 Jan 2018 15:33:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516145608; cv=none;
        d=google.com; s=arc-20160816;
        b=FeGFQhBKIxfY01XQS5WNlP/a85DfG16ynaV22C2/oznHaNN21FyBrTx+LD6m2MAUfN
         YBEoiUdflzPmtGowYdkc1VlLgteaxeXXVKAKpaO7qRih9Idak8aB2TfYjIR2SeZbjZVq
         Bg4Kbe5NCcc5uX2LI+J6C0z38U4595S9wMpy4ZHbXZFuIrFez9vdpqEY7iXsxfrgHQ8K
         /LqL3j4dhIjrLSIjJfy0T//WjP7+2WYKR9XunCd1WFTIGGBdetFygCby1tpfMUwtB3+V
         9e5OSSJx7Cg8BNuBSIV2KhfgTbEKFhf1qF9Nwor0QvYq9EsFsnu6syKxu9MAwMl9wHKY
         HBFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:to:from:dkim-signature
         :arc-authentication-results;
        bh=kli1XjtiQ69hxp6JXdCpoU+XtCYTevumEyxDmH/zc8g=;
        b=z8R9Ergcbuh48iHRPvpK3bdSKcIwMB2nS+cP53/VvTd24/JsEhJ9D8eZaPqmx/CXjA
         Ebe0y7BBcatZD6MkTo6xFF18jgZrydqcsfNIyVfZh0Zuq30ze5nmQgIp8lrGP+aQ0LnD
         fhkIGGhFMBrju8kO4jVPZYj7ywQX70Xaievr7GRuW7y2NHAPQ0yesLNjTmlpEys3sYwO
         ynujvShlsLtuKreoemRwjgqVaNPM9pjzC1FqcMOdOqB/QtmpThEazaOMm97a4FfX5uwE
         vXsPVZIA45W+7Akue/r+B+d7fkf/cQCw2K8mJfH6b038tOYGt8Ap+nt5pv8yG16cUE2d
         WAsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=AdIn2QTX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z3si795809ywi.574.2018.01.16.15.33.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 15:33:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=AdIn2QTX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45641 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebajP-0000rG-9d
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 18:33:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1ebadL-0004PF-1D
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 18:27:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1ebadH-000288-Ni
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 18:27:11 -0500
Received: from mail-dm3nam03on0050.outbound.protection.outlook.com
	([104.47.41.50]:60704
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1ebadH-00027c-Cu; Tue, 16 Jan 2018 18:27:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=kli1XjtiQ69hxp6JXdCpoU+XtCYTevumEyxDmH/zc8g=;
	b=AdIn2QTXPEyQVXoFZERdQavMPzjma6me7CKSftqB31UBriIXcG7FcTJCepq2kOm3lqtSE6zmtBFhfZhUIug3AcowDKcwIoikf9XU8JHnmQOUgL40ipbPUXPshb49AwShej9USul3i8cofLasqNXbptSsKiatupjHg54XdHdwTRc=
Received: from MWHPR02CA0043.namprd02.prod.outlook.com (10.164.133.32) by
	SN1PR02MB1342.namprd02.prod.outlook.com (10.162.0.148) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.407.7; Tue, 16 Jan 2018 23:27:04 +0000
Received: from SN1NAM02FT008.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::203) by MWHPR02CA0043.outlook.office365.com
	(2603:10b6:301:60::32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.407.7 via
	Frontend Transport; Tue, 16 Jan 2018 23:27:03 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT008.mail.protection.outlook.com (10.152.72.119) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.345.12
	via Frontend Transport; Tue, 16 Jan 2018 23:27:02 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebadC-0000Mv-Au; Tue, 16 Jan 2018 15:27:02 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebadC-0003M3-9Y; Tue, 16 Jan 2018 15:27:02 -0800
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w0GNQqGT031049; Tue, 16 Jan 2018 15:26:53 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebad2-0003LH-SJ; Tue, 16 Jan 2018 15:26:52 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Tue, 16 Jan 2018 15:22:32 -0800
Message-ID: <0e03927fb6c990f877cf847434b0ed230a52ea2a.1516144891.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1516144891.git.alistair.francis@xilinx.com>
References: <cover.1516144891.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23598.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(346002)(39860400002)(376002)(39380400002)(2980300002)(438002)(199004)(189003)(5660300001)(47776003)(81166006)(478600001)(5890100001)(8936002)(50226002)(9786002)(81156014)(63266004)(26005)(118296001)(8746002)(8676002)(106466001)(305945005)(4326008)(356003)(36386004)(230783001)(39060400002)(6666003)(77096006)(51416003)(7696005)(54906003)(48376002)(110136005)(76176011)(575784001)(2906002)(106002)(2950100002)(316002)(50466002)(2201001)(36756003)(59450400001)(107986001)(2101003)(309714004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR02MB1342; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT008;
	1:QrdoIBZ+2xfy+9eyYrQDoTBcDF9xc4TIRvxRZ3EwCzmGyXfovV5QgjE5XUx2TOWy278WCAH9MPjT0gbMI2mbQDPONm2N355Xv2aSrqSj91KP59beo3ge/s+2aLsau3qf
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bcf2826-b700-4aa0-eccf-08d55d38a639
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:SN1PR02MB1342; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1342;
	3:A52GCtIV2P3fO8wMejbl+y8wyYLk5e12iozJlXmGLQGAwi53NyWY0GY/pTgERHuLx8EBZdUyb3sFfnScpEwERZFeVTMXA0XevQBjXtpu2106QzaCKJ6j1oYHLkjvRVj4g3j9WKpz+hgcdXIFDWn66Z82GuektVzpvY6vjZHkYw0u7JqO2HCsLb7uw/zE7nW6sogBdiI8wMCK3iqDJ0YIjCJgAddV+6Pz55JHUteQu92LYpki5/FCMSnxWzoInKdfL6ujCjwk/GaSjd/nAyP29ALHLYQXt5OAJ7LjwVW9C/MEIiCQEsh8sMTWXYXsHiUurzbIyCxwYD5khot0uVx6i/Mr8YGKZhttQmYL2LfPBcc=;
	25:P4WU0xSfaOATpkkcLf2rgMN+x7y0Gdz0q8I0v21aKFr+HvoVzny2sQJ7mKP1W8lOYmGZA7HM4J3qx9tys59jSS+0ABjURkjiTVKrMy7dFT0sfWYu25OUpokPnI3fUm66u1Y8aU53zqvIWdTc8dbf5UJl5L6hszGCmWKp2E01HdcFe4oTcaEtc7UyYiapnlkQ52M1iv9WIEHJOBonUmErQGqEPpeN+pd95Zglkex/xq17PpUlvfGv9h0KaXMqXtopxiEoGK08vx+bdq3KSfjoZ/rQjYaQZv3+O58LLV8WTrrnCvtTOARJm6LKSAJrntqqnLEiJo1L10+lQcgp8kukPpCmiu6OlKmAXw+DSLHkFzM=
X-MS-TrafficTypeDiagnostic: SN1PR02MB1342:
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1342;
	31:/Kf681WWmtaBRyf6uZ0afhIjqVwgWsvnUJeK+j9mUNEBpR+1ZV2OSuJNDvf/Hhjmhcdgj7scMJOBRo3LB5gn1MO3mOzknLZN9CdpZQFcJAfzWJD7IOeCc0tkXoNAx4gMjdEb6WHKysYXrUP3k6UHKqGjKtsYE+zoKY+Y5MzYkOTtcenb0Fc4IkxqiQ/B010AECsubDgXdz4FlBNmZdthQ/MIIQCKXx6iRx7sErUWpaM=;
	20:Jc4TsbZdRUbkhzrygnDHVlQzgzl6bORqhEnQMqEHST+L6iJIfGNLvFJr4p0iUzifv+1gZQKRACQd5B1kaOUXJaTVWpdUWolFNdiRAClW5Lvnm+s1gSTvsJhqCg6I9AuPmjsgVgxhEkoKgoqEVsm2/4C0+QV4ZVE16zNKPDLvqxRwbOJmTCH5kDBl6tLgH9Gqfqf/SNiFNfhjOQhd8pmb3oPaYbsL6/RgLxVDbF6DZN2J3yawKWrx8vL9kF/n+z3A7hsXwlQsn9yVewB3UqL4t7jW02GFEMHMcy1kZOlHjRwrWXm1rvT14uNMmGGRvHPwwiB3fdoGkluctxE77qHLwTu8u3yYuIP6g6vugnF+2vY4Kcu8yui6eAiT8cSRYBa5Z3Rwa+g4jb69zlHfEZSVr32xR1ivWfEYj+k/ZlNGDw+Fsv0bNfrTfMLHujj+ht+KEHT6fU0Y7idpKLgwL7KP6PCXph/97lgzKpdPooo0jBfzPJEP0H8iwUFAtPuuNNnl
Content-Transfer-Encoding: quoted-printable
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN1PR02MB13421529C82F6D8CE212ABF7DCEA0@SN1PR02MB1342.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(93006095)(93004095)(10201501046)(3231023)(944501161)(3002001)(6055026)(6041268)(20161123562045)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(6072148)(201708071742011);
	SRVR:SN1PR02MB1342; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:SN1PR02MB1342; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1342;
	4:U15N9qeo08xi76xDS8LdbsETZJ7Hq4QIAzJJcWV8u2hXnD2Oen7ntc+IfWEOh1n/KQK49a0Y1AwMY+Q6abW+k5oQDUQ7kKR52Q2exvGS/aUYcvGdgqySwpt1TXzycVdN7Fqe6P/vwjdoA/oHy/0O1wyC6zmBLGpuXkWPAR/NoGlhcDtzv8dtRCbgGXAhyUR6lm6lAwUUuUhwgvPm2cz4Mmivr4QIhNU7i/Zpdc0dmEfdksoJxU28JuOok9R3qoqfdnZeqnzpUcLnT+0hagTt0rmFqL/C58CDV0QNRc/ZA7m7NqC3BEbDGUDIRtSv26Kh
X-Forefront-PRVS: 0554B1F54F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR02MB1342;
	23:kbBxuYLOjThiW0pTrZWG55Y/ZJM6h3wABXlbqaB6M?=
	=?us-ascii?Q?t6hatRTu9Bz5xgL+z1ihFWsUCCXH4s5ms/aUzuA6aQdxT9eEVDM6+bH/6PIR?=
	=?us-ascii?Q?hPV6faKwA/ssX5LBCr2bMqcxzG5Uv/N8GQzMcq7trHXYGpgPpG+8mhY8MYoK?=
	=?us-ascii?Q?/7tuI6+vNyVJKBhbnbpegNTK5pa6Kv1fnEa/9hspLZ7vwK4XR+Van4ye+uwO?=
	=?us-ascii?Q?Qmb5K2jNZJtI9e2Vud3Nx2HyCLbN5ryBgBcDFkVOFoWCoMhFyG8t/zNu73fA?=
	=?us-ascii?Q?0iGO+9BhHycCenNAmzMzpLVXDO0AAGcw+1V98fpDrTnRIKTRS8kDaJjz5JRq?=
	=?us-ascii?Q?ovsl/SfZEMlhTD0KQK5BOlhRZtH+zurR8Agl/K7k1gsbbhBfRaEuNhthzuGF?=
	=?us-ascii?Q?3bq+nQpgTYqsdhvQ1nA58xdjpjlYViIUIHMUJPgljk0G8R1jAZdV++DicwOp?=
	=?us-ascii?Q?AzQrF06Cej+y6fnm8RuporCJXqcOON7KxGNA+EpVdoExtGLs4AxVcnxC2iUr?=
	=?us-ascii?Q?Wp0cXjDzKp9QZCzjz55V/XMrpCrabrX4DQv8SF6uWtp/jsnRdsnKYci+k2Gg?=
	=?us-ascii?Q?Kffa99+3O//vpelD0oLAs4V98SsbOu6GAJpQfivtAwazGSwYL8O15IS3Vk1k?=
	=?us-ascii?Q?AS9fXyAVm9T1YkGeuvyXv4qpWsEMRSjoGpdUL42PkD+cjFQnTQEWwcudhf6g?=
	=?us-ascii?Q?qml0EiH8nQr/LOpsf98QRqXHFr6rZ3AYQTZ2NPFYSHgFtWv2ouKXCfQ9Epeo?=
	=?us-ascii?Q?l5D4ifxV4pYgLgfsONVHLq4rBpSqqTkRwN6D7FaDSx8bOToMQ1AGMzTEdYby?=
	=?us-ascii?Q?adtjSzZn9b9RuyaYX2BhRySDBaRkMhkzTNKm9c0SUh9aHIwiRghn7H4/mvp2?=
	=?us-ascii?Q?BX1VySLFoyirdliCiAe3XgzM72KeY4Rj0I1Ii5j56HU5ip/dCzvDd1YE2gV9?=
	=?us-ascii?Q?kI3PoJjI6tng33qXnagXfPiiYOOTLrObJN08ImAw8K3u8DESSE6KChJIdfx0?=
	=?us-ascii?Q?2kVoFgDAqo9MIykIoje05mCPbDStfrVY/FPFiS8Po4PPFJe+9SKTeonES7Yn?=
	=?us-ascii?Q?ZlFqCOmxhYxVrOskcr8dL94vbIBIezRg4feKnfecmWmC0vRUQ0+iitictgCf?=
	=?us-ascii?Q?Qn7XP5TQJOAzOpcNAxzcuLKI46/DufSKa3JaS2yYZXPv0rtZ+DUUQKcoFzZB?=
	=?us-ascii?Q?W9vyi1YP/7+rI8=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1342;
	6:3kNL+WJRah3wtwTLZ97s8AWF/KLQzGcIgR0Vkdtbil7JKp5iZ/ar5LO2NMvdDMOOF3w+CZGANdggFINF9RDUuOKGRgaahfQw0vRj4bBfK259j8ZERc3EQLWGMuKrpIuleX6nDMBpQR5hSTts45az/YTpHrJoKztxEr9OmJij+1CJgW+LsoLKnzWgK0iZfdeCr6csvFaQCRK1dJOSEEs049dqCLZZtdQjnaZaykTXCn8/wpUXOLWxEuVrIuCMEPv39kNCj8tqbVOlv6+UAnZfCJXhbdo4zXrSMWoi78+HZJ2QIlZde05vM41Mm2KjAfDw3suV1bjmQc0sovpm1s2EjOHl0h04RjApl+5eXmaUk5s=;
	5:AfjmYRdEdR5dwTuu9Hy8AlKlfbSFcnfbuaBRnEurjYeNiUDKezDwIT7MZRfTlLxj76ZCx+gNfsP48czEs9+XhXoqlG/YDFeUKNWhbv6cG9IglA4RJ0YBEFQtSRQqFTyL0AHDBeWj7gmPCBi/D9S9ESTA6LmJd+DG4688FCyM+CU=;
	24:wFaAlXoBT+Ku0T9rsjG+t/rLyf2AlVPzLbMTnzyOiENEC7l3Losw0mVK/d/NakrPbs2P7Wn+GlS1aHiFwoNRoJp1DgO1+vLTEVK+F/kFRTk=;
	7:p90T+smb1PmNACoaKy/kHkC2YmTCqK/gZG3IknbFOSvCln/CVSdbhBJAaZ9dYtGYNKc8t41XmCerD3Y37BrB7baq9P6AoPSd/pkt5wCIbHeyPJ/kccDfYMExlQsvhpc8uT8Xrcgh3Fpb0O0oLt0OLiNBYf2v6PweZE0+TjYB4QTYmoGAK2erAj/ybXE5qek1je1oiq2jTu1A1f/eSJgaOoC6nIIrvxnQc+a7MuWcKIJEO2da0vUTHN9N6tu1z3Ga
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2018 23:27:02.7877 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bcf2826-b700-4aa0-eccf-08d55d38a639
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB1342
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.41.50
Subject: [Qemu-arm] [PATCH v5 5/9] xlnx-pmu-iomod-intc: Add the PMU
 Interrupt controller
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
X-TUID: ULwlLi9DDNdA

Add the PMU IO Module Interrupt controller device.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---

 default-configs/microblaze-softmmu.mak |   1 +
 hw/intc/Makefile.objs                  |   1 +
 hw/intc/xlnx-pmu-iomod-intc.c          | 554 +++++++++++++++++++++++++++++=
++++
 include/hw/intc/xlnx-pmu-iomod-intc.h  |  58 ++++
 4 files changed, 614 insertions(+)
 create mode 100644 hw/intc/xlnx-pmu-iomod-intc.c
 create mode 100644 include/hw/intc/xlnx-pmu-iomod-intc.h

diff --git a/default-configs/microblaze-softmmu.mak b/default-configs/micro=
blaze-softmmu.mak
index ce2630818a..7fca8e4c99 100644
--- a/default-configs/microblaze-softmmu.mak
+++ b/default-configs/microblaze-softmmu.mak
@@ -9,3 +9,4 @@ CONFIG_XILINX_SPI=3Dy
 CONFIG_XILINX_ETHLITE=3Dy
 CONFIG_SSI=3Dy
 CONFIG_SSI_M25P80=3Dy
+CONFIG_XLNX_ZYNQMP=3Dy
diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
index ae358569a1..211655023e 100644
--- a/hw/intc/Makefile.objs
+++ b/hw/intc/Makefile.objs
@@ -3,6 +3,7 @@ common-obj-$(CONFIG_I8259) +=3D i8259_common.o i8259.o
 common-obj-$(CONFIG_PL190) +=3D pl190.o
 common-obj-$(CONFIG_PUV3) +=3D puv3_intc.o
 common-obj-$(CONFIG_XILINX) +=3D xilinx_intc.o
+common-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-pmu-iomod-intc.o
 common-obj-$(CONFIG_ETRAXFS) +=3D etraxfs_pic.o
 common-obj-$(CONFIG_IMX) +=3D imx_avic.o
 common-obj-$(CONFIG_LM32) +=3D lm32_pic.o
diff --git a/hw/intc/xlnx-pmu-iomod-intc.c b/hw/intc/xlnx-pmu-iomod-intc.c
new file mode 100644
index 0000000000..1ce2f4fa6b
--- /dev/null
+++ b/hw/intc/xlnx-pmu-iomod-intc.c
@@ -0,0 +1,554 @@
+/*
+ * QEMU model of Xilinx I/O Module Interrupt Controller
+ *
+ * Copyright (c) 2013 Xilinx Inc
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
+#include "hw/intc/xlnx-pmu-iomod-intc.h"
+
+#ifndef XLNX_PMU_IO_INTC_ERR_DEBUG
+#define XLNX_PMU_IO_INTC_ERR_DEBUG 0
+#endif
+
+#define DB_PRINT_L(lvl, fmt, args...) do {\
+    if (XLNX_PMU_IO_INTC_ERR_DEBUG >=3D lvl) {\
+        qemu_log(TYPE_XLNX_PMU_IO_INTC ": %s:" fmt, __func__, ## args);\
+    } \
+} while (0)
+
+#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
+
+REG32(IRQ_MODE, 0xc)
+REG32(GPO0, 0x10)
+    FIELD(GPO0, MAGIC_WORD_1, 24, 8)
+    FIELD(GPO0, MAGIC_WORD_2, 16, 8)
+    FIELD(GPO0, FT_INJECT_FAILURE, 13, 3)
+    FIELD(GPO0, DISABLE_RST_FTSM, 12, 1)
+    FIELD(GPO0, RST_FTSM, 11, 1)
+    FIELD(GPO0, CLR_FTSTS, 10, 1)
+    FIELD(GPO0, RST_ON_SLEEP, 9, 1)
+    FIELD(GPO0, DISABLE_TRACE_COMP, 8, 1)
+    FIELD(GPO0, PIT3_PRESCALE, 7, 1)
+    FIELD(GPO0, PIT2_PRESCALE, 5, 2)
+    FIELD(GPO0, PIT1_PRESCALE, 3, 2)
+    FIELD(GPO0, PIT0_PRESCALE, 1, 2)
+    FIELD(GPO0, DEBUG_REMAP, 0, 1)
+REG32(GPO1, 0x14)
+    FIELD(GPO1, MIO_5, 5, 1)
+    FIELD(GPO1, MIO_4, 4, 1)
+    FIELD(GPO1, MIO_3, 3, 1)
+    FIELD(GPO1, MIO_2, 2, 1)
+    FIELD(GPO1, MIO_1, 1, 1)
+    FIELD(GPO1, MIO_0, 0, 1)
+REG32(GPO2, 0x18)
+    FIELD(GPO2, DAP_RPU_WAKE_ACK, 9, 1)
+    FIELD(GPO2, DAP_FP_WAKE_ACK, 8, 1)
+    FIELD(GPO2, PS_STATUS, 7, 1)
+    FIELD(GPO2, PCAP_EN, 6, 1)
+REG32(GPO3, 0x1c)
+    FIELD(GPO3, PL_GPO_31, 31, 1)
+    FIELD(GPO3, PL_GPO_30, 30, 1)
+    FIELD(GPO3, PL_GPO_29, 29, 1)
+    FIELD(GPO3, PL_GPO_28, 28, 1)
+    FIELD(GPO3, PL_GPO_27, 27, 1)
+    FIELD(GPO3, PL_GPO_26, 26, 1)
+    FIELD(GPO3, PL_GPO_25, 25, 1)
+    FIELD(GPO3, PL_GPO_24, 24, 1)
+    FIELD(GPO3, PL_GPO_23, 23, 1)
+    FIELD(GPO3, PL_GPO_22, 22, 1)
+    FIELD(GPO3, PL_GPO_21, 21, 1)
+    FIELD(GPO3, PL_GPO_20, 20, 1)
+    FIELD(GPO3, PL_GPO_19, 19, 1)
+    FIELD(GPO3, PL_GPO_18, 18, 1)
+    FIELD(GPO3, PL_GPO_17, 17, 1)
+    FIELD(GPO3, PL_GPO_16, 16, 1)
+    FIELD(GPO3, PL_GPO_15, 15, 1)
+    FIELD(GPO3, PL_GPO_14, 14, 1)
+    FIELD(GPO3, PL_GPO_13, 13, 1)
+    FIELD(GPO3, PL_GPO_12, 12, 1)
+    FIELD(GPO3, PL_GPO_11, 11, 1)
+    FIELD(GPO3, PL_GPO_10, 10, 1)
+    FIELD(GPO3, PL_GPO_9, 9, 1)
+    FIELD(GPO3, PL_GPO_8, 8, 1)
+    FIELD(GPO3, PL_GPO_7, 7, 1)
+    FIELD(GPO3, PL_GPO_6, 6, 1)
+    FIELD(GPO3, PL_GPO_5, 5, 1)
+    FIELD(GPO3, PL_GPO_4, 4, 1)
+    FIELD(GPO3, PL_GPO_3, 3, 1)
+    FIELD(GPO3, PL_GPO_2, 2, 1)
+    FIELD(GPO3, PL_GPO_1, 1, 1)
+    FIELD(GPO3, PL_GPO_0, 0, 1)
+REG32(GPI0, 0x20)
+    FIELD(GPI0, RFT_ECC_FATAL_ERR, 31, 1)
+    FIELD(GPI0, RFT_VOTER_ERR, 30, 1)
+    FIELD(GPI0, RFT_COMPARE_ERR_23, 29, 1)
+    FIELD(GPI0, RFT_COMPARE_ERR_13, 28, 1)
+    FIELD(GPI0, RFT_COMPARE_ERR_12, 27, 1)
+    FIELD(GPI0, RFT_LS_MISMATCH_23_B, 26, 1)
+    FIELD(GPI0, RFT_LS_MISMATCH_13_B, 25, 1)
+    FIELD(GPI0, RFT_LS_MISMATCH_12_B, 24, 1)
+    FIELD(GPI0, RFT_MISMATCH_STATE, 23, 1)
+    FIELD(GPI0, RFT_MISMATCH_CPU, 22, 1)
+    FIELD(GPI0, RFT_SLEEP_RESET, 19, 1)
+    FIELD(GPI0, RFT_LS_MISMATCH_23_A, 18, 1)
+    FIELD(GPI0, RFT_LS_MISMATCH_13_A, 17, 1)
+    FIELD(GPI0, RFT_LS_MISMATCH_12_A, 16, 1)
+    FIELD(GPI0, NFT_ECC_FATAL_ERR, 15, 1)
+    FIELD(GPI0, NFT_VOTER_ERR, 14, 1)
+    FIELD(GPI0, NFT_COMPARE_ERR_23, 13, 1)
+    FIELD(GPI0, NFT_COMPARE_ERR_13, 12, 1)
+    FIELD(GPI0, NFT_COMPARE_ERR_12, 11, 1)
+    FIELD(GPI0, NFT_LS_MISMATCH_23_B, 10, 1)
+    FIELD(GPI0, NFT_LS_MISMATCH_13_B, 9, 1)
+    FIELD(GPI0, NFT_LS_MISMATCH_12_B, 8, 1)
+    FIELD(GPI0, NFT_MISMATCH_STATE, 7, 1)
+    FIELD(GPI0, NFT_MISMATCH_CPU, 6, 1)
+    FIELD(GPI0, NFT_SLEEP_RESET, 3, 1)
+    FIELD(GPI0, NFT_LS_MISMATCH_23_A, 2, 1)
+    FIELD(GPI0, NFT_LS_MISMATCH_13_A, 1, 1)
+    FIELD(GPI0, NFT_LS_MISMATCH_12_A, 0, 1)
+REG32(GPI1, 0x24)
+    FIELD(GPI1, APB_AIB_ERROR, 31, 1)
+    FIELD(GPI1, AXI_AIB_ERROR, 30, 1)
+    FIELD(GPI1, ERROR_2, 29, 1)
+    FIELD(GPI1, ERROR_1, 28, 1)
+    FIELD(GPI1, ACPU_3_DBG_PWRUP, 23, 1)
+    FIELD(GPI1, ACPU_2_DBG_PWRUP, 22, 1)
+    FIELD(GPI1, ACPU_1_DBG_PWRUP, 21, 1)
+    FIELD(GPI1, ACPU_0_DBG_PWRUP, 20, 1)
+    FIELD(GPI1, FPD_WAKE_GIC_PROXY, 16, 1)
+    FIELD(GPI1, MIO_WAKE_5, 15, 1)
+    FIELD(GPI1, MIO_WAKE_4, 14, 1)
+    FIELD(GPI1, MIO_WAKE_3, 13, 1)
+    FIELD(GPI1, MIO_WAKE_2, 12, 1)
+    FIELD(GPI1, MIO_WAKE_1, 11, 1)
+    FIELD(GPI1, MIO_WAKE_0, 10, 1)
+    FIELD(GPI1, DAP_RPU_WAKE, 9, 1)
+    FIELD(GPI1, DAP_FPD_WAKE, 8, 1)
+    FIELD(GPI1, USB_1_WAKE, 7, 1)
+    FIELD(GPI1, USB_0_WAKE, 6, 1)
+    FIELD(GPI1, R5_1_WAKE, 5, 1)
+    FIELD(GPI1, R5_0_WAKE, 4, 1)
+    FIELD(GPI1, ACPU_3_WAKE, 3, 1)
+    FIELD(GPI1, ACPU_2_WAKE, 2, 1)
+    FIELD(GPI1, ACPU_1_WAKE, 1, 1)
+    FIELD(GPI1, ACPU_0_WAKE, 0, 1)
+REG32(GPI2, 0x28)
+    FIELD(GPI2, VCC_INT_FP_DISCONNECT, 31, 1)
+    FIELD(GPI2, VCC_INT_DISCONNECT, 30, 1)
+    FIELD(GPI2, VCC_AUX_DISCONNECT, 29, 1)
+    FIELD(GPI2, DBG_ACPU3_RST_REQ, 23, 1)
+    FIELD(GPI2, DBG_ACPU2_RST_REQ, 22, 1)
+    FIELD(GPI2, DBG_ACPU1_RST_REQ, 21, 1)
+    FIELD(GPI2, DBG_ACPU0_RST_REQ, 20, 1)
+    FIELD(GPI2, CP_ACPU3_RST_REQ, 19, 1)
+    FIELD(GPI2, CP_ACPU2_RST_REQ, 18, 1)
+    FIELD(GPI2, CP_ACPU1_RST_REQ, 17, 1)
+    FIELD(GPI2, CP_ACPU0_RST_REQ, 16, 1)
+    FIELD(GPI2, DBG_RCPU1_RST_REQ, 9, 1)
+    FIELD(GPI2, DBG_RCPU0_RST_REQ, 8, 1)
+    FIELD(GPI2, R5_1_SLEEP, 5, 1)
+    FIELD(GPI2, R5_0_SLEEP, 4, 1)
+    FIELD(GPI2, ACPU_3_SLEEP, 3, 1)
+    FIELD(GPI2, ACPU_2_SLEEP, 2, 1)
+    FIELD(GPI2, ACPU_1_SLEEP, 1, 1)
+    FIELD(GPI2, ACPU_0_SLEEP, 0, 1)
+REG32(GPI3, 0x2c)
+    FIELD(GPI3, PL_GPI_31, 31, 1)
+    FIELD(GPI3, PL_GPI_30, 30, 1)
+    FIELD(GPI3, PL_GPI_29, 29, 1)
+    FIELD(GPI3, PL_GPI_28, 28, 1)
+    FIELD(GPI3, PL_GPI_27, 27, 1)
+    FIELD(GPI3, PL_GPI_26, 26, 1)
+    FIELD(GPI3, PL_GPI_25, 25, 1)
+    FIELD(GPI3, PL_GPI_24, 24, 1)
+    FIELD(GPI3, PL_GPI_23, 23, 1)
+    FIELD(GPI3, PL_GPI_22, 22, 1)
+    FIELD(GPI3, PL_GPI_21, 21, 1)
+    FIELD(GPI3, PL_GPI_20, 20, 1)
+    FIELD(GPI3, PL_GPI_19, 19, 1)
+    FIELD(GPI3, PL_GPI_18, 18, 1)
+    FIELD(GPI3, PL_GPI_17, 17, 1)
+    FIELD(GPI3, PL_GPI_16, 16, 1)
+    FIELD(GPI3, PL_GPI_15, 15, 1)
+    FIELD(GPI3, PL_GPI_14, 14, 1)
+    FIELD(GPI3, PL_GPI_13, 13, 1)
+    FIELD(GPI3, PL_GPI_12, 12, 1)
+    FIELD(GPI3, PL_GPI_11, 11, 1)
+    FIELD(GPI3, PL_GPI_10, 10, 1)
+    FIELD(GPI3, PL_GPI_9, 9, 1)
+    FIELD(GPI3, PL_GPI_8, 8, 1)
+    FIELD(GPI3, PL_GPI_7, 7, 1)
+    FIELD(GPI3, PL_GPI_6, 6, 1)
+    FIELD(GPI3, PL_GPI_5, 5, 1)
+    FIELD(GPI3, PL_GPI_4, 4, 1)
+    FIELD(GPI3, PL_GPI_3, 3, 1)
+    FIELD(GPI3, PL_GPI_2, 2, 1)
+    FIELD(GPI3, PL_GPI_1, 1, 1)
+    FIELD(GPI3, PL_GPI_0, 0, 1)
+REG32(IRQ_STATUS, 0x30)
+    FIELD(IRQ_STATUS, CSU_PMU_SEC_LOCK, 31, 1)
+    FIELD(IRQ_STATUS, INV_ADDR, 29, 1)
+    FIELD(IRQ_STATUS, PWR_DN_REQ, 28, 1)
+    FIELD(IRQ_STATUS, PWR_UP_REQ, 27, 1)
+    FIELD(IRQ_STATUS, SW_RST_REQ, 26, 1)
+    FIELD(IRQ_STATUS, HW_RST_REQ, 25, 1)
+    FIELD(IRQ_STATUS, ISO_REQ, 24, 1)
+    FIELD(IRQ_STATUS, FW_REQ, 23, 1)
+    FIELD(IRQ_STATUS, IPI3, 22, 1)
+    FIELD(IRQ_STATUS, IPI2, 21, 1)
+    FIELD(IRQ_STATUS, IPI1, 20, 1)
+    FIELD(IRQ_STATUS, IPI0, 19, 1)
+    FIELD(IRQ_STATUS, RTC_ALARM, 18, 1)
+    FIELD(IRQ_STATUS, RTC_EVERY_SECOND, 17, 1)
+    FIELD(IRQ_STATUS, CORRECTABLE_ECC, 16, 1)
+    FIELD(IRQ_STATUS, GPI3, 14, 1)
+    FIELD(IRQ_STATUS, GPI2, 13, 1)
+    FIELD(IRQ_STATUS, GPI1, 12, 1)
+    FIELD(IRQ_STATUS, GPI0, 11, 1)
+    FIELD(IRQ_STATUS, PIT3, 6, 1)
+    FIELD(IRQ_STATUS, PIT2, 5, 1)
+    FIELD(IRQ_STATUS, PIT1, 4, 1)
+    FIELD(IRQ_STATUS, PIT0, 3, 1)
+REG32(IRQ_PENDING, 0x34)
+    FIELD(IRQ_PENDING, CSU_PMU_SEC_LOCK, 31, 1)
+    FIELD(IRQ_PENDING, INV_ADDR, 29, 1)
+    FIELD(IRQ_PENDING, PWR_DN_REQ, 28, 1)
+    FIELD(IRQ_PENDING, PWR_UP_REQ, 27, 1)
+    FIELD(IRQ_PENDING, SW_RST_REQ, 26, 1)
+    FIELD(IRQ_PENDING, HW_RST_REQ, 25, 1)
+    FIELD(IRQ_PENDING, ISO_REQ, 24, 1)
+    FIELD(IRQ_PENDING, FW_REQ, 23, 1)
+    FIELD(IRQ_PENDING, IPI3, 22, 1)
+    FIELD(IRQ_PENDING, IPI2, 21, 1)
+    FIELD(IRQ_PENDING, IPI1, 20, 1)
+    FIELD(IRQ_PENDING, IPI0, 19, 1)
+    FIELD(IRQ_PENDING, RTC_ALARM, 18, 1)
+    FIELD(IRQ_PENDING, RTC_EVERY_SECOND, 17, 1)
+    FIELD(IRQ_PENDING, CORRECTABLE_ECC, 16, 1)
+    FIELD(IRQ_PENDING, GPI3, 14, 1)
+    FIELD(IRQ_PENDING, GPI2, 13, 1)
+    FIELD(IRQ_PENDING, GPI1, 12, 1)
+    FIELD(IRQ_PENDING, GPI0, 11, 1)
+    FIELD(IRQ_PENDING, PIT3, 6, 1)
+    FIELD(IRQ_PENDING, PIT2, 5, 1)
+    FIELD(IRQ_PENDING, PIT1, 4, 1)
+    FIELD(IRQ_PENDING, PIT0, 3, 1)
+REG32(IRQ_ENABLE, 0x38)
+    FIELD(IRQ_ENABLE, CSU_PMU_SEC_LOCK, 31, 1)
+    FIELD(IRQ_ENABLE, INV_ADDR, 29, 1)
+    FIELD(IRQ_ENABLE, PWR_DN_REQ, 28, 1)
+    FIELD(IRQ_ENABLE, PWR_UP_REQ, 27, 1)
+    FIELD(IRQ_ENABLE, SW_RST_REQ, 26, 1)
+    FIELD(IRQ_ENABLE, HW_RST_REQ, 25, 1)
+    FIELD(IRQ_ENABLE, ISO_REQ, 24, 1)
+    FIELD(IRQ_ENABLE, FW_REQ, 23, 1)
+    FIELD(IRQ_ENABLE, IPI3, 22, 1)
+    FIELD(IRQ_ENABLE, IPI2, 21, 1)
+    FIELD(IRQ_ENABLE, IPI1, 20, 1)
+    FIELD(IRQ_ENABLE, IPI0, 19, 1)
+    FIELD(IRQ_ENABLE, RTC_ALARM, 18, 1)
+    FIELD(IRQ_ENABLE, RTC_EVERY_SECOND, 17, 1)
+    FIELD(IRQ_ENABLE, CORRECTABLE_ECC, 16, 1)
+    FIELD(IRQ_ENABLE, GPI3, 14, 1)
+    FIELD(IRQ_ENABLE, GPI2, 13, 1)
+    FIELD(IRQ_ENABLE, GPI1, 12, 1)
+    FIELD(IRQ_ENABLE, GPI0, 11, 1)
+    FIELD(IRQ_ENABLE, PIT3, 6, 1)
+    FIELD(IRQ_ENABLE, PIT2, 5, 1)
+    FIELD(IRQ_ENABLE, PIT1, 4, 1)
+    FIELD(IRQ_ENABLE, PIT0, 3, 1)
+REG32(IRQ_ACK, 0x3c)
+    FIELD(IRQ_ACK, CSU_PMU_SEC_LOCK, 31, 1)
+    FIELD(IRQ_ACK, INV_ADDR, 29, 1)
+    FIELD(IRQ_ACK, PWR_DN_REQ, 28, 1)
+    FIELD(IRQ_ACK, PWR_UP_REQ, 27, 1)
+    FIELD(IRQ_ACK, SW_RST_REQ, 26, 1)
+    FIELD(IRQ_ACK, HW_RST_REQ, 25, 1)
+    FIELD(IRQ_ACK, ISO_REQ, 24, 1)
+    FIELD(IRQ_ACK, FW_REQ, 23, 1)
+    FIELD(IRQ_ACK, IPI3, 22, 1)
+    FIELD(IRQ_ACK, IPI2, 21, 1)
+    FIELD(IRQ_ACK, IPI1, 20, 1)
+    FIELD(IRQ_ACK, IPI0, 19, 1)
+    FIELD(IRQ_ACK, RTC_ALARM, 18, 1)
+    FIELD(IRQ_ACK, RTC_EVERY_SECOND, 17, 1)
+    FIELD(IRQ_ACK, CORRECTABLE_ECC, 16, 1)
+    FIELD(IRQ_ACK, GPI3, 14, 1)
+    FIELD(IRQ_ACK, GPI2, 13, 1)
+    FIELD(IRQ_ACK, GPI1, 12, 1)
+    FIELD(IRQ_ACK, GPI0, 11, 1)
+    FIELD(IRQ_ACK, PIT3, 6, 1)
+    FIELD(IRQ_ACK, PIT2, 5, 1)
+    FIELD(IRQ_ACK, PIT1, 4, 1)
+    FIELD(IRQ_ACK, PIT0, 3, 1)
+REG32(PIT0_PRELOAD, 0x40)
+REG32(PIT0_COUNTER, 0x44)
+REG32(PIT0_CONTROL, 0x48)
+    FIELD(PIT0_CONTROL, PRELOAD, 1, 1)
+    FIELD(PIT0_CONTROL, EN, 0, 1)
+REG32(PIT1_PRELOAD, 0x50)
+REG32(PIT1_COUNTER, 0x54)
+REG32(PIT1_CONTROL, 0x58)
+    FIELD(PIT1_CONTROL, PRELOAD, 1, 1)
+    FIELD(PIT1_CONTROL, EN, 0, 1)
+REG32(PIT2_PRELOAD, 0x60)
+REG32(PIT2_COUNTER, 0x64)
+REG32(PIT2_CONTROL, 0x68)
+    FIELD(PIT2_CONTROL, PRELOAD, 1, 1)
+    FIELD(PIT2_CONTROL, EN, 0, 1)
+REG32(PIT3_PRELOAD, 0x70)
+REG32(PIT3_COUNTER, 0x74)
+REG32(PIT3_CONTROL, 0x78)
+    FIELD(PIT3_CONTROL, PRELOAD, 1, 1)
+    FIELD(PIT3_CONTROL, EN, 0, 1)
+
+static void xlnx_pmu_io_irq_update(XlnxPMUIOIntc *s)
+{
+    bool irq_out;
+
+    s->regs[R_IRQ_PENDING] =3D s->regs[R_IRQ_STATUS] & s->regs[R_IRQ_ENABL=
E];
+    irq_out =3D !!s->regs[R_IRQ_PENDING];
+
+    DB_PRINT("Setting IRQ output =3D %d\n", irq_out);
+
+    qemu_set_irq(s->parent_irq, irq_out);
+}
+
+static void xlnx_pmu_io_irq_enable_postw(RegisterInfo *reg, uint64_t val64=
)
+{
+    XlnxPMUIOIntc *s =3D XLNX_PMU_IO_INTC(reg->opaque);
+
+    xlnx_pmu_io_irq_update(s);
+}
+
+static void xlnx_pmu_io_irq_ack_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxPMUIOIntc *s =3D XLNX_PMU_IO_INTC(reg->opaque);
+    uint32_t val =3D val64;
+
+    /* Only clear */
+    val &=3D s->regs[R_IRQ_STATUS];
+    s->regs[R_IRQ_STATUS] ^=3D val;
+
+    /* Active level triggered interrupts stay high.  */
+    s->regs[R_IRQ_STATUS] |=3D s->irq_raw & ~s->cfg.level_edge;
+
+    xlnx_pmu_io_irq_update(s);
+}
+
+static const RegisterAccessInfo xlnx_pmu_io_intc_regs_info[] =3D {
+    {   .name =3D "IRQ_MODE",  .addr =3D A_IRQ_MODE,
+        .rsvd =3D 0xffffffff,
+    },{ .name =3D "GPO0",  .addr =3D A_GPO0,
+    },{ .name =3D "GPO1",  .addr =3D A_GPO1,
+        .rsvd =3D 0xffffffc0,
+    },{ .name =3D "GPO2",  .addr =3D A_GPO2,
+        .rsvd =3D 0xfffffc3f,
+    },{ .name =3D "GPO3",  .addr =3D A_GPO3,
+    },{ .name =3D "GPI0",  .addr =3D A_GPI0,
+        .rsvd =3D 0x300030,
+        .ro =3D 0xffcfffcf,
+    },{ .name =3D "GPI1",  .addr =3D A_GPI1,
+        .rsvd =3D 0xf0e0000,
+        .ro =3D 0xf0f1ffff,
+    },{ .name =3D "GPI2",  .addr =3D A_GPI2,
+        .rsvd =3D 0x1f00fcc0,
+        .ro =3D 0xe0ff033f,
+    },{ .name =3D "GPI3",  .addr =3D A_GPI3,
+        .ro =3D 0xffffffff,
+    },{ .name =3D "IRQ_STATUS",  .addr =3D A_IRQ_STATUS,
+        .rsvd =3D 0x40008787,
+        .ro =3D 0xbfff7878,
+    },{ .name =3D "IRQ_PENDING",  .addr =3D A_IRQ_PENDING,
+        .rsvd =3D 0x40008787,
+        .ro =3D 0xdfff7ff8,
+    },{ .name =3D "IRQ_ENABLE",  .addr =3D A_IRQ_ENABLE,
+        .rsvd =3D 0x40008787,
+        .ro =3D 0x7800,
+        .post_write =3D xlnx_pmu_io_irq_enable_postw,
+    },{ .name =3D "IRQ_ACK",  .addr =3D A_IRQ_ACK,
+        .rsvd =3D 0x40008787,
+        .post_write =3D xlnx_pmu_io_irq_ack_postw,
+    },{ .name =3D "PIT0_PRELOAD",  .addr =3D A_PIT0_PRELOAD,
+        .ro =3D 0xffffffff,
+    },{ .name =3D "PIT0_COUNTER",  .addr =3D A_PIT0_COUNTER,
+        .ro =3D 0xffffffff,
+    },{ .name =3D "PIT0_CONTROL",  .addr =3D A_PIT0_CONTROL,
+        .rsvd =3D 0xfffffffc,
+    },{ .name =3D "PIT1_PRELOAD",  .addr =3D A_PIT1_PRELOAD,
+        .ro =3D 0xffffffff,
+    },{ .name =3D "PIT1_COUNTER",  .addr =3D A_PIT1_COUNTER,
+        .ro =3D 0xffffffff,
+    },{ .name =3D "PIT1_CONTROL",  .addr =3D A_PIT1_CONTROL,
+        .rsvd =3D 0xfffffffc,
+    },{ .name =3D "PIT2_PRELOAD",  .addr =3D A_PIT2_PRELOAD,
+        .ro =3D 0xffffffff,
+    },{ .name =3D "PIT2_COUNTER",  .addr =3D A_PIT2_COUNTER,
+        .ro =3D 0xffffffff,
+    },{ .name =3D "PIT2_CONTROL",  .addr =3D A_PIT2_CONTROL,
+        .rsvd =3D 0xfffffffc,
+    },{ .name =3D "PIT3_PRELOAD",  .addr =3D A_PIT3_PRELOAD,
+        .ro =3D 0xffffffff,
+    },{ .name =3D "PIT3_COUNTER",  .addr =3D A_PIT3_COUNTER,
+        .ro =3D 0xffffffff,
+    },{ .name =3D "PIT3_CONTROL",  .addr =3D A_PIT3_CONTROL,
+        .rsvd =3D 0xfffffffc,
+    }
+};
+
+static void irq_handler(void *opaque, int irq, int level)
+{
+    XlnxPMUIOIntc *s =3D XLNX_PMU_IO_INTC(opaque);
+    uint32_t mask =3D 1 << irq;
+    uint32_t prev =3D s->irq_raw;
+    uint32_t temp;
+
+    s->irq_raw &=3D ~mask;
+    s->irq_raw |=3D (!!level) << irq;
+
+    /* Turn active-low into active-high.  */
+    s->irq_raw ^=3D (~s->cfg.positive);
+    s->irq_raw &=3D mask;
+
+    if (s->cfg.level_edge & mask) {
+        /* Edge triggered.  */
+        temp =3D (prev ^ s->irq_raw) & s->irq_raw;
+    } else {
+        /* Level triggered.  */
+        temp =3D s->irq_raw;
+    }
+    s->regs[R_IRQ_STATUS] |=3D temp;
+
+    xlnx_pmu_io_irq_update(s);
+}
+
+static void xlnx_pmu_io_intc_reset(DeviceState *dev)
+{
+    XlnxPMUIOIntc *s =3D XLNX_PMU_IO_INTC(dev);
+    unsigned int i;
+
+    for (i =3D 0; i < ARRAY_SIZE(s->regs_info); ++i) {
+        register_reset(&s->regs_info[i]);
+    }
+
+    xlnx_pmu_io_irq_update(s);
+}
+
+static const MemoryRegionOps xlnx_pmu_io_intc_ops =3D {
+    .read =3D register_read_memory,
+    .write =3D register_write_memory,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 4,
+        .max_access_size =3D 4,
+    },
+};
+
+static Property xlnx_pmu_io_intc_properties[] =3D {
+    DEFINE_PROP_UINT32("intc-intr-size", XlnxPMUIOIntc, cfg.intr_size, 0),
+    DEFINE_PROP_UINT32("intc-level-edge", XlnxPMUIOIntc, cfg.level_edge, 0=
),
+    DEFINE_PROP_UINT32("intc-positive", XlnxPMUIOIntc, cfg.positive, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void xlnx_pmu_io_intc_realize(DeviceState *dev, Error **errp)
+{
+    XlnxPMUIOIntc *s =3D XLNX_PMU_IO_INTC(dev);
+
+    /* Internal interrupts are edge triggered?  */
+    s->cfg.level_edge <<=3D 16;
+    s->cfg.level_edge |=3D 0xffff;
+
+    /* Internal interrupts are postitive.  */
+    s->cfg.positive <<=3D 16;
+    s->cfg.positive |=3D 0xffff;
+
+    /* Max 16 external interrupts.  */
+    assert(s->cfg.intr_size <=3D 16);
+
+    qdev_init_gpio_in(dev, irq_handler, 16 + s->cfg.intr_size);
+}
+
+static void xlnx_pmu_io_intc_init(Object *obj)
+{
+    XlnxPMUIOIntc *s =3D XLNX_PMU_IO_INTC(obj);
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
+    RegisterInfoArray *reg_array;
+
+    memory_region_init(&s->iomem, obj, TYPE_XLNX_PMU_IO_INTC,
+                       XlnxPMUIOIntc_R_MAX * 4);
+    reg_array =3D
+        register_init_block32(DEVICE(obj), xlnx_pmu_io_intc_regs_info,
+                              ARRAY_SIZE(xlnx_pmu_io_intc_regs_info),
+                              s->regs_info, s->regs,
+                              &xlnx_pmu_io_intc_ops,
+                              XLNX_PMU_IO_INTC_ERR_DEBUG,
+                              XlnxPMUIOIntc_R_MAX * 4);
+    memory_region_add_subregion(&s->iomem,
+                                0x0,
+                                &reg_array->mem);
+    sysbus_init_mmio(sbd, &s->iomem);
+
+    sysbus_init_irq(sbd, &s->parent_irq);
+}
+
+static const VMStateDescription vmstate_xlnx_pmu_io_intc =3D {
+    .name =3D TYPE_XLNX_PMU_IO_INTC,
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, XlnxPMUIOIntc, XlnxPMUIOIntc_R_MAX),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void xlnx_pmu_io_intc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->reset =3D xlnx_pmu_io_intc_reset;
+    dc->realize =3D xlnx_pmu_io_intc_realize;
+    dc->vmsd =3D &vmstate_xlnx_pmu_io_intc;
+    dc->props =3D xlnx_pmu_io_intc_properties;
+}
+
+static const TypeInfo xlnx_pmu_io_intc_info =3D {
+    .name          =3D TYPE_XLNX_PMU_IO_INTC,
+    .parent        =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(XlnxPMUIOIntc),
+    .class_init    =3D xlnx_pmu_io_intc_class_init,
+    .instance_init =3D xlnx_pmu_io_intc_init,
+};
+
+static void xlnx_pmu_io_intc_register_types(void)
+{
+    type_register_static(&xlnx_pmu_io_intc_info);
+}
+
+type_init(xlnx_pmu_io_intc_register_types)
diff --git a/include/hw/intc/xlnx-pmu-iomod-intc.h b/include/hw/intc/xlnx-p=
mu-iomod-intc.h
new file mode 100644
index 0000000000..3478d8cf6c
--- /dev/null
+++ b/include/hw/intc/xlnx-pmu-iomod-intc.h
@@ -0,0 +1,58 @@
+/*
+ * QEMU model of Xilinx I/O Module Interrupt Controller
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
+#ifndef XLNX_PMU_IO_INTC_H
+#define XLNX_PMU_IO_INTC_H
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/register.h"
+
+#define TYPE_XLNX_PMU_IO_INTC "xlnx.pmu_io_intc"
+
+#define XLNX_PMU_IO_INTC(obj) \
+     OBJECT_CHECK(XlnxPMUIOIntc, (obj), TYPE_XLNX_PMU_IO_INTC)
+
+/* This is R_PIT3_CONTROL + 1 */
+#define XlnxPMUIOIntc_R_MAX (0x78 + 1)
+
+typedef struct XlnxPMUIOIntc {
+    SysBusDevice parent_obj;
+    MemoryRegion iomem;
+
+    qemu_irq parent_irq;
+
+    struct {
+        uint32_t intr_size;
+        uint32_t level_edge;
+        uint32_t positive;
+    } cfg;
+
+    uint32_t irq_raw;
+
+    uint32_t regs[XlnxPMUIOIntc_R_MAX];
+    RegisterInfo regs_info[XlnxPMUIOIntc_R_MAX];
+} XlnxPMUIOIntc;
+
+#endif /* XLNX_PMU_IO_INTC_H */
--
2.14.1

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
