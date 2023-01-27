Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1337793ejc;
        Fri, 27 Jan 2023 09:56:49 -0800 (PST)
X-Google-Smtp-Source: AK7set8qJqX9UZY43MrzR/AOWA8Dx0s/okIxBIwlDAamVb/qb9dVKelUbuNIAGkBw1Td3ex50pm9
X-Received: by 2002:a0c:a94f:0:b0:537:6e04:aa2c with SMTP id z15-20020a0ca94f000000b005376e04aa2cmr19232788qva.33.1674842209427;
        Fri, 27 Jan 2023 09:56:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674842209; cv=none;
        d=google.com; s=arc-20160816;
        b=SE9BPDisVyvR3qIApRv4qJm/rnMXwvpe/0mZKWhyH5+8Ea+Ts+m1YDJeXNplKeZEJU
         TPFdOvVJNeTHFbCR4Z7enpafC7JsbedeiJMzJILHo8rCMx1z2vTR65O/yxJgI7Js+bMG
         hL1QdvuHSQ2XZljMUK07/kThOd2JYW8HaeNukEB8S2TIWycAyxG3STPDIUr50yysJdC3
         cKW7JGx00R0nckpKeqa0IQ2R7H6IyjSRVWpgYrss2aOcpRoWyAhH7SOQEw8E8ZXj0ltB
         dzRA+S/EfP3OijhWsnKqe2VzfSxOYvnOuxpHhf8sZ03EQ/xcRmYDpvuvVb03rTvjLT2M
         z1Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LYRWPnI8qG3IjxQfZRCOSlFjBJopFL2x+0DEosNcKYg=;
        b=k0Tm+CvS27KwIdEeWVDrvXHoZGg5a49EC1eqyYTuusyHhO5GHtAkQKPtWp5Vbq5CD+
         bBbAJdgD5Le/EeR90IENUCnvEaQB1s80Hs8FFqGIfzJv0HO89MF7TQAES3gU6Grn4x1Q
         +LizFpgWXHa8sSkGl9UdfUmoRbblYmbWEzBRZEGOwsubZhKAyWp/yNbJ9wzc49ePIyOg
         riO8Yqv2wuJ6jFuAzVZdI/sfUPKMOwnAauFDRwwmwCcIN02YzAL1rxPHW9aNHQKsjakl
         +qqBKpponX1QU52/LH6kv7cHl+rHzuhoJKg21eOdFw+MHtfvR2bndDDBPkshl/UuOWJ2
         ASEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ONhmuION;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oo23-20020a056214451700b00534edc7b813si3169562qvb.390.2023.01.27.09.56.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 09:56:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ONhmuION;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLSx4-00010G-5J; Fri, 27 Jan 2023 12:55:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSws-0000rA-QJ
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 12:55:39 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwl-00062U-KW
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 12:55:38 -0500
Received: by mail-wr1-x42d.google.com with SMTP id n7so5684650wrx.5
 for <qemu-arm@nongnu.org>; Fri, 27 Jan 2023 09:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LYRWPnI8qG3IjxQfZRCOSlFjBJopFL2x+0DEosNcKYg=;
 b=ONhmuION5/rKjs4TpaA901iczgBznrP2JWq7ue1z8te8nvVWT+tPg0Gvv0TTXaD4S2
 xQBMG17RSnmPIJQTllz3/P9jF2wTnVSAirO4Pfp1Xar2IDZ58JN4K0Qp/e/jnOhfVrib
 RhyCjVRVaAPgXXSUiMw2YcBqSIknGEcBTcQw5PlzqaXzT+f0AxDTrNTTh6Q2iR2HIfmU
 8cYQZK7jYV646it4ZOCPdVHoI740ac20l5s+JwaFnD3wxOd1X8NhYO+MYM1+XmTHUJw3
 4R3J29w7uq9s4ZDUDNcsSErXjI12yjSrdvUfLk2YIu3XYZYTJ+0NVvX/vxWxFuFsc4uo
 Ap4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LYRWPnI8qG3IjxQfZRCOSlFjBJopFL2x+0DEosNcKYg=;
 b=CDMVdSBCJ/675J3wjbMEKDUFu3l+qdFENhjsMVJt516V87PsiltnNXkWwrQMQtUzP8
 YipYzZmqv3vc+vn5wO2XZa4bQxuBw6YbpvDDHP/T/3a4qOsoA77LSIpoM4XlWwYZ+fqo
 JfYn8QQ7clxdH9sk9AHO8xeaRNjjDg9Gmz8mYufU7pmvIvKkAnM3sx8mcBmBza3TubD0
 8vCvK31Eyzaxsv+uCv87OYByYbXiuumHBwu/7ixXMCZeq1XvrfnbSQiQt2Ka8pXNWWGK
 L1pRQBHAnvr7zhZFq+w8bJ+6tgpWOfVKLUqIBDKqX5eTU3p1gEMOXYRZkfSuSwdIFoS7
 veNQ==
X-Gm-Message-State: AO0yUKVPLAz1+Chj46iIbmXL3CoaqmaZywvz0ji7pPKDFBdjukbBI7u2
 /VHTHViInf4KHuwe7VArWhxQLJ/VG+ZI+KHU
X-Received: by 2002:adf:f3d1:0:b0:2bf:ad2a:dd9f with SMTP id
 g17-20020adff3d1000000b002bfad2add9fmr14781499wrp.24.1674842124926; 
 Fri, 27 Jan 2023 09:55:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 14/23] target/arm: Mark up sysregs for HDFGRTR bits 0..11
Date: Fri, 27 Jan 2023 17:54:58 +0000
Message-Id: <20230127175507.2895013-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: s5Dau6rS29wx

