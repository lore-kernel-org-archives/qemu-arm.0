Received: by 10.25.0.6 with SMTP id 6csp1785550lfa;
        Tue, 23 May 2017 04:17:52 -0700 (PDT)
X-Received: by 10.176.3.176 with SMTP id 45mr12430731uau.28.1495538272665;
        Tue, 23 May 2017 04:17:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495538272; cv=none;
        d=google.com; s=arc-20160816;
        b=mQPabjxYtSIjIRmQiClhSkTHHox/sYQRubRc2Kjj+9eNnjbr6iLsbXL4ihno7YnMOY
         xUxl+X/ApMVgq+jilWUeuvvDXyquvjyv7IPURy7RRGAPfBEuRMdWtlnCzgZd+9pHe1qz
         ivp81x2moGmrvLjbjqd7I6nNJXqGBUQkDOcnrXNgoxfhwqi1Ie9TfZNxFJcNeC6VnjtB
         +HB1Zoq6C01BClEt1fNiVs/QD3H4hFFAgZFzB2UPit+MTLo9JJSdgBEQ3/ytTif8QVli
         7anTSP9KeyFMoy+VfIAa/CXqAksHDaLinP/D0BQnVvX1pPtFMeqYgYTfGl4QTnbTik0E
         HS3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:arc-authentication-results;
        bh=MBi2IBU+eQSbszOSBEclo3PuOvFTligCJNthUtHaSWc=;
        b=yZb+KHuIKmCwoy9SY8QQ5210uHsHYsz9RoQSvtuszmqLWxL+3OyvBsATDcU0Jel03o
         SXq4ubk0Loq8kPKVDnjvLuHWC77mm2D/utfrHVmaUW/QM7jSPYgzXqkI3RNibfc2McdI
         ITYnALVHtaVl24JeFBg9vuN7TQfrtJUDw41Wf4wMNVe9pGjxZpoHolAtj8dsQpoWKSiW
         txEefNADGHCeErhf8pt1If5AVGP/ags4j+8NF714M806q0QK2AqMkOaaF0DEVwuY/EUa
         EofNYQETRqhsiwRpN1OC2uD9t6Gq8uvLe4OaDcy9FQyi1A+C+8SjdIQlFiSSBaGCUoAH
         3H4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q130si7380448vkd.248.2017.05.23.04.17.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 May 2017 04:17:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:47749 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dD7p2-0002ex-1Z
	for alex.bennee@linaro.org; Tue, 23 May 2017 07:17:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dD7ki-0007R2-Jf
	for qemu-devel@nongnu.org; Tue, 23 May 2017 07:13:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dD7kd-0002r6-J4
	for qemu-devel@nongnu.org; Tue, 23 May 2017 07:13:24 -0400
Received: from mail-sn1nam02on0074.outbound.protection.outlook.com
	([104.47.36.74]:31264
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <diana.craciun@nxp.com>)
	id 1dD7kR-0002dN-GH; Tue, 23 May 2017 07:13:07 -0400
