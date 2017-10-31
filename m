Received: by 10.223.161.27 with SMTP id o27csp3688258wro;
        Tue, 31 Oct 2017 06:03:26 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RutMteDFJYcru+l2us3wEGxQhnhUQBX8nsYFd1UN+3Mr/c7Qgmgt8PPWoZfkF6s+2kXWaK
X-Received: by 10.129.167.137 with SMTP id e131mr1166266ywh.34.1509455006120;
        Tue, 31 Oct 2017 06:03:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509455006; cv=none;
        d=google.com; s=arc-20160816;
        b=A1rAKmdLGrP7wQ4tR8LRIv50mxB2h8lFLtGv4xyRF+ceQw2vbrh6ji4H84tJjgOy6j
         qTEMR6KWYDzTqS94lsdPWQXKV2QmrSNie6jKMDCJnlsSnEbsotT2ib1QRq1BngxEpbfa
         EHjGje/HAIW3hXrn1BAzcNBv67XnAau9Pir1fogusfPb8/9sNDLmIE7rxRpGnEee+Tym
         /SlFnsWGvFVtld3IKkHh+wWKFkIk6DnhO2xXqOOV/fAX42+Sq6NWfPCUQ7XuIljs8nkz
         mq423kxkTyYFAHSJWS/7UBdODXQGqdxezUsbTzzvnllNwv0DqZsAtUsEAnamPwjccVWd
         prjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :spamdiagnosticmetadata:spamdiagnosticoutput:mime-version:message-id
         :date:to:dkim-signature:arc-authentication-results;
        bh=BUPNL4oNXWVXq1YeEYeyXI3gpgU8PpInew9FHCWs/Vk=;
        b=ZZ+2Yx9tLtW2rFs3keJDpuztI2PL8q6vzNfnA7CfZR4jCX58zMirZLRUJMW0XozB3S
         VpAG4lSu555TVoxAupxUZDODLtfioD2+N0WVBBS20ex7pYYIO5lUa5dFOWwig5NsmgtF
         WLaX43UUhWee2YyydykunGQJKP/v6JPxr/Fa/anHfQzFY/DP+44ME9XSRa1uh2lyU9nt
         zIJF5iFCYXWh0n15TrW9ha9B3iayd971n2Ue3faDTteA/r0ckFQ10Ub0Hu9akJFljB+L
         i+5LxSB/XjyWCYso1hFb0U4cHLFBXLkwJk8j1uaBKF/K0g4Vh0bzCza4SFRMCT9UwibL
         VpmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=YYY9skzM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c11si381141ywa.609.2017.10.31.06.03.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Oct 2017 06:03:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=YYY9skzM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45574 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9WCT-0007wh-JJ
	for alex.bennee@linaro.org; Tue, 31 Oct 2017 09:03:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1e9WCB-0007uI-SH
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 09:03:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1e9WC5-0000w7-1t
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 09:03:07 -0400
Received: from mail-sn1nam01on0095.outbound.protection.outlook.com
	([104.47.32.95]:62336
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1e9WC4-0000vh-FG; Tue, 31 Oct 2017 09:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=BUPNL4oNXWVXq1YeEYeyXI3gpgU8PpInew9FHCWs/Vk=;
	b=YYY9skzMxs2aEHRbouQvB6mA2Am3IMnQWuFq8XrZFPmELFW2XOPw6binYHCrpRz0k3sGJmOQW3fZczRTacLYKhlLLiAgG2W0yhWIJI09/u8+0ZuOwAn4dUK1oQfSr4r8F2sr75YxT1AMm6POmXS0z3EK5+RQD662q4Bi+gcBPFo=
Received: from localhost.localdomain (116.246.28.225) by
	MWHPR21MB0158.namprd21.prod.outlook.com (10.173.52.16) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.156.5; Tue, 31 Oct 2017 13:02:56 +0000
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Oct 2017 06:02:23 -0700
Message-Id: <20171031130223.220-1-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.14.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [116.246.28.225]
X-ClientProxiedBy: HK2PR04CA0077.apcprd04.prod.outlook.com (10.170.154.149) To
	MWHPR21MB0158.namprd21.prod.outlook.com (10.173.52.16)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a491eac2-9839-4326-fda1-08d5205fb52b
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(48565401081)(2017052603238);
	SRVR:MWHPR21MB0158; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR21MB0158;
	3:nSZJ3g1jyE6vMVPpK04Xkwjj3lrcWur9MIRBKT3gx1LHdmeeQpGSQmUPxIH+t1uim6E4B/0OcIKO5Taqo5yisu4fWozY4acZsT3nvTjVC0mhs6cS32ytRrCKkVDs+b4Nf3fPYFXRkHmk5/tqTmahAIzUs4xX6DXh+KCAZXLSlbzoJ6g9A8a82C4mJrZpQIa6Ed3M08KIYVzXtHZbiD7RvxMLwBbNdF70WqGTZ0i3zN0C1E2Tnf9jDULJK5jbtCNJ;
	25:uOwcfdzbgs8oS243aN9TXl217LpyctnhhY30h5Pq2/DC9aFx3Ak55IhlpaO7jmYq7X27shaUBspPHo5CMimx/XEMrzcNbtGzhI617CzS3ksxmBu5D6/je2d5L7D5O7LdI6eUeE9QlU9yJy6ttoKv/d7MQanx86/+IOsoCcfMpGsT1Dhq4YXcsgXkMTkl2ZUm3gAyzpmO6ncxwCrgRYGG866K17EF9rA0g9N9KsC/Nbz9cVxRvUMPs9goJIl+QyUWKA5TvjwsikDdoDfUhANn/rtJhVI7Vtxjt/DkJE0rzRgirE1Yq6QLXceBdrKWuX5W9BTkFEHHMs7H6y1IUtpNkA==;
	31:rRuXfWB4aUVwXuyUSBPAD8xCC/tluAAJPE1NvAfWCSuHuChO5G5mIEBWFOKWAc4QwgpIddSjJzByDWR3DmvjTWXvUu9guEIkhtXw1kxRtN9XL6XPY8hcKwoa5+OU6T5CjIbHDeq8BnjSfjZpeAnRYIHMK23RVdEu0wiwHiYADjRIYxK4QcrIg9tUGJybGL4kToIIW7OmnHlDxUd2eeGz/EIH2HMVH/O5RWwUE6MPzuY=
X-MS-TrafficTypeDiagnostic: MWHPR21MB0158:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR21MB0158;
	20:bQrFYbzByIFYnM4cHmk2cm7/WW1z7Nmfz15QxPrZcuRo0QXaiznYNahJGV4on3CcnmMzz3Eaxi/mWQtbjfEfVkgu55a7DwOGuteXpN+xvho938CX0AK9ZLkIq/pEW+WTaqQUesT+t5QNcJPicDrftRnCU4ByZeGj+p1QMEiePDcQAElfVR4yo/T/Rcw5Ene4vnIBT76LkGBTyEMwiHA3PrvdwbEugD4uydSWb8gDwUYlh7ZG+XxTxutHB1mjS6jYCHMqelQnh7NJNJyr/26Qa9o0ZpGh+hlYGPNtJFWI8HVvGOaeRwiwxOK9AJoYeo16ws1sn3lG+rB2RDi9WVAiI+h2EMZPHFU4ysHCQhzR1Jl6ra+hBlf/tBhxpI3dDfWKVXm4Fp/Ioih3KvV5YPUvto7Kd7Ox2q0UaxB2cK+tkESDdjpqHOFe8hqoeoXkglMf68P6fE3lswJrSPzwlFltY5OWx19dV/wnoBU3UL5rJcKJ5S1qIiuw9LhDpEgSnjUQ;
	4:bN0arQ/fXbt7y/7e6aqD1orHOZT+1SNERIjlNUQwsCe5X3R9D/ZkNT2kVGjYm/L4fm384Ov47z6PDhFZSiTz++xQCZ74A7d4bYPaTnko7toV9qnS/EnobfwJbJONr1R7JpFte6YHxugFFYJled5tezHud6LHUAtSCla3ulqjPdfaWOJuzPAep/LdioljfhcZuoaqRSJE9n+pqvzElXKNhIh/HF72uKsF5atsL0Jwtv9UUQgePAnzSzkU/qTjLRa5KszSP/Jdkb7pPW/x67DMclCMbnHYMWhfgOvILHalEmpEAV6svMZWUyJUdgU7Ul+FDYkRd7s0D8LUA+KEBPgY2w==
X-Exchange-Antispam-Report-Test: UriScan:(89211679590171)(192374486261705);
X-Microsoft-Antispam-PRVS: <MWHPR21MB0158EDD19390FF222619F6A99E5E0@MWHPR21MB0158.namprd21.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(61425038)(6040450)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(10201501046)(93006095)(93001095)(3002001)(3231020)(6055026)(61426038)(61427038)(6041248)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123564025)(20161123555025)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR21MB0158; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR21MB0158; 
X-Forefront-PRVS: 04772EA191
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(6069001)(376002)(39860400002)(346002)(47760400005)(199003)(189002)(48376002)(25786009)(50466002)(47776003)(189998001)(2906002)(53936002)(316002)(8936002)(66066001)(16526018)(81156014)(81166006)(5660300001)(8676002)(105586002)(10290500003)(97736004)(106356001)(4326008)(22452003)(68736007)(16586007)(5003940100001)(107886003)(36756003)(6512007)(7736002)(6666003)(50986999)(6486002)(6916009)(6506006)(10090500001)(478600001)(50226002)(3846002)(72206003)(101416001)(6116002)(86612001)(1076002)(86362001)(305945005)(22906009)(473944003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0158;
	H:localhost.localdomain; FPR:; SPF:None; PTR:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR21MB0158;
	23:EQzE2RSJCb3Ne1IqW3ibmEA5+TihkgUrtn1orsJQC?=
	=?us-ascii?Q?VJXDz56KoJe8EWuK+BsnHW1AlpaLXDpnP73+02vgYYY9nltido5e9gb2tjNA?=
	=?us-ascii?Q?ZBSZ+QTolM5Nz12W/Vnh04bjZzkJ+RZ1xOe6KH4V0hr5dTsWFbKlJ7O9byD/?=
	=?us-ascii?Q?u4p8M53/jIbjoHMoTRQQuRYdxyCi3j+JOZZwKrV15l5EhBlYMtlwWSXF7RaC?=
	=?us-ascii?Q?Z8zNWx3p4Nac3vjKpH6LjFgjA5vQ9NR1EtwdBIls96hGemxaGlbluZGiNZfT?=
	=?us-ascii?Q?aH10xpK5sOGgctSNXUJCLsHBUw13W76XPMfkiCIvA4jOIPCf7BOmJdko4m6u?=
	=?us-ascii?Q?pqsoclm0GjveMuFAwR1eVBWrOiPodrwGfjLx2IjdN8QKAW3yCkEsmVClAeS4?=
	=?us-ascii?Q?8Kw6XpHXXgbIJwB1kEQUnWZdkFxcIIw57o7RGPc7allDtjAZ6yICgp7WT5nX?=
	=?us-ascii?Q?Lb/5KcPUfrm8B1J8k9gp6oTeP4g+0BcFYPd6NpOI1KmyQD2m8WIF14YyVFIF?=
	=?us-ascii?Q?TIr7t6vboBKkHOVa45WHYH6FDm2hNAuvCetnUYDfIDlV5j6zObyhwg3rDTWq?=
	=?us-ascii?Q?TIiUuPFKsqILsBSREcrwaHpTMmolC98F5dSe8KjiGmKtKgCYpYBk8dyNOIV6?=
	=?us-ascii?Q?B7FOZThFumlQGpEAEn+hYfs9zBxGx3/xbyqqcNsbnUhXu+jrQ5kBQB+0tqwH?=
	=?us-ascii?Q?S0lEk3+vTYIkM7dgATlGssTWfeKXMGIJHikTZ/mb//Q8hVbFyqEUBLIwI/9e?=
	=?us-ascii?Q?47yC6ThtRIiiaf3x48m9Jy0fXj7c2iYF+wekQ1Pea3j6H+k4k3tEK87A1PxK?=
	=?us-ascii?Q?EHfmr3//HFRRaU5xKYbWXsHEHcbyKOMjJ7wkD/XQ1GocTZpEQjwTofi4TE+4?=
	=?us-ascii?Q?FJ1tB6Lxrjr9OWCDKGMMx9qpU6mEStWVrz7NYMeV4XOBDFeTQVv+PhYhAyOD?=
	=?us-ascii?Q?LVdAKNeHFyoGcdgBeEAHM45KbgMIoLAnrxRJKrkMScr6Yf7EWj5VVzWsilcf?=
	=?us-ascii?Q?7lVkp55vsRaeBXPEd6ZUYoMQGZcyt6plSgJTzej8/qMNWObAxR0YXqz4bW6f?=
	=?us-ascii?Q?rF24KOISxYQLmhGR3UEzpzt5Y2Oz1i7y2uR/p3oi3elSIeldhyJVHQK2fUSB?=
	=?us-ascii?Q?L2xZUs0Ozn0dlclshqwBJvnXFelHtULwVEav8JaAVmA9JUYarpfMmVidjAlO?=
	=?us-ascii?Q?ZDwpyIYFU1W9TqvZPD3mP2pnMfg4C2sdV/sebk8Xc8bphjm8HfBIyHu9bnkX?=
	=?us-ascii?Q?MSWfQa5iAqAGsKiXPlevo2+8m6g50XOnTd7a3NJ?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR21MB0158;
	6:tH8s/yKUCvTF59o8nBuGun8jx5MRZrDhN2tPWv51cIs5vd1NpLU6DWVY7txXdjp7XoWa/YRFYZlRSQyNZiWDT6Dbs0yMxhPar8D7QrqGoQuSUz553AaRyXofP5SxQy+CkwufaR8Innqe+uh7VahyR5fy/yG8RANBMVLjE+LrU6ccHeiPMqD6EG75lH5ocXmMVAQ0tPhKom77hrjga4aEhTZCdhx5X9tO8p3yHmQSPzVFylBUtxzakwEt/SS6/HiRgW4Y2k1nfpO3xa70NUW1BY6EZYWpohFgZtGlar1ApJN3cYZ+8xZx9Y5lf+zylVLKxj5CIO1AFmPpDySkKes7Mg==;
	5:bFoDNUkiNRHxwzdJ4T8OMAh0KlfLE+giUgIFzxq9/KgYedm34uX9Oiczh1cH/WOwrMLX4Y/BsnVHJ/uabuY/BDy3qbpu5Q/1oY3d0kuZ+lDUzwqK2cIyilXsvmCJ6lTctZAQU0tnDKnM+P5BYVIlMw==;
	24:1fpazZ8BF42wRfz3fXEyZVYs0mNYy5yquEsvvxNNWHJuBjtERjNpB+KrcUv+VtUgPTo+mxhsQ73D0+aUo7pqWLf+CV3gAtnGrcc8g/2Y3kc=;
	7:mmn/Tiv/D3NvFXZPCnCY/2TQXzGd2HjLiAs7/ztc2CbE2OtNqfWaxpk3uFG8pKLnCFToLztSXbQKcnITkpEwxY99Qlwpk7gpc33sUtV8TW5ywfgmJtL0Wom5a0t7nv3oKVXRi8nzcTl7PzmHfcM4LzrlHj+f02AMTrZ3iu1El0QjNGR3W8h52WJBo5Ve7DgZt9zImhX0EHDaSCC4m3FnzHsd/3tLJwLPDWrinr0fIO0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2017 13:02:56.5705 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a491eac2-9839-4326-fda1-08d5205fb52b
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0158
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.95
Subject: [Qemu-arm] [PATCH v3] arm: implement cache/shareability attribute
 bits for PAR registers
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
From: Andrew Baumann via Qemu-arm <qemu-arm@nongnu.org>
Reply-To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aj0nEPj7sJGo

On a successful address translation instruction, PAR is supposed to
contain cacheability and shareability attributes determined by the
translation. We previously returned 0 for these bits (in line with the
general strategy of ignoring caches and memory attributes), but some
guest OSes may depend on them.

This patch collects the attribute bits in the page-table walk, and
updates PAR with the correct attributes for all LPAE translations.
Short descriptor formats still return 0 for these bits, as in the
prior implementation.

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---
v2:
 * return attrs via out parameter from get_phys_addr, rather than MemTxAttrs
 * move MAIR lookup/index inline, since it turned out to be simple
 * implement attributes for stage 2 translations
 * combine attributes from stages 1 and 2 when required

v3:
 * implement S2 allocation hints and check for cache-disabled
 * fix stage 2 shareability bits
 * fix combined allocation hints (always use stage 1 hints)
 * remove LOG_UNIMP message

There's unfortunately one new wrinkle in this revision: the spec for
S2ConvertAttrsHints() calls S2CacheDisabled() and returns non-cached if the
cache is disabled. I assumed that we ought to emulate this. However, it wasn't
clear to me what to make of the "if ELUsingAArch32(EL2)" branch -- we have a
cp15.hcr_el2, but no HCR2 register. I just left a TODO comment, but it's quite
likely I've missed something.

Thanks,
Andrew

 target/arm/helper.c | 180 ++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 166 insertions(+), 14 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 96113fe989..81fe9283ea 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -19,17 +19,23 @@
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 
 #ifndef CONFIG_USER_ONLY
+/* Cacheability and shareability attributes for a memory access */
+typedef struct ARMCacheAttrs {
+    unsigned int attrs:8; /* as in the MAIR register encoding */
+    unsigned int shareability:2; /* as in the SH field of the VMSAv8-64 PTEs */
+} ARMCacheAttrs;
+
 static bool get_phys_addr(CPUARMState *env, target_ulong address,
                           MMUAccessType access_type, ARMMMUIdx mmu_idx,
                           hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
                           target_ulong *page_size, uint32_t *fsr,
-                          ARMMMUFaultInfo *fi);
+                          ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs);
 
 static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
                                target_ulong *page_size_ptr, uint32_t *fsr,
