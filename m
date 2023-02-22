Received: by 2002:a17:906:3a98:b0:8ec:972f:f46a with SMTP id y24csp57467ejd;
        Wed, 22 Feb 2023 11:36:11 -0800 (PST)
X-Google-Smtp-Source: AK7set+l0sbeOKKoRWUWJcEG0Fb9rVH97IYmD8jvh+hantFGaXCQw11cykMLW2AS0nG11Jv1J5gM
X-Received: by 2002:a17:907:d87:b0:885:5682:7e52 with SMTP id go7-20020a1709070d8700b0088556827e52mr19129017ejc.13.1677094571415;
        Wed, 22 Feb 2023 11:36:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1677094571; cv=pass;
        d=google.com; s=arc-20160816;
        b=h4gI+Qzwpu3QFmooTOa0nCWnJ4d+0pYQHMllah6isVm5/Zog6o7PQ3ie8ekhDloU0B
         /mQG4HkcWKYgKyo/oRzXFsO32vsWTBMYUnWcm0OoWo1O1h0R1QxLU6gSuY5973g+RWXY
         zZ1EhyMBWogFHuosAdJbuVwecFnY/HZfVbe390wKoH0H0fewhiuN0cX+jEDiGs9kQcWJ
         C9cuMFLyGGJdLmiwL4X4RM7uaFUIzYd3CNLwKFPndwSYu6iFHvRe2rtuJTWfoWuOdhVC
         R0fxvbjDMnRLvpsH6o1jHx/YM0+TIRc7ZCt7EnQKjh3e6O92DcvNlpjAKjproU86Ji80
         c3NA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=CeCpI0XjOIZe0BLdKneEY6WDaSh+/ZcQRx3s2UuSkVk=;
        b=dLl1QpOWwu3IOP+W0diL5XIA2k59X8GJIhcureRTfdbmLVwyTDG52qBdsSigybBTiJ
         +KjRnDykxXkgEVgI5qkBKC/gBP8sdYKatkDPubwBCIIo2NU01dVq0eSYQTD0wDlo7qh7
         mBfGdRyFhrEcjiAQyty4YgwqQqhkPlQzMNaA6O2oabd02MRb2Z92EL72lzKlvEo9dGf/
         UgtGK7jL8+xX9ugWeV9Z+8Tje8O/7nBjIkZXoJvLdRyhxGxoGHTG/r6fS8S7aiDmZ4A3
         ZmrfaqIV2VTx5ji4Cok/XfsM3Vw550TVoc807diZs+yRv0SBVOJS7iR1PNajFua48xHI
         kl5w==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=AbJSMbbr;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8c::70c as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
Return-Path: <aaron@os.amperecomputing.com>
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2070c.outbound.protection.outlook.com. [2a01:111:f400:7e8c::70c])
        by mx.google.com with ESMTPS id wi6-20020a170906fd4600b008df5a5088e4si6029467ejb.631.2023.02.22.11.36.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Feb 2023 11:36:11 -0800 (PST)
Received-SPF: pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8c::70c as permitted sender) client-ip=2a01:111:f400:7e8c::70c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=AbJSMbbr;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8c::70c as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGi77oxxGBHR8Ular6ScgBLy829bx2PDwJ2Cmj6c85gM8k9AZcem6HI5RyjyX6zKEiSphoXJa8i1wYNTEzgXjcp2+7bzNaBK5O4vin+mWXMNa7kRh20A/v14urJ8RqQVOjrh6nqTyCxar13H0+nBkyMufWjeqiElcMje7/WwbB9fBhMAYMsL10eTu2d1x7D4oLZGjd/pi2AqllygG5cTuG9atnlV+ZKUBVzmthyF7DKsWcs01f+NFEVGeZOCtqZKLWTorCe0SnLnBMSEEPO2faXgmR8My5ppKr2q8EM3pEo0x/TZZUfLSFDXMn0jHgIcRYwhBysXPtEKMTmFuM6P1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeCpI0XjOIZe0BLdKneEY6WDaSh+/ZcQRx3s2UuSkVk=;
 b=JLkhMxsdDJeRJhPenT/6FqPM1PHXA5QPcLrx1qrF322HNc5yGQBx3Kl2zEcYcAB7Y6QX2gZPsj4Y229o4uTH/sQhHSfDE4+Qyuh9sFoAlBnQNFqm26x8aG4Q7AStpTgW8Cc7jddQVfETOvxaRnl6W7oj5Emz+/puAWWFhY1nw/VRR9C1u9v+pRa77lJ8LRjYmgYNNhNR8C0+f00FykeF2GhoS3sRnosTD95VGbg3zlQGA9FwCZaiEeAipCZIcOPWmu9ZSEyCS4nXXAPkgQwjREFJmklaQn3QgjDNUZWx1e9OG+Iki2NtFYn8g6AxNMuonc6Xz6xKqqPr9jD7hPYTmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CeCpI0XjOIZe0BLdKneEY6WDaSh+/ZcQRx3s2UuSkVk=;
 b=AbJSMbbrKnZ23DSw2T0lvtd9JzfXLXsgjZtLsk3n0GW4eTitFWO8kbutR4PffXbMCotcWXFi7sero7/NqZZEAQpqO6/oQNcvE8XmlBEpKKOb+O8nUrMWGoZwOPdCz3GfFVmPVJ8aEx4dzp6UtnJXSuwZgqFWb9nU6DqmaU0OPWY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 SJ0PR01MB6448.prod.exchangelabs.com (2603:10b6:a03:29a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.20; Wed, 22 Feb 2023 19:36:05 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8%9]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 19:36:05 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Vincent Dehors <vincent.dehors@smile.fr>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH v2 0/7] Implement Most ARMv8.3 Pointer Authentication Features
