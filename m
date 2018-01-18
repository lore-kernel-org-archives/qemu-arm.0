Received: by 10.28.173.206 with SMTP id w197csp6687408wme;
        Thu, 18 Jan 2018 07:58:00 -0800 (PST)
X-Google-Smtp-Source: ACJfBovhmspP2LZ8LJxRLN0R9q/4StvoZGnI68qFraZolnwnMGP3Mdn7ylVjzFy6SCE2lVR0I651
X-Received: by 10.129.68.27 with SMTP id r27mr6152314ywa.252.1516291080702;
        Thu, 18 Jan 2018 07:58:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516291080; cv=none;
        d=google.com; s=arc-20160816;
        b=OsgRWkiRADGApcp4CEO02NyXDvAZCn5Mxc0rlcBGx9fga9+BXTjH7QXXyBVQzBXCLX
         hGjydIdOXk96yf2j6m1dRBdziSP5PIqjhaqpOxDRXtxWMec2L3xrg8f+ZiYlww1HYmv2
         ucNSV1IDbU95YxSW43IFmDKm8Zt5P9VlTFcxkffEydF/l94W88bnNtuUsfVBJ0Pjw4My
         BfV0+YuFk4bqmWmilEvFQ8vSiXY9gWTLBqw8w6z5FZkJgRx01vACiFeAg466ymBn0ojL
         UJjqmctdMQov7YlpWONm5BNYySvj8EG3ffn6qR0F4odn55dWeV+kiDasRmkSP9X3Rmew
         u65A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=dbi77IHqmx8TUZ65sUtl//+K2mpaOawr8HmgqB4mQKg=;
        b=bxIFjgG/RtpxFCUObWX+6q70Yy4sBi9++Y05C1ZC35558aBMnySVjqIlXa7tqSBYBU
         OWmNhbhp4xb6ObjJanmtf+gRIFmB0aehfMqfUF1+6FtZrJYL6jVm0F8g3dGEQGuqEINM
         K66j94/dlqWZ9fDAegDzFRnki4F6b8J6sUFpfvxleG1QR9dxZkTgl4OhwmNV6ifLFZkQ
         AdYHnFhk4qUZnMSuUaT9md/Wvfb3plOybH09zWKCGg9RV/IhkS3ebXsOFvgI8x6MkplU
         AIMmMFcpjGjPoXtdKDhq/Huoeo44AMgyGgscvM/rmtuY5e7yzwdl37pvITf37eEEyCa4
         hG7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=Fopxa8k3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u4si178793ybd.237.2018.01.18.07.58.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 07:58:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=Fopxa8k3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38491 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecCZk-0006aj-6N
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 10:58:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar@xilinx.com>) id 1ecCZZ-0006XF-NW
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 10:57:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar@xilinx.com>) id 1ecCZU-00062o-Qn
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 10:57:49 -0500
Received: from mail-sn1nam02on0066.outbound.protection.outlook.com
	([104.47.36.66]:56000
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgar@xilinx.com>)
	id 1ecCZU-00061o-D1; Thu, 18 Jan 2018 10:57:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=dbi77IHqmx8TUZ65sUtl//+K2mpaOawr8HmgqB4mQKg=;
	b=Fopxa8k3HCSACCwqIzdiNHDKcDPuSBGZsi2cUT0pQl9kbQYlGbdsl1UjYIR+NmktqL1ENKbqLf+qrfjh309y/iqrsQBba5S6q9JNxVghWRn3dRyE7d9FdkmjnhogKDdJjF31Ye/wq4o5XFiV4n5BvZuA3txmT0kNkmv6lEzVpyo=
Received: from CY4PR02CA0027.namprd02.prod.outlook.com (10.175.57.141) by
	BN6PR02MB3377.namprd02.prod.outlook.com (10.161.152.165) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.428.17; Thu, 18 Jan 2018 15:57:38 +0000
