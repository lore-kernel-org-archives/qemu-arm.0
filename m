Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4183424wru;
        Tue, 14 Aug 2018 08:06:13 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyR8UFFEmP+/X2H1EOssdyrkjVZEzneq/LORTJz2wxWcKXsNIdRQcY4V9CQsGPVutvHoeNZ
X-Received: by 2002:a37:67d5:: with SMTP id b204-v6mr19649193qkc.108.1534259173021;
        Tue, 14 Aug 2018 08:06:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534259173; cv=none;
        d=google.com; s=arc-20160816;
        b=EICSTWqYlTtLktCDTDnrCK+li7TW8ALGlSn5dTBlEOUwz9gIsxUdZv5iVFb5JDpkMs
         ZpHKSz6WjY0NveK1Kh5OkwAIvE8IMHC2UsSsVhQ+jjxS15cVmMV4ILT5JeiezUKQ8/e1
         XhyUpxUaaxaI/gO5LC1s4gDNdi+oQvlkQkRkhaERTAf1NhZwls9j8VopdRC7d0k3aHH7
         9nuqiQBzMuDqUXHgIC1A+H3IGnM8PaBIqPzdyGfm3Q/Qsrid2TXeDyrSAlGyTqZIKpaG
         0ycI9bc22rviMfma9L/Bm+KNzMIneA38uJqq/5KlZm/7cJTnltc01rRE1F+LJZZWuXhi
         5f3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=CclCLBxFFh3Xu4vS3YjoSta0qTDz4JR/XIXxsH0wjJg=;
        b=L8/n4RGgbNjh4iUDtARp1JL6Eg/g0zgr6oEP5JhAPFKxREde6pGKuiZmRxM9Xo64Oa
         +/ZsZ8RGZoHIwU+rwYg4Bsc4nV0Xe/DQIDnF118jsWR/2LiIh1yuVvJW4jsO7Iz/QC6f
         q2UX2FTWJ183UKg2b8mwAQtqllVxRe4cUs9odpHwjUTuRnCU7b2k/7XjpAe27bH2pzwq
         BMrKa67AqRAobxIkOmOd+xXo1VVwQPoxEcRKPhbnQto3pjp6BZL/K3J5Dej6FoymamQ9
         R4NcoTRsbISvVFVGQrFyA1ltaZ9kBzcGjaRyTvSct8Wk8ff0u06yTxFxUC5XCuQ1Nddv
         IcUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=rMZ7E25o;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s5-v6si6839087qve.21.2018.08.14.08.06.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 08:06:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=rMZ7E25o;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44769 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpatg-0003Ga-Ia
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 11:06:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fpaoA-0005cR-2c
	for qemu-devel@nongnu.org; Tue, 14 Aug 2018 11:00:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fpao5-0002wK-4m
	for qemu-devel@nongnu.org; Tue, 14 Aug 2018 11:00:30 -0400