Received: from BN6PR03CA0067.namprd03.prod.outlook.com (10.173.137.29) by
	CY1PR0301MB0907.namprd03.prod.outlook.com (10.160.165.18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1101.14; Tue, 23 May 2017 11:13:05 +0000
Received: from BL2FFO11FD052.protection.gbl (2a01:111:f400:7c09::175) by
	BN6PR03CA0067.outlook.office365.com (2603:10b6:404:4c::29) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1101.14 via
	Frontend Transport; Tue, 23 May 2017 11:13:05 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD052.mail.protection.outlook.com (10.173.161.214) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.1075.5 via Frontend Transport; Tue, 23 May 2017 11:13:05 +0000
Received: from fsr-fed2364-102.ea.freescale.net
	(fsr-fed2364-102.ea.freescale.net [10.171.73.3])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id v4NBCnX9030520;
	Tue, 23 May 2017 04:13:02 -0700
From: Diana Craciun <diana.craciun@nxp.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 23 May 2017 14:12:45 +0300
Message-ID: <1495537965-4187-3-git-send-email-diana.craciun@nxp.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
References: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131400115852572145;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39380400002)(39410400002)(39400400002)(39850400002)(39840400002)(39450400003)(39860400002)(2980300002)(1109001)(1110001)(339900001)(199003)(189002)(9170700003)(5003940100001)(48376002)(53936002)(85426001)(2351001)(7416002)(81166006)(6666003)(356003)(5660300001)(50986999)(104016004)(76176999)(47776003)(6916009)(189998001)(305945005)(2950100002)(8656002)(50466002)(4326008)(77096006)(54906002)(33646002)(50226002)(38730400002)(2906002)(86362001)(498600001)(110136004)(36756003)(105606002)(106466001)(8936002)(8676002)(575784001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0301MB0907;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; A:1;
	MX:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD052;
	1:crjlswi8i7MM0T2SF5lXIJPYb5wnP5j4go9J5PgsJVlUSZrjaAtczr1yOnW0l1PQwi/B8JT7SIODC/XRrq1bB3IdHK3e8l+/SdH6mqOpA/IxsbrZTeT9wkvH3LHyHabFISEvDujQrRZHFJ4vS2q0kj7a4/Aw/H+cJVYVxZnn5bTYLN5WBBP51UEe2ko7TV6gE1htbbM8gaBukf0/7TIyZA0H3fn5GEp8/0WnHskAvJBuRKSiLdABZqVASFAvMWn2DETyz3UFpGLnXboBB+eljlR5QYbKQoAYWAvtbYYfPeS3DcXeRxLZ1YbfVx5Tw++iJy+Eb0tpDZyvFuWywbkM/EY6Yq0Xo9cg0oD7EmIZQQk7MKP1DCo/U37+CCZVF3O/phWynBP1Ep+kEIZetZvVHy2GI7+i0BAn8gD/P515ujFG/jhC+lPBIHcLgMpu2ptGYNUDx7epMbc15LartQ7nHM+XV3/hvqAPZ7+9ywpGaAxA0B+nEcVic0YJ7GOPENPaHblxL21bjuk2PTkAdfHZjLC24gP7ZySMl05PXcFbfZN0GW/JyKxWd+RnKZYpRzleBL4X5s0903eaIlI56ulSsPadFmox61tvKD2kPe7OSUK78JF5uIRr/tLc5rnQQTs8fVpYcYIV63JzylQgkvW9g6GHz8CbKfOM029rLsJubMicXd2EHDx/lG0Jiahav+qAy1t9ttQvpmGB+SvJHgEiw10kk24hfWjqRkpRZf87ClE=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR0301MB0907:
X-MS-Office365-Filtering-Correlation-Id: 1211d11d-5cb4-4ced-1493-08d4a1ccaf4b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131430075)(201703131517081);
	SRVR:CY1PR0301MB0907; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0907;
	3:qnr6c5UgJ1Go5ILQ/2X/A/qWcetwcuDZOV35j4t0CjDxlZDAVUbJPiUJ+O3a3L+6cVXVWhhUijCozNmcFhs+4mm0qh9MMtWaD4Yrnt2f6w/jS/bFuZbuxND/w7vv8fjlP8xBRIOhyiYFj8hzzAworrjJXOH1fyWDv9f2mDKjcB5aA+XezaTLWYuhE2I1BwYsSYq2SwjToB1dPRmJK8+NwoCJoqfK33wCqpFlAhSSOEEXeH76FnelK7CqLkic7fKoOuZ2uNcOj5RbjcrFBQ7gBcpBp50Mvbg//C6LmMYcx+dP77CnLlIJVfoJ43qUqJikIE5phVwIbZuu6ITmnj693490Gj2bvDHu71kH2wShvhGedO1lH+0NfJdP9nNsnhYNx+tmlyJAI1Ep7/AN6OBktHBu5NUWLGmAN5XjQUMml2IB+6hfGXrYMBVZT9IxYhbn;
	25:bm2Wu+O64k6ZsozIc/z/ebcL6lAQwq1Y+kAd8NP7lAZH3mJmluKWcMdUBuwBWImWnUogJeTfzVpKoAhYCD98uDrYgUHzfbITtdJZSmSDtS/90oA3BoJowvTtbSyM85nyMjro62u8eBtjPYgGQmSssYCF6a0JkXVkxaEIKpAOsyTENK7EQaza/0xVqMlUHFpb9Vc7wAF1ophQkN1FPtuKpEU9kgD9LDH4R+KoU9md1Z8tPhj8boi4FluyccmwU+xtDjMe2DmvZGhELbteFLlhKMVZSkgNoJyfe4AC/oE7Uzdm8CTmzLwXrJC7HeubyEO9RuV8tdnRGN+4WHSoFSPiydHFFtgTwuJBjX34haS5cu6EYDNaAuIByXfLvpnnK42mrLBaODYxm3aurQHdGQqdqNBHQ5D4NJ/BcYFXphL+sPY+s4dA2NxmNcseDWEuWtrWlNoMksRhqR6/gsj8FCWposE6I8Ut7BxyS5Mo9uNWQJs=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0907;
	31:0PwKUxBkhAXMTvhAQyAqz7L6pVfenFFgCWPVmzbgpAYVvYGTrUdrg4kZ1wPPJKMThrjqxSsvOBQHEmaXIEVVeLlE6obWah4vGjkdjeFII9QMzNUZBR1lkIwbPd59LrE6rEWorpzBRrDEZyZueNvgMIgHHMtB98opM4pA4cCljpT3M+m3df7eC81DDLTxsc00mnQmXn+vn6kTnMmeOVhKtrDiObhxJbCssGB4NfexpxGpZGyFUO6bXe+y3hHg2LH9
