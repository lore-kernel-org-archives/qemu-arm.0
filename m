Received: by 10.223.172.38 with SMTP id v35csp4369447wrc;
        Tue, 26 Sep 2017 23:36:36 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QC1A+mdO7XOXi+Xc21dAkP0A97h1stRCbMks9ETlC4DvWXbnaY/o8MP/g2pk97idBB0jypy
X-Received: by 10.237.39.135 with SMTP id a7mr491412qtd.84.1506494196780;
        Tue, 26 Sep 2017 23:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506494196; cv=none;
        d=google.com; s=arc-20160816;
        b=Xt+/9TRqhvBdzMt8xpN7kWYQRK0kDTYMKzPrx+QRlZD2S0N1aQ5VoAKVLliSfmkLsr
         1zzQTpbBNKWl/e977/Y2/jYYZJIoGLv+UD9U4n2YWOKEGm21mkQQWQsRh2QX5fmD/9rs
         TyP+Z/chjZAtsVppSHEXPuiuGPFR8KXwgQ15U8UufDmg+v/SffSlvUnrAAqzeuCQibrM
         GWSQGGje3SKwDxcBTnrbck7FI9rEijWXCyeYjBWA8nx3Pnh1TxGWHWVuKJTku27SmEz6
         MdxiL8d4e2tezgNpOYAP1pxwSkHGYGghU4S6+CKDfbkejc3xWMmbyuk5c2+q/n53g6jT
         J+4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:arc-authentication-results;
        bh=5RYqt2Ej/9tnzUCxYPhyzzfolS7Ed9FbJa4nRKZ2rro=;
        b=YaMAVmEGIUCBvP7RAtt+QPqoGScA8f6gORJvCxyxVxR0JG4dyF6fVMV8U3i+YpLFyk
         N83b7gSAysnNmcnlxv9uqL5Fx62v/ZfG1nTi/kY5D0whwINshguS2w38ijbIOnxTLgSS
         pOPN8D8rNlKzDQpf3XBdFRsTj9uvIvntdYw/6yAR4E7P3R2qAxpZlLeSi+VWApxq8c3p
         lqPrzJj7TUOnpCqABDRGMCTbuzi63RcLTA3LPs9HLt87N7IAiK58BQ6rGQ8Naf2afYBE
         DCjyjl7H7F0mGRxVb7cRCRfqkiUL7+wCr+Q8ot0RY+qhF9lEwxkw4evXQOQ/SHjaAyte
         EcVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t3si6738365qtb.375.2017.09.26.23.36.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Sep 2017 23:36:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:52408 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dx5xS-00014J-Gm
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 02:36:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1dx5xI-000118-0w
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 02:36:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1dx5xD-00087J-BB
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 02:36:24 -0400
Received: from mail-cys01nam02on0081.outbound.protection.outlook.com
	([104.47.37.81]:16177
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Bharat.Bhushan@nxp.com>)
	id 1dx5xD-000870-3Y; Wed, 27 Sep 2017 02:36:19 -0400
Received: from BN6PR03CA0013.namprd03.prod.outlook.com (10.168.230.151) by
	CY1PR03MB2364.namprd03.prod.outlook.com (10.166.207.151) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Wed, 27 Sep 2017 06:36:17 +0000
Received: from BN1BFFO11FD027.protection.gbl (2a01:111:f400:7c10::1:124) by
	BN6PR03CA0013.outlook.office365.com (2603:10b6:404:23::23) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.56.9 via
	Frontend Transport; Wed, 27 Sep 2017 06:36:16 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD027.mail.protection.outlook.com (10.58.144.90) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.56.11
	via Frontend Transport; Wed, 27 Sep 2017 06:36:16 +0000
Received: from localhost.localdomain.ap.freescale.net ([10.232.14.21])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v8R6a2N9027330; Tue, 26 Sep 2017 23:36:09 -0700
From: Bharat Bhushan <Bharat.Bhushan@nxp.com>
To: <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
	<peter.maydell@linaro.org>, <alex.williamson@redhat.com>,
	<mst@redhat.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Wed, 27 Sep 2017 12:03:16 +0530
