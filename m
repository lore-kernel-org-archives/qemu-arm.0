Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5198565lfh;
        Thu, 2 Jun 2022 14:56:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjQQiT07f3YzdCNW1e8Cn8kQA+FRRSwbEw3807r31KQCdauwfQH0yQ4+eED/51P91rmy1C
X-Received: by 2002:a05:622a:4295:b0:2f1:d202:8285 with SMTP id cr21-20020a05622a429500b002f1d2028285mr5302110qtb.378.1654206960116;
        Thu, 02 Jun 2022 14:56:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654206960; cv=none;
        d=google.com; s=arc-20160816;
        b=JIsLfTGQbMn4xIVMaqlQWO8Jv8wWns55nUk/isDABLuDN6+oh6FYrFS+rLnF1CKkXv
         kVZGxUIipxefy1WjUjund0yAIoKqMIdnY2QFGElF3rvW/rPkbgxZySJ74mpASicYwu+P
         6pDfzJD20PA3SHMEGbCxYw9gnvO+4OdaSO8xRJFFHJMSdhiKEel0nlKu0oSngIot5Gi9
         +BsrOUBv/mn5uzLhkoLzbF37cG77l65F/mdwwEQfOz1w9kE1Wg0Uud/NLh6PaWwjhBSW
         asmG3unSLR0ePJElI5qX50PSpaRbAOfKE22XJVE9ZIS5Fc+vGRJa4rJu7Z/2E05zq/Px
         0VrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0e4LsisXhmXFsvM3FU/zvbh2EDjCmsWCEXLT7Sf9YRE=;
        b=LkrFZQcRFKRG+vjOffrjyyOWwi2bONaDlNYRtCN1ybycP4d2eq8GMa9kE8l/ikhPZq
         XLsx7+lGW+MNF1cNbLRqEqA6IvOca9rOWDe1FGEinbmt+VgEQiag1mCqwgMXpFmXj1sU
         LgCETim9e1Gh+2bqFgpICntTyJ2MxOdmkqbc6+pOdTVVXPlOkwuGZKF6kx9GaGll2JRz
         bec+HDdB+0T5CIdu3sNneN+z570XoIaWZJBQZTYhvLojHiDIbVDDcaFQMZxHqpjY1Ius
         sPqcLdRbh6dO/xBu5sUPlYmXhnXssc95G2NxHAwfYK+uydhvd6mmQv0gqstA7CP6jlX9
         UVIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jgFqSxNr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b27-20020a05620a119b00b006a089942e74si2514101qkk.661.2022.06.02.14.55.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 14:56:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jgFqSxNr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwsnP-0003TU-I4
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 17:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgg-0004Uq-Jl
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:02 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:56011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgd-0008Uf-JE
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:02 -0400
Received: by mail-pj1-x1033.google.com with SMTP id n10so5994895pjh.5
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0e4LsisXhmXFsvM3FU/zvbh2EDjCmsWCEXLT7Sf9YRE=;
 b=jgFqSxNrIJzy5m5awI4C8iInfwp9rcDciK50cKOXhJZOdZCHMI4QmwZtwyHSKz7wof
 GdZWLXsAJ/7dNGpRK0IQmg0dhYcTR7OmfDn9oD9G422eA21P2vJgVoAqvf4dzsj67ErI
 iZKsy7ld5UDoJd1o/HhPLpxLJAfiM6xdU4811Kcz34rQB91fq+uK+xlNJc0d6LE+9+xB
 dz9OWWLYVTt6oGJgA03JdufCx6X3OvpJTPj9cM0UoCQaXPbOkhJQxHUKzEj6+IV1umIx
 UmsfGf8fwc1vPG19Ijgh68U/2mNdQIDjRIksfctFkEKLbadnn4KCrCdscFSaSOkUHnwL
 2hJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0e4LsisXhmXFsvM3FU/zvbh2EDjCmsWCEXLT7Sf9YRE=;
 b=CUQXjK+XmZ2Oz9qTM35QyYNLh02YhCxfgnzg7/AF5h0aZtfFNuDdlaosvUXPD2w1W7
 5ZugWttSE73W7OCeHysWD58CyqYHAkFnbw3OjhoKaqYFfzK7YZuQ8bkQwQvgQHGhmeJR
 1eSXnjA9N5DN7oemkfQVVAtbpLrSYe6PYIvw9GZzEkvbSjsq0MbT+DOhwtY3zbvdWVim
 SlcYTfjT/bAMWtvaPMH5lyS/lKgJKMLMGZB33CbAfmJ3quiqs22krJb7QcdZ+lxxC07E
 cjbwRFtjUHZHc1s5LW+gnAOOrvzcC56zSat5JJP9/BS2slRZXuEpajurymW3Un5qfZpA
 1Waw==
X-Gm-Message-State: AOAM531ED699/mJ5K/6e2pzCM1rPV/b5kJskEARYYHQl8bHYOS0sSf62
 s6ebpinXNCZhmp8HV8E1JFsn9aAv4eSGrg==
X-Received: by 2002:a17:90a:4fe1:b0:1de:fc11:331e with SMTP id
 q88-20020a17090a4fe100b001defc11331emr7525093pjh.145.1654206538229; 
 Thu, 02 Jun 2022 14:48:58 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:48:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 04/71] target/arm: Remove fp checks from sve_exception_el
Date: Thu,  2 Jun 2022 14:47:46 -0700
Message-Id: <20220602214853.496211-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-TUID: 4E7s+E0QFCgO

Instead of checking these bits in fp_exception_el and
also in sve_exception_el, document that we must compare
the results.  The only place where we have not already
checked that FP EL is zero is in rebuild_hflags_a64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 58 +++++++++++++++------------------------------
 1 file changed, 19 insertions(+), 39 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8ace3ad533..bcf48f1b11 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6139,11 +6139,15 @@ static const ARMCPRegInfo minimal_ras_reginfo[] = {
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
@@ -6161,18 +6165,6 @@ int sve_exception_el(CPUARMState *env, int el)
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
@@ -6190,24 +6182,10 @@ int sve_exception_el(CPUARMState *env, int el)
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
 
@@ -13683,19 +13661,21 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
 
     if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
         int sve_el = sve_exception_el(env, el);
-        uint32_t zcr_len;
 
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
-            zcr_len = sve_zcr_len_for_el(env, el);
+        if (fp_el != 0) {
+            if (sve_el > fp_el) {
+                sve_el = 0;
+            }
+        } else if (sve_el == 0) {
+            DP_TBFLAG_A64(flags, VL, sve_zcr_len_for_el(env, el));
         }
         DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
-        DP_TBFLAG_A64(flags, VL, zcr_len);
     }
 
     sctlr = regime_sctlr(env, stage1);
-- 
2.34.1