-                               ARMMMUFaultInfo *fi);
+                               ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs);
 
 /* Security attributes for an address, as returned by v8m_security_lookup. */
 typedef struct V8M_SAttributes {
@@ -2159,9 +2165,10 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
     uint64_t par64;
     MemTxAttrs attrs = {};
     ARMMMUFaultInfo fi = {};
+    ARMCacheAttrs cacheattrs = {};
 
-    ret = get_phys_addr(env, value, access_type, mmu_idx,
-                        &phys_addr, &attrs, &prot, &page_size, &fsr, &fi);
+    ret = get_phys_addr(env, value, access_type, mmu_idx, &phys_addr, &attrs,
+                        &prot, &page_size, &fsr, &fi, &cacheattrs);
     if (extended_addresses_enabled(env)) {
         /* fsr is a DFSR/IFSR value for the long descriptor
          * translation table format, but with WnR always clear.
@@ -2173,7 +2180,8 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
             if (!attrs.secure) {
                 par64 |= (1 << 9); /* NS */
             }
-            /* We don't set the ATTR or SH fields in the PAR. */
+            par64 |= (uint64_t)cacheattrs.attrs << 56; /* ATTR */
+            par64 |= cacheattrs.shareability << 7; /* SH */
         } else {
             par64 |= 1; /* F */
             par64 |= (fsr & 0x3f) << 1; /* FS */
@@ -6925,7 +6933,7 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx,
         return false;
     }
     if (get_phys_addr(env, addr, MMU_INST_FETCH, mmu_idx,
-                      &physaddr, &attrs, &prot, &page_size, &fsr, &fi)) {
+                      &physaddr, &attrs, &prot, &page_size, &fsr, &fi, NULL)) {
         /* the MPU lookup failed */
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_IACCVIOL_MASK;
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM, env->v7m.secure);
@@ -8207,7 +8215,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         int ret;
 
         ret = get_phys_addr_lpae(env, addr, 0, ARMMMUIdx_S2NS, &s2pa,
-                                 &txattrs, &s2prot, &s2size, fsr, fi);
+                                 &txattrs, &s2prot, &s2size, fsr, fi, NULL);
         if (ret) {
             fi->s2addr = addr;
             fi->stage2 = true;
@@ -8608,11 +8616,45 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
     return true;
 }
 
