Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754E1CA0FF6
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:11:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4dm-00008e-On; Tue, 26 Aug 2025 21:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4dH-0006lL-41
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:07:23 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4d6-0007Vn-S1
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:07:22 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-7704f3c46ceso2844158b3a.2
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756256827; x=1756861627; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6bG/3hhPGRMWHAj9F4OmuFUUkP9nD2TAKa5JDME5628=;
 b=XR3G/V8YFx8eIcaU6Kp+7GRp4UJgoFLLGY7a6ce8fWS2EExJGEyGonGXiSRal/K7Tt
 CACuxYiMl+DT1xLOs0aLoEiCH2K9VES6AU19XF3ofZRKdUliCjY3cAN9iq5/72vAyluw
 sSFc9AsnNmQw9etwl464H0gPZY0LdDPXw8CnDocteeh88QLmuBR+xL/lCCjnk8L44H7W
 d3INJzHiJMCNO5HZR/YfnXRvYfqt1BZmZQq3nJSsKqSPwhBE7F/nlPRG34nGJJMn/f4p
 C7CG/dC6Eo8HVnXgRPBieZmzotf5ZBaY0AoILX71Ob0SqSzpnR6Hdnyd91q6gXRcGLYL
 4c2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756256827; x=1756861627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6bG/3hhPGRMWHAj9F4OmuFUUkP9nD2TAKa5JDME5628=;
 b=W0gITqFXJoJGeCMHTsVKuG6wjKF+9eH2SBFKY1NBoosAw5f9WQ+hZyUNAWiKJSpSHr
 IcKNMYfZFbK0NZN70kWMKss32YYuewCqDOhTH2jG2A9aXgxUcy18/97ms//y7sOLCCuc
 u5j+h87ThSBbU1fSh8nG+1spoY480QJkTNlzIt0N8LUbuvHYFCewR+QvUVDbMRCn2pV8
 KpK0ckk4C3hvha5B3KaaMBwD//rmcYJ86kqwmsNFL5taMYs4uyh07Md+ySLiGgkZnNsU
 zSBNJ3mVLiIQRDnF7eNV39kZKXqQ10DAYiqCmcDyg8xb62EJTHZLW/eNLtf4Kt9w1WNI
 4bTQ==
X-Gm-Message-State: AOJu0YxjafJw7jpxWBq1awpyT2qpHowMVyqj4PrXEtX4Igmfyn9hoI4C
 neCooWi4Ok/kRIu4iQwOLaOXN2u/3B9/7cCsPMtmD0l7ayvgjuHDJ4gGuGSMLWV0KcE=
X-Gm-Gg: ASbGncvo8Bcegg2m20DCvvRLxW0+Hmm/H6pUDbqgrijBDkAS+2FzriKdFrlQLx3HTPC
 nU2j8A/p8KaDte3ALCKnOWQYS09jysxJcGZ5HCF5N2RgGBi/B0nMiEAg12Ld/g+xj4KxfQ4Y2U9
 Z1kpj7wAgBTQpz9zCuR17qJV3/xSkp8lm5FspK86nUJXcnNmAIa2S53M0z8auJY2jmaqObprNNU
 h7tn6ycOtgwl4hprQZeaAmv7g53Noakg+/tHlCX9b1nXKavTNxnN2n7pEvKdbJqr1jV7gq9gvh2
 1mOWrIC12z6ElvziPWF+FkKhOmDgQRAhHLE4H+UZYyHbR83UYCon9YtkdagopBkIZRUivhIKZXG
 A60+pzzcp+QWfYKHuKeEzeuQ4vA==
X-Google-Smtp-Source: AGHT+IHTpjiKWKNk2X7Arek/BJl7IKIODx/CBorhfNc0eWu3w80SsiJQaokuP1Nssn2DS+pRm7SssQ==
X-Received: by 2002:a05:6a00:2989:b0:772:775:88c9 with SMTP id
 d2e1a72fcca58-77207758ab4mr908175b3a.19.1756256827024; 
 Tue, 26 Aug 2025 18:07:07 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7720274534esm1419241b3a.47.2025.08.26.18.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:07:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 23/61] target/arm: Move cpreg elimination to
 define_one_arm_cp_reg
Date: Wed, 27 Aug 2025 11:04:14 +1000
Message-ID: <20250827010453.4059782-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Eliminate unused registers earlier, so that by the time we
arrive in add_cpreg_to_hashtable we never skip.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 123 +++++++++++++++++++++++---------------------
 1 file changed, 64 insertions(+), 59 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a9d6ed1270..02c155418b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7278,7 +7278,6 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     bool is64 = r->type & ARM_CP_64BIT;
     bool ns = secstate & ARM_CP_SECSTATE_NS;
     size_t name_len;
-    bool make_const;
 
     switch (state) {
     case ARM_CP_STATE_AA32:
@@ -7299,32 +7298,6 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         }
     }
 
-    /*
-     * Eliminate registers that are not present because the EL is missing.
-     * Doing this here makes it easier to put all registers for a given
-     * feature into the same ARMCPRegInfo array and define them all at once.
-     */
-    make_const = false;
-    if (arm_feature(env, ARM_FEATURE_EL3)) {
-        /*
-         * An EL2 register without EL2 but with EL3 is (usually) RES0.
-         * See rule RJFFP in section D1.1.3 of DDI0487H.a.
-         */
-        int min_el = ctz32(r->access) / 2;
-        if (min_el == 2 && !arm_feature(env, ARM_FEATURE_EL2)) {
-            if (r->type & ARM_CP_EL3_NO_EL2_UNDEF) {
-                return;
-            }
-            make_const = !(r->type & ARM_CP_EL3_NO_EL2_KEEP);
-        }
-    } else {
-        CPAccessRights max_el = (arm_feature(env, ARM_FEATURE_EL2)
-                                 ? PL2_RW : PL1_RW);
-        if ((r->access & max_el) == 0) {
-            return;
-        }
-    }
-
     /* Combine cpreg and name into one allocation. */
     name_len = strlen(name) + 1;
     r2 = g_malloc(sizeof(*r2) + name_len);
