Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3431941wre;
        Tue, 29 May 2018 04:06:57 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKYHU7VDa2YCBLRBHBJWP4CGFrB3jpDRW8nyHMThPsQdSSf3v1PHEzl3J6KrLjHblcht1Xs
X-Received: by 2002:a37:cfcd:: with SMTP id v74-v6mr14578445qkl.240.1527592017869;
        Tue, 29 May 2018 04:06:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527592017; cv=none;
        d=google.com; s=arc-20160816;
        b=xO6vD9VF3B5UWOdO81odB7GCk5YeiryesAQRgxPf2WaF4XZozWMXHdnuJ0r9SgwN2V
         GdCr2ZQkVWfPbB+cbB198EB3GtAJpztybovbINi4JW+FhMmDTl+RRo9WXeQPt9m5aC4k
         gHFX9Oc3FmnYxG9SA5ubbKgbNVIFbAI3EyiIIwmE8WWQNoby/J2DxfG22iON4d1b/6pj
         m5nnr3vGwKJsjWyIl5M9st5OII+DqcPM6BRSkgEiuI5Y5s8OxSeJLP8gF37xshDFBmQy
         il15aXJDtHnYCIuQgdqzYoJ7fdndsrRVJN9I633O9N74N+2NsgQqN+8Pv1SCVCDt8/sx
         YlZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=IBdW9urt/Bj/ukE7s7YUy2hhqGyH3D1q3D6qpRmZpnI=;
        b=uy0oGkdtK2wpubiKYG6lCGTTaMBfkjjjQzQ1yujC2iwRdDSzCd4w/XHBisZ2aiYNYM
         tgEfnW5yUpWChC4H/DiTkB9WBLoF8o65vzQtrcOp4uGVx6BXndcO5S7VmVc/O4GR1w2p
         9Sk503nf41CLItvUXrH5HwI+unXKbsb25gxpQKaXsEqfXM8WrvKEQDSTOZ+3iXZ55D/G
         1jYaDg0RKFt6/CShVitEVCO+HqI6rHkHVqTPyvRcmKo0LTOJXDxwZQTo5s51GkrbRg0X
         bUSpgBjwi3000LTjU639j0gmosnFsCWGT1OXWJ1mBrgI2v6T2cdhWAHnXiDDtdKsBKtw
         38eA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=1E1tmxbY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y9-v6si8271725qvj.136.2018.05.29.04.06.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 04:06:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=1E1tmxbY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60175 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNcSv-0006BT-Ag
	for alex.bennee@linaro.org; Tue, 29 May 2018 07:06:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fNcRD-00051i-Io
	for qemu-arm@nongnu.org; Tue, 29 May 2018 07:05:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fNcRA-0006CL-Dy
	for qemu-arm@nongnu.org; Tue, 29 May 2018 07:05:11 -0400