+/* Translate from the 4-bit stage 2 representation of
+ * memory attributes (without cache-allocation hints) to
+ * the 8-bit representation of the stage 1 MAIR registers
+ * (which includes allocation hints).
+ *
+ * ref: shared/translation/attrs/S2AttrDecode()
+ *      .../S2ConvertAttrsHints()
+ */
+static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
+{
+    uint8_t hiattr = extract32(s2attrs, 2, 2);
+    uint8_t loattr = extract32(s2attrs, 0, 2);
+    uint8_t hihint = 0, lohint = 0;
+
+    if (hiattr != 0) { /* normal memory */
+        /* TODO: to faithfully emulate S2CacheDisabled() for the case
+         * when EL2 is aarch32, we should check HCR2 (not HCR_EL2), but
+         * qemu doesn't presently model this register.
+         */
+        if ((env->cp15.hcr_el2 & HCR_CD) != 0) { /* cache disabled */
+            hiattr = loattr = 1; /* non-cacheable */
+        } else {
+            if (hiattr != 1) { /* Write-through or write-back */
+                hihint = 3; /* RW allocate */
+            }
+            if (loattr != 1) { /* Write-through or write-back */
+                lohint = 3; /* RW allocate */
+            }
+        }
+    }
+
+    return (hiattr << 6) | (hihint << 2) | (loattr << 2) | lohint;
+}
+
 static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
                                target_ulong *page_size_ptr, uint32_t *fsr,