Received: from mail-sn1nam01on0058.outbound.protection.outlook.com
	([104.47.32.58]:15808
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1fpao4-0002uX-Qh; Tue, 14 Aug 2018 11:00:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=CclCLBxFFh3Xu4vS3YjoSta0qTDz4JR/XIXxsH0wjJg=;
	b=rMZ7E25oEOMuHuAEqK1huAbCqCNY+21odnytGPAJPAnmDoQbg4kpuSGy6BMXxLMJx6JEUIwlucUfBL9jvYoe98vawY4dmnetkfPAfmboX9HhXnO5O4W6JanTbVxcd0U2oOv0uwQ0KgX3d+pTCCqCRk41YjeP3YnBvVdwbhjqqdU=
Received: from SN4PR0201CA0071.namprd02.prod.outlook.com
	(2603:10b6:803:20::33) by DM6PR02MB4460.namprd02.prod.outlook.com
	(2603:10b6:5:29::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1038.19;
	Tue, 14 Aug 2018 15:00:22 +0000
Received: from CY1NAM02FT038.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::209) by SN4PR0201CA0071.outlook.office365.com
	(2603:10b6:803:20::33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1038.23 via
	Frontend Transport; Tue, 14 Aug 2018 15:00:22 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; greensocs.com; dkim=none (message not signed)
	header.d=none;greensocs.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT038.mail.protection.outlook.com (10.152.74.217) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1059.14
	via Frontend Transport; Tue, 14 Aug 2018 15:00:21 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fpao0-0003Ia-VN; Tue, 14 Aug 2018 08:00:20 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fpann-0004eO-3N; Tue, 14 Aug 2018 08:00:15 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w7EExvve011732; Tue, 14 Aug 2018 07:59:57 -0700
Received: from [10.23.118.101] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fpand-0004Zq-A0; Tue, 14 Aug 2018 07:59:57 -0700
Date: Tue, 14 Aug 2018 16:59:56 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180814145956.tpdhei44ok52aj52@toto>
References: <20180814124254.5229-1-peter.maydell@linaro.org>
	<20180814124254.5229-8-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180814124254.5229-8-peter.maydell@linaro.org>
User-Agent: NeoMutt/20170609 (1.8.3)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(39860400002)(396003)(376002)(346002)(136003)(2980300002)(438002)(189003)(199004)(14444005)(1076002)(356003)(6916009)(305945005)(81166006)(5660300001)(186003)(107886003)(26005)(77096007)(8676002)(81156014)(4326008)(229853002)(23726003)(9686003)(478600001)(36386004)(63266004)(47776003)(106466001)(97756001)(8936002)(126002)(476003)(486006)(6246003)(33716001)(76176011)(9786002)(316002)(58126008)(16586007)(2906002)(54906003)(50466002)(336012)(46406003)(426003)(106002)(446003)(11346002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB4460; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT038;
	1:cIju0C28u5RVPSR3WUbMLdMiCXLpc+KDZJti8zexNAMyFwtNIGrwkaZ10QLwbu7ZArIdzAaw6eRQuWI77HdvuCbUUf2tN4+cBYVLvokxdFN/6CYHtjNgwKRFUUzJHvJ3
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a28d311e-3e7d-4e4a-a9e8-08d601f6a85a
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:DM6PR02MB4460; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4460;
	3:TgXcXP5vinXovZQLmCOITeSNXXhbksq2WlbUltxHwlXi92EMPBXqS8EJIAFf3I7nZ9h5PN1Rh488Eni73mgsMUgr+MIup2CGglSoJXPPDuuomAsXoKMUxrrmZMDzOs2f8oFjnmYX2IUgGBttXQTOhHuxqBEeC3JywZvQtmkMGE19eyZOzxlHzfszfX/BO3OpUmE2camigw7uhSDj6iauwnQJLuRUAsqwoLnms+Ylw8OPh3Qhmu/bjUDlc3od/roo0mo8eZpASrpYoBbEE8SgT9zDQPx6zvQGxpecB52HE9AEiJL3g3Rx2S7Aitfl3kvi7/WIJsjX9gYDiX+eBywTMno4i54aS5OZHtbTzCv11dQ=;
	25:W4WutyB59BDcyzveJ5BdXP2mO0Gxxf43UaYJyp6rHdD+8M4ukBLPD/Q8F2WwmXfRxFMPtquz5vj8WeMWkjBPYtVQiU927fB53qUWSe5ANB3qojZ+zt5pJhmfZ953L7YYcWp53m1OEPOAabTwX77o4zB9r2kzLwNEVrxwNozJeR9iu0saAs3p7XvxujVrdKd6HGFqNEyHCX7juXEFwfc1mzHefps889KxV/qkqt//vPGxU29tEJwAb4GQBJLt4x1MQgiG0lr5WbfiR6bdrNGNgraq68yj4Tdu8mwo31G2hf/gHQpaI2m4D0noQ9g1WQFHqI7WI2Zo177gMeJwmLJDBA==
X-MS-TrafficTypeDiagnostic: DM6PR02MB4460:
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4460;
	31:6HVoVWg/UseFHjSQvjwl/Mxvb+en9DKHGwA7Wz/XG2xvee5y+7iXxDbyNNZ4GtixF8HdA3nL6ti/CtxzAmYYS+e1Z/LXVnOsLPTZDe8P4rAzc8NbC7aqPvWqOow7LVmcPDt2zgH9Nkch8Qq0rnrk6hQztLfzP9aoICbU2RF6f9FZZBa+ejmD9Pmg6bmeTvx4HIKttDnuddg+FoAibBAVm/aUDHQQ6q2xW6lCE0veq6c=;
	20:NUzcy+fUP8rl+TfLMX2N/aUZemv1nXzZTl5SBO0XNPTd619bAaoLvITqJFzKtPHNOVuR2DM/EPjAwO0JWacAeks1C5xpkurUVe5zKxE0xuMdv/0EjkO0/3vTjFW/bJdcRp/jgchY3QpygMNe7e+yZ8VLy74+ZxjDD7lkIOMVswPJPzzkwjq6G7JXitRYaBKpVXnpzYvtB2eiqrvlqMqlQDVL02zm4nQf3nawUHb6zDlpjpCthEGm7OXai0XUjgeB6SGrD0w35D7bBqerChqlYbyulnMA5w18RpBZZOpjFyJTB/R8Rx+ugNQ1AKDOyNCltmxWqSvXs7gX+2WucFkYkqZsKhteKpyymRL95MpYaG9xHa2SJY/k6pyjh78WgMBjClrr51BU1Ykb7wdhdlHg7dUOwU4mZdk26RAsYwzDlkRLU0sdncKFba6rTCR7oCmxgyrnePTIdcYUZTrQXCKibklDtam9K7uCBWfEwmXTJdHeHMgoaDib9FiC1BZsqhik
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM6PR02MB44605726A03B52DA3D5221A1AB380@DM6PR02MB4460.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93004095)(3231311)(944501410)(52105095)(10201501046)(3002001)(6055026)(149027)(150027)(6041310)(20161123564045)(20161123560045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:DM6PR02MB4460; BCL:0; PCL:0; RULEID:; SRVR:DM6PR02MB4460; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4460;
	4:XBCn5uQ4qXscB3d2WE62WYCBdOY9J57HRyivzlY1DUEzggQ+xkWzardhLb991n0SqiVJiFiAjI0MlX7Al2ozYaXsnlz8OZG6AHs4H8z+Yzt+uUy5b+gzanQ2vCw46Qa6Y333V3QWc7AarN623YBgHLM0HP3p2IoG+VYmNvMrLz5mG/FlghmQicNo7cfCzr6IHoPyf04MT+kbOHcHfof6KZOR9SJtX9KRXD10TW39kyvVVQNtjAsbbqUR/GYPkpusT8W5Uo6ZEVYkcnv741AJW1emlJ/GzCI5nVXtNmfIyDJ5tJ+QYVAh9DqqJRIAJVtV
X-Forefront-PRVS: 0764C4A8CD
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM6PR02MB4460;
	23:r+nh4aRvr4w0FANeYTxxbk0ascmwtcRuQEc9KzMi/?=
	=?us-ascii?Q?Jd0+J5ZLpV9VkVMnh2JZJSl/HM0yUi8QDOEX+JlLj+6Xac1J/9TzJM5MzxcW?=
	=?us-ascii?Q?jz7h64Gw/emWVBZKlsbG4HxlhdUOxkjA7pIoGF/suPlJZpJjXeHkMRQ6H6aw?=
	=?us-ascii?Q?CONFSGBYkRmpT9fVZabbVpKcx8EJFk1NuN9gk/Jwd+Sdu5EsffmoyE8xaT0Y?=
	=?us-ascii?Q?GJd5/4/fLBMtGO7iyYxwn6vpGkeWh/7kUVlN0JyXwmxkxeW9Sgld+Y5maIb7?=
	=?us-ascii?Q?WaqSZ1qrwdW7+A/W2s3q3MpW0pzQMDxIVhK15yHLdH4Pf0rmXtlXjq+wGidd?=
	=?us-ascii?Q?SWnfVbuBMaka84gmFby2jo+NQ7Vy/gQl1zv4IKsjgEJYOvQvjfb3P8VyNGb/?=
	=?us-ascii?Q?eWsesjERgiM+Ty4UoU2rlUscIYfEtZvsMJfRF42v31TF28/gdtiCO1kETGyu?=
	=?us-ascii?Q?ZZczJ1XkOpQxc1ZWjTsv6bm6dLf4npNp/QasJ3PKB+c+Ei1dYHXttUv+Kucs?=
	=?us-ascii?Q?SkIilb+dgpakF3S7KKgHP+on7j1cpEFVqFq2+Nq1rKGzOLUcJ7eEnIhF4a+W?=
	=?us-ascii?Q?/ikzGyuImEXBwJZzdo29KVcYNRMcdVugDnDHtY/wf4/eYGmWjdMdFaXqMMn+?=
	=?us-ascii?Q?BA9+xj6OWt4NxBkNeqbGUUlOmjNTHmXN9JojxK7RiHQcAaD/9Lw9yOKOJwYP?=
	=?us-ascii?Q?XAgZ/sQpesl7QeDuDdnHnlWZL9i6VmFTIf7DojhtbqNk4JA+/ChVRTXbZiq8?=
	=?us-ascii?Q?5MQOnci0Zi+CygmBEZPjwxdAl+KyYQ/GjYj0GuBPZIb0ZoZwvRMNIWmhgh7w?=
	=?us-ascii?Q?tKtH2ps8QVHCmM+vsVgNRGEyM05pkZLpygT36wm8aSM/O3YeP7H8dMqgpTyv?=
	=?us-ascii?Q?aA4GCD6sCk5ceCOfS+Sz7bFD6TjTocLRhaDJ6kcYMIg0j0mCBOkznYTg3+LQ?=
	=?us-ascii?Q?U4d6t/H4ofgvXJ60Rack3G6BSuyAwZXNW4PPM9wMTWhFV3+m5+LX8XIsY3VL?=
	=?us-ascii?Q?SdLd0Zr1Gq/D8W85ZcpYrLAnI+pYxNNCvRorQ1RGN67w3dLMgAeYtkQPWNtN?=
	=?us-ascii?Q?GHwIoOq2HnrF2QNrKl2pYdJXIlM3Hbs4zwTCRGnmJ95SXv0trp+b/kkS08UT?=
	=?us-ascii?Q?5Pg/hNilZ1AcMCQZgfAYOyZ2LLwTlXRgUiJnM/A2YfR1lnLym3Ha4cfbGE+Y?=
	=?us-ascii?Q?QMIETDJ9h2FtU0=3D?=
X-Microsoft-Antispam-Message-Info: F0aVl1+hhIZBtxSCECAGBCyHofh6VsZyBq5Gw2loy1dQd39CIawkurlqXOUbgkGGsb8aPt0YlsChzQ4w6iTnaqzoxcdXeM1vjqeCOaZ3Evjr2OI86f0c/Jbx5RkSlkmRiW+ujH2C620UNyd0moTYkKHlmoc9xTeQaehIGHsVEleb4yhyYzAcz5Dj0GL7L4w59Vb2jk1lgCDX4SyFZoOKsOBAJBBHAoevtVSZVPng1+g2UwKzri6vjTAR+dfVglkI3XhBxBJZvOItKR/8lKfHe1wWst4iSyotGJ3ntcp5C/jgZOYpdUm/0srmudT+DXNHPtq2WaU938IT0Vpo10thSjpVoeBwlTveJLh7iNCcxUc=
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4460;
	6:c5zBZ03UhXQN32Y+/BSMDlj3W3g8c2VpZMKf3gHTNB7zH+pi131+18XL/FYofc93x0nh9cqbGEuElSlRZeIJB13tmTRcNWpVS99SUB74hSpCNavZk7YvjdVGI/Zk3482SrOsHJztAF8R79spoEMXdGs+BAwYBTKRPgcUeaKMNSwQRrpLpd+i0uHxoCk0AbAYq+SSTe0m3PvI/Mwr7prDOMHzGYbH7EJpH1XDBy6M9wbFjItnCH8YdDOcfTAh37is5xN6BuBIn5w08mJrh/+mTQPUEBJnbzjj6/o1AeuE0HQKPt8D88vbMxw5sMowThWz0CoN7XlZEWYGlvI6jBzEjjPh6CSf/LRMpbyb1PCF38J3+FY2a72+qbXltcElQP/kaT419yeF7edNKPsSMp3WIugjwS9liT+Y/OaNcezDaRMAu2agto+CkrCAglSagL6xB18jQiWIjqPE4jPRXWsyEg==;
	5:Lt3hyEVLMogCDkdoZhdO3piLokn5PgnHKBUykJ6zAb4aRsgU25IcLJbjR39guLdSaA8btIBs7pomeBzaiKDnaQ4Qz237YvZHv1io3FzFJlIQIMhNB/uamiW2mVMovsSKsOARqTZKxQ1Jeb0pZkzN31ElOzgE2HWr1C+XuaIyIn0=;
	7:o6sW7i/bT3l/avlnTcLRc7d0d5vgT9kywTbqWAbDVEb7hZcQ4P5IHrwExYjqu3g7tTorlz2usR1zRNVDncESGBtZFRNlVvg9PQSx4nPwYvCYTQ8dFnB8sf8VMt0l17iUB8ZZEduFs/xwOXYietP5SKDnyDrlviUSAgUGwBY450AQa/KaiupUQaHdSEFnLW5UGPBFjIOwPouSmZZopo1K+G/zT1VlIvO2EgN+H2Y+9DZQJW3uCVpeDx/ZyQDAhgbS
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2018 15:00:21.4319 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a28d311e-3e7d-4e4a-a9e8-08d601f6a85a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4460
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.58
Subject: Re: [Qemu-devel] [PATCH 07/10] target/arm: Implement ESR_EL2/HSR
 for AArch32 and no-EL2
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
Cc: edgari@xilinx.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6swt7fUPDyTn

On Tue, Aug 14, 2018 at 01:42:51PM +0100, Peter Maydell wrote:
> The AArch32 HSR is the equivalent of AArch64 ESR_EL2;
> we can implement it by marking our existing ESR_EL2 regdef
> as STATE_BOTH. It also needs to be "RES0 from EL3 if
> EL2 not implemented", so add the missing stanza to
> el3_no_el2_cp_reginfo.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d6e98e9d606..80855302089 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3763,6 +3763,10 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
>        .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 4,
>        .access = PL2_RW,
>        .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "ESR_EL2", .state = ARM_CP_STATE_BOTH,
> +      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 2, .opc2 = 0,
> +      .access = PL2_RW,
> +      .type = ARM_CP_CONST, .resetvalue = 0 },
>      { .name = "CPTR_EL2", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 2,
>        .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> @@ -3926,7 +3930,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>        .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 0, .opc2 = 1,
>        .access = PL2_RW,
>        .fieldoffset = offsetof(CPUARMState, elr_el[2]) },
> -    { .name = "ESR_EL2", .state = ARM_CP_STATE_AA64,
> +    { .name = "ESR_EL2", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 2, .opc2 = 0,
>        .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.esr_el[2]) },
>      { .name = "FAR_EL2", .state = ARM_CP_STATE_BOTH,
> -- 
> 2.18.0
> 