Received: from mail-sn1nam01on0041.outbound.protection.outlook.com
	([104.47.32.41]:52050
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1fNcRA-0006BN-3w; Tue, 29 May 2018 07:05:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=vAWDN8YeVuPl2laL7rP3pO7enQhwbMPBOiaDPiO7Oe0=;
	b=1E1tmxbYfjdCk74832Y7cNNiduT6Qd62tzqlS5Diedvv64i+F6NYzX6k90TPGfjT/s6+TV/QVr3d6oz8rw403IN/CppmsUN5K6eY1+haSJ5ji3QsYBRndyL6UUgVoQO3K0phNvViQcPYUgM+/ue1RYykzuGssJ0L7B9tFnJLryM=
Received: from CY4PR02CA0038.namprd02.prod.outlook.com (2603:10b6:903:117::24)
	by BYAPR02MB4134.namprd02.prod.outlook.com (2603:10b6:a02:fa::27)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.797.11;
	Tue, 29 May 2018 11:05:05 +0000
Received: from SN1NAM02FT019.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::201) by CY4PR02CA0038.outlook.office365.com
	(2603:10b6:903:117::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.797.11 via
	Frontend Transport; Tue, 29 May 2018 11:05:04 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT019.mail.protection.outlook.com (10.152.72.130) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.820.8
	via Frontend Transport; Tue, 29 May 2018 11:05:04 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:45429
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fNcR6-0007fh-3X; Tue, 29 May 2018 04:05:04 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fNcR0-0006Ja-VM; Tue, 29 May 2018 04:04:59 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w4TB4vY2003988; Tue, 29 May 2018 04:04:57 -0700
Received: from [172.19.119.14] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fNcQy-0006J3-P7; Tue, 29 May 2018 04:04:57 -0700
Date: Tue, 29 May 2018 13:04:55 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20180529110455.n2hjf5stvwq5lrsh@toto>
References: <20180503115620.10596-1-edgar.iglesias@gmail.com>
	<20180503115620.10596-3-edgar.iglesias@gmail.com>
	<c7409bf9-b336-8df2-bc2a-ace45077bcce@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c7409bf9-b336-8df2-bc2a-ace45077bcce@amsat.org>
User-Agent: NeoMutt/20170609 (1.8.3)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(39850400004)(346002)(376002)(39380400002)(396003)(2980300002)(438002)(189003)(199004)(106002)(106466001)(81156014)(305945005)(2870700001)(33716001)(4326008)(476003)(2906002)(47776003)(11346002)(426003)(58126008)(23756003)(54906003)(229853002)(39060400002)(9786002)(5660300001)(486006)(356003)(50466002)(446003)(316002)(126002)(76176011)(6916009)(575784001)(478600001)(336012)(59450400001)(1076002)(36386004)(186003)(8676002)(53546011)(6246003)(81166006)(9686003)(63266004)(77096007)(26005)(8936002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4134; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT019;
	1:EI+S16s86mkMWVxYr4pwJd5+1V3dH2W2uRMXs9P9xguTDHHXwvOwP80jq7vLpVeAni9Kzt05RbDP9PJ1vINL6QJIM+igMNQhE9aYJSTnLXWWgHmXpOwjSre9lVIFyZfG
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:BYAPR02MB4134; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4134;
	3:yTStU9wYLpFoXaBzE0tzwfnWB3fZ0W1YRZheG4R4FoAqRL17DwchTwJTTkNzLv6XW9UaGDqlGu6g01Es29wJI0wPuQArE/JE0HIiLn7qKMlIscA148yNYV7CEMXzarZC/1TSnVyrasgHhEZ6nMWjj3Zua4pTQK61G+PUNkvxf2ReBYdb1HS8A9vTpEmYJaj2Gtphs24ZFrZFvwwLl9uQJxdGywOv1+tfP347XqcQ3HWzmyR3noXqa4EgPKXuj7J8lJ272n9xT8KRdV6UtttrsoYmtvPvfZ3dU5Fo3msM4cE5gvM0NJci3iWXRRH7nkxVYAYOBm9is992AoHd0vUJbYmSfIxhJDT8hyAhn/xXOV4=;
	25:nxkSJHyik0h97N2Pz5wwu2pMwGFJviKUWV/cUYDWLBw1u2IF29skDmGX1KXOWRDht3BTrTqfVa/fGbVwjMw0qxWmOzdsTIpmrcVBLuXWSRLfUxetXB6D+2QIEiSBPYwKaQbHsRzbG/21jxVv4B3F1ogb/l23jHRS74PM5vxAv3PcHQOD6E0mIXobS9SVtb2OzRpmBT4BFHIst/bZ1fGqKTzCGBM3lODRfMpptNloUZN1r7LllpHQoU2aBnlXDvJXefIE/+a04DrFK0ivR5LNXoqagXM+6gcnlLtDmhLgkgNaX37p3omzLJeYX5VWj/7NcvkpT0hffEvIt5DAcnr7eg==
X-MS-TrafficTypeDiagnostic: BYAPR02MB4134:
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4134;
	31:zsWioxD67KBEWpSispWoAGo0NhyZ+EhUl3QhbhUaHTvH0MVWLrUxb+9Hru+NtYhB62wwHTYKAtUkvzm8kZwV+j0HfQVrSFg1W/7e0+UdgTld34oX/zVXKE0uQYYsBjHx6O+E8TzERk9EeFSdGaVw57gV2yeitjFSRCOBbv89RAOxlvcf75ri4FNShyhpL+LEHLwch1hiwOnJjyDmCsX2kyrgzg4xnNTVQTuzw6usTCg=;
	20:cs+NYwsqTJcSyNlZ3zkhAN4fadvMSJsV6XpQEXLhB9DfgsTyttgKuIaLVkpgZxlUNAa6eACCPzH7Jlabs1axkm97MLWcNzspK1p07NoEK02ERsx3Fo5s/AJpCniICyvaqjtGclmmRvnJo7/1RQjBbVVZqw+Fpi+QHq5ghGhCMunnG/F/jGAWIK6ZV3oGX7hJcE6T/ljIF9cEcB2EgnWSF+6eMPJOf7sRzqYNIPAwXUN/ILYXJ2mEcmj0NCtnUP5MdNoJL3LVWoT1c4q70qESpACvabbUBIImoe5tYEnyAZQY6ddAg5dSPIgTsGH4Jx5Q246BGuPK4jtAzkRDbqzEQIuZu5E6vYFnsbmXH4h3UjyPfhIb+PLdARUp0TDazeRGNyIEBcmHjwCm7EEHhalDQkfq1IZjj6nOurzXS4nvajUPbzh7BmwXaYo+v00M4R7xRJXMCwGDeIsrFu6E4967VcBVuzJ1UIptReS2ISvc95MLCRH2Se4S3CMc3XF0rHv4
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BYAPR02MB41347C69143779857022D892AB6D0@BYAPR02MB4134.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93004095)(3231254)(944501410)(52105095)(10201501046)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:BYAPR02MB4134; BCL:0; PCL:0; RULEID:; SRVR:BYAPR02MB4134; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4134;
	4:UY0GtiY8umoJ2sUf/8XwJKErHsiUVBVlO+MYwFvtGk3SBL1a4JHhddC4x06zsG9k5Fns+rY0M0x8Mp5yQsMrk+7o0feSmobtptYXzaePWD0c8I7sXR4oa2AItlI8OQXgYJOBBPQifPF9Z9SMlsjYQpvRq4If8kPWThkSMT1QTOHonokx72BJRt/TExt4Uf8t/fzHLvnejJhrqkuUEdVU4cJwlmUaD1yaSOIJ4d2EsDczTLmPQSPbL2wk2K1vLm3uZotW6P59bpS5yD546GcgWQZ0cfdpysWVHtO4z8MS+3t+x6E/0XJe+ZqWjU7I57iP
X-Forefront-PRVS: 0687389FB0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BYAPR02MB4134;
	23:+s06jxC9KMvFDIXUE0Ey3gWe1hfTKk1YU4Bt6KmBJ?=
	=?us-ascii?Q?uy70YJoUjGH1satM0r5nQDcLywZ7ypeYhxkW+5xmWr9lMbt7TWlaWG3XrzfB?=
	=?us-ascii?Q?ikM41zsx3R9lSsY/QI3e/f44H5tA8C4rwgsMO9V8yVV57tQ0BVUh1ZyEdKxL?=
	=?us-ascii?Q?4psEhEl1Az3Y26LM6c6xlELuIISbbmVHZVf/igL09rX2KNF0c9L8riv/y0yO?=
	=?us-ascii?Q?QqmmGcC4n15kJ/QsOzsRNsWW2uE6fjGpyQ5eIB2gqWh9YAx8UkprkPgByX11?=
	=?us-ascii?Q?erYxpp2YKWrNnZrpRRLPxG74zDiOjYKFcivlSbxjY5AWjAtpQgsa9N7iJNMB?=
	=?us-ascii?Q?J9StLG5q8icfa5SVRD19Vc/iahyGSLiX056KkSLtJbmDzJmkf5FDBsN5Mv64?=
	=?us-ascii?Q?zLva/wuh4DiesFZpNp1PMtwmAwIhrc6niI+g6cKvGUwgJfeDr14JVkf4UXkB?=
	=?us-ascii?Q?9eFg5zzVmzkIvHDCLVptUz5J3miA7WRhRONqqWJNsHMxDRQDtgNwmv40VKDa?=
	=?us-ascii?Q?QVdJviRCPae7edmO65EByJSp/xjGyaJ6YU+fOFml90kFMkSnigm7BWCoEDlX?=
	=?us-ascii?Q?+AH0D7Nii3aukrOUiFw6J6FvU1kf2uJ9ClbDzBAv9Qw12nDkaj/h9T7tbSUA?=
	=?us-ascii?Q?/hHxoKZJOxOmrazkKv/jRcsnVco8Ew5HLd56h6mCKlC80n8JamnMvhafCNoE?=
	=?us-ascii?Q?XZymdDfypM7NOKR1C1oWjKKNjhA2of2xx8UhzbSadA0Rnk4Pne6ynU08H5ic?=
	=?us-ascii?Q?INhbYEsK3I8Qofnn5bwQdPwvAvIRqdEhEKuTIyqb2oeWt5Sgvm4/Xw+aWCz7?=
	=?us-ascii?Q?3qunIeWmjVqff/LP5Rhm7QZUsDSGtlYG4qrehEp7UR9oc6bdpmaUit/4ZEAg?=
	=?us-ascii?Q?uNtUIs/Csswax1QmwbY55UQG7217lp3yYo16KyJsk6R/L42Flqa1tYFZ2CpV?=
	=?us-ascii?Q?Qi4nccm3oFiW6esrWmA9QjkgJlud4b9oNiHL4eSumCTOlH1D4vTqsvoaCAWh?=
	=?us-ascii?Q?SnJsAL5SQs1NkhT1n9xIXImCt3OuzKsJnvdvTROVPMjZ1YJT7xjm/UMAmgJ0?=
	=?us-ascii?Q?FffZGBNHGlnSsFOwLQoz+/xCiG07TfqLpUFFY5yy/weeU6AxkwPYPUF0YIbB?=
	=?us-ascii?Q?jibFQmTqfmb6LGVfO9S+Mx0TIx8V5kyhhqaGvxSOvB2vMwLueoUUJkR8DkLS?=
	=?us-ascii?Q?ILNmg/6jgKRyBeZd/aald1Fz7n9DuSjBvbOmCR/kfsDdKQc1293ABzWYmVoB?=
	=?us-ascii?Q?EA+iDhTvOuAX2DlVbI=3D?=
X-Microsoft-Antispam-Message-Info: ZaGnFvwPX2+L8uqs/ndApn8dG7+dt8HohTwGnDulR3NIvy37giN9izrLh02s1yWMqaXIbGgU3j6gfE7hEVkUpKe/7aq3Npg5GzQx07pnjHCJNuc1mDp2+1mdWc1N8uk6mUJ261PyDyK8LiYsvcxSXljcFMJDkp+JLuxamlJgx3SXgeND5nEZ6XZsbnckQ2UC
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4134;
	6:8fPpUTBkYTDpjFQPqHUXsUGljTeLU6i6cLngyz/zsZioR66B5m0+zpxfPfpVjTAcFKUL1DFRT0fz5MYj5XOZ4jOmW7wnGlPUxxEABYu7L5WhBGodG0hr1FXc5qvZ1CeztVy+xOdvE82pjtYAJyej8b48dgSMi/oV0dnqu0QyDbnXqLJpUQmAmvZdFrky061Rr2DbPMP5K1nrVYVozX7Jp3NVTGZlbicsuGXLF2p8xb8NZTW1QgDXrXJxPkM+o4k8kJ7HS4AFzmyObLQzGNdgx6Gt/BWjbmPeIMT2NXw0xjCKjEAS41wWcwKP0JX55e0zOATFP/NrZjPtVgEOyOLBSRW+YsXY6T6x0bPvaKUER6D6O+mRiOB319cyRlvyTy6nSacLXNdpiWNNTLzRGLP9zu+9/UvI1B984G7hCG/Uk/5KYJMm0iKcxrK6yYo3brOHREP5ANe0pFIAk0QpZwR7ag==;
	5:iwIrOlHpnA6YZCTXpYTcpv7hc8UmUR/sGAniof38ooEkCrSOdLdd8itbW+URPVYNIFg3kZuX+kF9Hy7uMIomfx06RS0OpjdMpAFM5Y8sl1ooD0lDrf/NN7uYavZeGkqaSvFuvbDPzWLthqiHYppGJ3BlBwvQ6SOtC5wTDPiCbr8=;
	24:v2vJ4KFYcWHcxCS5d8Nn5vRK3bLx+Ju1dn5Ho/IJRqZUC9bXgf2OwaeqrBAs1RPAKGQ1jeSRGW77qhRJCMhn6BvI+XwgvmI1wHOHDRKK8JE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4134;
	7:hSMqcjuyqW3t+lOxWrmABhVC8bl/jEli1OrX6CA2Uvf6B2rdOQFSdzZS40eh+m1iLadIijVWFNG59e4xwp7GTx4t7TEmRjCw4atoipQym4uYjLZnTnH6CrdNT59PiRPKccRqo4CeDnCM1+/W3BrI/B6BlsvLtuUafAUGNsjZEu4cIDW2SmCr2UzOYvYPK/KeiK5OhY1cagtX5jTJQZV4MQgGP3els2YqGNDMDMMvtOweG9ke4jUaBAeua1flDYtm
X-MS-Office365-Filtering-Correlation-Id: 10a10d69-c612-4d98-969c-08d5c5540838
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2018 11:05:04.5363 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a10d69-c612-4d98-969c-08d5c5540838
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4134
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.41
Subject: Re: [Qemu-arm] [PATCH v1 2/2] xlnx-zynqmp: Swap Cortex-R5 for
 Cortex-R5F
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
Cc: peter.maydell@linaro.org, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	qemu-devel@nongnu.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cWdje7Ot9SaA

On Thu, May 10, 2018 at 03:09:46PM -0300, Philippe Mathieu-Daud=E9 wrote:
> Hi Edgar,
>=20
> On 05/03/2018 08:56 AM, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >=20
> > The ZynqMP has Cortex-R5Fs with the optional FPU enabled.
>=20
> What about updating the xlnx-zcu102 machine description too?
>=20
>   mc->desc =3D "Xilinx ZynqMP ZCU102 board with 4xA53s and 2xR5Fs ..."

Yes, I've added the 'F' in v2 (I've kept the Rb and Tb lines).
Will send v2 in a moment.

Cheers,
Edgar


>=20
> >=20
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>=20
> Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> Tested-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> I just noticed we can not get information for the R profile cores via
> the monitor:
>=20
> (qemu) info cpus
> * CPU #0: thread_id=3D19283
>   CPU #1: thread_id=3D19284
>   CPU #2: thread_id=3D19285
>   CPU #3: thread_id=3D19286
>=20
> same with "info registers -a"
>=20
> > ---
> >  hw/arm/xlnx-zynqmp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> > index 505253e0d2..efeb53c732 100644
> > --- a/hw/arm/xlnx-zynqmp.c
> > +++ b/hw/arm/xlnx-zynqmp.c
> > @@ -116,7 +116,7 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState =
*s, const char *boot_cpu,
> >          char *name;
> > =20
> >          object_initialize(&s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
> > -                          "cortex-r5-" TYPE_ARM_CPU);
> > +                          "cortex-r5f-" TYPE_ARM_CPU);
> >          object_property_add_child(OBJECT(s), "rpu-cpu[*]",
> >                                    OBJECT(&s->rpu_cpu[i]), &error_abort=
);
> > =20
> >=20
