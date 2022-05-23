Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3758364lfh;
        Mon, 23 May 2022 13:59:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyc42teXr52xUaUuTxhyNmUslvfKY0G7xX9LB4fCf8tffpdWzEwQAeiqiQ9Q7RpmgmM9Ivw
X-Received: by 2002:a05:6214:2b07:b0:432:f7e6:e443 with SMTP id jx7-20020a0562142b0700b00432f7e6e443mr18032310qvb.125.1653339595541;
        Mon, 23 May 2022 13:59:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653339595; cv=none;
        d=google.com; s=arc-20160816;
        b=aJKCsVJ2sfPlmWePymLduXprVmhy33U/YrARI2Fl2snaUfdNIEWYyC0H2bSjmAkTOK
         ExsTw9pZAsaXLjMAuwLIKmIWg/iRkjMJfoi5r7I/pPLDlKIi+eCRvxVzPVwIhcw/JFrB
         Fg1wb/vJJYaYr0gjVvt1X8dsT6nSKl5EyJq4NjAuPG5KVeFm1V+G4dbb3le9aQ14iOSb
         oaRHpuvAs8bs4IKlUbPTrCHTifBiTx+nSpgjHw6ABfZT1c8jCwlDcmLRtWOUxo+e3+mO
         /oyE25HyuxxJlppSeG17oUFFvRgM20TMJd1HIjfws4PYtMkw8PtkCN568vtj1TPPcO74
         pf2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CpJpY6Zi7IyphD262mZyPHWMPDsMk1fOKGRcuezpDcQ=;
        b=S524gM0rr3W07fFa77U/75NIVK794YGqZSudZXHC13nlkiCQruXsX2/e3+pf9WcT29
         hV0AvOs4qESy10zxlnth0dw3ClerP0/Z6a7JT7gC1IaKGJn7C/lWSnLyeXa6U2faIEoi
         /OfepoJY5SR8EVH46N6QVxn7edtlkaEaY5m0ylsS21ZYbR3h6kZOxU7X+auaI3pnSKCZ
         qpIm3B9sdmGBahihEClhM0A0E8WErH50bDYiJH4tolZS1uDAjo06ZF5nNUZ7T9h9lJ5Z
         I4z27lYbJa7Eldvqx4yNNcCgbKZkcL9PvJtAv7PXfPMsymINmnXzEL5yqrV1SDLN1jsC
         azLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sb3JFY4u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12-20020ae9e00c000000b006a3fbf330bbsi560664qkk.146.2022.05.23.13.59.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 May 2022 13:59:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sb3JFY4u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ntF9f-0007eo-0M
	for alex.bennee@linaro.org; Mon, 23 May 2022 16:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy4-0008O8-L1
 for qemu-arm@nongnu.org; Mon, 23 May 2022 16:48:00 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy3-0004zX-0X
 for qemu-arm@nongnu.org; Mon, 23 May 2022 16:47:56 -0400
Received: by mail-pl1-x62f.google.com with SMTP id c2so14145013plh.2
 for <qemu-arm@nongnu.org>; Mon, 23 May 2022 13:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CpJpY6Zi7IyphD262mZyPHWMPDsMk1fOKGRcuezpDcQ=;
 b=sb3JFY4untB5UH6tbCKZ3cy4DNgG4NsQc8o+H1jbfWmha1FpENkxiCP8raRPaNkrNJ
 W07/0JJ6/nUnPKmdSV8kdsdo7htnD27B4YcsYDKkNW9E+dA1YcZmMFjhUZC6qpdj+60F
 X4a40AMezszzDlYGL9zlMUu9toT9PQO+povnGwHhVPc9/kXQgCbkBaIDVKWjJ975u+hV
 HdnLff27A6/eoiR74sQ390waqrgRqK2sbbqg3BKrcvHAS6wzFCOeiSO8hC1m+sWdzm+7
 VNw2oNZG8/N4q/3dDEld1sjMKxhxlajz/bEtOtmsVmBLO9lw4xmJZAdkmeHBAwYNtds/
 yq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CpJpY6Zi7IyphD262mZyPHWMPDsMk1fOKGRcuezpDcQ=;
 b=pbD2Q1oo3ydnUFSP7oWhcfEBti9+DYzIIUeQBg1h3zMKarurFe9zIfB3/yuWqSt1jt
 rs+ATDC7MFMGjlCvDlOan7afJIyHEwkzEaJVDNZyK1Jy0wTQ5CVo3w4t5NIV6G2FehFp
 NfMhj076s1xQhS8OGZy2zlLnv6cEPVK0kGAMZZSKvVrj2zaqT6UIy+wnZhdHubOrXs7M
 ukdDHdrDs1FO1WVqVLUpStm6ONwdxOp9XlaXbnhe5RGN+cdwoOvUggtMfVcZFYep/LVR
 jkVkdiMgx5JNV8y9/6uaa8mftcYyS5sNqnGoFajgFLv+wisjg+ZR3GzgUo+ayEHrsqqw
 AbqQ==