X-Microsoft-Antispam-PRVS: <CY1PR0301MB09070EE9119BB79E89719641FFF90@CY1PR0301MB0907.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095135)(601004)(2401047)(13023025)(13018025)(8121501046)(13015025)(5005006)(13017025)(13024025)(93006095)(93001095)(10201501046)(3002001)(6055026)(6096035)(20161123559100)(20161123556025)(20161123563025)(20161123565025)(20161123561025)(201703131430075)(201703131433075)(201703131448075)(201703161259150)(201703151042153);
	SRVR:CY1PR0301MB0907; BCL:0; PCL:0; RULEID:(400006);
	SRVR:CY1PR0301MB0907; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB0907;
	4:fam7lsVJ8CO7MgckbliZm/mPz2Wxu/Vt1zu34VQb?=
	=?us-ascii?Q?Efb+EqI9H+sQz8QJQpAjVpfKxc6PNRpUFpcU+pFV+IIGHS6La8DsUveQqtqN?=
	=?us-ascii?Q?vJDFWdGVXy6aPnZx6HPSooHfpC9PIby8QZQ+1G8q6zax+UhInOUEw7QbWsp8?=
	=?us-ascii?Q?ubymEVvmFYQ86+tjSv4WG0MAzPet2iLvGyo1cObonCAWHoy+WJLRvY7sfP3z?=
	=?us-ascii?Q?lC7KNzLutBA37B4sAK4AoAGt5KzgPBXNE+SnIDvl6d9cT1hkWUIh9+rq4KVy?=
	=?us-ascii?Q?Mclys/5hkzJvUBrouHuwoSk7fz7Inqv7zIlzdH3zxhmtzDBbg7oBLsb2NNzZ?=
	=?us-ascii?Q?iDtluzb13Qx4wcazmYMmc8xiR9x9AI4YAu8/R36sCSUz7CKgzzWJiI5a6Icq?=
	=?us-ascii?Q?DtK7XZWPXbrjN/4VcJZOz3tZ9R5esLyVlYiiHvWvqPf7hftpI8UXMMpEsWox?=
	=?us-ascii?Q?FjO8A06qyNuSJv5Q/Psj1+Pfj7Jlg6JaADo4X7MAbWyXb03MUYtKBVSKq+g4?=
	=?us-ascii?Q?6VuYmMBTv7QfHKWRLocadlsS4X23pUskqMxi16pi/jo1BEj6tRndrUzKXIIN?=
	=?us-ascii?Q?Mq6knDUTU7NaQyFnq334H5s3rlKlN+VNYIInvJj0TIl0FI/Zs5ppYkHxJCzw?=
	=?us-ascii?Q?c4i+RKf6wDJdc0nvjAdvNpsCsoWzRNk/flhvBgHZt53Tvq5fKnla+023n/15?=
	=?us-ascii?Q?pbeJLOBWXXZDid+yqCrdLmgDSm7jHmiKy2CZgfhMNJ6TC5tBxrUS/rcUKlW9?=
	=?us-ascii?Q?7NkVMiqiiuDbfYjZQGr6oHZeWmFnofMIYMI3YBY9cYDGKCBfCG/tukM7DSUz?=
	=?us-ascii?Q?6JhSuOIA1D+QSJjNy4POkig5dOkL5QPYqsmXBGf1F1SVyU7TcPPu0c9IN4RV?=
	=?us-ascii?Q?oxvSKOQyG54Vj7PMQLI3lQygAlgTJXl/wynHu6QAlHESdpmAVhJw2HIjgxqG?=
	=?us-ascii?Q?/vurHwxgiKJMhe5nkCHWITctdQTuVAX6o9b6P8SXXw=3D=3D?=
