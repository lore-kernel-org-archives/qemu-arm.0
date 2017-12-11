Received: by 10.223.159.74 with SMTP id f10csp2326189wrg;
        Mon, 11 Dec 2017 00:48:55 -0800 (PST)
X-Google-Smtp-Source: AGs4zMadMUrhrXzjdf7qlj/WpB4OnTdTQUryhzMfGmywBcJjFf6VrBgc3Ky1BSGpOZ4PxFCQu3FL
X-Received: by 10.13.221.133 with SMTP id g127mr25908892ywe.125.1512982135601;
        Mon, 11 Dec 2017 00:48:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512982135; cv=none;
        d=google.com; s=arc-20160816;
        b=kn7vnatBRQzYDb1g/3tL7335TYZinjQa1pJQWI1sKIKjh9F4QjM7nLbnb+/p3xmkir
         NNXQrc+y6mhh6iwSnF2ooMTs3NR7XrycIRdYFglo4WoSk5E7pj7R4SujFuK35uBMSTbZ
         Uyw0xCuyz/DlC1OXqO/2jgE7Nf5Q3u3uudEADn2hkUiJ7pgUOIQmfs0c+iqVRBNEhlTy
         L5/afjbQLw9Thlnf8LU2hbZTEtKYJ0KUZSwHScM+6vqVrlfqAsHAuvyWJhnwXx4wowlQ
         4/v9ZfExuYPxMqHVKsDBE5ErVPJ9DtMzGU5Gk5+ZwMDckw406i+sYzOVY6FQnY+T0U1J
         nPNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=qPHNL9KNRiPfhQMXq/fGV/JGeQaQEwzSCySmIcqHaTI=;
        b=PI6Yis6aV6xTLXMr9GD3qYJ/TlDliIT2tqjkDCUCSl6NMR9+/TetEuPz9gd+URgKGW
         75qqqAi+tOvEfd/zicUauwEuOfneAEZtbv/+PbCK7wi8CZBU/blGCskF2Et5zhc+UrHk
         dCLD84uiKQ0evYkgG9d8mq31CNBEXBiSyeTTkAIEqmDh+LMssxGlaXezdKgUDMF+Z/Gr
         VkuPD/OqxDTCd176lg9ETueAq+gUqgIzoCgpqP28VIuYfoi7pVxx+n8nMDSWyjD+cfAf
         oE2eIdmAHGOATmU3PVWUwbH9AnIdk08tpt+L0FpRIFKho62CkJGsvHjEomMNMgHxIVuO
         Mkng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=3Lc0tdZi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h9si2863674ywb.788.2017.12.11.00.48.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Dec 2017 00:48:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=3Lc0tdZi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51759 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOJlf-0000n1-0L
	for alex.bennee@linaro.org; Mon, 11 Dec 2017 03:48:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar@xilinx.com>) id 1eOJkd-0007pK-S9
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 03:47:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar@xilinx.com>) id 1eOJkb-0000Y0-Bc
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 03:47:50 -0500
Received: from mail-dm3nam03on0054.outbound.protection.outlook.com
	([104.47.41.54]:58646
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgar@xilinx.com>)
	id 1eOJkU-0000RM-Dk; Mon, 11 Dec 2017 03:47:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=qPHNL9KNRiPfhQMXq/fGV/JGeQaQEwzSCySmIcqHaTI=;
	b=3Lc0tdZi8M9G1jmHbxJPYA0o/AHj8G6yDFsVlALPyS88f95Y9pefPeK1WPH7WsarQt3DuiZ9x+MxKevqabu+psDWtffgxhDDn/VbQqN6qH8ervGQl+CkGX+eiMNqvG3BqzQSHzw/oMFiWa+pXWzh1UnDC0NiAo+A0z599QP28Z8=
Received: from CY4PR02CA0036.namprd02.prod.outlook.com (10.175.57.150) by
	CY4PR02MB3383.namprd02.prod.outlook.com (10.165.89.154) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.302.9; Mon, 11 Dec 2017 08:47:39 +0000