Message-ID: <1506494000-31982-2-git-send-email-Bharat.Bhushan@nxp.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1506494000-31982-1-git-send-email-Bharat.Bhushan@nxp.com>
References: <1506494000-31982-1-git-send-email-Bharat.Bhushan@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131509677765095109;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(376002)(39380400002)(39860400002)(346002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(6666003)(2950100002)(110136005)(5003940100001)(8676002)(316002)(36756003)(189998001)(16586007)(97736004)(50226002)(54906003)(104016004)(5660300001)(7416002)(47776003)(105606002)(39060400002)(4326008)(76176999)(50986999)(8936002)(106466001)(53936002)(8656003)(50466002)(72206003)(86362001)(2906002)(81166006)(498600001)(48376002)(2201001)(356003)(77096006)(85426001)(81156014)(305945005)(68736007)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR03MB2364;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD027;
	1:a5MEUXVA4E7UMkc8oPJYjwxCiSYcdYgzrZ3wSmEnKW1eGFX9rsyyDKS5LnXaxJSsDbzLPoved6QGOyDZQMTvf5Gz7Y+k7JhQJ5h4vfsJSE4WTh7GXobckjYsSIJUqJ3f
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b2e6cf3-b9b3-40fe-e31d-08d505720e1a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017052603199)(201703131430075)(201703131517081);
	SRVR:CY1PR03MB2364; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB2364;
	3:r7KuGDxmCmqrkPRTqHC8sBvrmSOw3FPyS6g81S89fmf8ipXkjWwN6dX8GIK55HJ5hPKOvd4p978UOlntmqrYtLgBmJoqEPRwvRdVN60MDHkB1tJzN83N1tet3hI09mq4aIqxejBolHM29tXnkoIL9y0K+ESdvdNnf5opG+CKNwkOtrY4KK924wS8VFqaz0Jne/Z9YH91RNs6rhziTG25kue5PwkoTc1R9YRO0Y9XeZ7KSQX/tPbMOlhLXftS9ExuVgFKoLQKRjH2pK0lOWoNID1a9xq+DJWHVQlf2wtF+DdII08GYfmG0qRBeFzwMB8xzBeImqN0C1NoHC93JxNp2bWyH//wHYFiYgYdEvXr+IQ=;
	25:rNqHgQ+3IhO+ocSS4d/Uplou05b55wwoXGZMg2JGhghnvvrBkIcfYCFmImREB6Cbu2CGqRGeH1UoiyS/mCi+P5p1zGbk7zcgkrIYWEcfAkGzAmky74nK4DKWyHUECNftpdOMHjkRrlVzjjbolEXF4gc5cII/GI5UnigvnhEhXEIOOFibHJRuLhckGXiEOi2AlvIMq3VgN3kUqbvi8j0OEAcktmEZl1gsvCaMXjEOM5iQBoINWdVt8QCpUEzUP9+tcj1UDByqzXPRAKzpznN3kfcgilpVV1hCgsmoFNpmLymAgMilAE47d5FMr15BQ4TW8BLaXnNz76jGPME4obc5UQ==
