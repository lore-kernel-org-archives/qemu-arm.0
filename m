Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1803855lfb;
        Mon, 6 Jun 2022 19:51:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWl9I6Vruxi9IrxEnReagSOY5S7wP1FA4gCLgfqDxrWAkAA7s/Xw0lWKoB3JEvO3Q9jFJe
X-Received: by 2002:ad4:5dc1:0:b0:462:194:bc7a with SMTP id m1-20020ad45dc1000000b004620194bc7amr72639805qvh.87.1654570283938;
        Mon, 06 Jun 2022 19:51:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654570283; cv=none;
        d=google.com; s=arc-20160816;
        b=fA90nYmlJ2Fn2yqTI+XEQua0hM24ocVJ9e49QuiO8qR7umesFLPr4VzsjV7SnArCqy
         cf++MCSSZ7ieuCS5Q1YEkArh9tqnPLzZVP2NuM8VWG4c3Iw97USfThlo53M/iRjWQDkV
         XYUrlY/Sp+joVE4UmolmhWgPO3gA8FDtm7CJ6NkbZdjCA0hTDWgsMrCZmx2huMCwXfof
         aEW1yRP5qwC4dTh6+3DQ6Wj/gipeIFDS9HBECWET2wVHXDWi+u/N6Zgz8Gt7tfNa5E/t
         CUZG7TqTHlph/hN13YlKfHBcBB4/215bGEySojaNxPe/8IWBQwnhQJrt8dp5F4/Auc6j
         +pPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bgbyv0kyxTzSSLAbU+4HIoEqn6rfGQtEpi8WGE77FZs=;
        b=XmCVNBU86gc2xCdhm5Zt2EA3aryB3mVtMl1ZngMEyvZ9Po0Oznq9jcIi6/iATjAOkC
         752blJmCkmlJjsDfCGvtRiO4g8i2KmoeIWVVrcV75WkiQ4kZKMENiXXE2M52dadVy2bD
         9SRdjMcqXcskWlSqzZuNcJHbh1ioGK5LANdc1omizmZJFoFzXA3OtDDpUcEf0m8UIpHX
         1pQrIIx0hX4H2wG1w76WkFO9Oagymj/bUCDrUhRfsN3ImJl7YyunHOxT1jamIRC/y80Y
         4epTKEwrDRnWplMHUVMXjM2Pl7o9S+EzcACI/A+pC3rJhZmBHggCEg66sQkY7icdL5/K
         iAww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=heDhTZTP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if6-20020a0562141c4600b0046b9512b378si2514999qvb.373.2022.06.06.19.51.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 19:51:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=heDhTZTP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyPJT-0005eZ-ED
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 22:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG1-0006qJ-9a
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:49 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:41844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFw-0000Jt-EP
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:47 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso14238336pjg.0
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 19:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bgbyv0kyxTzSSLAbU+4HIoEqn6rfGQtEpi8WGE77FZs=;
 b=heDhTZTPnv8QLs0MU9ihiZcWMCnwPLs1DaSLcfdJ8nSu+8mA6Q1e2eZUWHb9AmGda5
 wGhtMMHIY8RuSY/woxO6ZPS3ON5yWdTujvVZvU4RweaKQv2opXg9npwjtjRaGJqVYZOh
 xD/Cqm3Bv7WpzGHYHMJys/R32zfmKFLp7KglKwqDWb4sgdiIu5ClfBHCnbsFjUG+26Hh
 C9awXfwjQ6KyQOQKxYQ6urye+32ekxNiNlW3HXLqNKKH+ynP0bg4JgjLKW1OTlm7LY37
 Q9aIxCsdbZpjCflzjaXhuI/1IofwWTEZMze9JDfduqKGsaaFrdl+5VpOUXfLn1ngDWHX
 uJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bgbyv0kyxTzSSLAbU+4HIoEqn6rfGQtEpi8WGE77FZs=;
 b=m1d+5RjIH66MYh/a+td1+lXpLeyPAcMedIhXGiAykjnkJ3HwaaAot5Pwc/+OT2hUMe
 M0dllB4XkQ0d7CSZOAf54I5YM0Jb1X4WgGrNcj1kPhAimRNCWXE0s0i1WfFsrN7IMXUR
 8iMH2SblfQlD1llft3r46+AHSIJMfG/g3VcT5GYFGxaLiaApoYHI5zy13Irw0F20pK8y
 MkCXLkA5w1lv5UT2bM6gljQUFWQTCzJkTk97/MCq1q3N8rIUBTbe3Hg4V7+F2Oclxcrg
 zoV/jDTM19f4GdJSk+/nwtarsbD8RJW0otARrV1/+qWO8CZqItObdbjLmOWS5hbVZ+Kk
 v0mg==
X-Gm-Message-State: AOAM532T2fGV1+RKXisamuZkUjT461SwaWc4fXJECxT5sTlvB7a9Pf+b
 bIm6ztVozElI2SlObSP8AYyB8A==
X-Received: by 2002:a17:90a:5c84:b0:1dc:9b42:f2cf with SMTP id
 r4-20020a17090a5c8400b001dc9b42f2cfmr64404390pji.123.1654570063132; 
 Mon, 06 Jun 2022 19:47:43 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 09/25] target/arm: Move arm_debug_exception_fsr to
 debug_helper.c
Date: Mon,  6 Jun 2022 19:47:18 -0700
Message-Id: <20220607024734.541321-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
X-TUID: oS/QLljR1Y+o

This function now now only used in debug_helper.c, so there is
no reason to have a declaration in a header.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h    | 25 -------------------------
 target/arm/debug_helper.c | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index e9ac54f244..c8410ee801 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -793,31 +793,6 @@ static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
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
index 80dff0788b..a743061e89 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -379,6 +379,32 @@ bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
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

