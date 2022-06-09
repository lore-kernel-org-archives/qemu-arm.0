Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp683853lfb;
        Thu, 9 Jun 2022 13:35:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbpu3ztaZB7JFl3cJHcQw//146KfKh7dhLasAUTWbAZBKmONUPk4i9ahUqcyayy07hn1XU
X-Received: by 2002:a05:6214:2a4b:b0:46b:a66e:114f with SMTP id jf11-20020a0562142a4b00b0046ba66e114fmr16033589qvb.65.1654806945144;
        Thu, 09 Jun 2022 13:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654806945; cv=none;
        d=google.com; s=arc-20160816;
        b=ai/F8KBHAZFj9eyfoGqyqpB7nuA2Egsj/b7fR+UFv7GZw6BZoiyLRms9M4r6Cc4n3w
         j2Ogmix2xpwwzybO+z3EEqnDoz5JXb86HcCVZEmbYKTq8gmAfMTUUiAkRP1YvEZXQNJh
         uMTBmBEQDys4H94/lhJPPxfAgey+wu/n1Pf8v26V0YhbwxW52SeF4rt+yWepuP2fP/44
         iDNmbbL4l/BE2SvAPQUq3/birUDRBHeMIKLFxGUT3ypa32aLPND9eQLltMdGaThjfRrO
         TRXWpsHh/kDgwCUhNDpH9OzP+VwfDDIC9yMg09FPxMcAQ5ZXKuEYMyE854u3VlfREMIB
         TARg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MrEhOa+yMtE+t8fOZfBlrA2frjHLPNVyhuaexNOThYc=;
        b=ItCIBFKefTuJRot9Ua7js09Xy7WwGTnpB4kmVvKo4rHFf9tEo+bzLDyqCx/h3P9FI4
         zPOv26bjJJfODfRr2T+/mRIEShmPpi2JwEX7f6DzuBl6d3eND9E5aTKfOjQ3MIxC2F2V
         TwkOZggQ4rpVJL8wqBrrA40tSNjve4hq6TwRimP1APMz+m9JAWubJIoxaCvcM0B3A4DO
         tlctq52DjuYz9ogFOwcpVVZIuRMH3H09L+96DOOKw8HPcGvHyPJ61kr+z6N76gLnad+h
         53rWRveOFBvrPH8nrV0VBk/WQb+TSriAxJT4nO789DCYu0oQ39j5qOe9DhQ7PolmoxcN
         sBMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZV22uVUU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12-20020a05622a180c00b002f3dbc85e2dsi13799627qtc.649.2022.06.09.13.35.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 13:35:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZV22uVUU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzOsa-0002pl-Jq
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 16:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmD-0003Ur-6I
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 16:29:09 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:35637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmB-0008RD-KJ
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 16:29:08 -0400
Received: by mail-pl1-x62c.google.com with SMTP id o6so16052373plg.2
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 13:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MrEhOa+yMtE+t8fOZfBlrA2frjHLPNVyhuaexNOThYc=;
 b=ZV22uVUUkEgpdPG4eIApV7/5PqnIL3Og6yWXIbEGC2AnIAk0xxkuEfZapqEEhOHwtU
 Ci2qBLRroqxP6SK+0ojy7z+cw36nNDBgaArM7PadPGWCfriPErVJg27bo9/fSEdrkt8r
 ebFvtVfQM7J5uzByCHBb/xiNUe6KPpwh7V4kjMTk35Q4ko854uhkthbgtQR4xgc7e5mv
 VjL+iUiovmz0YOmkdQ1+qNTzurj02/oFsbsJYuB02WUfV3yvsmC8QY2admPsTZV32/tT
 B2HR7i+ysM0zDBJci2K+s5X1IKwkW+CP5F5WuuUHdQSfHI/5jRBzX2Z8W4iyj+QiH10U
 4O3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MrEhOa+yMtE+t8fOZfBlrA2frjHLPNVyhuaexNOThYc=;
 b=jr9Gm8+H+3XPHRUbTae6NmteZtn3gU8e6nibh9WdGxe9tDp3qjJhgRX12EVzEA4EJy
 gmm9Y8IgihMuMGOwOTuvjTghWZtnXmXHsmOAsE5+zBtvSjX/D9fGMln2oR5ZzgNyTBzg
 cScLcJ55H8rsgFIetBgqaShPb1k+OLdNzNiIOvjhlk9yXc9PMXYdX6aB3eWOA/N6hltl
 viQ4at7xPHuTaQDxziEBM0zXvC/nqegxyaavIV3SiRJ3/GbHoeJ7fqCdu0xOLxHBh3M3
 zury7k1qLTAyVlXU0p7GkVgMn4srFc40if3RMZjVnlfbcrmFN85Rc+4DZLFj05zlqQWM
 WvbA==
X-Gm-Message-State: AOAM530r+kymmatGhqv0ZSbHxPYzXw6cZ0tsQ7XPqDWE6XBTd4f/Nd5E
 DAfSRbeLdEAcrjYp/ky16Dk37A==
X-Received: by 2002:a17:903:1c2:b0:163:ef7b:e10f with SMTP id
 e2-20020a17090301c200b00163ef7be10fmr40853642plh.158.1654806546215; 
 Thu, 09 Jun 2022 13:29:06 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 04/23] target/arm: Move arm_singlestep_active out of line
Date: Thu,  9 Jun 2022 13:28:42 -0700
Message-Id: <20220609202901.1177572-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 9l8z2EgNJaw5

Move the function to debug_helper.c, and the
declaration to internals.h.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h          | 10 ----------
 target/arm/internals.h    |  1 +
 target/arm/debug_helper.c | 12 ++++++++++++
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 78dbcb5592..bb1dc3289a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3106,16 +3106,6 @@ static inline bool arm_generate_debug_exceptions(CPUARMState *env)
     }
 }
 
-/* Is single-stepping active? (Note that the "is EL_D AArch64?" check
- * implicitly means this always returns false in pre-v8 CPUs.)
- */
-static inline bool arm_singlestep_active(CPUARMState *env)
-{
-    return extract32(env->cp15.mdscr_el1, 0, 1)
-        && arm_el_is_aa64(env, arm_debug_target_el(env))
-        && arm_generate_debug_exceptions(env);
-}
-
 static inline bool arm_sctlr_b(CPUARMState *env)
 {
     return
diff --git a/target/arm/internals.h b/target/arm/internals.h
index af9de2dbe5..64e2c1dfad 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1325,6 +1325,7 @@ bool el_is_in_host(CPUARMState *env, int el);
 
 void aa32_max_features(ARMCPU *cpu);
 int exception_target_el(CPUARMState *env);
+bool arm_singlestep_active(CPUARMState *env);
 
 /* Powers of 2 for sve_vq_map et al. */
 #define SVE_VQ_POW2_MAP                                 \
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 46893697cc..1abf41c5f8 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -11,6 +11,18 @@
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 
+
+/*
+ * Is single-stepping active? (Note that the "is EL_D AArch64?" check
+ * implicitly means this always returns false in pre-v8 CPUs.)
+ */
+bool arm_singlestep_active(CPUARMState *env)
+{
+    return extract32(env->cp15.mdscr_el1, 0, 1)
+        && arm_el_is_aa64(env, arm_debug_target_el(env))
+        && arm_generate_debug_exceptions(env);
+}
+
 /* Return true if the linked breakpoint entry lbn passes its checks */
 static bool linked_bp_matches(ARMCPU *cpu, int lbn)
 {
-- 
2.34.1