X-MS-TrafficTypeDiagnostic: CY1PR03MB2364:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB2364;
	31:7D24fxEVKyOPEdEFhNgnmMPtM5EI3i134WNZrPYYNR0rJq50x+k0zcQ48eEwujlBRkZCf82me/VUIV5XcuFLp/FiZ3B3V05Ilk48YCqjpVivki8HNKMx0/Bq+HaRVwqg9KmQdQmSZFmwrLUJuvkceI4J17LGoTAdGlopPGSYkNdSTDRHzpZBBxiA7wu7k220MEeGSwS1663hrmNZb2VBsyDvINw69Usn2ZX1mbODtg0=;
	4:QJiXyf6B0zbMTAzIp6b39J4g070+gZbuaUwbO26oPImw53MHtotaHxQAE/KxzcvTriSPCK99gPWlH7mq18IYS++oUU5dPctg15OELhOoP1VstCK0+ADtvi1orZVy355qknYUnbKWShPgCeKKJQj9gFYzgHZP7lSjIaA6NM+LLDTQTeIQEhRmPxrqFPTcV/XwjS5Ghi9sBKVY9fFyhaUEzwsDjr0w1hj7bQ1L+FaVbkd0Z2gkh/AhezsTodzz4Y0bcAONkSoOL+ntKnkPPemBFUUpDpWDMYZsg9xOLz0b/TM=
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Microsoft-Antispam-PRVS: <CY1PR03MB2364720A5A8D7969E0DC262D9A780@CY1PR03MB2364.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6095135)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(10201501046)(93006095)(93001095)(3002001)(6055026)(6096035)(20161123559100)(20161123563025)(20161123556025)(201703131430075)(201703131448075)(201703131433075)(201703161259150)(201703151042153)(20161123565025)(20161123561025)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY1PR03MB2364; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(400006)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY1PR03MB2364; 
X-Forefront-PRVS: 04433051BF
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR03MB2364;
	23:PBPxLY/H6AOmreYAJtRW4VmrSHJT4M0SBVF6bLZYh?=
	=?us-ascii?Q?yliyMKi4/K1VK75E660KKBDXuubu64RUhi7sNRa+2hnwJl2D+GDmdEi3PREv?=
	=?us-ascii?Q?x3icHu/79XzurLz2iH6DhAu6MEvtDWkFcv1Dk3wwHONI8DaxJYVaNB+5v+wt?=
	=?us-ascii?Q?85yUdROAh3/vR6hk4x1mwOnhJA7lmtbg6xFRCikRehmo5xX49MtdS0AgeKL6?=
	=?us-ascii?Q?MJEXWvBslMXvjfcbyDolYvXfiZBKu9s8guiIbsUZS2jtFttda0PBvwByAUy/?=
	=?us-ascii?Q?iQG0yr6FqEN+t0qQ2LItyNomM7ALXE6OxOHvkwSJSfZpiSm1Ik8IfO5Z/ZEK?=
	=?us-ascii?Q?szvq8LGkV7uRn8N+1pGfQ6t599QuuCR/KV/aBylYAHe/kjbdz2Ndcm1xPbTS?=
	=?us-ascii?Q?CT8nmmasyUXvd+jSt9OAvl86EFyI+Kw/rcMOW+BCGzlOyqoGWKLcbmDqnfbl?=
	=?us-ascii?Q?5mk/zzzQUXCLw8DL/h7xk3ok4qEinmeM6vCkgDJdS+1INM/3dRTBaQLfKft0?=
	=?us-ascii?Q?0PoW3vOeGgbmB2GhfKa2iPwf1fBoFFTDkwTUIB8EX4fMJiVzl7jTzBIUcxCN?=
	=?us-ascii?Q?60Z9uSCZAGLFAK9i9IZOpegKRGf2R9SzjY6sEFtHZuxIcKVyNURNWvom2O94?=
	=?us-ascii?Q?B9bP2QVuB64hIiUf5UyKFAbxkZ5eIxvk0FfLTEpo1puuG3I64WYQo1zYwAvh?=
	=?us-ascii?Q?b94bDPkgXzOQN3OjFu4Uf9g6Qcl6I57BnvjWbp+k3dMnDmBUlYT+BzLdNooj?=
	=?us-ascii?Q?c+r+4qDSGjjHin53scxlIqV/pHOFDPp1nr1pkxmqTRgmdILsfDvDor0ShHWv?=
	=?us-ascii?Q?oaL0olZeVTUmtwQ7aNbbC3U0c1LRlrHBAJpmKpemfsttVTWSfpbbW8ErNcTA?=
	=?us-ascii?Q?7C51o1MzjjxyRz4o0AkiEYHMoW81r1a1bLhSTF/Ia0b2U1hx4dVPRKoINQDi?=
	=?us-ascii?Q?tEvQuSMHrhcgkngcdBt4zRTuvtD2RMciWTnwTl9yN02f/HIB9JJfitin//8A?=
	=?us-ascii?Q?Kk9R/yqo79wlEHuFL9Oyx2X0WHaODfD5B6gU8/pY8KIqWVdXPqZdXcgqPdeP?=
	=?us-ascii?Q?OkSK6j8Rhg61dWGOxFxtRzd0ei3C/ljngMwy+FSMgH/u5RZT2B3h2JwbIWph?=
	=?us-ascii?Q?q9CXrtKgOFWI/pXBvYUbWr54aYFnSNP/yEyWE7aKEzdh6W0aw6CFn/jaYzLe?=
	=?us-ascii?Q?VbTLHXyihR+A6sq9JjnRc2gPa4DWyD332RjMxtfo4AH96VXrnAFenFZlA=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB2364;
	6:Yx99reyICkmyL9uBbW0YP+tF6FXlY8ZnTcI63Jez2GNcslXfP3nZr9mIQ3vh1I6CnQjWRtzumYKHvn8Q+ICXO0ZZFXEQQ/urQpvqLSz0/Cs6+LOieiEAewxYsG9NBlkEdP60qkMZEvQkP9HNgwNIWpzuljBgTQJWZ7gWANgKkx9wRLDtexJdZt+KGu7fd2xCwuWWpXWRi4W5RR06w1D34i3uxLR17AQhL0lEBdNPu95XpgNwxAFWnXOCwzofwsLqenfM7hWovrfmw/wHMNggp3o7FKEw81MjpdS9+OLWtSYZNWCV1eNWyjfyfpChofURYYLuEWDqCBUAzbgE+5MVaA==;
	5:jgTjH7Dg4eKV/7e1DKDyrH9jmL3c/0lWHZaooO3IvbxdJLDFbtvEwtkFA7Rcwp2/4Ufv3OmL8e4D7aq/atdvEU6fOGqkDW2ak3FH3N+KRDNAFodlU4Vcim/M/tGt89PzGL/fyS8WiqdO8QFlwMGipw==;
	24:rFlAhsaNZ+FrvFFz5VE/+V+jNcVUmgCLby2MhyCiTVTA0j5LUOlU+upA5RpNN6sNpCRFCVmZMbT2CtfzYZRtLRx5LpfiDuwZ3A2739UlOJQ=;
	7:i7RPw+8f2jsihGbNWz6WuAqFvhpS0ipCzq/TRkMTXwW3YYajI1HJV60lAxwoHdgqVe0uyS32H9VUyJvi1ZOQBjW1QQqw+N1uKqdgfJwxuaeOEYnqU5qw0g7YylZY7qUQZXUCD5wAnPe3p+8CDZBOsBZS6v+PEtPYXEj73WWMYGg91JbK64IdSTtNDNia3580B+mNfnswsIbXz6mGkvlN+16dq1WlIPizTO7DpN82mGY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2017 06:36:16.0882 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB2364
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.81
Subject: [Qemu-arm] [PATCH v4 1/5] target/arm/kvm: Translate the MSI
 doorbell in kvm_arch_fixup_msi_route
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
Cc: kevin.tian@intel.com, Bharat Bhushan <Bharat.Bhushan@nxp.com>,
	marc.zyngier@arm.com, tn@semihalf.com, will.deacon@arm.com,
	drjones@redhat.com, robin.murphy@arm.com,
	christoffer.dall@linaro.org, bharatb.yadav@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ksOKUjxqNHRv