Received: from CY1NAM02FT023.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::203) by CY4PR02CA0027.outlook.office365.com
	(2603:10b6:903:117::13) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.407.7 via
	Frontend Transport; Thu, 18 Jan 2018 15:57:38 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT023.mail.protection.outlook.com (10.152.74.237) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.428.12
	via Frontend Transport; Thu, 18 Jan 2018 15:57:38 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:37163
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar@xilinx.com>)
	id 1ecCZN-0006FZ-Jz; Thu, 18 Jan 2018 07:57:37 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar@xilinx.com>)
	id 1ecCZN-0005Yl-GO; Thu, 18 Jan 2018 07:57:37 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w0IFvTw3002100; Thu, 18 Jan 2018 07:57:29 -0800
Received: from [172.19.116.156] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar@xilinx.com>)
	id 1ecCZE-0005XX-TA; Thu, 18 Jan 2018 07:57:29 -0800
Date: Thu, 18 Jan 2018 22:57:28 +0700
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <20180118155728.GK5516@toto>
References: <cover.1516144891.git.alistair.francis@xilinx.com>
	<63f5e8b2687502e1d6c53e190869e88d134f5f14.1516144891.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <63f5e8b2687502e1d6c53e190869e88d134f5f14.1516144891.git.alistair.francis@xilinx.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23604.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(396003)(39850400004)(39380400002)(376002)(346002)(2980300002)(438002)(199004)(189003)(9686003)(1076002)(39060400002)(23726003)(478600001)(33716001)(5660300001)(229853002)(6862004)(2906002)(33656002)(77096007)(26005)(106466001)(6636002)(33896004)(2950100002)(76176011)(6246003)(46406003)(63266004)(76506005)(57986006)(50466002)(8676002)(36386004)(16586007)(58126008)(316002)(54906003)(305945005)(8936002)(356003)(575784001)(81156014)(81166006)(9786002)(230783001)(4326008)(83506002)(97756001)(47776003)(106002)(18370500001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB3377; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT023;
	1:ejY+md754sw0dlsprnRe+zw7WA9AesfNcc/yG/Ws9ubx/7X3juU1fgrxi/3ROJ2wZgcRPRSpQKNMu+H/jAvMSUcHghNIuHmcXcv7x79+5pqQgIKec5JehUBFABCwDoMI
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5901eba-b74d-4f0a-a5a4-08d55e8c32e6
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:BN6PR02MB3377; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	3:w1STcbpQZPht3vJkPngtOiTx4JFFt6yVVX6u3hYpHX9MTalMumHiv2fmn/joGWxED7i/9elcsmb9JsuVIywKpxTakOnVQJn1N9zNjJv4mjpuouPKQHfbPdmjOfhWbdcXG7PvEe7Jibt47918jk4Rx83tlzEXKVll4bg0zQKX2q7Bv/0jZILMDrXb5yL3gDPdWNEy0ItaqY5uOHDTP/1tulNS1kuS35oLwmezmtQJ2c18ir/41VBF3VNC5pg874cazyaWINHgkQp99QOF3Izu/g+trU4PaqiNFQ4xXRPTRs+deWXCVGsceX3jn/3yCIVSAiYkmMrRa9dM0yB8HleiSYrfrz5/3I6D4Y+H7a6ekvU=;
	25:408C/wSlqlr9wf7zc9VY77Gy883LuLqM9NY3QEeLTkEeOrAbdZ1tznzBaqijmNFeqQCCOy8duWx0S79hvfsHeof06YKrpGy8NWtOQrxU6q+Afm6CHjKJZsp7YWv8MozKBWUNWsmjwZXnYOssxcELfEhk1tRoOhOpYx9bWhzbdlwXirm+5riHVpcY69MUVA6C1/NgJ9qHKPhS5NtJBAAEZChmv2MWBb7WJ9eVd+LH5plQj3hu4wakRxPJIuy0wOU9jwLx12BYYkRC/WaG3wYSJ5k1Ti0Gqtq1tCsb4cWRDw143fCmUDFvdAGQQCEZgs6OiGPn88mp6Oym3L7OLGvfUw==
X-MS-TrafficTypeDiagnostic: BN6PR02MB3377:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	31:ZvOt/rRSyVLuR9NbMmBJGifTDi0+3Z+lzp2DD1l9fdKq1eVRMFHmsDjoe3HYkKDd+5zBUE14Tg9ec6Cov0FZ4w68O/05svxhYBMYC9InEWFfC7o6CuQRqyhjsE6xhCL9pvB0pAjgpO5APrwaFd0w5PPp5BDXDGmjM8O3MCXGCtC58gPztHhaU9fIhv728vFEiHNOyi2QlEF0LG26leZahqcN6z+q+CLU7htSznkRlfY=;
	20:n4i6KfK0lFKRAW9YoTTF+eM0sqoaUfz+4O/hbd1kNXz2Ays6A86/nXvE5GHOoKyjsB3xUWhinpvK/AQnOI6KStRhoEGYRzqZWPwqDhMl1E9m5+u6GS3mODb7YQaNNn9cFOiHBm/mff3Dh3SBS0x8+0ZYKY29Id1g4GSa3PsylH68SQBEdfMjY9ytikRAdQDvigXGmySfMfd1EX4+gvX0m95P5Rf3RxGTEP6Crperi7Fux15TygzA0OsWEHrlsRhNQbbBY3d/MZB8Bp4ov8w0xyJHPr4VNsLxfpPJtKADWhuQGOfit3QJSFq2BDFQo4eSVa9iu2/rH0vG2cvtkqz+xxTgIPOtJFnBZopBel0G7DntcutSBDtpvKqEuBLU0gQKtvE4QffQY3xlyOFm9oxxnIiZJOy/4Pj/on3QWUbVJqhjpRAkP745++l+6r80agNOp3VStqmlDyYy5KnsmD7KmJ3ZgYRGRUvLMXGULdyM+WTuUfw8UjOngczOZFnymGzE
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BN6PR02MB3377AB0B0C7A232F5672EE68C2E80@BN6PR02MB3377.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(21532816269658);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93004095)(3231023)(2400063)(944501161)(6055026)(6041268)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:BN6PR02MB3377; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:BN6PR02MB3377; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	4:I8ZTfItEP5cU3RskGYQ2mNSMheSl7/MdTadA6CPO2G1updQ3Fj6Sw83iGQlANZHO8+fDKcl2sOzNHjS5SDLhH8WLAulyq6UegrhzQc6kAjcxufpQ2FrUA47D1HHMkz+Ae87Y4Dwqq3em3m4G9/EqTNcH1xS4xVcv1uPt9Ynpv+05dPSfZ6ZARF8ug0iuDTMJm94tSkYVVGoVLt91PNlEnQsAksxFvNet9V1px1J0E8sDZ0tc7fLJEY3ZWVwvKbxGcU6d3c6xAGffGep+zturKz/EeA4agaINar/Oq2ozlKmueG/ktypNTtNYH8K9Z2aroJ9Szto8rRZ/CAkU8IJ6e0/36cJZyo8+QugOlgsKV5I=
X-Forefront-PRVS: 05568D1FF7
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB3377;
	23:N3z27FrfjTKRywn8xYLQhOsLArM3agldlgHJ0SbI/?=
	=?us-ascii?Q?/fKLxWuXt962snLzDZy4I9JWh5wALICC5xCM0BwadiAQ3CV1Inh+tS2rZnwH?=
	=?us-ascii?Q?1pHwr53RozspRDEnWm2zTzz4jocreqYwklH9rhLpbO4rLJZ5z2u2Q1qRPRG7?=
	=?us-ascii?Q?bWlEdbvgSilEMnvE+eCpBQ6qnNroraaXrdCwb+aDN6yDafEFKfPTa6hOMKhu?=
	=?us-ascii?Q?D/4tsqxIBcVtiMl2lszVdjlkW9gGhF/TLpKXJdeEA8aL6WcoCSj6EBOqjzYN?=
	=?us-ascii?Q?4mrRKgdyIWruXPl6s9e9FT9ta+JaF3mD3XurM7BcGQclWHzQ0CnNWYd/iRPO?=
	=?us-ascii?Q?gFcxVI2sHpZD5+076O8TupW2j+vEOOEAlK4rcUTz8UDyhIbM5NuVITlsBRpN?=
	=?us-ascii?Q?pexhn0YXGiXRr/9wXbZAZt33cN4IFLCOfrrcsFWTenZ2Yb0CJ5Scc0UdlwEo?=
	=?us-ascii?Q?ozCGF6Fu6I3SorZPzOtV+yXvYAfJvvI1DNH8m4scEW9/YaR0BYJ2wqE0I070?=
	=?us-ascii?Q?5Ce9pFaMOCTbScI7DV3bSdxwr/VdXgzrVXT7DNvjBUHaMu3IC6Q4YGyX5Gcu?=
	=?us-ascii?Q?g003LUdvX6x2J5QlJ8zZ8obETiV3rJYRZZ30lBBLBaoN24h1/jtci/HVtcyS?=
	=?us-ascii?Q?l9UcfdJfrGDuGGHjD5lBuTjo9i1b8RKn14LvQns6/mA4kpA28+n5cCVdO6KM?=
	=?us-ascii?Q?zmy49dxlidFv46VIVQz6L8B7ZxhSrlorFU4ifBNpl92D0UIH3pQRwymp/HhN?=
	=?us-ascii?Q?0brPrXkggMpP2TYQLW4LxrWy2CGxpSWgiZz+lCFfRDAffhLizX8gJi/qbSpp?=
	=?us-ascii?Q?lJUvyN5Bo8BYs1LrFSmGI8G5sg5fNq2JQVIwCnCbkZiB3ogVRMrn5Cc5NS5C?=
	=?us-ascii?Q?BO9CEHza2XfV5UyH/Q1W9uZsvQK8m5StOWd1S6UC0cq7JX8EKOfR0wBGYNWl?=
	=?us-ascii?Q?HNKLkrJyw/kWoaVi80tKwtCFYAaP5DXMkes9afP67ZZS2Ll4jWyZvrD85Jrz?=
	=?us-ascii?Q?WXfXX+QgyvLUEzs+4TaVFfpvTkUN9Mf6wBuinbBvKKJ1lCGSfn3zaN7eJ672?=
	=?us-ascii?Q?xzwsNPTMICY7BEd/L6cCWHgs5ZaYmmAFbTUN1Ph3JunBmGwqhEU6jBoWyEjV?=
	=?us-ascii?Q?iSg7F2YMXKumLBIZTIUfyQKgwaZZUmdCNLaR9wqnX1tyUH46MS8LQP0pVwNm?=
	=?us-ascii?Q?rxnZJgk2sNO+zjRdGNnocNE0z6LG2j3+7BIhO7vhvWglKVIMbbW2vXadOWye?=
	=?us-ascii?Q?xo6lJDWtRYbGg4VABjBYu5eMrg/TdFkTS4TBDzCYezsGoOsOGtAOHkY1Plbt?=
	=?us-ascii?Q?f9tytyYOe6GKgJlXda+AjY=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	6:wdwmS4vCj4/fT7qXH7TpkDkOmJ1BHxqRilLvVKrqGa5enUFLrlPjthOJ3/0we0OmehULaFN1MjpLkOLnQJywIiHr9ixMqjkW9ahIVgUwotZQRAqDulrASkch8yyJHATo/vsEC9S+2Tgw+xsrNcT3Feti2eFOhH/Lc7Euq7vyNgSsshOFAC/vbfd1Fi+X0eszefvNJrN8hHPFEYh8KltqSWj21k40WonOzpCKWNayyP8lXhlreM8uAyzWVu6z+2KUtLRN+hBaoUbsRY5lRPXoLUZtXC+wbAojcH0zLQVACvy//Su+0PmMctcRxnWxjrXIRgyjMSlxFgx0g6s5DGphuKQ0aOOOJcG7PSXRulY8lTA=;
	5:3fHbm40VWDTbi3utSFB1IXIWLURCQZT8aHVMjEo8nZCSFe8xRgJKUfKtZCViFw5NI0yqEroK8LbREuY11QiiBV2kCiIdRxDooDO0dw9UkaRtMtc1jlbo3FwC0J9CIw+A6HMJe6Vv1AahP6ff8hP4Ng3T894dmdfsLg+r6V7tKos=;
	24:LbXqNpADrV8O5g0qGCmtTooCVvReZdFYrH7SLWUpjRF4CwNG3qDoZgOt8j9B3GoP4x0piUn/YrI3n8WGZmFY6owG15qispgw3ovzQOeo1Qk=;
	7:ZfwqN1yQDzv3G0bfAznD7cn+AHaJm/1DwYDqC3ub2YRc8iJ+NyNoaKvEvR+Yn118NEfBarEl6QnUkQ3BimBWA+io66WyH8lSMuup772ExpW+CMMeDGUK10cx4YakGeVBxNJ1eeJGnSstvP9i1z6dneNHuicblMDXpFlyVFY+ITjmrWKOPofGd6gmItjXu064ulVaIgCf/KgE5kBfDPbQG1Fy3JgwWd3eMdTWeCv6hIJwnFkBDuOax0CQZdnXwlkn
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2018 15:57:38.1920 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5901eba-b74d-4f0a-a5a4-08d55e8c32e6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3377
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.66
Subject: Re: [Qemu-arm] [PATCH v5 3/9] xlnx-zynqmp-pmu: Add the CPU and
 memory
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XE5wo7Q0sFBH

