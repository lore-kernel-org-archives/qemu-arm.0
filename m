Received: by 10.223.197.9 with SMTP id q9csp4842017wrf;
        Tue, 17 Oct 2017 10:35:55 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QjGpUHGH5Oyq4sfB3FZPTmIDLiTqeSJCKFyZ9zW2c0XQmuatRVe9F3hNvbEaS13PK4B4Qt
X-Received: by 10.55.179.196 with SMTP id c187mr4588084qkf.9.1508261755692;
        Tue, 17 Oct 2017 10:35:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508261755; cv=none;
        d=google.com; s=arc-20160816;
        b=uHOmgt8h6HVPuA6ZbxUYzA4I5ECH9h2JujCDgqCGD/UYnohzWnQBxgcW1qbptVMBOu
         BbrHxuKBdo2PTNpf2QPCUx6QzMuceUrj6Ku6itogtcDBK5yBjRPGUocQF4KrNfBbGG3k
         7VjQcQwFG5llf1/Xi73kAN1gDtfZd9F66Pf3pSEwjFvuraDwXVNTZn26DExBU97Nx4MY
         uqBMXu3C5dtt8R/GwJWOUm4vJbWdozR2yrlKGbocQ1K67WmxvSfqpoyIXD/5yQ6Cl/iv
         xJVz/LLWUIaVNQvUrZtkF3Rh8rPiDtDKjudYGJhk3/sJFPWH/6boyJO4xUSFKOBbD4NS
         jpEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=X73TllCfmCMeQPZrodIByvFjE5ExnorOBPXlVxJt/5w=;
        b=Vma52Mz3wwkkF2H9wvMbozMyPSwrmN8D2XfNQJv4WEpQQkedE93v49LkCoxqw3Kqn1
         q/CGPbsnH0C8MKYSTqWVwTL41R5o5P8iC0h00p02p/6YrknEelInVkL0W5kZ7ydHBqc/
         I2h9y6Tug/1EIfp/h5FgYwaT3gDJ3/fay1+QeRdGyaBlZTsRtWFswZj45kc9+r3hko2Q
         kLyFIl6EkLbyx6GjfpZhiFadQPAWIBQ+a6eQKdnB/k9rofdFGO+C4UiyUFThORT9HBW/
         MwxICgH6b86jh0ejCYFs2f87wTCJowo3zgU5fiOSGQck1D7sTpKU4DsxGPToHISDZI+y
         vZOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=uoQXyPaW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l40si3295363qtf.189.2017.10.17.10.35.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 10:35:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=uoQXyPaW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40867 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4VmT-0006Io-F1
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 13:35:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1e4Vkb-00055n-OA
	for qemu-devel@nongnu.org; Tue, 17 Oct 2017 13:33:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1e4VkX-0006Ni-Ji
	for qemu-devel@nongnu.org; Tue, 17 Oct 2017 13:33:57 -0400
