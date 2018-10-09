Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4679463wrt;
        Tue, 9 Oct 2018 06:18:56 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62v4dwUzCeEhL+BD9VhOJReTb98wndKpoX4+NeJIYAubVW0r0u1bEje1tn6EPaw2F5xm+R/
X-Received: by 2002:aed:3e12:: with SMTP id l18-v6mr23337804qtf.62.1539091136231;
        Tue, 09 Oct 2018 06:18:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539091136; cv=none;
        d=google.com; s=arc-20160816;
        b=b4mbHieKgNCcJpaxByCo3R8pQJ0Bu822cUGpeR0pbdN2ydnny1j7/lYOStlAq1CfQP
         yGnZVH/fOigFgsTQbqwbQss5cBKZAspoIbPPx3lB26AfIkF2J5m3hbPKvv8Dmqk54aXD
         KBhc/ithhqYbcPjcZ8Y8mILn7N/5aki/Xpcf/t1lCwgFO+T1r+2+QUrMescYpDjRyeb/
         SYs0gbio+sP9ennyvAhCO/2uLKqbl6jCs31QxEPfP5XXALVQU9jqkjHwISi6rRfIlN2Y
         6MPkkle2gkq/D6A5uz8GHulOI8Q1q/M1SKV40bwqX2DuYp4Ba7u9hRYCPtExmqcXjlJi
         9phA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature;
        bh=l7i+ON9wjoA9Xg13ghx2ofWnoM2HfcRX1n3r8H2hItM=;
        b=kQY3mqlB2gaXgQJEFQBYwLk7QqBF58wZNMGqnZKoQYCnlueL016jSs60+uZ644YQA9
         1HH3Lrz7p0uyUqyUwZuvYKJMDZCPzAPk3EyvfFqDxQFeBgGVIiCLS0jKKhAef9cINnb1
         y76k6E2Pj1TTQem/fi2jyXbIVO5N4TLDMSX+N30Zk7VP537CWwJeKu30auX/Bvm5nAdw
         efi4lGPQJLm6bTUuOYJ2PUZIcMIk3sJpOR8efUm3Dk+MMsvPpBsuOBDD9k9///Axh3Cy
         4g12cxJblgjq3c3Ub648lQJUGl/ky2oqbbkzTuDwLSnV2LwANFoplEqgPiU7HYhyq+Aa
         LyDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=iQM9DN7A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f67-v6si398707qtb.199.2018.10.09.06.18.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Oct 2018 06:18:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=iQM9DN7A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51452 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g9ruZ-0001SL-3I
	for alex.bennee@linaro.org; Tue, 09 Oct 2018 09:18:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1g9rtr-0001O1-CI
	for qemu-devel@nongnu.org; Tue, 09 Oct 2018 09:18:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1g9rtn-0004Hm-C3
	for qemu-devel@nongnu.org; Tue, 09 Oct 2018 09:18:11 -0400
