Received: by 10.25.0.6 with SMTP id 6csp1785980lfa;
        Tue, 23 May 2017 04:19:07 -0700 (PDT)
X-Received: by 10.31.168.137 with SMTP id r131mr9010698vke.64.1495538347740;
        Tue, 23 May 2017 04:19:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495538347; cv=none;
        d=google.com; s=arc-20160816;
        b=YfylAMkAzTMNOqEkWuvi9NhovV1jyXmKZBEJX1tdhZSJA+x7+q83GzKnHMn/E7x5su
         tImc887+XIhQLI0EQL77kK1sXS+6KaK202zBwH++dMfqd/Vt+6rckmg9LIYelDb3RxBc
         YktTQe1MoCGb4cLpbZ9rVmS7FLwu/SkfY2QhqdNe309BHuBoF9UBlaWjUOwB2cwA09KG
         EgYxflYhEf8r8lDg17E9FtyDcVHNp5dczPg6/BYVvzVm2soHtmrQ7Ceyppl/Gi1TbXE5
         8eTM1QKLWaWIFa1++XpJNWPChI1c/kBpbNMQqRGjBd7+1qc8BTIIVyhjuVRG3TsFLqdA
         KRSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=NCYfupXl7DvkoBrNy/UzQ/oPL55eUO7XE2hUADXxSes=;
        b=Px39e35oMBY/Nd9ZM4qOm5kYLKYuPhakXse4zZUHRP1pT4ElopllkkNF4/sHjCAzmJ
         wTANX/W6Tek8jGiAJsx3jhQiElKCkioHTsLxSqI1cSex3z0HqMYyG1cfqBugFE/cGzyw
         lbX6RGoDwyPsWLok6Gry8ELlPaX5FuSgLFMdtN9m2WMmosd3M866XIz7NkZa7Is8rhOB
         M6eJ89MVj0tX1OEsZrKrAuOA8Yk/xR6JzhwQcwH86jIUdrN3aGf6dcGoyzO44bKa9PVf
         8bGBxixVL3M1Nv6SYkPK3ZmtICu0qsdcgBQ4RPo8TFb8fcuXzUqdIPJ596Y/25Uzgw5u
         3vlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t26si9584562uag.18.2017.05.23.04.19.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 May 2017 04:19:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:47752 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dD7qF-0003yc-1u
	for alex.bennee@linaro.org; Tue, 23 May 2017 07:19:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dD7kN-00077R-Jo
	for qemu-devel@nongnu.org; Tue, 23 May 2017 07:13:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dD7kM-0002Yb-7d
	for qemu-devel@nongnu.org; Tue, 23 May 2017 07:13:03 -0400
Received: from mail-cys01nam02on0040.outbound.protection.outlook.com
	([104.47.37.40]:13216
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <diana.craciun@nxp.com>)
	id 1dD7kF-0002Vn-Mc; Tue, 23 May 2017 07:12:55 -0400