-                               ARMMMUFaultInfo *fi)
+                               ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
     CPUState *cs = CPU(cpu);
@@ -8929,6 +8971,21 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
          */
         txattrs->secure = false;
     }
+
+    if (cacheattrs != NULL) {
+        if (mmu_idx == ARMMMUIdx_S2NS) {
+            cacheattrs->attrs = convert_stage2_attrs(env,
+                                                     extract32(attrs, 0, 4));
+        } else {
+            /* Index into MAIR registers for cache attributes */
+            uint8_t attrindx = extract32(attrs, 0, 3);
+            uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
+            assert(attrindx <= 7);
+            cacheattrs->attrs = extract64(mair, attrindx * 8, 8);
+        }
+        cacheattrs->shareability = extract32(attrs, 6, 2);
+    }
+
     *phys_ptr = descaddr;
     *page_size_ptr = page_size;
     return false;
@@ -9490,6 +9547,91 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
     return false;
 }
 
+/* Combine either inner or outer cacheability attributes for normal
+ * memory, according to table D4-42 of ARM DDI 0487B.b (the ARMv8 ARM).
+ *
+ * NB: only stage 1 includes allocation hints (RW bits), leading to
+ * some asymmetry.
+ */
+static uint8_t combine_cacheattr_nibble(uint8_t s1, uint8_t s2)
+{
+    if (s1 == 4 || s2 == 4) {
+        /* non-cacheable has precedence */
+        return 4;
+    } else if (extract32(s1, 2, 2) == 0 || extract32(s1, 2, 2) == 2) {
+        /* stage 1 write-through takes precedence */
+        return s1;
+    } else if (extract32(s2, 2, 2) == 2) {
+        /* stage 2 write-through takes precedence, but the allocation hint
+         * is still taken from stage 1
+         */
+        return (2 << 2) | extract32(s1, 0, 2);
+    } else { /* write-back */
+        return s1;
+    }
+}
+
+/* Combine S1 and S2 cacheability/shareability attributes, per D4.5.4
+ *
+ * @s1:      Attributes from stage 1 walk
+ * @s2:      Attributes from stage 2 walk
+ */
+static ARMCacheAttrs combine_cacheattrs(ARMCacheAttrs s1, ARMCacheAttrs s2)
+{
+    uint8_t s1lo = extract32(s1.attrs, 0, 4), s2lo = extract32(s2.attrs, 0, 4);
+    uint8_t s1hi = extract32(s1.attrs, 4, 4), s2hi = extract32(s2.attrs, 4, 4);
+    ARMCacheAttrs ret;
+
+    /* Combine shareability attributes (table D4-43) */
+    if (s1.shareability == 2 || s2.shareability == 2) {
+        /* if either are outer-shareable, the result is outer-shareable */
+        ret.shareability = 2;
+    } else if (s1.shareability == 3 || s2.shareability == 3) {
+        /* if either are inner-shareable, the result is inner-shareable */
+        ret.shareability = 3;
+    } else {
+        /* both non-shareable */
+        ret.shareability = 0;
+    }
+
+    /* Combine memory type and cacheability attributes */
+    if (s1hi == 0 || s2hi == 0) {
+        /* Device has precedence over normal */
+        if (s1lo == 0 || s2lo == 0) {
+            /* nGnRnE has precedence over anything */
+            ret.attrs = 0;
+        } else if (s1lo == 4 || s2lo == 4) {
+            /* non-Reordering has precedence over Reordering */
+            ret.attrs = 4;  /* nGnRE */
+        } else if (s1lo == 8 || s2lo == 8) {
+            /* non-Gathering has precedence over Gathering */
+            ret.attrs = 8;  /* nGRE */
+        } else {
+            ret.attrs = 0xc; /* GRE */
+        }
+
+        /* Any location for which the resultant memory type is any
+         * type of Device memory is always treated as Outer Shareable.
+         */
+        ret.shareability = 2;
+    } else { /* Normal memory */
+        /* Outer/inner cacheability combine independently */
+        ret.attrs = combine_cacheattr_nibble(s1hi, s2hi) << 4
+                  | combine_cacheattr_nibble(s1lo, s2lo);
+
+        if (ret.attrs == 0x44) {
+            /* Any location for which the resultant memory type is Normal
+             * Inner Non-cacheable, Outer Non-cacheable is always treated
+             * as Outer Shareable.
+             */
+            ret.shareability = 2;
+        }
+    }
+
+    return ret;
+}
+
+
 /* get_phys_addr - get the physical address for this virtual address
  *
  * Find the physical address corresponding to the given virtual address,
@@ -9514,12 +9656,14 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
  * @prot: set to the permissions for the page containing phys_ptr
  * @page_size: set to the size of the page containing phys_ptr
  * @fsr: set to the DFSR/IFSR value on failure
+ * @fi: set to fault info if the translation fails
+ * @cacheattrs: (if non-NULL) set to the cacheability/shareability attributes
  */
 static bool get_phys_addr(CPUARMState *env, target_ulong address,
                           MMUAccessType access_type, ARMMMUIdx mmu_idx,
                           hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
                           target_ulong *page_size, uint32_t *fsr,
-                          ARMMMUFaultInfo *fi)
+                          ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
 {
     if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
         /* Call ourselves recursively to do the stage 1 and then stage 2
@@ -9529,10 +9673,11 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
             hwaddr ipa;
             int s2_prot;
             int ret;
+            ARMCacheAttrs cacheattrs2 = {};
 
             ret = get_phys_addr(env, address, access_type,
                                 stage_1_mmu_idx(mmu_idx), &ipa, attrs,
-                                prot, page_size, fsr, fi);
+                                prot, page_size, fsr, fi, cacheattrs);
 
             /* If S1 fails or S2 is disabled, return early.  */
             if (ret || regime_translation_disabled(env, ARMMMUIdx_S2NS)) {
@@ -9543,10 +9688,17 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
             /* S1 is done. Now do S2 translation.  */
             ret = get_phys_addr_lpae(env, ipa, access_type, ARMMMUIdx_S2NS,
                                      phys_ptr, attrs, &s2_prot,
-                                     page_size, fsr, fi);
+                                     page_size, fsr, fi,
+                                     cacheattrs != NULL ? &cacheattrs2 : NULL);
             fi->s2addr = ipa;
             /* Combine the S1 and S2 perms.  */
             *prot &= s2_prot;
+
+            /* Combine the S1 and S2 cache attributes, if needed */
+            if (!ret && cacheattrs != NULL) {
+                *cacheattrs = combine_cacheattrs(*cacheattrs, cacheattrs2);
+            }
+
             return ret;
         } else {
             /*
@@ -9617,7 +9769,7 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
 
     if (regime_using_lpae_format(env, mmu_idx)) {
         return get_phys_addr_lpae(env, address, access_type, mmu_idx, phys_ptr,
-                                  attrs, prot, page_size, fsr, fi);
+                                  attrs, prot, page_size, fsr, fi, cacheattrs);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, address, access_type, mmu_idx, phys_ptr,
                                 attrs, prot, page_size, fsr, fi);
@@ -9645,7 +9797,7 @@ bool arm_tlb_fill(CPUState *cs, vaddr address,
 
     ret = get_phys_addr(env, address, access_type,
                         core_to_arm_mmu_idx(env, mmu_idx), &phys_addr,
-                        &attrs, &prot, &page_size, fsr, fi);
+                        &attrs, &prot, &page_size, fsr, fi, NULL);
     if (!ret) {
         /* Map a single [sub]page.  */
         phys_addr &= TARGET_PAGE_MASK;
@@ -9674,7 +9826,7 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
     *attrs = (MemTxAttrs) {};
 
     ret = get_phys_addr(env, addr, 0, mmu_idx, &phys_addr,
-                        attrs, &prot, &page_size, &fsr, &fi);
+                        attrs, &prot, &page_size, &fsr, &fi, NULL);
 
     if (ret) {
         return -1;
-- 
2.14.2