X-Forefront-PRVS: 0316567485
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB0907;
	23:J2U/jvPZk8T35ilOjpEFvIfKblPn3WHc5UwEx3S?=
	=?us-ascii?Q?vmSK8Kqdkd5X9iusBiQd/yHZ3N1SKbYKkDR5KH2N141LWolyjL0O4fv3V8Ba?=
	=?us-ascii?Q?CtfEZEEpyk/xl40j47tPq9bNRjg2MyyFSEkZUhGpRpJK0ZhlD5dZYvomsGcn?=
	=?us-ascii?Q?nrnvPmi0oYHQZ47SbWwyUH7bWBX8iX527RrOzN+mdKtmasUAve/u4hbgR8vp?=
	=?us-ascii?Q?b5vOORAyVgeiLtw8jaWEQzV5bMiWekKeJEUbVZnhEKMw/SSkzYM3TN0iRRVt?=
	=?us-ascii?Q?ReZBfy3jF7Y8dKWuRc1Yg6mwtDr5GXABtPZ6k9nJBQWw5vSvy/mrrd1HkPHh?=
	=?us-ascii?Q?aYavNdmbADffmzc4y31bbfIryYOUbZdqVFcPGkpx562kM2JVFGJQk79htMIz?=
	=?us-ascii?Q?fiLhKcu8ai+8rxULlSQiGNqsJP2/tr64sZMMlykG1KoEaNbN8HQaav7BDS+4?=
	=?us-ascii?Q?mZt3/Zjj7bUwQbvp8HBmK3AlsV71QqXh5b/EXRjlUK3f0dJjf+0QR4k5cRMx?=
	=?us-ascii?Q?IlBG0RUzBJzwZ9XtXo9weHaZF1PsraIZldl/ER7e0VitUDhVi9g05P2fuBRE?=
	=?us-ascii?Q?pMqUzybt3wivH8GUDnfhVJE4EFr5Ol1nVtEiMSAF4HETsLkNIh9Hqpk2yFPl?=
	=?us-ascii?Q?Chrt4UVWdEv+Ib2TH6J17Drasss2QeMX51w6iTZlfU/B8w0FAFlUaCe5Kriy?=
	=?us-ascii?Q?x8Vk5LQpIKvH2x57BEVTothgR6gNNuNjZpi98okX3thDj0kZeSWkZAS1qM5K?=
	=?us-ascii?Q?isIm1AgYtnlzeZWpfWr2N6yS2tYkEABIhN6wk0ktRqJiPezEV0jGPUC1eCHf?=
	=?us-ascii?Q?Lnq7H1kPx3Sc1sH79ZYngKnP7VszglhZLDDzJU/hpMDavXzOqab6Nt+FHpyo?=
	=?us-ascii?Q?l5xgxKcQ+qhiasTJSdI0/JF1Wuo10Ovk+e8ST2dRemij0JqUQ/5uln9bsDtK?=
	=?us-ascii?Q?B3Yby9Vxrjnw5iWAzxg64LM0xnZCR/qL3yrpS/w3kIT38y0r0BsFMHkqEBOg?=
	=?us-ascii?Q?bOHstxfDEZC3WIiCWmaeBtj/QwavdNvtMJ/kSsBCrCvBvxUtzoIon6zz3Eee?=
	=?us-ascii?Q?Ex+RjPRsSyi4gf4/w5x/tRVPUyxNdrzehLyM74OK1WwsoVF6DrnsYYsKEPrH?=
	=?us-ascii?Q?ImsHsXeVZv5TS0PpdnO+dOwjgNUlGlv/QgYpRr68eTM0asgVFFUsv5bnTqHB?=
	=?us-ascii?Q?nqyDO/UC/orjSLYirA75U0ckWKQoQ3RjH63K7c0bixG2BXoJ8DIL+9jan1Fn?=
	=?us-ascii?Q?LhoDDj9IwoPQnLnA8DBei2SLZluU/ckYksLJYYUgHUywA5vRt5qQM/F2Zdlf?=
	=?us-ascii?Q?j8g=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0907;
	6:IPOEQWFV/aghKltmPCB9R0yoINdZHxBi7iTx9rFLwBsdcLGDlq6SZlDYNJKfGzhE0ag0bfQWxBjCWWgHcgsNwjbnQ/XOwpjT17qS22s+HZ/res/cAm5r2YkRtROa459CHzlM18PoI3wqlkeOElaFlALGt6z+MJbz638iW5OZSy9Mkvm3l/Z7iuqWtG0lAhbCQqfVszhe8bcgBAs8K63LjsomxL3MedQHnruA0u6vSCsU/Bke0u/tGn/n266qR/etr6iOm99bzo9j+I5Ve+tAUJq6qBnwf71j4qv1OsRv6xk5/YRMncaw/mGhgrzK0kllM5Bqrr3EPIqhwVD/nO7cqZbTl9Tjg6WQnIIvo/PjXl82S6vyLB8hy5mS4jCsqisdNHbkYQhAnbXrrBm9ycmY6SzC29dku2XkiPKuHykVnGrAo2O1pV0UWm0VmYuqb6mlrl22ksd1V7LH88muiNk4QUuJMD/g4uKHb5AYYYs52+KR+ILih1HPV3HpqX2XKJ7n;
	5:/RYaHnDQHG9okV5LNtpi6uDUY8RqqCUj+0NIuQ9aordXONpJfQGnt5kFp1J1JgIbJlQ5lAiCYJibIbxfbqnyaxMWtDPhp8/U54wZtD1mD+mSx+br9EQ78yDGJuC1LUJJ5GzxRZQSHrEI55wzp5W24NyMFRWY2t7kaQfK62ba/UDvUZWwxkHnn2dAcsG5M/8v;
	24:ws09fWkgKF6LCb6kVBFcyLx97zyArGgPSXqnNwCG1F9sUCcq7QIFIiXKgFPb5jvPosSDMgEVEezCsXVxEBcYJxccLKGqOUvW1ANinhYmAbA=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0907;
	7:OiJyW7m4H+qX4yUw9WNsXFT3IOHekAmYnQDUlTW6Yim37VuZIKD6zqfhEToDVxAmnfT0EHj4xpJ/QWakiWX7cHk2Lc2KHc+uG+jvixpHy+PBhZZp0dqV0uMA/V1kPdTmmuFFW4IE5u2bazySp4g/G5EI3CHNjf7HEfFvbRpR0M01DO7w9vcn5ipGq4P9l+dvbXSYwniEIPLjIBDbI/0gTeZeM3LDV+ZMJyKE99r8U1O3On2FUkBGc7pcIRdghpSuewKGnCHdBpo6OawopILXtjQii++bDjJI+vfafjw0oSkWjGhc6vy1VZ0kcS+sk2j+eO0uD7Th3995ImRNhMpqlA==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2017 11:13:05.0076 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB0907
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.74
Subject: [Qemu-devel] [PATCH v2 2/2] Add a unique ID in the virt machine to
 be used as device ID
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
X-TUID: rnPF+N/feS8U

