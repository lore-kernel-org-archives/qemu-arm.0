Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp37078lfc;
        Tue, 2 Jun 2020 18:24:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYdDpOG2S7k34wDJM8e7JcB7v59BEyWSPkWWaPGVBvEYXz7kAvNQ0rfB6OAVv2zWVONCSi
X-Received: by 2002:a25:ba8f:: with SMTP id s15mr46986552ybg.34.1591147486095;
        Tue, 02 Jun 2020 18:24:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591147486; cv=none;
        d=google.com; s=arc-20160816;
        b=A9WXKhs6+DyRcY3IZYk48/AVa2FHxNMJc/igrR2Few4WgDGKFW63NPALpRJfm38+r1
         jivhvFQHdNF6Kfos1FgSg9L8mhOe2OHp6amS27RadcdWnK2ZtlYJYS/0RYTuSEycgodz
         R99OAqxAWPDf8hXAcjAjxnVOnDevs/xdsJ6/g5Bb5TudvfV82l85Fa6H9r6TI8P3ZSE0
         6Lz09ocnbLPuEbf3K1Vu0f3/EcNwEdqmgBHtki+SSh0udBD5OsNt19nDj79zQUCiAKNC
         WIm9sa2XY2FQ6MVM0NSzigOFmype6bIwif+w9XihBWO/+RhvfTj1tEC4FvgX1H0vUMk4
         AyDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cf68FCAzJTbpJLd19R46t9jMSqR5E/27UO36TFsKmfE=;
        b=cnqzNP8HE2BhCTnmqkEZ9jX51fr/4OuCsKtPcJ2mUy4KPawcWF3A1bxMs5+Z/my+jr
         ZE72y5J+XzKEOkCe4hrfW0kTPW8CuRuLanM5QpforMtu/XebZH9UfWIgrBBlC4Sn2phL
         pnYy3svNBfb88S1uQCsfdtdQKuDfD6BECIV2qsFgmhRdY9bSnnr4a2ljU8E2CSkI1TOd
         u1zO8064dYDenF3jVCukKg1zS2hGz7nq+kuaOEkM0gaKd98UIh+dhyi/RFZzfxaSbW2b
         WU3WS+lhNnIParRgRXCNwUj5hceyqrAmLtypW/aP2DvLkdrPUzxmStkWqezbk9/ROFUA
         pdjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DXIha4Y+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w1si333236ybp.122.2020.06.02.18.24.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 18:24:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DXIha4Y+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgI97-0008Mi-A6
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 21:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHya-0004G1-Qm
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 21:13:52 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:45168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyU-0003aq-VI
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 21:13:52 -0400
Received: by mail-pf1-x444.google.com with SMTP id a127so397775pfa.12
 for <qemu-devel@nongnu.org>; Tue, 02 Jun 2020 18:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cf68FCAzJTbpJLd19R46t9jMSqR5E/27UO36TFsKmfE=;
 b=DXIha4Y+kZZ0jwtry5maEHtc4leXvNE/8F5mrjkukxbgt17m5nWPgXa0F3cO6mjEQF
 i/GT53cj97p4ydXdKPosc+DegwTAhdpBayLuUYcE9FvGQWK53P2BF4sHo7WlLsBxMwxn
 0GAwTzyJHdRaYC8BsBoWyaGpQVY0siYATZRycZshKpBJcM08iajnkPLMBF5Aim8yZdO0
 n1lnGBLTAxu28tosEuMu8QTMpdyIXr+oCGkm8b1s10q8zbv2m+nIS3EdtkRzqfUXxolP
 OBJakcVXO2XGbueCmdHDHFs9+8s3GPTwn8BWjwN1zIMptBwf8LlUaln6vr3AtielOxjS
 5iPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cf68FCAzJTbpJLd19R46t9jMSqR5E/27UO36TFsKmfE=;
 b=aGH/dXvZA0Fycu9s0cV3PsS5Cf0uHa0jj/vYcIBngJnwMfAUoBobnMAHHhUMwLGvk9
 CeviOQg9GT9xCFd8JsCcWE/4uWpuYII5LcVslTc+VN4Unewnoze2CpHMBKMHm9KRiqw4
 lxRn+unkWlhM80guFSed10c+TEvupMA29qp8NH4qGd+YXuVRKDI/8AUap8Q+zkn9/kvN
 28Xp7Oui17Gt8xi/rVpkXxCeXblNmFQoLOmI6BDuFVh73UCfe95j0ONf4xd6yiJLHj1e
 jZO/pMd9xpfzAB0QJ1sjUI3S5PRs4pPcZ+I4EaYZ5i+SREEkePmq8t1xwlp5uP/VyKGW
 n+2g==
X-Gm-Message-State: AOAM531RZWH9Fz6P7zAY55FSQHsKQtdyZVHNa0kumm3aoKSJs1g+jK6y
 VXkHIfXtJBxjREWard3XGyQQmpohAQU=
X-Received: by 2002:a17:90a:dd43:: with SMTP id
 u3mr2120129pjv.221.1591146824770; 
 Tue, 02 Jun 2020 18:13:44 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 3sm290067pfe.85.2020.06.02.18.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 18:13:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 20/42] target/arm: Implement the access tag cache flushes
Date: Tue,  2 Jun 2020 18:12:55 -0700
Message-Id: <20200603011317.473934-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603011317.473934-1-richard.henderson@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JbYyhOGxy+ot

Like the regular data cache flushes, these are nops within qemu.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v6: Split out and handle el0 cache ops properly.
---
 target/arm/helper.c | 65 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8aaa6f22b2..20d7bf4ee1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6927,6 +6927,32 @@ static const ARMCPRegInfo mte_reginfo[] = {
       .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 7,
       .type = ARM_CP_NO_RAW,
       .access = PL0_RW, .readfn = tco_read, .writefn = tco_write },
+    { .name = "DC_IGVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL1_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_IGSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 4,
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
+    { .name = "DC_IGDVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL1_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_IGDSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 6,
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
+    { .name = "DC_CGSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 4,
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
+    { .name = "DC_CGDSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 6,
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
+    { .name = "DC_CIGSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 4,
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
+    { .name = "DC_CIGDSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 6,
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
     REGINFO_SENTINEL
 };
 
@@ -6936,6 +6962,43 @@ static const ARMCPRegInfo mte_tco_ro_reginfo[] = {
       .type = ARM_CP_CONST, .access = PL0_RW, },
     REGINFO_SENTINEL
 };
+
+static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
+    { .name = "DC_CGVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL0_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_CGDVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL0_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_CGVAP", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL0_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_CGDVAP", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL0_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_CGVADP", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL0_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_CGDVADP", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL0_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_CIGVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL0_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_CIGDVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL0_W,
+      .accessfn = aa64_cacheop_poc_access },
+    REGINFO_SENTINEL
+};
+
 #endif
 
 static CPAccessResult access_predinv(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -8069,8 +8132,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
      */
     if (cpu_isar_feature(aa64_mte, cpu)) {
         define_arm_cp_regs(cpu, mte_reginfo);
+        define_arm_cp_regs(cpu, mte_el0_cacheop_reginfo);
     } else if (cpu_isar_feature(aa64_mte_insn_reg, cpu)) {
         define_arm_cp_regs(cpu, mte_tco_ro_reginfo);
+        define_arm_cp_regs(cpu, mte_el0_cacheop_reginfo);
     }
 #endif
 
-- 
2.25.1

