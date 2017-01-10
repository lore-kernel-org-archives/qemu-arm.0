Received: by 10.25.205.13 with SMTP id d13csp315378lfg;
        Tue, 10 Jan 2017 08:38:42 -0800 (PST)
X-Received: by 10.237.63.122 with SMTP id q55mr3511308qtf.201.1484066322328;
        Tue, 10 Jan 2017 08:38:42 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k7si1692571qtk.144.2017.01.10.08.38.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jan 2017 08:38:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48346 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cQzRZ-0007Cq-O0
	for alex.bennee@linaro.org; Tue, 10 Jan 2017 11:38:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1cQzPx-0005xd-WE
	for qemu-devel@nongnu.org; Tue, 10 Jan 2017 11:37:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1cQzPu-0006fJ-Pf
	for qemu-devel@nongnu.org; Tue, 10 Jan 2017 11:37:01 -0500
Received: from mail-by2nam03on0081.outbound.protection.outlook.com
	([104.47.42.81]:31420
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1cQzPu-0006er-AC; Tue, 10 Jan 2017 11:36:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=HJPZ0OhHt3LYtVtegr1zirk/8JOEblkjbkOvLp85LYI=;
	b=EGV02SzOzo5alccA5WSsAHGny3tsan5z8WToqMDVSNeID3KnvAYrt5qRPJFbmb0ulnzFPIJd6zPqhPYx+BRUE7zuv4p3B25iraPmjqn5nmD4ppQskcj4/dyngvNnUFW/9uPxbAf+R9WOxpEggqjufVrmZX6fdblgabYTAZAz/y8=
Received: from BN6PR02CA0026.namprd02.prod.outlook.com (10.173.146.140) by
	DM2PR0201MB0765.namprd02.prod.outlook.com (10.160.95.11) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.829.7; Tue, 10 Jan 2017 16:36:55 +0000
Received: from CY1NAM02FT015.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::207) by BN6PR02CA0026.outlook.office365.com
	(2603:10b6:404:5f::12) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.845.12 via
	Frontend Transport; Tue, 10 Jan 2017 16:36:54 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none;linaro.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT015.mail.protection.outlook.com (10.152.75.146) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.803.8
	via Frontend Transport; Tue, 10 Jan 2017 16:36:53 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1cQzPp-0007DV-0b; Tue, 10 Jan 2017 08:36:53 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1cQzPo-0001SV-SF; Tue, 10 Jan 2017 08:36:52 -0800
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v0AGaoB5025033; Tue, 10 Jan 2017 08:36:50 -0800
Received: from [172.19.5.101] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1cQzPl-0001S6-UQ; Tue, 10 Jan 2017 08:36:50 -0800
Date: Tue, 10 Jan 2017 17:36:49 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170110163649.GS14990@toto>
References: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
	<1483977924-14522-17-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1483977924-14522-17-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22814.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(39450400003)(39840400002)(39410400002)(39860400002)(39850400002)(2980300002)(438002)(24454002)(199003)(189002)(23726003)(4001350100001)(8936002)(83506001)(110136003)(106466001)(77096006)(6916009)(2950100002)(46406003)(5660300001)(626004)(9686003)(1076002)(54356999)(50466002)(76176999)(50986999)(36386004)(81156014)(305945005)(81166006)(33656002)(38730400001)(4001430100002)(92566002)(54906002)(9786002)(97756001)(33716001)(63266004)(47776003)(76506005)(189998001)(8676002)(356003)(57986006)(4326007)(2906002)(229853002)(107886002)(18370500001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR0201MB0765;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT015;
	1:2dyQK3pISOA5TSAdgzxhxISrLhyhk/fvyyIt9RpyEsgqYVyPKGMP/xKiSeJcUHOCmMHLS3M89hBVG9HTquwzhPM0tFnQhnZOOSf1PvsCCHzeYLiFlhum8sMI16HUfMbLDkKxZvlRlK2/A1rYfs8pC+ctw1kZeX3xlAJY3Mv07E8LF7lGSGtKzgbV144oS/Wbhfr1KOiqF618f/Ryq+mIRTnT8t2WBbmcEJcmtmg3lzMvly3lURG2apNNtcmO0ZvWUhQ+8Uxuxe7MnrtlMeVu4oMsWnsr7I1cAgvco2seA2LbyK5pGd7HgH+NrwvPyDhxc3vN4GjEPQ02dkXKVWz1H5ePvjLrf1RvXfpnW8/ZWZXBZkHlGaCQWqGbla+iYv1bBRgcnTV076Z/wNe5HOX8VkM7+A2RtlPB7lNiHAS+M2DT1WjD5nTuXAfqOGJrGpPmaQLWaaZD5jJR+mOWC7UfshqGAK+ET1GCDYbeFRnozR1WaRHAMmmaxeTINe3xN5ODjAMbof9uXwesIkb4terRJFt2HTSirQAEORln61SXeEQ=
X-MS-Office365-Filtering-Correlation-Id: bc66ad0f-b827-4278-0223-08d43976e304
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:DM2PR0201MB0765; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB0765;
	3:JLfoT3BrWfqPpAMgqoIKclKDmtmeSW1ZyAUhe7lG7hofv0ZU6LzunIjber4orvS9k7rAj3yKokcxzWFzMBZj1UmB9a8/uO+ppTCDZqqwPmEVaYeoiBSUNvdhWGEolNRvQzvhK57SAmPD7akzetYcu6wbWYkkoWT/bZRIiAV9kqvcsXtDK2vmtUReAZG2aS60mid+0hzbw6nXcnn1f4tFqkwODUztSBqLbpA8duVU0MNYbXPMlMCx8CDvh81a1ZQvCP7KqIMFf12aa0acjEIwLqxxnr4NhDHCQWfhAXObABemEqpkoK5q3ZqgbKSTAyMbCDGEmGUizXCfQ4G+RJeMcF7mKnVWVu1rAGtsR4nyOye/7q0saEtknUZKI52xPP+U5CEgwdduyCBOyVDtEjnTuQ==
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB0765;
	25:G+DnYzyEh7o15YA7sdrvXOlffZXqSerj34wPD//MPXyN8g47S4ECxwcaxSVoZmXAC92XPHbO2vx0CnMLS67DxcOnDvv5aHKvaDth/vjlJQQZGWb9DxLmY/AVvM8EoxwwsE7lWvVWWXdyHM9prG3W6s7RnMlHJq4LZz+FOLuWeywBA5l5AGWfz8lMRGBmXoK8uIFSKsk+XMr6WEISYGmR8Zpum6ESGIR8rZT2FrafVnagPWfbn4gEgWuOu0rNi7q9fc7ccwqIwxcp6bcnfLEEVZsXgXb28eMKYj6/aqzfqeGsjmPPZ7+ZkuuOKJDv5tQLC6DOLKFdJ79FcM0tCgfzlB6JbuneLkaTYCH6nwhGNz560Dk26PP629oqNE+ldUD1TnN0KBL++9viVVYYShqpag7uuTF1URrS9SVp5SSTKSsfuxXtYaAmlBjQPHKmrYcuVmc7tSi0hubk8O+UeUR9asYYMYA3qTEZ7BzqzW/WuFTwQ/uV8uylX4LXoHPPYT5JgsTZIbeV4p9PcaeWKvhESkn1EV+4iKY5VEgLQApiCoOKuFgvPtZf8slOhDN5GL2i2ogfEALXlTDQ9i1DdwB6HwQUMsYmwpPNJFOtIJdfQKzFfXgqyNR0OQ0AOC5hsmZdPNJKhTLnCNrXEYEGWqwj81K8PT/R87uiFZUWxMRCkT5NG9KmStisRAFQInM5T/tsA9uqvIicinc308HXG6ogOdfw8BJ0yROkqTJapWI6H0ULP7uuHsXWFz6n2Fuo6aRYkdwM8/3gcBt8CJRpUzWxJKNvuDBk1J7G9cLgz648OZ/zfP2ehdwiQOIPhlY/qYpnYXRK+AmFUDGgiQHPdKHzswd+eZz9oPurpwszvQnd0ms=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB0765;
	31:VA2bUrJIJsFj8tmyyhWkfI2UFOayxZ2U4YIz+FvJi2oKRHX6U2vZSbfQo5erlO8/WitpcykkQ7rVy8TLWlMk5f4F8ZETMWzendO7766REOuQl2o2NKOkkgBa63AI93zulti0lzdoMUOEtcGaayvKJlKf+DSbHb9M7G6yS4OZNd894m0GD4Ia6xTl6e3UxUKIOdy0LsBYGDhqwGHFSMTFH70N5URX5s4dWzPpq1+jej34l1ZQLpjprQbuk/zr8UGcOAj1Z4YFI7TNBEqqFvbmiA==;
	20:QUpPxlL0aBj0QIzWvnY7tJ09x+dmLQx3P30L2ka+pAozoc+sJqq8aTjs5i52x5slrCn/4A/hWPDKow5OPZ4cReHIVcxfMvsL0Wr9Ft90JSN2HTbef6MVrpGeRxjq35Td0kBaS5oydd8inLNPXAIYrEz2AHoEb1AtEXZNDY2V9SM8qNTInap4R3mOP1iti/vlPV+8N2+/W0K+wjBBIYX5WpStqK03YDiSQGZw7X/P0qQrZOi7rwm+9SRqgbvdvzoTEGZwcy5HRtOqShf41wlenMRzLX3zjY+PQqmLhszqM+b1S5KHMEtCnFTjsopRtOcahvorRNrYi8AsRfPqhU417fvmG2zSIpmrIVOph5KyqM5a59/t9oDbUz1snE46eIXOHTdcZl6OkMa643lX4fE1s+fBkzNcPlmuJjklC63VXIRrG92HWGr+IIb3uFlxLjbJqVh0Mubwn0PA1Y5t4l/faQP1H/CnvGem0ppyPo03dg4venp/QT9mtauXzGGrom+z
X-Microsoft-Antispam-PRVS: <DM2PR0201MB0765CF82C0FAD28743A92F33AB670@DM2PR0201MB0765.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(13023025)(13017025)(13015025)(13024025)(13018025)(5005006)(8121501046)(3002001)(10201501046)(6055026)(6041248)(20161123562025)(20161123555025)(20161123564025)(20161123560025)(6072148);
	SRVR:DM2PR0201MB0765; BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0201MB0765; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB0765;
	4:n3TAD3/rriJRceQXAqtnGgXmpSLHDzhuZ+3Q5VWMvhon+CZCgwA9NSnIpImnGhT/nhJu30B00EzEAap8hgrkAGaexo2dMWuDxCp/PFHSf4/AI8z4UTM9G+HguNORah3szgDznvESlGQR4SQ+BqaW4Bz42CJN2KNwYIFDzexCl8OdS/GQnxQGPkvHftcEuQtLoWEV4XP6pxjR90ofxkBACoXvhpRNiNVL/Tp0mtNwuEbKAAlyUZFIvFblk86hBeScjVLZRgafZX8wAeZIMP3gU0XeIZNd4raPBCvLzYGKdN2TYSLYSO4LZN7qqwXMY3fwedmgPaPq5OWApY/VEWgD/8lXWRivO3bv+9edOZXUzd4A544NCWdyYNbnueXZF3OqS+atdcGKrwFNTiRVvsC8+ybsPabL+TQ5PQnOVobKGyWfbrrpUlyZX43f9O+ZU+R0fKYH7gwtTCPGjXXLTgVNvfrGhNWSZicAsZpZUB2oPjzkk9nnvDeVQh4kisx4jQkjlZoGrThNOfU47SlecAGM6qMhBZ2x5OHslDcKQnxX4djkscFrC11AmTvKoiNCViAXZG1XgKXYazxT0BHsY1SjmnP2NiqOaKpq2WWBVr4YqIZ02p4yoiK0lILGjlAZY9WZ9gZYLP2cLkQqG3DBlf9bDbPBqg3SrcktFoICOkP9AyZ52VnBunCWxHKQOYXwqSvA8k2Utgal301FzRD3iEyCoTm4c2CJpvpg+qIL6ses72A=
X-Forefront-PRVS: 01834E39B7
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0201MB0765;
	23:Qnwly1AMtQ2ooHUGHc4fjS0Tvbg8UnpRxpbRQBx?=
	=?us-ascii?Q?hJva9eg7uuXBU1rnTCEYpTLGIajd+BfT8V/x5DPnHfmhRGbUuxydNIhqOPo2?=
	=?us-ascii?Q?X6EaOHH0UEI+xaRYLjJ+/zn+Ip03UBgO98EOYakaYScQYnCAyRi63LOeeKOt?=
	=?us-ascii?Q?9d3PtkK+3RaIkbrPyDg5pSytbpfaE5YLGJPVt5fiF1jQBujNJ9QDc69Lfr4K?=
	=?us-ascii?Q?DnKjRz2T1aNELMXkLLIVu6p6iT1aXFPKRalK3Pk8AUxS0nc2dox3yl7Ydh1B?=
	=?us-ascii?Q?gc4bhtmvyxd56Bw4woGOykA1MzfnEYaiCHA16DvBIjR7sxmH1M9bQH7WGrxo?=
	=?us-ascii?Q?pNkeCtJbV5zezLZhJK0UTfGMfMRpRDA5e2p2YhOEyEtvZKaA0jpjKzPw8bgV?=
	=?us-ascii?Q?8L2bQL9kLQqTHJfMVYayECek4JUXoPuUgJ2Zl6CcN/Qp3f7SDlGT1BxM8Egv?=
	=?us-ascii?Q?F9P2Exd+x2Ph36K8XrUpFGmZOjv4I6aTuTP1EbsKgL8ATk+fAU7TzLFaZKd4?=
	=?us-ascii?Q?DOYnaEDw2b4wU01/quyw65FVmgmOzA75arrv8qv1tQjdsHswva+UJ3weHPKt?=
	=?us-ascii?Q?xE9c833AYH8bmytXmKqSZKB9Paf5HIK3nCXWOqdng4KwyJIXbRfitoyPe8jo?=
	=?us-ascii?Q?HUOk6uln8D622/dSNPUxfAJjiBrbOF7ObThSlLCy/7lSuEbZx5F7+OLcRdrU?=
	=?us-ascii?Q?G9snHybNLAzR0DClJlqdyb0ofIqDzgnlSxBOMgnEOKzBor4sB+3bK3hqRY/R?=
	=?us-ascii?Q?x0Luihc0XUwk8NC6l/Jjf64YVnKNc8DWhSYrs22qeQkJC1oevowB2iuWuKXU?=
	=?us-ascii?Q?xq2AlUkL+uYOIvZEO2eSmHphFmoWqm9wPimyVW7cK97zg4aYtOX5ZQDGB/OP?=
	=?us-ascii?Q?w5Rt1WuaDaUZt4W5FQebx+Imt30pC59XTOxQPGbOoojnmkierg63D4yUSLbq?=
	=?us-ascii?Q?iVodCpstc2QD0/of+l17cOZmsTGqS2/LtRDnO+LwfgyvouG5tV3f7NX6HRWF?=
	=?us-ascii?Q?eK2nI+uZj4EdKIZO1Ko6agoop12XZqEA6v71adkRLxD8etD+l3/vCOWXVa8S?=
	=?us-ascii?Q?c0iqrZV6G2V+zbLQOnYfUbPsVJZFcNkBl9FlK0cQRveIr3Oj+gbKB0EPLq1B?=
	=?us-ascii?Q?s+TBLrkUkzsM2nu3Pc7V4BG+CT6bAr7kFhtDoTo9F+rXzBaPvlbSKK+H+SQB?=
	=?us-ascii?Q?FDe8r4Dc+sEvCk/CWedCeHgE8k8n/v0bIPYeL0o7aK6Te4gKqgqy0ZT897UU?=
	=?us-ascii?Q?UeXedRJIMwsVxPrAzE14zEtxf7cbss7AIoOWUmFNOFLROFyHg3MEk9+OVT5m?=
	=?us-ascii?Q?Tr0/mlzWZXyc9SI8ehu6rSkWv6bB+Zs9e+4R1s8pRQQot?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB0765;
	6:EyJuzJ7z8ptAhx8iVME7H6u3ANGWnZdgboG6ttouYi8EruiPBoOObz/KmfNs8tZu78QCptvRRDfVZwx5rqvcTK/+RqZBA2O4TkmYJehHi8MosY5d/aBqPRPoXpwG+rMGmh85xmNjqh18tEfniVttNU/n5YtAWftOsk2i9S5ORdwERcdUFF9Fo/h3s11cej4+XU86YGuCnwaZcAHRgua7JH2D1SY3jRmcCDs3TlIE9EoS/yhbkuP7WiAL/LXMg/D/xs1iny94QOYky4h72/zaN30aO5kka3gFXX8bgZ9dTKeX5dC5xBD0JAAa2VpjD+3Smstv87RzMmwpxQAl0FlWHySw4t7y/sK/aexcxlm8WukueKgbjzs002XUUgVNTxfczw/g6ssfsLk1z00gh+ln2J5l5bLBNJUPHIr07RnDZmTtWJwNqOV7jME7ao513o4O4tgfdf+iu6bcsJNFmk5d9g==;
	5:E6qJQBz3O3RFo/Xbv61rW2HmBR0yvaBYAfX+gsTodVB/Un9Lwj8tgIgI9R3tV6hHoOPLKjsa7rfUjqnY3bzRrC37yN5Ve7bMJPqeERxb2h7jBodIMY+ZuvKMDlM9ZMeRYKkhcwD/yStfVMeBS7evLDAI1w2UQ1Rw4LhqK20mEMU=;
	24:h8q3/dC5HgA/ut5oEfuhMp2luI0pqPUozVuxcjpiBLdIDvuWvRfv9Jf5coHA/L7gWz0K6NvqPmkZO8C8YiU0TFNGpeMhoEhrav98FBHgKMM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB0765;
	7:B321Oqxz3BRcaI3W0C+XXABDbr7PQRlUW7Oy3KEbO92UIrXAVlbWTnjaaiOOv25kxBXtX5EB04TTtDLXbH85yc6RUcuanrPcgf42EHEGdKqlBXNjXRdpwvXrPoDic+UZGoGsD/EmCoFmx3sp12y9I8GQqgkjA1QU28SxvAvZKi+ziQrGktp1YlC5iQiODyZkXcI9IP+C0wYiZV9TI/2NRPfNRL0nALReq/KrOT6B7U53V8xT6GFG+DzPHSwtXDIeqdsTx6+fr8tzvv8/XnVKNoX/CeKEpJGe8oKLU/MsJepgbcNH9mBo+F4mcX7jHfh8JQC5GZ173NrvLJYaM7j3z3Qi2zTOpVQacB2Skgqs/gx6AsU3n2UGpYg5bV9DihHA6RLSY3GX2ErgJGAqtBrPOrKLNhv/IyrwC8j0pr4lZT5mwHjjiqqTouARQ3pv5mihDNZcRms37wAvpCqqQQ4PYA==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2017 16:36:53.7603 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0201MB0765
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.81
Subject: Re: [Qemu-devel] [PATCH v2 16/18] target/arm/psci.c: If EL2
 implemented, start CPUs in EL2
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
Cc: Andrew Jones <drjones@redhat.com>, patches@linaro.org,
	qemu-devel@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iG+CaNyME/YE

On Mon, Jan 09, 2017 at 04:05:22PM +0000, Peter Maydell wrote:
> The PSCI spec states that a CPU_ON call should cause the new
> CPU to be started in the highest implemented Non-secure
> exception level. We were incorrectly starting it at the
> exception level of the caller, which happens to be correct
> if EL2 is not implemented. Implement the correct logic
> as described in the PSCI 1.0 spec section 6.4:
>  * if EL2 exists and SCR_EL3.HCE is set: start in EL2
>  * otherwise start in EL1
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target/arm/psci.c | 25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/target/arm/psci.c b/target/arm/psci.c
> index 14316eb..64bf82e 100644
> --- a/target/arm/psci.c
> +++ b/target/arm/psci.c
> @@ -148,17 +148,28 @@ void arm_handle_psci_call(ARMCPU *cpu)
>      case QEMU_PSCI_0_1_FN_CPU_ON:
>      case QEMU_PSCI_0_2_FN_CPU_ON:
>      case QEMU_PSCI_0_2_FN64_CPU_ON:
> +    {
> +        /* The PSCI spec mandates that newly brought up CPUs start
> +         * in the highest exception level which exists and is enabled
> +         * on the calling CPU. Since the QEMU PSCI implementation is
> +         * acting as a "fake EL3" or "fake EL2" firmware, this for us
> +         * means that we want to start at the highest NS exception level
> +         * that we are providing to the guest.
> +         * The execution mode should be that which is currently in use
> +         * by the same exception level on the calling CPU.
> +         * The CPU should be started with the context_id value
> +         * in x0 (if AArch64) or r0 (if AArch32).
> +         */
> +        int target_el = arm_feature(env, ARM_FEATURE_EL2) ? 2 : 1;
> +        bool target_aarch64 = arm_el_is_aa64(env, target_el);
> +
>          mpidr = param[1];
>          entry = param[2];
>          context_id = param[3];
> -        /*
> -         * The PSCI spec mandates that newly brought up CPUs enter the
> -         * exception level of the caller in the same execution mode as
> -         * the caller, with context_id in x0/r0, respectively.
> -         */
> -        ret = arm_set_cpu_on(mpidr, entry, context_id, arm_current_el(env),
> -                             is_a64(env));
> +        ret = arm_set_cpu_on(mpidr, entry, context_id,
> +                             target_el, target_aarch64);
>          break;
> +    }
>      case QEMU_PSCI_0_1_FN_CPU_OFF:
>      case QEMU_PSCI_0_2_FN_CPU_OFF:
>          goto cpu_off;
> -- 
> 2.7.4
> 
