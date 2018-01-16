Received: by 10.28.173.206 with SMTP id w197csp4574433wme;
        Tue, 16 Jan 2018 15:31:00 -0800 (PST)
X-Google-Smtp-Source: ACJfBovl7mRfDVaQZWkInh4liERgg3Qk8aGx80oarvNATl+zkaT+aFRgS5UXwFONlKbL6PchcM9T
X-Received: by 10.13.214.84 with SMTP id y81mr792603ywd.499.1516145460692;
        Tue, 16 Jan 2018 15:31:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516145460; cv=none;
        d=google.com; s=arc-20160816;
        b=NBQv+x8ZA/1bL0Gl6fCUs/7nq7eEmSmNCBat9aS89fByVd77xQRMgSvDZ9LyehbAND
         7XwlmquMunhiObAMLx6D/1w0BcXZOzfQ2nCOSsiJGhtyQQ51MfK6bSdW+CxkIZokkyJx
         SjoCJSjm0qzOgJBGhrZHnl6iteIqhvWtMKd2nR5XmoOLeMGLNbw079uX4CJht+iEESbr
         6aSzcuHJq9NNsnYNzMKH3SUUCHvT5TiDW/aXtsGUWuH1fc7aY3Z4v4dVFbrf4nujBqLr
         KU+b62UIJhDqTcxwj3hjG17ID6DZoSTMFpYLMAmsRJhRww+ZTEyXJdfcfxMDOAyOfMTm
         Jb0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:to:from:dkim-signature
         :arc-authentication-results;
        bh=QZoWndFWeGN1rUg99N43hPHqmAyyZLXrsqQgLjTfbl0=;
        b=o993J21HFsGmP+BmWDdWttzmeXxIwL0P08+KZeGvMq07dgA5vYaVUHX/kQyhIGnZrd
         X08LllJa2zWXMjaYXENTut6qilFGIFosd9cBFYyRnYLGjaETSMdgHYDyVhd6hKXCqVms
         J9McheiybxPKjxMhVYPxVOj4oHNqcQBrnOOiot/6/r06iNqCH3KkY4CJi426b7GjLtn3
         fXjnC2GfHZ/qrsCOhvUOY5zUlidXpqWYxGOu09YumywhfyumtHbDL5JfWkwranKr9gTz
         v4+sjPzQ3xlzzqTAVdbXBvwRRXocruTJUGI6ZlmSQxfv0hXPQUPkU+uxgO8+oude0Qpi
         akfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=G2SYo6mX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s15si871814ybc.24.2018.01.16.15.31.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 15:31:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=G2SYo6mX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45631 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebah2-0007Zv-4i
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 18:31:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1ebadJ-0004NH-5h
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 18:27:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1ebadG-00027h-VV
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 18:27:09 -0500
Received: from mail-dm3nam03on0604.outbound.protection.outlook.com
	([2a01:111:f400:fe49::604]:25696
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1ebadG-00027U-No; Tue, 16 Jan 2018 18:27:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=QZoWndFWeGN1rUg99N43hPHqmAyyZLXrsqQgLjTfbl0=;
	b=G2SYo6mX/VTz4eF3K/X3YvFmUHCH0ykRDQciZ3rb1dQji4S9vWDKgDJn9uuXBMJ4XpBkb9iIkI2Nj8s041VaiMa16+8UnwKNpwEZvr+438FYFNKXlebYCHLQYLSTICxiG2458633hDH6QZV0+nGgXzdvdLfmnFkI7NhlfFT2dDk=
Received: from SN4PR0201CA0028.namprd02.prod.outlook.com (10.162.76.14) by
	BY2PR02MB1329.namprd02.prod.outlook.com (10.162.79.24) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.407.7; Tue, 16 Jan 2018 23:27:04 +0000
Received: from BL2NAM02FT047.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::204) by SN4PR0201CA0028.outlook.office365.com
	(2603:10b6:803:2e::14) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.407.7 via
	Frontend Transport; Tue, 16 Jan 2018 23:27:03 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT047.mail.protection.outlook.com (10.152.77.9) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.345.12
	via Frontend Transport; Tue, 16 Jan 2018 23:27:02 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:55995
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebadC-0004Nt-80; Tue, 16 Jan 2018 15:27:02 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebadC-0003M3-6N; Tue, 16 Jan 2018 15:27:02 -0800
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w0GNQtUc031055; Tue, 16 Jan 2018 15:26:55 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebad5-0003LP-AN; Tue, 16 Jan 2018 15:26:55 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Tue, 16 Jan 2018 15:22:34 -0800
Message-ID: <bf2241c222a9441e466d5460f81d49ff1e0bba07.1516144891.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1516144891.git.alistair.francis@xilinx.com>
References: <cover.1516144891.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23598.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(376002)(346002)(39860400002)(39380400002)(2980300002)(438002)(199004)(189003)(356003)(5890100001)(36756003)(59450400001)(36386004)(478600001)(110136005)(230783001)(575784001)(77096006)(8936002)(118296001)(81166006)(51416003)(8746002)(2950100002)(76176011)(2201001)(26005)(54906003)(2906002)(50226002)(81156014)(7696005)(63266004)(47776003)(316002)(106002)(5660300001)(9786002)(39060400002)(305945005)(8676002)(4326008)(50466002)(6666003)(106466001)(48376002)(107986001)(5001870100001)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB1329; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT047;
	1:56Z+4M99D1wjhaEyc9x03zwrkwKOadELCMQUSkoJ4l1zf4MCA2Mgn1p9yUwH3jlk1KLds9xJ2iCxW/Ys6XqRCq+zb8Qi76/6xGRbHZevJRzJMkEjnXvZZm5EaEiEuSqZ
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3adcb2f2-e9b7-4123-71ed-08d55d38a623
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:BY2PR02MB1329; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1329;
	3:wRgonysnMYUyBDAn4ve0y4LNlgBsv30C8Lv7O+l2BXEA9E+Fe2egcVXfDmmZveTOQoSRjPcX9vIb9JPLhHNc3l8rq9YF1IFIX9yNwZh5ghxv7FQ2fJZO/j+JyisFHHsEexAepgRE3L9TtPmsL6JReh1fZqANxGLNukmb2+UAHpu2bfW91cDjq9MSyW3LUwI7hXmni4LXmTyS1Icgq1nqCHfLbJv3VqsqjOvBd8eJLBD7SKnTVAmku4xZHA7BHCcyxSWPmGiTME6ByXUo0VIy/LnrM2f6as0cKluxwaiEwnjT8VZDF0ri04I5G1ejpqR/Zg3kp/9BJaCMtyNZ2Ua2gtLX+OpgAvkAaFEDoETTyD0=;
	25:tDCSM6mm59AklybUqHUx6bJLPfsj3eUevijVX7XUUpyhERS53teUbg+tFQHjFLUn8dA0zE5c8dC6XX9Kg1BvvjaNNlE5XNgym3ZZs+ylNsuR+r1fO+GA5Llak/KuQss5bwPGZMToYSxWv99GNN1BE+JVRrm82wx+LCPaM+46G5cfhiU/MiCIjN0Q0IG0GzZDp3qdixOXZS/GyADCvvo+AtembRRawByXcRSbRf/GqbBwI6x/zO6JI9PGtScrEqj/ggyJjf7oAKFa0ecBrLLDHibcZ5vyj2CX7+HZe+cEGGQ9nlSy2FYuFaQpvtrfBO8fIEteNIpx//3czLiIpe4fZLIlRlyW2Z2+w4t9ZYuCQ3k=