Date: Wed, 22 Feb 2023 14:35:37 -0500
Message-Id: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
X-Mailer: git-send-email 2.39.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR08CA0016.namprd08.prod.outlook.com
 (2603:10b6:610:5a::26) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
Return-Path: aaron@os.amperecomputing.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|SJ0PR01MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: d947f86c-6e86-4e56-7cef-08db150c09f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fu8BmbZaKAoc0HEO+YFsmc/udMq2lwB1ZWohojUwote/iO1JGYbIDFnKhSKlNNBbpRr8deQl8d5+rR/Lmr4PzT96DWDnIbppUd75T8UPoExuk3jEpQ7HjzyXpox6fR1xOgrznHhzGcJHME4exg4e4zgfcwAT3F1Eavq4/WnMIsNSEiRDLm5BVAo87Mk97NV6Umpp5WbU82HcCkuigSzAJM/WL2tpBY7O1cMgvYHe8QWO/x8koMZtfgD9hCCJGJTyxIDk2vruq7muyhZ9dhZhWKdk9eQE2NCX9arfLHz161MYPj/Ux/DFhuL8oQbZMIXmUwMMzdSbhd69ENqLOKMMHuPGsXLxZSDktEXDz71llGnBrzkxMEyzVo9oUs/JgKDjmBeKFZHf3gWW4HUnMQk+PwimCM6o7mnMmmLbWlAu6z56gg0KZzryoJsBuJaQM7HEZfUC4oYVWY1ldY+BgAqZXZ9PKE71mNFkBjRpOnsh0jFW1Cynh0qXP8XkGsHPkyJhaBefArDafoTQvOBsE4LbTj2F9EEi6+fSAQELGrFJGytxjCiLU7PoPOVAnL/DFRBfuwoTemzlq/V1x2rA37XQafpHMlUEURmU4Qn9CD5sfTea1peMMN6KrGZ9z6eQ7Zl+aoemdNI/5VwOjXGmrizH6pj+7dG9K0J834ZQN+Ndri3XjRa8ZZjrAceGO2zEUTE0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB7124.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(39850400004)(396003)(366004)(346002)(451199018)(8676002)(66556008)(66946007)(66476007)(5660300002)(316002)(4326008)(41300700001)(86362001)(107886003)(66899018)(2616005)(83380400001)(26005)(38350700002)(6506007)(6486002)(186003)(6512007)(1076003)(6666004)(966005)(52116002)(110136005)(2906002)(38100700002)(478600001)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D1Sg+pTUofl0zZlqBovgixR4UcH/q7+7HjdZpAcvWv9JE/fU5QE6wHpSvmPM?=
 =?us-ascii?Q?7wdBT+9/Q08Z3Q+Q4n+0g741iiZ2P62YlFP7OncP1Fr2Ax0ujouABcgZMXMG?=
 =?us-ascii?Q?7MGTmn0mMuXNNj6LGGPM4CufGcaooekQnH8s28GKrNRyqJ3sa8pwJPY1XaxK?=
 =?us-ascii?Q?cHkDu7EIQkgs+QIrr3KUEw9HoE8J0aE8pyqhTOKQ6PSD+2HLZ2aI6/Vv0qad?=
 =?us-ascii?Q?q2wvyg4hWyo5O2fwkJRzZrb9B6mtuAEyx5w2fN3Xnp2SJQT+ZmI2XXfXxDCE?=
 =?us-ascii?Q?bmtqXJkGYHMZxtzEuqLIzR1Fhmplim+Nw/HUMVdM6+nYzjYICtIczxgBIwph?=
 =?us-ascii?Q?EpVvEO7K6JCu+H5duDmCwXg3OVrFRsEBuEBhXRLB3JaYhmkMSyfeBR6blRph?=
 =?us-ascii?Q?qJXtQScbZwoVecvsAD1z8jAX4B8jEhm2jR+BT7ZzZuuujMq09zE7TBO6+Wcp?=
 =?us-ascii?Q?mdLFYUlHglVMyYYNZ+uO18vXq30TR3xxZfV57mek3CpXccciCH+xX4r7UiWt?=
 =?us-ascii?Q?2APsyZv22OBtJseUVcZT9ur8nycp5z8THTV/eCx7Ijzfxc1sf4x91uEE/T8H?=
 =?us-ascii?Q?ceZxbr15ctqSWukc44oA83EW5uYwOTx0f2/sINan8rJm0By0U55MOK1mkQth?=
 =?us-ascii?Q?BR2+jROUSdNu7UUrpxxCiQTi1rLHHEpmw4lparsjoFervt8csLF/dXW6k7U5?=
 =?us-ascii?Q?Wwyl8RSE75go6VpKqkUCiGrab5+mYhNxt/3JM2TLn9r8mDoOFNpVeMVi1KyT?=
 =?us-ascii?Q?Hg8bsdMEM8kDOplob/fxi7Hs9oxNFrsPW+U9eMLgcu6nb/u2kXEaJryZDe3O?=
 =?us-ascii?Q?uEZYwFxI8XtNLzGpAHidPNczZPjcVLZDyO+obICLefK/uOCrXHjYe8WSgso/?=
 =?us-ascii?Q?ISKAIOOWO0p303HWK0MMvUD7T6pYwNfMEmXY+ourK/X7sw+cwAh7mQ5tA6sw?=
 =?us-ascii?Q?+Y9alkS0vmblfTy0OZgQDcOMcHIeIlnSg3jkOwDag/7vpgHmqBUFw0xB4d+V?=
 =?us-ascii?Q?OJXT+deD5jSR2TpWM5yUpwYZi768LspmA2yJzRWN9Vogv5j1c7x2bpgz1gh9?=
 =?us-ascii?Q?+7STL4o76tZpqqKUbO++YC/XN5OyJxopdq1oqQjl6205zVAWY77VhnSAzoP+?=
 =?us-ascii?Q?vh16kknvK0fp6jol23kz2iobLH4w3NpEVTuDC6+cN614VlmubviNhqWMUAcc?=
 =?us-ascii?Q?UlOvIMfH8X/xSrHYdsCXuZAyhQOMoX0MNS/w5CNfHbN+iagvXdWUbcOt/6k+?=
 =?us-ascii?Q?06cHDaMRSpUXNpkgK10bRGgfSYUotGIqxOhhqF1/PP7hG/2i4X3gJkRGtf/X?=
 =?us-ascii?Q?3+L7P31h8+WA1MKkHgIhKN0r3RSrWvDb4Z1/YLmlJP7BQ/FbaDe4JL59QXVl?=
 =?us-ascii?Q?s67MPobiOrXYMdy0IUuN1pzIz0bJUGsfBQKTShUeAabdTt7IRJ0FZq+BnsCz?=
 =?us-ascii?Q?pOyIJUkAIRIgJpfeVvw8arfu5fRB7meoAAUROJu60G8pXbagppBEut1JR22b?=
 =?us-ascii?Q?DHrL3mLzAJKMRfTjMJZPNB9MT+jL9TDnqho9ydR3t5P1ogjPLaBKpH34ybsK?=
 =?us-ascii?Q?Ahm2PV0YF6UMneqL5TmVPUQHwxeDPiRTj9mxICy/Ub2bM32scqM2KXZeUB8B?=
 =?us-ascii?Q?4nWUUPF8v576+00TFw2urW8=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d947f86c-6e86-4e56-7cef-08db150c09f8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 19:36:05.5533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3gxrpgj0euNu32N8555z0H1GoA+IEPNcLhXQql//xPpNAYgL2FX6V7FALd7QwdeZvHnYHQZ+4lx06sOD5KzfOVpyIsLmc3p3+TyGAUCCz1jQ+QU1kKqiAwFRrOybvL1j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6448