Mark up the sysreg definitons for the registers trapped
by HDFGRTR/HDFGWTR bits 0..11. These cover various debug
related registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpregs.h       | 12 ++++++++++++
 target/arm/debug_helper.c | 11 +++++++++++
 2 files changed, 23 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index fef8ad08acc..7c4d07ed9c6 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -622,6 +622,18 @@ typedef enum FGTBit {
     DO_BIT(HFGRTR, ERRIDR_EL1),
     DO_REV_BIT(HFGRTR, NSMPRI_EL1),
     DO_REV_BIT(HFGRTR, NTPIDR2_EL0),
+
+    /* Trap bits in HDFGRTR_EL2 / HDFGWTR_EL2, starting from bit 0. */
+    DO_BIT(HDFGRTR, DBGBCRN_EL1),
+    DO_BIT(HDFGRTR, DBGBVRN_EL1),
+    DO_BIT(HDFGRTR, DBGWCRN_EL1),
+    DO_BIT(HDFGRTR, DBGWVRN_EL1),
+    DO_BIT(HDFGRTR, MDSCR_EL1),
+    DO_BIT(HDFGRTR, DBGCLAIM),
+    DO_BIT(HDFGWTR, OSLAR_EL1),
+    DO_BIT(HDFGRTR, OSLSR_EL1),
+    DO_BIT(HDFGRTR, OSECCR_EL1),
+    DO_BIT(HDFGRTR, OSDLR_EL1),
 } FGTBit;
 
 #undef DO_BIT
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index cced3f168d0..b106746b0e1 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -672,6 +672,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
     { .name = "MDSCR_EL1", .state = ARM_CP_STATE_BOTH,
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 2,
       .access = PL1_RW, .accessfn = access_tda,
+      .fgt = FGT_MDSCR_EL1,
       .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1),
       .resetvalue = 0 },
     /*
@@ -702,6 +703,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
     { .name = "OSECCR_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
       .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 2,
       .access = PL1_RW, .accessfn = access_tda,
+      .fgt = FGT_OSECCR_EL1,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     /*
      * DBGDSCRint[15,12,5:2] map to MDSCR_EL1[15,12,5:2].  Map all bits as
@@ -717,16 +719,19 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 4,
       .access = PL1_W, .type = ARM_CP_NO_RAW,
       .accessfn = access_tdosa,
+      .fgt = FGT_OSLAR_EL1,
       .writefn = oslar_write },
     { .name = "OSLSR_EL1", .state = ARM_CP_STATE_BOTH,
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 4,
       .access = PL1_R, .resetvalue = 10,
       .accessfn = access_tdosa,
+      .fgt = FGT_OSLSR_EL1,
       .fieldoffset = offsetof(CPUARMState, cp15.oslsr_el1) },
     /* Dummy OSDLR_EL1: 32-bit Linux will read this */
     { .name = "OSDLR_EL1", .state = ARM_CP_STATE_BOTH,
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 3, .opc2 = 4,
       .access = PL1_RW, .accessfn = access_tdosa,
+      .fgt = FGT_OSDLR_EL1,
       .writefn = osdlr_write,
       .fieldoffset = offsetof(CPUARMState, cp15.osdlr_el1) },
     /*
@@ -763,10 +768,12 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 7, .crm = 8, .opc2 = 6,
       .type = ARM_CP_ALIAS,
       .access = PL1_RW, .accessfn = access_tda,
+      .fgt = FGT_DBGCLAIM,
       .writefn = dbgclaimset_write, .readfn = dbgclaimset_read },
     { .name = "DBGCLAIMCLR_EL1", .state = ARM_CP_STATE_BOTH,
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 6,
       .access = PL1_RW, .accessfn = access_tda,
+      .fgt = FGT_DBGCLAIM,
       .writefn = dbgclaimclr_write, .raw_writefn = raw_write,
       .fieldoffset = offsetof(CPUARMState, cp15.dbgclaim) },
 };
@@ -1127,12 +1134,14 @@ void define_debug_regs(ARMCPU *cpu)
             { .name = dbgbvr_el1_name, .state = ARM_CP_STATE_BOTH,
               .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 4,
               .access = PL1_RW, .accessfn = access_tda,
+              .fgt = FGT_DBGBVRN_EL1,
               .fieldoffset = offsetof(CPUARMState, cp15.dbgbvr[i]),
               .writefn = dbgbvr_write, .raw_writefn = raw_write
             },
             { .name = dbgbcr_el1_name, .state = ARM_CP_STATE_BOTH,
               .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 5,
               .access = PL1_RW, .accessfn = access_tda,
+              .fgt = FGT_DBGBCRN_EL1,
               .fieldoffset = offsetof(CPUARMState, cp15.dbgbcr[i]),
               .writefn = dbgbcr_write, .raw_writefn = raw_write
             },
@@ -1149,12 +1158,14 @@ void define_debug_regs(ARMCPU *cpu)
             { .name = dbgwvr_el1_name, .state = ARM_CP_STATE_BOTH,
               .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 6,
               .access = PL1_RW, .accessfn = access_tda,
+              .fgt = FGT_DBGWVRN_EL1,
               .fieldoffset = offsetof(CPUARMState, cp15.dbgwvr[i]),
               .writefn = dbgwvr_write, .raw_writefn = raw_write
             },
             { .name = dbgwcr_el1_name, .state = ARM_CP_STATE_BOTH,
               .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 7,
               .access = PL1_RW, .accessfn = access_tda,
+              .fgt = FGT_DBGWCRN_EL1,
               .fieldoffset = offsetof(CPUARMState, cp15.dbgwcr[i]),
               .writefn = dbgwcr_write, .raw_writefn = raw_write
             },
-- 
2.34.1

