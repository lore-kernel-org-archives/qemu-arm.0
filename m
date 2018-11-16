Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp187638wrw;
        Fri, 16 Nov 2018 02:09:54 -0800 (PST)
X-Google-Smtp-Source: AJdET5fpN8gAShIFob0QBtVJ1cLA4oyD/pxq/wbefI63QImn/z1wJSgdeOsnnmWEqJiznkMuphSO
X-Received: by 2002:a0c:edcb:: with SMTP id i11mr9529403qvr.95.1542362994820;
        Fri, 16 Nov 2018 02:09:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542362994; cv=none;
        d=google.com; s=arc-20160816;
        b=FPLY1BYtgJGsLshKCLEjGpbkx0xB2i9ISZCzOsjN3nfx6dLxl9JSwZpbJBu4oMqKVq
         M7+wImesNlgSwXjCXNRz0iL5UjGDdDABYRk3Le+xX5vcDTDLWrXOAoHXL4uvKlHTXaJt
         CjvyuMYBY0RmvX86wXHHVh9AEs6puzSqyGTndDZmelOtqHrSTk190WTVLVwvgkTKuqUL
         QyGsVtkZa3v1Q63vALryggtbnDv7GdLUKMpBC4qoQct6nC2k00U2QnTrsCkiwQt9lt/K
         vZNo3jdq3OOmb+EYejf1wo9PQVG5IrkvWjZzTdF44OWascIeqOrN5b0sQYq1dBPkbikQ
         gl6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:dkim-signature;
        bh=ldRiwFXlG4BOyzkSBo5sUM1Fp6Nmo2xDB0mHFRZekQw=;
        b=PHlxi/OZnL1BAZ1R9LzxpTdYzvotNLNvFcZQzpuvQkyWoRJvHM6p7fpgCbSOWjwrV8
         lMb4XnIjlEuol9oQzXWj/t0jo1W0mxNINKK/Ovi67NOFglCoSf9jJI9PwTxrJm0acToZ
         qf8UE12/TusXrMQY0LUKQaRYMIy/10I+f9ZWcJS7J5U6dUI7bT+tPZTvSJKIayyg9ryY
         +XTYLqgGyIu5k1RkIYMXB6CXDYhVth9Vk/00nsP3GBSJpc2s4re1K+eCZs/6ssM68njI
         oEkZZ5+ZkGGqI+juMVZCXXXkibP/mznhYXN3t2+uJEWNKd1xWoU0LL8V7mSLnNcReqCj
         vxxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=RPAcTJxN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o1si2336427qvm.82.2018.11.16.02.09.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 02:09:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=RPAcTJxN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43776 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNb4U-0005R9-7s
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 05:09:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gNb4I-0005PH-0S
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 05:09:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gNb4C-0002rh-Tm
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 05:09:42 -0500
Received: from mail-co1nam05on060d.outbound.protection.outlook.com
	([2a01:111:f400:fe50::60d]:10558
	helo=NAM05-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1gNb4B-0002mi-26; Fri, 16 Nov 2018 05:09:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ksqkb6MafoorEzLm1lJjbC+V7LaUHYytuV3zS0G4O9g=;
	b=RPAcTJxNAQqhskYsmIUE4XGFdMVKBiZRBfGJO3BMpWRrCj63ibW2NHvS4OF4/1Xaz02xw+h1vgPAqcKdUywytk7OYXeAqA3JkD5TItb5MpMWBNrMHvDgUV1GzLO+WNtnu5RvgU6aYYI356XWl2TFp6zYsE3sPo+PWVBZdRzOeII=
Received: from SN6PR02CA0013.namprd02.prod.outlook.com (2603:10b6:805:a2::26)
	by MWHPR0201MB3515.namprd02.prod.outlook.com (2603:10b6:301:77::12)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1339.21;
	Fri, 16 Nov 2018 10:09:21 +0000
Received: from SN1NAM02FT012.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::206) by SN6PR02CA0013.outlook.office365.com
	(2603:10b6:805:a2::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1294.25 via
	Frontend Transport; Fri, 16 Nov 2018 10:09:20 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT012.mail.protection.outlook.com (10.152.72.95) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1339.15
	via Frontend Transport; Fri, 16 Nov 2018 10:09:20 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNb3v-00009j-Jr; Fri, 16 Nov 2018 02:09:19 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNb3q-00064O-Gg; Fri, 16 Nov 2018 02:09:14 -0800
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wAGA95D7001823; Fri, 16 Nov 2018 02:09:05 -0800
Received: from [10.23.116.79] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNb3h-00061i-4x; Fri, 16 Nov 2018 02:09:05 -0800
Date: Fri, 16 Nov 2018 11:09:04 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Luc Michel <luc.michel@greensocs.com>
Message-ID: <20181116100904.GS7447@toto>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
	<20181115094207.22846-10-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181115094207.22846-10-luc.michel@greensocs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(39860400002)(346002)(376002)(136003)(396003)(2980300002)(438002)(199004)(189003)(229853002)(9686003)(2870700001)(77096007)(26005)(186003)(81166006)(76176011)(81156014)(305945005)(8936002)(33656002)(478600001)(33716001)(9786002)(356004)(8676002)(50466002)(6916009)(36386004)(47776003)(106002)(5660300001)(14444005)(1076002)(54906003)(6246003)(316002)(2906002)(336012)(446003)(58126008)(23756003)(5024004)(63266004)(426003)(106466001)(11346002)(476003)(486006)(4326008)(126002)(18370500001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0201MB3515;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT012;
	1:GcAsOCl0nCh0NM5+2vt/fSsMmqREKn5OEJQKghK9CIsI8O2pjEY5SfXSPzuo7bmecnIFlsgnAb+nyDyRBp7mqKheoM+e+YiP4pyww2nnQULzucLF6bE/v2IiOxKSlb8z
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4f219b1-6994-40de-0412-08d64bab9387
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4608076)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
	SRVR:MWHPR0201MB3515; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0201MB3515;
	3:J1IBKYaGjAZCNX1RecCSxjRZHfeNd1sTNdYJwKeK47lsj22umtQlmiCKYPnaN12w1YV4oxE+JnCBm26cA7xk43mP6h5EMapRpMpdCNYXRDM8ioMXOQ5NvmMTJTwmxdsBkpZbcTU+U4opeQZ2nFQcy52u8FIspedJMpbg8cVcnYm84C0JOGxo/eP4KGb+pE4HNzLmHM5LmO9beJqZB+/FDeAzDPOAlLwkTekq7dg56fHBRIc8hbulFDnEe7iK3HGLccC5v7IIBKpF39n62zrT8fDCp6U0/UnERxmgTkX9TNDLTOMeIATzJRx+MU/QN6hsnCZWLd6N/+Wl4GYQnvTSTby2uXlqfAu0oLiDGyxR6e4=;
	25:4aNezaOCfRV/aEV2pM7JRi+JDOp1FW5nUgS4XTFmZKV+YWEK8QTJZs8dchBJxG6nPbqKvn08Ipa/i5Qy+Q7xdJBr/Vi5MOmkNPHarFQ0SqZz1WDfofIo7OLubiFcC4JYBgZwTjoSrHRABfdx4NkyyYhAdRDBI+Ww4qx3axFpHqXppDlqn/cNwOH3MlIKbe8h7vl+41XytzzkOGKbKyZdqyFTd3uZ3sJqGF19e4BJFGiOLWR+p9UEy4uub1RHOsTXmUU3/X2YUrbQKZhRRfu6DpR7HnGqvMsQB9FvsSnLwkaOxmNhJZdnbXk9HfE4o1ZxJppirv31PHpc+8PvMhl2+g==
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3515:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0201MB3515;
	31:64Kq6S9CWmv+ECa01lp8PFYOKPJjlFq3NwLlXxxKtcZ3/z/HVjal4jOSb+CeZiRwKiFSR/aq9JHsLU3ICS0EyYwUUrB7Q0NMLnDZLWZTgEKow+GQmkanxaXoulisrMMGtG4eijLfOcGo/f1VQlfvmzIWbIFe4k2n+eA/iw/KWSMPHK4ociCj2doTrW367RpZCGFj5nG1NQFnt+ftfD9AJ8XAdn61t1PC5NyEWbb1wBI=;
	20:4++r3jiZRMVgZiUQNxwt4IW+kgc9lSZaGIgu2pY2LPZq1g7aDk2Q6ODJ7yqItAuTYHZi58Bm7jVvGztipju5AqTejD3yGz0pkfoQkkVF/sE2d4hK4XcAq3ZCld2h6TpvnljIF/U8E+39QAO1WImUHIhpMG6rpQfAT9BepMHg7lanwBYiQVSSiWYWb6EaFyJvYdoljzXjWPPt5tczgZBnN/4kQl0PVnUV7twK0h50MoP9ZF8wMLAdpbXt8dKZLlzHuWjekLxok4bj0jnqQy+Gtdi8pVfDyeH10ina1+mSdoAmaXV77jE5g+dAcYw4BkpF2JLv2ofhTmk5trBXV5F0ZdIKnkoaElHuSxxS9mU3I10GUVZfS2zNI7sr/LrXblUAzfJVhCkq86vTUxb3CkcqgIblGrP5qEhifmlokHHgVBTxNQ6NqtsfMO14XCszHcpyDGdsgcL3fTL9HlezzJh3bMCtYB0YFBmAc7JUoXSZDarb6yx7/VklkP4BMJ9IJo5S
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <MWHPR0201MB351570C3BF8E91723250B95BABDD0@MWHPR0201MB3515.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231415)(944501410)(52105112)(93006095)(93004095)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR0201MB3515; BCL:0; PCL:0; RULEID:;
	SRVR:MWHPR0201MB3515; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0201MB3515;
	4:QxV/INH51Hb0s7AxbP8nWkqykCpRjaGeDhFq8wbLZCjTVa4MOTvPyY2rmkjaCTAuzJCLKZ2GED/EMNtlWa3ZOVVwlA2BHa3pChLDc63vvHZNnTPgdXQvZdVzl36fR+3QVDnOF27HtpbssEV8rpGTR8BysW/8snCt4PCu1sqk0QJ586fVnblIjzWD3HiJkOtbgOaAdI0sw+t3sTnqqc/T2e5RPT9mqrRH6l4zMl/Sjl3MsWCHvbqk6yFCkTJhSPi1oleJcvNFg0H7mZhkUBHl6w==
