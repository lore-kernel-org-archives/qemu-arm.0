Received: by 10.103.86.17 with SMTP id k17csp456211vsb;
        Tue, 20 Dec 2016 14:44:11 -0800 (PST)
X-Received: by 10.237.59.150 with SMTP id r22mr1849985qte.162.1482273851443;
        Tue, 20 Dec 2016 14:44:11 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 20si13450811qts.263.2016.12.20.14.44.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Dec 2016 14:44:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53795 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cJT8i-0004iM-Qb
	for alex.bennee@linaro.org; Tue, 20 Dec 2016 17:44:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54896)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1cJT8d-0004i7-SY
	for qemu-arm@nongnu.org; Tue, 20 Dec 2016 17:44:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1cJT8a-00040e-Pp
	for qemu-arm@nongnu.org; Tue, 20 Dec 2016 17:44:03 -0500
Received: from mail-sn1nam02on0075.outbound.protection.outlook.com
	([104.47.36.75]:52960
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>) id 1cJT8a-0003zZ-HU
	for qemu-arm@nongnu.org; Tue, 20 Dec 2016 17:44:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=1upRF7mN+oNhwp172Qw+pvgbStJ3Zi+4TFGzDDpkDeA=;
	b=AsEWALtgZz/4p69YFSXznQtmzmLjioPnCnXL+gZ3mLo4KR762cNcrRAvKAUA4W+LYSfeW/poKifokvilJPo5CwTQ6rJ0PYZxoiXH/AxE1FmbhQP9GtA80fARw1dDgWZBaix/j3tT92n24s2LRxwPBPS4ucX2DYa6hE1rpwnhK8I=
Received: from BN6PR02CA0044.namprd02.prod.outlook.com (10.173.146.158) by
	BN6PR02MB2770.namprd02.prod.outlook.com (10.175.95.148) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.789.14; Tue, 20 Dec 2016 22:43:56 +0000