On Tue, Jan 16, 2018 at 03:22:26PM -0800, Alistair Francis wrote:
> Connect the MicroBlaze CPU and the ROM and RAM memory regions.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
> 
> V4:
>  - Remove the ZCU102 name
> V2:
>  - Fix the pmu-cpu name
>  - Use err and errp for CPU realise instead of error_fatal
> 
>  hw/microblaze/xlnx-zynqmp-pmu.c | 70 +++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 68 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
> index ac0f78928a..c6a0b3b8a1 100644
> --- a/hw/microblaze/xlnx-zynqmp-pmu.c
> +++ b/hw/microblaze/xlnx-zynqmp-pmu.c
> @@ -18,8 +18,11 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu-common.h"
> +#include "exec/address-spaces.h"
>  #include "hw/boards.h"
> +#include "hw/qdev-properties.h"
>  #include "cpu.h"
> +#include "boot.h"
>  
>  /* Define the PMU device */
>  
> @@ -27,21 +30,56 @@
>  #define XLNX_ZYNQMP_PMU_SOC(obj) OBJECT_CHECK(XlnxZynqMPPMUSoCState, (obj), \
>                                                TYPE_XLNX_ZYNQMP_PMU_SOC)
>  
> +#define XLNX_ZYNQMP_PMU_ROM_SIZE    0x8000
> +#define XLNX_ZYNQMP_PMU_ROM_ADDR    0xFFD00000
> +#define XLNX_ZYNQMP_PMU_RAM_ADDR    0xFFDC0000
> +
>  typedef struct XlnxZynqMPPMUSoCState {
>      /*< private >*/
>      DeviceState parent_obj;
>  
>      /*< public >*/
> +    MicroBlazeCPU cpu;
>  }  XlnxZynqMPPMUSoCState;
>  
>  static void xlnx_zynqmp_pmu_soc_init(Object *obj)
>  {
> +    XlnxZynqMPPMUSoCState *s = XLNX_ZYNQMP_PMU_SOC(obj);
>  
> +    object_initialize(&s->cpu, sizeof(s->cpu),
> +                      TYPE_MICROBLAZE_CPU);
> +    object_property_add_child(obj, "pmu-cpu", OBJECT(&s->cpu),
> +                              &error_abort);
>  }
>  
>  static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
>  {
> -
> +    XlnxZynqMPPMUSoCState *s = XLNX_ZYNQMP_PMU_SOC(dev);
> +    Error *err = NULL;
> +
> +    object_property_set_uint(OBJECT(&s->cpu), XLNX_ZYNQMP_PMU_ROM_ADDR,
> +                             "base-vectors", &error_abort);
> +    object_property_set_bool(OBJECT(&s->cpu), true, "use-stack-protection",
> +                             &error_abort);
> +    object_property_set_uint(OBJECT(&s->cpu), 0, "use-fpu", &error_abort);
> +    object_property_set_uint(OBJECT(&s->cpu), 0, "use-hw-mul", &error_abort);
> +    object_property_set_bool(OBJECT(&s->cpu), true, "use-barrel",
> +                             &error_abort);
> +    object_property_set_bool(OBJECT(&s->cpu), true, "use-msr-instr",
> +                             &error_abort);
> +    object_property_set_bool(OBJECT(&s->cpu), true, "use-pcmp-instr",
> +                             &error_abort);
> +    object_property_set_bool(OBJECT(&s->cpu), false, "use-mmu", &error_abort);
> +    object_property_set_bool(OBJECT(&s->cpu), true, "endianness",
> +                             &error_abort);
> +    object_property_set_str(OBJECT(&s->cpu), "8.40.b", "version",
> +                            &error_abort);
> +    object_property_set_uint(OBJECT(&s->cpu), 0, "pvr", &error_abort);
> +    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>  }
>  
>  static void xlnx_zynqmp_pmu_soc_class_init(ObjectClass *oc, void *data)
> @@ -70,7 +108,35 @@ type_init(xlnx_zynqmp_pmu_soc_register_types)
>  
>  static void xlnx_zynqmp_pmu_init(MachineState *machine)
>  {
> -
> +    XlnxZynqMPPMUSoCState *pmu = g_new0(XlnxZynqMPPMUSoCState, 1);
> +    MemoryRegion *address_space_mem = get_system_memory();
> +    MemoryRegion *pmu_rom = g_new(MemoryRegion, 1);
> +    MemoryRegion *pmu_ram = g_new(MemoryRegion, 1);
> +
> +    /* Create the ROM */
> +    memory_region_init_rom(pmu_rom, NULL, "xlnx-zynqmp-pmu.rom",
> +                           XLNX_ZYNQMP_PMU_ROM_SIZE, &error_fatal);
> +    memory_region_add_subregion(address_space_mem, XLNX_ZYNQMP_PMU_ROM_ADDR,
> +                                pmu_rom);
> +
> +    /* Create the RAM */
> +    memory_region_init_ram(pmu_ram, NULL, "xlnx-zynqmp-pmu.ram",
> +                           machine->ram_size, &error_fatal);
> +    memory_region_add_subregion(address_space_mem, XLNX_ZYNQMP_PMU_RAM_ADDR,
> +                                pmu_ram);
> +
> +    /* Create the PMU device */
> +    object_initialize(pmu, sizeof(XlnxZynqMPPMUSoCState), TYPE_XLNX_ZYNQMP_PMU_SOC);
> +    object_property_add_child(OBJECT(machine), "pmu", OBJECT(pmu),
> +                              &error_abort);
> +    object_property_set_bool(OBJECT(pmu), true, "realized", &error_fatal);
> +
> +    /* Load the kernel */
> +    microblaze_load_kernel(&pmu->cpu, XLNX_ZYNQMP_PMU_RAM_ADDR,
> +                           machine->ram_size,
> +                           machine->kernel_filename,

Hi Alistair,

I think I forgot to mention this on the chat yesterday but I think
this argument is incorrect. It should be the initrd filename, or
NULL since it may not make sense to load an initrd for the PMU.
Can you fix that up?

You can keep my R-b tag.

Cheers,
Edgar


> +                           machine->dtb,
> +                           NULL);
>  }
>  
>  static void xlnx_zynqmp_pmu_machine_init(MachineClass *mc)
> -- 
> 2.14.1
> 
