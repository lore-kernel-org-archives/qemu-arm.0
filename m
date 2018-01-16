Received: by 10.28.173.206 with SMTP id w197csp4571912wme;
        Tue, 16 Jan 2018 15:27:48 -0800 (PST)
X-Google-Smtp-Source: ACJfBosBPXlKXACo/u+mGNSU0/D1Hhhaot8V0qH8jFgyIfln/MA6jtut6Ed29L7JhKO45YoHfoII
X-Received: by 10.129.122.10 with SMTP id v10mr855407ywc.318.1516145268327;
        Tue, 16 Jan 2018 15:27:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516145268; cv=none;
        d=google.com; s=arc-20160816;
        b=sU/J/8h5FpXN/fvuWQYmK+QN2A2ElhdHvht2dFGYW7h7726UjfAD5DlDM34vwOX7FN
         tMSJiUCZzLQ43zdDNMMAhIk7nQcUNzlFHUMBnFsQ9LeXiAqmXYIimtD8iAZFCtKMjvCB
         Dhvc1SuAHdbVsGg+gn4vOXxSODJaVahPLA4V94zoNz9a3h6ncshEiQDds1+i1pnR/s0g
         iqKrt0gNYzFhuC4MILKx2O0pZ3hdsNjY3reQjVOvyhiYE6Np+YcN9pP0ZlYNxqAHZ8JH
         iSHEXCP9AUf0SN/DYZDvibfezoiXnXFz+AOo3VtgldDk9JCSZAEigShoVqJLw6NlO9Z1
         dbww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:to:from:dkim-signature
         :arc-authentication-results;
        bh=DFLERS8qygjQ39/GrQ7OycQfe4LsWetSMgLos3LKq4w=;
        b=I6ht2HsT+KhkEEGkPJ+RQADyEyeEXlfTEXMNCB+MIWeIOBaEfesThyQLXpsTQ/n0kj
         k/QSKA0dY/CdI78g9hFdlkwo+mwF5zGDRIEAukPBVXKLvPR/XcB+8bO46zlg5Mqd8oKN
         B7CTYddWt5t3eXSszKeAvJ4osZQxT/V4hjGvyhNJ2EOtVVsdjQaMNeFKnm5UnoTUp388
         V9O/TRUcClx+XIo08XGePq3/KQ2SIogrfJTCC/mKAijNSBDsLoF4nQO4sBTBnBkZdRL8
         njlYysl91Lu6NGjtKdCfOxmttW66AijwS4ezFWqCJAgHafo3ptdrP68hYr1S6n4e9u3g
         +6CA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=DS2pC9IM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n2si813034ybk.219.2018.01.16.15.27.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 15:27:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=DS2pC9IM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45523 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebadv-0004jV-Lx
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 18:27:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1ebadB-0004FX-3V
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 18:27:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1ebad7-000233-Re
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 18:27:01 -0500
Received: from mail-dm3nam03on0070.outbound.protection.outlook.com
	([104.47.41.70]:55712
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1ebad7-00022d-GL; Tue, 16 Jan 2018 18:26:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=DFLERS8qygjQ39/GrQ7OycQfe4LsWetSMgLos3LKq4w=;
	b=DS2pC9IMSaWIeE1eEvMrWZxrejB8jyKBOZh1/3nJMBaeWKA2kJuPq3SLeeCID13vAvdjxfysqiOx4LDyi1ni+voEUBDaD7EbSaFMuIntKMytW3T5Yt/T7yz5R+To461+3XsDBMz2wuqrjOfEVhb4dAmQF1Lzr4YZCAL2pi0j9Ok=
Received: from MWHPR02CA0001.namprd02.prod.outlook.com (10.168.209.139) by
	BY2PR02MB1332.namprd02.prod.outlook.com (10.162.79.27) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.407.7; Tue, 16 Jan 2018 23:26:54 +0000
Received: from BL2NAM02FT042.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::204) by MWHPR02CA0001.outlook.office365.com
	(2603:10b6:300:4b::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.407.7 via
	Frontend Transport; Tue, 16 Jan 2018 23:26:53 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT042.mail.protection.outlook.com (10.152.76.193) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.345.12
	via Frontend Transport; Tue, 16 Jan 2018 23:26:52 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebad2-0000Mp-3H; Tue, 16 Jan 2018 15:26:52 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebad2-0003Kp-1A; Tue, 16 Jan 2018 15:26:52 -0800
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w0GNQlWv031031; Tue, 16 Jan 2018 15:26:47 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebacx-0003KY-1g; Tue, 16 Jan 2018 15:26:47 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Tue, 16 Jan 2018 15:22:26 -0800
Message-ID: <63f5e8b2687502e1d6c53e190869e88d134f5f14.1516144891.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(39860400002)(39380400002)(376002)(346002)(396003)(2980300002)(438002)(189003)(199004)(2201001)(50226002)(305945005)(63266004)(5660300001)(8676002)(81166006)(6666003)(36386004)(575784001)(2950100002)(316002)(36756003)(8936002)(8746002)(2906002)(9786002)(81156014)(48376002)(110136005)(77096006)(59450400001)(4326008)(47776003)(478600001)(106466001)(106002)(50466002)(7696005)(54906003)(356003)(5890100001)(76176011)(118296001)(39060400002)(51416003)(26005)(230783001)(107986001)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB1332; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT042;
	1:DaPZI1Qqf5IzUe6trFzy9lBimAOFqjb3gsGqwoHmrg/OKUolRHhaq3wZCCIuVoPZE8C+S1MAmv0zhnu9J6oSb/BHlmz5eze3aRCh1/nn+eh0rTh6ye4cVnBI8Dii2MAp
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a9e13a1-d28e-4909-4159-08d55d38a055
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:BY2PR02MB1332; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1332;
	3:RoWYmzgu4qdONExPhKACrsA8+CyHsPmDbKDfYGj3z9vRFrOeoClk2U0W1OXy1FXKImB/gxW2FLfNUa4ZtZfMVhhb9CInRenhpGupTzffMOpKNvayeIpzA4JmM9onZKpfFeZCzkwZTjoGSy8ZrjR8uYaWnxYtaD9gOBDSo2mXMhV/dMFIJfPjZ/9r2qrx1zOIQLZuUQmmmjs7rCSDTYeA1hcu9KR73vW1Ya2BqSGhDhW0fKMdag31q0yJOh0m2fsybbHW6qjbqgl3KLotelhHBIU2OkHCkfdh4FNI5aCaasK9tsvprGTG+iHE2R3wmpud8ATsfUlEa5hiHmSHqALo5/S1p9ghQ4mTmTBW9HHjBvA=;
	25:5zy6vEPFlBXphxrcxyRvGKUk1vrdHfHtKqzmKOM8nMVltC0h7eRb9uJpjjylGEA3FPYif8AeK+0ZvQU+OaFk5qIpB2mIHN9nwVJA7I3s0cGlAdxHa4RVefb6FMJlMNm1OJTPaB4QkfIZmB0RFKUJ0wgH0vquhp2iyhV7WzBMCwyiR5s9iYRVSVFcc7/D5fdCaSG5qXJxntHw3co4wrNSE/vZonULLQXO96grlFbI68w45SWW7MtW7VpE9S4lfKMuTVGPzStUvQwi13Bnum5+wYvJC4h1NPqWUfjMgkgaOuEa3WshVmdbMlzAc0ok+vPhcwAqfir2qJN9FO801z0OI0PP4HlEH9/XF2XZI/G+9uM=
X-MS-TrafficTypeDiagnostic: BY2PR02MB1332:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1332;
	31:vWu3RnKkLRJ8bodUUw7Uqv4nQM/JqYqunpN9TKjyacrb/Dwx0FFMHh+2IU/ikwojw2vGD59Igvs3ZsJcLlVQ1XRauSCfwILQsHPm0kx8CAmaTVfTYY89Fyea7noFFIA2s4p6dxh9Y7tYytHXdK3YKqIRcHHkn54B2mJiB1/t3ZvvZXBazdbgGnPBp/x2QsvwVTB+FmrC9dVxJRSJkQWte0f8sbfDVZ6BcOMXjGuUgn4=;
	20:H2KQzZy6UzuppG1UJ3DqqbAa54jRHbyB4WTwUxNGlqrBYI0sKHKRrusRW0SxhjomXxuPoMMxvpcK6Xj8lGC4qJgEJEeimMnukwC1arPH8QQM8v6DEOYwA8FBKhbYDFHxDyCSNUkGTgfyJNKGsmmdcGfV5vC1kFayJ+SvMJrBcF54FYnqpbxZ4t93NrKzJifELOdzaV2yPPmuW6BQ80h5DiNVVnc9IthlLsxs4qFbGRKvuRE76wu7vGYAlaXfgYQordRZGKhWyrHfvoCIhiqocRr9rr5IbMzZ7rZ0UBJcZMYpo4rZquryuc6iUpvPtswbUtAoxZLq5MRdRAMWNy/WQEtDkP5blkJ1R5881rkVgX6/ZpoznHa0MlD1pzII0v73AR0gMPxIBzxtPPS2X+z97XP2yX2fFvspYh3ctEe9MDorcCqXRzwotG5u9J5Ly2JITjUHmVVY7r1bI+luAKpUjP+IIqjkvUf9pfR+VGfOWxPlyMrIh19L50EFjfyOJ7c6
Content-Transfer-Encoding: quoted-printable
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BY2PR02MB133277F36D041A1292CDC912DCEA0@BY2PR02MB1332.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(21532816269658);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(3002001)(93006095)(93004095)(10201501046)(3231023)(2400039)(944501161)(6055026)(6041268)(20161123564045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(6072148)(201708071742011);
	SRVR:BY2PR02MB1332; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:BY2PR02MB1332; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1332;
	4:G8W1+w+tLO1RqYIeqUUtEuo25u+togbRkYyAyHmDZxj3Cg8K64Wa3VyMPHa9ROca3/PN+/o53bb+4Hos8rCErjqHOa6B075RFJP43679WY9eqaCGOrwjprFeFxD6g9FmXsgxL6oeoebJpCyZ4x9yu3+mbjeQN9Blivm0HRDsCVn2Sn+X8IYEy8FH9tr1dDYV9pPF/61s/WVEGl/7SJzl0lQ9/d0a0iFTtntwL2DlnWhENZFyHud7qeJiK1Pbw2I95Xu6rt1iOMcAF+fmMmqQe68OidiTqGs49ZZER6tV5pP602Ydw39PHSadv+RXpTHzQyXvocIQmICGD71KslqvZE3mpMj8Qkm2o6cD76Rqmeo=
X-Forefront-PRVS: 0554B1F54F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB1332;
	23:pAw0viyaw2mye2d8U11UxjacmVN0ztuf4UqpJdLE3?=
	=?us-ascii?Q?KBUrt2mze0ysNfE9f/cqliW01KRCMIuddeRcF6WJsyPZQY8xWf6L+ED8GU/I?=
	=?us-ascii?Q?aMuy7NE5umYoJ/qNeptkes6IoesRTUnkLozBMLrZtCBF/HOBWemOedI62TLk?=
	=?us-ascii?Q?yQLHvv2hG7pIkHELm335LiJSnWbKcBouD0lwN2rOS/V2MZq/b2xaQQKGjoDD?=
	=?us-ascii?Q?C9F6YenLPDfh7asstMDTc39mZpS3+V7wt2iOltiV8TlOy2fFEEOLkjL+WSCm?=
	=?us-ascii?Q?y36egXXkUFwWiQlBf8hElJ5RmorDAmGQoEte8p7NPC7Yui3GDVSot2VoptSJ?=
	=?us-ascii?Q?EobRvJzRfEyqX5vmLtoweWYCH94sx/BHMCbz3ZzJbj+0xvQe9X2vh+3slmk7?=
	=?us-ascii?Q?XVtzc9BqlT9xx1DXiHw/fchnra4AWje+LihHcOgagQHSX+lfJr/9T1SqSn/U?=
	=?us-ascii?Q?zCT4C5TGdG6PdW8M0RUZDy0ADlyvSKEKJhMRXygb3xzPIWag/N+VCfN5cvIL?=
	=?us-ascii?Q?SJhrcG0r8qiK/KcVg7rv4sYKT6guHgwBGd5Objpg8l6bMzespkxaXoPOvKva?=
	=?us-ascii?Q?UoNzufC7PZqyhzGTcWfQFSx714B50hhUHYos3Ci/TkNak/ILu0N5gVyIOJWU?=
	=?us-ascii?Q?kAWllA9MoBh6kvjI68QU5LHK6BtlZV+DnLuVPkJTamL0QUV5YJsPrZBOwwdK?=
	=?us-ascii?Q?nFcvWiXGoBj8VSyKcgHFM8uVSzLjlUwwoHx7pEukdknV4UCMS+OtVci+e9iZ?=
	=?us-ascii?Q?iPsEbR+cGzZ5CbC/IJc+i6Xr4c7w7ojHdlQy7B2L4FavWSQUD4lhHuIsFUHC?=
	=?us-ascii?Q?sdVVqPLZI1DsPzHg+OdsN8KBKBeFub8drARBvKWnJjOmiAi3pIZC5gpZcVWU?=
	=?us-ascii?Q?zlklU1S6kyKEdxnwDJPTbdZEb5QjR2Cr4vx69x7zOeTkB7oEbR6uDK6hhByf?=
	=?us-ascii?Q?zCu/5broKGoJF+jTf+fki8tc8wUBAY9OYalTIrQ+g2BTu6D5MiG/2L3LARMK?=
	=?us-ascii?Q?DYl0fiLoykhCW7WHW2BhTgNkdkA4XqcLnAGs4I75ZkgYLpZfOSPyMp7QRZep?=
	=?us-ascii?Q?OMvWdVP61DKK9GWefG7XcFowfViH2Z9UQb5mL2bKMvl9qDIMPWW5LiDrt0N6?=
	=?us-ascii?Q?ufyZDtus+bwjNaB9YUieFDJB7wSw3eYKXCFQT3Yoxvb3cHbJ4fycQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1332;
	6:xbB6ytXTrZbPeSUlrj8hjvddn/7RSWeZtEG5QJm8riop3u8zsTScnosh8Sysz8eStNS9vk9RIsdXtgeSY7e090Nw8wM0PwQBQ6olNtEiLwRDoGPg4FPGaE1C5Imii+L0J4xekPrOoEJYGgKpkdI7t4W321qjbifwfv3Xa/ZPCK3ZdmTlqa9ELH4tFYz+67Tkcbt+VcLjkZ5TLtPqfbTkuNXOzfH98MA2/jMsPToSOvoGUJDDHrgMnOYMMaxC4AMXdaPgCil0VpO2snbzv2V/U66RYd4b292av40KyggQ58CXfjzPwcswUiEsjEOhg4xhS3HNHu2TMIot4lYWu+NHbCatjDEhJZLfaCoXgqHzvPo=;
	5:FUCRomASKBDr/RpOs0aJecgnDCt3UwJWIwperS1VnCV1kVsV7dj1nOhmG5zk0w+YIy1aCJNpbMFuGb7+9NgBm8QtTlpKJcqUols6UunT/mYqDBCAFkfHioHTcSri4mrFym+R0EBtaLQJUYv4GOcuBox6nCsn+fyS0522MR6LWQs=;
	24:SPLma2eGdKjv6DPfu3wixBMV1eqv/gYWWXqv/jaUIJ4AocgWuDI7CPAOLHxmfWQyKx1htjh7aCytwui7Tm5y1k9jG81oqXJb8EAFYNc0gm0=;
	7:pUdLAdnEBnKpJkKjwr7+e2YyRL47txv5ore2cM8o9V/OAU8gXAemDeXA0DlLyi1eH1wDyR56tYDCnxQP6JPLLvQLrWAynxTQOoCYaUf8mZQSpOF3YvLe9CeN2ewXrY7dkfTwOj5+1m5PDvW0zWrWxisNmOKLsYp2XwGRwGWB41gNsICp9r7j5azQHtVwaxwo7FPBrs8aocxkBUB3jNoxKw3xSo3k7bhkewC5E4qEmEX9OCVX1/DqY8mNPN3DJ7b4
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2018 23:26:52.9630 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9e13a1-d28e-4909-4159-08d55d38a055
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB1332
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.41.70
Subject: [Qemu-arm] [PATCH v5 3/9] xlnx-zynqmp-pmu: Add the CPU and memory
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
X-TUID: A0I4K/o8pbWK

Connect the MicroBlaze CPU and the ROM and RAM memory regions.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---

V4:
 - Remove the ZCU102 name
V2:
 - Fix the pmu-cpu name
 - Use err and errp for CPU realise instead of error_fatal

 hw/microblaze/xlnx-zynqmp-pmu.c | 70 +++++++++++++++++++++++++++++++++++++=
++--
 1 file changed, 68 insertions(+), 2 deletions(-)

diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pm=
u.c
index ac0f78928a..c6a0b3b8a1 100644
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

@@ -27,21 +30,56 @@
 #define XLNX_ZYNQMP_PMU_SOC(obj) OBJECT_CHECK(XlnxZynqMPPMUSoCState, (obj)=
, \
                                               TYPE_XLNX_ZYNQMP_PMU_SOC)

+#define XLNX_ZYNQMP_PMU_ROM_SIZE    0x8000
+#define XLNX_ZYNQMP_PMU_ROM_ADDR    0xFFD00000
+#define XLNX_ZYNQMP_PMU_RAM_ADDR    0xFFDC0000
+
 typedef struct XlnxZynqMPPMUSoCState {
     /*< private >*/
     DeviceState parent_obj;

     /*< public >*/
+    MicroBlazeCPU cpu;
 }  XlnxZynqMPPMUSoCState;

 static void xlnx_zynqmp_pmu_soc_init(Object *obj)
 {
+    XlnxZynqMPPMUSoCState *s =3D XLNX_ZYNQMP_PMU_SOC(obj);

+    object_initialize(&s->cpu, sizeof(s->cpu),
+                      TYPE_MICROBLAZE_CPU);
+    object_property_add_child(obj, "pmu-cpu", OBJECT(&s->cpu),
+                              &error_abort);
 }

 static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
 {
-
+    XlnxZynqMPPMUSoCState *s =3D XLNX_ZYNQMP_PMU_SOC(dev);
+    Error *err =3D NULL;
+
+    object_property_set_uint(OBJECT(&s->cpu), XLNX_ZYNQMP_PMU_ROM_ADDR,
+                             "base-vectors", &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "use-stack-protection"=
,
+                             &error_abort);
+    object_property_set_uint(OBJECT(&s->cpu), 0, "use-fpu", &error_abort);
+    object_property_set_uint(OBJECT(&s->cpu), 0, "use-hw-mul", &error_abor=
t);
+    object_property_set_bool(OBJECT(&s->cpu), true, "use-barrel",
+                             &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "use-msr-instr",
+                             &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "use-pcmp-instr",
+                             &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), false, "use-mmu", &error_abo=
rt);
+    object_property_set_bool(OBJECT(&s->cpu), true, "endianness",
+                             &error_abort);
+    object_property_set_str(OBJECT(&s->cpu), "8.40.b", "version",
+                            &error_abort);
+    object_property_set_uint(OBJECT(&s->cpu), 0, "pvr", &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
 }

 static void xlnx_zynqmp_pmu_soc_class_init(ObjectClass *oc, void *data)
@@ -70,7 +108,35 @@ type_init(xlnx_zynqmp_pmu_soc_register_types)

 static void xlnx_zynqmp_pmu_init(MachineState *machine)
 {
-
+    XlnxZynqMPPMUSoCState *pmu =3D g_new0(XlnxZynqMPPMUSoCState, 1);
+    MemoryRegion *address_space_mem =3D get_system_memory();
+    MemoryRegion *pmu_rom =3D g_new(MemoryRegion, 1);
+    MemoryRegion *pmu_ram =3D g_new(MemoryRegion, 1);
+
+    /* Create the ROM */
+    memory_region_init_rom(pmu_rom, NULL, "xlnx-zynqmp-pmu.rom",
+                           XLNX_ZYNQMP_PMU_ROM_SIZE, &error_fatal);
+    memory_region_add_subregion(address_space_mem, XLNX_ZYNQMP_PMU_ROM_ADD=
R,
+                                pmu_rom);
+
+    /* Create the RAM */
+    memory_region_init_ram(pmu_ram, NULL, "xlnx-zynqmp-pmu.ram",
+                           machine->ram_size, &error_fatal);
+    memory_region_add_subregion(address_space_mem, XLNX_ZYNQMP_PMU_RAM_ADD=
R,
+                                pmu_ram);
+
+    /* Create the PMU device */
+    object_initialize(pmu, sizeof(XlnxZynqMPPMUSoCState), TYPE_XLNX_ZYNQMP=
_PMU_SOC);
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

 static void xlnx_zynqmp_pmu_machine_init(MachineClass *mc)
--
2.14.1

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
