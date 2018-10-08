Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3853120wrt;
        Mon, 8 Oct 2018 12:57:31 -0700 (PDT)
X-Google-Smtp-Source: ACcGV625h3Fl+tH03jNipP5PlCghMDcupuZTT/gRsQnfYrmDcF6ZH34Et+THESQJNnqV9XoCKLJd
X-Received: by 2002:a0c:c352:: with SMTP id j18-v6mr12112043qvi.38.1539028650979;
        Mon, 08 Oct 2018 12:57:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539028650; cv=none;
        d=google.com; s=arc-20160816;
        b=z1BoJ8A4aNf2BC7gQ+mYAb3l81VikfhOR3orNWBBTx0YS3cdLk0oGE7SgBy8XWzIFT
         es91RBuLEy9aAwSlm5837mZJRpHrA2/lpI5W0SdYwulUz3OUgJCaSRAh5mVqlPetY6oU
         tka2tX3JnwilsYolTR2mRCWw6BI7lm9zixQ1Q7SX/TZGICod6Qwegcb5iNL2R/lI6TzW
         acxp/BUixmUiOcDXEowloQnNwyueCH7vRMxUVmx75RL3rc+p3GXc4vAra5uC4vjdD5KL
         eJ8zdSARSu/MqhjVgxtGEyyEbNOxKUbpdO5PJeKXvT1Mbn4uOgxd5OBoaGDN8iiGNnb3
         t9tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature;
        bh=cPoQwzNjDigFj5iEqfxr2P9OhpkS/aHbBsfb27Jm8xQ=;
        b=VX/CijpK+7kEWqKWftFY02sYuHsOIwGJHNBmC+FlHMEeHjWotPsDf1OlpA82gc6Hds
         g1hbz+7TcsiMx87piI7tA9q4A6jPnPoVxX5wa5WdxArXVSEJnj766Fj2E8K2x9ipsjrv
         mc2LtbeOphXQord65Bk5eThrFgJbP46PBxlyuPuVdh4Nr0xLT8NM7YwyevdHJJMG+wy8
         Z5ZuEeddcdPwdkpgapFjmKzf0bbER2RoB6Tynow4RbMfR1OrPq2ffplCVdVFu9AX9WZm
         e5rrIURMdxs/IP1yBpNKBSmRbT6SY7J0NJHMi3PxWq5VgwYz3Btpt9MK1bBivIGWkK4p
         xkuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=e44aOH4F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o18-v6si11058129qtq.7.2018.10.08.12.57.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Oct 2018 12:57:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=e44aOH4F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48054 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g9bek-0003Es-0f
	for alex.bennee@linaro.org; Mon, 08 Oct 2018 15:57:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1g9bd4-0002At-Ei
	for qemu-arm@nongnu.org; Mon, 08 Oct 2018 15:55:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1g9bd1-0001Xz-86
	for qemu-arm@nongnu.org; Mon, 08 Oct 2018 15:55:46 -0400