Received: from BN6PR03CA0074.namprd03.prod.outlook.com (10.164.122.140) by
	CY1PR0301MB0907.namprd03.prod.outlook.com (10.160.165.18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1101.14; Tue, 23 May 2017 11:12:54 +0000
Received: from BN1BFFO11FD032.protection.gbl (2a01:111:f400:7c10::1:175) by
	BN6PR03CA0074.outlook.office365.com (2603:10b6:405:6f::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1124.9 via
	Frontend Transport; Tue, 23 May 2017 11:12:53 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD032.mail.protection.outlook.com (10.58.144.95) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1075.5
	via Frontend Transport; Tue, 23 May 2017 11:12:53 +0000
Received: from fsr-fed2364-102.ea.freescale.net
	(fsr-fed2364-102.ea.freescale.net [10.171.73.3])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id v4NBCnX7030520;
	Tue, 23 May 2017 04:12:50 -0700
From: Diana Craciun <diana.craciun@nxp.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 23 May 2017 14:12:43 +0300
Message-ID: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
X-Mailer: git-send-email 2.5.5
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131400115736068634;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39380400002)(39410400002)(39400400002)(39850400002)(39840400002)(39450400003)(39860400002)(2980300002)(1109001)(1110001)(339900001)(199003)(189002)(9170700003)(5003940100001)(48376002)(53936002)(85426001)(2351001)(7416002)(81166006)(6666003)(356003)(5660300001)(966005)(50986999)(104016004)(47776003)(6916009)(189998001)(305945005)(8656002)(50466002)(6306002)(4326008)(77096006)(54906002)(33646002)(50226002)(561944003)(38730400002)(2906002)(86362001)(498600001)(110136004)(36756003)(105606002)(106466001)(8936002)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0301MB0907;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; A:1;
	MX:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD032;
	1:SHxNzgFNrV/Ah9t/n16jP7hUxIRjjg5qx79VnllwQtzmIqrRNAvdWCEqgyJ1yow6wCTlHUk1187Cc3S6W0HWHeIn5v/C9ouA1ptFjAlz7Fs2/jtvPb+gaHjmgoSxmQ3z/yxJ1JB+28+vZzAmrvTstqNrQGnDBb5BPekp8nzT8Sxcc3SyAFKPUe3USsjofN4ezstGKMzfxK8ibg4O0pB8UZ2BjzLaQ3AafdmSSSVOhynVBuWuyeXrzwev8uius2S7F9CV5kXXFg3XKwfWMN/cWs227NcJHBlHzaTQIUFddNFzSsS797cRa0R1hnOsjdIC0RxKUkm4Vv9XIRsJjsSWtnum0DIiimPnzSYxCzC+qziY0ufkHRNAj74vfUl8V6pq6s7h2FNra3wo/oe7uFXl2bEc32kXg+JWUdpG5+HlEGoNePMaXmq2gJnhzdbAVzITHhp5BPIVr/N89fZ5gCb9lhFAnLyj16/SZ9jwWLjkqFrAK0sb1bRKA5+VC1658Bth5+ArlEGJc/AB2RSeMA/00SQ2/IVfNijPiDpi5LWL2W6QeTLLLQjFz6PCHmzKjnpG5a9yt0n7eQncX1phRUcqGUWcDwYiGaCWrM3y9K1yEjLkcrJ6bCCK8qxHdqaE4FbistMML7kI/MRRgp3iXL7RHjKFuJQAq29qgu2Pk5wOq4aI3gQB0vonQQCEaZdePvNSasDf1ZRH6q975CIOF737ogDWGk7JPHGFcO4meLKE0KU=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR0301MB0907:
X-MS-Office365-Filtering-Correlation-Id: 194ab00c-1e9f-45e7-c21a-08d4a1cca85b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131430075)(201703131517081);
	SRVR:CY1PR0301MB0907; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0907;
	3:4jW+4m8VQkt3UWCEsATko+NEcUTuiv1ogt05ZnYRrn+Hwdl/AvtI2lFrYOaRRVuLc3Uigb5/sHa1PzeBRV3B4hTN6zFP95+F+Wde1v819l+HtmHH9z3qxizZvkwfYKPPUpLk9o4BjhpuxR1Gn9Dv5s8wiKGUvBEnzwf2AV6Ubpd47DuoJZkFZEe1v/+VGLwn46nEz4wZNtjbR0GcG/lk29ZYYipjvvokCK6sqDZFNsWN6O5P6gkbVf1W93weNqc0BMhZxZtz81XUN8WXIDgu8PbyFZKR6d8w+86V5FXMIodrDZNdAYNzcLcw6fTXCgjt2mPCrN4DQQyAzF6MLf0Z+P/c3dUnjVnQUU3MuNMk5ekTVFBWsGL3WkwdZd1yzYDjwHhY4VFvMQIubmZJ9EbidT5kTL95i7rvQHHXzbSeE2N1PyQPxl6icQk0XXhTb+Xb;
	25:hxUzeHlT6ZT2vF6m6fZELOPFbF39Ff3PMrIH6KUFRnoLEGGnPQwBjzHpz72xbO4SixLwf1BYD4ZsT0JdkiONl1KsnIN2o3kIk8JreNh8g8+5HfZO6XzZzGJsKKnM0qcE1i+bzZBj2nfQ3SFiPqeV1IrhBnKlfDCDR1VR60OQDjKpSwq6n8gG6zkh3xz8vz3EqHia25GAuOqAtceYnJ8fGChLwlWJg13iYyvXQmcBLccR1UCJp5KDi1j7XUzgIcU/s19fEF/kZrLeUOA8TsQdvNWWIs+7ok3k2vdwZYWqpURAI0flCu6t7xVyYnQRiP4YJP8YcDl8u/lUIiQXoToQsgvKOTa5JffPWTowl2UmeAynmNEcMCEkR9ID15xF9PSHcJho8CuBlOqZT2jTDHnRS2iLDDK7ngzxCK6hW+PrNkgKUSlD8LXPzOo6OprQdGI+oEWcE5g5NWIU9iLmONUUvYeJpNkGwtrlPotTwlGlIA0=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0907;
	31:5araxlibfNvvbPl2mJg/auE9i/2W6R3PDs+Ja5Sb+zi76iMiTIMpkNPj/GlqY1Q04K2+NYs8nTbNURCgSVHyr4uC7Ks4L38O9kLlpCccdt+Vy4WshbXOWMr9OdjR2WOJWaI+rE3hwKddNAPlHa/ro76JNsqcPeAgOaJezhR7KxEF6ZY/7rpS5oWtnsDpgqsmjVPep/Au4+zvH1XXwVZkzH89XdFKcCRFSVrej9oBhzRCf3KmTsMX55Os2BKc4zwvedf5G8hesLzuds1O5nOy6w==