Received: from CY1NAM02FT057.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::209) by BN6PR02CA0044.outlook.office365.com
	(2603:10b6:404:5f::30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.789.14 via
	Frontend Transport; Tue, 20 Dec 2016 22:43:56 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT057.mail.protection.outlook.com (10.152.75.110) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.789.10
	via Frontend Transport; Tue, 20 Dec 2016 22:43:55 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1cJT8V-0002ye-2O; Tue, 20 Dec 2016 14:43:55 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1cJT8U-0006C5-UK; Tue, 20 Dec 2016 14:43:54 -0800
Received: from [172.19.74.182] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1cJT8R-0006Ay-Qt; Tue, 20 Dec 2016 14:43:51 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
	<peter.maydell@linaro.org>, <fred.konrad@greensocs.com>
Date: Tue, 20 Dec 2016 14:42:06 -0800
Message-ID: <5b9a682feb30a4c22b068d698d65063c299d24cf.1482265908.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1482265908.git.alistair.francis@xilinx.com>
References: <cover.1482265908.git.alistair.francis@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22772.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(39410400002)(39860400002)(39850400002)(39840400002)(39450400003)(2980300002)(438002)(189002)(199003)(5001770100001)(77096006)(38730400001)(76176999)(50466002)(48376002)(33646002)(50986999)(39060400001)(118296001)(47776003)(92566002)(5003940100001)(36386004)(63266004)(626004)(6666003)(5660300001)(189998001)(106466001)(8676002)(36756003)(575784001)(8936002)(2201001)(2906002)(305945005)(4326007)(356003)(2950100002)(9786002)(81166006)(50226002)(81156014)(41533002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB2770; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT057;
	1:Rb7XJYqoB2hr8vtyoxngjJxPAntVRSrI2Ro5vyarf/x4iTNFGDJqAW+1rS571of8TSCwOiLaS8Ac69fWPLgMx6saDLNKNkEoPEZ+laTnEXvXvgXtmUh1+cmPkPExoXRjJygRFi4Bo305iwYS+vBOflrcmpXUGJIwAA3nS/Ye76DSQ29Vm5C0f1xRV8meLJnu+W0UZc0CiV0ndc2/6Nc1L61obBAXDBaQ9cSnJLyavv1xigGw6xnscx2fqWqzoXXXI7YIHxyYnrCdPtMMA633QqZZH3uO6GZqmRI4dOFCJZWdMcEdmtb8QZqotL7/IbjNNb4+yUk5FjnYMJcnAE592X7vcRiU+XYQRVfgXN5g7X8pEQDuu9w1K2EZoXjDGKBFI1S2RJ1S2tysOGGqcP0J96wFtNzL6a+CXZOHlcYj+8DIvWJNWdYU5n0WAEG8Ach7y5PbsiGywKg0icE6FQy2P65Yh1ZKGLQUCzdwNaL+xgtcmyvDb7CTbhV1BQGMmvAzedF0tTYSylqndDU5hdwCZeT3RCsCs1SbBlSDVCkCp+DQxoOgSNWYHl31x/eOEu45fL5H2B1Qt4woA6Wr5HC6bg==
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0a38f05f-bf7e-483c-e725-08d42929ae41
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:BN6PR02MB2770; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2770;
	3:3A5lMy2iX/NQZuLFCrY/nN7/p5yXDw/fzwg4rLugmvhpzlnvhrQdGqDDaWAy+FE3XCNMySB2/Z6fdH7FZ6Zwaa7h0/x5ha+M+q537Lxb7wpNlX/SrO98Jc5uAXOuCgQysZwMSlAAOxFsBK9jGgZ9T0CzXc1R0+1ZQsh+mLrQxiKEi5ChYBvFori5ASkS4yaNDb3qC+nOZHmjavTgx8R3g9uSXuPYcJo80xTuncfBAH4JiLrxoau9RCgGKOSGRMduDG4C4gwzUf2U92WxjeUi/RiGYBjuJFtd928C7cVlbtDHlB1vHgNE1xMHDlM6C5wbVkXGsDZlrvyPQ7Ap7isHh8IVyjOurGjgm3IYXYf6Efwwg7eTI2U8QMlt1c9NSK4D3VT0QvpxXpiQ1N5B8wrR4w==
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2770;
	25:6F+QiHU7pzSkDDWfLca27xVf59iNMvVFVN9osZtvPbofYpwuFdAAeEw80QNv8cLZMfrtHtvMGmoZGCHdX+cV8thcgT4tqq4+U7cZ5+t0z8tGlQeWNnNGbQA1kG+7M9onvGQPl4Cfko/CN9PPZLXqwp2zO7wmEf26r4RYuBFqdEC5kPtih3+ATaHR2o/gF3weG+ivgWkqz9oofz3BH4fHCPMybQ5uj5glUyYQ9x6iBJb/uWxU8qYjPivfDiZUMGexBzEG5vFIZaXmX/LD004WgN604XrJYa4IsLC4u4EmcsBh0QUkZE2x1t/5dyG4fdLXy/lA8AaK9W8H5sjP37TbSVvsOdNHnCzGza1luC6f2tcZSdeGfXFvAlTsNmIRxCTII66KOvKOTEk2RLzeAhj/+uZQISIoJhCzv/sUbCetUuxDGgrO3AUML4zQUx4Cjm0YeQeP3qSV7XFtufxe3srXpddeAVxGzefAiJ9S01ni5fDi9Oz+DgAFoSG7KI/P3Kc5d1RcCIpi0nMOYbwMdtRuVLEd4g9O5HRXjheNHUMu6eS3Su6SroN0qUh1wBAKeUYQptv30GRADu5G9MAouPbwaESiAe6MzLO+Vkvy7MBdIM0oW48hD2mfEFJBdHNznb8L+Yj1WViJUTQYBE9FG+GMYc9bW0Phld6wqjqC9ljtQslRbSfzOzO1rERTTkIvx5rY1jzAVvC/yA2Sw7k89wOCH3+djMFTSwpmJS6kV5hO5XvVMT/fuM1L93LfumjQSB5RNnlizROdIG+aBVwZOfy8lBJtNFaf1AKn7NnUkonEvN/VKCQkQTZKVFssomiPDErlPc7nqKLG4DhU/6xU1bngiPGzlWinTNxB2G//RR5WNfY=
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2770;
	31:Dt7A3VakWHvAiNpas/B5//tTA4BukSxEhaS7D8uAhdPZ3oN8Sr1VhP2yzcflh24o+zDU0u6Eu27lgl/04TCCsixfuEaYdbrZonmxiNRSEe584kORYN5L284/L8XztnmWTdhB7eF0nF6Qad49cF648S45n+6F5BTIRLGuovL42L8SzdnGVAxu8TxMrfqiXj+9Y0+tGroIdCoPmds1Fcpq2ODs8mxb0ZEQBFuvblggVyMtBConNFW7+Ax/nqMQ18JUjBMbPCjWK7hSRTWcdn2CWg==;
	20:qYuZxXpmPaKXnFuO57o88c0maoUHaORBya8gcl7jjJdapF+j/1gBmkUYTdBQU0YItzeJAq8e59WT6Zle1+smtMYq6eoAdbYYRUrItlbXwGWZpvzhs3LVAogrk+dhNZGGDAE1faeNBycALoO2/YwnSFJCTLY7qbSLc2wwUQtBMeDXKtYpDD3nKcexdqp/ah7xAsdq8I0fbl+aRrw2Mq18ibWpBcIS5mhiLQKvI9Mb7AJ94F9K7+V32Cs6Ara8utGnOjDsa0S0SAYfT64/fDhf19hGpEatNdk081SD76w3JFAGYT/94PiM90K7i+jwExb9vdy7ZTxp7O7+yoiJP5EyydEalpyBYh1iAFuyAfzrL5gBqJgkSrpThD16njJtZ9dYptqPB8PHKrY2eA+8vDLLShdU2lKXf2MmxkHDa3wMBqgYS0Ru0CBMxgoBRBUl5YzS/gSdTih9gOIKnwF0suIhAtCoriivP444t3JPzzBFmb1mTQe2Aj3e0cLNF278dUCJ
X-Microsoft-Antispam-PRVS: <BN6PR02MB2770FCC87EE302D1FD880BC1DC900@BN6PR02MB2770.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(21532816269658);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(13018025)(13015025)(13023025)(13017025)(13024025)(8121501046)(5005006)(3002001)(10201501046)(6055026)(6041248)(20161123560025)(20161123555025)(20161123562025)(20161123564025)(20161123558021)(6072148);
	SRVR:BN6PR02MB2770; BCL:0; PCL:0; RULEID:; SRVR:BN6PR02MB2770; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2770;
	4:radgPxAoJrekCLJMrGcq9UV6M59t0obxWbY4OH9PX464S4JjhMFaYQnQleE1vyqJZs5QHWmdhAryNqgTXvEmZXkk4UHY3PPKONS7i+Dh4CPzSPQcJS6p2gsen/3cmVJIJiMpiU9vBcUu6SBOtR+5F3OTCn3l4XRdOmAVOJ5d6AZp/U5M56/iEcqomO2sXFZw1XAw1MFJ5z/ps3gVf3WGV2MJRZrtUgeJ5UjEfDTLmdZxYBSpnVR7BbDiaBu+vSC5o5wAi61/twa/Jo8Ma/eIFk4CAH6nSC0qhGWLpU/c6YJwZ29nNKs9H7QnHRGaIKwzKfw0mOvxcwYvpVvfEVCIMO24tzNiePmIw/ZQ54bTi0vs5E+tGQsRcVD4s1RiKG3ZgfwgVrDC5OI55bcrGOt5TcgvzHrzryXFYnI/Fw4LetX+P3Jc6STJWz5A1ooNvrIwPzkVcdvCtr8CihinRpVG/+Q7nrbB5ReVXS1EbreiASzc9NlNKFWp3yQ+NoiNWQVW4tI9RuAEQmxx2suAh8FznxSaqgQdEWf67fw7EoxCAaxhhWuvdmLtkXRuocTHIuj0Cq9bn4Pi1Zzy9gnkjDf7/wjs8h6VYMiYQ1PuY4+35mNpGl5F6nGgX2PlQx/WVMPWVb0U+SY+QoVmPdPYwo/Fhl67NA+8muYIXJCwX6l00cy4mjTgOMujoi6ON/s0T0zoZ3Eo1nKE0dDSDXhtwwTkC3S7CEhGuxzcjMpax+qsES43nT1NySBQCj0BA2h2//Sr8UPaLqBd6OvcYe06/Au8fy4bEYTY1QLVDk8BICDofdg=
X-Forefront-PRVS: 0162ACCC24
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB2770;
	23:cFRzPjOcTdqrHdMJwPJtMG1gx4wkPB7AaStGzBD0T?=
	=?us-ascii?Q?SLaYgSKsGLKVVSBMhyNa5c2pEyzXiAmn9+jNtm7+uigFf1aMU7XJ1Sra/Tkl?=
	=?us-ascii?Q?/Pj2eIS+zPTq/OZgMxII0AOS0fBCGes1xhlB+5+2A9C/mcgZMCACrTU9fjmI?=
	=?us-ascii?Q?z2ULH3R7cmiM+Kb03nPWwTVWOZHRuTGfGlwZDZlGlzdrWCe+DcM+xD6o2bAo?=
	=?us-ascii?Q?D3F+1vAwQ/b7uCGE3FQnkFObUEoKSQ8NjurChozaD41nXhbLKWEtNjWvupIe?=
	=?us-ascii?Q?1953dt+z1FKPRmMeVFin1btvf4amFnuab+qAktyFXvIrUScYJvPGZVabe3YX?=
	=?us-ascii?Q?7JKfi95S1qJhVI9RjrVKys/6fxd4bzV0/kdXuLpehQu3f0nIfrz08LIiemok?=
	=?us-ascii?Q?JxIvk7r3y0gwYcncpEaZOg2l8y2J8btB6AbxncuxPPrkeVAdbVH2JSp0agBw?=
	=?us-ascii?Q?8VBKlTUMMJRZGqSaKm9DNbcfnQFHT1fH9vA/DDTtIAn6KjNH2aRysulOA+PY?=
	=?us-ascii?Q?VyvrjBT86uId0YpbxKvYmKZYsyfRkpoGeDAlGpo6ay5D3j+YKUp/Hzva6eE0?=
	=?us-ascii?Q?QukgsjTo92kQiBVFa8j1Avq7HzCNJ0VzdSd4ArsvMDVdt0+5yLxKUHQGLp0D?=
	=?us-ascii?Q?a7LNSdKoapNyTYHaXs7FK+bYj4ZdF3/pcQjAcW5vFDZz8WN46OD5BG/Dy0qZ?=
	=?us-ascii?Q?3RFQVHLEjpyVyhjGcGBR8trg7trr/RKUjWdbgz8I3qkBIOUAC3hDD6fgPbZA?=
	=?us-ascii?Q?sGNi9rpLE6HR5t54x/JYoc0GUK8vcPDtsk/DPEbIhq+v05k/QEirG8dq5R+r?=
	=?us-ascii?Q?xdfn6Q2cvA6p4Hlffco9ZuTZs9A/hhFTemKzonv/sBX0Yp43OxXf6eabD6M1?=
	=?us-ascii?Q?aZwTjW9mr1LBFgMwZSsy+7HTmFP005tg+Hw6xLCb43NjwRbFBhQcWQyZyFDO?=
	=?us-ascii?Q?MBEs1eGOTgxniXNNIdwx5krEXWdYoqFdRNWhBso+FiJkF0p4+t0SM6tntCRe?=
	=?us-ascii?Q?J2kh6Jg1f3PTVNF5oeNrbxCXolCdGu1grAvVgGwLs79jWQWWMxzhDN4BZaA6?=
	=?us-ascii?Q?xUTg9ZwuY045I22Lp9z/yMPS1zmIhfp9Iz7z2Hmpr84mqeKxDxu7FCSAM4a5?=
	=?us-ascii?Q?ENga9ixBL/TqKdsQqay5SSyltJjEebTeIxY46I9srWVjTXid9HEfQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2770;
	6:4cQUp1oD5yJOsSuksVfF3Emb3MMyF9wjTDaPTUIs0ipFiwx9wAr58OUWuD0TPu4xua1LmrGwrb7FJ5iOhuLpcz1HJdqdDBEYT9RqDQ6Q0lj5aqGOZvnj2G5KxIM7NFC9Ph7vhL9Dh3svB2r8uEhkEjTSbDd44nb7XspG8js33ToIwwpy6NZB1cpzaTH0CYvbzMyQkwxTNSb67TictMQUWaC29ZxpmFoct1KVZNN9ThKf7+2TbkuNB7K8tVOUFZQyUmSk1g+5bwCYNXfGzzQJOfdAid+r+ZLRcVUbkHEP7fYAc2tF49HbOJpZHBGc/ey0NdU2wb1rTDmxE0BpoUQRFje0tLfUaSPHqfIwGoV19B53gR9LaU66kCObg8OmhYQi07PBr68oPj3nN5qnhxwG71LP0vd4G1EeCOcxdObfjE/JU4mwFlB6wxA2h60ijretSllFX5o/az4YaS4T4m13iw==;
	5:7iX82uZsApKyKneMFZ5YYsq7Zav76hobMjkwJG8lJdyOqDiHjeaHo597JOxbc6F3hW35gczqnCR6tLeCSpt+C/cj9Q8Jcjr4t2i397zu2IJUmr1pvenYcqa6doki4EEkSxmrB/SGo/lur2AePNb6eg==;
	24:pjlJxJCAfZa+dnVj2Xtr6rqd2ta43eDDZt7fIzC2cQW20FMvJHb/8g7vW4By0mQI28XGHt599VWQ2J43EqvKkngvm1chrGMGIJxddux1/R0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2770;
	7:t1r3uiod9HmnFqN32V/4/KHikBKzmRfwXxAt0+K4nU/Z4dphbH54grJfFXO4kEbelBnXWHH8UGcw39LgPuDgl3p42auc0ywKQbarJK3emPyZitArkrDyAyz/BdJqozVHqhYX2sqRNQ+Xgdt7ipnH77W8yd4CK8EEKXvSHakxgSCS6PXWr/g/YFv9aSbeKxeGVZY+4uqpAOCAANADrSQjNx/I2l4ZxhT9+4LapAXArtk+584As4XrXNMJBsIBoXd9Pfs/wnFISialbT02ponGW67JFHm6G9CERE2wUah8t1lfbGjbzDTaaaGtxQkFZq1p3iY90mds9lktiVCRhJ+m1AWLUMibB0PF5unx7+k5/pS3PlJliVzOlx++EInz6pB1jgovUIB0yh3pOPhtNNJ6kJWPTMRP6cSf3UvYH3jr6LR4/Gbd35vi4Nl6w6YEXfHSAaXDurEDnFMPPF3MvpaYWg==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2016 22:43:55.6128 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2770
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.75
Subject: [Qemu-arm] [PATCH v3 3/3] xlnx-zynqmp: Connect the ARM Generic Timer
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
Cc: alistair23@gmail.com, alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: leMKEpNowQQA

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 hw/arm/xlnx-zynqmp.c         | 14 ++++++++++++++
 include/hw/arm/xlnx-zynqmp.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 0d86ba3..f3891ae 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -38,6 +38,8 @@
 #define SATA_ADDR           0xFD0C0000
 #define SATA_NUM_PORTS      2
 
+#define ARM_GEN_TIMER_ADDR  0xFF260000
+
 #define DP_ADDR             0xfd4a0000
 #define DP_IRQ              113
 
@@ -172,6 +174,10 @@ static void xlnx_zynqmp_init(Object *obj)
         qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
     }
 
+    object_initialize(&s->arm_gen_timer, sizeof(s->arm_gen_timer),
+                      TYPE_ARM_GEN_TIMER);
+    qdev_set_parent_bus(DEVICE(&s->arm_gen_timer), sysbus_get_default());
+
     object_initialize(&s->dp, sizeof(s->dp), TYPE_XLNX_DP);
     qdev_set_parent_bus(DEVICE(&s->dp), sysbus_get_default());
 
@@ -405,6 +411,14 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         g_free(bus_name);
     }
 
+    object_property_set_bool(OBJECT(&s->arm_gen_timer), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->arm_gen_timer), 0, ARM_GEN_TIMER_ADDR);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->arm_gen_timer), 1, ARM_GEN_TIMER_ADDR - 0x10000);
+
     object_property_set_bool(OBJECT(&s->dp), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index c2931bf..8deabb4 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -26,6 +26,7 @@
 #include "hw/ide/ahci.h"
 #include "hw/sd/sdhci.h"
 #include "hw/ssi/xilinx_spips.h"
+#include "hw/timer/arm_generic_timer.h"
 #include "hw/dma/xlnx_dpdma.h"
 #include "hw/display/xlnx_dp.h"
 
@@ -83,6 +84,7 @@ typedef struct XlnxZynqMPState {
     SysbusAHCIState sata;
     SDHCIState sdhci[XLNX_ZYNQMP_NUM_SDHCI];
     XilinxSPIPS spi[XLNX_ZYNQMP_NUM_SPIS];
+    ARMGenTimer arm_gen_timer;
     XlnxDPState dp;
     XlnxDPDMAState dpdma;
 
-- 
2.7.4