Received: from mail-eopbgr690054.outbound.protection.outlook.com
	([40.107.69.54]:10624
	helo=NAM04-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1g9bd0-0001Xe-T2; Mon, 08 Oct 2018 15:55:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=cPoQwzNjDigFj5iEqfxr2P9OhpkS/aHbBsfb27Jm8xQ=;
	b=e44aOH4F1nzdOC1Vna65cG8z/vH5bAhBe4eAtCgu85DzqEP2+JCHHgjfBs4wyB3A1h2DZmUeNrg9NCPBcY2kVRsa9WRF8N+tW+U0ZDNxjVZonRnnSBGQr8Ij81kMatdKzS1bmzFSt1uAFJ+EZ7Lq4LL3MO3wqim7mibZRIHj1h8=
Received: from CY4PR02CA0012.namprd02.prod.outlook.com (2603:10b6:903:18::22)
	by CO1PR02MB094.namprd02.prod.outlook.com (2a01:111:e400:101a::26)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.1207.21;
	Mon, 8 Oct 2018 19:55:39 +0000
Received: from BL2NAM02FT044.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::202) by CY4PR02CA0012.outlook.office365.com
	(2603:10b6:903:18::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1207.21 via
	Frontend Transport; Mon, 8 Oct 2018 19:55:39 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
	header.d=none;kernel.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT044.mail.protection.outlook.com (10.152.77.35) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1228.17
	via Frontend Transport; Mon, 8 Oct 2018 19:55:37 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1g9bcu-0006ih-PV; Mon, 08 Oct 2018 12:55:36 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1g9bcp-0003OD-MN; Mon, 08 Oct 2018 12:55:31 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w98JtMnC022119; Mon, 8 Oct 2018 12:55:22 -0700
Received: from [10.23.117.222] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1g9bcg-0003Nq-Bk; Mon, 08 Oct 2018 12:55:22 -0700
Date: Mon, 8 Oct 2018 21:55:21 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181008195521.GB4229@toto>
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<1538579266-8389-7-git-send-email-edgar.iglesias@gmail.com>
	<CAFEAcA9_EOFV=5i-4S1GWVgewAa89hJDTegnf9Ot3w7rfkZWYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA9_EOFV=5i-4S1GWVgewAa89hJDTegnf9Ot3w7rfkZWYA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(39860400002)(346002)(396003)(376002)(136003)(2980300002)(438002)(189003)(199004)(16586007)(36386004)(50466002)(316002)(53546011)(4326008)(46406003)(106002)(58126008)(54906003)(486006)(446003)(126002)(476003)(426003)(229853002)(9686003)(76176011)(11346002)(97756001)(77096007)(107886003)(26005)(186003)(5660300001)(9786002)(6246003)(47776003)(6916009)(106466001)(336012)(33716001)(33656002)(63266004)(39060400002)(8676002)(478600001)(81166006)(23726003)(81156014)(1076002)(8936002)(356003)(2906002)(305945005)(18370500001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CO1PR02MB094; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT044;
	1:QQBKYSI4Fjp/jNuoBV4xXC/Ouz1BVRT3WN2Lg9LMSnGX72Ry9OY45R2btZ3lRcQmNKZnUtwJiEkRJNQTkcgqpsIZK4BeH1APMvmUpWYDkpoZ8KUFEPIpL+Psgdl5DZqB
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7e85da5-cae3-41c4-bd70-08d62d580560
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:CO1PR02MB094; 
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB094;
	3:855Pvt9gCMtJItaO4CNz048HrOzoJaftkBYm6Yyr/0/BJ7ACBkLrNhH83Eso/1MBSgZ4f94pCznCu72M6LAwZhUSEq2QyBj1hC62Um1Ua0eLmJklJFMqzkQNEYd9Y0E/y3PY70o5iStgJUPisu1/8Gkg9U4Q+HDG5gIaMcSbeOdFsEM5GKK0XfAN7F7EkKs/Unq9S30n68Bqs6zdWVofOcEoMlhaRqICKSW3C3jHI/Lqn9MLZoAiICRk/5WP3Npx75QFHJA2T/JR21Mc7EA1rexx+PegU22PASN7LBAxwyy+BoB8myi6PSL4cc4jAEi0rX63C+9L412dQZ4lurjj0mZYGLrP2c+4vKiLydPQAo8=;
	25:Cr95c4z5JNxQ1lvGugehXAHlnQSX1+6SfXzWwM4dQq8aKHlQj2oUdq6NXE2A+Y4H6b2I0fvw9G5X19SBYRgtnp+0hYuuUFYVC2v1IgLoeDW+Y7mEAkX3TyBbLAI9YysVFJ3+ifaSFbl6J6+wIvgGi7Itfl6VTRxMDKRjZ35xZ7RhVwsWwXeQGTqUKBmJxDe/Ue/kl3p1WjRUwa4cd4mP4OYbWLXgIh+52u+5kGC/cJM10dDRSg7m7tHxWJwSTCCYoEkAuAYaTt837fc8EQM4uqlz9DX7I8YlSoT0bwOwhxerHagIRee3cGObduVOyD7nuleigzwl6S6PmuFKmZSF2A==
X-MS-TrafficTypeDiagnostic: CO1PR02MB094:
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB094;
	31:7muVLLtk/izVOdbkLRrwmnUThrYffUhm8ULOQ5ehp0P72HRFvYbT9IoqJvPqschOsUY6jIy8W9kHH2Wtc0iUJ3jeQ2pceUSmHaIPnvVNqI9XfzHSR/NykQakbAC2Hqb6X7Ra5+EuJnyHAJNlDRPEXTBZEe0vA3pxeloiTbJ8mZ7bYAPz7lj8D5LurGZzVUIHXAf9NK4FchPajwOkPoy4ue54i4vD4EGDfJdLYN6qshQ=;
	20:a3xKeGDcim2/hQhcrKEsn9N8m9CSMHerMQ9uCl08KMpxR/qI/JgKT9hceM7/rwqGfC0uCjg5xzYcs37TNteTM3M5WRzNFN+N9CwzipFBGgV1N7X5DaOdAAPyQR6g/+xvxCkpw32m0fH27ZCIDsN87+0Ntvb0twEWZB2Mr05gLPTj43ntwUIQfYtfi46jjnqxYi6KavuWsLmLQi1fv0uR7JzKfubQGlGUhoK+w/u0LsrHezRvYGRO7D1WdkPJai9HXc9/i4CKUq8v8/wgr5Wm3GAoEfre7LlO3ktNyLq2cV4iue+084TvRk60siWaepBpjy3jeUcmcpQhZu9/pGibmqIvB0a7jCC4QxeiTYe6aW5e9FSdDlZiHwJFf/++JYgcKEPM9p9XUs/NXhohVqDvjM843wImzjr6EXP80UxKCS4gg/luhcV4kHYVVRhDoauLPSx52LFSwEi2UKaKdFPjVdULioHubu4SE9MW2GZ1rm1biAXM4hCluasiBcqmDOVd
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CO1PR02MB09459A05B5C0C67D876ED84ABE60@CO1PR02MB094.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(3002001)(93006095)(93004095)(10201501046)(6055026)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(201708071742011)(7699051);
	SRVR:CO1PR02MB094; BCL:0; PCL:0; RULEID:; SRVR:CO1PR02MB094; 
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB094;
	4:jp1c2trzb9Fv5q9AWR1vBItGaiHcaoDxF8RMcuRi24JXYE2LiITnKRalIMMge1stlGf+9JRU/PUpsFJpIK9kMAc05UN3gaBis6V4sMhQV/+9IFG/l7VRcOuhQ1n4adpp1ZR0fYg6vawgkxPO6Ly3p05cDWc5H7Cdr3xRFlSgxkUrjnIaWPpHXv3B13+MxQTQK0s/njFPBXplpcM0mO39ZM6m4ecB6g8Uhkfcz7BT0xsB8w6EjRdfakJv8G5en0u3dUaQlAhfNfw2j9ZaiVijQc0zXGO4gFVgM/xaEPxZ57B/7Xu5jIeKiarcexxNTshFcsLP6Qvw/IMEovXIplYC1imizgI6MFjosMwv9PI+97I=
X-Forefront-PRVS: 081904387B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CO1PR02MB094;
	23:Ft9HFVQGcecdew/Mp/r9Y3T/8uXC8yRDVazsdVNlOh?=
	=?us-ascii?Q?6hKif2K5XdqiHWyTlHWoJ91fXNj4U8LTlhMuQK34OeObFpx+gLwlI0Om3K3/?=
	=?us-ascii?Q?vgRFFO9wcOwIBh7+ddQkJsLP4rmCFXsvPxz29AYzv1sMgbVDVb5DDwa8VI31?=
	=?us-ascii?Q?Gm1+SyZ2G6vIcDuajbDig85WWAgccEqA6B//SqdliZxQainkQ5f3Eh8BFdng?=
	=?us-ascii?Q?viuy/F1A2r2pKgcMeA3RQAx6RefZJv18eQSyX9AJ7D/iFC1V8+d5unI5sNGB?=
	=?us-ascii?Q?VitHLmYJ359fq3UyI6siZQXG15oEE6Ud13qOAUV4yp2ZvvilrbqJaiiFWxrW?=
	=?us-ascii?Q?qhN2ukZxuoaANemZ9JrK9w1YDKpWIPvZB35JJsxyhDVXWkpPuUFohoNE+xie?=
	=?us-ascii?Q?c86p+oaCiqnbd9X/yQYwsWjCbWjtJ+Wceyx4zuZXRP/2WHJrj7TucfC7BnEB?=
	=?us-ascii?Q?7Yz5a+tIxJJV5ZAqyd/RzwwMj/8xvTz5UgEuQdvF7bJslVBDwiOwghkv91Lk?=
	=?us-ascii?Q?BFWocnV6yR2QplxkCvH3jXHULxGcAdnf4KBQOh1yD8OORLqzSCezJT1HDhAA?=
	=?us-ascii?Q?UyAAPgN0YiLShW65qjqYS2HWF4MUOy/ycJL1e9ojczi2llLmiETAWbz0aGyZ?=
	=?us-ascii?Q?s6LJ3YaOHBj/uexLoY23Wa34uDL51G4Kshdnq5O7tRFBbgtHif9r5xNfeICV?=
	=?us-ascii?Q?rqASPkngA1L/V6M3/MUGJxDvIAxkY2RAFWmpyD2tcFW9QqC4NzJB4xDEXtjW?=
	=?us-ascii?Q?VuPYCP0MjCGL9MN3mm8yyt3FBSI/oF03OrlIVqaMHi6JQu4FtWMtMoGUfqce?=
	=?us-ascii?Q?3p6uxUdN4tRerydCMEqe0qT3xbaugXdphO84n+QkTbLrR8VzSRf9+sYuXqmy?=
	=?us-ascii?Q?pJG5veEK1p4iwoqJ97DszYehutXMEJg/cQpxBJSNSf1jqyCHalMFfmUJLhr2?=
	=?us-ascii?Q?i5eq6+RDvrSoDmFfQzH9jPoZztRwbL7Sqj12UoV2lJWy++YV1OuJFVbQrz62?=
	=?us-ascii?Q?JP6b/q0UdrLcMEHbYYngAbqM1771ADvW9kq6KgsVTMGyizZ39BW0mjylvosv?=
	=?us-ascii?Q?A02QVz3bwNoi0qJZ1/c1PfTG8VWswTn2tdJHY59YKl/8wfJ4fKxTYyW6+xIR?=
	=?us-ascii?Q?sungd95oaQ/Lk/dN3lKAjN763Sm6e7W0hClMwMXp+kJbA3oOySBRR9pZg8lo?=
	=?us-ascii?Q?o1cwnInetv2hNx6VSn/UaRxebVx8v/aXsRp8UGwn5E5JEbmFK6xfiJq2K9kX?=
	=?us-ascii?Q?8hDzYYy0nvhDHqstPio/9SjL5RIJHQla36TLwC?=
X-Microsoft-Antispam-Message-Info: RsZjK9B1FHK2u5zK2kawEqeZ8lK9wfUyYIRCfZHvG0YpoKH60KT6SNsRYB1GjMCbbdKRQeBg8Bkl3gOJ/UGUMlPUBRIqjMCNKgaZf4KfyTmATa/5WYzEVE5Kkr2lcVqBV7RBqgJpWU6ayVOikxr0C9xCGBY72aJYmfIn5qciP9fitmK7H0mOAyoYC8vv9+K5axxZDUkUzdWJKfVPrLyotXv0vVkbofFMU3b3jf3EdPPrj1fzdQhr7l4giPpWAVBoScJQUkBRRU/whUae6VhPgSA2xgXd0KMgXCX4XNn81G5K16G15zcZ1aOQThOTllEF+JpSVa//kfustrPr05WPVRHiOIJ2m4D0aqVKFtybGyI=
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB094;
	6:WJHtPkNozIWobEQ1wgY8lO7VmAZ3+O6y35TQVxiIydjrguylKfrSdq1X+qfYChn6W+/cc6sgsCZJ33v8eNQQe9ebua4dC+FzP93TY1EtPje4xauaufqRplHWGqpjfj/1RYlVu7PITJQfe0IWXkukLpOtDlXRPyVtKa4LVFolWiu6WMrv0vEZm48+87pzeH+XRNgeFjtKwEXCuvYivriww7fyZBiXwnckgZ7sYX5VpkI8A8y/6BoSu1hZYSRmjTnAWgpg8fHZkez3bTfTZTYyhmc7tulI22m604Ed61DIMh3WZS0RUtwp8GrIDwA9Kl204s4veh35pq0cAU8D1qmXr7CsUrEnOV0t9PPoRMIEwhGSIp1snE6q0Hqsq7/h8FwF8fBuygpWlGec18DDH0aZxY4k00VK2zgexhOnBYrZfHLZiMMjgWcpv5WnDRQDi5DW0Iaza6KXR3aNSUjFSU2lBg==;
	5:FY6MPpgxAEzno+Cli8vemGAfp12uTUijeXpwp8XXbrE1GLKCS41vVXSRTBFk7HYGwkauXlK/GCggKTg7NbtfPD6QJAjNlm74CZKrb1InfkzX6dQzop6iGp2hU+R2V2OuibzbsaB5vget3cJsUL5PHnG+MAqNnTJIt+sVqileb/U=;
	7:a3JgViNyL2twIMif0wcafyeW7Rwcz7eEph8OMsvFNtWa6d/Kz/IMmKsI7ejL8xNqEXtFAmd+Qmd/WHjKx6Ce9BC482hydfG+qKnUjDfL+fgr5Q2e2y/h3TaS5u52N/rxu4JzkBWupKSNgShYNU663fV7EpDViBrVBcaCSxR5irnj5lbipXmq6ifp6fUpCrVyGUktCl1pAOKiFB5roX6bbhlZMbXuG02PsqSRLoQVCPtM9GRT26LxPqe/rrZUXK/s
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2018 19:55:37.7914 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e85da5-cae3-41c4-bd70-08d62d580560
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB094
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.69.54
Subject: Re: [Qemu-arm] [PATCH v1 06/12] net: cadence_gem: Add support for
 selecting the DMA MemoryRegion
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
Cc: figlesia@xilinx.com, Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TIapXpPcegvn

On Mon, Oct 08, 2018 at 01:30:20PM +0100, Peter Maydell wrote:
> On 3 October 2018 at 16:07, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >
> > Add support for selecting the Memory Region that the GEM
> > will do DMA to.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> >  hw/net/cadence_gem.c         | 63 ++++++++++++++++++++++++++++----------------
> >  include/hw/net/cadence_gem.h |  2 ++
> >  2 files changed, 43 insertions(+), 22 deletions(-)
> >
> > diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> > index 759c1d7..ab02515 100644
> > --- a/hw/net/cadence_gem.c
> > +++ b/hw/net/cadence_gem.c
> > @@ -28,6 +28,7 @@
> >  #include "hw/net/cadence_gem.h"
> >  #include "qapi/error.h"
> >  #include "qemu/log.h"
> > +#include "sysemu/dma.h"
> >  #include "net/checksum.h"
> >
> >  #ifdef CADENCE_GEM_ERR_DEBUG
> > @@ -835,9 +836,9 @@ static void gem_get_rx_desc(CadenceGEMState *s, int q)
> >  {
> >      DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr[q]);
> >      /* read current descriptor */
> > -    cpu_physical_memory_read(s->rx_desc_addr[q],
> > -                             (uint8_t *)s->rx_desc[q],
> > -                             sizeof(uint32_t) * gem_get_desc_len(s, true));
> > +    address_space_read(s->dma_as, s->rx_desc_addr[q], MEMTXATTRS_UNSPECIFIED,
> > +                       (uint8_t *)s->rx_desc[q],
> > +                       sizeof(uint32_t) * gem_get_desc_len(s, true));
> 
> At some point you might want to add support for handling "descriptor
> read/write failed", incidentally: address_space_read/write return a
> MemTxResult which you can check for != MEMTX_OK.

Yes, the GEM can report those errors to SW so that's a nice feature to follow up with.

Thanks,
Edgar
