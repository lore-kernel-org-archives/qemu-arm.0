Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1960282njb;
        Mon, 29 Jul 2024 12:03:40 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXS7f3T/gi/1Pb1mo0DmkuHM5kNn8aZolyEPGP1jgpXgovk/OJQOHV9tEHbTIaDjVUjXMtvrtUS/wmvQothT2dzEzl9/sGu
X-Google-Smtp-Source: AGHT+IF6Dx1yfzag/PYhZwuNqlogLWtHeSACcKedmByYRg7UGTx+XqGHwJyAfwa3Zxbbh8nKBUMX
X-Received: by 2002:a05:6808:309c:b0:3db:15c7:b02f with SMTP id 5614622812f47-3db23d0d0b4mr13491959b6e.25.1722279820741;
        Mon, 29 Jul 2024 12:03:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722279820; cv=pass;
        d=google.com; s=arc-20160816;
        b=sU0g96/40ELZ90ptOpGHAMthCd8jV7p0gjvW+qV9Vhhb4s8y+hvBco2As59pAq0+x6
         6O/tVvV6w5nXVrgpDEv1Y30RxBgoHiMQakNHvxDcKq/BLdQ8Xa9OT5ZIYsT4mJximnJ1
         NzS4j6qSE2iHHz2j2T2/XTBgqmNlPLDnMnH3TTs7I9fFrDaRh51HhTEaBVEEWS/yv6aE
         4iTmF+tM+QK66ke/F3mtrGHDks0EsFKVK/FCqLMnFEi1uDfHPL8L8wbcn9GTmJ45M+Kx
         xKSJmfxxNYy06+p1sDqu0R82GGd45v2iSzvIpfQvjxma3Oarkqj3fVc8TueKrKAcQ9Gv
         xqQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:stx-hosted-ironport-oubound
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:stx-internal-mailhost:dkim-signature:dkim-signature;
        bh=rkiIMDPr4hbt0KSrPbZ7A34gKHAmxkFG4WbWNC95Iv0=;
        fh=XW1DfTAgySJ7gv0z2Ojy7yehjlTVG6fg/ed+OD9+Hwo=;
        b=FslZHXjdrf2bV80CZsGX3rguM4bNUj3GbUSTxjPjSCQqGUU3/pETv8SEz7D1a/w689
         9/Yky8yV/Xw+blyF7lTSJumIwG54hd3gVnYBTY6itmSzIUDiJyj6+emUsIooP/m3bIom
         m8TwvF8cuG5cAAtC/ydv636AwRBHCTrZ0H1BYt3x3xtuVHDlVK49Vh1ECAzohRbRPHmE
         4ZS7OBlLzVGCt9lKwsehd7MxhDPToa93qmq4qci/xTyYYjK6KtpdK0MtorbxQKbav8Nb
         u8RK/uBMWnvPTgXtXnC3pPkN9t9sCdYoOQQvLfyKws265Zu2eUIDfElMn6aEGtIRKqnb
         FFKw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=fail header.i=@seagate.com header.s=stxiport header.b=ojXHG0rJ;
       dkim=pass header.i=@seagate.com header.s=selector1 header.b=F93O0s5l;
       arc=pass (i=1);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=seagate.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe81366f0si108145011cf.53.2024.07.29.12.03.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2024 12:03:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@seagate.com header.s=stxiport header.b=ojXHG0rJ;
       dkim=pass header.i=@seagate.com header.s=selector1 header.b=F93O0s5l;
       arc=pass (i=1);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=seagate.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sYVde-0001Na-Dk; Mon, 29 Jul 2024 15:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.zeise@seagate.com>)
 id 1sYVdd-0001KT-Ln; Mon, 29 Jul 2024 15:02:29 -0400
Received: from esa.hc4959-67.iphmx.com ([139.138.35.140])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.zeise@seagate.com>)
 id 1sYVdP-0005Lq-La; Mon, 29 Jul 2024 15:02:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=seagate.com; i=@seagate.com; q=dns/txt; s=stxiport;
 t=1722279735; x=1753815735;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G68+7dfymQ00uIGAn7lJUf6VqSh9B/C4tqmMwpDvGjU=;
 b=ojXHG0rJ0OZXv2D+pkuM2IV60wgYm5SaoIbuzoTu7tfw4OMU8Xr0y2KQ
 pwBDTPjcATuRNga4JPMqUl0yMe0HLpiSxuaCWnzqly6iC9QSQ711+03no
 bqwVK7XdaTxa4kakLFZekJhJdAfb3874ZDSstFchbharZ7Zvr+/HwQHQN Y=;