X-Microsoft-Antispam-PRVS: <CY1PR0301MB0907FE0CC1DBBD2A5B5F9B1FFFF90@CY1PR0301MB0907.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(84791874153150);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095135)(601004)(2401047)(13023025)(13018025)(8121501046)(13015025)(5005006)(13017025)(13024025)(93006095)(93001095)(10201501046)(3002001)(6055026)(6096035)(20161123559100)(20161123556025)(20161123563025)(20161123565025)(20161123561025)(201703131430075)(201703131433075)(201703131448075)(201703161259150)(201703151042153);
	SRVR:CY1PR0301MB0907; BCL:0; PCL:0; RULEID:(400006);
	SRVR:CY1PR0301MB0907; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB0907;
	4:Pf4oF4ZJud26zBglcUgATRgYYW654H1/632sCATi?=
	=?us-ascii?Q?bjKpALZ8mPjMczQ2/guEc7bzf0GH/stoV7jjM/igHunajTxiifnJSEuMtdtL?=
	=?us-ascii?Q?U4CiSAWguoFqGaP5JwhIGiHLPlXIMtAws14y86jw9NJgB2qrD5p6tlCkKG69?=
	=?us-ascii?Q?HNVPuBnL+IwMGmat82Uj1bKFXjCjQ6ZEeI2jl6zmklEP5MwUQI6X+yzWKKYJ?=
	=?us-ascii?Q?sW2dV75GWl3PzAUtt7k47rhQMqblwil73sCIex+tXAaQ5XvtC6R+xBUout+n?=
	=?us-ascii?Q?vFYGsYbKV1PjezvX0S+MG3w1UzQlqvE1i6SV2P7kBck4c1Qz5dOmfxCqusKj?=
	=?us-ascii?Q?eADgYBoDHl3eWw8Y4KdAtdGJhY00dWNdWZBLUEbk11CPPi7b9pm4idwYvbAL?=
	=?us-ascii?Q?t3zYPh9m8F4pQPaoayCq59rV67GDnotkDGMKPUXJHCQ6VnS/ajj9WIWsGgkG?=
	=?us-ascii?Q?9hHVxm9R3nPXoeQhbJMw25nkiSP0WLqf+hJJJytGDDQ1g7mOwrYRFRPj/qmr?=
	=?us-ascii?Q?HPkS/symQVDxnF9t8QlTZQRneyghykUNcrNwgeYajg6zpYVX3iTee1o5Awak?=
	=?us-ascii?Q?kcwGcgrefE/RAQBSSNqEbShJTWePGZgMJ6YulNdg/jgAjfyRJwXnUgH0ogI5?=
	=?us-ascii?Q?ZNDq9SWMzmjKFoME1FhNB2GtFltXiWzUUaPcPRMkssN784Lhp7uSjRA3IdZq?=
	=?us-ascii?Q?0SpuRj+ytGt740EW80old+n+rBYQdRwDeNK81F+Mc64WfhoZ4t+q6bFndo28?=
	=?us-ascii?Q?VWobYh4DIV3MqpIuQBos+KkDDYQZ/leWWTaffJKXswpCXIMWPc7Rhrp69WcW?=
	=?us-ascii?Q?HDO19vQUIQlF1iMaKAmCNABVW8UqalSSqW2xE3aUdIK+82LDojjOfl9lm2rz?=
	=?us-ascii?Q?re+rnwXRtuJUji+FWa12wOi2BVe5zsVlLURPoHHOyxCM8KWabCfqOpsJd6JJ?=
	=?us-ascii?Q?dyh+Cmvy0TDTpiRcLwK9Drrcvz7qtKYV3AQsECRprQ=3D=3D?=