X-TUID: qLvESe8EBpuQ

Changes from v1 of this patchset [0]:

* Changed ISAR feature detection to use '>=' rather than '=='
* Switched around the logic handling EPAC/Pauth2 to play nicely with the
  '>=' ISAR feature detection for EPAC
* Re-organized a stray fragment of a patch to be bisect-friendly
* Moved call-sites for GETPC() to top-level helpers
* Calculate FPAC error code inside syn_pacfail() instead of the
  callsite. 

I have NOT yet made any changes to the properties/documentation (see
"target/arm: Add CPU properties for most v8.3 PAC features") since my
previous patchset - I'm planning to await further discussion about the
appropriate way to organize them before making those changes and
particularly welcome further review there.

-Aaron

[0] https://lists.nongnu.org/archive/html/qemu-devel/2023-02/msg00660.html

Aaron Lindsay (7):
  target/arm: v8.3 PAC ID_AA64ISAR[12] feature-detection
  target/arm: Implement v8.3 QARMA3 PAC cipher
  target/arm: Implement v8.3 EnhancedPAC
  target/arm: Implement v8.3 Pauth2
  targer/arm: Inform helpers whether a PAC instruction is 'combined'
  target/arm: Implement v8.3 FPAC and FPACCOMBINE
  target/arm: Add CPU properties for most v8.3 PAC features

 target/arm/cpu.h           |  66 ++++++++++++-
 target/arm/cpu64.c         |  81 +++++++++++++---
 target/arm/helper-a64.h    |   4 +
 target/arm/helper.c        |   4 +-
 target/arm/pauth_helper.c  | 192 +++++++++++++++++++++++++++++--------
 target/arm/syndrome.h      |   7 ++
 target/arm/translate-a64.c |  20 ++--
 7 files changed, 307 insertions(+), 67 deletions(-)

-- 
2.25.1