Received: from CY1NAM02FT035.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::200) by CY4PR02CA0036.outlook.office365.com
	(2603:10b6:903:117::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.302.9 via
	Frontend Transport; Mon, 11 Dec 2017 08:47:38 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
	header.d=none;kernel.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT035.mail.protection.outlook.com (10.152.75.186) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.282.5
	via Frontend Transport; Mon, 11 Dec 2017 08:47:38 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:42236
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar@xilinx.com>)
	id 1eOJkP-00060i-Or; Mon, 11 Dec 2017 00:47:37 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar@xilinx.com>)
	id 1eOJkP-00083H-Mp; Mon, 11 Dec 2017 00:47:37 -0800
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBB8laHg030431; Mon, 11 Dec 2017 00:47:36 -0800
Received: from [172.19.116.86] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar@xilinx.com>)
	id 1eOJkO-00083E-9i; Mon, 11 Dec 2017 00:47:36 -0800
Date: Mon, 11 Dec 2017 15:47:34 +0700
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20171211084733.GC26889@toto>
References: <1512503192-2239-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1512503192-2239-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23522.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(376002)(346002)(2980300002)(438002)(24454002)(189003)(199004)(76506005)(1076002)(305945005)(6246003)(6306002)(6916009)(4326008)(77096006)(63266004)(9686003)(57986006)(83506002)(575784001)(478600001)(229853002)(106466001)(46406003)(97756001)(2950100002)(81156014)(966005)(81166006)(23726003)(9786002)(2906002)(5660300001)(33656002)(33716001)(47776003)(8676002)(76176011)(316002)(106002)(16586007)(54906003)(8936002)(58126008)(50466002)(33896004)(356003)(59450400001)(18370500001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3383; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT035;
	1:EkYHxmHtrfVxB1lRxXe0TrggxQL5JosY3pcTLJ6zuhZyj11cTE346tT0+qZijh7X39VvtrTxuNh+9vEZIY8dyzb/uTSihFajusuJxw0ZWxIpcOFWjzu0/O5/V1EPc2uS
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8137526-dfac-47b5-fbbc-08d54073d571
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4608076)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603307);
	SRVR:CY4PR02MB3383; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3383;
	3:PlsqjF4lCo9uEgLuS02U0t1oiggRkiylTFx1cwkognlT8vrNhSZhG6/wiwBpr2Nc+afXWBzG/ob3LzBs1og3YStglj4MMfNIPUYDhfTEphdsOcjUg5QFdz2OOACcTxhDIm3/IbVFt9XZuOQWaDD/OWnia0UYOk2FH0Rtt00iQbmnURsQT9m/sO50nGYAcMfIe/NLKrQzvAhMWAFJnJtFj5dgJfLMULuRziRpFnChu3tWErB0kCkZ2df8AQgF/qegfXf1KDGwrjo0ZSBLGtgvyq0OioWXI/hLuH6wqqs3fhceBMnYpCr9Y1omdQs0O+H9nhhBHuDYruHPcpVXQThSRAMfUkc0UNsdtOj56BWcys0=;
	25:r2i/mOGwkyhgIa2kRBYqbg7hpxjQlbthqxNT1uDecdhB5tTyf6Ti9P8yfu+umDEaGit6r345PhlykKHqbnAHGAYy8Wl0899nTDhcYn9KXSlhIYXH/NZGAm7XP9USJ0X2ZKHSbqgnIdKEBV0nMStM3wmQxNJVvj9POlwwIHTNuo9G2QDNJzS9agL0JLjkm7kt8WsadiODPECuVuMtjuLh6WkOr1znzO2z9mjnQXUw1GS/U65wa/XGYzcVQUf1sHRP+pE9YaTNLh/tBr6LKo/E4g1y4swvE6eLkwsa/ywFSrJQkTV2cDvA2WOgugKGgmGCpYv4hOg1CNd3c/NlB1ZB1w==
X-MS-TrafficTypeDiagnostic: CY4PR02MB3383:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3383;
	31:vUYBF8vWQl0NasvxFcMwnB+SvaGsqEBJo/c9bTSAwHwOqW9/UTSLc4VZts68OWPxvTboJRdDx3ZWTV8+PKg95/VvffXs/fM2df8nDMq8bplaURr99l+Tvqc15yfs8rDDT2yPa3BvA5bDu1rQXlQRyo2y6heCMIxkQ4VkT9nxJ9rfx3YtplAhMSq/+7ir+fraQ5elBTLPS2aZpobQcWgT5aGRFWwu+WV2RAho7Hcdmqs=;
	20:KeQaLGFh145ACEEdN16G+/gBTbuxCZ9QLN0f1/AJhvWAhPDLcFyE0Dbn5NBrxF88XgFWkDa9PZz2XLjgKwv26p0CuujSKdcjt3XTl5HnrzJDdsWyvZpO7+jIKDCd1ikU9DK37r6p7rUhwLjAFT/kvCUaQiAjvibqCOXwiURkgwWrHO/lRDw8qdfMUZ9v2CjPniPsT7RTp2lJVW6IvaNq6VPp+5WxzEZa2JnRfmV9oxwmCXuMQk4PNfdvneaT8g4whh+548PeTnZjH3OHjuhifLgUEFELsTrwDlHIIL9jmOqckn3vcatQD1TVYwFVEWYAe31iJT/WI+t01kZQuFWDbOxxRGeeRHZ8pU2jorOSw91tLjXIw202R3mZRJx3rDRqoW8ZRcAQOg4H4ScfrEiDVG06c465Mk7TOIaM1YAzu2+nWPL2iVPz0l4lScaL2LuTTM5wcfHW/o8YqPqUUyS0F0e6v3qJk5zzwPMKh5u2Fi7IZEpjlQ4DA32LERMfjhUz