X-CSE-ConnectionGUID: EeWmu0OYSGa2BEM/Su+ZoQ==
X-CSE-MsgGUID: dxxt2PovT/GyEpqBDSQTgA==
Received: from mail-bn8nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.173])
 by ob1.hc4959-67.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 12:02:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aef5LAS6Y3mdCdNd06Upcu8d5A6lubFgNSS6M+1clfcpMW8Fur2bqDpKViXxf/ZwjMeYqyU9HwmxfXhq8UAxXiACYX5uN5OIrx232M0m/p3n+cRAS+Uznydsvku05nAHCFVCdynBtfhBsAnuPvHbEHldb9OK8FE4EJ1p3wjgTNKbs7f66b4DKxkOxHaBh/wUm9Cw8e81eUCIvWMHtC/0/UPVQq74vS2Z5SkJX4hH9xX4BLkh1xqAuy5rGpxYVMoRCkMOotopHLIfjrllXToJjSbC++YTdh5l/3R7FP9XApCRMteo9beNWwn8G3ELRHQGucFY9jYPTy72GnVLMQ6SLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rkiIMDPr4hbt0KSrPbZ7A34gKHAmxkFG4WbWNC95Iv0=;
 b=xj4APsquI2r2HAVi1Xh+PUw+iZ7yk/A+MaQOdG+mV1qxcJ4wXYFGhjpMkP0P+5LKSd5AIHQ+zq6Zn1wKHdU0h6Xech9qPXlaUTzDOttc/J46FDkB0uoU7AKJbKSu0sr/DIPlK7iun/gcHRXq8IhBoYg7Ob7iPFuoKF3GUb2X4UA0HGMU4EtczHElV3KZlpRfyFIsWxxC4wnoznytg2883rY+aU0ff7lyqjky1WX4Ts2Lz/zYzPqXhO2WWd3SxkCCCyxy1H4vgbxCage7mQWCBziy5I4W6V06DofiIguqiny1Acg2xC9Px0d2ioe2Kl7V85R3143/PxtwPpWR3mPHJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 192.55.16.50) smtp.rcpttodomain=nongnu.org smtp.mailfrom=seagate.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=seagate.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seagate.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rkiIMDPr4hbt0KSrPbZ7A34gKHAmxkFG4WbWNC95Iv0=;
 b=F93O0s5lQb+zwgZz9vxCJ0f1rRSVO5z6qwuJMDdedZfHbgfV+3ZX2DA20HODrczTSUChSrtCs2b6eq9OzwgA6r6aPgGBiH0I+EIbWAI1Yomasanms9BPBjQTaq8/UePduGGkrKxn/bCpoJeteuZBk8S8fAwAAb4nE0Eo8Q854HY=
Received: from SJ0PR13CA0116.namprd13.prod.outlook.com (2603:10b6:a03:2c5::31)
 by SA1PR20MB7353.namprd20.prod.outlook.com (2603:10b6:806:3ea::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.32; Mon, 29 Jul
 2024 19:02:07 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::52) by SJ0PR13CA0116.outlook.office365.com
 (2603:10b6:a03:2c5::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19 via Frontend
 Transport; Mon, 29 Jul 2024 19:02:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 192.55.16.50)
 smtp.mailfrom=seagate.com;
 dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=seagate.com;
Received: from sgspzesaa001.seagate.com (192.55.16.50) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Mon, 29 Jul 2024 19:02:05 +0000
X-CSE-ConnectionGUID: ljcqUpXkSom//ryisNTxqA==
X-CSE-MsgGUID: kiw991AMS8S+35q4QgXDeg==
Received: from sgspiesaa002.seagate.com ([10.4.144.53])
 by sgspzesaa001.seagate.com with ESMTP; 29 Jul 2024 12:01:56 -0700
X-CSE-ConnectionGUID: fo3epGGOTqCxJ7H2xyPEFQ==
X-CSE-MsgGUID: iail1XcRRxax1OVwhTPWhw==
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="121679657"
STX-Internal-Mailhost: TRUE
Received: from unknown (HELO cortana..) ([10.4.50.14])
 by sgspiesaa002.seagate.com with ESMTP; 29 Jul 2024 12:01:48 -0700
From: Alejandro Zeise <alejandro.zeise@seagate.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 berrange@redhat.com, alejandro.zeise@seagate.com
Subject: [PATCH v2 0/2] hw/misc/aspeed_hace: Fix SG Accumulative Hash
 Calculations
