Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1150300ejb;
        Mon, 30 Jan 2023 10:27:36 -0800 (PST)
X-Google-Smtp-Source: AK7set+pgjiwJL3RZJKERyHHVtTnhCtRlBPsNzz/FvSyyrRl9yXCGZ8pgkqO+nXG71zprB3TwzHR
X-Received: by 2002:a05:622a:1054:b0:3b9:a589:e7f4 with SMTP id f20-20020a05622a105400b003b9a589e7f4mr774116qte.64.1675103256688;
        Mon, 30 Jan 2023 10:27:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675103256; cv=none;
        d=google.com; s=arc-20160816;
        b=cOWd8ea01rCGETjuS0iRkN5/zaHrj1/uYO+dP81XuZr7/cR7CLZcPk6jVoYHajklOZ
         pROskIxRO32v4nui+hV4sFoHtcPNE6veQ8zGdeC4Xvd3x++lFjs4kfm0wm4+H4xXfCq7
         9CJXLz+RTaWFhSbrVDJh9G2+AuypgD+5cG0+fsk7p25kjckZe7RH+Iws1cz2sd6MB6Ed
         CIirpf8IHLucnxL5uh+xGTosU3/pSsha3zkET3PMIzP4adgylnjvMilWsq+Ju8x+UI1q
         b5gAI2dLZNd2E6Z4nmJ+SiNII02q570iPtsBlos2gc0xwpDsKC/gxsLlbzZzm2UCePLC
         3SxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IWPQN4vkNjJzt63xX8IOcIRiw+Y6TTVa6ogjDXQC6Lw=;
        b=YH93EEPsvvbRj5m02Rf/KFz0ZWCh3MGzOszKpxUqZATnus9Lxu2AaocSkJRYEOi4rT
         Dnlw23uydBngjM517yZKod41s0tYlHEf+GlKn1X3/gOGMBwhAIaj5kwVtGbI8pZk7neb
         rCw3tmG3pfSnWHRyQcRCbLtHmuCXcO2uwxPOKPom7TsSFw8pZP3GkbSQUTwKmMUTlSrv
         SNVJg6n6jmopG359vpzZJ5ybfRLEzfBTNqhfwUAfarmveg5kc+ryiC9dL2yEin0fRIhG
         Gm+jt4WlzHF5nc2EDpXrfAv4KWp9711tQtI/CUbo/iGLT/zK7YckF50GN2eV0KiU1umT
         6I5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=es3iru9L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s17-20020ac85cd1000000b003b86c12f6easi1351990qta.675.2023.01.30.10.27.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 10:27:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=es3iru9L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMYqM-00019p-SH; Mon, 30 Jan 2023 13:25:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqI-00014y-Gx
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 13:25:22 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqC-0008UY-GR
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 13:25:22 -0500
Received: by mail-wr1-x434.google.com with SMTP id m14so11522260wrg.13
 for <qemu-arm@nongnu.org>; Mon, 30 Jan 2023 10:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IWPQN4vkNjJzt63xX8IOcIRiw+Y6TTVa6ogjDXQC6Lw=;
 b=es3iru9LgM464huXRMtdf5rQzPnVCDTY53vxWp1T86SIkAANwKh/+LbB3ndX3Otnp+
 xDskOj/em8bJ82Rahoh4P8HRccojEDh3V/EyIxbR5Mxa4N0d7E9XcV9MojruYNpVrFRH
 Vkj9iHWd1Z0mxrzlQmKWpvZmIQferPjAz639vYncrmLgqE9naE2a7SrPy56mQUkcy+ut
 gv7isT4xnwWmfhd+3pwyS6mNzVxKi7OO9BA2TjqnW3/cXyRoQ+ER51VjCobz6MZYAd1q
 7ql6m5SpdTRh4H52HwmFZf7rgjrrn0dBZCk6zQ2EI4l593xtMAWnUZgetagmqKDBNIfy
 q8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IWPQN4vkNjJzt63xX8IOcIRiw+Y6TTVa6ogjDXQC6Lw=;
 b=gYsAB1pY9BSSWpGMKnMU2+35rCKdKGygILp55tzc4OkZXCgTy2y/e3FZLpmDlofJCR
 N4w2j+XtuH67QJh311RgWY3eRuJu/UpwvrPshDD/BHtI1UhNnUDWdmPwqbpgq+SsbwfW
 lAk7iS7I2QhPIqoroJfjmjqu24tdxkdnRd3Mas/zXph4VnnujvQWeHc1hMnfRojtMsci
 +gMZbX/gb0SzEVeN6jmwo9eqw8VEr3luekEU+B+CeD5poSoJN4aNzZbuwA980shWhBjZ
 GPL0HoM0/pAD3Pt5JDAzpY2DPoeCkK7waF5ns1qHNJVSa0AWNiLi5BNHz9NBp+46G+6k
 fB9A==
X-Gm-Message-State: AO0yUKUB7sEjnqnlU10TQ/yUHfKNVz0cgmjWW1la2YkfuAI8R7QZSy0j
 PxsBVfUOKMq5HAixQVV8M1RjwVzt7l/0p9O2
X-Received: by 2002:adf:f409:0:b0:2bf:d411:a4f6 with SMTP id
 g9-20020adff409000000b002bfd411a4f6mr10676407wro.1.1675103115217; 
 Mon, 30 Jan 2023 10:25:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm12245202wrr.62.2023.01.30.10.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:25:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 14/23] target/arm: Mark up sysregs for HDFGRTR bits 0..11
Date: Mon, 30 Jan 2023 18:24:50 +0000
Message-Id: <20230130182459.3309057-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130182459.3309057-1-peter.maydell@linaro.org>
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: LVR7HeXgFsr5

Mark up the sysreg definitons for the registers trapped
by HDFGRTR/HDFGWTR bits 0..11. These cover various debug
related registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230127175507.2895013-15-peter.maydell@linaro.org
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