X-MS-TrafficTypeDiagnostic: BY2PR02MB1329:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1329;
	31:M3ckgSUpF0Ki/gjirAOXN5GDcIQi/0hoFvfrdfg+Ib2aVHwThTsdaEUgSMC/XVEXaWP5lnufYgMEHtXIyAxIFNyfPdJqBFVf2j9Bp2KWkGx9xZULB8S5LAXPFyAPujuiOvWtMVOiRu6qlX2njIoHIADgXsRbBaOI2czV3Voudp+WtnxQHmSFA7rU9KM4ufoGp/nbBDfsVggNv357G2XmSUpCt7B0YaIl9dl8+FauL00=;
	20:BnhcTQBjiWqz05EaOo1q9oRT5IOzUWYokB2/jXtQYs8MKKIfiK+TkPNdlehPZ9sWq5RKj2ka/zrUPucOF+OtaSb6g/FoLTQHL+OTZmw4BBk5m87xaRpl/HsRWSq8mv7G9QQkufuCuDVVknVitioySe7OpzanB6/gggzjeGNG2a/7118VFPUiZ/vrw37euuyzwRqxLgLdnLvKG3Bm8nI8ah3ZaDHrZU6C+4LOU4cdr0TzH7flVODBBjcc+0j3aDRIl9EEmFsjY/Yj9qJsqVt1jtTFfffk+tUlv/8oce0hzvAOLSoT9v3C8gkMQzOFOuGWpLrKXtvfK/WnYvtClnVK1V+TYhz+DjWnB+UB71gUlHtTAFx7K09D63LUhAyyHdZ0OmdoM4ikLWhv+uUkC/CcqUtZfgsQksS6RnzJq9p1ikMGnea1Hss+zVhSMaTHgyuv4/jLf/8XMDW9DZfG4KNjVL/+piDI9Uou9GxWoEygyvbPQu70x/ocVdrG/FRJboob
