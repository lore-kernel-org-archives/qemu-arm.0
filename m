Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1D0C5AC7C
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Aug 2026 17:28:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ws1sN-0001Z1-1s; Thu, 06 Aug 2026 13:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws1sG-0001VC-UG
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:27:22 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws1sE-0000dT-RY
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:27:20 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-8486672f03cso3071803b3a.0
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 10:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786037236; x=1786642036; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oy99RyrEu1jSUfJW8xguDFPe+YqKeZ3KOkALn5syMjw=;
 b=bbYuiyhDpXhidmIQ2GjmjDJmfDSyqI4w50F3SIXveQ4gIzBz31xNfbTULcU8V3GO2F
 AY1Z0HODda3yNjN0r76fJDLSZ4fPTegZWSbFLDENBH4JYtZWip0tmBj2UbUO2FlkN5J1
 SimnZAXL0+gl6ElzwSkBItcvRgF3jNZp8KEno5HwuMPxoXI25u3mJvDQEIBz8aQYx6F2
 tEE+R8+mGNCbquXu+njL1uduY5Ma+1X/HOR5mYLt+wSAAMhb7PBZOPTg9N4Xyz+1Qg8i
 gKJVCYgBMA0B6jH44KpZZEABEZNXIw7P+4VJd9zxTK9APQvww9eDQJoxzXUrS2V8ToOt
 PypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786037236; x=1786642036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=oy99RyrEu1jSUfJW8xguDFPe+YqKeZ3KOkALn5syMjw=;
 b=auH7jhrf71Jhoboqf7qWAJm5+4AyMoOE1XMGYrpY4r/MsPJoXVJ/Y7TStWJG2zlfUG
 FlxJ7SVpREmG7Teir5ZS5B7rIYOXAU0LRJbkT+TSfu+QE6Q148WIIKWOlRCeiMJ4DQHO
 yZ1AEyFN8imDjA56L87hm31b+xRVPZyoG3eOzyFD8UyRi+Ifygo/DBkKg0WIuvy6guF0
 cFdjtZbSvcyX3liukCQz+PHmHClMf4WFmkzQwpY9TT7mPufJOM3ZVUnbpZ7vi28Crsbs
 daHeth8COvDPWEhKrC8+4x5bJrp1afgzQuSM+Em8k5XkkQgSE7MLm4SS351I/3+kS6KK
 N2gQ==
X-Gm-Message-State: AOJu0YyVbr25GUiRYKBn202LvOeMHttgq4aO359fwI1XoRB3UQqSeK/o
 3wZlvWNEjUbmTcdFt098H4p5DZkPlXD7gKtuC+eBasQjf6UQlvAALnGimY9MTSTp8Oc=
X-Gm-Gg: AR+sD13tx999YursvAht8I94VU7+KjKlw/N6K8d2Ubv+xUhAr/GMne4UABPY02+ezGZ
 60wYxba9bcnNA2JZwFYDW6Kvw1TiECmQKedqVnjrD90JjhmcivfSz8vRp1NT5V5MeySLtMSx0oV
 2cPuTQ2geZVp/SzTORFcLehWvve0fYm5Tair+d0heDN0APxDngrrK/Tp7ypeCBbaj7mPT5Kb6JI
 xXYQQ7qwP98CHzD1E45mPmd19jKSLt5jU8r8341V2sOOmHq7z/c0vJEfHaAdINVS/R/YS0aETJ9
 m5AZgalBFa2jMeLkhmbJCkLSzE5rT6oPwTI7066C5h/dRkOCh6zUyu8KFDhdWPgs3mQstCWbap8
 wtGS+qfvvzVPFTOT8T1o37zKwFfkFMMELmRsUj8ZHFA6RImup+Bh5IS8kfRCIkAjbS7FkXOse9v
 s6RcnwuSqmm3q09a3op/QKbNoXTk24k4GfnkzTAdHGAduTMBw8DL/Hvi9W4Dic6RQdeEZDueEoz
 9b+0immcz4NrhaeFnLBMQ==
X-Received: by 2002:a05:6a00:348d:b0:842:6849:2180 with SMTP id
 d2e1a72fcca58-84f2e0ccc45mr18569452b3a.37.1786037235448; 
 Thu, 06 Aug 2026 10:27:15 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84f45389e68sm1803272b3a.4.2026.08.06.10.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2026 10:27:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 4/6] target/arm: Implement FGWTE3 traps
