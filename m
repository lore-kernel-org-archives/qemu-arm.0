Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp688601lfb;
        Thu, 9 Jun 2022 13:46:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO9MzIU++byO/7FS2/zXprFm5Kjnd52G5g0PgRgaWOhmQw5SbgLtSy34aiIk25/ibfC42Y
X-Received: by 2002:a05:6214:21ae:b0:469:a218:747e with SMTP id t14-20020a05621421ae00b00469a218747emr25371065qvc.97.1654807599712;
        Thu, 09 Jun 2022 13:46:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654807599; cv=none;
        d=google.com; s=arc-20160816;
        b=hFkubnzTyCnIJ/RDiUS37Gcs9uMLJWFduT/OIjxHShcF3eh9RBrYuGu1Xdgu3ysWWw
         QJ8Vpetx6blfkEgXUxggEKHF+fW7kKnbUz+tRSuXct2qTGVbSArW3xy4MHz1/Yb44B6V
         Nksc3tS8e1gORbG/a35IGWL2h5d9EGNkUDwpssZGmnMN8+Jk1iKxtlIn+A+7jqmLYiSP
         YoO0uYeCGFGTiVSmkoEDxytSmo9wEijU+9LzEnhcDEvjxkQ66MjXDn86/BaS2A3Vb32X
         3UFNec55ZOv/XRMhmkNVB22FeQa5m5N56iOQoiqlc5lfvapPpTqMMGJ0zak9i36/3b8G
         daMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BCzxefNxcQpSTLu01BysmYqWqiN0wU9rTXU9xeYcYo4=;
        b=hmXUy37jxpUuB7Labr9TKahlWN0TWcwmZdRkYH+G5h36i9/bPKN1nmrPM/LnbgimWt
         0UoBbQkGGsbNOvea0mqPQCny7C5TVC+4I1Lzq0xki9NRjj9YMo2y5ehYrWzeNuQT+r5v
         VpVvTi3HmrWhYCU7L5QTXq6FXOWeXovp7PVXT8rlCdHiVoCWSMMhx+eXmCVVpRRbFJF0
         /Q6rl1AG1oUyWv8fBdGe29xeSxoarpxd2W1leAJ5AlldzyWOLeXXYhRyF9wQa+Tp48jw
         pz98JJpz6F/BnNwrbIA+y2hlaUY/5EHxjvdhd9zI5YiWfwoLj98Rqpju5BbhBm3Hl2Ux
         7+MA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I0oSIx0k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11-20020a05620a0bcb00b006a4b15a925esi13294372qki.762.2022.06.09.13.46.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 13:46:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I0oSIx0k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzP39-00059S-73
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 16:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmH-0003iA-Cx
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 16:29:13 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:42748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmF-0008Sd-Bk
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 16:29:13 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 d12-20020a17090abf8c00b001e2eb431ce4so357388pjs.1
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 13:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BCzxefNxcQpSTLu01BysmYqWqiN0wU9rTXU9xeYcYo4=;
 b=I0oSIx0klTiW3S4pgqntyDI0vnJqmBCJfakF7r0jgq2+dVNp9oQWP8l5oLBMNtXWrh
 544RdYEnW0eOJxadDliU16Ib4J8GDV9y1NJ+lXi2lkhjdBkTLDuOMoi4eyJSz0jdGEuR
 wq8z7CJuKzuZmgOtr/cblqG5z/IPzckzPG2oAImTIl+rXG97MsovcpU6XkjyFS0poiXH
 gzLrigs05uAZD5LbxxhhxIw9idKtRDVX3qdWpZBg2wOliSRZ33F/gMNV8qttAkE1pnTE
 ertdmkg6fHo8mmhYE5DZRICiWPtslOXqLmRA9GURK16I9LtLFxfaHXnXkrDi30KCCUk0
 jE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BCzxefNxcQpSTLu01BysmYqWqiN0wU9rTXU9xeYcYo4=;
 b=UhKZL/t70deu1tqNL4VZ90/nxZVgXZcQ9uMMlV7X6LBvW/EbZYIC79w3I/DWnEqBLS
 ogzlqYEZjXC9i509y636IhyYnt2l+qJplUnUiWWbXbKkvxT5HlP5Bp4260PmYVgEniEC
 mY/BziwzR77gBYv+i8jM65LbLledG3PanZEIo7+btx1ijhEM/Fyyh1CuAXAAYueSfWSv
 rptx0XQF+T3UCLHHc8AchpuU2YPHhh60W/oVb7d78jdxQoODjCwTNWdV9ILYZ+bEvXGz
 2p6Dupi9NGxHhAdQAtDJWRCEQRVqVpT0OswDAkUjaO98g2CKFlNPSZDhZvRYlZ0o2S04
 bPBg==
X-Gm-Message-State: AOAM531l33JBWJuvMxUAqIpqTW0euNTIdRit4SZvY9/NiYO1Fe1IHuSV
 kTy8lruLQD33wJPfIr0LAowPSQ==
X-Received: by 2002:a17:902:c945:b0:163:c3c3:aff8 with SMTP id
 i5-20020a170902c94500b00163c3c3aff8mr41494569pla.56.1654806549951; 
 Thu, 09 Jun 2022 13:29:09 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 08/23] target/arm: Move arm_debug_exception_fsr to
 debug_helper.c
Date: Thu,  9 Jun 2022 13:28:46 -0700
Message-Id: <20220609202901.1177572-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-TUID: xLVCjXthMrWb

This function now now only used in debug_helper.c, so there is
no reason to have a declaration in a header.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h    | 25 -------------------------
 target/arm/debug_helper.c | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 02fa70f75a..6f94f3019d 100644
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