Received: from mail-sn1nam02on0089.outbound.protection.outlook.com
	([104.47.36.89]:51744
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1e4VkX-0006N7-DX; Tue, 17 Oct 2017 13:33:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=X73TllCfmCMeQPZrodIByvFjE5ExnorOBPXlVxJt/5w=;
	b=uoQXyPaW7GmTehsALYAOtMCDEfnqszCOJDxwDFzbpBxH0aZEf1wUwFg8/lwWi5xK2Ix6bl+3L+YfCWasDVWM8e5jdsD+fMSkAxu6CXUCq5y1Mmo3JvEZ3Lz5KGJC1RxaBmgISLWa7gE3sPpkdC1SNZymQ7EvZUfXgrWrgpxzV84=
Received: from BN6PR02CA0035.namprd02.prod.outlook.com (10.173.146.149) by
	BN6PR02MB3377.namprd02.prod.outlook.com (10.161.152.165) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Tue, 17 Oct 2017 17:33:51 +0000
Received: from SN1NAM02FT003.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::201) by BN6PR02CA0035.outlook.office365.com
	(2603:10b6:404:5f::21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.77.7 via
	Frontend Transport; Tue, 17 Oct 2017 17:33:51 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT003.mail.protection.outlook.com (10.152.73.29) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.77.10
	via Frontend Transport; Tue, 17 Oct 2017 17:33:50 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e4VkT-0002Qy-Vp; Tue, 17 Oct 2017 10:33:49 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e4VkT-0000oi-Pf; Tue, 17 Oct 2017 10:33:49 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e4VkR-0000oS-Ex; Tue, 17 Oct 2017 10:33:47 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Tue, 17 Oct 2017 10:29:58 -0700
Message-ID: <def1a1e662b4d7856a3e4cae0c291626c7515ff0.1508261326.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1508261326.git.alistair.francis@xilinx.com>
References: <cover.1508261326.git.alistair.francis@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23400.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(346002)(39860400002)(376002)(2980300002)(438002)(189002)(199003)(356003)(478600001)(5660300001)(305945005)(76176999)(50986999)(81166006)(106002)(8936002)(316002)(2201001)(2906002)(36756003)(110136005)(50226002)(81156014)(2950100002)(6666003)(9786002)(54906003)(16586007)(8676002)(77096006)(50466002)(33646002)(106466001)(48376002)(230783001)(39060400002)(63266004)(36386004)(189998001)(47776003)(118296001)(4326008)(5003940100001)(107986001)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB3377; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT003;
	1:Bcy7CQZ8sAvW2rJznKVRiuSl8d7pVpuvT9hxx/J6nJcm/NsD9i27vQIFfZofJ198O9QqeWSAVGOaWPYuGnHhylN5M56QgHoeAzL28C4HqjRyImx0PM5qNL8w8s8RAo3v
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49cd9327-0319-4ec2-1314-08d515853b1c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(8251501002)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:BN6PR02MB3377; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	3:vU4t6cjgXGOIMTh0ZGOYrFcUjFOS7TZ3oHkfYB4WxxwQ2LtPRqi+ePHRdZgR9wwRWUgFcMBc5vYDZvb1xsj7r56WM31fSufHchQ2FwuSuFXFro6+C2yuth/QClqxJ5bJlOB/m4EHC1ILRiu4NxMkAYi2qVe/whIokd0N0yGhmeSJtg/4/ekj6omsSRC/oLUFFg8rdS3WM4kdc7cKKRuhSMsdEDJKtyUYAdw6ZiSvFr52bVOfrSr2BJNnNogcqG2BpGeQILqMvBfdwtNo9caXwZZDIJG/lVAFYONo0w1rIfpOVLEqmSMkcNx+jn1Bsi1ICNN/LhSRHAYVdelX4w79yz6FIN0Tzw/f2YuLlJd3nV0=;
	25:Yv6XAsuvCRZyzeq2R5pcBIa6wVgllt1fjPQa8om9zS9spG4n21UjL7IJ2gJ1xz9RYre74vLKpSTPay2FSDCWcODhRBNz1uH5+dIyEz0uUQ4oa5EQA04aNAiyfvaygYgd0CQJtl4L/Xyrdh0GltHL8hAOMVZw9Vl/GwR1ThOl5gToY5sAbAoi7kIZz2Nin05UJ8FSqm8+A+r7OEuUfVZrMpBzukSIRFiKV2YX5FJEclxv8Sc7pvqwnvDG7WAmmBzEXeoI0Uopgf5DZELPPFIcaIPQns8hNJgq8tB3V2sqbxBCzHiFM1+GfFlMkxb1F4UWREVryhVhctslzjBvdHKqjg==
X-MS-TrafficTypeDiagnostic: BN6PR02MB3377:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	31:9LcFahXel3lNP93PEM2V/B21Q2M4CEQK1fU+lVDJp5WlXo7Sbqzd+U9JVNxWOMZDyx0IPinjY32yqtGYnvpaAUkhcutMIYM2aSzV7p5mdMEmOdep9gvF4+YWvX5zFsJk2b6dofvPI5qOkd72IN2wuL9oWUVynDYDoY7RI7TB3RtHhTdjky4TlT/tHqehJwEZGk9drztrgt1S1fHmgg0KcRE8IK42rAULio1kdrDagbQ=;
	20:Tt4LFi/kx3uEWHQxBjNOSS9Jyn1RcB3II/0T9ZMu/JkSplgTGNzcEugTBJkCVovxLlbC8NRQWKLhglm0Ihb8Dk4EZc63mF5zqgsOOy3I68RZyTQrJrdN1Ab1IVoOcrCn0joHY0kFOYPzKH1cD54NW6h3MUldFEDAAejtpKX0rPxtlbS8KO7m+ijFgSSMKoTxt6bJ11dza/2xDlY1jU4Gq199PdL+hCDadDgDq8C4+wPLqB2AnYGhxhXXi0N9y4N1zWEKvtOIZK0lTLAqEFGZEekHYCfvu1rU5nvn0wkuUazBpqZaZKe7Itww1j9+byiyhz5t0TfN5tusWIWjhOpuB5lpWwXNqAw6aycYvu01Yi4IImDR8hg88ZGPQPE18ueqbHGRcSrUwLvXvjQO4j8JWWaTtlPS4lpk1HJ/n2cJh2WyISncZ9TpdqQigsv875eLGQ/dzQO881VDfNOiMBIwP446a1P9ze8joJlaKltnUtm57O8BTAkpNXCobdK+ezv6
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(21532816269658);
X-Microsoft-Antispam-PRVS: <BN6PR02MB337746FF89B3A8DAD72D7193DC4C0@BN6PR02MB3377.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3002001)(93006095)(93004095)(100000703101)(100105400095)(10201501046)(6055026)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123555025)(20161123562025)(20161123564025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR02MB3377; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR02MB3377; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	4:rHFi8qE+JNLJ1kUE9ABSxz8tHix6M7MPqLuwz9jHJvm7e3E8MdnPRJKJKUYTRNC/BwHhtTYUoVWKa6A3hL1r7rkJyDx8plHZ8Qk5W5DoM9hpDhH09A4wIklxO7TSGT8EZXxamtqrvWaz/kb93ZyNUuaz+j06NmzfDJMNw2d03Xj/qUu2bzRHp6KvbXLfKncaDVNH2bqbhle8Qt7cONyR9LNX2ejF2emH26ddWAmX4RAe+ND0tfLb3zEfJ/SVYXzrrAVJ9C+iYpm7IA7O5FJDifuMM9S0RZVK/QkQiH6wwd91CWdy4gB5Sd3AzUHVzSbeHf4pqwpgNbmYaZNTZXXxXg==
X-Forefront-PRVS: 04631F8F77
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB3377;
	23:+t5qI6NDXU0/k4n3qFfFLx2qontDcb2jzT5eOqkQm?=
	=?us-ascii?Q?cnkxz60eftYOCdbYSK2XwY6IoLf93JMEyrOnT2blacqwiFEOcUsXiJETWWNM?=
	=?us-ascii?Q?XXFmBYI0CbP5IxssrDkjki/KEcxDRfrSrSe5DDSrkVf6JA/QNM83VlHTzKDP?=
	=?us-ascii?Q?oPsIpLBBCltBZ3Qj03lQBAdyTgN+5+GPlxw845tt2A1SxCypSVWUYRwJAzmT?=
	=?us-ascii?Q?/er0sJOq5Rmn1F/EQV5SeKqjBZ75JRuv/wjgVbr1DFKNJX6jU9gFmhZbSFf2?=
	=?us-ascii?Q?5kAkDufT0t2Vk0pHVkSnN4/tQHIVE+rIul5wudURRosnLqZz363TyEfyIMpk?=
	=?us-ascii?Q?hGRq8nHqdmsbCpxaTOultBscEUSHMF7F68PUKcH0VbbfcvM8TTZ9ajIW9aMA?=
	=?us-ascii?Q?o4bCSJcfBgDnfh+aaioFKFPyUOQM8ryrd5JQNrAvbuPCInD2myClUcxq9SAv?=
	=?us-ascii?Q?cSEumX8oOrxW+3SY5tDHHs75HQY1D+cLHiAc/Q6Y0wTJkhVPW4auIfyvd2Kq?=
	=?us-ascii?Q?VX7C5OSD/4CXV7DLyn9VFNmX45JHinzm1uCD5JscaB8yE7h3HxkH8+unzgsx?=
	=?us-ascii?Q?a6o7/Jn70HDJHY/x3WeNB5x5O3Ax0ofn1BBWEl7JI6t/3sNJJrD4ljpv7bk1?=
	=?us-ascii?Q?L+qKY+0aNz5dY+9VbVQPaWKGZ5wrxsrKjC+Up7cTW59vDtEWtQTP6bgVcS7X?=
	=?us-ascii?Q?GCPqku3c7VmCeRSxjfzOxdE9T2qdsGyP8ULZaOOLXhiKK3gAEHHiq+KALcFD?=
	=?us-ascii?Q?OgLZApT5djOZs0vECL2dF2Yvz/V2SyLHaP3msXrJgGO0bt7l8VNmQvkZeQ7O?=
	=?us-ascii?Q?Z+JepcBCTuHDq+GNcYijlMCrHVkYo6ePD8+FGdYXyDoWRO7k2pao/7yHl101?=
	=?us-ascii?Q?KdaW9VHOcHV+GlmdAtFmgrzMlMdFRKexRHGglG7Jn2Pt0yOaYnjtTW2SSEWo?=
	=?us-ascii?Q?7jNjeLCZFFtHGZtDbZGFnfa2+gYNb4OC6QHUCDn+KCOr/w51TRALnhcLDVqD?=
	=?us-ascii?Q?bNFB/vwIF9xz1VvI4WD9xgisyNuJJpKyjTVukIif+gCsJCVuJsRpBbJjoMte?=
	=?us-ascii?Q?HCyPQ7ZjV/fKSvzY3lQPw8W1VVmijEM33NZzUqZQyTXk0WlCQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	6:/OPbXcMc5/R/Zx5T0X2SHuBMTQmQOjmMiUTafi395+ff5B1Qkrkc3sg8QlV3PhfJvBr6BouHxcuRBUpH1v+AaS0EthZqq/L7WOnX0/rb4JipAr/F0jFb8mKCv2vUO4sHJ8DRawPYlGxxjUXgtSv+iOqYSeGEMcw3pv1UU3g44C9eARjsfQK+jm1vPYsjv3haQmzHHixisVhs/udWSoKtCJ2zt+gmq2D09InHUfU6MJ2Z2vtfaQhfECptEbkmwd0vW6/xcn9gbDcv3dTKecHaop9Lvh7lg+Vr3AsLfh5Jd/WAgmXWHGr+v9T1GJSmhfV+rjsDLz1yWvlrsDbrmQHaWg==;
	5:ngODv+fjxxE3VCRpqsIT0OMAYjsDlMczGdw2IZD/w2+t+JjquG4dkBr9uGWY8uMeQKrnlfIKloSDbfMoi8ZL+Ybd4xd0a6Pxf/1h1Kamvq6Pcv9Tq36BiuJJkSA8qTjGSp3W/ZAUzfhLP6ytL7zAK6I8GAIT93fnUp4bj0cq1dg=;
	24:G0B8fKMtxKsog5ti98W5P/w7MZzfvgqF46Yun5u2nd/R4ketpc9tTYAWYL4xdWP/ehesTCUpCkgJrz6U9IL8Ab7tIrlMuTsQp0c2DQefJdQ=;
	7:yFW3PhsCHQ0eoDimxZ4RFJFJkdHPlaXEZ0JEIhyzw+Weix2dqS9Rqw32tPp7jGK+Vh64ctaBzwMxJwhDeIrRiG0Q2okBwA8mIAfo8BwiwazLhC06OWZf+vpaLRX96GM446rzLPAM/DsjEThLQN7O9mPXDYG/uRfTwm7FBeRA19OzQ6ajzT1cTM7qu/IWpKlTUdijKDyCuja3r6snJimkKMSa2Tipg4allXQckqnwKmY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2017 17:33:50.7291 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3377
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.89
Subject: [Qemu-devel] [PATCH v4 7/8] xlnx-zynqmp-pmu: Connect the IPI device
 to the PMU
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tM1+AY2YgbeV

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
V4:
 - Move the IPI to the machine instead of the SoC

 hw/microblaze/xlnx-zynqmp-pmu.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
index 828eeedc9f..14b8ed4a43 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -24,6 +24,7 @@
 #include "cpu.h"
 #include "boot.h"
 
+#include "hw/intc/xlnx-zynqmp-ipi.h"
 #include "hw/intc/xlnx-pmu-iomod-intc.h"
 
 /* Define the PMU device */
@@ -38,6 +39,15 @@
 
 #define XLNX_ZYNQMP_PMU_INTC_ADDR   0xFFD40000
 
+#define XLNX_ZYNQMP_PMU_NUM_IPIS    4
+
+static const uint64_t ipi_addr[XLNX_ZYNQMP_PMU_NUM_IPIS] = {
+    0xFF340000, 0xFF350000, 0xFF360000, 0xFF370000,
+};
+static const uint64_t ipi_irq[XLNX_ZYNQMP_PMU_NUM_IPIS] = {
+    19, 20, 21, 22,
+};
+
 typedef struct XlnxZynqMPPMUSoCState {
     /*< private >*/
     DeviceState parent_obj;
@@ -136,6 +146,9 @@ static void xlnx_zynqmp_pmu_init(MachineState *machine)
     MemoryRegion *address_space_mem = get_system_memory();
     MemoryRegion *pmu_rom = g_new(MemoryRegion, 1);
     MemoryRegion *pmu_ram = g_new(MemoryRegion, 1);
+    XlnxZynqMPIPI *ipi[XLNX_ZYNQMP_PMU_NUM_IPIS];
+    qemu_irq irq[32];
+    int i;
 
     /* Create the ROM */
     memory_region_init_rom(pmu_rom, NULL, "xlnx-zynqmp-pmu.rom",
@@ -155,6 +168,24 @@ static void xlnx_zynqmp_pmu_init(MachineState *machine)
                               &error_abort);
     object_property_set_bool(OBJECT(pmu), true, "realized", &error_fatal);
 
+    for (i = 0; i < 32; i++) {
+        irq[i] = qdev_get_gpio_in(DEVICE(&pmu->intc), i);
+    }
+
+    /* Create and connect the IPI device */
+    for (i = 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
+        ipi[i] = g_new0(XlnxZynqMPIPI, 1);
+        object_initialize(ipi[i], sizeof(XlnxZynqMPIPI), TYPE_XLNX_ZYNQMP_IPI);
+        qdev_set_parent_bus(DEVICE(ipi[i]), sysbus_get_default());
+    }
+
+    for (i = 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
+        object_property_set_bool(OBJECT(ipi[i]), true, "realized",
+                                 &error_abort);
+        sysbus_mmio_map(SYS_BUS_DEVICE(ipi[i]), 0, ipi_addr[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(ipi[i]), 0, irq[ipi_irq[i]]);
+    }
+
     /* Load the kernel */
     microblaze_load_kernel(&pmu->cpu, XLNX_ZYNQMP_PMU_RAM_ADDR,
                            machine->ram_size,
-- 
2.11.0

