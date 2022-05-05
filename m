Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1294291lfj;
        Thu, 5 May 2022 12:05:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVDWEttBuIfMdrjPd+HEdXhT03nIINEICKLP55AD6LBjbeRNSD/D2aaMzHptVAmHOLrJYu
X-Received: by 2002:a05:620a:4013:b0:69f:d99f:160d with SMTP id h19-20020a05620a401300b0069fd99f160dmr15409522qko.275.1651777532422;
        Thu, 05 May 2022 12:05:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651777532; cv=none;
        d=google.com; s=arc-20160816;
        b=agP1MA3BP1TO83Y1WPpkd7bEfr6LHZcSHexSuc22ORBd/BzmbehNQqAntbB/L6D4e7
         QH4ugXeMGWTHQ2dWbL5xcezxDuHvhqqRGI2tMFxl97dmcUxybBrIJLB/ZEH8DuOcpyJV
         bg4r1OYAMbZGjk5XRs7e6KIIU33XnmXK7C2fvNgtlihaVYVeahxE+zWqnFdq025R5Bwf
         h8C8WHkhtAXWoQpcZErwDCJ6ymbFGmVQFFmIO7UdBUMor8eQny+Yd/kzFNh/gMs6Fq/Z
         RjPmiUsbjCV3yrut07laa7FRDTrVhKIJG0D6GxbUXh0hT339JiQJRzngyNzl326Edo0T
         H7/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4YqOGbb38qjiPY2dXCdLJrEWMXvDZh6b/gyG/7bmWLA=;
        b=HTKroxnZw9REla6rdChDq2FMgpp7fS/G0zYWPANbcIHWawb7JjgJwU57qOWqTD88lP
         aoBxXB+j0l42mrVbCV0Rrn8MxEm4G92iTKZZXsUAJle9IIY39h6U6qJE9vIDRT7mOJvR
         W5Mp6kahY7shkG12YXFp5GPZ7+CwJ6kk0r4NKatMilDNPtxicIVe0ibZeUmKwp7Rnl35
         v1JgJrlOYnD6dwKweC32NQhDLrOWnC4WyCt9nKtOalP6ja9NWMrsemrvx6R3UyN4EEtz
         BDqj68IzT7jSEp7ifJDOJMJT3hlD7eamfBxxL/RKbHMJaNyFQGTV3BYs4iBvMcPykl+Z
         iiRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ilBdOtWm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m5-20020a0cee45000000b004461374ea69si1166127qvs.519.2022.05.05.12.05.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 12:05:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ilBdOtWm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmgn5-0004hf-Rh
	for alex.bennee@linaro.org; Thu, 05 May 2022 15:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYR-0002Us-3d
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:50:23 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:36513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYO-0004NE-2W
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:50:22 -0400
Received: by mail-oi1-x22c.google.com with SMTP id v66so5264391oib.3
 for <qemu-arm@nongnu.org>; Thu, 05 May 2022 11:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4YqOGbb38qjiPY2dXCdLJrEWMXvDZh6b/gyG/7bmWLA=;
 b=ilBdOtWmaaU//pKM7FFsegWSpvRNjwDLc4z7U6l23Xp4eTcQQb967RGtHgV3UlIfCY
 HxJpInnH+n/03o8SXKeG++uH3iJ5taqcVP7u2CeQifybtfDAjvz8Nk4875XSqLvv4FJ0
 gbeb90wF/sUrb+rcr6va4fUDnXWrv3mhKjZSQcGvYamj6uoz6hrOarjhrMPeloM79vLJ
 jElxw0cazd4K5LZ7SljGLYhotpWBLyHNgzky7FP93tUAwDUajKcHxc438tmDvB7gBXwb
 lxcx4Mt/ByBRbRsYjb8WkcVXvbN1E8h5wq/qeda4buhghA7l+xKPG74RPMAA+SxI2LVg
 pYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4YqOGbb38qjiPY2dXCdLJrEWMXvDZh6b/gyG/7bmWLA=;
 b=COzGPuHEGutwCuauWk2LzPPbiZ2hb2IG5C5lP9+YnSsAJilpmXgCZXJdLX4N62i+Jp
 iGbaJPzc61yudt05LkptJWn/6/KGJzeN/AsjnCGc8Xbfc9nYA7cMTqzPnA58ZJR/qfyT
 2OtCv/PHRY4gzOWLs6PDCyE7U/KU3ZgNJpRYIBktkho3xpDVjfjx96vnsybs9GxqFOPT
 znc6evXq5JURZQ5h5cQGLpbEzP1W9nIJ54t3CrnPFq9vxrG7kFDbLCtWyUxxRoWvUANq
 L2AZiRZvQOmKE4OXON+d2zGEmUr+YaIME/eI1bd479S1ChY2hFBdhC4tK5DmMpF/yG+F
 nLtg==
