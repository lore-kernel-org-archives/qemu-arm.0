Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp198054wrw;
        Fri, 16 Nov 2018 02:21:09 -0800 (PST)
X-Google-Smtp-Source: AJdET5cahzuzno0FDUOGLjTxxJnt9nPDt9VeW6InLg79ovClixTdCpPDbJVZf5TAZpZWY0Hsi7eU
X-Received: by 2002:ac8:26b9:: with SMTP id 54mr9670517qto.301.1542363669381;
        Fri, 16 Nov 2018 02:21:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542363669; cv=none;
        d=google.com; s=arc-20160816;
        b=iq4hT2us2Od/kodYU7kPhsdPrXC8eJfv1sGiONcaS93lf7fG8tiigwpq1zglQcDlxT
         miKPlnHEMe+cj5YRlx/cMHuVcazHBdCfX3i6MmSvhnrzznxZZn2hCG6CLP7sKakkWsjY
         n0NUGqrQhfaPurUoqVmSNaK+J9AHZKh9GMxwkKoj9+Gpj6ShRKoHb1PbBwH0XJXM/Iyk
         3loy5B+V++mcdpaWk5LrToZYYmsmgNgqCGzWZIC9uRNcMVMqKtQcrvHUHUSuGkciQX9U
         /L6ONGh7e1vWLVqfRt4Vpk1zvhXAG3WbWh+rHcrAXSwGBqa66+/zFHBLhOUOE75QbVqo
         q0Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature;
        bh=jRtLB6M85akvWCjsFsl0e+FAA7AxwzwjgiCXUMlAR3M=;
        b=ZZ69aVs/2T07rHnwJ+ADL+UJSiJNW3aRh0fJt4NIIiOktEybHf7MBx+39xSQvyx5Fy
         g6g/xAqy+8OqwAAtMs1JekVdSSQq7DBWo/0Yp/+oS28dEP8LlpWLnZ8WesaM5ryvboVw
         l7gEEWPXovAX97QCaSsc/jcdCtjh6Ex7qGQMVK3rj5cUKe9mH1cokvQg22VQStp5YJ24
         BPY6NB6rKg8u770XbEIaRBZz0sEATLOEwbbh8b0KKrI99lBMG49gpLImxPI+6P2h1+bw
         4/yunkh8G6RxekVSbNm0BauVUtnuuBQvr76ZJ9q9WRvpwNIdwustElskAMw4TZP/gGAd
         ZYWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=Sqa0TO8p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l126si1087711qkb.210.2018.11.16.02.21.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 02:21:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=Sqa0TO8p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43842 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNbFM-0005wo-Mg
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 05:21:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gNbAc-0001yl-Vq
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 05:16:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gNbAY-0006Zd-Uw
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 05:16:14 -0500
Received: from mail-eopbgr770088.outbound.protection.outlook.com
	([40.107.77.88]:21344
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1gNbAY-0006ZC-Ni; Fri, 16 Nov 2018 05:16:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jRtLB6M85akvWCjsFsl0e+FAA7AxwzwjgiCXUMlAR3M=;
	b=Sqa0TO8pBzAwKL5uQLL4/drRlD1hhrRG/Z7U1qfyOKCyRhovcLqlr2di2rkjBtNHQvctsMk7+8ZZ1OTWUfzWVZvxWPGRTa1BR1hg1VJvyES0Hk/CMPWX8m822eTbybVQjYReGyxqrs41T/STCtjy+3inhNmoow04JrdIYmhNiK8=
Received: from MWHPR0201CA0028.namprd02.prod.outlook.com
	(2603:10b6:301:74::41) by SN6PR02MB4333.namprd02.prod.outlook.com
	(2603:10b6:805:a4::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1294.21;
	Fri, 16 Nov 2018 10:16:07 +0000
Received: from CY1NAM02FT028.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::201) by MWHPR0201CA0028.outlook.office365.com
	(2603:10b6:301:74::41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1339.21 via
	Frontend Transport; Fri, 16 Nov 2018 10:16:07 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT028.mail.protection.outlook.com (10.152.75.132) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1339.15
	via Frontend Transport; Fri, 16 Nov 2018 10:16:03 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:56224
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNbAR-0002yf-27; Fri, 16 Nov 2018 02:16:03 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNbAL-000860-UO; Fri, 16 Nov 2018 02:15:57 -0800
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wAGAFpYA002820; Fri, 16 Nov 2018 02:15:51 -0800
Received: from [10.23.116.79] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNbAE-00084w-Lr; Fri, 16 Nov 2018 02:15:51 -0800
Date: Fri, 16 Nov 2018 11:15:49 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Luc Michel <luc.michel@greensocs.com>
Message-ID: <20181116101549.GZ7447@toto>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20181115094207.22846-1-luc.michel@greensocs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(396003)(346002)(39860400002)(376002)(136003)(2980300002)(438002)(189003)(199004)(356004)(2906002)(47776003)(4326008)(106002)(5660300001)(106466001)(6916009)(76176011)(478600001)(33656002)(6246003)(63266004)(1076002)(97756001)(5024004)(14444005)(23726003)(229853002)(77096007)(305945005)(11346002)(54906003)(316002)(446003)(16586007)(58126008)(426003)(486006)(336012)(186003)(26005)(126002)(9786002)(8936002)(8676002)(33716001)(81156014)(46406003)(81166006)(9686003)(36386004)(476003)(50466002)(18370500001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB4333; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT028;
	1:gK8EmpO+c+M0azAk+VAIyUaPKaRIvr5npJglnQriJ7WT/+ggb7wxOiOVWPDJeSYF+yI3CJksOEAHKCnPgG7WDzgdN8tYiPXZC0YKA2bt7p7TkGmudznqo3qmhgvOW8Ow
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f08658b1-436c-48b1-3ecd-08d64bac83f5
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4608076)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
	SRVR:SN6PR02MB4333; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4333;
	3:c9rKRz/B8gZZ2H0dZKDF/kh3LNwHSufEGUVHrTLGzHkgCN/F7ulcXVXB/jsAnF0SHw3jw8EUT1WHceB1w4ktU2Sf0mBph5bCW3EwzjjIcl8PnRHUJBwVZgIitFWaVXYjRL2ljFMIE9HKPBTjOrnB/PNEjZ6fleadOuBoS4q/S/N1vA5YU2IjyzyReIdZkl4Mqs09NQSQsdgJZUzqb5VvBf0U6HcE2uczTc8a5wf7hZS0CV09ISLuK9M8rIb5owMM5t/siTbp71HSwEgsVaqEcgVeAM1j69V42mc3CgtNthEognCF2qrJR6lpsRWMJt2imvm3mJPAQBDDUIk85485gJz0CfS/3CTswfgO2XslFRA=;
	25:82gn2Lgr4/idn+Tj+Xjk2JJyxotwD9MerR7uqRdhIhcixQAqd1EdJFQNhNFhtOV/6LJayXyybOBGPS52Py70oaMw0ReMTXwPAGHVox26m3EH04oKZmfiOWkp6ycldXCx9D6NC7XBqKuA/DQ9TabmdqzcHCa6QLJXOvbuERNfqrZP1qlou8VLqL0LuoCxeziMhVKXWvOMFLTIHXJyK8lQHmyv3hDtJnesoTPLsdU0JY5wnzS1LUgzy5I1pyjtr283rrNs7cWZlXjZrH2RIfyHPIIMRz/WG5I9wLmvd/ndMtNTSBhSUIj0ro+axl1G4myRQ26NuasWKhPh5GzvBDpyTsD5SevUoWN0BxCoKL7rrZA=
X-MS-TrafficTypeDiagnostic: SN6PR02MB4333:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4333;
	31:cpMidf9NFQafg/liSQGK4svmjegogU64/mBOhoHH1tGAA6rBNYKXmLAISrNXpQ/WTq4uu/ObEelRx0LFOeJAf62mEtqRVhvJIywDQTD5bWgwAHqNZ9gtSHYMJUnf2f9lFEUQWQPmy/GF5w4ejkqcetmFHHkcv7tLwhgNyh2B8YHGAAyMhmxC6qa1T7Aq55EJIs6U2GNmq4POA+s9wUuG+eEoWvh4rn3TXQGKSMrdSW0=;
	20:sKbT9M/vHeGkU3GmuxpldB5Jah6/SY+VXInF9cbgzvxaWOXcLYOQmfidQYy4YzEdBDAh53oBGpOUjAU1cb+ihysBXo6gatc1z4MoM+q0ZrH9d5qBUjVb1DXCM/P5K6J8dVzgFCb3Fj6C+0EQSjrXvAH8z2o4r/lEOhHKysTF//woAxrLjF1Q6WUzf61hm/la2dU+8kIHA8Drtyv1Zu7uJkybRcaORTuKMCUsEWer0Ro9NXEiLH5I5Klgfj0EuJnZzTmRH2Ctky0FuQ/v7yZ6Q6GJrZLnVNWfXZsRrZr/N4WpbqcL7He82hR7svrG+nytmo2fwXVamsVcWP3gyYL74SezsTw/kxNKo15V+LSWPECJWWNmzXA5vohnvQSAMAi9YHx/YWPObLSqudzEdX/gyqNXElk4b5+TtyotZjGzAlh/VzgA+DcFW0a/KK7d8azrs+HDxpVAXnrA0DI3ISSXU99YjSIGp+144WgT3SY5nNk+sfoYTmgJuhk0332E07Zy
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB4333BC4E02CD268351CA3BF4ABDD0@SN6PR02MB4333.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(231250463719595);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231415)(944501410)(52105112)(3002001)(10201501046)(93006095)(93004095)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:SN6PR02MB4333; BCL:0; PCL:0; RULEID:; SRVR:SN6PR02MB4333; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4333;
	4:9izaTAi7dh1gbGeQl1VxraFDGo0gnG5PrtBWnPLm1wLGAxh70PoTO1h6PMPr9f8rxDoHLYz8tt3vtAsPy7neg58pOcThyFtDL0t6Ya/HY3bRZwkbNkZvB8CR+swO+uB1SNR8AeT2FGs5yAxHlW0YFR3x8hINMERF2xT2r/0xV2ip5rAHBa1GQWDlVJxBKc7tuVVenQkEI0V8BQ1ZOXz0WC4Vn6ipSMTVHFyXvJMZ89GvF1puKDtPw3jkxyOZ2V7HUl7pGDJhMR31A4LS6qxYT7KZMlnwyfyWdkFPswDjBihqiM27H6vXb1wA7KmUCQpG
X-Forefront-PRVS: 0858FF8026
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN6PR02MB4333;
	23:VaOngTM68EAhUZPM0+QKJWlrHnNUZZIszfAdSh15c?=
	=?us-ascii?Q?TXVO/JAU/6tiEenPTzgiCknVBqfaiWd+XdEC7HtUsy2H982IYUaIhTLK7Fho?=
	=?us-ascii?Q?hNM/v+kLd19+hLZsz8XulG7rU66wXBZXSv5hqSHv8XymjxftuJALSmYq/skV?=
	=?us-ascii?Q?E5nIDWEB+ukolx/rrPA28/hXrmbv0eVMVR2mUxlL57pEuwW+YEPS2HZY/pdA?=
	=?us-ascii?Q?ze+1l1aRbVCJK2Lr8SBt6EmGS9WcLJbYxS6eMbG3bOPYRCQOSYjbR0pu1k5V?=
	=?us-ascii?Q?5VaGj+5q/2ro9FDYCZRXbevkyV2UaYoAh3PwjWWBZt4+uTVHicSPI/Vzwpku?=
	=?us-ascii?Q?DnB+mQh+IC++va6g/56jcVGR1RMDKqT1haDBy5WKwgERor3C7BBWI/XZCRzG?=
	=?us-ascii?Q?go80b0mgv9muEeaxhyR54g2IEABcd1juIfMLUKPlDWMooDBazEuf7dcYskal?=
	=?us-ascii?Q?O7WSl4DIiH7RhudkDQMllDq+ETwMUjcvZleK16/Bk+KorIUQN4zBXrMfkkEW?=
	=?us-ascii?Q?AZCR1EaBS+xZdTkr3s/NRx2SRvapOx9yfySuoGWFmxPOPJYtrGzr8gRV4i+N?=
	=?us-ascii?Q?ybdcMB9gcIEAFiCqkppUE9xn/dR929hX56s5lV3xCemTx55yewJs+8KA6JZg?=
	=?us-ascii?Q?el124452UgPL6Z6TF3EXx0leUFrUnruihXrQEUn1M1DiDNvjPVQuHDQMYHhZ?=
	=?us-ascii?Q?BxtGLAb1SXkcSt3VVMVysfbe7ag/iL2SqN2XFpTos6eBCtAHJH93hS119Bro?=
	=?us-ascii?Q?rQOOMGpbSjDHr+YjD31zcBb+iccLvpRkgGbs67fU9hgU8IDbSGjRyajR5UxP?=
	=?us-ascii?Q?tTNk6yp8fgbeeBNEPvHC6XcJoFPJ/5rW6nm5RNFzGKPrCjZQ8ZbqIDU0qObn?=
	=?us-ascii?Q?+M96iYm6+ZVe/PHViUjZjQiWe7Iu/KuA0tJpUHpqgmn9u/+Fj/j4VP5tpDRR?=
	=?us-ascii?Q?eHDv4tASmRt1wQ+qz8rgRkE3YCN+khAJ6tzO5oVw9aXAfaUr8P9IqhDzevSv?=
	=?us-ascii?Q?t31r42Aosk9EgmzXJB8iUGu1NOF+Udl8TovSP5BlhpDH6QIr1F3zhj+iAAau?=
	=?us-ascii?Q?4M6vfphn6f6UyxbwBZ3OfzXNOiV2sBg1yBf2UdST2mVyqLFTLk/t+Y23jHXI?=
	=?us-ascii?Q?8A+imGJ/tAPS/hZv2Lw0u9tI95fqUt19WbHqBAShcAF4Y5lbfqVcV4YEe8RF?=
	=?us-ascii?Q?yPo/xAmhOSnOMCGJ/wGtCf2fYDtsa1PVggaRckg7fAtOHZyQy9DheJ3xc5jG?=
	=?us-ascii?Q?POy3SVCZ1sLdfTjlplhLmsYOv0QlePVKRCSkOTv?=
X-Microsoft-Antispam-Message-Info: yfIAgrfC2bcrKVHj8b/Me3+yjXYPgT2ohdv0QZD5Ifva68qRnFgGnvW2U9jzfsI/wZcJDn+FxkmgCeMiig0vBSmyVOpv1QmfhTbOswsH2BGALchpzSpgCg9WD7AryUvOfJMe4GFPHcc7/7teX/FdWlMEUnkR5xKQmG7Nxvnxha1WzaCONhSy44qyrLypPoCVW1VQOspQxL1xLiF4yxXNQwoeZt/AA3rmxD2kejnBnIt2P6Gk9CZ8tGcQJG13L67aGNGs6ZsoOi4DJWo3iCn5nR4O6q5qYLt84F+8qZoh9XnuNqtCO2zefuC3O+7EOCJ+qe0R/9pGzivmz6nc+FTCpSGnzCl8X/sE/PDw5hJp/Rk=
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4333;
	6:llxvLDk9CPKszupKDFOCJnB2bEDpiZJcH6heB87gFdqarlgrHcB6Zyb105PtQc+dsPc3E8PFTZEwURLj2mNetLljkT9s4zr5W/yqQqz9ri/w6OLdKcabuHMS5GP7bYqQyRrgoUIuJkoyyalISLGaYdaAqvMP+3LOC/qaO9StGnSNJCLF0BpO9vExZcW192cXK7mcggu/ll9OUQ1m+8ogRSSdvURaDOVFeFkHgBQiXGWJwbPm0WXEcb0FmKCGhbaBlVX9ko2Jmy7OyoqsQC54IwSqCTaAAOlw5RqK1a4YpAp+SoTrtzLVkBsCo27pt3Rg6tfFEbFzvqRoxzdxJH3Llm5ck+63qaLAwQ2sFZHAqdYwuaOUMvNnj11+y/ohvi0Snya6AZhqsjLrN43lfvFZmfnLnq8c0cd1XpWnHmU/kDm/dRbj/VqN5d5k3Ap4LzMN4IUbOljzfpljPGnX4KcQyQ==;
	5:FWDdaCRnd7h2JLsAliNUZbKhcUe6NzLtOE9XSpXEU9tmLy6oKaqKnSQvMkRIdJAZHlmEyTyCc23rTA6CyfJT77eaPd2nKP65x5YWrJ4tYY0PDFDewZPfeal47NCOQXRpBU3dN1feTIUZYOWFRRdBV/G/Wyrsh+cBcEUIvHvGgoU=;
	7:iv6nGvqM3CLCJsUFyahwud3/4JW8l0yKCzeURPaznQFILSZ8J+OzmhIxWn8PK0nlh7iUMyg3vcTLKG2HfEHRMFmvbIMziktiNt9cHVi3YvNGddQnC+rmtHJUSiGfByyEXmX254xjcDfjd0gy8NL62Q==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2018 10:16:03.4693 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f08658b1-436c-48b1-3ecd-08d64bac83f5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4333
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.77.88
Subject: Re: [Qemu-arm] [PATCH v6 00/16] gdbstub: support for the
 multiprocess extension
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
X-TUID: uoB6AYTYt7ma

On Thu, Nov 15, 2018 at 10:41:51AM +0100, Luc Michel wrote:

Hi Luc,

I think I've either reviewed all of the patches or commented on all now.

Great work!

Thanks,
Edgar


> changes since v5:
>   - patch 1    Rebased on top of master
> 
>   - patch 2    Cluster ID handling hardening to ensure uint32_t overflow
>                won't cause PID 0 to be used [Edgar]
> 
>   - patch 2    Fix the GDB process ordering function to avoid uint32_t
>                overflow when comparing two cluster_ids [Edgar]
> 
> changes since v4:
>   - patch 1    add cpu_cluster.[ch] files into MAINTAINERS Machine core
>                section (thanks Eduardo!) [Philippe, Eduardo]
> 
>   - patch 1    revert to uint32_t for cluster IDs [Philippe]
> 
>   - patch 1    fixed a coding style issue [patchew]
> 
> changes since v3:
>   - patch 1    cpu_cluster.h: remove QEMU_ from the multiple includes
>                guard #ifdef/#define [Alistair]
> 
>   - patch 1    cpu_cluster.c: include osdep.h first [Alistair]
> 
>   - patch 1    use uint64_t for cluster ID for prosperity :) [Philippe]
> 
>   - patch 1    auto-assign a cluster ID to newly created clusters [Philippe]
> 
>   - patch 2    fix mid-code variable declaration [Alistair]
> 
>   - patch 3    add a comment in gdb_get_cpu_pid() when retrieving CPU
>                parent canonical path [Alistair]
> 
>   - patch 14   fix a typo in the commit message [Alistair]
> 
> changes since v2:
>   - patch 1    introducing the cpu-cluster type. I didn't opt for an
>                Interface, but I can add one if you think it's necessary.
>                For now this class inherits from Device and has a
>                cluster-id property, used by the GDB stub to compute a
>                PID.
> 
>   - patch 2    removed GDB group related code as it has been replaced
>                with CPU clusters
> 
>   - patch 2/8  moved GDBProcess target_xml field introduction into patch
>                8 [Philippe]
> 
>   - patch 3    gdb_get_cpu_pid() now search for CPU being a child of a
>                cpu-cluster object. Use the cluster-id to compute the PID.
> 
>   - patch 4    gdb_get_process() does not rely on s->processes array
>                indices anymore as PIDs can now be sparse. Instead, iterate
>                over the array to find the process.
> 
>   - patch 3/4  removed Reviewed-by tags because of substantial changes.
> 
>   - patch 4/7  read_thread_id() hardening [Philippe]
> 
>   - patch 12   safer vAttach packet parsing [Phillipe]
> 
>   - patch 16   put APUs and RPUs in different clusters instead of GDB
>                groups
> 
> changes since v1:
>   - rename qemu_get_thread_id() to gdb_fmt_thread_id() [Philippe]
>   - check qemu_strtoul() return value for 'D' packets [Philippe]
> 
> 
> This series adds support for the multiprocess extension of the GDB
> remote protocol in the QEMU GDB stub.
> 
> This extension is useful to split QEMU emulated CPUs in different
> processes from the point of view of the GDB client. It adds the
> possibility to debug different kind of processors (e.g. an AArch64 and
> an ARMv7 CPU) at the same time (it is not possible otherwise since GDB
> expects an SMP view at the thread granularity.
> 
> CPUs are grouped using specially named QOM containers. CPUs that are
> children of such a container are grouped under the same GDB process.
> 
> The last patch groups the CPUs of different model in the zynqmp machines
> into separate processes.
> 
> To test this patchset, you can use the following commands:
> 
> (Note that this requires a recent enough GDB, I think GDB 7.2 is OK.
> Also, it must be compiled to support both ARM and AArch64 architectures)
> 
> Run QEMU: (-smp 6 in xlnx-zcu102 enables both cortex-a53 and cortex-r5
> CPUs)
> 
> qemu-system-aarch64 -M xlnx-zcu102 -gdb tcp::1234 -S -smp 6
> 
> Run the following commands in GDB:
> 
> target extended :1234
> add-inferior
> inferior 2
> attach 2
> info threads
> 
> I want to thanks the Xilinx's QEMU team who sponsored this work for
> their collaboration and their prototype implementation.
> 
> Luc Michel (16):
>   hw/cpu: introduce CPU clusters
>   gdbstub: introduce GDB processes
>   gdbstub: add multiprocess support to '?' packets
>   gdbstub: add multiprocess support to 'H' and 'T' packets
>   gdbstub: add multiprocess support to vCont packets
>   gdbstub: add multiprocess support to 'sC' packets
>   gdbstub: add multiprocess support to (f|s)ThreadInfo and
>     ThreadExtraInfo
>   gdbstub: add multiprocess support to Xfer:features:read:
>   gdbstub: add multiprocess support to gdb_vm_state_change()
>   gdbstub: add multiprocess support to 'D' packets
>   gdbstub: add support for extended mode packet
>   gdbstub: add support for vAttach packets
>   gdbstub: processes initialization on new peer connection
>   gdbstub: gdb_set_stop_cpu: ignore request when process is not attached
>   gdbstub: add multiprocess extension support
>   arm/xlnx-zynqmp: put APUs and RPUs in separate CPU clusters
> 
>  include/hw/arm/xlnx-zynqmp.h |   3 +
>  include/hw/cpu/cluster.h     |  38 +++
>  gdbstub.c                    | 643 ++++++++++++++++++++++++++++++-----
>  hw/arm/xlnx-zynqmp.c         |  21 +-
>  hw/cpu/cluster.c             |  59 ++++
>  MAINTAINERS                  |   2 +
>  hw/cpu/Makefile.objs         |   2 +-
>  7 files changed, 687 insertions(+), 81 deletions(-)
>  create mode 100644 include/hw/cpu/cluster.h
>  create mode 100644 hw/cpu/cluster.c
> 
> --
> 2.19.1
> 