Device IDs are required by the ARM GICv3 ITS for IRQ remapping.
Currently, for PCI devices, the requester ID was used as device
ID in the virt machine. If the system has multiple masters that
use MSIs a unique ID accross the platform is needed.
A static scheme is used and each master is allocated a range of IDs
with the formula:
DeviceID = zero_extend( RequesterID[15:0] ) + 0x10000*Constant (as
recommended by SBSA).

This ID will be configured in the machine creation and if not configured
the PCI requester ID will be used insteead.

Signed-off-by: Diana Craciun <diana.craciun@nxp.com>
---
 hw/arm/virt.c              | 26 ++++++++++++++++++++++++++
 hw/pci-host/gpex.c         |  6 ++++++
 hw/pci/msi.c               |  2 +-
 hw/pci/pci.c               | 25 +++++++++++++++++++++++++
 include/hw/arm/virt.h      |  1 +
 include/hw/pci-host/gpex.h |  2 ++
 include/hw/pci/pci.h       |  8 ++++++++
 kvm-all.c                  |  4 ++--
 8 files changed, 71 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5f62a03..a969694 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -110,6 +110,8 @@ static ARMPlatformBusSystemParams platform_bus_params;
 #define RAMLIMIT_GB 255
 #define RAMLIMIT_BYTES (RAMLIMIT_GB * 1024ULL * 1024 * 1024)
 