X-Gm-Message-State: AOAM5301D0ZgXQZ+8ANOGnN1dZreUNphBN9Np0ThE8J6FQ6L7LUj8cpg
 OhtgThNnaOn6+rs66IjH8vatyQ==
X-Received: by 2002:a05:6808:56b:b0:325:9f5e:3fd4 with SMTP id
 j11-20020a056808056b00b003259f5e3fd4mr3227705oig.199.1651776612848; 
 Thu, 05 May 2022 11:50:12 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 03/24] target/arm: Merge zcr reginfo
Date: Thu,  5 May 2022 13:49:45 -0500
Message-Id: <20220505185006.200555-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: 1ea6w4fnXkyP

Drop zcr_no_el2_reginfo and merge the 3 registers into one array,
now that ZCR_EL2 can be squashed to RES0 and ZCR_EL3 dropped
while registering.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 55 ++++++++++++++-------------------------------
 1 file changed, 17 insertions(+), 38 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ea2788b3d5..72d05070f0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6122,35 +6122,22 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
-static const ARMCPRegInfo zcr_el1_reginfo = {
-    .name = "ZCR_EL1", .state = ARM_CP_STATE_AA64,
-    .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL1_RW, .type = ARM_CP_SVE,
-    .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[1]),
-    .writefn = zcr_write, .raw_writefn = raw_write
-};
-
-static const ARMCPRegInfo zcr_el2_reginfo = {
-    .name = "ZCR_EL2", .state = ARM_CP_STATE_AA64,
-    .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL2_RW, .type = ARM_CP_SVE,
-    .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[2]),
-    .writefn = zcr_write, .raw_writefn = raw_write
-};
-
-static const ARMCPRegInfo zcr_no_el2_reginfo = {
-    .name = "ZCR_EL2", .state = ARM_CP_STATE_AA64,
-    .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL2_RW, .type = ARM_CP_SVE,
-    .readfn = arm_cp_read_zero, .writefn = arm_cp_write_ignore
-};
-
-static const ARMCPRegInfo zcr_el3_reginfo = {
-    .name = "ZCR_EL3", .state = ARM_CP_STATE_AA64,
-    .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL3_RW, .type = ARM_CP_SVE,
-    .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[3]),
-    .writefn = zcr_write, .raw_writefn = raw_write
+static const ARMCPRegInfo zcr_reginfo[] = {
+    { .name = "ZCR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 2, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_SVE,
+      .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[1]),
+      .writefn = zcr_write, .raw_writefn = raw_write },
+    { .name = "ZCR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 0,
+      .access = PL2_RW, .type = ARM_CP_SVE,
+      .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[2]),
+      .writefn = zcr_write, .raw_writefn = raw_write },
+    { .name = "ZCR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 2, .opc2 = 0,
+      .access = PL3_RW, .type = ARM_CP_SVE,
+      .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[3]),
+      .writefn = zcr_write, .raw_writefn = raw_write },
 };
 
 void hw_watchpoint_update(ARMCPU *cpu, int n)
@@ -8233,15 +8220,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     }
 
     if (cpu_isar_feature(aa64_sve, cpu)) {
-        define_one_arm_cp_reg(cpu, &zcr_el1_reginfo);
-        if (arm_feature(env, ARM_FEATURE_EL2)) {
-            define_one_arm_cp_reg(cpu, &zcr_el2_reginfo);
-        } else {
-            define_one_arm_cp_reg(cpu, &zcr_no_el2_reginfo);
-        }
-        if (arm_feature(env, ARM_FEATURE_EL3)) {
-            define_one_arm_cp_reg(cpu, &zcr_el3_reginfo);
-        }
+        define_arm_cp_regs(cpu, zcr_reginfo);
     }
 
 #ifdef TARGET_AARCH64
-- 
2.34.1

