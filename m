Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2102125wro;
        Fri, 2 Nov 2018 06:20:18 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cvvZlFP5GcS16xSkAjS7tvVbQi7A2/IAXJCyXsd6jsRMKfpGAGrHXuOu6qBGrM+NK51xut
X-Received: by 2002:a0c:8322:: with SMTP id j31mr10918968qva.56.1541164818746;
        Fri, 02 Nov 2018 06:20:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541164818; cv=none;
        d=google.com; s=arc-20160816;
        b=FRWxwHa1X1X9gzredSFQ9hmtDcZHx1crd3oj4xtLXU2HEtA1etM0oNsuriCgfV17uI
         6ih3hwcMXbWCz/sG4uNSG2183r9NLI2IM8nYwJOluS+kRqJ9/FZjpMDgtmkod7kq1nQ/
         M6bEfG8lE0Ovu7FtF1pCZF53mnRWbyxXFIQMkojeNtysmc5WbIWDCmNCzRJuMCIXyjAk
         QZi6OcIv18/ylqPZGlG13EZ3OMdyk2nvDWjp8rK1MXRVKycLttKIRx18vwv9t6N9BcEg
         IAiziqMp2JRLm24ZZaKO0ysIRMIWfdDCfKSvDOhvic8h4hb7A7bYI/5Ya/anCdV5gSD7
         PoBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature;
        bh=Z2myz22V4wIDSIY+XRzH2uFX58T4j0CLATkQ93bUhVs=;
        b=HXQ0wC2JpYQs1VxhUog8tpUzG+pGX2M0IX4fTv0F4o/V0S5gAlwavV5tM+OPjYhlhF
         4iv3p6LQ8f4LDJSsuNw/kROa8C4iKH6Goj32qWW9Y4zM4Ci28+o6XQLRcEw8/g3D8KNE
         El5nm/HFbkRr+jqqamn3BkaEBHqEBVHS+hbpApungDhRE1muFFYKZZmMzrG/g3081wda
         7Y5QWrtpiWOUq5lqNkmCJdeZ4V184pgCNyoXxLDAS2D/GKhF4BgcEnDPxgj7BRKGle7t
         LDbj0cv5pGVlJ/zH0o2/CUAMTOOplUiXgaKIf302YbgGyS5LKJ8J2DGT0XLQc4GI9q8e
         nrjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b="KOBT45/o";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i9-v6si11751418qtb.238.2018.11.02.06.20.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 06:20:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b="KOBT45/o";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51650 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIZN4-0000Pq-5n
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 09:20:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gIZMf-0000PG-Oh
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 09:20:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gIZMW-0002p4-Ex
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 09:19:51 -0400
Received: from mail-dm3nam03on0072.outbound.protection.outlook.com
	([104.47.41.72]:21108
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1gIZMU-0002lq-Ur; Fri, 02 Nov 2018 09:19:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Z2myz22V4wIDSIY+XRzH2uFX58T4j0CLATkQ93bUhVs=;
	b=KOBT45/oCUxd5cEhaAKVnZrjB3nCamrXzoAFQjNLJj0jHI2RKjLQmzmx6jRKf5qCRHYAcZcCvHY3oM0T8xXo2BPIGU4Cc9LZO75sVAPvxllwiH54e3XiT/YfuJ1LC4Yw6rLZXJ/+G3rbXVO/IFbmwnfBIOIEB4VlrWICEV84fEQ=
Received: from BL0PR02CA0013.namprd02.prod.outlook.com (2603:10b6:207:3c::26)
	by DM5PR0201MB3511.namprd02.prod.outlook.com (2603:10b6:4:77::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1294.23;
	Fri, 2 Nov 2018 13:19:40 +0000
Received: from SN1NAM02FT050.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::204) by BL0PR02CA0013.outlook.office365.com
	(2603:10b6:207:3c::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1250.30 via
	Frontend Transport; Fri, 2 Nov 2018 13:19:39 +0000
Authentication-Results: spf=temperror (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
	header.d=none; kernel.org;
	dmarc=temperror action=none header.from=xilinx.com; 
Received-SPF: TempError (protection.outlook.com: error in processing during
	lookup of xilinx.com: DNS Timeout)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT050.mail.protection.outlook.com (10.152.72.128) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1294.14
	via Frontend Transport; Fri, 2 Nov 2018 13:19:37 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gIZMP-0004nm-I1; Fri, 02 Nov 2018 06:19:37 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gIZMK-0007dW-D3; Fri, 02 Nov 2018 06:19:32 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wA2DJTGM021870; Fri, 2 Nov 2018 06:19:29 -0700
Received: from [10.71.119.87] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gIZMF-0007bx-Bf; Fri, 02 Nov 2018 06:19:29 -0700
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Fri, 2 Nov 2018 14:19:13 +0100
Message-ID: <20181102131913.1535-3-edgar.iglesias@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181102131913.1535-1-edgar.iglesias@xilinx.com>
References: <20181102131913.1535-1-edgar.iglesias@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(376002)(39850400004)(396003)(346002)(2980300002)(189003)(199004)(63370400001)(63350400001)(39060400002)(36756003)(305945005)(106002)(336012)(426003)(4326008)(77096007)(26005)(14444005)(2906002)(476003)(51416003)(7696005)(107886003)(2616005)(126002)(486006)(11346002)(5024004)(1076002)(446003)(48376002)(50466002)(356004)(6666004)(110136005)(54906003)(106466001)(16586007)(36386004)(50226002)(5660300001)(316002)(63266004)(9786002)(4744004)(76176011)(186003)(478600001)(47776003)(81166006)(81156014)(8676002)(8936002)(2004002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0201MB3511;
	H:xsj-pvapsmtpgw01; FPR:; SPF:TempError; LANG:en;
	PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT050;
	1:EHurqmo57UFPQsyuY+PlQN36dz+fOIVOyqvBGAlj890q4o5Ix/2lqVjurni1JOLwYSTwmffxuaMFjsgvS4QnyiJSCWZfu/DCEENoaZTEwCtBx7eIxBX5bW50s2zeVjH1
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f562f2a6-f8f7-48b7-dd3f-08d640c5d755
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
	SRVR:DM5PR0201MB3511; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3511;
	3:18oHCoc0Azt8ygtu8rRz0WEPLn6D5+uLJCGNQcsa6MtglBDVsfNJLBfhTuJTIXC6ZM12rMKxPqRKFp/FKsO+kmXmeRzz2Oq2x+FgDka71WKmp69Eg83CN+SQLIaS1XRhq8FT9jBsyyBIC3fxV82RPUd1bKmc7KJ5a74YzSDhIM8CCcsYfpKyzax3+f5PVX2OjPWd4mtP/t/idzBzfoGILOqpBaGB8r6JvkFuXSQTIkP4aABbheTmAaDx1fpz48QTSxTn474ISXzmp09f+nYRJirECwExiA8QbZrhd5xByv2dGAOPskDnatGlGsu4bojEym+Qf6wYf3TNmtUvPpJQ3epcV6sJKRllkMiFGXAfGio=;
	25:uvS4YwdPoTzfw2MNc24OGWo8zO52ak1A/1r1Fg+oLgT6mO12DM7nC28QNGMLzq5hYFsL02FVGVp4yMwRvyOybkStyEP5MqsAjD6hdFqzanQV0Gk4ROXVSwssjhxJ/O6se8fzOaLX+ltrzegrSAz86/9PnxzvwEapel7IGeqXHHt9miiq20ETD94HDzXyXSv2wZNlohY0W9TRZsRiqPa1dpQrUbtzje0lZusfL+d6+/M/3guCKB4lt05+6R0aXB5zk3StGv29rAnIc4FS+YpuDpoeVJ+MLa/IWn4/MOBqUz/hjRlLF19rSEl6++w+HwDcsXUgXmKgSmpsCvizkcJe+A==
X-MS-TrafficTypeDiagnostic: DM5PR0201MB3511:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3511;
	31:2vKgS3AttlZkPawQKp6gFx0vxUCruQrCDYo+J6jJHM6YRxfuh3x/TiiwRamgjsukMJaFW1Acbd5D4ZNLJtqLt8p/m5MSgU5L6CcfOhAev7E3YS5/YoZNUBmVAFdk8MYJFMdxw4ggLGxdA4WKCCl8tyF3xXWZk8ZoeMIpDz9m7ToF0Y7Ld5jfSL3oetpq+8Vh7H2qWYs1hwuBR5A9A578I7GUYy3z7Gbf3yjxUkwlaxY=;
	20:9ETxdQjNd/uUh8FDOrBthsWQSHQcOQgDXfK4HDkfxcDQ2WEi7WN4uVLW0w0LIjL4ErJLldD+BrFXGLongTzIs7iOgD7WXKcRqmDIGbFPExiPG3eQUtW1rlqNq5w75GaGG6j2od0WejrRMsZcW8kPg/lcgew8RGjtsVmNPTEDWZkfk8L9k5xSeyQj6G3H1No9lUjNr9KeYbR1+37n6HIdQNfRz1AFG0oq6guxWwQQsk8ITDXh8JrsW2szu8/FOWmxHrO3ns1oaLR+zDGvtt4MzHDpQ99ngjJP/g/wEHFWqsrBiZGd/RF7GQSZ+aYFdKave8Mr43ujXJHOTVa/jcI8FRxqO2SdrYHePxIkKWDydKAzhRc9Mz7tjswuI3fJucGji60VlWlJgw5z5zX/Vp9iirgY3JE3ycnfP1jdnun4gbKyB4Me1Q7mlyOduKjCUHPO4QEVfMw68rxW03U1O5q+oHofPGwuVH4cQ/7uN0wZRZ9a+c4/gDXaTdVWjbPQuwzK
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM5PR0201MB3511B02CEA40CE89CDDB0991ABCF0@DM5PR0201MB3511.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231382)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123562045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:DM5PR0201MB3511; BCL:0; PCL:0; RULEID:;
	SRVR:DM5PR0201MB3511; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3511;
	4:7mBpKLogiaj+wLpWswJksfxNz/yVDXig3HPScSe2E2kJiDUrkwH7wIRNvkk45MD1h9NFbxlOPo8lPYixFsof7JIjua7hPPLpkXOZ0/aQ/0RpLIK+RVIhY9Hzyg7nn+Y5ZzrvYDwaDm4oLBdh97tMTXqsBYgtG7JLlxYTF3gNolzau7F7QqNviaaj8s726uYP+0Z0+OwhCaL+DAO9LqvWn9+4t2om1/bN/NZmQfNNqrcuP716ZektlTUSJiGcaHTkYzL5MO6/8baeEJEJSsrakah/4fhQufThiMrIJ0I74H0pXTEerHbTf9Uk2MTTzXLQ
X-Forefront-PRVS: 08444C7C87
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR0201MB3511;
	23:fc/VwepsT5uMEpo59o8Sjo346I7d7TbzqhHYAeW?=
	=?us-ascii?Q?pIHkHpMREudL75WsEKvToQN01PeJXkmLH3JxSH5g7xHOcxlwXitX51mX/9Rk?=
	=?us-ascii?Q?h0t0AA8KfJEwu6Sa5HNBT9CJJG/nEOsSG3OzJRt0Wggr/kfN4OlEiJx/llC0?=
	=?us-ascii?Q?PkKsbC1+iLBsuHZeaJNqJ9JzOlm9RJDATR5bzcFQc0gOSHvadxITqNbIM2lC?=
	=?us-ascii?Q?fnKj95CEgjRNiAxHBo05WnoBgQJNHCQbk6FziVgfmZKl2oKgQ0lRMf2iWMbS?=
	=?us-ascii?Q?/l4QOW4K9zIzDG5gzcIy++jO2pWbtWQRt1xtjly5y5pf1qONl09S39XLDhv0?=
	=?us-ascii?Q?ZudMxXV2mhDmYrX8GTlvuYay44jWa38lNubo2WtcH5untfX+jGbm0dYgnBKI?=
	=?us-ascii?Q?mVLNqkSHWTFdIdBEFQtM1XItdroqZbc2HOkbyTPSUZazs3vWWd4u33DmHn0J?=
	=?us-ascii?Q?DncPxsLHE+gR2Yrvv4AcpgH/Ep9c0tltWq21r/MnTHfBCSwFHPbhD8ZmFspZ?=
	=?us-ascii?Q?tANnSJXKVCZrEJdKKGbrhubbLxdR1fhNSZjw/pDU8OuM2Q9vUrfEXP16GH46?=
	=?us-ascii?Q?7K7K7jOfheNfSPQ54GnQEOnBQjExEUTfpxEtLBqRqF9z/a63f1zINquG9xqO?=
	=?us-ascii?Q?UeGK2Pyjl/33Zur3WybFmOu4F9pwmMA0JO/UL7b+SPJltu+L3ROmivYeDn6x?=
	=?us-ascii?Q?Ov36zw07RoNtnIhgtTWHT01fPi6h+s7pkUZdWoqtOaDxLSFQF3ifkO4gmtE7?=
	=?us-ascii?Q?9rXK01LIplYeKcV91+EOykoyrhKA1WWeZE6tQ295Hf81VvsSw5irD1eFZIhN?=
	=?us-ascii?Q?C0j5cvqGKvUbNrrcXMcc6V2Re0K1UZxlFXpSZKuEb6VPkuVECYMB5nGon0Xa?=
	=?us-ascii?Q?m7JNTr4lpFjTkzeRsv3pmhI1l94Kvx8qsPtr3B2AWczKtuqifDyU9YZ+/hQF?=
	=?us-ascii?Q?lDV2aauz6mIkXLLAqzIOGz0HOc7Gqc+yaaDU7+0cyEkA8IweG34japkv6xP7?=
	=?us-ascii?Q?ouRQ5Z6l4t/7PretXdBwz7Bgl+9TLtreloe7D4un4lR1nkJcESRvkp/ivr1j?=
	=?us-ascii?Q?EbEG5Tk9XHnam7qiDg7+L4udyaEW957xGxLRv5tDWE3kiClfv6Uxx9X4bfuh?=
	=?us-ascii?Q?Yw4lF4Cv8iTaxjvQ0QmRzE/fZDPH4mTCBav2EXmrgJO5OxhRrjEFKuwCuqh2?=
	=?us-ascii?Q?EdigB+ErzL9793LDkW0S+Mh9YH9vaVg/bUYlfJddqNYZAPbw0XFMtb7FMSZi?=
	=?us-ascii?Q?mEViac9o5bdE5ZkasJUzIy0sajB1mPCbyJYwIcd20?=
X-Microsoft-Antispam-Message-Info: zlTaSGkDqoPP9phg8eDXMruy70ZtbcESAMP1LF3Rwuf+UIe44uwQ5uq47lBU9xOXrDwXl3qp8s+MDja7OxozG5TIzHQJHgSIOuJlji3nMxQLngHYTne23/MaLnIj8WXgSaZn2n+UnLvhmUnw0GYyp7qQVBCYlhETZGKSETMvq3syXmqT6RqvTOlPXJcbLDtOJ6qFIbCmo+0NE6GSK65LeuJyUPzsXjX8XQ24iCKgaWdnjP0VPktHYPtyI0PPSuT34ao4KIJmsrCyfphYljuCQemU7//dMGk1tAwknpkTyn3WFVi6LqDSi1Hx+xwAuT924kw0Mf0967xtok/TEobtQy/zbh1BkhYbBZ7OQud+lRc=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3511;
	6:o1BoUH6ISMwhYp7j7kaX5BqhatL3k7COZaQidpYW82lyYIniPi85RSxRbGuOOxTXhe/fxkzSqHTra5h0NvspP7ZOA4nCso23TalXO5EqL1MKQ43wAaN7TqDtEOQL/A2tGXOzYWMVEDYC2G0x5lkm+l4cYF+ddWn2dNDedOiFcnAGRQ6bZmxk0eYkYUMUPlHik7WjiAXl7WRdz1CBDgjFQ3jO7k3rjPNcl1zDAdx3QeKUIhLZNSnwJAA4ySaxeLfgobu/pnQT/LuExpunfvJxl81VR14tTGUX2j5Z4YChmySQc7QoqUBQDrm0EXXZfayWPVOqsylWdDkx/chWvP00cKHRFK2JToL7oxUJO61b0A1VAazllON77WedJ1h6ZEn0o90jfxYY+AsaHPOZiExLptQCY29kYuaygbBMwsFQKO1yQxPTHbxfFxm5xxBeRmxY/yLOUXRwo9X61IEIyq9/MQ==;
	5:ho0u5n9mSF1UfoP4VnohjNfE32ZPSCZqOqow1AOJwm4wOEMHeHfmtYAcmmGjddJ4adf94g8uJakvEQbYdn4yPRd4wlE87cW0QpCL6uFDbkQxYkvTc3MaVjW90SeAUTeFXkkv60TfuWYWGQL78vTWK5CF3uYXMGP2XuyOKJq//Hk=;
	7:b5C7/xtm2riabE0nhKHWh0+B/OR3cuBK+7KPl+PdAYPXL3ox16sW8pLtVIToFLKJ85xB2Oy1lSuqLgpfb/eXwvNM33xEADVe003OmqizpgX2pSPr+HL50Wbpj14C9l3rEFl/bKMtQIS+9NXz9Wh2Pw==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2018 13:19:37.9654 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f562f2a6-f8f7-48b7-dd3f-08d640c5d755
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0201MB3511
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.41.72
Subject: [Qemu-arm] [PATCH v5 2/2] hw/arm: versal: Add a virtual Xilinx
 Versal board
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	richard.henderson@linaro.org, frederic.konrad@adacore.com,
	philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hyyP28rW+ug9

Add a virtual Xilinx Versal board.

This board is based on the Xilinx Versal SoC. The exact
details of what peripherals are attached to this board
will remain in control of QEMU. QEMU will generate an
FDT on the fly for Linux and other software to auto-discover
peripherals.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/Makefile.objs      |   2 +-
 hw/arm/xlnx-versal-virt.c | 494 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 495 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/xlnx-versal-virt.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index ec21d9bc1f..50c7b4a927 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -26,7 +26,7 @@ obj-$(CONFIG_ALLWINNER_A10) += allwinner-a10.o cubieboard.o
 obj-$(CONFIG_RASPI) += bcm2835_peripherals.o bcm2836.o raspi.o
 obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
 obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx-zynqmp.o xlnx-zcu102.o
-obj-$(CONFIG_XLNX_VERSAL) += xlnx-versal.o
+obj-$(CONFIG_XLNX_VERSAL) += xlnx-versal.o xlnx-versal-virt.o
 obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
 obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
 obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
new file mode 100644
index 0000000000..1e31a3f442
--- /dev/null
+++ b/hw/arm/xlnx-versal-virt.c
@@ -0,0 +1,494 @@
+/*
+ * Xilinx Versal Virtual board.
+ *
+ * Copyright (c) 2018 Xilinx Inc.
+ * Written by Edgar E. Iglesias
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 or
+ * (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "sysemu/device_tree.h"
+#include "exec/address-spaces.h"
+#include "hw/boards.h"
+#include "hw/sysbus.h"
+#include "hw/arm/sysbus-fdt.h"
+#include "hw/arm/fdt.h"
+#include "cpu.h"
+#include "hw/arm/xlnx-versal.h"
+
+#define TYPE_XLNX_VERSAL_VIRT_MACHINE MACHINE_TYPE_NAME("xlnx-versal-virt")
+#define XLNX_VERSAL_VIRT_MACHINE(obj) \
+    OBJECT_CHECK(VersalVirt, (obj), TYPE_XLNX_VERSAL_VIRT_MACHINE)
+
+typedef struct VersalVirt {
+    MachineState parent_obj;
+
+    Versal soc;
+    MemoryRegion mr_ddr;
+
+    void *fdt;
+    int fdt_size;
+    struct {
+        uint32_t gic;
+        uint32_t ethernet_phy[2];
+        uint32_t clk_125Mhz;
+        uint32_t clk_25Mhz;
+    } phandle;
+    struct arm_boot_info binfo;
+
+    struct {
+        bool secure;
+    } cfg;
+} VersalVirt;
+
+static void fdt_create(VersalVirt *s)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(s);
+    int i;
+
+    s->fdt = create_device_tree(&s->fdt_size);
+    if (!s->fdt) {
+        error_report("create_device_tree() failed");
+        exit(1);
+    }
+
+    /* Allocate all phandles.  */
+    s->phandle.gic = qemu_fdt_alloc_phandle(s->fdt);
+    for (i = 0; i < ARRAY_SIZE(s->phandle.ethernet_phy); i++) {
+        s->phandle.ethernet_phy[i] = qemu_fdt_alloc_phandle(s->fdt);
+    }
+    s->phandle.clk_25Mhz = qemu_fdt_alloc_phandle(s->fdt);
+    s->phandle.clk_125Mhz = qemu_fdt_alloc_phandle(s->fdt);
+
+    /* Create /chosen node for load_dtb.  */
+    qemu_fdt_add_subnode(s->fdt, "/chosen");
+
+    /* Header */
+    qemu_fdt_setprop_cell(s->fdt, "/", "interrupt-parent", s->phandle.gic);
+    qemu_fdt_setprop_cell(s->fdt, "/", "#size-cells", 0x2);
+    qemu_fdt_setprop_cell(s->fdt, "/", "#address-cells", 0x2);
+    qemu_fdt_setprop_string(s->fdt, "/", "model", mc->desc);
+    qemu_fdt_setprop_string(s->fdt, "/", "compatible", "xlnx-versal-virt");
+}
+
+static void fdt_add_clk_node(VersalVirt *s, const char *name,
+                             unsigned int freq_hz, uint32_t phandle)
+{
+    qemu_fdt_add_subnode(s->fdt, name);
+    qemu_fdt_setprop_cell(s->fdt, name, "phandle", phandle);
+    qemu_fdt_setprop_cell(s->fdt, name, "clock-frequency", freq_hz);
+    qemu_fdt_setprop_cell(s->fdt, name, "#clock-cells", 0x0);
+    qemu_fdt_setprop_string(s->fdt, name, "compatible", "fixed-clock");
+    qemu_fdt_setprop(s->fdt, name, "u-boot,dm-pre-reloc", NULL, 0);
+}
+
+static void fdt_add_cpu_nodes(VersalVirt *s, uint32_t psci_conduit)
+{
+    int i;
+
+    qemu_fdt_add_subnode(s->fdt, "/cpus");
+    qemu_fdt_setprop_cell(s->fdt, "/cpus", "#size-cells", 0x0);
+    qemu_fdt_setprop_cell(s->fdt, "/cpus", "#address-cells", 1);
+
+    for (i = XLNX_VERSAL_NR_ACPUS - 1; i >= 0; i--) {
+        char *name = g_strdup_printf("/cpus/cpu@%d", i);
+        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
+
+        qemu_fdt_add_subnode(s->fdt, name);
+        qemu_fdt_setprop_cell(s->fdt, name, "reg", armcpu->mp_affinity);
+        if (psci_conduit != QEMU_PSCI_CONDUIT_DISABLED) {
+            qemu_fdt_setprop_string(s->fdt, name, "enable-method", "psci");
+        }
+        qemu_fdt_setprop_string(s->fdt, name, "device_type", "cpu");
+        qemu_fdt_setprop_string(s->fdt, name, "compatible",
+                                armcpu->dtb_compatible);
+        g_free(name);
+    }
+}
+
+static void fdt_add_gic_nodes(VersalVirt *s)
+{
+    char *nodename;
+
+    nodename = g_strdup_printf("/gic@%x", MM_GIC_APU_DIST_MAIN);
+    qemu_fdt_add_subnode(s->fdt, nodename);
+    qemu_fdt_setprop_cell(s->fdt, nodename, "phandle", s->phandle.gic);
+    qemu_fdt_setprop_cells(s->fdt, nodename, "interrupts",
+                           GIC_FDT_IRQ_TYPE_PPI, VERSAL_GIC_MAINT_IRQ,
+                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+    qemu_fdt_setprop(s->fdt, nodename, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop_sized_cells(s->fdt, nodename, "reg",
+                                 2, MM_GIC_APU_DIST_MAIN,
+                                 2, MM_GIC_APU_DIST_MAIN_SIZE,
+                                 2, MM_GIC_APU_REDIST_0,
+                                 2, MM_GIC_APU_REDIST_0_SIZE);
+    qemu_fdt_setprop_cell(s->fdt, nodename, "#interrupt-cells", 3);
+    qemu_fdt_setprop_string(s->fdt, nodename, "compatible", "arm,gic-v3");
+}
+
+static void fdt_add_timer_nodes(VersalVirt *s)
+{
+    const char compat[] = "arm,armv8-timer";
+    uint32_t irqflags = GIC_FDT_IRQ_FLAGS_LEVEL_HI;
+
+    qemu_fdt_add_subnode(s->fdt, "/timer");
+    qemu_fdt_setprop_cells(s->fdt, "/timer", "interrupts",
+            GIC_FDT_IRQ_TYPE_PPI, VERSAL_TIMER_S_EL1_IRQ, irqflags,
+            GIC_FDT_IRQ_TYPE_PPI, VERSAL_TIMER_NS_EL1_IRQ, irqflags,
+            GIC_FDT_IRQ_TYPE_PPI, VERSAL_TIMER_VIRT_IRQ, irqflags,
+            GIC_FDT_IRQ_TYPE_PPI, VERSAL_TIMER_NS_EL2_IRQ, irqflags);
+    qemu_fdt_setprop(s->fdt, "/timer", "compatible",
+                     compat, sizeof(compat));
+}
+
+static void fdt_add_uart_nodes(VersalVirt *s)
+{
+    uint64_t addrs[] = { MM_UART1, MM_UART0 };
+    unsigned int irqs[] = { VERSAL_UART1_IRQ_0, VERSAL_UART0_IRQ_0 };
+    const char compat[] = "arm,pl011\0arm,sbsa-uart";
+    const char clocknames[] = "uartclk\0apb_pclk";
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(addrs); i++) {
+        char *name = g_strdup_printf("/uart@%" PRIx64, addrs[i]);
+        qemu_fdt_add_subnode(s->fdt, name);
+        qemu_fdt_setprop_cell(s->fdt, name, "current-speed", 115200);
+        qemu_fdt_setprop_cells(s->fdt, name, "clocks",
+                               s->phandle.clk_125Mhz, s->phandle.clk_125Mhz);
+        qemu_fdt_setprop(s->fdt, name, "clock-names",
+                         clocknames, sizeof(clocknames));
+
+        qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
+                               GIC_FDT_IRQ_TYPE_SPI, irqs[i],
+                               GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+        qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+                                     2, addrs[i], 2, 0x1000);
+        qemu_fdt_setprop(s->fdt, name, "compatible",
+                         compat, sizeof(compat));
+        qemu_fdt_setprop(s->fdt, name, "u-boot,dm-pre-reloc", NULL, 0);
+
+        if (addrs[i] == MM_UART0) {
+            /* Select UART0.  */
+            qemu_fdt_setprop_string(s->fdt, "/chosen", "stdout-path", name);
+        }
+        g_free(name);
+    }
+}
+
+static void fdt_add_fixed_link_nodes(VersalVirt *s, char *gemname,
+                                     uint32_t phandle)
+{
+    char *name = g_strdup_printf("%s/fixed-link", gemname);
+
+    qemu_fdt_add_subnode(s->fdt, name);
+    qemu_fdt_setprop_cell(s->fdt, name, "phandle", phandle);
+    qemu_fdt_setprop(s->fdt, name, "full-duplex", NULL, 0);
+    qemu_fdt_setprop_cell(s->fdt, name, "speed", 1000);
+    g_free(name);
+}
+
+static void fdt_add_gem_nodes(VersalVirt *s)
+{
+    uint64_t addrs[] = { MM_GEM1, MM_GEM0 };
+    unsigned int irqs[] = { VERSAL_GEM1_IRQ_0, VERSAL_GEM0_IRQ_0 };
+    const char clocknames[] = "pclk\0hclk\0tx_clk\0rx_clk";
+    const char compat_gem[] = "cdns,zynqmp-gem\0cdns,gem";
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(addrs); i++) {
+        char *name = g_strdup_printf("/ethernet@%" PRIx64, addrs[i]);
+        qemu_fdt_add_subnode(s->fdt, name);
+
+        fdt_add_fixed_link_nodes(s, name, s->phandle.ethernet_phy[i]);
+        qemu_fdt_setprop_string(s->fdt, name, "phy-mode", "rgmii-id");
+        qemu_fdt_setprop_cell(s->fdt, name, "phy-handle",
+                              s->phandle.ethernet_phy[i]);
+        qemu_fdt_setprop_cells(s->fdt, name, "clocks",
+                               s->phandle.clk_25Mhz, s->phandle.clk_25Mhz,
+                               s->phandle.clk_25Mhz, s->phandle.clk_25Mhz);
+        qemu_fdt_setprop(s->fdt, name, "clock-names",
+                         clocknames, sizeof(clocknames));
+        qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
+                               GIC_FDT_IRQ_TYPE_SPI, irqs[i],
+                               GIC_FDT_IRQ_FLAGS_LEVEL_HI,
+                               GIC_FDT_IRQ_TYPE_SPI, irqs[i],
+                               GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+        qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+                                     2, addrs[i], 2, 0x1000);
+        qemu_fdt_setprop(s->fdt, name, "compatible",
+                         compat_gem, sizeof(compat_gem));
+        qemu_fdt_setprop_cell(s->fdt, name, "#address-cells", 1);
+        qemu_fdt_setprop_cell(s->fdt, name, "#size-cells", 0);
+        g_free(name);
+    }
+}
+
+static void fdt_nop_memory_nodes(void *fdt, Error **errp)
+{
+    Error *err = NULL;
+    char **node_path;
+    int n = 0;
+
+    node_path = qemu_fdt_node_unit_path(fdt, "memory", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    while (node_path[n]) {
+        if (g_str_has_prefix(node_path[n], "/memory")) {
+            qemu_fdt_nop_node(fdt, node_path[n]);
+        }
+        n++;
+    }
+    g_strfreev(node_path);
+}
+
+static void fdt_add_memory_nodes(VersalVirt *s, void *fdt, uint64_t ram_size)
+{
+    /* Describes the various split DDR access regions.  */
+    static const struct {
+        uint64_t base;
+        uint64_t size;
+    } addr_ranges[] = {
+        { MM_TOP_DDR, MM_TOP_DDR_SIZE },
+        { MM_TOP_DDR_2, MM_TOP_DDR_2_SIZE },
+        { MM_TOP_DDR_3, MM_TOP_DDR_3_SIZE },
+        { MM_TOP_DDR_4, MM_TOP_DDR_4_SIZE }
+    };
+    uint64_t mem_reg_prop[8] = {0};
+    uint64_t size = ram_size;
+    Error *err = NULL;
+    char *name;
+    int i;
+
+    fdt_nop_memory_nodes(fdt, &err);
+    if (err) {
+        error_report_err(err);
+        return;
+    }
+
+    name = g_strdup_printf("/memory@%x", MM_TOP_DDR);
+    for (i = 0; i < ARRAY_SIZE(addr_ranges) && size; i++) {
+        uint64_t mapsize;
+
+        mapsize = size < addr_ranges[i].size ? size : addr_ranges[i].size;
+
+        mem_reg_prop[i * 2] = addr_ranges[i].base;
+        mem_reg_prop[i * 2 + 1] = mapsize;
+        size -= mapsize;
+    }
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "device_type", "memory");
+
+    switch (i) {
+    case 1:
+        qemu_fdt_setprop_sized_cells(fdt, name, "reg",
+                                     2, mem_reg_prop[0],
+                                     2, mem_reg_prop[1]);
+        break;
+    case 2:
+        qemu_fdt_setprop_sized_cells(fdt, name, "reg",
+                                     2, mem_reg_prop[0],
+                                     2, mem_reg_prop[1],
+                                     2, mem_reg_prop[2],
+                                     2, mem_reg_prop[3]);
+        break;
+    case 3:
+        qemu_fdt_setprop_sized_cells(fdt, name, "reg",
+                                     2, mem_reg_prop[0],
+                                     2, mem_reg_prop[1],
+                                     2, mem_reg_prop[2],
+                                     2, mem_reg_prop[3],
+                                     2, mem_reg_prop[4],
+                                     2, mem_reg_prop[5]);
+        break;
+    case 4:
+        qemu_fdt_setprop_sized_cells(fdt, name, "reg",
+                                     2, mem_reg_prop[0],
+                                     2, mem_reg_prop[1],
+                                     2, mem_reg_prop[2],
+                                     2, mem_reg_prop[3],
+                                     2, mem_reg_prop[4],
+                                     2, mem_reg_prop[5],
+                                     2, mem_reg_prop[6],
+                                     2, mem_reg_prop[7]);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    g_free(name);
+}
+
+static void versal_virt_modify_dtb(const struct arm_boot_info *binfo,
+                                    void *fdt)
+{
+    VersalVirt *s = container_of(binfo, VersalVirt, binfo);
+
+    fdt_add_memory_nodes(s, fdt, binfo->ram_size);
+}
+
+static void *versal_virt_get_dtb(const struct arm_boot_info *binfo,
+                                  int *fdt_size)
+{
+    const VersalVirt *board = container_of(binfo, VersalVirt, binfo);
+
+    *fdt_size = board->fdt_size;
+    return board->fdt;
+}
+
+#define NUM_VIRTIO_TRANSPORT 32
+static void create_virtio_regions(VersalVirt *s)
+{
+    int virtio_mmio_size = 0x200;
+    int i;
+
+    for (i = 0; i < NUM_VIRTIO_TRANSPORT; i++) {
+        char *name = g_strdup_printf("virtio%d", i);;
+        hwaddr base = MM_TOP_RSVD + i * virtio_mmio_size;
+        int irq = VERSAL_RSVD_HIGH_IRQ_FIRST + i;
+        MemoryRegion *mr;
+        DeviceState *dev;
+        qemu_irq pic_irq;
+
+        pic_irq = qdev_get_gpio_in(DEVICE(&s->soc.fpd.apu.gic), irq);
+        dev = qdev_create(NULL, "virtio-mmio");
+        object_property_add_child(OBJECT(&s->soc), name, OBJECT(dev),
+                                  &error_fatal);
+        qdev_init_nofail(dev);
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic_irq);
+        mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
+        memory_region_add_subregion(&s->soc.mr_ps, base, mr);
+        sysbus_create_simple("virtio-mmio", base, pic_irq);
+    }
+
+    for (i = 0; i < NUM_VIRTIO_TRANSPORT; i++) {
+        hwaddr base = MM_TOP_RSVD + i * virtio_mmio_size;
+        int irq = VERSAL_RSVD_HIGH_IRQ_FIRST + i;
+        char *name = g_strdup_printf("/virtio_mmio@%" PRIx64, base);
+
+        qemu_fdt_add_subnode(s->fdt, name);
+        qemu_fdt_setprop(s->fdt, name, "dma-coherent", NULL, 0);
+        qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
+                               GIC_FDT_IRQ_TYPE_SPI, irq,
+                               GIC_FDT_IRQ_FLAGS_EDGE_LO_HI);
+        qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+                                     2, base, 2, virtio_mmio_size);
+        qemu_fdt_setprop_string(s->fdt, name, "compatible", "virtio,mmio");
+        g_free(name);
+    }
+}
+
+static void versal_virt_init(MachineState *machine)
+{
+    VersalVirt *s = XLNX_VERSAL_VIRT_MACHINE(machine);
+    int psci_conduit = QEMU_PSCI_CONDUIT_DISABLED;
+
+    /*
+     * If the user provides an Operating System to be loaded, we expect them
+     * to use the -kernel command line option.
+     *
+     * Users can load firmware or boot-loaders with the -device loader options.
+     *
+     * When loading an OS, we generate a dtb and let arm_load_kernel() select
+     * where it gets loaded. This dtb will be passed to the kernel in x0.
+     *
+     * If there's no -kernel option, we generate a DTB and place it at 0x1000
+     * for the bootloaders or firmware to pick up.
+     *
+     * If users want to provide their own DTB, they can use the -dtb option.
+     * These dtb's will have their memory nodes modified to match QEMU's
+     * selected ram_size option before they get passed to the kernel or fw.
+     *
+     * When loading an OS, we turn on QEMU's PSCI implementation with SMC
+     * as the PSCI conduit. When there's no -kernel, we assume the user
+     * provides EL3 firmware to handle PSCI.
+     */
+    if (machine->kernel_filename) {
+        psci_conduit = QEMU_PSCI_CONDUIT_SMC;
+    }
+
+    memory_region_allocate_system_memory(&s->mr_ddr, NULL, "ddr",
+                                         machine->ram_size);
+
+    sysbus_init_child_obj(OBJECT(machine), "xlnx-ve", &s->soc,
+                          sizeof(s->soc), TYPE_XLNX_VERSAL);
+    object_property_set_link(OBJECT(&s->soc), OBJECT(&s->mr_ddr),
+                             "ddr", &error_abort);
+    object_property_set_int(OBJECT(&s->soc), psci_conduit,
+                            "psci-conduit", &error_abort);
+    object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_fatal);
+
+    fdt_create(s);
+    create_virtio_regions(s);
+    fdt_add_gem_nodes(s);
+    fdt_add_uart_nodes(s);
+    fdt_add_gic_nodes(s);
+    fdt_add_timer_nodes(s);
+    fdt_add_cpu_nodes(s, psci_conduit);
+    fdt_add_clk_node(s, "/clk125", 125000000, s->phandle.clk_125Mhz);
+    fdt_add_clk_node(s, "/clk25", 25000000, s->phandle.clk_25Mhz);
+
+    /* Make the APU cpu address space visible to virtio and other
+     * modules unaware of muliple address-spaces.  */
+    memory_region_add_subregion_overlap(get_system_memory(),
+                                        0, &s->soc.fpd.apu.mr, 0);
+
+    s->binfo.ram_size = machine->ram_size;
+    s->binfo.kernel_filename = machine->kernel_filename;
+    s->binfo.kernel_cmdline = machine->kernel_cmdline;
+    s->binfo.initrd_filename = machine->initrd_filename;
+    s->binfo.loader_start = 0x0;
+    s->binfo.get_dtb = versal_virt_get_dtb;
+    s->binfo.modify_dtb = versal_virt_modify_dtb;
+    if (machine->kernel_filename) {
+        arm_load_kernel(s->soc.fpd.apu.cpu[0], &s->binfo);
+    } else {
+        AddressSpace *as = arm_boot_address_space(s->soc.fpd.apu.cpu[0],
+                                                  &s->binfo);
+        /* Some boot-loaders (e.g u-boot) don't like blobs at address 0 (NULL).
+         * Offset things by 4K.  */
+        s->binfo.loader_start = 0x1000;
+        s->binfo.dtb_limit = 0x1000000;
+        if (arm_load_dtb(s->binfo.loader_start,
+                         &s->binfo, s->binfo.dtb_limit, as) < 0) {
+            exit(EXIT_FAILURE);
+        }
+    }
+}
+
+static void versal_virt_machine_instance_init(Object *obj)
+{
+}
+
+static void versal_virt_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->desc = "Xilinx Versal Virtual development board";
+    mc->init = versal_virt_init;
+    mc->max_cpus = XLNX_VERSAL_NR_ACPUS;
+    mc->default_cpus = XLNX_VERSAL_NR_ACPUS;
+    mc->no_cdrom = true;
+}
+
+static const TypeInfo versal_virt_machine_init_typeinfo = {
+    .name       = TYPE_XLNX_VERSAL_VIRT_MACHINE,
+    .parent     = TYPE_MACHINE,
+    .class_init = versal_virt_machine_class_init,
+    .instance_init = versal_virt_machine_instance_init,
+    .instance_size = sizeof(VersalVirt),
+};
+
+static void versal_virt_machine_init_register_types(void)
+{
+    type_register_static(&versal_virt_machine_init_typeinfo);
+}
+
+type_init(versal_virt_machine_init_register_types)
+
-- 
2.17.1

