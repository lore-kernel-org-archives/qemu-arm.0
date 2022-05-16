Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1791128lfj;
        Sun, 15 May 2022 23:24:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxupqhD30QnBXGjB2jpGbqi3cJ1Snktg6EDjFMX1GdJZrdzw92TYgyswMEentRON8Manc6O
X-Received: by 2002:a05:620a:414f:b0:6a0:435:cb2d with SMTP id k15-20020a05620a414f00b006a00435cb2dmr11377293qko.625.1652682249431;
        Sun, 15 May 2022 23:24:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652682249; cv=none;
        d=google.com; s=arc-20160816;
        b=RgQ+ksySOTqOpjiExjTNboWP9FVVkk7F9NLfSIOmdS+SroQ5WfnsoXGP3mWDwr46gI
         ObZYqnf5l1aDmwz/B0CAglu0eqswlYmcMEVVRskbxHclMBzmfG4PuFONtFnCwkKH/ZIZ
         2/PkNw9whfHxT1fyJKtThsc7dKrCdT2Kq+zsVeccaxvJsObkIRk2zBzlCsj8nJYaO8mE
         hcNXcwpooz7Ca5PisxhELbxXa7uXTHFVqvDfx7uA136ask+LyECmkLroQPHSL6ZOChCg
         kqv6KKLRngdF9N3XK3l6TghKovkhdPEjNnoNAg/VB9MpATJlKPsRPKD2sWFjDzSqYra9
         Bfpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=2K6Opd5SvdIGvt1jTx4IabYk3CMsDcHjZDyO/pkQls0=;
        b=wEu6DU+dHYfbQg6DUTC5ejK2eAE0iDYTc4WTG5swQPdF/P5LJ5ClkmopH+GKs3TIV4
         p8xaFB6wiPTpoiGMZzAatqa1QruGVyUTlccy0arT3+wlBQYVyS5/M7sFxRBjFS3qpW37
         gUO9sNgg9ECH13VP1uhUJqTMocFjkHkhT5PC4k9aq0v4mjcr+Tl6SHJXOnpC9oGGCi4m
         3As4iysMfLtfQYTOjUM0kRsrvkpuPTfJ3k9BAmObnRJrYV41IoLkIPKJQbjGoEwo0kXG
         zMYlseazsvjDMuC7i9+B9G2d8SGD2ni1EdQkPYkzblf2UQpgh4dPoJtx3GtolIyAKv1S
         niZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b="NhVHYjd/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t9-20020a05621421a900b0044110d4e889si6663337qvc.26.2022.05.15.23.24.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 May 2022 23:24:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b="NhVHYjd/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:56078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nqU9I-00079W-TS
	for alex.bennee@linaro.org; Mon, 16 May 2022 02:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6135bb9a91=pdel@fb.com>)
 id 1nqU8v-00075e-Sf
 for qemu-arm@nongnu.org; Mon, 16 May 2022 02:23:45 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:14202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6135bb9a91=pdel@fb.com>)
 id 1nqU8s-0007OZ-SU
 for qemu-arm@nongnu.org; Mon, 16 May 2022 02:23:45 -0400
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24FLx5KV009778
 for <qemu-arm@nongnu.org>; Sun, 15 May 2022 23:23:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=2K6Opd5SvdIGvt1jTx4IabYk3CMsDcHjZDyO/pkQls0=;
 b=NhVHYjd/LEAO+hkwmI7yHsA4vuJ3mZ1j+ABjrPcpa0eePI618kx+z1q4Xe6sSSKVWfa0
 FIFII+mLQcoALHmTsd8ufFPsZfLqpAob5VoWja/9nrIghABrqJJa1I73no2SbeOVQOyr
 VPTcUnH/EALrjX4YquHiFQAytZTXuulLVcI= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3g2a4nqanv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sun, 15 May 2022 23:23:39 -0700
Received: from twshared13579.04.prn5.facebook.com (2620:10d:c085:108::8) by
 mail.thefacebook.com (2620:10d:c085:11d::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sun, 15 May 2022 23:23:38 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 026E864DCAC2; Sun, 15 May 2022 23:23:29 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <irischenlj@fb.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <clg@kaod.org>, <zev@bewilderbeest.net>,
 <openbmc@lists.ozlabs.org>, <andrew@aj.id.au>,
 <peter.maydell@linaro.org>, <joel@jms.id.au>
Subject: [PATCH v2 0/5] hw: aspeed: Init all UART's with serial devices
Date: Sun, 15 May 2022 23:23:23 -0700
Message-ID: <20220516062328.298336-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: 1RYwph2guCDCDdRqwacJ86t6GJ8CLnu3
X-Proofpoint-ORIG-GUID: 1RYwph2guCDCDdRqwacJ86t6GJ8CLnu3
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-15_11,2022-05-13_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=6135bb9a91=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2QchEopnVZzD

v2:
- Rebased on Cedric's irq proposal. [1]
- Added "Introduce common UART init function" patch
- Added "Add uarts_num SoC attribute" patch
- Rewrote last commit's message for clarity

I tried testing this by running acceptance tests, particularly the
boot_linux_console.py file, but I had to disable the raspi2_initrd case.
It's not related to my changes (A/B tested and it fails on upstream/master
too), but thought I would mention that.

I also manually tested several machines:

AST2400: https://github.com/facebook/openbmc/releases/download/v2021.49.0/w=
edge100.mtd
AST2500: https://github.com/facebook/openbmc/releases/download/v2021.49.0/f=
by3.mtd
AST2600: https://github.com/facebook/openbmc/releases/download/v2021.49.0/f=
uji.mtd
AST1030: https://github.com/peterdelevoryas/OpenBIC/releases/download/oby35=
-cl-2022.13.01/Y35BCL.elf

[1] https://lore.kernel.org/qemu-devel/20220516055620.2380197-1-clg@kaod.or=
g/

Peter Delevoryas (5):
  hw: aspeed: Add missing UART's
  hw: aspeed: Add uarts_num SoC attribute
  hw: aspeed: Ensure AST1030 respects uart-default
  hw: aspeed: Introduce common UART init function
  hw: aspeed: Init all UART's with serial devices

 hw/arm/aspeed_ast10x0.c     | 32 +++++++++++++++++++++++++++-----
 hw/arm/aspeed_ast2600.c     | 27 ++++++++++++++++++++++-----
 hw/arm/aspeed_soc.c         | 33 +++++++++++++++++++++++++++++----
 include/hw/arm/aspeed_soc.h | 10 ++++++++++
 4 files changed, 88 insertions(+), 14 deletions(-)

--=20
2.30.2