X-Forefront-PRVS: 0316567485
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB0907;
	23:8UdVVjQM7EWG6G1rugQWwYUCv3fBYaXmExlNOJm?=
	=?us-ascii?Q?kOI3Nypjr4NXLjtiKPCjKHQb8PTQyxu3+3B7+cM9H483XsLHjPx6gyEDXDad?=
	=?us-ascii?Q?t/E3VDlHZwSvV96+vn1Qq1Ism0bIlr6dKVhwgIVtU+2tygEp47zWCx3qOLmR?=
	=?us-ascii?Q?v38t8d1sHeeYe8oVAlfBnpStD3bjdI6YzUoU+tNMY7a/kn1WD65b6Pxb/abs?=
	=?us-ascii?Q?RVLDWkCU4KvUGVn4SYgb98qVXfTX4Urb6ZOk2on2r//ObMJgO870lbpxvdK1?=
	=?us-ascii?Q?PsrCXITRBvR9rS7GF6HVmx0dbVxtxiLbGG5svMUi7UToY3pHaYMCOPAdHkwD?=
	=?us-ascii?Q?X9PjGPcscN5X86HVzRMfURTZOlz8DoCLeHpCS+XJpeMyuwxDMW/zrmu+2Meh?=
	=?us-ascii?Q?tLeiG5l8T40X7YJvgs0OhrSLtZJzSaAid6ixx14b84sl34H2yLf4YUF80OEA?=
	=?us-ascii?Q?OWtszGQrgh31eCgh9B3YHPNVQRrYTlythwmZIj5mlZwZyjS5KO09Ft/EvD1+?=
	=?us-ascii?Q?2m16+Q7hxDJlw5e1KCQVZR2UFm6z90NMMEgHXXhcQYZRQL8LNI6+oDNn/810?=
	=?us-ascii?Q?ssAVfY9frJWYjgtK8dY2TRAArppbbAK6mf9sZDDfnYh2ul73Zrffe9TcQ52V?=
	=?us-ascii?Q?3MfsfVcllKzuisAIHqTg0ZwUTwEGFwt5oCECXt0avFqUcZQIJG5uoLlXEjvk?=
	=?us-ascii?Q?CRy2KK8W2N2WVvBGxwIRI+SQhizCTrJlREZk+r8tFGDojVdQz68gmv1t84Ob?=
	=?us-ascii?Q?S4uQjRn7FGrXdWKgMBFFhLppFlEYM853Xh4au5zu+l4n2Y7/YDXJAD1Bde9/?=
	=?us-ascii?Q?PLa+EYVHhXwFp/gIL5T44lT6wyHNucVZZl51L49LgaFYAz0y6ttPUYZh7m0K?=
	=?us-ascii?Q?YS8VJBdQqtG+aLBF1CXhE7IKEU+oH7spJqW08sSw/R6jzujD+DkcSgPIenL4?=
	=?us-ascii?Q?EwiBrRvEzP2Gh6QDcyU1TMLyjYMF9+UQ0Ef6qyyqZOkyoMV+SNOSVaMaBSXO?=
	=?us-ascii?Q?5o4j7KXDdHQ3enEje4eYWHkG9M5VBdi7WCQWAQtnhXbTh/MhyGnnQItDAaz7?=
	=?us-ascii?Q?2hPs1L5g6jLoqCdxaUN0ydKONU5jnZTUz3zsrZnzLMC1ZqvtvsN0FXKV3Irt?=
	=?us-ascii?Q?0U/8J7NlsyAPfDYb6uCVMOl4aDpEkcuDQx8YdjFkMUeKW+mYYG+CHGpDHEHs?=
	=?us-ascii?Q?/JwJ9FNRJDMjWBM9rEx0x1/blJG+YM4uze3Ku4nQhchnEn/AUsmMb8E4pG3W?=
	=?us-ascii?Q?ieguDgoTRIqoAF5bltzFKqEqDWOJTFDe2JLE49A8S?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0907;
	6:YddI7/rHvCFb1ccyr27FRUtw5iOXOIdoL4arHlIjyMjMUipIP/EBpRu0zDyHuBSO8emITSj1x7CVDCcHyonuIEVyiBz3P9X59OlIpHAt/W7L6kwfr+FoKSAFg8WwW3aPixW0x5890qVRTYDsfZdcHjl0Aax8ZTrIDhnxHFfy52y7PR3FfKGi33kBX4KmEhSiT6Ap18IWJrwXt2B6SrWeh0+W0YgqiRRuocNNHNcI64OcWEqIpZZhEeANJ4K3I3Lu1TsLvngEJWTHdfYu2BV+1Y4H2RvXzgtGvSfveHJaygtHAMJGfU/usUTT5vSRzliDm/Um/m0Ad0GWcm4H/11sZFRrKTZ+m2CuuNqkZJpntfUwpDU2ObHGh6wepK/x35HllizPfuG+Xv4ozO4dkmazzX9miObvxClBm2htph2txCiJXZ53WSxxx7XcSgXl5ONjEfFcRrS2nyPf/8TTXzrDKBshw+kgu7ModoXxvmJGyvaZmrS+cmBhY8mMTARSnUbu;
	5:sdI0dNbG3spAlIUcvOokfRioaTsRhsh7eGWWqjstfI4cRE9CBz9e5iXXG+ObReUKqLy1raorHfpxovrkvJDI0pnYkJEI5Y5bSv427AKysgEoJM9pGHDMc9rA7S2YEtQzUzFjWGEByfESSTArFTyurdghZ7zJn5fb1bh+aNkpo6c6mcJwvajHoQDYlBBlEARC;
	24:MCjx1qxdu3yRM/g5HWd4IuteqXypYBt8ruTX+OEvS2U+rE10BbzbWT/ZFZiNaQVSD/2VZlJeaEn1sd+UVqkL2YRcvZFANIXECZe1lufsiV0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0907;
	7:1M4wpYckIOmstqlnYZy/wvA4h+PDYbO9Cxd2oilDyh41vjeU2SZ6Oc9jaEDca/KDrU72Zj0QMls29qlfRBT1/K95awLZJHoNsuA9nqezf1Yv6zKnChJ5jVZY3bKLXAF3WG3WSzEZbln7JvfXjp6YPLQtWKH6ANhx156uuo0P0qTRHBxjqwFK45ZIK/yc4KL1fqdqjXR2wywb1hGaUePdDeJhDBPjdrpALsGf5Rv814HpY1b0Ul9QBBSWN5hlsuNR0vWOf5uB8XbfuNvUb+sHRx12WjuhmnW+NDSVEeiu8Jqr43x0riu90THk7Ju9mHnETt8pAMXuMVaNfhSPgAvRbw==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2017 11:12:53.3728 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB0907
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.40
Subject: [Qemu-devel] [PATCH v2 0/2] Add global device ID in virt machine
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
Cc: mst@redhat.com, Diana Craciun <diana.craciun@nxp.com>,
	eric.auger@redhat.com, mike.caraman@nxp.com, qemu-arm@nongnu.org,
	marcel@redhat.com, bharat.bhushan@nxp.com,
	christoffer.dall@linaro.org, laurentiu.tudor@nxp.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jlg4pYdaERsI

