Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4657111wrt;
        Tue, 9 Oct 2018 06:01:38 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61iuDe9rsvv0K6d+MxAet8n15XZzJu8Eqxxqp2zOlBtPyXlMC+yHvGeRz0j0O0pb/WKmFfA
X-Received: by 2002:a37:2455:: with SMTP id w82-v6mr22573437qkg.247.1539090098885;
        Tue, 09 Oct 2018 06:01:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539090098; cv=none;
        d=google.com; s=arc-20160816;
        b=LzL9EyKTfEzPRcOA5xfBREAT+BDS/rn8wbdVsoQ2DzfnLvygzICEtGbxfRFcnI000B
         05rpRuO8D+yAmavAg+tYoAh+OVZmxqL/5262mc38OJVnFJPzGeb/O/YvBJ0CdLZImA7N
         M5dPZ3TeTJ0G1etqIeEd1YMrI6sxFshmo5hYppWWBFTwUeWltakyFvA4/GSARUBRhSFa
         RBaDo2L39sz9W6kJ3i2JoAPskYpIai2xt56QUXNZOMCVtsIWGf6/I2scEpa4m5i9Vbo6
         kKwhKwjS7wJlimuF+MkLxghqPAhEhOAdymb6PMG9O/ZOTHhu/Ud5fXV2TxMeGby0Zmr3
         vExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature;
        bh=bIyHjhgtdvUv8yAnl/iK50aRoqHsGwHlKi2Bc6TUjUI=;
        b=hSqsI//iN+otA47Ej/+qLmD9VUawmrG6cprxCSJMZVCixwsflqsb55jJWrLXMWkIUE
         gTvrqzr9O2/yWsmr9AkM7XD7YoK9+holQLcLjKv3Yu7pgQIRB3vt7n11e520GRwr+1ll
         HBxe0OkWS3P6R6rikcRgbfB+46fFxmddfFwmfGJjSzdkPCoD3FV0gD0O1MpzngwJIu/K
         +JW7AA23VcwGwU6gcZEvDr3EO/vhyHZvKTts4v4z4XIV1+giMW4Ls5Az2jd04eXLjAyC
         ffY69qxOT5uXidPv+/6K1nsR6ZGCZYl8tTVMPBTcuyZsX+jfQc4Z7Pa+dThC311+EiRE
         frgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=BruQeni2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f60-v6si2169262qtd.93.2018.10.09.06.01.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Oct 2018 06:01:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=BruQeni2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51326 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g9rdq-0004sI-AA
	for alex.bennee@linaro.org; Tue, 09 Oct 2018 09:01:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1g9rad-0002VO-GY
	for qemu-arm@nongnu.org; Tue, 09 Oct 2018 08:58:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1g9raR-0007HX-2R
	for qemu-arm@nongnu.org; Tue, 09 Oct 2018 08:58:12 -0400