Date: Thu,  6 Aug 2026 10:27:07 -0700
Message-ID: <20260806172709.333300-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806172709.333300-1-richard.henderson@linaro.org>
References: <20260806172709.333300-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/op_helper.c     | 40 +++++++++++++++++++++++-----------
 target/arm/tcg/translate-a64.c | 16 +++++++++++++-
 2 files changed, 42 insertions(+), 14 deletions(-)

diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index c4433be2ed..73cae9b9ad 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -1066,13 +1066,15 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
      * Fine-grained traps also are lower priority than undef-to-EL1,
      * higher priority than trap-to-EL3, and we don't care about priority
      * order with other EL2 traps because the syndrome value is the same.
+     *
+     * FGWTE3 traps are exclusively traps to EL3 on registers that are
+     * only accessible to EL3, so there's no possibility of a trap to EL2.
+     * So we can handle these checks here too.
      */
-    if (arm_fgt_active(env, arm_current_el(env))) {
+    if (ri->fgt) {
         uint64_t trapword = 0;
         unsigned int idx = FIELD_EX32(ri->fgt, FGT, IDX);
         unsigned int bitpos = FIELD_EX32(ri->fgt, FGT, BITPOS);
-        bool rev = FIELD_EX32(ri->fgt, FGT, REV);
-        bool nxs = FIELD_EX32(ri->fgt, FGT, NXS);
         bool trapbit;
 
         if (ri->fgt & FGT_EXEC) {
@@ -1085,19 +1087,31 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
             assert(idx < ARRAY_SIZE(env->cp15.fgt_write));
             trapword = env->cp15.fgt_write[idx];
         }
+        trapbit = extract64(trapword, bitpos, 1);
 
-        if (nxs && (arm_hcrx_el2_eff(env) & HCRX_FGTNXS)) {
+        if ((ri->access & ~PL3_RW) == 0) {
             /*
-             * If HCRX_EL2.FGTnXS is 1 then the fine-grained trap for
-             * TLBI maintenance insns does *not* apply to the nXS variant.
+             * EL3 cpreg -- must be FGWTE3, and FGWTE3_EL3 can only be
+             * set from AArch64, and if the feature is enabled.
              */
-            trapbit = 0;
-        } else {
-            trapbit = extract64(trapword, bitpos, 1);
-        }
-        if (trapbit != rev) {
-            res = CP_ACCESS_TRAP_EL2;
-            goto fail;
+            if (trapbit) {
+                res = CP_ACCESS_TRAP_EL3;
+                goto fail;
+            }
+        } else if (arm_fgt_active(env, arm_current_el(env))) {
+            bool nxs = FIELD_EX32(ri->fgt, FGT, NXS);
+            bool rev = FIELD_EX32(ri->fgt, FGT, REV);
+            if (nxs && (arm_hcrx_el2_eff(env) & HCRX_FGTNXS)) {
+                /*
+                 * If HCRX_EL2.FGTnXS is 1 then the fine-grained trap for
+                 * TLBI maintenance insns does *not* apply to the nXS variant.
+                 */
+                trapbit = 0;
+            }
+            if (trapbit != rev) {
+                res = CP_ACCESS_TRAP_EL2;
+                goto fail;
+            }
         }
     }
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 1780490065..0931c92307 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2886,6 +2886,7 @@ static void handle_sys(DisasContext *s, bool isread,
 {
     uint32_t key = ENCODE_AA64_CP_REG(op0, op1, crn, crm, op2);
     const ARMCPRegInfo *ri = get_arm_cp_reginfo(s->cp_regs, key);
+    bool need_helper = false;
     bool need_exit_tb = false;
     bool nv_trap_to_el2 = false;
     bool nv_redirect_reg = false;
@@ -2999,7 +3000,20 @@ static void handle_sys(DisasContext *s, bool isread,
         ri = redirect_cpreg(s, key, isread);
     }
 
-    if (ri->accessfn || (ri->fgt && s->fgt_active)) {
+    if (ri->accessfn) {
+        need_helper = true;
+    } else if (ri->fgt) {
+       /*
+        * EL3-only access means this must be an FGWTE3 trap (which are
+        * always active); otherwise it's an FGT trap to EL2.
+        */
+        if ((ri->access & ~PL3_RW) == 0) {
+            need_helper = dc_isar_feature(aa64_fgwte3, s);
+        } else {
+            need_helper = s->fgt_active;
+        }
+    }
+    if (need_helper) {
         /* Emit code to perform further access permissions checks at
          * runtime; this may result in an exception.
          */
-- 
2.43.0


