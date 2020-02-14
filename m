Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2204033lfp;
        Fri, 14 Feb 2020 09:57:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqyHp1rOfG7nmO+LZuRLVh6BTvbTec6w3qO/imU+O9GW6AfYbwCqJJQCOjkcd5cVaD7dwZmp
X-Received: by 2002:ae9:e518:: with SMTP id w24mr3441914qkf.236.1581703044010;
        Fri, 14 Feb 2020 09:57:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581703044; cv=none;
        d=google.com; s=arc-20160816;
        b=Fv733kemafufobxIujhmKTRP44vECq1uZxSY4dLa1jFc233xc6VyYC5p6EkHkQzAT+
         rrYQ58fs1IM/90+LZuFOrOe1oeYrPedkScrrr2uv0eE44D0cBJ62lTQ57bSYkO/vlODL
         0YntgX8yIPyhLFp+iXw/KD3w20YBPjHigCN4HA654CVXlk/JcvYpVuH+fHgxyGKRt2OH
         Q16jEUnCOh98k55Hifq61vWXfi5Rx/y+/GZSEfhKn4ogPVaQxZMc/CY0XVEJcGUXurw3
         Zlqr93M0eZeJBDGzaLxT+gHnVfnfmQIOuCPqWnh/6td4zoptyozFx15LWqL6sGXLQL5M
         gGeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6KTNckWA4+ATf5z/mBrn8Lcv/aBBE2/oWgefPULbIw0=;
        b=MUvsTrcBFPiPxPv9Z/4nHgokltpICLwsSeJeTIIhumf3Qrz2FYZ+HuBOWPqNw2QLM2
         fFObSkQpxA8piTFoNcJk+Bl6ibhmKk82Jg0y5hwXBU3eYhTeCfpMZo5WKmodUyYuja+Z
         ZXSleOhosIOR2P9+wqehFhh3P+jw70X52XjZwvRbYaBEBY6h+dOA3mxOnWq5nVSFMp6n
         z4qfqBz1cLiRp172KuxS0oBJ8qacn7EclBTT/JPn4i1Xspixa/hRIoIQ+TxYzk87B2q5
         lvAJdVS5BqlN2PVQNqxrNGBYADCabbNBeeQtiJfgOPKJ1L4b/ofxqNNCxWaN4P8I5x3t
         nw3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xmkcU+or;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z16si2995309qtu.200.2020.02.14.09.57.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 09:57:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xmkcU+or;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42983 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2fDP-0001Th-EB
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 12:57:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56372)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f81-0006Ia-Mm
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f80-0001CF-Dd
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:49 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:33321)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2f80-0001Ab-7G
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:48 -0500
Received: by mail-wm1-x344.google.com with SMTP id m10so2573777wmc.0
 for <qemu-arm@nongnu.org>; Fri, 14 Feb 2020 09:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6KTNckWA4+ATf5z/mBrn8Lcv/aBBE2/oWgefPULbIw0=;
 b=xmkcU+orzKzljDZz60HJPquXMNvZrrirlkMCapLPwLD/z31OvkB3OCG5UlPyK45BgD
 opLSNY4PUkx9ypxds4CflLaTfp5opUklKscOEpLR7wX8jL+xyiK28r+xXhx2ktAaOkzB
 SOWGnBfgiQZq6u5leJMd7X6jYpe3f84IgnhUB52OUggp9TsiarFifmCrldCXQupvBHQn
 LsjEw4Z9TfKBCz/ynsaRDAT58X9Ap3EsG4HxfVe0B8kUK0Ymm64WhUb8qOHK2cajliN7
 JRgLzcmCMKXHbZv90Qw1IyvxMIAsP0MvhGvrc7SBS5PvY7Uk5+lJhocPQ8CEFfuSFe6X
 oIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6KTNckWA4+ATf5z/mBrn8Lcv/aBBE2/oWgefPULbIw0=;
 b=NCDVldc2Yxrzn0OGqAHme9cWf0/lPijLER+gdZfqNm09gOrir9tGS1jfXoR2JaFAe7
 C+suvjIQQFqzyapbpk3NHjPEHny4wR8di8QQkk0b1GgNWrwyTZztMANlMr5Kmu5c9ALZ
 Fg7miC2RZvvQgtQJgx1HN5MIa/jdUHuADaHadRQZt3Su41A1IPWCGb1mZu48lZgOua0T
 mNxFQPhiVXns0ZQdXItsgy5ZQMQCUfQbkKk754Imcwm47oZmVkqdwaStv2/eyZ76gJNG
 hntbdKtgVAKSwz7GssjD6bRsX7dF54j3bkpSPATF0CvV94SL3lYeU2y4eYaar9RKRLE4
 X1rQ==
X-Gm-Message-State: APjAAAUgRXQyD0WzzsvnD57td43nJ/YMAlVzha8DERGabb/6s/AULjkB
 yMGFYER6vmyFBwjuGE037LKdbmXUfmo=
X-Received: by 2002:a1c:6645:: with SMTP id a66mr6125346wmc.121.1581702706955; 
 Fri, 14 Feb 2020 09:51:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v8sm8001857wrw.2.2020.02.14.09.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 09:51:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 21/21] target/arm: Correctly implement ACTLR2, HACTLR2