Date: Mon, 29 Jul 2024 19:00:33 +0000
Message-Id: <20240729190035.3419649-1-alejandro.zeise@seagate.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|SA1PR20MB7353:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ba5219a7-b3b7-4f28-63b3-08dcb000f067
STX-Hosted-IronPort-Oubound: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1LYYkrVl+UhVd3GEkc2CYKJ+46MCKE8z77lW7w6eF4375Vhc+NFp0yKwtOUy?=
 =?us-ascii?Q?RfO+rAErTGoXmUtv/ozNbASezMy8JOseHoo7MQf69xpkAqE0CApOHI9limj8?=
 =?us-ascii?Q?N70SVqyJNrAiYiPFYULUonvOiaRM9+4PXEnI8dZFtwG00gsMx2C+lbROFQGT?=
 =?us-ascii?Q?1OexGBbdl04933X9U9TBYAsBdSMtx8AE72/ZrtuH/ZWMwziy9yvjB3HccflS?=
 =?us-ascii?Q?P2JUpY5lLb7YJz9zgkCZpxS3lNL4tG9QmAvBvAL+FFC/K8NJDbA1PKieQCe9?=
 =?us-ascii?Q?eCpExQcLNpQMDXY6A0GNyffIuKqGVU5IDFv6H32q5tkf3CSbynaznyN1Rp0y?=
 =?us-ascii?Q?/CKeAawO1KlUl2GSCmkm1NcsRRLV/XoM15+QsuydKBxKLYFnVZsyfkXuKV0u?=
 =?us-ascii?Q?UCdZvHfzHASo3lxNXgygHA+ZQAHeqVP44PRMChZoS/eudcM/Cz3DEanAl79Z?=
 =?us-ascii?Q?IFiQKd0VfAHCVuoK8mgv2IbRhQJ05DREY2j/zpFqphzDicHN9lnHhIleSrvY?=
 =?us-ascii?Q?tDzSGZ28e1CqKaWQaE+lCoPPw5X7pceywhRRAyCtv2hQgvjSGaeLltNeT7//?=
 =?us-ascii?Q?KW9I3z+FQ2FaF1U9gr+emqGgwbIu+SEjOH+OZRzmM7EYK/K69KdqlHT3aBZt?=
 =?us-ascii?Q?ns3kegQQZCzJ2sDOFR3kCkkkibqVbM99lP/u0OiUR6Iult43qhM+FxF88+bf?=
 =?us-ascii?Q?VYmGPzHmvbp0MKSV3wgmkxuTRYCJDiH7+c9NQn8nuALI6XjZtLJNP6ExUjv8?=
 =?us-ascii?Q?J/IK4bRJQDekftQRVqgVBJQs9WQba7D2rbt+ya/GtoRzWpqz8ydG5vES/pAt?=
 =?us-ascii?Q?+SBs3kLXoevADzAGRZupwq4Yma+kyoj5bnUBTPCr0eKBEUEHbpxaH839UB+b?=
 =?us-ascii?Q?ZUoAhyaTaJpG6PIw/0kbaWf6RYtXLqQPfgueVn95/mdy79C/RqBESgEpISkJ?=
 =?us-ascii?Q?VAPwaBh4uEsUt9ISfY1l/Z3hIUR6hXEEzwPJYzyyHQj369sMh3bBnXOH0y3U?=
 =?us-ascii?Q?k/1sDUFQvM0zwiUNAu2kwe0YOUpQaVnxe3cZayhVyLSH9MR6/jykUP+8M6BO?=
 =?us-ascii?Q?JnfdB86U1bUAuNaP09saKCVkvq/f7LQHHRiAm0V8UVu2WoJAqO0eO4Py/BRe?=
 =?us-ascii?Q?AVxxkA5oLzA+uIHgKuYns133td79nDMB9XgmrtfUXIMpMGJ9SUIunGWKdpNY?=
 =?us-ascii?Q?R9JkBQb5DjlvMluPbmACP4A54/un0Yll8DWtW3LQewQBbwrb2QxTBOFCeUUn?=
 =?us-ascii?Q?wuJAekuOTjrivNFDBGLX0Uu/cnvoQEJ4h7DlYnGSLHW4oaPz/lU3UJACWE6f?=
 =?us-ascii?Q?qKeEimc1zPa/MW0/s5yT7mckbzZRimTz5PT6y3UKDUGDoLSv+qYuY7bpDu0D?=
 =?us-ascii?Q?ua99ZNHi4Z6OD+2BrwjeQoVsgMQHiSdr2LNmvw7WNnDoEmI7wT46A9Qd5qNw?=
 =?us-ascii?Q?NrkjpIrvbW/b3uCn/bskmuh72ndbEHL7?=
