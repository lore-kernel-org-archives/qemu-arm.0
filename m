Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1201587lfh;
        Fri, 27 May 2022 11:12:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTJ92XksTfVa7CmyGyoPr5fmRB/fkSqZyUKD6/Wb9/QfVhkgtUC8syc0+0eddl/GZ8wf51
X-Received: by 2002:a05:622a:110f:b0:2f3:c9f1:ada4 with SMTP id e15-20020a05622a110f00b002f3c9f1ada4mr34557054qty.197.1653675138328;
        Fri, 27 May 2022 11:12:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653675138; cv=none;
        d=google.com; s=arc-20160816;
        b=gdpiLsI2aGkSpceMC58v35HqPaRUI/OInAZwnjYcIA4vEbLiXEWKGvMenlOiOoe5/3
         GsHgsmAhZWQnXqI2m0qX34maNU+GzcUm93d7WNb6y8tMHe7a9xlWr87YmYN4/i6lM564
         FPDqpBvWvvnAwLnzxoRXhtZXeVwWzXl7hSnc6MGM0mSnBDyZwM34Jxq/A19zN+EbVbnD
         0R0NtzJIyNYjXeUUl72pULYOOtverbFFrhIbpCmN1hdYb0j/8m/QWsrQSe7n9WPKMu2l
         Zn+m/3Z8HL5ZwIUORllhO0XM2wxcQjb5tLrHM0zeTV6RxwjkR9eedbwCMPEI/nSnywla
         GulQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=r2MwpG9aEqByOhoM/DW2jX/VmmpLz9U3BEngb4MfIQY=;
        b=f61qV+uZ/mPM1EWSkRi++2b8zWWFhTeDHZ2rt3J1NLTKoe0L2wabY41rsLpHbfSG28
         agayjBCnuotFMZ6++wyB5kpU7WqYMQd5edyrd2dPhE78kUancz8cYqO6x2OllKyhRXpg
         330lvM/EKD7TZK/WT46E+biy/h3zZq52iNV5K/j03BtJ0IgPPgUdKiroPytwEwuoZTA2
         13rFrlc2F7QfuQj8VNMu+gqx34S1F1xuREqsH6LUTF3sppc/SPvEjRwYh3PxrvtEG3IU
         KgSG9CG4ipDRkmyM0hXxzl68MrVsl0CE3O8M0BC/yZ6WBxdkg5gbg3iqSFk6Hl740iZQ
         sGnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gUFrj7mM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6-20020a05620a258600b006a011523bdfsi3353872qko.85.2022.05.27.11.12.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:12:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gUFrj7mM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nueRd-0003AX-IJ
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueMD-0003El-Sq
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:06:41 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:42603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueM4-0001eI-7Z
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:06:41 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 cs3-20020a17090af50300b001e0808b5838so5009529pjb.1
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r2MwpG9aEqByOhoM/DW2jX/VmmpLz9U3BEngb4MfIQY=;
 b=gUFrj7mMt9wtUXwe3ZB6ktLQSW2i0Y9/0ZsDgR3Xd9+hU6oOEFk04zlu14qlussniO
 gTA4eyMtBwpKge9v6DIPqwwwlXZbTaBti6JafH28nLQ/2q9eC6drNlAfjUZSnjy1YL3v
 lGJI6GdHy89tBSGiyKiWNHJkdpHPqLvNu1lO6xnLfLKhvgDWfb1qvg7CEPcCaBG+rYc5
 fo3sOgB4wn/2O6tAcdDFEO/uLZpwyx6Ia2bCyq88dXRCE2ORKQrZa+OTKSrUJ0NTd+a8
 O3q5gok3BMjGAjqq5+Nu8t05oHp4WxZt5O/YnEA7Z4bhWJgbY/FoZMNW7u3429eu4MIf
 /e7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r2MwpG9aEqByOhoM/DW2jX/VmmpLz9U3BEngb4MfIQY=;
 b=Ey64fu7yhIj+3Lpf7jjjIRWGEjqaM1vgcW5Fs2kHKosYy0/CjkPaXan+0xxGyfxN9Z
 mreJlV4tiZkgV93SlhU9/ouPap46ZU2rnHBk0D10vMBF+CWeYopSsU5W7Prx/73r4OWt
 FKxg1E09N+bgjRrSD1hlYuf8J4Zr4pebGb7t9esahIch35spvZfE6eHRZJy3PZwplc43
 W9rqEsS2oDOWI6WdoLLsxh5PJLjiHrysoi3T/KYKDwospvN7vmwRVRpCHdtv+mbugBm3
 3I6dkPPvQ9c7NHAhZc0osgLYx2iPha0XvES3B5goV9r3N/lY3AGvubCoYR7a8Ssmuu80
 LpyA==