Received: from mail-bl2nam02on0069.outbound.protection.outlook.com
	([104.47.38.69]:64000
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1g9rtZ-0003RD-Sf; Tue, 09 Oct 2018 09:17:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=l7i+ON9wjoA9Xg13ghx2ofWnoM2HfcRX1n3r8H2hItM=;
	b=iQM9DN7AYBOvS8WuIPqTlBhAYF+9rxqu7eE12CAaSwHr//gj7Y+vq9YLZ4oe3yhr1RTn4B/21f15md3JWhqzJch+IKjQLKJVxy/Up7+rs+cSywri1ZWJtwPhctglpcy46ljoZV8BktWE08L/qA2uj5o9wuHdRKIDLjlFT/sTFOc=
Received: from CY4PR02CA0025.namprd02.prod.outlook.com (2603:10b6:903:117::11)
	by SN6PR02MB5232.namprd02.prod.outlook.com (2603:10b6:805:70::25)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1207.28;
	Tue, 9 Oct 2018 13:17:47 +0000
Received: from BL2NAM02FT037.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::200) by CY4PR02CA0025.outlook.office365.com
	(2603:10b6:903:117::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1207.23 via
	Frontend Transport; Tue, 9 Oct 2018 13:17:46 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
	header.d=none;kernel.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT037.mail.protection.outlook.com (10.152.77.11) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1228.17
	via Frontend Transport; Tue, 9 Oct 2018 13:17:45 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1g9rtQ-0005aH-U4; Tue, 09 Oct 2018 06:17:44 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1g9rtL-0000P0-QF; Tue, 09 Oct 2018 06:17:39 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w99DHb4W022966; Tue, 9 Oct 2018 06:17:38 -0700
Received: from [10.23.117.222] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1g9rtJ-0000Oe-GP; Tue, 09 Oct 2018 06:17:37 -0700
Date: Tue, 9 Oct 2018 15:17:36 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181009131736.GT4229@toto>
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<1538579266-8389-11-git-send-email-edgar.iglesias@gmail.com>
	<CAFEAcA9b4O4HrMwNTgbZ7JYdO=S3dnzC8ayabBEpKY5=DyBMog@mail.gmail.com>
	<20181008213407.GF4229@toto>
	<CAFEAcA__7wJ-4mNe3rKe4T+gDUbdBH+rB-DHE+fddmjVzG2=Eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA__7wJ-4mNe3rKe4T+gDUbdBH+rB-DHE+fddmjVzG2=Eg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(346002)(396003)(376002)(136003)(39860400002)(2980300002)(438002)(189003)(199004)(9786002)(229853002)(97756001)(6246003)(16586007)(36386004)(46406003)(316002)(5660300001)(53546011)(356003)(106002)(50466002)(33656002)(478600001)(93886005)(14444005)(54906003)(58126008)(76176011)(9686003)(6916009)(4326008)(305945005)(426003)(1076002)(77096007)(23726003)(186003)(336012)(106466001)(476003)(63266004)(126002)(47776003)(39060400002)(486006)(2906002)(446003)(81156014)(8936002)(107886003)(26005)(11346002)(81166006)(33716001)(8676002)(18370500001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB5232; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT037;
	1:nHHH9F2cK3UCwZC2rqDcMNl/eem6nATBwRDU0G4ef0gcIffs98W8l1j8yVQUsUnWDo82SLd/LnskXsjojNDQ3agE4Eo0tlXkm1WgN1euH2o2V0V5WZh6/VXyYNI4zL21
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ad70984-af42-4eec-e630-08d62de99ab2
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:SN6PR02MB5232; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB5232;
	3:SnmFUERVx3UJGsR0Ql2q3HErhiDrntawfmbAS38e/JNGOE6EzxFvc49dJC99UcRxXS1AZ2+rR0qRaWqNq68tIf1/xE5GaAo2tRJIM90vJ4+q6YbYtfOw6Jzc+Jp9ysVXyjRXeBCZFbW7qXhkHj+YSdj3JLU8FCysud5AtO0Ri0kgjqwT2l9jUjwTrh3/NO/yYhmQIS+A4+hapr6yJ6umG/xrMSOW9BcLzCApzAoOd6DKz+1hSkFN2CYkuCGgWOFwhJzSJQP72J8Rx4Tsq5rqyC9ap5wEEosEQmz2sVDMUq8L1qaqFEc+CzsWrrL0LxfkydcWTe9ou9e3CpAEtZGr+TBTuWGmrq7J6UcJHSJe+p4=;
	25:TmPEJ6q4KzWh+fK868phZCSCZq7OgEXhmfNXzEUArMYnHynUXbj9ZkXjMDnJOFTAjSfrEwWfaRc2fEhN8RL/v7DAyZDXzc1+alecLq9ZU7gcA1wfBK9z6U8mC58hptNDjxVCcOYgfn2Ot0Ife1Hq2RP/NvU1RKZZGWMETrfWr+gNRlbmJJUj+HG4eHQk8QiaGyqUbjaPHikgYAiWhrkG9RRZpZ5wjxtn43cmfLdHrOTqyQoiFyfvBw9W4XkvFI/VLahuWnr/ZKvouMHgc+vk6fXcsFldDuqQuwIN/+Ut8poyiJrdOKF0n0nIp9f5Mag27Wy70h+rWcicmMjQzUIpDA==
X-MS-TrafficTypeDiagnostic: SN6PR02MB5232:
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB5232;
	31:XzMCaLJEidNs7VawcKKKyh6GJR5lu471WLPYd9voT5xVk6rF/lr0HpNUvY4QMbr2s5lNg3ZxqlTZqWgume6zux4KICPdRMbQsPNo346jn8u4r+7lOrMDW1/yZ+QWDWY8YyGJg47hK2HEvNgUXGzmwQKCg9pZ8++JSHNF36NMPFcQrErdj9+ZfWyBnAFUVl8zD7g/5UCMxjzK6gPhkYHTvasPrjUk3v2HX7ZncxKKM/0=;
	20:HEaHzsrRP9t2WpRFV71NkFPLhRjaJ8RUxHiks53fBERA+XcOuk346JdODkEVAjiqqXkKn3O1aKp809XmYEsjANgAlv9imfg9g9M6Z03OAKnQAQmr2YMsPodX1enLf3baI0DsDdhvkxqO7c+X4zlOViZSfgOEI9X9jus/j5vcR9lIcZkyd3cXSiNIhnJVMXyigor7Tc6hjLSiHFGmXSZP8/VxGwj0MhHumqXueNb3lPXJ2Z0BCIMFxn3lHqTF4Vhj7e57DA9FPFYNYM71LkOslcGDLnW2dAA0h+nLpfgdgEzjguWTLwfCDeCsN2NjCpb2YC63tjPjkCMvR7O1fwL1grhok3rwrdvrpQvRyu4vyeUBBTLDLuJPx0UeG3WS3+4M9Qlz4jboo9dApnOO9bZSGh7heImtUBz2I1c2WH2xWCOlb0dzZbk+jZyA7oOLIHaN3mIE8Qxxta5rWFYt6HYFcS5Cx3y/lY37mELsYqBD6js7Kmn79JG605jED82ZIBin
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB523270BFA419E8C5274CEC81ABE70@SN6PR02MB5232.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(85827821059158);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(3002001)(93006095)(93004095)(10201501046)(6055026)(149066)(150057)(6041310)(20161123560045)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051);
	SRVR:SN6PR02MB5232; BCL:0; PCL:0; RULEID:; SRVR:SN6PR02MB5232; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB5232;
	4:tiImhWWp7E7Nas2q4rPhr/2yFwwqoaeNuzze9Gp4Bsyep8GZTPrt7RydyPC/RQOE/mim1vsyIdBOcJq3J9HuljoDlHhLubU17iMfcCfoR2OcEQNPIIVjCUk94tENDqAEJk85XP17GHManb3gznga5JrUyuWtQtq+pWcNIN5GSsb2zYwBfFAOvSYBIZ9qQn/iCcuKQZRsA8L/CBRaYooJHMcoB8rn8AUXEsow68B+KD5EJcUuEGs6Q5TxG7NzA06I4oHyMzaw4G9KiiarO+BWlOo5hnMWHyUag2iOWZIl4yuaw1YcEiOyRNJsQr/vM83IfQgPo4iUsJ3NGnM0LA2aCtT2igzKEk040o0SQREYQoU=
X-Forefront-PRVS: 08200063E9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN6PR02MB5232;
	23:bQTSmVOw3IzVDmkqAjvHDq70S0BfYDwg6TWrdpffk?=
	=?us-ascii?Q?hcwPX20BeSlM1tzVgs5bzrmWBg41ox3vXfMQkz+fFlFDC7Kk8/qfKX3lSi/4?=
	=?us-ascii?Q?VlFogOrLoTH9XL3+MHvVPt2pO8OAcqCvtU5OsGVsINCoYpUQX6ngi5C0IQ+r?=
	=?us-ascii?Q?p0Kv7wWgZ1/me5p/rx2jC55eyIHz/jPDlXVCg0rQ2NSlLt9xc6cFwl/N3hyC?=
	=?us-ascii?Q?13a0auKOBKEox444g8Q5c4+IF6rLyuMpBDXIY7q5No6WTv8P5X5OoDGPWdSf?=
	=?us-ascii?Q?FxdR20dgx9pf7Py3vXaKBPACLyCKY1xIvMu4CiegGAfBlENKYSmslI/Pk4YW?=
	=?us-ascii?Q?UuebV47YzeDk7i1rOaUb6akXFeMgpZQsJDqV0126xN/o8embmbU0HEM3PeAK?=
	=?us-ascii?Q?XOUMGzOyI69sYS9ZjHiE+fnpP6LLdwq6yvabEEfpFPIVpa5qpS28eeLnIiwm?=
	=?us-ascii?Q?nj3L3AanPyxwi0Xw8wyzZaXRyE2Nax2vdKyvMuic2TLuJMe5Tu4esTakacYb?=
	=?us-ascii?Q?bgPpEW0QjyIoXAwJ7j3jfb9N+ci3fsHPb1/yv4GVBXjSxmUtaxD3C1osF0TP?=
	=?us-ascii?Q?bigx80fQEA2IPRXCTENtjXGpFPNr+lmzNGL1NO9amyGqapGjo9RjDVOT4UXw?=
	=?us-ascii?Q?ugKSHCEDScW8BNzXR3d1nOkgZ0sgnktlU6kAC1YFMs+VZ3a9QEXfNWmCy3I4?=
	=?us-ascii?Q?SJncyaH80pAA3pVOyExGJryGgSz0UKfDX7lapZ+mUVenx8tRQnYnuZ0eTLDb?=
	=?us-ascii?Q?cKwc2NxMezJHkrHb0qnaqC+ulu2/bVl4Iuo5uddybySt0b+l9VTg8iX7Y2bF?=
	=?us-ascii?Q?/bmZ5D8sv3leAhq0/cPG1goWO1ws/qgZ1/laHScjzor6kgAVvqvRklz/Ni3V?=
	=?us-ascii?Q?TAXJvQr+786N0cTGrvrMdqggT4eg18aeMsQsAob7WJ6rX8ihTKFphctM9z0B?=
	=?us-ascii?Q?MYwM1OyeA7BXofQAfznFwYq1U7YwBBv0Ucy/Di6+O8rpWA6quaXgXA+cnpiw?=
	=?us-ascii?Q?3/caYEdV+ImqvX8o6IY0nWGybI6cBnsptTIbCqaspXdwCbj7D4PuEYzwsU4D?=
	=?us-ascii?Q?sm6WZaykZDvPAU9GHmLrFCAW9R9KndaDzDf1R8jhZ/qqxkXce9X/K8yTYk0s?=
	=?us-ascii?Q?du9+8W7ohR7R9Wj2M1lTgA2glLLyuBrsNJ0C83La+S9WhsuN5fJmBVphHFJ0?=
	=?us-ascii?Q?+gtryi7I7OhG6Ayv/UpoLwH0TEvCxFLRfr4MBoGb1RVWK4AOVSSazpuD+ANV?=
	=?us-ascii?Q?dMql4apUt/icEII8fDCNal8rnai7ZvF+Lw3BYH4X0xkuePdcJaOdun8jDDa0?=
	=?us-ascii?Q?KcWkj1zDuQ0R/PNzeWv4Qg=3D?=
X-Microsoft-Antispam-Message-Info: hsBKDbTktdimByz70pOiJ0fnjoAPkGfATH6qvyKzDIc+I0EJoCsYXVJWJ/vrAfFMdPFLIC6YgNb78Z2+tw00F/L64wui7Y4P5FaeHBXEmS126eDoTd78SKBRg6wanMrMYXJTxQ7l2vlmB6KFJzTcRN/QgR+9HJsU6OHTzUbyyc0RM486Rv9UiG1qJsWNg7uF3ZgXYrFt1uSaWWImb/RZNx/i6aGt/lcZEpu+1MWLnbE6abNVIec5jtTl0txarKq5SrPIS2fasfq5+4ZjtFC/vcQ9VbMMK491c9OOPikXbe/xA48iANWc2OaVHUmbNQaFeHaRbGU1erlv8BLd9rzAcnWPwL/R0UT0TjwZxdspyn0=
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB5232;
	6:0mofkmCfe11QDVaR2zX//UQfHtPwXwocD8o2rMpqTQ9moqgn3/6pudgILPjFJI7f9nMWvDr877kOa3d+7XXdj58dj9PZW4C66yHWWIW8Syon4AyL+2mMNE+aJ+TsPuOiudH/RHCIequ5b7KGR5QxliUsjanvLx2bC1slgedIk9glX8gcvipBVkGNH3CupnnwD587XVYCKT7hoBbsJKiGfXLzrl8EDO3Y8tMBlPM5CCEtO2rmg0edH/nwN3fQ4hSep7o65CxWz4vnvThAmZVkIFR3OZdsfXyzIEXghGRqi02r81dRDeFAuhQfsBc9Uq/8JH3Yrdtl6vbJ0e9zbxatHa3t2+By/1JIe7aiOstMCn9EYLgzdKESy2WEuwO+h42e43zRkAhFEFmyT9XsiySp7oHoALGog4vFM5lgm7oxp+T3PF7vCEpStTe8WX2OPT7nj5A6CvXjLKY3HiiUf9/t+A==;
	5:TANFQp1NmJgBacImSBhkfvM7ojXfHnmjrT1qDQvenQK1ChZgsu3ZvVC1iW+sS7Txcpc2NaEuulA3E31VXDHrFy+7ediP0H18FBaBXa0jX0H7Y2vJB/BssBjIyTtvZmU780sSx4uKf6+Pch77kKLhlxNcdIkXWeaJ/Szu9xYPXGE=;
	7:fqO1xn+z0SydeOgYM/ClDHDnJZRP8Ra5ZVX6nsMCIUL6SjBVTNkOFJ1m2TiuWzhfRHIp/4OiUxdmfqpV+75o4UOvtJ8lSeCwQr3tiyPBgPEpoiQ4htOZg1F4EnKBoWbmwbRvgerhaxS9rMWlvK7D+Q0Sg03485mmFZ0ynkIqfp+TaWruS/ZfDRUj/2M57NJS+w03DjL4S6h9SBB+hPicEwDo3l8kHiS9QChGRWh5imZkazHdamHagt348U6Gpcvz
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2018 13:17:45.7424 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad70984-af42-4eec-e630-08d62de99ab2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5232
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.69
Subject: Re: [Qemu-devel] [PATCH v1 10/12] target/arm: Add the Cortex-A72
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y5M9jb1izRHS

On Tue, Oct 09, 2018 at 10:30:01AM +0100, Peter Maydell wrote:
> On 8 October 2018 at 22:34, Edgar E. Iglesias <edgar.iglesias@xilinx.com> wrote:
> > On Mon, Oct 08, 2018 at 02:10:29PM +0100, Peter Maydell wrote:
> >> On 3 October 2018 at 16:07, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> >> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >> >
> >> > Add the ARM Cortex-A72.
> >> >
> >> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> 
> >> > +    cpu->midr = 0x410fd083;
> >> > +    cpu->revidr = 0x00000000;
> >> > +    cpu->reset_fpsid = 0x41034080;
> >> > +    cpu->mvfr0 = 0x10110222;
> >> > +    cpu->mvfr1 = 0x12111111;
> >> > +    cpu->mvfr2 = 0x00000043;
> >> > +    cpu->ctr = 0x8444c004;
> >> > +    cpu->reset_sctlr = 0x00c50838;
> >>
> >> Do you happen to have the hardware to hand to check what the
> >> top 4 bits of the reset value of SCTLR_ELx are? I think they
> >> should be 0x3 -- the Arm ARM says that [29:28] are RES1 (as
> >> does the A72 TRM, though its top level summary table lists
> >> 0x00c50838 as the reset value for some of the SCTLR_ELx.)
> >>
> >> QEMU may have the wrong value for A53/A57 here too, I suspect.
> >
> > I don't have access to the A72s at the moment but looking at logs
> > it seems to be 0x00c50838 for both the A53 and A72.
> > Looking at "Table 4-118 SCTLR bit assignments" in the A72 TRM,
> > bits [30:28] seem to have been allocated. Bit 30 depends on
> > configuration inputs to the core and [29:28] seem to be hard-coded
> > to zero.
> 
> Ah, this is a 32-bit view vs 64-bit view thing. In 32-bit,
> SCTLR[28] is TRE (TEX remap enable), and SCTLR[29] is AFE
> (access flag enable), and both are resets-to-zero.
> HSCTLR[28] and [29] are both reserved, RES1.
> In 64-bit, SCTLR_EL1[29:28] are RES1 in ARMv8.1 and v8.0, and
> have new meanings assigned in v8.2 and v8.3.
> SCTLR_EL2[29:28] and SCTLR_EL3[29:28] are reserved, RES1.
> 
> For QEMU at the moment we don't deal with this, and so we
> have only the one reset value, cpu->reset_sctlr, which we use
> for both the SCTLR_EL1 and SCTLR_EL3 resets. Our HSCTLR/SCTLR_EL2
> resets to zero, and we don't allow for the 64-bit and 32-bit views
> not necessarily being the same value.

Aha, I see. I'll leave as is then and we can fix the 64 bit stuff later I guess.

Another A72 related thing I wanted to check with you. A month or two ago I was
looking at an issue with Linux running very slowly on our models.
Something that popped up was that Linux was running a couple of spectre related
"workarounds" and "hardening" sequences on the QEMU A72s.

There are a couple of bits in the ID_AARCH64_PFR0 register that
Linux checks before enabling the sequences but I never found any
documentation of them in the specs. Bits 56 and 60.

In Linux these are refered to as:
ID_AA64PFR0_CSV2_SHIFT
ID_AA64PFR0_CSV3_SHIFT

This is what we have in our tree:

    cpu->gic_vprebits = 5;
    define_arm_cp_regs(cpu, cortex_a57_a53_cp_reginfo);

    /* Xilinx FIXUPs.  */
    /* These indicate the BP hardening and KPTI aren't needed.  */
    cpu->id_aa64pfr0 |= (uint64_t)1 << 56; /* BP.  */
    cpu->id_aa64pfr0 |= (uint64_t)1 << 60; /* KPTI.  */
}

Do you know what these are?
Should we be setting these in QEMU?

Cheers,
Edgar