Content-Transfer-Encoding: quoted-printable
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BY2PR02MB13294E38FE66C3AC824BCA1ADCEA0@BY2PR02MB1329.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(21532816269658);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(93006095)(93004095)(3002001)(3231023)(2400039)(944501161)(10201501046)(6055026)(6041268)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(6072148)(201708071742011);
	SRVR:BY2PR02MB1329; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:BY2PR02MB1329; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1329;
	4:P8gGgBrJkNg0Ooza2lIVL1ftudUrGJlamD/i1fhs1dQjC2OW6WbUWYD95reqzOtfiRHDNjyqWkw9JB0ztmRVbDXITIzBrR8vuNC//x7LmUT6eSU9B4w9efc/BXCJY74g2GPXhAfPfBYU/peEzBAEKQCcFYQzXLzfy4UVWq8siunRhyVZOuBYvzzzYjgfipvpa09HX7gR75/Uv2owLt2u/COFgamnQboWK1Gl9Pzdlj1nVFpIerQkEq6CXi4TyBF977pzhTg+p0yZr/9OgOO3ZzIU4rBaoRnpCaycFNY9z+8nb5Vm7iBRtJ9kVY+gRz5jvwJtEB8QbNcES4uonSs2DHms2L56Pnew8XSTLUiJdk8=