X-Gm-Message-State: AOAM531vRCr8mTu1u6CEvX3eTbow3om9p7w1BImkvY0DWvlveKDtAGdy
 diBs5D1ulORTWpcC9vbw+51WqQ==
X-Received: by 2002:a17:902:dad1:b0:161:a5b5:c8f4 with SMTP id
 q17-20020a170902dad100b00161a5b5c8f4mr23724510plx.169.1653338874207; 
 Mon, 23 May 2022 13:47:54 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:47:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 10/18] target/arm: Move arm_debug_exception_fsr to
 debug_helper.c
Date: Mon, 23 May 2022 13:47:34 -0700
Message-Id: <20220523204742.740932-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-TUID: 3OsJjxC9gTz9

This function now now only used in debug_helper.c, so there is
no reason to have a declaration in a header.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h    | 25 -------------------------
 target/arm/debug_helper.c | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 91702b3ff7..bb45100f06 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -794,31 +794,6 @@ static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
     return &env->cp15.tcr_el[regime_el(env, mmu_idx)];
 }
 
-/* Return the FSR value for a debug exception (watchpoint, hardware
- * breakpoint or BKPT insn) targeting the specified exception level.
- */
-static inline uint32_t arm_debug_exception_fsr(CPUARMState *env)
-{
-    ARMMMUFaultInfo fi = { .type = ARMFault_Debug };
-    int target_el = arm_debug_target_el(env);
-    bool using_lpae = false;
-
-    if (target_el == 2 || arm_el_is_aa64(env, target_el)) {
-        using_lpae = true;
-    } else {
-        if (arm_feature(env, ARM_FEATURE_LPAE) &&
-            (env->cp15.tcr_el[target_el].raw_tcr & TTBCR_EAE)) {
-            using_lpae = true;
-        }
-    }
-
-    if (using_lpae) {
-        return arm_fi_to_lfsc(&fi);
-    } else {
-        return arm_fi_to_sfsc(&fi);
-    }
-}
-
 /**
  * arm_num_brps: Return number of implemented breakpoints.
  * Note that the ID register BRPS field is "number of bps - 1",
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index bdcd5f36d6..08d461fd19 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -378,6 +378,32 @@ bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
     return check_watchpoints(cpu);
 }
 
+/*
+ * Return the FSR value for a debug exception (watchpoint, hardware
+ * breakpoint or BKPT insn) targeting the specified exception level.
+ */
+static uint32_t arm_debug_exception_fsr(CPUARMState *env)
+{
+    ARMMMUFaultInfo fi = { .type = ARMFault_Debug };
+    int target_el = arm_debug_target_el(env);
+    bool using_lpae = false;
+
+    if (target_el == 2 || arm_el_is_aa64(env, target_el)) {
+        using_lpae = true;
+    } else {
+        if (arm_feature(env, ARM_FEATURE_LPAE) &&
+            (env->cp15.tcr_el[target_el].raw_tcr & TTBCR_EAE)) {
+            using_lpae = true;
+        }
+    }
+
+    if (using_lpae) {
+        return arm_fi_to_lfsc(&fi);
+    } else {
+        return arm_fi_to_sfsc(&fi);
+    }
+}
+
 void arm_debug_excp_handler(CPUState *cs)
 {
     /*
-- 
2.34.1