X-Gm-Message-State: AOAM5315LWZOQGj8LGo5K9M5loplw2QBkEbFSny/4ZkIpFyR0WC+bRqv
 Lpvje6hbvVSrAJ4oENL/aKE7//Mp/1Y1pw==
X-Received: by 2002:a17:90b:4d8d:b0:1e0:4cb0:fae5 with SMTP id
 oj13-20020a17090b4d8d00b001e04cb0fae5mr9483387pjb.116.1653674790908; 
 Fri, 27 May 2022 11:06:30 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170902cf4a00b001618fee3900sm3934492plg.196.2022.05.27.11.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:06:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 07/15] target/arm: Remove fp checks from sve_exception_el
Date: Fri, 27 May 2022 11:06:15 -0700
Message-Id: <20220527180623.185261-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527180623.185261-1-richard.henderson@linaro.org>
References: <20220527180623.185261-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-TUID: SUWfIfcyMChI

Instead of checking these bits in fp_exception_el and
also in sve_exception_el, document that we must compare
the results.  The only place where we have not already
checked that FP EL is zero is in rebuild_hflags_a64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 56 +++++++++++++++------------------------------
 1 file changed, 19 insertions(+), 37 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 84cb78d151..cd0a8992ba 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6135,11 +6135,15 @@ static const ARMCPRegInfo minimal_ras_reginfo[] = {
       .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.vsesr_el2) },
 };
 
-/* Return the exception level to which exceptions should be taken
- * via SVEAccessTrap.  If an exception should be routed through
- * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
- * take care of raising that exception.
- * C.f. the ARM pseudocode function CheckSVEEnabled.
+/*
+ * Return the exception level to which exceptions should be taken
+ * via SVEAccessTrap.  This excludes the check for whether the exception
+ * should be routed through AArch64.AdvSIMDFPAccessTrap.  That can easily
+ * be found by testing 0 < fp_exception_el < sve_exception_el.
+ *
+ * C.f. the ARM pseudocode function CheckSVEEnabled.  Note that the
+ * pseudocode does *not* separate out the FP trap checks, but has them
+ * all in one function.
  */
 int sve_exception_el(CPUARMState *env, int el)
 {
@@ -6157,18 +6161,6 @@ int sve_exception_el(CPUARMState *env, int el)
         case 2:
             return 1;
         }
-
-        /* Check CPACR.FPEN.  */
-        switch (FIELD_EX64(env->cp15.cpacr_el1, CPACR_EL1, FPEN)) {
-        case 1:
-            if (el != 0) {
-                break;
-            }
-            /* fall through */
-        case 0:
-        case 2:
-            return 0;
-        }
     }
 
     /*
@@ -6186,24 +6178,10 @@ int sve_exception_el(CPUARMState *env, int el)
             case 2:
                 return 2;
             }
-
-            switch (FIELD_EX32(env->cp15.cptr_el[2], CPTR_EL2, FPEN)) {
-            case 1:
-                if (el == 2 || !(hcr_el2 & HCR_TGE)) {
-                    break;
-                }
-                /* fall through */
-            case 0:
-            case 2:
-                return 0;
-            }
         } else if (arm_is_el2_enabled(env)) {
             if (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, TZ)) {
                 return 2;
             }
-            if (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, TFP)) {
-                return 0;
-            }
         }
     }
 
@@ -13658,15 +13636,19 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
 
     if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
         int sve_el = sve_exception_el(env, el);
-        uint32_t zcr_len;
+        uint32_t zcr_len = 0;
 
         /*
-         * If SVE is disabled, but FP is enabled,
-         * then the effective len is 0.
+         * If either FP or SVE are disabled, translator does not need len.
+         * If SVE EL > FP EL, FP exception has precedence, and translator
+         * does not need SVE EL.  Save potential re-translations by forcing
+         * the unneeded data to zero.
          */
-        if (sve_el != 0 && fp_el == 0) {
-            zcr_len = 0;
-        } else {
+        if (fp_el != 0) {
+            if (sve_el > fp_el) {
+                sve_el = 0;
+            }
+        } else if (sve_el == 0) {
             zcr_len = sve_vqm1_for_el(env, el);
         }
         DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
-- 
2.34.1