+#define STREAM_ID_RANGE_SIZE 0x10000
+
 /* Addresses and sizes of our components.
  * 0..128MB is space for a flash device so we can run bootrom code such as UEFI.
  * 128MB..256MB is used for miscellaneous device I/O.
@@ -162,6 +164,22 @@ static const int a15irqmap[] = {
     [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
 };
 
+/* Device IDs are required by the ARM GICV3 ITS for IRQ remapping. Currently
+ * for PCI devices the requester ID was used as device ID. But if the system has
+ * multiple masters that use MSIs, the requester ID may cause deviceID clashes.
+ * So a unique number is  needed accross the system.
+ * We are using the following formula:
+ * DeviceID = zero_extend( RequesterID[15:0] ) + 0x10000*Constant
+ * (as recommanded by SBSA). Currently we do not have an SMMU emulation, but the
+ * same formula can be used for the generation of the streamID as well.
+ * For each master the device ID will be derrived from the requester ID using
+ * the abovemntione formula.
+ */
+
+static const uint32_t streamidmap[] = {
+    [VIRT_PCIE] = 0,         /* currently only one PCI controller */
+};
+
 static const char *valid_cpus[] = {
     "cortex-a15",
     "cortex-a53",
@@ -980,6 +998,7 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
     hwaddr base_ecam = vms->memmap[VIRT_PCIE_ECAM].base;
     hwaddr size_ecam = vms->memmap[VIRT_PCIE_ECAM].size;
     hwaddr base = base_mmio;
+    uint32_t stream_id = vms->streamidmap[VIRT_PCIE] * STREAM_ID_RANGE_SIZE;
     int nr_pcie_buses = size_ecam / PCIE_MMCFG_SIZE_MIN;
     int irq = vms->irqmap[VIRT_PCIE];
     MemoryRegion *mmio_alias;
@@ -992,6 +1011,7 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
     PCIHostState *pci;
 
     dev = qdev_create(NULL, TYPE_GPEX_HOST);
+    qdev_prop_set_uint32(dev, "stream-id-base", stream_id);
     qdev_init_nofail(dev);
 
     /* Map only the first size_ecam bytes of ECAM space */
@@ -1056,6 +1076,11 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
     if (vms->msi_phandle) {
         qemu_fdt_setprop_cells(vms->fdt, nodename, "msi-parent",
                                vms->msi_phandle);
+        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "msi-map",
+                                     1, 0,
+                                     1, vms->msi_phandle,
+                                     1, stream_id,
+                                     1, STREAM_ID_RANGE_SIZE);
     }
 
     qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
@@ -1609,6 +1634,7 @@ static void virt_2_9_instance_init(Object *obj)
 
     vms->memmap = a15memmap;
     vms->irqmap = a15irqmap;
+    vms->streamidmap = streamidmap;
 }
 
 static void virt_machine_2_9_options(MachineClass *mc)
diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
index 66055ee..de72408 100644
--- a/hw/pci-host/gpex.c
+++ b/hw/pci-host/gpex.c
@@ -43,6 +43,11 @@ static void gpex_set_irq(void *opaque, int irq_num, int level)
     qemu_set_irq(s->irq[irq_num], level);
 }
 
+static Property gpex_props[] = {
+    DEFINE_PROP_UINT32("stream-id-base", GPEXHost, stream_id_base, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void gpex_host_realize(DeviceState *dev, Error **errp)
 {
     PCIHostState *pci = PCI_HOST_BRIDGE(dev);
@@ -83,6 +88,7 @@ static void gpex_host_class_init(ObjectClass *klass, void *data)
 
     hc->root_bus_path = gpex_host_root_bus_path;
     dc->realize = gpex_host_realize;
+    dc->props = gpex_props;
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     dc->fw_name = "pci";
 }
diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 7925851..b60a410 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -336,7 +336,7 @@ void msi_send_message(PCIDevice *dev, MSIMessage msg)
 {
     MemTxAttrs attrs = {};
 
-    attrs.stream_id = pci_requester_id(dev);
+    attrs.stream_id = pci_stream_id(dev);
     address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,
                          attrs, NULL);
 }
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 259483b..92e9a2b 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -951,6 +951,30 @@ uint16_t pci_requester_id(PCIDevice *dev)
     return pci_req_id_cache_extract(&dev->requester_id_cache);
 }
 