Received: from mail-eopbgr690040.outbound.protection.outlook.com
	([40.107.69.40]:53120
	helo=NAM04-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1g9raQ-0007Fu-LG; Tue, 09 Oct 2018 08:58:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=bIyHjhgtdvUv8yAnl/iK50aRoqHsGwHlKi2Bc6TUjUI=;
	b=BruQeni238DS2sZKCy6H5sVWCvapZMLT1dPk9a+4O2WMEfIPQVpJu7OoeK+HTRcOXgFhkfPUKkr0bE55IPxAEsuabIXt5qG33pl4a+H2wRhU4H+PodyculqVK3fc7P6MJ3En+g8acGFLnMeaDRZPt86Mz6DST4eh2igCmm2bgpY=
Received: from SN6PR02CA0009.namprd02.prod.outlook.com (2603:10b6:805:a2::22)
	by SN6PR02MB5232.namprd02.prod.outlook.com (2603:10b6:805:70::25)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1207.28;
	Tue, 9 Oct 2018 12:58:02 +0000
Received: from SN1NAM02FT030.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::201) by SN6PR02CA0009.outlook.office365.com
	(2603:10b6:805:a2::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1228.21 via
	Frontend Transport; Tue, 9 Oct 2018 12:58:02 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
	header.d=none;kernel.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT030.mail.protection.outlook.com (10.152.72.114) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1228.17
	via Frontend Transport; Tue, 9 Oct 2018 12:58:02 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1g9raL-0005QB-Kg; Tue, 09 Oct 2018 05:58:01 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1g9raG-0002Lk-Gr; Tue, 09 Oct 2018 05:57:56 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w99CvmVd014398; Tue, 9 Oct 2018 05:57:48 -0700
Received: from [10.23.117.222] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1g9ra7-0002JW-Uo; Tue, 09 Oct 2018 05:57:48 -0700
Date: Tue, 9 Oct 2018 14:57:47 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181009125747.GS4229@toto>
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<CAFEAcA8PHLZGfYpwU=zsG8eZ==hWu-b9CLJ_7Z+8+C5YvgZfuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA8PHLZGfYpwU=zsG8eZ==hWu-b9CLJ_7Z+8+C5YvgZfuQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(376002)(136003)(39860400002)(396003)(346002)(2980300002)(438002)(189003)(199004)(336012)(305945005)(4326008)(6916009)(23726003)(186003)(426003)(1076002)(77096007)(8936002)(107886003)(81166006)(11346002)(33716001)(8676002)(26005)(47776003)(476003)(106466001)(63266004)(126002)(446003)(2906002)(81156014)(486006)(39060400002)(46406003)(316002)(36386004)(229853002)(9786002)(16586007)(6246003)(97756001)(54906003)(58126008)(14444005)(9686003)(76176011)(53546011)(5660300001)(356003)(33656002)(478600001)(50466002)(106002)(18370500001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB5232; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT030;
	1:OfZAd9gHaXsddLV7ErYevqbO+wlzgRT8i1Z8M1d5/0XT5v7F4Weggg+CeKzKJqJPhvjsL9PuOePV5AsMlzr3GVQbWuUjxVl1gYUJgb6zaucg2mEFX3B4rUUzafE5JCEf
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8c94953-aceb-4c42-9d2b-08d62de6d8f6
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:SN6PR02MB5232; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB5232;
	3:gpkLeVPF6upQBgCRg5slzey9Sbn4Jqt7xlt9fJWDe8gxpZPYWSA+/gS0Ka3D4B+guG6q1mQOebnqN29Fm7sjIfr1EPC/5PhVfXa4ET6b379ZLWRLLujoxRaR11jaZmm9P0ZDE4XeSVvkFvGV8vMP0dqvVWLlS+XA/b1+0XlPkyHloyLdv2s/cRyIqzZAlStHxZiChUxFewbp+rC8g03mbUuLlPTryPUBRrjQxOnFPRkwQmY9i+e1/4/ZPDm5enBiVrGEKMmo5CxfieipVL2ykIPH+dUVa9NuZQ17RsAhR5xr785qsDnCUZF3iDgXw0CVn5i5OuKNGD/oI90z9Rt4Jnb4UOyXdOr3cBlObi4f3D0=;
	25:9G7/HbDLcuTwrVTGpEQqF3K/tjXWGVFKoBMigUYcGHP8Fsk7GGtIWI8Ex/qtJR4q4YQe2BNhof/bhhFCy51iB0M7g226A8/WaoqAVk+BLGG0aOXhfZaIkNpUM9aeSnsy5Q59i6crJBg8F00TEPJbvLdGsT9diXKcGnG7WgS7hMehOnn06ZG1rfn6QdI+qwG9Kyy/OuO7xhs9Smf+x38Pd1Nuda2PeLNtISy8ptZDFwasSkkQ1CMU7HadzyCrQtc2KtpxDlCg01IT2hX5IsnumqXhHXnNisdMEWE7LD4yW6S1X2kR/iHcZDpy/lLA6bpirBoaIuFU+Bcpksz2OHGxbg==
X-MS-TrafficTypeDiagnostic: SN6PR02MB5232:
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB5232;
	31:TU6x8y7m81SrTCaD36VxsEucYLV8PzNBR4Y5CcQlNkt/rpu2OdShWhHuYjTDVR3Wp8uSoY3ErcCamJmM4dAgjOiOINLZDrZe5x730iN7QCIzhi8W2mmkafiSjhCSnEvJ9oZgAVnzIYm32J5uqE8Hk14TySr0IKvRHMYPBi2M0SH7N9LcPlwzrzhw16AzTUOKaxJIqH/uKKORwmYDo063A4/9Visv9D2VvEhOMHowVSE=;
	20:OYw8wXg92MhL2c0QewBVMpCGiTD3a+gNN6Jk09xptjW0slLIkQZyYKn9zphKvLs9NHVAA3xckiOYLdWrzH1EN9g0ousmqPPfw0iZhTDxRBV6bOnjd2fcSPP1tWXlhl38Lrlbrj0x6I19Pr9zpwZRNVlQcwto60LGD5EbLhQ6+PDyH2FMfOz2LoZDe17ZBudiKJMCXBPjbmCacKjhkK4/S4jvOQjdEbZM1FY+yDr9Wc66qvlgKrNknFEssOFt1CC4pHUg/B4lIDui0FfpwIbVR6d+kuMSZHWTq97sP88NwzY9tjqwC7qrAFBHhEvGbVPWUccWu3yyVuSUxO4j6p+j7U5yX5ioFbOQiE7Z6Ux5TCC1vUV110khxKzpEyd3ou6ierAoRJLwgJDSoNP6N63R6i+2P1xISk9Bnsoa5SG2bQmZRjAjUILsYIA8rv63yFlHSwqEN/i4MYcBlVnTxcTdLcAlRB1N7U/kA9Ro1YmivU/wYuR/kcR+WxskmKbK2BA/
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB5232218EB699FB2A1DC2C4D3ABE70@SN6PR02MB5232.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(163750095850);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(3002001)(10201501046)(93006095)(93004095)(6055026)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123562045)(201708071742011)(7699051);
	SRVR:SN6PR02MB5232; BCL:0; PCL:0; RULEID:; SRVR:SN6PR02MB5232; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB5232;
	4:vWBpljWUVX+/aWP+1i4WNkq2Bhnq1Tl81Xowh1zSGjzykJi3GSUh6S9PlEPnPuiSZ5zYpt+mU5mo+LLOR+pm12sB6s8AcLsr6EvOwcKtjAzdjKSqbMddNWWKc4VmRoxx0MiyZd5qxvAx9iFyTqDLsFGMRGMfOERylmY8opPt6/7Urc/NqDVRn840Y2pE9CbUH5mIp6s/dpBs4/VztxnwpZCO9QIbupkbw01j7vxjA9+uMohLiTbdI05puLt4dLR2icMPXt9aj5vGCyjkF75NSlmjm80JNt069UiVj1aXm/rwbLEYyXBUBB1/vU5/RhjFDxyB5AePZocdS8IoHT3xvExkpQVstQNHyW9K3ERO5z8=
X-Forefront-PRVS: 08200063E9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN6PR02MB5232;
	23:ywMhOL2vXLFUEwuJeYT7oLsbYTgCe0tt5uFPTfY3b?=
	=?us-ascii?Q?hHnIkVXW9YrbPDbWm2478WePBaTVQuEifN+mezeB6E3Js9v9rmjedsIlyNWP?=
	=?us-ascii?Q?f324feCTzfvlEgqpNSShovkzqtx4mfheuU0wCZivLqCAnTNxk/Q8zxrnen4g?=
	=?us-ascii?Q?6XYT5hJxWWPOgqFyAEgy/BFBToxmv0RVAgnDr++WQc25TLOZcclGP9r0R9ML?=
	=?us-ascii?Q?6mT3FfFrz6M7dux3ghGOBSe8ZNIycJ+Gfm8JVbAVfhm79urVLwWtkWbnjrpj?=
	=?us-ascii?Q?1akB7FkQ/t25eg8wdwCJaKB8Gr6OrjWIc9wL4pmUJi+geTABXpLEEsd2mhYP?=
	=?us-ascii?Q?0lHCfFa/0EIFvbK204w5JdCM9RxO1/UMQZZKp/jUQHFUcvVOLMlMWpx6Ac8t?=
	=?us-ascii?Q?6+z4h628WVlGZBWAXZtUvUxwqYbpEiCnVH2vTt5YLgdBrVUmdUOVsaopLcfU?=
	=?us-ascii?Q?toAqGN1+NQyD+IsKNnOA96/liJZ+ZN3xTtVLWjOUR8mUMGyWBKIYCcgNA6UK?=
	=?us-ascii?Q?7sI2Mt+U4czKZX3SJLVU739E4/pwhhPyEMqbiLlwFO9/4t2HvY4L5qXSZiAr?=
	=?us-ascii?Q?gPwn3lVDq2G7N0QukVZNpzMsh5aUG01Z4Lqq4azC74r355e37/I3uXsBPSok?=
	=?us-ascii?Q?TYHZkJCfyEmAG5bmjMVBJr0Anl6dBghiLPuA4FB3BcSOyl1FHKxbf5nHpkYu?=
	=?us-ascii?Q?XSjQSH+Odh/8iKGmhl3aKx5xA++YCv73HuHu1nQIbzGHPXp1R2KRtr7X1S0V?=
	=?us-ascii?Q?vlFoVv7cKO2vt/n+n/hjJVO3hgs4ybAvNdqesx4ZAlXegfb/lf6DSbDPefe6?=
	=?us-ascii?Q?c9Wfxi4CPd5x08cmhRKAHrnsrApRR/YUZvC9RbRZWlTSt3uQpUi477d4YT7G?=
	=?us-ascii?Q?d9fh2GxMb96H4sxlrvlgBAM0pLKEEA/88gjHDL+Kw3KKjQQCtWMmtGvwzFHM?=
	=?us-ascii?Q?2v83aDWWx5qXZN8XGsCp1+uChoAenuBQAdx8rDTMMUrZXKR2VqRgRV4r1dKr?=
	=?us-ascii?Q?Var8idwt4eMqZlXKJ7hOsPV934+gNG9ljm3y0QEcUg/9HAGK5kGoGvrxAsUP?=
	=?us-ascii?Q?j1304EddFrKScrErzNH0M8b4oGcZMqtSDTa6r+9iIIMFd0Scc6GjFo5dwri4?=
	=?us-ascii?Q?GtRBfmxkO4rZoQ4vE+IZHxO6HcCOg6w0L8svKDwD5A2Qz/lI4Tlmbej9Zox8?=
	=?us-ascii?Q?/VltxpNLVGsTt+bkxE19T1C7bU7Te/BujIQyx6a0sO+erWNAck6BXi87oTZB?=
	=?us-ascii?Q?gKhnm10Y735MstmQoEP13omWRiPNWwwM6ISCSKhbh0qQSJsLVg/Oqoxf83Dj?=
	=?us-ascii?B?Zz09?=
X-Microsoft-Antispam-Message-Info: zBGHwhBCwGpFNtTYUWWmS/bV/Ky6PgmJQrjKqHBMp85O8E3G9DA2QmZKEWqbiS43mJNNqsoBejt0DxWuEE9txkeW7F6aeXv1+0oxNYtLt7zD2OjPcyNwrSE/qeXM3c3zQhp4lxmhG95CABZMfZnCtpcfIFkTOa7kT7HwvDRd/0qM9uu0uSkjemmsSwa5Mk+yHvTKkUNKyDY03zhRr20hUt+ezKZ/Itz+uMmPLIl7x52AYDedJhAuUbXrmvwXlECp2Lf8BH/Ve7Kxo2D4+yLAEIr3IYfVjQz4DjVd+yFjYL8wlRwbBhZifzio+Xp581jErN4Q/jXyCsSwiPihZnJ6yIpeExnMG7lEafAajatxv9Q=
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB5232;
	6:k1vhDz52NAPEc0aeiijf+ihgKDVfrGJHsrVol2UpWuIbNwu4wAVcQePU776f78EB1gE2wAhCLvPAM0DL5GAXwNppMcIo8BjVJf+zbmd1ZsuFORClisKIyoxoeFDRkNe4mYGQ3XQ8eVJkyUgMC1zC3ziKwKDrsRTBCv0YZjfzhd+QuOIJVsQEb0zCFBUqEOpVg3BX4ujIStoAGtfPcdFn1NyqfGk2yMoT1MIsinZ2FGWLKwVl3TaaSfsZKeV29mUY4WBS6+ndfjzSz8WtOa3Z9EwwiVc+yymQtLn4VmZcCEQU1nsvAy87SKm/cQhosmwlaNGhOWiJBG+nBs7pYj7tWhMBb4Szh6g8LIxPV5mHH/SwfDj1A6YDzqmWlrMZitfjbh+A/JYQuftfKMgJUInmGFcRz6so+VE/qWDuJU8hQHiZljjGlscB1otyGzPiTB3j7falVN6uz1S8HGyNc3vhZA==;
	5:tkjr+n4VLwYP5yZ+VyUzWVhuioLdm2YK483s+ChgBvVtqQO51CGWx3teIADMjggP1a9CxZWVuCK6L3fVhIRwvUXgQfaE+iFTeArS9N/mVQGd8GG8i/rjF1K2SS+de/K/JQyj4ZHz7nuT8eBua6tdwD3YP2NAJ70qLIIUbTI8pHg=;
	7:Ui8Lt80Dv+tiCWPDPdyH5u4PdhoA44Iecbw6NjZncUD0eNwqXe6N/WgcVyz6rXSkCgpf7ixT3u5eC4CyCZo4ykb93W6DdOk9kmmplPVvSCCNpjk2U4ZSK8S9jvqcwTRg+2KHugdyRJDabxKlKk24rOfLu267XcJjBQeYv8Ka3hCuf1pHFcl7i8W8AUaANyZViVEBH+zBm2oS1FwCp7J63wh1p4CSHGqT+FVhqxrfn4ts1AaTO8DnkyR9+A/ClhwQ
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2018 12:58:02.1208 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c94953-aceb-4c42-9d2b-08d62de6d8f6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5232
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.69.40
Subject: Re: [Qemu-arm] [PATCH v1 00/12] arm: Add first models of Xilinx
 Versal SoC
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
X-TUID: HxV4BTpXas9Y

On Mon, Oct 08, 2018 at 03:08:14PM +0100, Peter Maydell wrote:
> On 3 October 2018 at 16:07, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> > In QEMU we'd like to have a virtual developer board with the Versal SoC
> > and a selected set of peripherals under the control of QEMU.
> > We'd like to gradually extend this board as QEMU gains more support
> > for Versal hardware components. QEMU will generate a device-tree
> > describing only the components it supports and includes in the virtual
> > dev board.
> 
> So, the SoC implementation and the GEM and HVC bugfix patches
> here are straightforward. What I'm less sure about is the "virtual"
> nature of the board model. What do we gain doing this rather than
> just modelling some particular Versal dev board?
> 
> At the moment we have a fairly clear distinction:
>  * most machine models are models of real hardware, and the
>    real hardware is the litmus test for how things are supposed
>    to work (and, like real hardware, the user provides the DTB)
>  * the "virt" board is special, because it is purely virtual and
>    contains only a few specific devices, so it can run Linux guests
> 
> This would seem to be an odd hybrid, with an SoC that's a model
> of real hardware but also some virtual "QEMU controls what's
> present and creates the dtb" aspects.


Hi Peter,

This is a good question.

There're a few issues we see that we think this approach will help to solve
or at least mitigate.

The Versal architecture will be a family of chips (same as ZynqMP). Each
tapeout and board comes with a set of physical limitations. I.e due to
size/power/heat and other constraints not everything that the architecture
has can be available everywhere. For example a specific board may only
enable one GEM.

We'd like to have a QEMU board that doesn't get limited by these physical
constrains but instead, with time, can grow to the full potential even
though there may not be tapeouts nor boards at this given point in time
that have it all.

Another problem that we've seen with the ZynqMP is that users struggle
to run stuff on QEMU because we don't support the full set of devices
needed to run everything that you can run on a real board. So we need
to create "QEMU" device-trees that contain the subset that QEMU supports.
These dtbs then float around and mixing and matching versions becomes a problem.
If QEMU generates the a device tree on the fly, we hope to avoid that
problem. Note that this board still accepts a dtb on the command-line if
users really want to pass one.


At the moment, Versal only exists in FPGA based emulation boards.
These implementations are flexible in that different configurations can
be re-programmed onto the FPGAs at any time.
From my perspective, the name of the board is not so important. We can
call it Xilinx Versal QEMU Developer board, Xilinx Versal Emulation Board,
or what ever but it would be nice to keep the characteristics of an
phsyically unconstrained board and the auto-generated device-tree.

I hope that clarifies the intent.

Thanks and Best regards,
Edgar