X-Forefront-Antispam-Report: CIP:192.55.16.50; CTRY:SG; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:sgspzesaa001.seagate.com; PTR:InfoDomainNonexistent;
 CAT:NONE; SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: /ebEGkhLBJx2Lh5ehTArGbpZVGkR/3s32iaq6JvnBSyxPRuCIixjLXABMkqgAzt+MAVxuKH1E9y/5mo18W23bWCN47Enj8TXf4s23B3ZPC5Gkh1qcteLJCW81Epckmb8B0Q3qzEsiobFj0BGGqtsO0SqNRFMKlARaoOM+WIe1I8bF8vb22AYn6K2ct+z3rgd7zXqj6puwG9QJbBSKf30olw2SHn4PxlHx+eIHvcZ/Zl7klYBdF8yeBoow2b8XLv3Ng+KTYH6t7sayWwzsbm5ffA7qJzTC64uyddUuTJUe7ZKdsr/jh7skN6Zp7biNnAjMn8NcA+pW3fHUM56Kbfdw5M10dhrmDS4EQvDaOyu2jn9YDGY8zobFT6jxD7Tj1giQ/WydRvnsSb7YT0HRPXCSZIP8NK4q2x4JXrKR8y28H6qXyXvMlRvWh0CurRiXexZdXGC9U/DghjptQWVa0JDnYKu72kEyMr/0LW/69C8C/GUiTTD+K7cwkGE0dOZ+bzjV/a/02uo+DFdhtr34ntvTTqZ48uxc56vKBKlFc2gHl/SsisaGP3FR22TvF2E63VOQj5qVf2MEpNyPYUL6I7pp+Yy8EvwwpbvXFQecj8VyEOqMGk4FVHI5QKCPu/1HpJQ
X-OriginatorOrg: seagate.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 19:02:05.0501 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba5219a7-b3b7-4f28-63b3-08dcb000f067
X-MS-Exchange-CrossTenant-Id: d466216a-c643-434a-9c2e-057448c17cbe
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d466216a-c643-434a-9c2e-057448c17cbe; Ip=[192.55.16.50];
 Helo=[sgspzesaa001.seagate.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR20MB7353
Received-SPF: pass client-ip=139.138.35.140;
 envelope-from=alejandro.zeise@seagate.com; helo=esa.hc4959-67.iphmx.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.125,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: P57+FouBwWDk

The goal of this patch series is to fix accumulative hashing support in the 
Aspeed HACE module. The issue that stemmed this patch was a failure to boot an
OpenBMC image using the "ast2600-evb" machine. The U-boot
2019.04 loader failed to verify image hashes.

These incorrect image hashes given by the HACE to the U-boot guest are due to 
an oversight in the HACE module. Previously when operating in 
scatter-gather accumulative mode, the HACE would cache the address provided by 
the guest which contained the source data. However, there was no deep copy, 
so when HACE generated the digest upon the reception of the final accumulative chunk 
the digest was incorrect, as the addresses provided had their regions overwritten
by that time.

This fix consists of two main steps:
* Add an accumulative hashing function to the qcrypto library
* Modify the HACE module to use the accumulative hashing functions

All the crypto library backends (nettle, gnutls, etc.) support accumulative hashing,
so it was trivial to create wrappers for those functions.

Changes in V2:
* Fixed error checking bug in libgcrypt crypto backend of
  accumulate_bytesv


Alejandro Zeise (2):
  crypto: add support for accumulative hashing
  hw/misc/aspeed_hace: Fix SG Accumulative hashing

 crypto/hash-gcrypt.c          | 105 ++++++++++++++++++++++++++++++++++
 crypto/hash-glib.c            |  89 ++++++++++++++++++++++++++++
 crypto/hash-gnutls.c          |  82 ++++++++++++++++++++++++++
 crypto/hash-nettle.c          |  93 ++++++++++++++++++++++++++++++
 crypto/hash.c                 |  42 ++++++++++++++
 crypto/hashpriv.h             |  11 ++++
 hw/misc/aspeed_hace.c         |  91 +++++++++++++++--------------
 include/crypto/hash.h         |  65 +++++++++++++++++++++
 include/hw/misc/aspeed_hace.h |   4 ++
 9 files changed, 538 insertions(+), 44 deletions(-)

-- 
2.34.1