X-Forefront-PRVS: 0858FF8026
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR0201MB3515;
	23:Q/A8kl+GQWj3Li+uDMtKizoRmuURGLI1zS5itSk?=
	=?us-ascii?Q?9QV8rruDEydYDxifAadUJw/fiy1EyRoVUPYbJuMMVURPanyyLbOK99kndbBQ?=
	=?us-ascii?Q?cYaSwC2T09UwiHD26CPWn0PPbgaPvgBYuU5uyvhRz7KWcFG2Qsv6ceApYNNl?=
	=?us-ascii?Q?NF/QWCTuVyPoknwF9Aw75cNujqt1kxBfbjLMoZycoP3Ykhps0HRWRk7aY5e4?=
	=?us-ascii?Q?bejXMbchiNN5KYOW+punYwcdxlXDilA/NW1O01vSZBjxvlMhBWB/6GQF421j?=
	=?us-ascii?Q?YHKrkPYk/ZYcc+voaqm2DYyv+R7Sy7b2NBfqrWG2fc5qxfWcGNQW4P4Opxfp?=
	=?us-ascii?Q?gPsFHNJyg2QAlAvlWrEZt94lN7nQMWlY1rbB3dtlwMlwRhR2eFcxjmicriMl?=
	=?us-ascii?Q?KWcaEPz4+CMTR1OgINPzru9aBSEjkmOLj02D7qEntl3PjuzQLnmUB/gVISa8?=
	=?us-ascii?Q?n+3L6Pi6n/Pl/zm1pOG1snrNG2XrggwE2vLxmvIYOkUi7mqi14qnk308dy/+?=
	=?us-ascii?Q?lNRcEvElFr9+9cwJ6Ut5ptP+goAjHYkGsXGZA6W2GeFR//DEa5aFf1f/amjP?=
	=?us-ascii?Q?i0CI6RvNCzggGEs/j7VkYPEU2CjHt8RBNyXgoXBlaSx1pm1/C+VkB9zcWZmC?=
	=?us-ascii?Q?0ekvLz3b0xVgNXlRxcGRjGIIeuI3fxscevBFP3M41Yfi1Gu3F7LmMPe0tBdE?=
	=?us-ascii?Q?jWfdRTMFnGot0rBkYC/U51fvrgwQVT5ywo0aLhUkMf1NB15zw8SY8czPna+d?=
	=?us-ascii?Q?dX8T/CY70rFo4wJ0shkG7ah2p9Rhje7rSvTuy9wLx9widve5bcxFTxwVplRn?=
	=?us-ascii?Q?4oF8kNsbd9+hbnsYSYceQBTkqT7n38lF8FoS+CPOs+QKw6/s0bDlPP7kczM0?=
	=?us-ascii?Q?oBn+SLOy/iLoE3vxRgQed7J8URP1wXCVRJruuoCHJQFGdubusTR1EYd9fEnk?=
	=?us-ascii?Q?h8GdOifoHfxqFv9bbl0ceNsIJIw/O3eBX1n7XoscsQWjIiQmdYkJg7WugOva?=
	=?us-ascii?Q?1H8ZSHmjIyajqzjhXsKRgmDWNVjYMzBupg3O2CCS8ngLl4J1OAUemvvJ0u9w?=
	=?us-ascii?Q?RWOxEAdOCGD8TSXcHYzBN4lUD0kf4y9CjVeeWxy7Dm0ZP7DQDdLNiwoMpHpY?=
	=?us-ascii?Q?AIC5JCzS10aA7eHLc/N1MhqrHJZmpDQfQwrCRW5wcuRSJ7XQrRZs4IY6vKuP?=
	=?us-ascii?Q?r33tJAx3RUEMEtOs=3D?=