Date: Fri, 14 Feb 2020 17:51:16 +0000
Message-Id: <20200214175116.9164-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214175116.9164-1-peter.maydell@linaro.org>
References: <20200214175116.9164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I9ahD3G1/+Kz

The ACTLR2 and HACTLR2 AArch32 system registers didn't exist in ARMv7
or the original ARMv8.  They were later added as optional registers,
whose presence is signaled by the ID_MMFR4.AC2 field.  From ARMv8.2
they are mandatory (ie ID_MMFR4.AC2 must be non-zero).

We implemented HACTLR2 in commit 0e0456ab8895a5e85, but we
incorrectly made it exist for all v8 CPUs, and we didn't implement
ACTLR2 at all.

Sort this out by implementing both registers only when they are
supposed to exist, and setting the ID_MMFR4 bit for -cpu max.

Note that this removes HACTLR2 from our Cortex-A53, -A47 and -A72
CPU models; this is correct, because those CPUs do not implement
this register.

Fixes: 0e0456ab8895a5e85
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    |  5 +++++
 target/arm/cpu.c    |  1 +
 target/arm/cpu64.c  |  4 ++++
 target/arm/helper.c | 32 +++++++++++++++++++++++---------
 4 files changed, 33 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c6af3290caf..b4c83a1cb52 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3531,6 +3531,11 @@ static inline bool isar_feature_aa32_hpd(const ARMISARegisters *id)
     return FIELD_EX32(id->id_mmfr4, ID_MMFR4, HPDS) != 0;
 }
 
+static inline bool isar_feature_aa32_ac2(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_mmfr4, ID_MMFR4, AC2) != 0;
+}
+
 /*
  * 64-bit feature tests via id registers.
  */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index c46bb5a5c09..9f618e120aa 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2718,6 +2718,7 @@ static void arm_max_initfn(Object *obj)
 
             t = cpu->isar.id_mmfr4;
             t = FIELD_DP32(t, ID_MMFR4, HPDS, 1); /* AA32HPD */
+            t = FIELD_DP32(t, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
             cpu->isar.id_mmfr4 = t;
         }
 #endif
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 8430d432943..32cf8ee98b0 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -703,6 +703,10 @@ static void aarch64_max_initfn(Object *obj)
         u = FIELD_DP32(u, ID_MMFR3, PAN, 2); /* ATS1E1 */
         cpu->isar.id_mmfr3 = u;
 
+        u = cpu->isar.id_mmfr4;
+        u = FIELD_DP32(u, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 implemented */
+        cpu->isar.id_mmfr4 = u;
+
         u = cpu->isar.id_aa64dfr0;
         u = FIELD_DP64(u, ID_AA64DFR0, PMUVER, 5); /* v8.4-PMU */
         cpu->isar.id_aa64dfr0 = u;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 56b1c08f027..513f4edbb46 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6862,6 +6862,27 @@ static const ARMCPRegInfo ats1cp_reginfo[] = {
 };
 #endif
 
+/*
+ * ACTLR2 and HACTLR2 map to ACTLR_EL1[63:32] and
+ * ACTLR_EL2[63:32]. They exist only if the ID_MMFR4.AC2 field
+ * is non-zero, which is never for ARMv7, optionally in ARMv8
+ * and mandatorily for ARMv8.2 and up.
+ * ACTLR2 is banked for S and NS if EL3 is AArch32. Since QEMU's
+ * implementation is RAZ/WI we can ignore this detail, as we
+ * do for ACTLR.
+ */
+static const ARMCPRegInfo actlr2_hactlr2_reginfo[] = {
+    { .name = "ACTLR2", .state = ARM_CP_STATE_AA32,
+      .cp = 15, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 3,
+      .access = PL1_RW, .type = ARM_CP_CONST,
+      .resetvalue = 0 },
+    { .name = "HACTLR2", .state = ARM_CP_STATE_AA32,
+      .cp = 15, .opc1 = 4, .crn = 1, .crm = 0, .opc2 = 3,
+      .access = PL2_RW, .type = ARM_CP_CONST,
+      .resetvalue = 0 },
+    REGINFO_SENTINEL
+};
+
 void register_cp_regs_for_features(ARMCPU *cpu)
 {
     /* Register all the coprocessor registers based on feature bits */
@@ -7623,15 +7644,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             REGINFO_SENTINEL
         };
         define_arm_cp_regs(cpu, auxcr_reginfo);
-        if (arm_feature(env, ARM_FEATURE_V8)) {
-            /* HACTLR2 maps to ACTLR_EL2[63:32] and is not in ARMv7 */
-            ARMCPRegInfo hactlr2_reginfo = {
-                .name = "HACTLR2", .state = ARM_CP_STATE_AA32,
-                .cp = 15, .opc1 = 4, .crn = 1, .crm = 0, .opc2 = 3,
-                .access = PL2_RW, .type = ARM_CP_CONST,
-                .resetvalue = 0
-            };
-            define_one_arm_cp_reg(cpu, &hactlr2_reginfo);
+        if (cpu_isar_feature(aa32_ac2, cpu)) {
+            define_arm_cp_regs(cpu, actlr2_hactlr2_reginfo);
         }
     }
 
-- 
2.20.1

