Received: by 10.103.86.17 with SMTP id k17csp456744vsb;
        Tue, 20 Dec 2016 14:45:52 -0800 (PST)
X-Received: by 10.55.157.199 with SMTP id g190mr1718618qke.313.1482273952124;
        Tue, 20 Dec 2016 14:45:52 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t10si6058819qkt.160.2016.12.20.14.45.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Dec 2016 14:45:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53805 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cJTAL-0005cX-KO
	for alex.bennee@linaro.org; Tue, 20 Dec 2016 17:45:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1cJT8d-0004i6-La
	for qemu-devel@nongnu.org; Tue, 20 Dec 2016 17:44:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1cJT8a-00040N-Fh
	for qemu-devel@nongnu.org; Tue, 20 Dec 2016 17:44:03 -0500
Received: from mail-by2nam03on0058.outbound.protection.outlook.com
	([104.47.42.58]:20386
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>) id 1cJT8a-0003zX-4n
	for qemu-devel@nongnu.org; Tue, 20 Dec 2016 17:44:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=cl2EL3I9bBOMgp3Hf4x862dgCtVp2HwO00mXRu4/U6M=;
	b=qlBp+Gvf3g1R/05A/TCggXtb4KWoadg9AXFWThL9+DOiqYQ6Vi+rmF7eLXGmkETbjNwcK1VMkrgErYahZy1IF8fYtRj4tvi/ySieN96BaLMMVtvuFasu+i2wBU2YCPam9VubadYkzmH6+ndM+P3MmEvA41poQ38Ka2unQOLa5/c=
Received: from DM5PR02CA0065.namprd02.prod.outlook.com (10.168.192.27) by
	BY2PR02MB202.namprd02.prod.outlook.com (10.242.232.22) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.789.14; Tue, 20 Dec 2016 22:43:55 +0000