X-Microsoft-Antispam-Message-Info: ERnTWJBMAbUevGZlECBTyIMVojQ2zzpe0cqnlgBLfezGfwK3/kLa5RjWFbP6/noPwNsahFudUgXWemn+T5E/ONM1g2kLzN5tFLAUIXDyrF/5tWpdZS8QKBLrjHvjVYaR1OepZ1vetxZJIhBbuiRyZMJicSdTNrjICsvNqtg+ofWn571CwPO1RRGexUEqlbJ6NqDCfE69nQap38qof241kRlBcH3061/QDho8I4W/nNNgoqQTJlhGn4iXUkzyPpzfpi78jtzkwfY61WBquledabDRMBEAE03H7DTA1Lrbr+AJu/X+TcVnrFfbxU5pNMVUNHVbBhTq/gSobgdszK5YhjBTJUWQDEjRpgZ02cVDvrY=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0201MB3515;
	6:hyTlpozUTH7EdI5e5UMvKSUjC4TAhhDguyRTk0LTx0xhTg59ZbgSh3zj7/yVgDkrDEZHjWBywH4b7lAJdYjVwKlaOgDZAKvGVTXuP8J5tUD4A7lw22sjDuhtctKhmi50lW7okGF4eBGh+oa1nwdKpOvuWFveDi6iBjHmu9HxjF8RtgcwaEQlyabx/P1KgKAUyr71oBHK4Y/5foULASGCAuEfrVih7U3fMCh3iabu+DEbjW2ictK8+P1p0xTGbqWxgXno8OyuyxVBewxEzSzG2Ur4cfl4RYxMBJBohx2IcS3khpYNfW9Pu9mU5HM8+Uuk834zYnNCnInYOG89KfTC2U/Y6PrGjv3cpnVSHw16AndRCpmBbsrn6fpkQd15HOq3pXO7qDy9u2urd/0whvL+vg0e5+cN5sKdLLhB8XCqv+HdUstPVzjooLNZ8zClg4VzY4vgbbdHOk+uCgRzkzho4Q==;
	5:cVnjJT7Mc4N6y4HJO+OpgjYjRA2gfEZdgKh2+fVDDTQHPk6s9GOcN3oONmcVdkqiDqIfWwUUKjzKPC9OILo8lAx1/mjLgLZGDID7qwnOHtT0qwg08kHlOttdG6fw4QjwITYUV35PE/m3OaYIfb+MyQt2oqI3KYxwTimoOPYKNBQ=;
	7:pPO2uA6A8L2WwgNn/e1dsVXMYg+u11tOJ5j0PuR+R0VEGwmuQix4funO55PyEkG3pj/aFbmdDBDRYDM+QUslUQGZWRSeYFDuCmrVJ3cWvivBe0FtmPu6O6OJXiUcVAfPXp57TWytTWUTzFGzZVOXow==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2018 10:09:20.2500 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f219b1-6994-40de-0412-08d64bab9387
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3515
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe50::60d
Subject: Re: [Qemu-arm] [PATCH v6 09/16] gdbstub: add multiprocess support
 to gdb_vm_state_change()
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
X-TUID: IFWO1UOEf+zi