The NXP DPAA2 is a hardware architecture designed for high-speeed network
packet processing. The DPAA2 hardware components are managed by a hardware
component called the Management Complex (or MC) which provides an
object-base abstraction for software drivers to use the DPAA2 hardware.
For more details you can see: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/fsl-mc/README.txt?h=v4.10

The interrupts generated by the DPAA2 hardware components are MSIs. We will add
support for direct assigning these DPAA2 components/objects to a virtual 
machine. However, this will add the need to expand the MSI usage in QEMU.

Currently the MSIs in QEMU are pretty much tied to PCI. For ARM the
GIC ITS is using a device ID for interrupt translation. Currently, for
PCI, the requester ID is used as device ID. This will not work when
we add another entity that needs also a device ID which is supposed to
be unique across the system.

My proposal is to add a static allocation in the virt machine. I considered
that this allocation is specific to each machine/platform. Currently only
virt machine has it, but other implementations may use the same mechanism
as well.
So, I used a static allocation with this formula:

DeviceID = zero_extend( RequesterID[15:0] ) + 0x10000 * Constant

This formula was taken from SBSA spec (Appendix I: DeviceID generation and
ITS groups). In case of QEMU the constant will be different for each entity.
In this way a unique DeviceID will be generated and the device ID will be
derived from a requesterID (in case of PCI) or other means in case of other
entities.