@@ -7342,38 +7315,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     r2->state = state;
     r2->secure = secstate;
 
-    if (make_const) {
-        /* This should not have been a very special register to begin. */
-        int old_special = r2->type & ARM_CP_SPECIAL_MASK;
-        assert(old_special == 0 || old_special == ARM_CP_NOP);
-        /*
-         * Set the special function to CONST, retaining the other flags.
-         * This is important for e.g. ARM_CP_SVE so that we still
-         * take the SVE trap if CPTR_EL3.EZ == 0.
-         */
-        r2->type = (r2->type & ~ARM_CP_SPECIAL_MASK) | ARM_CP_CONST;
-        /*
-         * Usually, these registers become RES0, but there are a few
-         * special cases like VPIDR_EL2 which have a constant non-zero
-         * value with writes ignored.
-         */
-        if (!(r->type & ARM_CP_EL3_NO_EL2_C_NZ)) {
-            r2->resetvalue = 0;
-        }
-        /*
-         * ARM_CP_CONST has precedence, so removing the callbacks and
-         * offsets are not strictly necessary, but it is potentially
-         * less confusing to debug later.
-         */
-        r2->readfn = NULL;
-        r2->writefn = NULL;
-        r2->raw_readfn = NULL;
-        r2->raw_writefn = NULL;
-        r2->resetfn = NULL;
-        r2->fieldoffset = 0;
-        r2->bank_fieldoffsets[0] = 0;
-        r2->bank_fieldoffsets[1] = 0;
-    } else {
+    {
         bool isbanked = r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1];
 
         if (isbanked) {
@@ -7538,6 +7480,8 @@ void define_one_arm_cp_reg(ARMCPU *cpu, const ARMCPRegInfo *r)
     int opc2min = (r->opc2 == CP_ANY) ? 0 : r->opc2;
     int opc2max = (r->opc2 == CP_ANY) ? 7 : r->opc2;
     int cp = r->cp;
+    ARMCPRegInfo r_const;
+    CPUARMState *env = &cpu->env;
 
     /*
      * AArch64 regs are all 64 bit so ARM_CP_64BIT is meaningless.
@@ -7643,6 +7587,67 @@ void define_one_arm_cp_reg(ARMCPU *cpu, const ARMCPRegInfo *r)
         }
     }
 
+    /*
+     * Eliminate registers that are not present because the EL is missing.
+     * Doing this here makes it easier to put all registers for a given
+     * feature into the same ARMCPRegInfo array and define them all at once.
+     */
+    if (arm_feature(env, ARM_FEATURE_EL3)) {
+        /*
+         * An EL2 register without EL2 but with EL3 is (usually) RES0.
+         * See rule RJFFP in section D1.1.3 of DDI0487H.a.
+         */
+        int min_el = ctz32(r->access) / 2;
+        if (min_el == 2 && !arm_feature(env, ARM_FEATURE_EL2)) {
+            if (r->type & ARM_CP_EL3_NO_EL2_UNDEF) {
+                return;
+            }
+            if (!(r->type & ARM_CP_EL3_NO_EL2_KEEP)) {
+                /* This should not have been a very special register. */
+                int old_special = r->type & ARM_CP_SPECIAL_MASK;
+                assert(old_special == 0 || old_special == ARM_CP_NOP);
+
+                r_const = *r;
+
+                /*
+                 * Set the special function to CONST, retaining the other flags.
+                 * This is important for e.g. ARM_CP_SVE so that we still
+                 * take the SVE trap if CPTR_EL3.EZ == 0.
+                 */
+                r_const.type = (r->type & ~ARM_CP_SPECIAL_MASK) | ARM_CP_CONST;
+                /*
+                 * Usually, these registers become RES0, but there are a few
+                 * special cases like VPIDR_EL2 which have a constant non-zero
+                 * value with writes ignored.
+                 */
+                if (!(r->type & ARM_CP_EL3_NO_EL2_C_NZ)) {
+                    r_const.resetvalue = 0;
+                }
+                /*
+                 * ARM_CP_CONST has precedence, so removing the callbacks and
+                 * offsets are not strictly necessary, but it is potentially
+                 * less confusing to debug later.
+                 */
+                r_const.readfn = NULL;
+                r_const.writefn = NULL;
+                r_const.raw_readfn = NULL;
+                r_const.raw_writefn = NULL;
+                r_const.resetfn = NULL;
+                r_const.fieldoffset = 0;
+                r_const.bank_fieldoffsets[0] = 0;
+                r_const.bank_fieldoffsets[1] = 0;
+
+                r = &r_const;
+            }
+        }
+    } else {
+        CPAccessRights max_el = (arm_feature(env, ARM_FEATURE_EL2)
+                                 ? PL2_RW : PL1_RW);
+        if ((r->access & max_el) == 0) {
+            return;
+        }
+    }
+
     for (int crm = crmmin; crm <= crmmax; crm++) {
         for (int opc1 = opc1min; opc1 <= opc1max; opc1++) {
             for (int opc2 = opc2min; opc2 <= opc2max; opc2++) {
-- 
2.43.0


