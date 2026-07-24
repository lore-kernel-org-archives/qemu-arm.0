Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946E9C531D0
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Jul 2026 03:08:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wn6F1-0003m1-91; Thu, 23 Jul 2026 23:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wn6Ex-0003jn-VU
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 23:06:24 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wn6Ew-00084i-ES
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 23:06:23 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-38deea72eebso1400517a91.1
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 20:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784862381; x=1785467181; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eE/TYHY9UFAVK4bqbm1zYcnmwH8+c78TUwQIpXcgR04=;
 b=Z3SZah0HgA9AR9kVIZHJtNEUTFuED0tqMTi9vq9xtVRwuTWP6RDYjurfmp5FjedSqo
 1jj867leqeaqe2lvU0+GhqZqx9WBR5u1HT0CsUgha3MfJyjnucfqgaUhTioZnzDLCLL3
 aap8vylc2fisLGiIkbj2a0jryvXaWy63nEUbQgL9RQua4ZJ9F6M6rY1X9MO3YLCFyKb+
 qHg5H/sg81GmyRmtMMB/F7HRz+v+7M0Lq/Cu9Qnbx/KGTj59y+UaeHmMMVr4/0iCY77v
 ISYSNaheNZRoYiJPjou3t/wAsgorxfIA4Utc4n4mjJAqYai+bLQnCGChAUtzEga5TNar
 S8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784862381; x=1785467181;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=eE/TYHY9UFAVK4bqbm1zYcnmwH8+c78TUwQIpXcgR04=;
 b=QVb6fA62+zMuqvDokSUC0T8tJ7uLkcVBwcYmGpqJ/MSTfOM4qilzRoQJkZedM5gstB
 HcswvhF3FAlq7boEofMPeehEgte9d9AaEbK1BmR1roRwaQVmP6GiDy/M+fF0WO8OwXGp
 HBibSUKyXeFz6MoFNeDIiNi4G58AlA4BBXJRkHNmeWV+yu35pmlOAAvfLpwUjQJ/k9Rf
 RdHXlPRtfh8Mes5Gaf0yrEi0Bx69YL7ky0oyRYxuNOH8W1Qfw86WK3035q4th48aSMT5
 h7f4kss4Qx9ZGmeqYL43SW17Pfa0kcT/xs9wUQUpAgbEwMYMlQG7Zq96xXY5w8Ra/BxM
 2HyQ==
X-Gm-Message-State: AOJu0YzGKgS9eIt4edry5qM7A3c1QBCyrbyGC3CiQTOLrLsM3JAhwmm+
 Qkb+VCzUVORKDUJo7T3AfSfUg1DtK2xlNx3DOdQNEEUF00RxOfbOV6/MCebveYtxRks=
X-Gm-Gg: AR+sD11uAQD9Ikmav8Yzsk9XW5YxxADplOx1NnWc0cmNc4qmC5/TEC7TvHBji1ZPXEP
 kc+HIkiwpJCmsNEuQh2yUVsupk4zXfg3QjesyNjE5kAa9JMPaNW9P6lp6ziIywJiXnV24945+YO
 hDcNsLXPf2N5spct+91CIPuhQ0v/u8K5OGnmeYWVVTcdnZE2567NJJ8y7tMFNk9PFVGm3drgbPl
 ykok3icEVxMBroywh1/ppi1eGuACN72fAkax7XmEjzsl+fqb4FtizwNssWD/oIC+U+EGkMTCKSg
 ckiTiJins2GdXLgqrRRXJSb2+IaGOa1RbG1JDy9Jq4nhrH4ANMfH7A4bc0i9urjhZyFJox5aYMM
 h47Xjub0dsWjKzYIaFPV+AJBmqcLAYpnpoxhzMUrcmJXodswFj0opzjDzLVs3IGZVx8dTe/szsG
 Ru3b2Ckch3NuMf/nrmEuDvCXf10q+h2aHupQ==
X-Received: by 2002:a17:90b:1d44:b0:38d:dfd1:7a8 with SMTP id
 98e67ed59e1d1-38ec63e1ed7mr5496543a91.2.1784862380866; 
 Thu, 23 Jul 2026 20:06:20 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f03ad0e0csm750777a91.7.2026.07.23.20.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2026 20:06:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 4/6] target/arm: Implement FGWTE3 traps
Date: Thu, 23 Jul 2026 20:06:14 -0700
Message-ID: <20260724030616.76180-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724030616.76180-1-richard.henderson@linaro.org>
References: <20260724030616.76180-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/op_helper.c     | 36 ++++++++++++++++++++++------------
 target/arm/tcg/translate-a64.c | 13 +++++++++++-
 2 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index c4433be2ed..f040a3fc87 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -1067,12 +1067,10 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
      * higher priority than trap-to-EL3, and we don't care about priority
      * order with other EL2 traps because the syndrome value is the same.
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
@@ -1085,19 +1083,31 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
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
index 1780490065..ff880eab8d 100644
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
@@ -2999,7 +3000,17 @@ static void handle_sys(DisasContext *s, bool isread,
         ri = redirect_cpreg(s, key, isread);
     }
 
-    if (ri->accessfn || (ri->fgt && s->fgt_active)) {
+    if (ri->accessfn) {
+        need_helper = true;
+    } else if (ri->fgt) {
+        if ((ri->access & ~PL3_RW) == 0) {
+            need_helper = (arm_dc_feature(s, ARM_FEATURE_EL3) &&
+                           dc_isar_feature(aa64_fgwte3, s));
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