Received: from SN1NAM02FT001.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::204) by DM5PR02CA0065.outlook.office365.com
	(2603:10b6:3:39::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.789.14 via
	Frontend Transport; Tue, 20 Dec 2016 22:43:56 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT001.mail.protection.outlook.com (10.152.72.158) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.789.10
	via Frontend Transport; Tue, 20 Dec 2016 22:43:55 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:45507
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1cJT8V-0001G1-7R; Tue, 20 Dec 2016 14:43:55 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1cJT8V-0006C5-46; Tue, 20 Dec 2016 14:43:55 -0800
Received: from [172.19.74.182] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1cJT8K-00069A-LR; Tue, 20 Dec 2016 14:43:44 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
	<peter.maydell@linaro.org>, <fred.konrad@greensocs.com>
Date: Tue, 20 Dec 2016 14:41:59 -0800
Message-ID: <cover.1482265908.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22772.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(39450400003)(39840400002)(39410400002)(39860400002)(39850400002)(2980300002)(438002)(189002)(199003)(81166006)(48376002)(33646002)(6666003)(106466001)(356003)(50466002)(305945005)(189998001)(63266004)(50986999)(36756003)(9786002)(39060400001)(8676002)(36386004)(5001770100001)(92566002)(38730400001)(4326007)(2906002)(50226002)(5660300001)(5003940100001)(81156014)(47776003)(77096006)(626004)(2201001)(8936002)(41533002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB202; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT001;
	1:EAYzMn0v4vgl443axrH13KE/MOSUageS65nR3nlqNGx2Zb4eoPAA/co/3A/InoZf9Ww99LIVG4BivogEii2Bl2eDZksMkt/txFj+dQK/bvuWVWBPcQbDht5ipuhZKp6AQEhep75UaL0dFPxeClIkWBqhrm9mCjz3OKjnz+1YwtxK4sn1Ru7eXgHz4nrYoh/NZGCJaHep88XSyVNZmqjWrugKwW29ntWGQWHD6EWsTs+0NS18nINtjRwnhIHe8PNsn5VRr3zf8+TLsXD6gAeTyMkWgtiCT5TADghhR2nGhJQSChvx6eOAS6sVKtoEE/JTfLQb281WWEPUwX8SseUid1BTI7LstLrj2M2LNevb/4nfNMyFcaklgXKhKMULCh2gzWyH0ys8p7YBEBc7r2YxIKLRfUKqZeDFzFMwNzm9AWwz8fZgCJbFLJ7hvUp+M+wrEt/bXY+CcZW2+J/2m54FqCyf9Mm4Y4fjUDuzyWUnijioowkiiRyQkI5p1sX+0Vuew2S7XQr/lirYpakB8JZM4/LtY07ZX7vf/CS6ak5e6elyFz+LWfVKyOt65D/8RcMUwdxxByHpf34uNP/e/fXwTA==
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8865c5e8-65c1-4b8e-a8de-08d42929ae3c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:BY2PR02MB202; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB202;
	3:jIRjR8arDBgWafQagRda6gdk4BT72eglqQRV5u5Vxkxj428hRMXvP0OmNgkrfioOlMVJk2lNkplXnaTlXSlBrqrXwctH03siLfPybqDalDbEx0p11kTEuG4ahLJj4a2OTR0opBq31FI2BuMWFIrQMJl/JQdLV1fs5uTlPhWUb+WLRDjMrz2UZsL2bEP3/kuLqW4Y0vZNyFz/+8hilHn21/zrNlY24l50CeGxT/agtqTLNeE/mSozMGF65f9ILJtgS7urOc+qiX4Hn6X+7KbYBsSJJ6YNDkepvSj3i+LbVtz8wpffZT1WEjAY8KPBKO++5tWSAKxY4zHVImsh46gvOkzQlyC36bt1/X2eu2ckaaUYPcFvfIjmC9J5qfj/mL9omHLfzNVxHlohFXPqDwiqKQ==
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB202;
	25:cF/uXFHiI7pgWf0kSvU7f8YP599eNHKjmdaRSFes9zG2qcz2rdeTGnClPnYlHRU/PEbs5PT3FxN5g78vOSeIM80WVRks1y2Uf4b6pdvyAcNwORgef6cvskvoyEFZnRp0sGpootAHVXl1J4WfuwQOnFWCiXcxEwllA11idyUSNfbA9kr4pPy8gETZwCDrpz4XWkBWj0EZZ5pm8YrJuRQupEn35HZMnGJN/6Q2Rvunhg0E/WIFkEM+KTfsfF7oaZ3VDvMIo28pOAATV4iOuI7cfUPRoeu7JbYZ13nO57DNLLJcRMAtNt2mMRJSXozQ3sdkc3yBtv2R4izGNzAHOadiMXTLGJaTaMX9ehg4PWcRo++/2Rd0+4hnZbBNgFrhO2KfzTk92LuWwa4ujUS/j4okzIV0qr5CxB8/dgaYXXEEywzBS45PnjROPRjWEJwoqrTluvxu/giAYwRSuEohzghRCT5QppXD2tpif16dPARGRs3cDSrh9l0BW2IxcGm6ekT1JAMmzTOOm7aoVehXUaqV+xbNCFMrP8EYDaxoeTIrJpLT0wsWjFuFu01GoSJKCiu3lxs8PN93DlIQvWLw8bKL9G3OXD80vNPm0se4u8FyhgSpAnplHrk7bEgq1fEb3wTkBheTT/AbBqdcHpCZPDi0686PJgGL5M1H8Stps7Fa7betCAtGCGtf/z73osgktYxe2tPSEvJRD4ANTIM7GVqYLPja60h7gYW+pdxcqktRHyA7YTzk1oqqvp9gdf1e83ZQcMSmTcLz7mFgWhvy6GPDN08luP8DWQ3Sm9k2uN16lSEFfjSlbhO0CbDEex4elo8Eyut4SZdkL5eE1uNPdR2jHJd0SQEQQB6gUR3sneZAiqg=
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB202;
	31:1efQJMFwzQ043d2QvgvO6aRqjZUJ7jZ3hNbAjrujRVHN/lPaQNDbWDs8906ojIB7cfpc1M07m9sMiy7KTps/18a1/wofGYuT3OFDfPBwFzGqZnn0QXnVTwhQCHpxEvcHmFF//bvAzNCl8G8jNhRpmQEZ92WOBubM+tirR8HGDn6USt9er1AWtcZl510Rb60hoW/CctEQqKU1T7Otff1sUwIjg3qsZyO8f3fd0l/yewWwlDS+ftvn0oPb8egl7O42QBx3k/h+HjRbd/AycMO0kw==;
	20:0/7PauS3N2gMDSAR9PccIE2QXB1MZATswqbojw6CLxH1Z5wZQigwLmuo9z7bzvn3O6ecudnpqNzMhipTbGLlxT+u5bgrGwqETfFfV84eHE2bbRRw7SkotOrnacCnNofQ/e8S5Cj8+aN4ALs9HEk9TKKptkWdtyMGAs6SZnplzSu8AJz8oOZrkVxCKSN/JOoXzvCA9jAK+BUC5lC6T4ToP+k2joLsTcJs3T4v1gZC7H5SCEpGtDrXqIVWVymo+0s2v+juType1DZzvA0QGoYGtrJP86k820Vb529Em427AVnO4nDGXq2hMs2AlyLLe5LrYGbCrHZgpByIUUj4RKTC46OOhvVMogyP4wp1VJQWjpL7Gi0JV+BfNbO5nFXqipssfR77oBU4yHYbuNTvE8jFYwiQ/lcUObX8y0bgkAg5jUoR55SwKyfd7wpV2shrPzLFDhgvRYU2smeXx9B8o+kRKIKTO+A9xWFit9QUaG/V0Qe3Ut7KZEObMONPGqmUqNqp
X-Microsoft-Antispam-PRVS: <BY2PR02MB2020F0C90C1E56E5237BB57DC900@BY2PR02MB202.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(21532816269658);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(13024025)(13023025)(13017025)(5005006)(13015025)(8121501046)(13018025)(10201501046)(3002001)(6055026)(6041248)(20161123562025)(20161123564025)(20161123560025)(20161123555025)(6072148);
	SRVR:BY2PR02MB202; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB202; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB202;
	4:Bk7Yb0HPOT3TJERWuliO+F/TZ7X3HYZBPsHFks65pn6QP/FpWTZYtVz7aJM1mR5MYri00rS/c0kfFnE7yeqR3Yc3WK6LqtrHphGwhEJ0q6scKQ6+4l8Cpoyeg3UKPggzDvkgyc3O6iDler6IrBGsWK9FoIXMsfwMrRKkl7wx168oiKkqFq/WaxV22GcZkhg/vsq5mZhjVyJwnmZgDcFfgcPaEmBNUiCfzPrnLA3cV/PAtyZABE+M+cIMb1pIM+Kxjtd5WlJZUQrx9TvFG104mEEEdvxzM3z0RLb6Yda/5eE7j7Lo1ICJczs3WHAibCg+KjVambhgclHFUHu2bMba0lGZ0/bJdeTHbZzjgWxbUJ8OH2AJweKG6i9L9LdpF1Q4dyfyIFqc5op6mpxgaNg9nwhJqachmE9IKXRqMOcCgq+LImf7h+B4WGTmLFa9vpzhgQMbf7ctPybSWApzyC+Gf9DOUoRQ3pWTj5G1oRVmXWkA/EqZXVdMgWoeJNZDtxuVSvKm7nRO9NRDjH/rn2p/QCgbaIrBAc2KwVvVUQD/1qzXypl2wrAIsYRYzIJJ2U2tWx3izEa0PQIzlQ+ONUnBrmT65HVH27dFTH9mV13e3pBoQ94O1hsZlmlzr2NAXAKk4ssOVuHOpklKmATUJp8DxfQVoVVMryUrNUQFThx/znglVyfG1FYfs1ngs6FjnNWeDBg67erA4xuLBn7JkFuYHcfoK5Rhjy/hmSFM1yxCNiE=
X-Forefront-PRVS: 0162ACCC24
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB202;
	23:OcDSNewMVz3LVptaYgBxIioJXrVgPzABanlJhCshro?=
	=?us-ascii?Q?IcGc/Cup6KRAlCWn6iEibnDxua2ohH8aAtu/0bKE2E1aWJH58WydPC9nn2dX?=
	=?us-ascii?Q?CbEoRYv0+4rDaSn945fDOAQvNlmSKinugFHytPt+naAmPZ9J02feZYoLW3ip?=
	=?us-ascii?Q?WqMDTR5EHcghFExcdYnscsnw//p/r/Edj9HCPDQhCmnH55lzGCRuIMBrEtVq?=
	=?us-ascii?Q?liwGMBXoHGbtzMiWi74BBOYtVyiCoQU/+OIas14VHGvsiMhbbn3/5eJSsKcv?=
	=?us-ascii?Q?gC2UavGtQPX5GTw418swDWPz1I4D/WsA65Ku4aGI2hIHmyg9cMSBLcP88tMl?=
	=?us-ascii?Q?kDi0GhlR65ZIfys0sYVGraEGn9njhmyvY7j9dp6R2STL2t+n3Q8F4Tu2db2X?=
	=?us-ascii?Q?1qz4VN5OWQzjXj89wHc8Y9LdT1qFqXvtrMgvs+xmj055Ip7hNUC2/dYe+Fjy?=
	=?us-ascii?Q?djuGLyBEAKe8UYIw6wUux36y40qfLx2tjSFnQDcpE3BaphvntBW2Oxhqw4Af?=
	=?us-ascii?Q?FlzdXY3vmNTZDyArXn8eeaM2XvvYpoVpEzMygJyvBRR9dAQQkhsH7/WcfEIj?=
	=?us-ascii?Q?yhjblUdsbQTSUglHzYlaDumyO3Ct76euLglJWsm8TLxu0OpN13SXnSRFIIin?=
	=?us-ascii?Q?12HfIETkWAsgwEH91ZOGrZ+qqdJTS1KJYpCBGl+lrAft36WlANW2hSlano0M?=
	=?us-ascii?Q?iDJlSNVS+RpoGTcR+jbLtOjMyI2f3HYESNUjddgQn3c+omTko9qLcq7ggqgc?=
	=?us-ascii?Q?O0u4suEwOG/ZxlpHY9KgpCvOICGZSJbOmsCEEW62nrh4RzPixxcbaZC3hFWT?=
	=?us-ascii?Q?s560R4UWgBhAVKW5nCBj4oNqjAvjc3JQk7DnKvknu5/fbrlKLj6FxXimmLu8?=
	=?us-ascii?Q?oVaKadMZGGfMYL3stHQPumLwyuW6HL6TK95fS76CM2kPwh0CGqI7v63U6jYn?=
	=?us-ascii?Q?nri8wNtnYRpPMCX/0NswflUxr55/p/x4MxX76AqxDuxqAhYYHBmpJGV3iwSt?=
	=?us-ascii?Q?KvBrNJojwmsNwCKilhaKkEaPAFA+tGeGflFYrP12HR97IPHqZihSsAmergmR?=
	=?us-ascii?Q?5vUbHD+6mXbwwJRzzMTPr3pmFLQFpyOgdAyaMDNsLjpiGxBNEELxgNMJzJKK?=
	=?us-ascii?Q?amkyHJNlM=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB202;
	6:wnRjoZ9ZEcCrVKOPhOTIuEBjUiGF2stTjWbGO7UwufuvTsEan6jw1zT4PH1NmFAS1P0IbmqCIj5Fui1GiGJ4qTrxTAtFP+b874wlNAQnIFH9h82Sc62QsNLCpdKL39O7OqFzVtS568UCLJhJ7Vib9z3zD+grDV068QVlQh9rfJnioVXOCKGaRxY8P5dxBXkUfJIu7KiviW4xoCg639eXyEkCez5zjc+KnHgKwdjSJDJH89ldpXKyzjw7PsBHZXbOrrrTvx/MhktdihuyGWGEDbahcOMovGyjR3bTW/p3SPv8IZ33c2GBanne0DoZrIU1PqUD9qNPLEj+JMg893b9E1pNGM4BcSekwVBWBjjr4PAYWRlr0yeC+SydgjggH2nwFkTJQRpypkVvmDQ0RB39d5SY+k5S4RiOOA7jyXcWuwGm6oePcfx8IwsCsRmF80VnNVn3YBh2FD0kRScOMb1Ipg==;
	5:MaYh/DyRh1d5B9/CLFELMPLXPJj1DSZbKdVMyrqAMOpkd6wbjOPVEytb1Kyf3CbNhsxnkaVSH7vIGkunky46UsGCD+hfBJzknFUrzvgVNmsV6yKrQ86L8XtocFJ/Z86hZl9VaMOFHZQZXoyBVobNbg==;
	24:8VodWbEsBDjPla5nYus2F3xxJxJ2fFAWuyNhlUKvRDTXOJ98qw4sZccMO5Hj1w1mFi+DiC8qzcY2yQf+xRsJbnxuzIced1gr5KbZK7dnJ/U=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB202;
	7:p5F2S0SXwCG6WEgsd6KKfzx4VrGDEdWO4a1KvX8jdjrFH+85zg43iILasCuF8F1JIrGRBcnXxDp7kj5JcRt59PWmVpfQ3RWIH3lWxPHo0n/MsofBZsBsNfNA3qytdCtrtITM6BIsykw0ZbiEUmKmCA5bMPB++4bmmV/TwMf3+JQunACP0cISsJ49gfa76nLL2XxpccZa9XJ3ExpF4Ll/8xhmZ1gryb3LeqeHmgb6BqpZKH0HPvo3NJrJD315cHb+Txcts+QKp9dDi6Ye8CihOy/CNqm7s5M+bU8vib2PKbdIbfXP/Nx5/OF+zlvrMuyHLQANc7HDjWbCjNBiWe9yyhzuAa9eSfg32VZ6D7mvj3HpyjpY7ulXPncnbQW2gJ54aw9n+egzxDb9FjA6GrSHJSAaKElPdRaWY5oUy6FnX602BG+yL3Y+BfXToJlr2AqfbI5hLQMGbnw7DYVjJby+fQ==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2016 22:43:55.7347 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB202
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.58
Subject: [Qemu-devel] [PATCH v3 0/3]  Add the generic ARM timer
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
Cc: alistair23@gmail.com, alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6H1OyNb9/cYi

These three patches and and connect the Generic ARM Timer. This includes
support for dropping insecure writes and includes the ReadBase memory
map.

V3:
 - Add the ReadBase memory map
 - Update the names to match the ARM ARM
V2:
 - Fix couter/counter typo


Alistair Francis (3):
  arm_generic_timer: Add the ARM Generic Timer
  arm_generic_timer: Add support for the ReadBase memory map
  xlnx-zynqmp: Connect the ARM Generic Timer

 hw/arm/xlnx-zynqmp.c                 |  14 +++
 hw/timer/Makefile.objs               |   1 +
 hw/timer/arm_generic_timer.c         | 232 +++++++++++++++++++++++++++++++++++
 include/hw/arm/xlnx-zynqmp.h         |   2 +
 include/hw/timer/arm_generic_timer.h |  74 +++++++++++
 5 files changed, 323 insertions(+)
 create mode 100644 hw/timer/arm_generic_timer.c
 create mode 100644 include/hw/timer/arm_generic_timer.h

-- 
2.7.4