Translate msi address if device is behind virtio-iommu.
This logic is similar to vSMMUv3/Intel iommu emulation.

This RFC patch does not handle the case where both vsmmuv3 and
virtio-iommu are available.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>
---
v3->v4
 - No changes

 target/arm/kvm.c        | 27 +++++++++++++++++++++++++++
 target/arm/trace-events |  3 +++
 2 files changed, 30 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 211a7bf..895a630 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -21,7 +21,11 @@
 #include "kvm_arm.h"
 #include "cpu.h"
 #include "internals.h"
+#include "trace.h"
 #include "hw/arm/arm.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/msi.h"
+#include "hw/virtio/virtio-iommu.h"
 #include "exec/memattrs.h"
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
@@ -666,6 +670,29 @@ int kvm_arm_vgic_probe(void)
 int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
                              uint64_t address, uint32_t data, PCIDevice *dev)
 {
+    AddressSpace *as = pci_device_iommu_address_space(dev);
+    IOMMUTLBEntry entry;
+    IOMMUDevice *sdev;
+    IOMMUMemoryRegionClass *imrc;
+
+    if (as == &address_space_memory) {
+        return 0;
+    }
+
+    /* MSI doorbell address is translated by an IOMMU */
+    sdev = container_of(as, IOMMUDevice, as);
+
+    imrc = memory_region_get_iommu_class_nocheck(&sdev->iommu_mr);
+
+    entry = imrc->translate(&sdev->iommu_mr, address, IOMMU_WO);
+
+    route->u.msi.address_lo = entry.translated_addr;
+    route->u.msi.address_hi = entry.translated_addr >> 32;
+
+    trace_kvm_arm_fixup_msi_route(address, sdev->devfn,
+                                  sdev->iommu_mr.parent_obj.name,
+                                  entry.translated_addr);
+
     return 0;
 }
 
diff --git a/target/arm/trace-events b/target/arm/trace-events
index 9e37131..8b3c220 100644
--- a/target/arm/trace-events
+++ b/target/arm/trace-events
@@ -8,3 +8,6 @@ arm_gt_tval_write(int timer, uint64_t value) "gt_tval_write: timer %d value 0x%"
 arm_gt_ctl_write(int timer, uint64_t value) "gt_ctl_write: timer %d value 0x%" PRIx64
 arm_gt_imask_toggle(int timer, int irqstate) "gt_ctl_write: timer %d IMASK toggle, new irqstate %d"
 arm_gt_cntvoff_write(uint64_t value) "gt_cntvoff_write: value 0x%" PRIx64
+
+# target/arm/kvm.c
+kvm_arm_fixup_msi_route(uint64_t iova, uint32_t devid, const char *name, uint64_t gpa) "MSI addr = 0x%"PRIx64" is translated for devfn=%d through %s into 0x%"PRIx64
-- 
1.9.3