X-Microsoft-Antispam-PRVS: <CY4PR02MB3383F69B97615C403B4D470DC2370@CY4PR02MB3383.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93004095)(3231022)(3002001)(6055026)(6041248)(20161123560025)(20161123562025)(20161123564025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(6072148)(201708071742011);
	SRVR:CY4PR02MB3383; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:CY4PR02MB3383; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3383;
	4:15U+TYEYcfQEOtDJQHJcbTraiw+MyCHm84v37hoYfnSrtzS7nJe/Cfa6mu1pDbfWrTdMsam3Hl0JdrmwcjlhrWP3inAI3dAnX4JgX0fk4BFf91TAm2Bb8I4H4Kmy4bKCVgENqf8w7VBytFfx333O6CUDXeUtb8BJhPl82PQWiNbkk65MSGEPHHuGRlVDjT6KvUq4RF9oh7P3yJ8eU49hCaSQD+MUIWB9kpYQGpLp5JTxTR9uEM4kPuhSMOkq3YTRG1hpweZ9QMkJdtQsNY98og2H1Zb8BiS9uniSVg+o21qlhJ89JLtI09j5qsv4fw99
X-Forefront-PRVS: 0518EEFB48
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB3383;
	23:4U462wkIYUYYKlN7JzPW+UXTQOW6nyPHN3Dj2zO/y?=
	=?us-ascii?Q?7EAv8sd86rpdUu09XRsPI2qAmoOtQ/8J1eYPgKNA60uE8o0tQwdHZxI4vZxQ?=
	=?us-ascii?Q?3mNax2wuTzXL4gOuJulbV7OL4zRCEPBT2hCSqVLGwwPbLIJ3ZiOTtExXCdg3?=
	=?us-ascii?Q?JgqpplAKrV0eBxC5UMjAWrLbqv/QkMH8VvezA4ft2FfqqqXXKlBrAFN1Hgp3?=
	=?us-ascii?Q?IxTC1//nmwa0/Rw6aYEKTuYgK4jbhYaijOA4/pYfNyVXCFgQMhU+VJwpbJQV?=
	=?us-ascii?Q?qGpaDiyh8g1cHvpdytQqAcUNYSYwcD9n6Qb/02fL4qjcNrac1eBqhhghdrds?=
	=?us-ascii?Q?7oNrLHeCIxGFBK0fIToQZ+b4W6gHH0oxlO+aCvNXbORG0diDjRUCnjkPq5mX?=
	=?us-ascii?Q?2yq8z5i6dLxzLpmt2OV7/uHdOT3vvR0bgYMCp13CRq/sHtcTe+8NTyA9y/M2?=
	=?us-ascii?Q?VwU3vtwdQ1cUvc8A/0xM6NY9R7crFiFFVu4c7hySa1OMi4ogh+wB3nOXMErk?=
	=?us-ascii?Q?Gcj9tMlMYhuJ8wtqsERp+juI4QmE/00poUzXw8pSSuzPkItIgAqiR8vAmSMb?=
	=?us-ascii?Q?ySEUFcpTKRGaIJzHuE7uVkbGA5zXd7Ii95vQV4EPdU08EhgctKGvXPim8HmZ?=
	=?us-ascii?Q?gDcgwihjBAWTmi4q49C6MKyoLwSQQsFlFRiH28X7J/uv3si1PCyB5S35QvPD?=
	=?us-ascii?Q?NLb3roMuIoDAzYir7jyfEuOgJgbDM775+cBHQpYv61K/h9rXNpkuFndh1Q57?=
	=?us-ascii?Q?0Vl9UwUuBSCLVgRc1Xq/dwPpDISCKsM8PNDhfudXnB0bOtPFw9xF/KJXLUWk?=
	=?us-ascii?Q?GSB2yu+Sc8WKkzAWO6YWA+SX6xjq2oGj0vDFNizvbvAsrObt8f7CXJ8xesAj?=
	=?us-ascii?Q?b/sTN7fDk2WiwpWcIUmgxrEz3F3LeeyD5bDKkqTtohU1Bp12a0qY0BcbU0zx?=
	=?us-ascii?Q?FI/1DJnminRbhBU2o/C+ABNEyqOOrzvG59VkDz8bIKinH/7pdqzemRGexTTP?=
	=?us-ascii?Q?vDJVntNP8D0zjvizlWEQ+woOrj3nvXZzQLte+I1tI3MFe7n+yVRn27V9EvK3?=
	=?us-ascii?Q?V+RhoBFESLmYYYoLVe8hBfNZ8S7G/nrwVcTd/2TfNDereEkB1qCZlc4ZJPAO?=
	=?us-ascii?Q?wVg9DKgekNZpN/7i/NZQBbEcfxWuLFWZXPFN1z7zYhT5uYOiVPoIgYwvodux?=
	=?us-ascii?Q?V1NwRvbq9TfRLv6282h3heRVX1gbSn2ZpS5eYlBmGsmp0a6Q7+NvdEeGg=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3383;
	6:hzls8J/eNkmAj07yCaUuhupgmUAZczStBUk29dx9hbv+by+6xx4MYLlM4FZcSlUYUjJNRgWjymmfrsbDh1kWJxpAlcxbNdRwr0mVxDVggLM8I+aVEO2Ei4OUkS+jXrNzSAfAuNvLHje2Dc5aGXU5YeRxM6CqwKcLDNO0cu+t8aln7/iAKYZOqJ6ydOcjupmN02M1O07pguDNTpUeI5rPt6mfDsrjWgc54CCkdl4sWXyjOKtf2S2e4RxC6gwYLyxlCfzqUtFJsl5YVs+ygEBlMoJC5eFZcBAw7kwtOYlhSDpDkyG3Aobv1szMFFbfqGOgxTCZb9zsWRBtO3rvVnRT7okrbwYgoN1GgNk60a4cZ+c=;
	5:10yHEWpKB7PHYj/EU6SsudSSjfniPTok0OIGPPrq7sam29AXOhhz7Y8J5Hwv00s8mdzL/srIgIkwattLUh80eyz3sXQSqnbBxa2ENPJaFNl/zvYDZwcLoPAZA4O4d38hvxgMCGd9c76MAgn42v8SiZO9zgacBvo0ddU2GUCEX8A=;
	24:Wbc09PIbo0pAXVTFRzLrPlt9Ik58hALOQ+JacFjcsDkkf/K6dc+r+EtYaQJhz5qQJq6FuSpCijE85MMBeBrosaaBMXJJC33J0MkRKDmCXz8=;
	7:/j48RbnFp+O6QMjaGrwYGDmcamLelK9d3FTAg+XX306Nv5uSCBGMVvoIQO022WQTzYq1sKmoN2JCEm+FB5Igu4JlJvdE970+akEQi2/Z7f6GGEZTpEptM8jux+CIhOpLYx0ratHkJ3fHdR/Kr70VIux9pHLfM8nRJpm+Eje/t98/sLa37EcMLjCm3jcoND0/CF+hEast9mNYDz1zSBRlAqWoOhaqmVz31EUeQHykL/UeIzVcE9QZGSWMcAQ3nz3Y
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2017 08:47:38.5320 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8137526-dfac-47b5-fbbc-08d54073d571
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3383
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.41.54
Subject: Re: [Qemu-arm] [PATCH 00/12] Refactor get_phys_addr() not to return
 FSR values
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
Cc: qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jmG/nK2VgnAC

On Tue, Dec 05, 2017 at 07:46:20PM +0000, Peter Maydell wrote:
> Currently get_phys_addr() and its various subfunctions return a
> hard-coded fault status register value for translation failures. This
> is awkward because FSR values these days may be either long-descriptor
> format or short-descriptor format.  Worse, the right FSR type to use
> doesn't depend only on the translation table being walked -- some
> cases, like fault info reported to AArch32 EL2 for some kinds of ATS
> operation, must be in long-descriptor format even if the translation
> table being walked was short format. We can't get those cases right
> with our current approach. (We put in a bodge fix so we could at
> least run Xen, in commit 50cd71b0d347c7.)
>     
> This series does a refactoring of get_phys_addr() so that instead
> of returning FSR values it puts information in the existing
> ARMMMUFaultInfo structure that is sufficient to construct an
> FSR value, and the callers then do that using the right condition
> for whatever they're doing. I've included Edgar's patch from back
> in June that fixes the handling of ATS instructions, which is most
> of the point of the refactoring.
> 
> Rather than doing it all in one massive unreviewable patch, the
> series is structured as:
>  * patch 1: add fields to ARMMMUFaultInfo, and the utility functions
>    that return a long or short format FSR given a fault info struct
>  * patch 2: stop passing an fsr argument to arm_ld*_ptw(), since
>    nothing actually looks at the result. (This breaks a cycle
>    arm_ldq_ptw()->S1_ptw_translate()->get_phys_addr_lpae()->arm_ldq_ptw()
>    which would otherwise make a stepwise refactoring awkward.)
>  * patches 3 to 8: for each of the different subfunctions of
>    get_phys_addr(), make them fill in the fault info fields instead
>    of an fsr value. Temporarily we add calls to arm_fi_to_sfsc()
>    and arm_fi_to_lfsc() at the callsites in get_phys_addr(), since
>    the callers of get_phys_addr() still need the fsr values. These
>    will go away again in a later patch.
>  * patches 9 and 10: change the callers of get_phys_addr() to use
>    the info in the fault info struct and ignore the fsr value.
>  * patch 11: remove the now unused fsr argument (and the temporary
>    calls to arm_fi_to_sfsc()/arm_fi_to_lfsc())
>  * patch 12: Edgar's patch for ATS PAR format
> 
> Arguably it would be good to push the "create the FSR value"
> logic further, into the point where the exception is taken.
> (This would let us correct the oddity where for M profile we
> get an A/R profile FSR value in arm_v7m_cpu_do_interrupt()
> which we then have to convert into the appropriate M profile
> fault status bits.) However, migration backcompat makes this
> tricky, because at the moment we migrate env->exception.fsr,
> and so we'd need to have code just to handle inbound migrations
> from old QEMU with an FSR and reconstitute a fault info struct.
> So I've stopped here, at least for now.
> 
> This whole series sits on top of my v8M TT patchset (which also
> had to touch some of the get_phys_addr() code). I've pushed it
> to this git branch if that's more convenient:
> 
>  https://git.linaro.org/people/peter.maydell/qemu-arm.git fsr-in-faultinfo
> 
> I have tested a bit (including a Linux KVM EL2 setup), but more
> testing would definitely be useful. Stefano: in particular it would
> be good to check this hasn't broken Xen again :-)
> 
> Based-on: 1512153879-5291-1-git-send-email-peter.maydell@linaro.org
> ([PATCH 0/7] armv8m: Implement TT, and other bugfixes)


Hi Peter,

Thans for working on this, the series looks good to me!
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Cheers,
Edgar


> 
> thanks
> -- PMM
> 
> 
> Edgar E. Iglesias (1):
>   target/arm: Extend PAR format determination
> 
> Peter Maydell (11):
>   target/arm: Provide fault type enum and FSR conversion functions
>   target/arm: Remove fsr argument from arm_ld*_ptw()
>   target/arm: Convert get_phys_addr_v5() to not return FSC values
>   target/arm: Convert get_phys_addr_v6() to not return FSC values
>   target/arm: Convert get_phys_addr_lpae() to not return FSC values
>   target/arm: Convert get_phys_addr_pmsav5() to not return FSC values
>   target/arm: Convert get_phys_addr_pmsav7() to not return FSC values
>   target/arm: Convert get_phys_addr_pmsav8() to not return FSC values
>   target/arm: Use ARMMMUFaultInfo in deliver_fault()
>   target/arm: Ignore fsr from get_phys_addr() in do_ats_write()
>   target/arm: Remove fsr argument from get_phys_addr() and
>     arm_tlb_fill()
> 
>  target/arm/internals.h | 187 +++++++++++++++++++++++++++++++++++++-
>  target/arm/helper.c    | 238 +++++++++++++++++++++++++++----------------------
>  target/arm/op_helper.c |  82 +++++------------
>  3 files changed, 342 insertions(+), 165 deletions(-)
> 
> -- 
> 2.7.4
> 