The implementation is generic as there might be in the future other non-pci devices
that are using MSIs or IOMMU. Any architecture can use it, though currently
only the ARM architecture is using the function that retrieves the stream ID. I
did not change all the replacements of the pci_requester_id (with pci_stream_id)
in the code (although if the constant is 0, the stream_id is equal with requester_id).
The other architectures (e.g. intel iommu code) assume that the ID is the
requester ID.

Tested on NXP LS2080 platform.

History:

v1->v2
------
- the stream ID was added as a field in the pci device structure in order
not to traverse the PCI hierarchy each time a MSI is sent.


Diana Craciun (2):
  Increased the size of requester_id field from MemTxAttrs
  Add a unique ID in the virt machine to be used as device ID

 hw/arm/virt.c                          | 26 ++++++++++++++++++++++++++
 hw/i386/amd_iommu.c                    |  2 +-
 hw/i386/intel_iommu.c                  |  2 +-
 hw/intc/arm_gicv3_its_common.c         |  2 +-
 hw/intc/arm_gicv3_its_kvm.c            |  2 +-
 hw/pci-host/gpex.c                     |  6 ++++++
 hw/pci/msi.c                           |  2 +-
 hw/pci/pci.c                           | 25 +++++++++++++++++++++++++
 include/exec/memattrs.h                |  4 ++--
 include/hw/arm/virt.h                  |  1 +
 include/hw/intc/arm_gicv3_its_common.h |  2 +-
 include/hw/pci-host/gpex.h             |  2 ++
 include/hw/pci/pci.h                   |  8 ++++++++
 kvm-all.c                              |  4 ++--
 14 files changed, 78 insertions(+), 10 deletions(-)

-- 
2.5.5

