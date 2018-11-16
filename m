Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp175488wrw;
        Fri, 16 Nov 2018 01:58:27 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U9Xe6jrUjEg7p4L2NylDzieSudKG8TwrAkOFsjQxIvrEgMSZAbBlWqVj6RO9PY5p/Ctkzf
X-Received: by 2002:a37:4e58:: with SMTP id c85mr1126217qkb.27.1542362307633;
        Fri, 16 Nov 2018 01:58:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542362307; cv=none;
        d=google.com; s=arc-20160816;
        b=lP81eBaFH3s/GsCAAbjBDz+Yz2Kwo8Lkk1bCD8bYUiH4AkBqMni+JOqcuqrhv7ZrXB
         ZMV2UxKHT2o8MCscYVIymUllNjvpJR+kF++QyXYh2MotAvx7jhyw10kuEoKotG35u9l3
         67QG5DxMKnsxMklCz9zGkjooLPcY4cIa7L5FocapZbUHUkkK9dhD7GZae2He7HaIGDRY
         VRux77uEnffmbi0tMQ07pIqn8cwYzQiyaycdgvnIuwhmlJvrzvoxO41034/lounO+mtH
         KMSEAyoir+EOLuIxzb2zLACM+Zlfw3KyNyhXMDvcFIN3v6nFOBpwwl/JGPKBjBCvJQxc
         nJoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:dkim-signature;
        bh=dXyL5oJYX/BMKuKPrOuzVBOOaeyHl4h80LVUjIphlGU=;
        b=VgxLw91aaxnR0nGJHNHf65fFD2HyaJ2g1I+bkOu6k3gkLLp+VvbqjFkDIzOjYbQga/
         h9YTdXYtlDSn0Y8XiWlrXJen7I6eYaqYnzE/WZOmzO25HTfAkI3x87KKvU+3yIf9kMff
         xJxTqM8pdBO+CCq7wXLFAJFEOoGiufGod/imqnEoB3Cai1aEL17mnRdv085AOX1uZN9W
         eMfogXWOEuXullSMDBfReLzOXCXpfgg0YfqNpCajYzykwPrxOappqQB69DpK4DynnQnV
         gBCTLOrqeYbZsUaAy+wRfU3d7d6WTtAxiW8rEUnRmWpQEitXCEQkgV1qzm/na60wgjQW
         Db4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=KDLrlVeM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 70si8853223qkq.205.2018.11.16.01.58.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 01:58:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=KDLrlVeM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43708 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNatO-0006X6-FY
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 04:58:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gNat7-0006Ul-3y
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 04:58:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gNat3-0002Wa-QG
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 04:58:09 -0500
Received: from mail-co1nam04on0627.outbound.protection.outlook.com
	([2a01:111:f400:fe4d::627]:56768
	helo=NAM04-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1gNat3-0002T9-G6; Fri, 16 Nov 2018 04:58:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=4iqCaX+3+YGuXN8hY9dqX7ZSDEUcitmUXUQCjdPPoU4=;
	b=KDLrlVeM2AB8pMaDgGKr5L9Zd0nRObz6z8sK4IDGc6pVE4rf9+1g61rM0ISB2zzlILWpf3gH+XMdviHmrnMSiRXbl7GwYt0/IGJGrSUunST7MrAo3szJkXIT3FJG25mgZIXY+Nh6TzLZL8/03e0yvXGEs8xlBPRFLEPqZnspHm8=
Received: from BYAPR02CA0031.namprd02.prod.outlook.com (2603:10b6:a02:ee::44)
	by DM6PR02MB4458.namprd02.prod.outlook.com (2603:10b6:5:29::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1294.26;
	Fri, 16 Nov 2018 09:58:02 +0000
Received: from CY1NAM02FT053.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::208) by BYAPR02CA0031.outlook.office365.com
	(2603:10b6:a02:ee::44) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1339.21 via
	Frontend Transport; Fri, 16 Nov 2018 09:58:01 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT053.mail.protection.outlook.com (10.152.74.165) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1339.15
	via Frontend Transport; Fri, 16 Nov 2018 09:58:01 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:55969
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNasy-0002oD-OR; Fri, 16 Nov 2018 01:58:00 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNast-0002K9-Kl; Fri, 16 Nov 2018 01:57:55 -0800
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wAG9vkZj029538; Fri, 16 Nov 2018 01:57:46 -0800
Received: from [10.23.116.79] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNask-0002Ji-DR; Fri, 16 Nov 2018 01:57:46 -0800
Date: Fri, 16 Nov 2018 10:57:45 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Luc Michel <luc.michel@greensocs.com>
Message-ID: <20181116095745.GP7447@toto>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
	<20181115094207.22846-7-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181115094207.22846-7-luc.michel@greensocs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(136003)(376002)(346002)(39860400002)(396003)(2980300002)(438002)(199004)(189003)(106002)(50466002)(186003)(54906003)(478600001)(336012)(11346002)(316002)(58126008)(77096007)(446003)(33656002)(26005)(229853002)(33716001)(356004)(476003)(426003)(486006)(126002)(76176011)(23756003)(2906002)(5660300001)(8936002)(305945005)(47776003)(81156014)(9786002)(36386004)(2870700001)(63266004)(6916009)(81166006)(1076002)(106466001)(8676002)(4326008)(6246003)(9686003)(18370500001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB4458; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT053;
	1:YQ9VibnEKYJTrA+XJrhCHYjeBqhWNerBQ+VcG9M4cYIgB31SkLn0iqJ5PNsMKYrrO7RmGm3CLANtjCkd/UuoB9RYbfyMAIzqiBdKlXuMqEyfuoj/fMBui964xm3qH8rg
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e556995-4157-4a3c-88e0-08d64ba9fed1
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4608076)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
	SRVR:DM6PR02MB4458; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4458;
	3:KxnVsXo3oInRV/8FRbFPtI/Vr0mgcVP1ZVBgvj0KkAy5hP7MrVPUPmqvezgAXS1tPXH9b73QXXHQLDZ/CYHvjsjrSQ03eWQhfA631DiYehlslVPKDpaatSWWgif3O2wNKJtvUZlh20gekF2qk+hQgxuibc5X5t6ekg3fOKft+oO7UI8QhONzMHhx5eGScRtWEiVyeKSWiJ3y+TSBxrgcUnQrBN2ygMKNW3KLEaLBsIcm7eHagxUwzYVaUNefmYLIdu7/dlg1X+aH2r5RNz67Wxa6o0qsGpNm9BQWarq5FkwGBqXwzK3urv4iatPuVN73w7Wzt6nuSKmr+2aOBXzvUxfWD6dezTLVk2c1L6wwGfA=;
	25:MLF7WmEddSigtWKP5U+QQQqzAJYNv11O4NBA5GJ4IVF59W3sbh4OKdIujEA1HSOFUY20hNPwlYEQ74tDVy/b9gZskS00oiVmBcwg8LCymgJEgkkRuMCFyLXlBWNqeuv2U2hYYBqdQR+OpI88tuvSn7CSd0KjoQAO7nBFwKIY4k0G0O1NhEBz4zOfaGfjp4PMahsOCeTDNHbh0VpsFtEr8sghSO5VHjzCueXFJDQXAmmZXL8aL03hdLLZIFrgZ4vTBm9MI+mI1PX+iVKljHYPNjXQlNWVgyVsxcDC9lOKLKBagLRfJIiYdhnKtqZhj6sbtPf31fJQdpD2IcUGwkM1sA==
X-MS-TrafficTypeDiagnostic: DM6PR02MB4458:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4458;
	31:Bky90Cis1qDwZicJJyS4h15pfMj9ni1iEDONdOsjZ74Ulfk5Lbu6GS7c+0fqJhULOfHH9fOkVHyDIPGfTsO59DA8po1oVXvukWN8Y+MaNwEoeGxcbKrTdUMU00uZ1HiNgZXzGT3r+lQal82IWU9BPt0bYxL5JAC636lOzy3EbfVeN6qGcoOfbJ8D0LXWe2WTmyfSCvr2ccQgIb9a5vXMCRGMAokevx92cJkx2mt5FDE=;
	20:mi2GoRdl5P0Ok0XmwU17Vw9A8f87HoNUxKmAeLB+UiLYkE0Zbfk4Uw8PhJWW62FkDMl5abM8w51MWAtIEtRNDnJ9KjQwC3iiuocVAD3LciH8xij5e2Kq2SX7/aKeVrtDwZ10z6qOFzC8n5OoWuxyUMcpT3BULTI1vyf2QnieYkto1T6v45SG0/s8Q2vLKLPyANA9knuaXujbUZNMLL7sflZS+IIFdh6z52z+81fagKNNy2qU7ZwN1GmdJ+6Z6TNqti+yQ3vioC2jhMKx1hyCR66jfuy8e9MdEb1Z2LwQlzhth0isN/Ml59ewJW61zn4RkIm1BHfkK/M42P8/Ll56UONs3xxDU1UcUT6ked0tsHdb68HB1MvnulenUNlgj6QfW205ycpprEkTRpetp5nH6hAvtk5NSkDin/yMPAP4MY3bSM2J4OS167buXWF3EWZgIloa+fRArQWfAB8mSRJJhNbL33nxcsNG8qi/qvl5LtLoMWkIy7y2SlXjdBp7kMrE
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM6PR02MB4458B62831EB6FCED0A425ABABDD0@DM6PR02MB4458.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231415)(944501410)(52105112)(10201501046)(3002001)(93006095)(93004095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR02MB4458; BCL:0; PCL:0; RULEID:; SRVR:DM6PR02MB4458; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4458;
	4:SlADdAwaqLBX5UX64EMPvjCXt+iY9x/Bjs9cbVkI7FYvhxfKLLzOWz6TclJU/5uiZSJ1tpPm8CP3Ct7Kqh6QsRH40JFNqfp7Ao+gKiu9/TqxX1MwjWhsIjKlNbvUW1LZZsAeZAoxVFnXhgt+Rb/Fpc5D6Diply6ECmVEXT4XClChxskKUBBMPa5sw8aZto4zjg/fSWAkxaxxb5ibdW4ef1ZbsNNwiy8et0GQ7o0FCr6plyfBN3UCu8o92VePp7P6nO50yIzZ5wowscEITKn83Jy/IQ8hVHENQ6UaYiHFBAy5/v4OdzF85x47hpyaAxUs
X-Forefront-PRVS: 0858FF8026
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM6PR02MB4458;
	23:i46of0aSRnDLYVUam7GSa5x8OR1lz0CQou3lpcLqW?=
	=?us-ascii?Q?Ql9npK6rFsGs/O3jDtSYxfQU3I5LusgZH8oNYA8wxoPV3U5LdhW74+NBqJJ+?=
	=?us-ascii?Q?fIBQCX2H/I0yTahbD1HFVd9GwbOgggIcDDRxRt0cZoUzQfsyaj/iapmCiWbH?=
	=?us-ascii?Q?TBeQrbYxsXfD8EQW9PwZTpRghKRi3ebrfupylRBDlf3tPNAHZlTi/bndoeS5?=
	=?us-ascii?Q?o6GB9nO8neeqb2T28Es79LI393wQAJLiZgO2BolPrVAMdZWN6WtKy5sb6ijF?=
	=?us-ascii?Q?uI+fxM26puSMyRHjKTh8xxjSS7j/s8OHtOT9gNZWbJscK798itzNDerH4+9o?=
	=?us-ascii?Q?bltHUYK1vyDgTTALXjuYg9nwT1AEEbfSxb1CDhYmicJ19f66AobUZvPsZvm9?=
	=?us-ascii?Q?odQC+e1LIs85LaNK9vtGldbhvwG9V9JE6Mf1l9AMmlpyPBFZRG/mgbciKHTT?=
	=?us-ascii?Q?IrPAWREm3lvO/IKAi/OaD5tWlyCrKzDS8PZR/algP/vfaDoPtZSBfWki7wJr?=
	=?us-ascii?Q?eNfzAGzT7SdDYn8VpknC/KYemLygCnbxsEpqVV7Ccjt1MUS3fL4y38yaRVGo?=
	=?us-ascii?Q?TnAA4NHaEaWBB9d+6f2Iv3v5egXLb5U8lTYWGDL2GO7hpFiihhrJ7MJNTuvc?=
	=?us-ascii?Q?f5oakfCIY9tsvXb3zqU0cWMxhNwRHwlGN/Lp3ol2Io2yvnVuj27YYv+Y9bKU?=
	=?us-ascii?Q?O/KaiQ1dYmL13HTTwwYJH+6Prb8qi3kG9ZNpmNlyddzuJfi+4deLjG6JlONr?=
	=?us-ascii?Q?58mWkZHOCYZoJEQ+OfPV+1hu/1iD3jhjnK9ksOg6/OyWLLk3BLl1ucFOXXoQ?=
	=?us-ascii?Q?sM1KGvhJZElZmYMvycU19orVXAsKa+/o5iynWrqzAhKnvwEHQtKkAI2FLEmy?=
	=?us-ascii?Q?ueNfmbuYp4nlmOpMvzVJkJPJIbh2A3Qig4MQ7Hl6t1bSQ8NEIThm17ybo1qB?=
	=?us-ascii?Q?G540VJ85k20WbkZW8pxeY0DylYuyCA0F2KW3eM7Osxah0FMWcZQj3OOOKLsQ?=
	=?us-ascii?Q?+bXSUJwvy+UM3erMKVI59q2xSJu0yiQmeZ3vW8tnkU9qPUTuvDZ4MnVrif0D?=
	=?us-ascii?Q?n+NV75p8OPSKg80v+jx7AE2Tuul+hS5KxXxgbAhE46fMr/5p4AAA79BBOKYr?=
	=?us-ascii?Q?zJ6fTtFICbCSi48wVfdlk+Nmvdzwu6D62+E9O3T6RGPM9GD8cUNWRsHFYW1r?=
	=?us-ascii?Q?YX+mPAwZjC75O8=3D?=
X-Microsoft-Antispam-Message-Info: PfBu9yPC0HIMaW48Kq5mcTSN5WGsmOtyRVOJxWaxa7/pULuZweD32vHyM7dL5fE0U3LGJMsiFAUvJW02+1B/wA5rl8pJH12E0z9vC3R41LAcqx7YkmuW0x8gQmkIVM/cIo118D1rqbG29BtYiBytD86trWNl6ge46UZMJ0rWPWbDl5nK7xxEHNlb3IIoY1N/5wnLPt7H0nqJwzfg8pHO7yJccXc4cvww1Whj4FTBuyFhBA2DSYwDyMMBLZq1qMFBA0586dN4gEhuYa5jnFG6a1BquzCFYzVpKtmot9F+QybMbMgp0BNB59l63ZfKIXaJhRYTyxrrNLhqZpp2Kc4FWC5zU2pJn4O6LazbCeefcBM=
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4458;
	6:8KPJcw2jF+yESunfj5+iiP8FFu68BkSMMQwA322hRAiBCwAzmB5SDOKqs7PFICgkRtLcLwdmrh3mAFMOAPiIiGaFmfRHN6PPfPwK5c735ClD+SyOn42Pn2jLMKfAFBu/3Y1/WdCDNX0vWNApb2TTpL3ml9eXiQPn/4SmqQ1Q4KRON65rMtDAC2hrANGLtNWzGHIG7ex55ZDzgYZbYeB3l9OzxTZWw2Hu83DSncYqdkE2QzcSk2605D/GzlEjeNEY3RmpRuZK05Y4RQSrpHyTzSbnR2nAtpBB96BW2ej1Vc/b1PCfJhh8qEhczKvFMIrfLVD3PpDMlIs3hMKjOJpBauhHC67yBo9egR/H07MOKWIHN9KbQL47g0PHOhw6e2usdmnk7MzEkWlAZIyZ4GsZTe7FYKYG/zSlWNzJTOK+Caf+t9nrcAbs6hCPvSNPF04myZdYIFhWl4HxuP0MtK90lg==;
	5:/zV9zQ8BW59jxG3+jxJ1pCkbhKWadTYK3wn7++4ApRjDQCR12ikUBaEO428BkX7HRYo+ejPXCCB4vnUfZhNBY9C7lE+4BM8bA4WqqcdMQ8HVMVF60pgp/Mww2Aml3A08TLMeMqXuOx0AvCKc0mx77My1ILCONE4qbn3EtI7G35Q=;
	7:zpg7ADObkVgFKt7XE2hXwZIFPnkFq+jf8b1K78yXyHbK/4yvMtT5ZD2+F1wTVyinQjSjkbF7A695ABzeBiCDmLplcPNhCye6bT15zCnHg8izdRi3aANqBCgXYjZ2vqkeCMsw0jFw8OCiD8N2Bxhj3g==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2018 09:58:01.1517 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e556995-4157-4a3c-88e0-08d64ba9fed1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4458
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe4d::627
Subject: Re: [Qemu-arm] [PATCH v6 06/16] gdbstub: add multiprocess support
 to 'sC' packets
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
X-TUID: BU1y1BVGNA40

On Thu, Nov 15, 2018 at 10:41:57AM +0100, Luc Michel wrote:
> Change the sC packet handling to support the multiprocess extension.
> Instead of returning the first thread, we return the first thread of the
> current process.
>=20
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  gdbstub.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/gdbstub.c b/gdbstub.c
> index f1ec3481cb..d19b0137e8 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1546,13 +1546,18 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
>              type =3D strtoul(p, (char **)&p, 16);
>              sstep_flags =3D type;
>              put_packet(s, "OK");
>              break;
>          } else if (strcmp(p,"C") =3D=3D 0) {
> -            /* "Current thread" remains vague in the spec, so always ret=
urn
> -             *  the first CPU (gdb returns the first thread). */
> -            put_packet(s, "QC1");
> +            /* "Current thread" remains vague in the spec, so always ret=
urn the
> +             * first thread of the current process (gdb returns the firs=
t
> +             * thread).
> +             */
> +            cpu =3D get_first_cpu_in_process(s, gdb_get_cpu_process(s, s=
->g_cpu));
> +            snprintf(buf, sizeof(buf), "QC%s",
> +                     gdb_fmt_thread_id(s, cpu, thread_id, sizeof(thread_=
id)));
> +            put_packet(s, buf);
>              break;
>          } else if (strcmp(p,"fThreadInfo") =3D=3D 0) {
>              s->query_cpu =3D first_cpu;
>              goto report_cpuinfo;
>          } else if (strcmp(p,"sThreadInfo") =3D=3D 0) {
> --=20
> 2.19.1
>=20