X-Forefront-PRVS: 0554B1F54F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB1329;
	23:cwC5JKHkWtrei/NmgjPTz5DKClRLCWyI9JZwmyzlP?=
	=?us-ascii?Q?LhktGp2YUCeERc2/dPBt79LaEFYuEUFnOOaP56Pmsl1fCbmFJl8rrjMlFy61?=
	=?us-ascii?Q?sd0h662sAPVJ3YCRrAWsHlaBWYcXM45UIvseJBmlGAQBpVT1UtnXDG1PkY5v?=
	=?us-ascii?Q?thdqkAfQ7s5S5a8fVkRg7++3lSEVbgWypCR5OTaq96pxZJ02WhxCk5xA8bPz?=
	=?us-ascii?Q?fLkfk+jyJqPwWNxQouIKjcl+87xlBmPwB3K+4tXozTJoeop80DpdzkBDqUIU?=
	=?us-ascii?Q?NimoVje7rppputN1v10mfRtYt4424GrPJ+1BOD6OdEqRjw9cfA5+Olg40y//?=
	=?us-ascii?Q?02UUN0DIsfzlOYVM5i1V5GQ4ystK5P/40hIZlAots7ep/Emm+aUDCxdSMZnF?=
	=?us-ascii?Q?FJH1f7qieG4dkGf+q+1gsScqRSc0gkVnA3CGS6bDJghu7QnQlUB8kufu0Evv?=
	=?us-ascii?Q?TFT/NgZv1ZA9rYVguGluHt6FrfcKxXiJX18v9MEDJsDBWYn/tmygtYG5bOBE?=
	=?us-ascii?Q?0tryS11xRlSCtZkw6ndi4g31AX3y/U6i9hp07Ahs0+TXYiABY9feWt0v8zq/?=
	=?us-ascii?Q?1KJu/Af4E5ybA4a8rvfZ9XDvdtcV3KwlSlVRDGMTWqCPShMgQGSO0nBLPOEE?=
	=?us-ascii?Q?xi/CnYgL2S/4G00TOEoA6yi9OPC7UoUpjapDTdfLdlnQaBUzxo+KqDl2e+EW?=
	=?us-ascii?Q?EMWSsmn/82tGf51QKwJ9/zOb/FS6urKAortzHPmR1g+8JZN12t8SLwnGdwLv?=
	=?us-ascii?Q?7kaqNVG+k8CVTMLkeQzWDPPzQX+G+WmtFC51/rBfG1GbGBVYP0O8lhcCv8Lq?=
	=?us-ascii?Q?k/Hj2CnfBY2KYXs3GeG5+Ht0MiwMUQnEWzOYQM0n0saYMn9/QpOwQFdlLgZu?=
	=?us-ascii?Q?kvvTJJZRdVVLP7dnL1ok0VtgBcOej/bJVX8HZNj3kPjyA2Nde6VF7M1SU2rN?=
	=?us-ascii?Q?buG2g0lbYmToaGu0COPiYdlwbw5hO/6bET0dY8tGuh7phA0otCxRvdK/ePFU?=
	=?us-ascii?Q?oeG/YWVY4qLEIJ55jBwqqhyKUDspdrlWtScPkMw7IC7+mfBC/hbOMvE3uyh4?=
	=?us-ascii?Q?VIf4ls8TERYs6qd2jtSqU2bYoRtrwH/opHifNPlLwf2RNovU9ndY/5TiQmIK?=
	=?us-ascii?Q?WLpu3ufGmUPAajlXyEDpm6u9irP6JUa0ApKjbccOMU6+UweWmHqAVw/uJeFy?=
	=?us-ascii?Q?V93Thds41doQ8c=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1329;
	6:LRqBzyi5w4tqK3V7KNWrZTDhPV2ZrSxMBdMRx7a1QODL894ioWaUdAPFqtPfeuA2JCnm7Qu8ePYRRfUC2shttSPNZItR2R0IWg5rHJBixRTbV864dhYyiPfivOO7e/W49xf+h/Ch355RsL4Aj5HH33Y5RRFJ+zzPtp3X6mBOKxnCdZu6dMhyHjNjMWpclhYrYK0e5qxCZlyGQxVhS4C70o29zX3m1eILryPn63/8HXboXjL6eJCQ7JM7A/ujKOVxA3uzXGe4w5W8oo4yY1fxsn4Ne+sr42m68ugsR0b56JYEMBFIlOrINpyg6VEQqyC5FL5VgtTa/4JYAnYX/6TY75xcnvuzly7fpkOGAzrD1OY=;
	5:Ge225HvYo+NvIxL4uXPHoeED0oZh2Zt6im33p3GCZ97MDyYJFvUQyxL+vwm9VHME70CDOzet5zJ/9xjOKAn1BbYUzcXU8bfBqiUg3PXuhigH/9wvDDaiDROik20F6MMYyXGthZwn6hCt553CCx9K+990apZdxm9thjrUu9ZDFNc=;
	24:rPux+lFYtT0Yqv4lE7sOLfwVRawqaf87fcM0oAzkFrPBBqrDSWAohvJWvw3T4GKonwettKDSk5pmcL4KHqcLkUMqN3Baqvq0GtS/nc1e8s0=;
	7:bJmDmw8w05PNR5/anRuNnK3ed/3hcUWAkji4Ezamrlx5AP+WFKqu0nuCIiKzm1iDeq4Un8F1SNLYjhQhZVVTSGAK0oG3Cll1T+Epgho/dAkF+N7gq1E0zqyOh/gvWbS/9ZA/N0Mesip2A5MPF/ge0tK59AZeqpen+ZqmPI3vnSbggJNW0m+C+zCQoyWWE0NK8i20zBybTbpYdIl/nacF3CiOCBD6HJ51k+FYPSIgwoc1wOs+bcg4GeinD61RZF5V
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2018 23:27:02.7810 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3adcb2f2-e9b7-4123-71ed-08d55d38a623
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB1329
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe49::604
Subject: [Qemu-arm] [PATCH v5 6/9] xlnx-zynqmp-pmu: Connect the PMU
 interrupt controller
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
X-TUID: d6OM2uo6TBti

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---

 hw/microblaze/xlnx-zynqmp-pmu.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pm=
