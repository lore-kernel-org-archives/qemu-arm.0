Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp5543845wrw;
        Wed, 14 Nov 2018 02:32:08 -0800 (PST)
X-Google-Smtp-Source: AJdET5cZEnQPuMtG3QE8feMVX3sgk01AAnoUR9EQG9C6+/dOadZVMQEDZA3jUMHMjxoHNr0v0bfo
X-Received: by 2002:ac8:3222:: with SMTP id x31mr1083312qta.275.1542191528661;
        Wed, 14 Nov 2018 02:32:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542191528; cv=none;
        d=google.com; s=arc-20160816;
        b=CM4/lr9V963dlFh/sYkiZqMcxHcO6GHcTO8f3gA+0ceD97EBCjr53WTxy2ZyL4su1n
         9Dym7ndv83WfN5M4Kp7tXEc6O1C8vXtFCqdDolsXgfRsutvmbz1JHx2SzkXvh8LiMn9Q
         pqe7AI3JSKbjGivG0/aKX32fF9db1Q0jMhiFmWQiMVvSHEagjk6SOzomXYADhsXf1Xtk
         IImhaI7oY6Wdb3gq/0cRidl7iebEgOHRoaSMgL5hJlDwJMTvOu2McOYWdu2vYgK5LdyC
         5nNkWFtIjfi5ErOU3DKV1UkfW40VjDu/BcHTk4Rre4w3IkqPtZbLNWi4HxTK79xSiH3h
         HSoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature;
        bh=ae23rMRh2/qCTEuvl0pVx3X80wToJJeaD7F1qqG6fy4=;
        b=JUKN+Z5PY8htW1knz8rrHM/kK0UGaX9RGRz6zxtBXSHNNtBtn8C3mTo+HBWDcVJKpD
         yk26Bc6cqmwzEwUUb9kr7KG2N2ms2vLapVq9bpCqrOUX3kOs7O8VFbQOg2dUJRYMBD01
         ozGW3CPh+L36FDJsH5XFPRzofZ6DvonSZJhu+tNFGONBvkf94DX1etOAnNAX69DwZChs
         vFI7ETE/qiiEIWQT4E7Thc1GsbWK2tUsvRQdR7MTITfNFTz+AcBNLyKmmbHL/hkLSRdr
         PuTOowTvBOCNokZMETWNvo3YXKBePlL8fZfzUOqrbKZVbf6nNsUsyCUEhULgnafKotEi
         Ws9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=NOqiNxZD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l18si15423qvl.106.2018.11.14.02.32.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Nov 2018 02:32:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=NOqiNxZD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59370 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMsSt-00032a-Ps
	for alex.bennee@linaro.org; Wed, 14 Nov 2018 05:32:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gMsSh-00032Q-Rp
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 05:31:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gMsSc-0005wy-PK
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 05:31:55 -0500
Received: from mail-eopbgr730080.outbound.protection.outlook.com
	([40.107.73.80]:18842
	helo=NAM05-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1gMsSc-0005v1-D6; Wed, 14 Nov 2018 05:31:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ae23rMRh2/qCTEuvl0pVx3X80wToJJeaD7F1qqG6fy4=;
	b=NOqiNxZDx/5uu+3RMr553xN5odOnESSHZeaHceUkPV1OFilQC06kRmoKLq8IeRgKhZhLmVomBwIgwCK1De34PVLme6dyKPWjff0Tgn8V2CMlMEyHYY3d7Exf21cxvix6ZGRjEECvudbzUPQRp241mY+4LnbEGSLmYCblUcti7fg=
Received: from MWHPR02CA0045.namprd02.prod.outlook.com (2603:10b6:301:60::34)
	by BYAPR02MB4453.namprd02.prod.outlook.com (2603:10b6:a03:57::26)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1294.23;
	Wed, 14 Nov 2018 10:31:43 +0000
Received: from SN1NAM02FT059.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::203) by MWHPR02CA0045.outlook.office365.com
	(2603:10b6:301:60::34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1294.26 via
	Frontend Transport; Wed, 14 Nov 2018 10:31:42 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT059.mail.protection.outlook.com (10.152.72.177) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1339.15
	via Frontend Transport; Wed, 14 Nov 2018 10:31:42 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gMsST-0002Kt-P2; Wed, 14 Nov 2018 02:31:41 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gMsSO-0000J2-LQ; Wed, 14 Nov 2018 02:31:36 -0800
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wAEAVUKI022406; Wed, 14 Nov 2018 02:31:30 -0800
Received: from [10.23.116.79] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gMsSI-0000HF-BC; Wed, 14 Nov 2018 02:31:30 -0800
Date: Wed, 14 Nov 2018 11:31:29 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Luc Michel <luc.michel@greensocs.com>
Message-ID: <20181114103129.GD7447@toto>
References: <20181110081147.4027-1-luc.michel@greensocs.com>
	<20181110081147.4027-3-luc.michel@greensocs.com>
	<20181113105216.GG1148@toto>
	<2785510b-5db5-7ded-2404-7d5653a98764@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2785510b-5db5-7ded-2404-7d5653a98764@greensocs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(346002)(136003)(376002)(396003)(39860400002)(2980300002)(438002)(199004)(189003)(5024004)(14444005)(446003)(33716001)(39060400002)(426003)(46406003)(9686003)(336012)(16586007)(58126008)(316002)(2906002)(478600001)(54906003)(9786002)(47776003)(486006)(476003)(11346002)(126002)(229853002)(6246003)(1076002)(6916009)(4326008)(5660300001)(50466002)(97756001)(77096007)(26005)(305945005)(76176011)(93886005)(36386004)(106466001)(23726003)(81166006)(81156014)(53546011)(63266004)(8936002)(8676002)(356004)(186003)(106002)(33656002)(18370500001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4453; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT059;
	1:JrOX8FLA2HdwtzYUAW+0tlqCGgUlCvbnneQOHc6wdBVGLmnn3VhxtB8j0Vc1yyoYZHZr6jfWDKT8fzuamnnejXpKZM3GhOut5L4vZwJp03zQ33tZxoKaZFKPrzdLPWYd
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfde3b46-aa5c-4795-fbc0-08d64a1c5e94
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BYAPR02MB4453; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4453;
	3:FeCxki6elV5NDGWup5tofEXFBeVetOJzEnj5KNdw8v35Ca8WVowWWec+OwPUsst8e/l9BqwJZqqFZW3NcCuZJ20tok0EcZsSiyZWFNy2lyd6Vnp6d9cdE5wqccUeq+8LjCuBV9giTAAFHKd9KLQKh+g2NKxyXC8pTi638W93CrDZwdi0Ka21A2vbSxhQvbRNEDef9A44XgIolLNguTpOeRH12DdUaiA+t218aBV6fgRqTYG9IR0QvBEFV2ZrkpBwpwggiUkL2oEqUttp7xjvrArODkIsga+m90QUTwSIKcBMBQONY6tB7AVq/Uy4Q/sOAAfuZhRRK6C4jlht2LXiCPoSdq/JynhCnHjpoOa24tU=;
	25:eRd85Xiu0MayNVlCyr4gJCvhjZ5KGSsuLDV1QLwi6TrndfNX8eVQZ1pqTRX6QT532zyrfPtUlnQ1FuGDyTyPcfr3v/E3UzDWUk+Im+oFhEvXuKBoUp8paLizUnUFgS1oUbsO4/6/2xE7XlsONbYe94O5namciKfLdaDlBm7eLXceiVRCcsv/q9//bO1x0fHl82rqE6L4xRJOwKwqnbZS/5yUcQCCI7jNKMyWcM4hCM7pGJjc7I0hHmwOAb98w4JqaKNCYTs1sYlAyI8X8FPhhCcp0Fx6kYwz90gZ+MmujeeU3VHkc3KaGDsmgb1dWYMs7B/XAVoe4sXIyUgU9Z3+Ow==
X-MS-TrafficTypeDiagnostic: BYAPR02MB4453:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4453;
	31:KNOjBEN6QQNOP/R9LmH92rhtOPDkN59oBOp6lXx4ITHg6l5/PabqkXjXfwU7VwsLS7cY6FfbUmLxDpLgjVQAoYoabq9rtRQdauWjI1W24P5OgP43jQuUYjyDFrPVMTFpVRRph+DKHSgEGoDGqQQqFVIEyK9w5tsiUCmNYBgBpgQR5zAsnsZJxxYUikrRM/2Do3Mgw20zd/MwbZcV631hCeqnIL+D0Aj1TvsNF12JfTs=;
	20:j716q2cyQrbbu/JQK1YWsio4ORy5oohCP7D9CvipKulKVDwrr+uAonKGvbpGbakWxIuFOS7UST7cSC6EA67oh+bG4jSmNsdr3G54v/XXrBZFwbZW45sZQkAac9uB+SsR9EXYsaMRLB6+BYfyNsjJY6kOS7rDaoa1kdcN5MolzVA1t2YKOjNImSaeGOse/r4Jo4xmXg1omJLJm+Okg75wLDmyfjciz7xzHRjqY9A9NOmEpQCUSDwgpSAvgzR/2d8+TG4fAlfnBHSkgvWJgf2/q4dViXpIh1/m2m3VI+rxXAQ+HPMdS89QH6CRcdAOChmhNa3YpzJN2CPlN5B7XQbsmQcsS4NPVWqLXu0fElj46awx2gVBlFZX48KH7VGdh7uX4/IqPsvbtsyjGNzju1k8YiX/Id2cIvv1K9XgcBh2rfwP9srBJKI2jdnuruGV7sjfeQI98O7z4/uqjZkoLsVR32Z9ryrWIkx8jwIpy9DMRxCE54gyiXpSp/2U/6v/NBwV
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BYAPR02MB4453451504BE32C9D0600C76ABC30@BYAPR02MB4453.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93004095)(10201501046)(3002001)(3231382)(944501410)(52105112)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:BYAPR02MB4453; BCL:0; PCL:0; RULEID:; SRVR:BYAPR02MB4453; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4453;
	4:Cvv7T/zDjXcm5yTF6kANVyZuiJTdzfZ/MwlHNsKQEcPsT4Wx2GYi6ShKz2WV9pQklXhbr0uCjWy2jxRXihTvgboPi5t3/Fdl2TEjs+YSCurbfVAcxTmN5DzHS1UgvCVXmQ0EiN1jAv5+ayy+/fmLsd4SjsKvPAmbOMouWA8afDW7tqGaMj3JGyyBggna+c5OzMpRlzUI1R9BaG4Aa6C5V+Krln4Vd/JD88loC3jJRKbO5tJooxp24+x1JiQPCFd46Em8+FT3SZZBnyQ0iKvYGOk0OHgeQxiwUS73OkJESszUBOzXQOUYq8afZd4bKdxB
X-Forefront-PRVS: 085634EFF4
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BYAPR02MB4453;
	23:8iNi6MmcgGnPq2Zbbs4Mo/Lf9JXP3KcYlM8pQG8+Y?=
	=?us-ascii?Q?wz9i+D/9xheEOftGRd7Tx6WPeRL2m7SRWp3qwyrdW3BShOfvZlRkevn4et4K?=
	=?us-ascii?Q?xJcGf72u2jabcmP0dtH0fUnVgSgtQRUuclWHvFhdzQ9t4HgOqc10FPZ9GGyo?=
	=?us-ascii?Q?lvaKCQ4vK+Ce4C97X6i9weLoyffKibWJ5apDn3WsJ9EkZdpOPilLw7/45UVb?=
	=?us-ascii?Q?GvMaQOWmOWQRR7NRwEL0KCzklE93vcvwuVzqmNA4UWWdQAAypbxoyQkKl0L9?=
	=?us-ascii?Q?Cb1grGgJt5LqSx2q/nCr1KXbrk3HquDhdRLP7mp9uavHD2cHPN5OjAwvXjKz?=
	=?us-ascii?Q?iKRea2lPGLuwyKUzxSsxm4aHXBZcu2YG6lJGqI8FSIuTB+62AtIOkCp154fS?=
	=?us-ascii?Q?iOeoppE1zNzBmjRAEG4z3UHwNOuNkAP4B5QcLGrNCjY6NtKxkvkzlox0bNe8?=
	=?us-ascii?Q?YyZ5rcfCh00goXXrvNCZd6tJT4ZS46ZbUWUZckGbfdGxp3AoXjG0jML6Cmbo?=
	=?us-ascii?Q?sQ4K4S8Eshnav4bl7Fxe/v9ZCh0N/qvP6yKWsnT4gZdC19xseOluqUdetFsj?=
	=?us-ascii?Q?6ZR36nMfT4ck/1hTrHZ0N7fxgn0KbJq4BtpHXg5swk/KYpmrmmd3t8KO4oAq?=
	=?us-ascii?Q?HUdccJkerGBl2iQmNeNPiFJOAxqiJP2lbldF5FEPCO21Fkuv4ICC8ts/xyKv?=
	=?us-ascii?Q?JTFCGX2rD1/pc3i6jM9bVJgVQs7IBOi+7AGtLm/0FFccJV8ChhV9E0aUZuq4?=
	=?us-ascii?Q?2m/im729l3VihUxws5m9ezjLR2CgDoq8QS67chxPH7A7jhEPAtw+ZMopQxjH?=
	=?us-ascii?Q?fX7HK00k4X9Bb/MS4acqc/VxDlkpTOJWvVihCijMHYNWforAu1kK/N9Ni/11?=
	=?us-ascii?Q?H3wXTKrepH0ivBgLkAM763gfTBMBc6VAmLsEkJflxA3gzMTvZKweBjwzd9Yp?=
	=?us-ascii?Q?AHslI8NcHZM60mKaLRafXRkYYOz1N/HRgCxdCfMrJC2niVK2z3CDcW7xBOI0?=
	=?us-ascii?Q?kJkqIMqCAjzKuVDGovBbiQO+vVgA8ODaLZqO+LTyTIvrW2hRIqYmtEYGQDBg?=
	=?us-ascii?Q?/pTHkYhun0fN4IWc3lx882f4E3kAjE7IWd08woT4D7zGYlddIFzS7hr++/kV?=
	=?us-ascii?Q?LhJFg8Q7tp/7slQEIUvC9zLKUg8ySq6Djwy7ttmyfcZVb8q4GqYQTAZISh72?=
	=?us-ascii?Q?0ZN+TBCTLKgIlHe0YiEaB6gUxQrMnhCkg0ToMwZ6YagftCJErq/Xr6qj/s7T?=
	=?us-ascii?Q?l9CqzYUBfr1ALytwP+J8CmnYUZ7vvF2QTeS3OeIyffjqlYmAeEImSM0CaAsA?=
	=?us-ascii?B?dz09?=
X-Microsoft-Antispam-Message-Info: K+l9A/i1OQFE9qbkiA2TqWpIVN/ZUDHO3OvAKaEuEAApfwMvrWZRY5gpwFpiXm4X68HqU2u10B/CIQQP71s2Wt7VZqDHvgkZnW3FrIXwDADprPL9gHYoQUZ79kMn8UyTcRb6VV8e83KF3nDTSpjoQ4TiddTPpK11eG7KsEN/kkSVhAcfxNOdDGWuDYxL4s4LHptso5D2dFucgW95yI25i4Lp6bP0dR4AiHBK4rqYinsEeh2Yu+CVaW/Q04zqUkbTK/esqhx6N6O7HfoqgxxXVFE4vFV8euOHBj5FAeJtPTJUZleu2CMGd6QE17Rurun4MGjoz9G5URJQQKVpxA4t582KoopHOfR3FTau1OrI5q4=
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4453;
	6:OVOSmqCbn+aYP3YR4OibT0Y15CR43JHbriaQz1C4ZaSsVMqOENlo8TKZmphNznxDgHoO0SY6jDppp70fUYJFBEjrmT0/wYI19ikKCr7hy4jBBSHPz0oHKf6LOYvddXI+wxbgP0Hh5esD2V7brRENbSGA8BjuASILOKoVTm9o7PE/sG5iasiM1FsKsWNi5othCn880v8ocQEShzCl/zu4YkbQyi5fn6e1d8J3zyuP9SUXeW2vm3f3hh5ywnAqtgqbuY5PQYrS8GsgDzv60r1DKdnXh7y+/0rvSFrSc0wufRJeMsoNH7SjyNuQ/qLuzUdxA/Eo4ELSXWtVQQKWLsHFJaq92UZcx6faNCqXWPULeowPkVKEmIdCwTZ5lhea1YH2w4VSTcTN9gcGtoOnIbwC9NEltQfUJJwrc7vyWviRBy5OZ0R9O8UZOxP0n/tCSttRBR0WRWt8GLzWgWxpqe+0dw==;
	5:OyM69t6/jSBc8Q0RwsjCWxtcpQlG8VaoZjx3tcnr2H7U8gWVr2zB2Y3GvmPw3JHZhaOH+lmV3P89dYQd+utPoyEX6PkcywDt0++QvLdYe75EAMw7Sp5h/YUee1LvK8LufcuU1zCGmuGs52dd7U4vW6bBne8PuSCbKXHc75ZJ4ng=;
	7:oIZa3CLQwNuO8OH76Pzoh6ulAbGn2liG0nYHGPbRyRH/ti6D1AwrgLcJN9eZm++doervKEV+GChhdGWNqiN7vtLg3ULbGHJKJ1t7ejuBmsuVpzQ99eBbpFuZ+RYoe7tkorZx9DRp8O6mcXlrzbEWGg==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2018 10:31:42.1642 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfde3b46-aa5c-4795-fbc0-08d64a1c5e94
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4453
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.73.80
Subject: Re: [Qemu-arm] [PATCH v5 02/16] gdbstub: introduce GDB processes
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
X-TUID: 0rcUcTXa2QvX

On Wed, Nov 14, 2018 at 11:14:31AM +0100, Luc Michel wrote:
> Hi Edgar,
> 
> On 11/13/18 11:52 AM, Edgar E. Iglesias wrote:
> > On Sat, Nov 10, 2018 at 09:11:33AM +0100, Luc Michel wrote:
> >> Add a structure GDBProcess that represent processes from the GDB
> >> semantic point of view.
> >>
> >> CPUs can be split into different processes, by grouping them under
> >> different cpu-cluster objects.  Each occurrence of a cpu-cluster object
> >> implies the existence of the corresponding process in the GDB stub. The
> >> GDB process ID is derived from the corresponding cluster ID as follows:
> >>
> >>   GDB PID = cluster ID + 1
> >>
> >> This is because PIDs -1 and 0 are reserved in GDB and cannot be used by
> >> processes.
> >>
> >> When no such container are found, all the CPUs are put in a unique GDB
> >> process (create_unique_process()). This is also the case when compiled
> >> in user mode, where multi-processes do not make much sense for now.
> >>
> >> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> >> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> >> ---
> >>  gdbstub.c | 76 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 76 insertions(+)
> >>
> >> diff --git a/gdbstub.c b/gdbstub.c
> >> index c4e4f9f082..0d70b89598 100644
> >> --- a/gdbstub.c
> >> +++ b/gdbstub.c
> >> @@ -27,10 +27,11 @@
> >>  #include "monitor/monitor.h"
> >>  #include "chardev/char.h"
> >>  #include "chardev/char-fe.h"
> >>  #include "sysemu/sysemu.h"
> >>  #include "exec/gdbstub.h"
> >> +#include "hw/cpu/cluster.h"
> >>  #endif
> >>  
> >>  #define MAX_PACKET_LENGTH 4096
> >>  
> >>  #include "qemu/sockets.h"
> >> @@ -294,10 +295,15 @@ typedef struct GDBRegisterState {
> >>      gdb_reg_cb set_reg;
> >>      const char *xml;
> >>      struct GDBRegisterState *next;
> >>  } GDBRegisterState;
> >>  
> >> +typedef struct GDBProcess {
> >> +    uint32_t pid;
> >> +    bool attached;
> >> +} GDBProcess;
> >> +
> >>  enum RSState {
> >>      RS_INACTIVE,
> >>      RS_IDLE,
> >>      RS_GETLINE,
> >>      RS_GETLINE_ESC,
> >> @@ -322,10 +328,13 @@ typedef struct GDBState {
> >>      int running_state;
> >>  #else
> >>      CharBackend chr;
> >>      Chardev *mon_chr;
> >>  #endif
> >> +    bool multiprocess;
> >> +    GDBProcess *processes;
> >> +    int process_num;
> >>      char syscall_buf[256];
> >>      gdb_syscall_complete_cb current_syscall_cb;
> >>  } GDBState;
> >>  
> >>  /* By default use no IRQs and no timers while single stepping so as to
> >> @@ -1749,10 +1758,24 @@ void gdb_exit(CPUArchState *env, int code)
> >>  #ifndef CONFIG_USER_ONLY
> >>    qemu_chr_fe_deinit(&s->chr, true);
> >>  #endif
> >>  }
> >>  
> >> +/*
> >> + * Create a unique process containing all the CPUs.
> >> + */
> >> +static void create_unique_process(GDBState *s)
> >> +{
> >> +    GDBProcess *process;
> >> +
> >> +    s->processes = g_malloc0(sizeof(GDBProcess));
> >> +    s->process_num = 1;
> >> +    process = &s->processes[0];
> >> +
> >> +    process->pid = 1;
> >> +}
> >> +
> >>  #ifdef CONFIG_USER_ONLY
> >>  int
> >>  gdb_handlesig(CPUState *cpu, int sig)
> >>  {
> >>      GDBState *s;
> >> @@ -1846,10 +1869,11 @@ static bool gdb_accept(void)
> >>      }
> >>  
> >>      s = g_malloc0(sizeof(GDBState));
> >>      s->c_cpu = first_cpu;
> >>      s->g_cpu = first_cpu;
> >> +    create_unique_process(s);
> >>      s->fd = fd;
> >>      gdb_has_xml = false;
> >>  
> >>      gdbserver_state = s;
> >>      return true;
> >> @@ -2002,10 +2026,58 @@ static const TypeInfo char_gdb_type_info = {
> >>      .name = TYPE_CHARDEV_GDB,
> >>      .parent = TYPE_CHARDEV,
> >>      .class_init = char_gdb_class_init,
> >>  };
> >>  
> >> +static int find_cpu_clusters(Object *child, void *opaque)
> >> +{
> >> +    if (object_dynamic_cast(child, TYPE_CPU_CLUSTER)) {
> >> +        GDBState *s = (GDBState *) opaque;
> >> +        CPUClusterState *cluster = CPU_CLUSTER(child);
> >> +        GDBProcess *process;
> >> +
> >> +        s->processes = g_renew(GDBProcess, s->processes, ++s->process_num);
> >> +
> >> +        process = &s->processes[s->process_num - 1];
> >> +
> >> +        /* GDB process IDs -1 and 0 are reserved */
> >> +        process->pid = cluster->cluster_id + 1;
> > 
> > This may be theoretical but since both pid and cluster_id are uint32_t
> > you may end up with 0 here.
> > 
> > You may want to limit cluster_id's to something like the range 0 - INT32_MAX.
> That would be an efficient solution to workaround this problem. However
> it seems a bit artificial to limit the cluster_id range in the "generic"
> CPU_CLUSTER class, just for the GDB stub code to work correctly.
> 
> Another solution could be to add a `gdb_pid' property to the CPU_CLUSTER
> type, that would automatically be set to `cpu_cluster + 1' during
> realization (and customized by the platform if needed). That way, value
> 0 could be explicitly forbidden in the CPU_CLUSTER API. However, Peter
> was not a big fan of having explicit GDB stuff in the platform.
> 
> If somebody comes with a good compromise, I can change this. Otherwise
> if we want to be extra safe, maybe we can simply assert that cluster_id
> UINT32_MAX is not used in GDB stub.

Yeah, the latter will at least avoid subtle errors at runtime. Sounds
good to me...


> 
> (snip)
> >> +static int pid_order(const void *a, const void *b)
> >> +{
> >> +    GDBProcess *pa = (GDBProcess *) a;
> >> +    GDBProcess *pb = (GDBProcess *) b;
> >> +
> >> +    return pa->pid - pb->pid;
> > 
> > Similarly here, is this safe?
> > e.g:
> > pa->pid = 1
> > pb->pid = 0x80000002
> To make it safe, I think we can do explicit comparisons:
> 
> if (pa->pid < pb->pid) {
>     return -1;
> } else if (pa->pid > pb->pid) {
>     return 1;
> } else {
>     return 0;
> }


Looks good.

Thanks,
Edgar


> 
> 
> Thanks,
> Luc
> 
> > 
> > 
> > Otherwise:
> > Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > 
> > 
> > 
> >> +}
> >> +
> >> +static void create_processes(GDBState *s)
> >> +{
> >> +    object_child_foreach(object_get_root(), find_cpu_clusters, s);
> >> +
> >> +    if (!s->processes) {
> >> +        /* No CPU cluster specified by the machine */
> >> +        create_unique_process(s);
> >> +    } else {
> >> +        /* Sort by PID */
> >> +        qsort(s->processes, s->process_num, sizeof(s->processes[0]), pid_order);
> >> +    }
> >> +}
> >> +
> >> +static void cleanup_processes(GDBState *s)
> >> +{
> >> +    g_free(s->processes);
> >> +    s->process_num = 0;
> >> +    s->processes = NULL;
> >> +}
> >> +
> >>  int gdbserver_start(const char *device)
> >>  {
> >>      trace_gdbstub_op_start(device);
> >>  
> >>      GDBState *s;
> >> @@ -2058,15 +2130,19 @@ int gdbserver_start(const char *device)
> >>                                     NULL, &error_abort);
> >>          monitor_init(mon_chr, 0);
> >>      } else {
> >>          qemu_chr_fe_deinit(&s->chr, true);
> >>          mon_chr = s->mon_chr;
> >> +        cleanup_processes(s);
> >>          memset(s, 0, sizeof(GDBState));
> >>          s->mon_chr = mon_chr;
> >>      }
> >>      s->c_cpu = first_cpu;
> >>      s->g_cpu = first_cpu;
> >> +
> >> +    create_processes(s);
> >> +
> >>      if (chr) {
> >>          qemu_chr_fe_init(&s->chr, chr, &error_abort);
> >>          qemu_chr_fe_set_handlers(&s->chr, gdb_chr_can_receive, gdb_chr_receive,
> >>                                   gdb_chr_event, NULL, NULL, NULL, true);
> >>      }
> >> -- 
> >> 2.19.1
> >>
> >>
