Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4185203wru;
        Tue, 14 Aug 2018 08:07:41 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyGUVWM8IvB6vKCM9Kd5evtB9hczMTKHOWAAeN8yuzkaG4auH0hX5vz90jssi5jolN2TBBk
X-Received: by 2002:a37:c557:: with SMTP id p84-v6mr20836047qki.331.1534259260985;
        Tue, 14 Aug 2018 08:07:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534259260; cv=none;
        d=google.com; s=arc-20160816;
        b=KOPPgGtakQkHbN3rTeOhr6UUVR8msLHZhFnBqRfr9sr0TUJUeYYAvwfKPGZndwjdTJ
         m4pH4WJFKTSYSneHzJLz5QrLqHq/XcvDRAuVUaRoH6D/eAuB32S/cMl9dAXadalgwVJp
         cl04TW9S8NP09RNsH5JleSgW167mHUtpIDgNc7rFhfVyl3mTXcXjCHmKm7gJ1971Mden
         4UV2tIhEtGkcFDMKlkXMzM+UBXSuoq/bVrMABNgkp9KahPrzNHze5JsYjO0b8qHiwVDp
         muJ85utQWhFC2MQhc2jzLmFY9msbMtKGXwyZDgiuzvOACXhc/IX0Qsm0/o64TEe/GYzf
         cB3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=x4H8zES+Kvq0D/M46H3SwSEvKryfJxgNcGrEUgi3QZ8=;
        b=hMPhUHr2DbjsQn1i5XXlgUiMwiHhRwS4MCjls/jrrSIKTMX+wlWIdW+54y6+9MoXSX
         KMq1ZWPdTiYdU8dvoVDtMo/Hd3fZZy+4XjuAwZnIf56F5Sl6gc4Y8KDAFjFRw3wEGAU2
         MY6DTkUQ7NPjRcXN5SAqHF7K0S/qxNwz5HSSZKn67czaT8a/PgYeUgMAJaeB/fiRFztM
         WgEKu8cggfV4DSzw3Rloy9e+PtUVau/XmI2O7mq0H8lg1ngQ63GPlvd4UfjGI30pGgQf
         uaijEEdFKSeGJWzMkK3VhgppKGw5LMDC/Vw0Ay/DvApd7RrOOJKGSO4dc7wTE+hR2xo5
         lwDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=bSxl1qBQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f15-v6si7271579qth.269.2018.08.14.08.07.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 08:07:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=bSxl1qBQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44774 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpav6-0004LE-Fy
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 11:07:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fpaur-0004Gm-GP
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 11:07:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fpauq-00066q-HN
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 11:07:25 -0400
Received: from mail-bl2nam02on0619.outbound.protection.outlook.com
	([2a01:111:f400:fe46::619]:47856
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1fpaul-00064M-18; Tue, 14 Aug 2018 11:07:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=x4H8zES+Kvq0D/M46H3SwSEvKryfJxgNcGrEUgi3QZ8=;
	b=bSxl1qBQrDnQ5vGdt6CZdxmgeQydYfSUR4TXpylrkE5x5mCu2qaiER/yUG1vH3ta27BWCk/6cnRmZINXckk5BconMNBFw6oIw4BhjB0XwYh9IdDQrpbYZxLoCbMJcWTdRRTOSVY0szmumgxQefaeTUt7kaCix8W7KdVZY8y+mh4=
Received: from BYAPR02CA0060.namprd02.prod.outlook.com (2603:10b6:a03:54::37)
	by DM5PR0201MB3512.namprd02.prod.outlook.com (2603:10b6:4:77::12)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1038.22;
	Tue, 14 Aug 2018 15:07:15 +0000
Received: from CY1NAM02FT031.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::205) by BYAPR02CA0060.outlook.office365.com
	(2603:10b6:a03:54::37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1038.21 via
	Frontend Transport; Tue, 14 Aug 2018 15:07:15 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; greensocs.com; dkim=none (message not signed)
	header.d=none;greensocs.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT031.mail.protection.outlook.com (10.152.75.180) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1059.14
	via Frontend Transport; Tue, 14 Aug 2018 15:07:13 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fpaue-0003Mr-KX; Tue, 14 Aug 2018 08:07:12 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fpauZ-00077J-Dw; Tue, 14 Aug 2018 08:07:07 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w7EF72Sl015617; Tue, 14 Aug 2018 08:07:02 -0700
Received: from [10.23.118.101] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fpauT-00074U-Ir; Tue, 14 Aug 2018 08:07:01 -0700
Date: Tue, 14 Aug 2018 17:07:00 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180814150700.nvvrppys6zrq43pe@toto>
References: <20180814124254.5229-1-peter.maydell@linaro.org>
	<20180814124254.5229-9-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180814124254.5229-9-peter.maydell@linaro.org>
User-Agent: NeoMutt/20170609 (1.8.3)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(396003)(39860400002)(136003)(376002)(346002)(2980300002)(438002)(199004)(189003)(316002)(16586007)(229853002)(5660300001)(14444005)(305945005)(2906002)(9686003)(63266004)(26005)(9786002)(81166006)(6916009)(81156014)(58126008)(54906003)(106002)(8676002)(97756001)(23726003)(356003)(1076002)(76176011)(46406003)(15650500001)(8936002)(6246003)(33716001)(478600001)(47776003)(426003)(50466002)(336012)(4326008)(107886003)(486006)(476003)(186003)(446003)(11346002)(77096007)(126002)(106466001)(36386004)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0201MB3512;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT031;
	1:KhMXirugyB0aviLLvQHbSdQh4MNkqS56LNloBLcqZWyyimzEM7lLjRCoK7ljy7xLPW852PFipjPUiTXwblC/XNo0nGyyZzI29+YPGFWL9y4ZN/CErsu1nohJhBh2Lz8e
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c9697d0-3cc3-41b7-cce3-08d601f79dc1
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:DM5PR0201MB3512; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3512;
	3:ATQhrHVzjlthCOLxbFcLPKeX4cHhPMnX9k1PzYYz/GYYk/h3smR0J6MnWeI04Q7jnRj/MVqwCHFU8/EfvEViFpMkzXuBYxPXg/1HntYyGpGylqpVhZEBpUz05bhWg7i10JnvTxv8OvRblivcewDnRwt+nLKN8/0hzy7yjVX+T3fOEGswVvtE+wh/cyzyuyEynzHeK28KJDvTmbHYay4RLvdDU9kHmF9AKF01mq4w6CxKR8TQzxVv+EQ6jEMWaKJEqkPoP05bnTRr1iUgOIS5mthJE9Z5SADhdHhhsBtmSg8vGx0p1toT5RbZsjZ51U6ypOUuwRqKtwiTnZzd0zG3P/Qniq430HMsTVzWySMYxs4=;
	25:L6XI1Xbk+goBBbN9plf/3Ulnri/j9RzecLY/OMp/KaPQHp9cDXa8YnT4kfN0v3CajFVCq2CKNxtWtsvL0qc0wpBBCjfNo1JigVln2/41AwIrWSdkFTjCPgcEesaTHhmDf2Myog/lt/m2ADb3Ku54gjuBZdQs+E6Nh2/yFOQhyu978U7n4bgN+3H0k8yqgBhTtQG75wUAoK/D+EhcwSFR4VLqKoKG0eYp0vVxs0DgRIYwisUdDQecxpe6G9zIdLZjxmwWbKP5FvHTU500sg67HdsLjnSPOUCUswiYkTXUQ8CarcVnT7AWQaDrKnl2belccOTZGrOx/irNXIkJbNDftg==
X-MS-TrafficTypeDiagnostic: DM5PR0201MB3512:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3512;
	31:kQGb2zAj2cK9AqHdLWHdhYSbkcfuHixqpbX27lR+T1ckzn2+St+kJ/qAToMvRa77yJj2FAkUxx0e7r4D3SDftgKisIlXqdKTO78tzcUhkz27g6PmFI02LCk3OH/sv/2ZFu9vo4f4OMXSl+BHKfCf7UGgqiu6shJxAklth44u+2bFdsdpAc3te25baL49C66ztwDMmCc5jrjWHGrC9nYevrZUfepr/QsWsrD+bdRFI1E=;
	20:v1kfF8mi1ZjC+/Q0tdySCFpO2jFjKLAXP/UO92OG+xm/pmWi2l+BJrsstElrk9EeAm17VWIVOgiUdueEacTjM4/OXJr/FB5wPPrjZx6R/trYw+rcuCS4GRHJ1M80iEIogjzTPtj3hM87RTVto7l8hznUi4PetG/NApXxvQ30UNZQ62TdC/kZbErTxm4/3gHQCT9e9oUDQTq04nVQ1MVlmXLIgV78df97iSPk1iIE2+umgIv5V44DKYN2XIQmj6Anw4wrTuElPRyYl3bZsKrHZ4dP9uq5Ytg9HwhsITggZl0G33nIKTOhiDBYJn3FrZa1QfSSj17IKYT5Fza/xLZUpPyHm14DgORpEhgMBUu4NvLfzawXJ39DbmsBC+zz210LG2HQFOyRo5Z4eDy++cMu5nDaRAhYf8yg7X6dih+ro4J198WcnBS/nMq3mbvUuJB1VPDXwFk8ataIh4rJHD6ToDatkAd2TxZmbHpJf4fWBTvqOZsEJH1I7qrm5vH+1h0c
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM5PR0201MB35126EF1E92805A160F4032CAB380@DM5PR0201MB3512.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231311)(944501410)(52105095)(93006095)(93004095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(20161123558120)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR0201MB3512; BCL:0; PCL:0; RULEID:;
	SRVR:DM5PR0201MB3512; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3512;
	4:Me0UAIOcsF7dEd9JBXpn3l1h71g7gYGwfm1XqONsPv+VC76FgVeOIUKqf0OStUr5sqxCw8dIdkIOiX2OTEooidGj8Cgcx9MrTb88MTZdIjeTYEi8ikPmtGXthpIIkHfKaMHHjvkzhLhZv1EG+yXpg4/TLtTOeGAjSQcxNl3ttROMcsDTJTpC/ZL3BciNjdQlDJE1ffZ3zhPvTvw7O20n3H451FkKLsnWIuyWOZpm7pTl/LRb5p3JqyfGULSHQspBQTCeC4TwanUrrXewJSsu/8AuWrTEoqpQgC/I2W4NK7ipLlGsEEhwTLiagx+OCPT6
X-Forefront-PRVS: 0764C4A8CD
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR0201MB3512;
	23:ZOsqkEblVNwm7qMN1Xv1sn/gpQqqltv0sZdfkhM?=
	=?us-ascii?Q?sVOiyEPWkkyW3AIeMjG4a8hLHIyWVpH/Vg+1f4MFk2gYw+3hnHFnfNJd6Y5D?=
	=?us-ascii?Q?SIOGVaYD5n5o981TKcFXuPJwozYztfFDrjRziIv5kbO7q3ETC6Z7SNvCYBsM?=
	=?us-ascii?Q?WZNl9W+UAToKQIjqSI89tyri/QGLSlae3YkXnLvkgafCGaMiZ7DrrLW9AAZn?=
	=?us-ascii?Q?z1EkUW+qXtQMGR/9qvbJeKHgFLlVVF8n3eedQ0VjUK5wRsbESoGddvowFK0L?=
	=?us-ascii?Q?4ttJG3rREiC0pIghHnSksekYfVUTQEUmLf98SThuU519Yk0szUOUBc/ZJ6up?=
	=?us-ascii?Q?27bs/4ZMdz1LEzrvDRJL/pPu29Gte3QNmHD/rd0KfkuF3Zxrv6x8loVjA2Mr?=
	=?us-ascii?Q?L5kqqSoXbGRhlw8ebCtREOIspx5t4MmzVSCbISlepeUZNzu+rfqei8CfZr0H?=
	=?us-ascii?Q?crVQ7UPtZP4QEy1R01kzIdc6uFVcws+KweeA7abK5GfklrGsDVpywGSrZesL?=
	=?us-ascii?Q?5/x55T+d7L2N7+vRGun9Kxl8KFLB/SJRaeHvYI6yMPU6enhEnpUH8QiH/XNg?=
	=?us-ascii?Q?1ML8LPgMVnDmHz7IaTtiVrLYPlrZTBb5GS+oZiiv1/+eL/pYuWPYJa9C8fcD?=
	=?us-ascii?Q?NT9y+SEZfhyBrLrjyRf7HqeZwdMGXIzbeZB8FDoIxqZV/BHnPiAIpq7W1/RP?=
	=?us-ascii?Q?4CQlleo2Y19YiTpIOUyMIF6SDNsn07efmlT0KoaRZtqPcdvcAlU5FiPfWDYT?=
	=?us-ascii?Q?y2sKJ83ycbmCUnMtpgAEvdulAI4SAWE6Mo/gShf0Rq8n4CtF0XdtJVOxNimm?=
	=?us-ascii?Q?lAy3rHZ1VewInRjlmp1KDFU3rSNdpKhZgaDxkYKs/nMGVLvvsRd5+IMH78ub?=
	=?us-ascii?Q?86GFonIL5onur7fVkNOv2Kd+G9N+EPRzTmlu/nC0kC/+mooj/5eeky/A1FPU?=
	=?us-ascii?Q?KgKJbEGvDRVRdPsmnQpdJTPAKB7fDaLDGr5+ceAv93z/NRF55u3uAEnqQlTs?=
	=?us-ascii?Q?jsfjqchw1ZpdqRki/TK+qpSYfTRm+pdTyIGC2iG07RsnsRbutJePCmnqBN36?=
	=?us-ascii?Q?aZOPDl8J/sw+t0mk+V7wddDFeGYtP5T0NZSXp2Uyk/nJICw5jzEK4Ge+6Q6k?=
	=?us-ascii?Q?1TGB/tkYQb1e6Sz2nncPEsRfh/egD2mu8/QfmvqalWGrSzB/Yl1QdyBu2RFw?=
	=?us-ascii?Q?tdnkr3B1SAVd+8FlXib30igu/cYMJFxzSgJ9e?=
X-Microsoft-Antispam-Message-Info: EgODwQLM8VmbRazSAUHRzYjC4wpGWGI1k5smnudC7vJqqbgV+AhxNdnt0nu72KghAXikcm8bxh0BL2NlA7fF62WMcCQvHKtkC3PzQwLVszJ3/iTPvCdS46FjaGbsT0f0/xFRcpV38wMFRV63+9k1CP7Bv3GCKStKj1ohrOrW504zZmttORYT+aFBLBLaMR5CeWtNNa5rRlrYjE/Ke5s8jPTlQaYF1a5VnVElGXqmdsrSxWUjF91rrVxm5pt7g0IAW64aBwlLdwfNQLbksyKwAvb6c65sugTjZXssRWr+hgyO2Y2XCJSKCzAUw/0mE8LZ5b6Q0Z7T39IDmoghIhFw/p38nbSpvtsTcUZArutMDJI=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3512;
	6:QHLT/bnCVSLWr7XsroM4Ef80jJkaZpByyuc4+aRLtsaBYnT6nP7mLKuMMlp1IMuykZRfxIj66D1LGr3fRcuEU5EodK8JWeeIh9m4nCa1Y8QdzqIgdIwWiN2dIKu7wfsy809Q7mSlvSDFf2MR08oLiTx7oNG0NT3AggSv9HwSTLeTHNcWtpAwj2sk/gxLmdjh1GOxvKwKk8XOfBhguv8SD0pSY6szIDcPivi1NHzGwkiNpjalvqGMITRt54/vDvNHblCM/4XoyDGFLTc89BBaVncn+zlOBdPReDjV1omi7msHf7tgZBGjhCuYOZz2qAsHvTdHrtUFUTE1S6BhbEDDNb6u6A/mxE1cxx98pm4YM2D4t1vPLrsD45fepNVArI7YfWrHHcXw+M1NLA8lazWXtQKt+rP6HkAi2r48S2Wnm7tBlswU3rUTkV2OYh1S671plvgAviMMTbyTXzE2PLTyxg==;
	5:7qc5XwQt2BS2jM8sj1GcDmrQeRCD0OPLMyBzNbjkw4RizCr4i2jSyWusGU7eqJKY31Lc7Y9298StUT5UGj9GIQnYyWkm2Qk8lQGZXASTQMFkmaaMF1xNDgmVu7hOqQ1QBLHjzM9o1Cn4a3zTAMReI/QZZDP0RjX6ECr3ZpFeXBw=;
	7:epgS7X/sT1etHBAZB0lc6BJ2PSpJmuwdaVMxVrbmoWkDqpIFZEhlN4cXRy3sGqkJ75TSDs77VyxnROOkqYO6DikJWBuhDLJubcSLDIRUSbEz4ajcRzm2bcDmKGDQTyQRYWqpvHYYgOipmjeuXdqLVY8cbkTuwQL2EyFQSB5dAYK6C9JZZuXjpy11YwdCmyWu2WfxoZ8Kv6yKcuTb+h28vVrFUeaf4/Zn67DCf9PUcu7fChg28QhjA9YDDt/59t0h
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2018 15:07:13.1027 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9697d0-3cc3-41b7-cce3-08d601f79dc1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0201MB3512
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe46::619
Subject: Re: [Qemu-arm] [PATCH 08/10] target/arm: Permit accesses to ELR_Hyp
 from Hyp mode via MSR/MRS (banked)
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
Cc: edgari@xilinx.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eiv99nQ0oczI

On Tue, Aug 14, 2018 at 01:42:52PM +0100, Peter Maydell wrote:
> The MSR (banked) and MRS (banked) instructions allow accesses to ELR_Hyp
> from either Monitor or Hyp mode. Our translate time check
> was overly strict and only permitted access from Monitor mode.
> 
> The runtime check wo do in msr_mrs_banked_exc_checks() had the
> correct code in it, but never got there because of the earlier
> "currmode == tgtmode" check. Special case ELR_Hyp.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/op_helper.c | 22 +++++++++++-----------
>  target/arm/translate.c | 10 +++++++---
>  2 files changed, 18 insertions(+), 14 deletions(-)
> 
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index d550978b5b9..952b8d122b7 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -611,6 +611,14 @@ static void msr_mrs_banked_exc_checks(CPUARMState *env, uint32_t tgtmode,
>       */
>      int curmode = env->uncached_cpsr & CPSR_M;
>  
> +    if (regno == 17) {
> +        /* ELR_Hyp: a special case because access from tgtmode is OK */
> +        if (curmode != ARM_CPU_MODE_HYP && curmode != ARM_CPU_MODE_MON) {
> +            goto undef;
> +        }
> +        return;
> +    }
> +
>      if (curmode == tgtmode) {
>          goto undef;
>      }
> @@ -638,17 +646,9 @@ static void msr_mrs_banked_exc_checks(CPUARMState *env, uint32_t tgtmode,
>      }
>  
>      if (tgtmode == ARM_CPU_MODE_HYP) {
> -        switch (regno) {
> -        case 17: /* ELR_Hyp */
> -            if (curmode != ARM_CPU_MODE_HYP && curmode != ARM_CPU_MODE_MON) {
> -                goto undef;
> -            }
> -            break;
> -        default:
> -            if (curmode != ARM_CPU_MODE_MON) {
> -                goto undef;
> -            }
> -            break;
> +        /* SPSR_Hyp, r13_hyp: accessible from Monitor mode only */
> +        if (curmode != ARM_CPU_MODE_MON) {
> +            goto undef;
>          }
>      }
>  
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index f845da7c638..3f5751d4826 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -4506,10 +4506,14 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
>          }
>          break;
>      case ARM_CPU_MODE_HYP:
> -        /* Note that we can forbid accesses from EL2 here because they
> -         * must be from Hyp mode itself
> +        /*
> +         * SPSR_hyp and r13_hyp can only be accessed from Monitor mode
> +         * (and so we can forbid accesses from EL2 or below). elr_hyp
> +         * can be accessed also from Hyp mode, so forbid accesses from
> +         * EL0 or EL1.
>           */
> -        if (!arm_dc_feature(s, ARM_FEATURE_EL2) || s->current_el < 3) {
> +        if (!arm_dc_feature(s, ARM_FEATURE_EL2) || s->current_el < 2 ||
> +            (s->current_el < 3 && *regno != 17)) {
>              goto undef;
>          }
>          break;
> -- 
> 2.18.0
> 