On Thu, Nov 15, 2018 at 10:42:00AM +0100, Luc Michel wrote:
> Add support for multiprocess extension in gdb_vm_state_change()
> function.
>=20
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  gdbstub.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/gdbstub.c b/gdbstub.c
> index 4cbc81ae5b..5df9929f92 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1713,10 +1713,11 @@ void gdb_set_stop_cpu(CPUState *cpu)
>  static void gdb_vm_state_change(void *opaque, int running, RunState stat=
e)
>  {
>      GDBState *s =3D gdbserver_state;
>      CPUState *cpu =3D s->c_cpu;
>      char buf[256];
> +    char thread_id[16];
>      const char *type;
>      int ret;
> =20
>      if (running || s->state =3D=3D RS_INACTIVE) {
>          return;
> @@ -1724,10 +1725,18 @@ static void gdb_vm_state_change(void *opaque, int=
 running, RunState state)
>      /* Is there a GDB syscall waiting to be sent?  */
>      if (s->current_syscall_cb) {
>          put_packet(s, s->syscall_buf);
>          return;
>      }
> +
> +    if (cpu =3D=3D NULL) {
> +        /* No process attached */
> +        return;
> +    }
> +
> +    gdb_fmt_thread_id(s, cpu, thread_id, sizeof(thread_id));
> +
>      switch (state) {
>      case RUN_STATE_DEBUG:
>          if (cpu->watchpoint_hit) {
>              switch (cpu->watchpoint_hit->flags & BP_MEM_ACCESS) {
>              case BP_MEM_READ:
> @@ -1741,12 +1750,12 @@ static void gdb_vm_state_change(void *opaque, int=
 running, RunState state)
>                  break;
>              }
>              trace_gdbstub_hit_watchpoint(type, cpu_gdb_index(cpu),
>                      (target_ulong)cpu->watchpoint_hit->vaddr);
>              snprintf(buf, sizeof(buf),
> -                     "T%02xthread:%02x;%swatch:" TARGET_FMT_lx ";",
> -                     GDB_SIGNAL_TRAP, cpu_gdb_index(cpu), type,
> +                     "T%02xthread:%s;%swatch:" TARGET_FMT_lx ";",
> +                     GDB_SIGNAL_TRAP, thread_id, type,
>                       (target_ulong)cpu->watchpoint_hit->vaddr);
>              cpu->watchpoint_hit =3D NULL;
>              goto send_packet;
>          } else {
>              trace_gdbstub_hit_break();
> @@ -1784,11 +1793,11 @@ static void gdb_vm_state_change(void *opaque, int=
 running, RunState state)
>          trace_gdbstub_hit_unknown(state);
>          ret =3D GDB_SIGNAL_UNKNOWN;
>          break;
>      }
>      gdb_set_stop_cpu(cpu);
> -    snprintf(buf, sizeof(buf), "T%02xthread:%02x;", ret, cpu_gdb_index(c=
pu));
> +    snprintf(buf, sizeof(buf), "T%02xthread:%s;", ret, thread_id);
> =20
>  send_packet:
>      put_packet(s, buf);
> =20
>      /* disable single step if it was enabled */
> --=20
> 2.19.1
>=20