+static uint32_t pci_get_stream_id_base(PCIDevice *dev)
+{
+    PCIBus *rootbus = pci_device_root_bus(dev);
+    PCIHostState *host_bridge = PCI_HOST_BRIDGE(rootbus->qbus.parent);
+    Error *err = NULL;
+    int64_t stream_id;
+
+    stream_id = object_property_get_int(OBJECT(host_bridge), "stream-id-base",
+                                        &err);
+    if (stream_id < 0) {
+        stream_id = 0;
+    }
+
+    return stream_id;
+}
+
+uint32_t pci_stream_id(PCIDevice *dev)
+{
+    /* Stream ID = RequesterID[15:0] + stream_id_base. stream_id_base may
+     * be 0 for devices that are not using any translation between requester_id
+     * and stream_id */
+    return  (uint16_t)pci_requester_id(dev) + dev->stream_id_base;
+}
+
 /* -1 for devfn means auto assign */
 static PCIDevice *do_pci_register_device(PCIDevice *pci_dev, PCIBus *bus,
                                          const char *name, int devfn,
@@ -1000,6 +1024,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev, PCIBus *bus,
 
     pci_dev->devfn = devfn;
     pci_dev->requester_id_cache = pci_req_id_cache_get(pci_dev);
+    pci_dev->stream_id_base = pci_get_stream_id_base(pci_dev);
 
     memory_region_init(&pci_dev->bus_master_container_region, OBJECT(pci_dev),
                        "bus master container", UINT64_MAX);
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 33b0ff3..94c007a 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -99,6 +99,7 @@ typedef struct {
     struct arm_boot_info bootinfo;
     const MemMapEntry *memmap;
     const int *irqmap;
+    const uint32_t *streamidmap;
     int smp_cpus;
     void *fdt;
     int fdt_size;
diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
index 68c9348..47df01a 100644
--- a/include/hw/pci-host/gpex.h
+++ b/include/hw/pci-host/gpex.h
@@ -48,6 +48,8 @@ typedef struct GPEXHost {
 
     GPEXRootState gpex_root;
 
+    uint32_t stream_id_base;
+
     MemoryRegion io_ioport;
     MemoryRegion io_mmio;
     qemu_irq irq[GPEX_NUM_IRQS];
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index a37a2d5..e6e9334 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -283,6 +283,12 @@ struct PCIDevice {
      * MSI). For conventional PCI root complex, this field is
      * meaningless. */
     PCIReqIDCache requester_id_cache;
+    /* Some platforms need a unique ID for IOMMU source identification
+     * or MSI source identification. QEMU implements a simple scheme:
+     * stream_id =  stream_id_base + requester_id. The stream_id_base will
+     * ensure that all the devices in the system have different stream ID
+     * domains */
+    uint32_t stream_id_base;
     char name[64];
     PCIIORegion io_regions[PCI_NUM_REGIONS];
     AddressSpace bus_master_as;
@@ -737,6 +743,8 @@ static inline uint16_t pci_get_bdf(PCIDevice *dev)
 
 uint16_t pci_requester_id(PCIDevice *dev);
 
+uint32_t pci_stream_id(PCIDevice *dev);
+
 /* DMA access functions */
 static inline AddressSpace *pci_get_address_space(PCIDevice *dev)
 {
diff --git a/kvm-all.c b/kvm-all.c
index 90b8573..5a508c3 100644
--- a/kvm-all.c
+++ b/kvm-all.c
@@ -1280,7 +1280,7 @@ int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
     kroute.u.msi.data = le32_to_cpu(msg.data);
     if (kvm_msi_devid_required()) {
         kroute.flags = KVM_MSI_VALID_DEVID;
-        kroute.u.msi.devid = pci_requester_id(dev);
+        kroute.u.msi.devid = pci_stream_id(dev);
     }
     if (kvm_arch_fixup_msi_route(&kroute, msg.address, msg.data, dev)) {
         kvm_irqchip_release_virq(s, virq);
@@ -1317,7 +1317,7 @@ int kvm_irqchip_update_msi_route(KVMState *s, int virq, MSIMessage msg,
     kroute.u.msi.data = le32_to_cpu(msg.data);
     if (kvm_msi_devid_required()) {
         kroute.flags = KVM_MSI_VALID_DEVID;
-        kroute.u.msi.devid = pci_requester_id(dev);
+        kroute.u.msi.devid = pci_stream_id(dev);
     }
     if (kvm_arch_fixup_msi_route(&kroute, msg.address, msg.data, dev)) {
         return -EINVAL;
-- 
2.5.5