u.c
index c6a0b3b8a1..828eeedc9f 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -24,6 +24,8 @@
 #include "cpu.h"
 #include "boot.h"

+#include "hw/intc/xlnx-pmu-iomod-intc.h"
+
 /* Define the PMU device */

 #define TYPE_XLNX_ZYNQMP_PMU_SOC "xlnx,zynqmp-pmu-soc"
@@ -34,14 +36,18 @@
 #define XLNX_ZYNQMP_PMU_ROM_ADDR    0xFFD00000
 #define XLNX_ZYNQMP_PMU_RAM_ADDR    0xFFDC0000

+#define XLNX_ZYNQMP_PMU_INTC_ADDR   0xFFD40000
+
 typedef struct XlnxZynqMPPMUSoCState {
     /*< private >*/
     DeviceState parent_obj;

     /*< public >*/
     MicroBlazeCPU cpu;
+    XlnxPMUIOIntc intc;
 }  XlnxZynqMPPMUSoCState;

+
 static void xlnx_zynqmp_pmu_soc_init(Object *obj)
 {
     XlnxZynqMPPMUSoCState *s =3D XLNX_ZYNQMP_PMU_SOC(obj);
@@ -50,6 +56,9 @@ static void xlnx_zynqmp_pmu_soc_init(Object *obj)
                       TYPE_MICROBLAZE_CPU);
     object_property_add_child(obj, "pmu-cpu", OBJECT(&s->cpu),
                               &error_abort);
+
+    object_initialize(&s->intc, sizeof(s->intc), TYPE_XLNX_PMU_IO_INTC);
+    qdev_set_parent_bus(DEVICE(&s->intc), sysbus_get_default());
 }

 static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
@@ -80,6 +89,21 @@ static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev=
, Error **errp)
         error_propagate(errp, err);
         return;
     }
+
+    object_property_set_uint(OBJECT(&s->intc), 0x10, "intc-intr-size",
+                             &error_abort);
+    object_property_set_uint(OBJECT(&s->intc), 0x0, "intc-level-edge",
+                             &error_abort);
+    object_property_set_uint(OBJECT(&s->intc), 0xffff, "intc-positive",
+                             &error_abort);
+    object_property_set_bool(OBJECT(&s->intc), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->intc), 0, XLNX_ZYNQMP_PMU_INTC_ADDR=
);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->intc), 0,
+                       qdev_get_gpio_in(DEVICE(&s->cpu), MB_CPU_IRQ));
 }

 static void xlnx_zynqmp_pmu_soc_class_init(ObjectClass *oc, void *data)
--
2.14.1

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
