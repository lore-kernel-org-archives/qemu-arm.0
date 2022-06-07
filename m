Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2419366lfb;
        Tue, 7 Jun 2022 14:12:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCErEU8ZqZe6kSEnnA0E5mNjj1UafMsZvG822ufvI4lRm86vx5cdK6eoxcrZ/ahV5LCcvH
X-Received: by 2002:a05:622a:4:b0:2fb:4e40:e82d with SMTP id x4-20020a05622a000400b002fb4e40e82dmr24876353qtw.362.1654636325348;
        Tue, 07 Jun 2022 14:12:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654636325; cv=none;
        d=google.com; s=arc-20160816;
        b=NA9qDc5IjckBY1pmTxdVWC5r0tmYijySQnNu5b/G79fEN7QWtbtEdxtohLYl73fDzx
         h5MH7bRCVaYr1tDc6XEDm28zuR2RCsRoo0l2T7sLITAg9FRtSFL6qliwWcg9Dd0+X5Fg
         OBrTsQBHURGaot0dcgwD9LT9XQHnwlhS9HHQhsCRbkkwL2m+H3D5dKBpgTb44az9pAP1
         JDOyY7wTJA8fp3TwYQFvUCwMxUpZSpFCeBAc1/lJGIOxKeqS7eu0C8GG4SgqQEQOGNvk
         H9zgCQFPK9mLFgKj3SIfhj5RI9CmTyuF0iWW1sYrzGMBQB2Jgz+dinHkLJznWS4WxtgU
         K7vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=03rd4A4qLn1D1mjrmymRetC77V7qJ8iA+zPBzz1Ln/A=;
        b=FQc5lSuYLjSfZf4AzgUhLqVeZEIhmwcwrf27lGk4PqRg8wQR1pIKzgTw5UOSTLCyfy
         HMyCgb6CkdJltwalDDj2Hayg7wgglSD6htJm+jlme6DmScce3FsCGpMFTDgZHxJvEHu6
         cwHSkqaw/p79JzU3uT9yllclvTvWzT6/y13nxlLRefOUp5qBzIjWc0m0VT8Om2iFPfmJ
         GEsD3E3SZokoB3Ni6ilm5ZI7PP2kJMTQwynlQZvSbmUkp6G/SGUaa6Il4NlPJVH+Zz4C
         QfTFtSxFwN8d4P+yBWCZC7HAFy2ZhySE7q9lcFI3FIH7Id0H/Zv4B3V/IagU11JzaGkU
         4DKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AFPsI8EM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i26-20020ae9ee1a000000b006a6b3f6ca4asi4334245qkg.376.2022.06.07.14.12.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 14:12:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AFPsI8EM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nygUd-0007lx-Vu
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 17:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfta-00008X-Dc
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:46 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:45963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftR-0007R7-7G
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:46 -0400
Received: by mail-pg1-x536.google.com with SMTP id 184so1002498pga.12
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=03rd4A4qLn1D1mjrmymRetC77V7qJ8iA+zPBzz1Ln/A=;
 b=AFPsI8EMP2OouL7V8nW2DcLpV/7xF6hbSsvSGZZNfAPCl3ifNKm0u1kXZoIhBOl9sD
 GT7/aX+zj4EKWBC9yLZo1eBvcbkfRVXtj5ak3AyKkhZO4nyqqI2/Rd3jZnnxT7eQtk0u
 rjGyq7ymexCL8VUMq2CuaktTag6XshuckvdkRZrmIxDCqnKZVEJCfxAY2UWopiv9MoVr
 3+WKWjzqfvjM07deFGCC05FlpPj/GoJKvWQ6Im/JBUlqmU6wTrYOkdoRLeTLzVH35HTY
 GjfbIxzZ2y3zL2DnfBxnBVbq1mXURPGZxjmEbsufuosY5AZvFEiMa7h199kAZJoqJfZb
 mFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=03rd4A4qLn1D1mjrmymRetC77V7qJ8iA+zPBzz1Ln/A=;
 b=T9BTq7CNY2d/DVDBBC9VSY11PAgKuPtLw1F82JOH4hPoyr7jdZ/QSm9eT8xrCuaC+R
 hku9laHD+695sOxJPNkVvRSZAWoDBQKKRKMuEZrx3xz25m29U0VaQypocwmc5N5LX3zm
 zl1zAXLxiThneC9Zs7NlrwbwOZc/faPXaN8FJqiCjV0bUXP/JJSyVmk/1UazqUWpg1vh
 D5WdkuBI9V4iUs7qYQyJY+TjouPAStR0uOJy0lRdu1xNsZSaenTUaKj5oq0NZXSWEdpU
 PTlxgOBQ3Ac3Qvks2BGXwM/u4qD5krbYduEsJ6TbpXCXwBFaLBj5ODWJcjdpwUXXivGZ
 y6bg==
X-Gm-Message-State: AOAM533pGJ9QFdNJmSn3hvIpcjeU5OTtdBV0GsN8gIy5CAiijF0yijy/
 B8liUxYvol5U0VzF3vorSfBnFg==
X-Received: by 2002:a63:2b8b:0:b0:3fc:c510:7941 with SMTP id
 r133-20020a632b8b000000b003fcc5107941mr27669275pgr.47.1654634015606; 
 Tue, 07 Jun 2022 13:33:35 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 30/71] target/arm: Implement SMSTART, SMSTOP
Date: Tue,  7 Jun 2022 13:32:25 -0700
Message-Id: <20220607203306.657998-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
X-TUID: DCi3UuA3XxA4

These two instructions are aliases of MSR (immediate).
Use the two helpers to properly implement svcr_write.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  1 +
 target/arm/helper-sme.h    | 21 +++++++++++++
 target/arm/helper.h        |  1 +
 target/arm/helper.c        |  6 ++--
 target/arm/sme_helper.c    | 61 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c | 24 +++++++++++++++
 target/arm/meson.build     |  1 +
 7 files changed, 112 insertions(+), 3 deletions(-)
 create mode 100644 target/arm/helper-sme.h
 create mode 100644 target/arm/sme_helper.c

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ef374eefe8..e7ec03a8a7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1106,6 +1106,7 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
 void aarch64_add_sve_properties(Object *obj);
 void aarch64_add_pauth_properties(Object *obj);
+void arm_reset_sve_state(CPUARMState *env);
 
 /*
  * SVE registers are encoded in KVM's memory in an endianness-invariant format.
diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
new file mode 100644
index 0000000000..3bd48c235f
--- /dev/null
+++ b/target/arm/helper-sme.h
@@ -0,0 +1,21 @@
+/*
+ *  AArch64 SME specific helper definitions
+ *
+ *  Copyright (c) 2022 Linaro, Ltd
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+DEF_HELPER_FLAGS_2(set_pstate_sm, TCG_CALL_NO_RWG, void, env, i32)
+DEF_HELPER_FLAGS_2(set_pstate_za, TCG_CALL_NO_RWG, void, env, i32)
diff --git a/target/arm/helper.h b/target/arm/helper.h
index b1334e0c42..5bca7255f1 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1020,6 +1020,7 @@ DEF_HELPER_FLAGS_6(gvec_bfmlal_idx, TCG_CALL_NO_RWG,
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
+#include "helper-sme.h"
 #endif
 
 #include "helper-mve.h"
diff --git a/target/arm/helper.c b/target/arm/helper.c
index bec7e47b78..e065a1deb8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6370,9 +6370,9 @@ static CPAccessResult access_esm(CPUARMState *env, const ARMCPRegInfo *ri,
 static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
-    value &= R_SVCR_SM_MASK | R_SVCR_ZA_MASK;
-    /* TODO: Side effects. */
-    env->svcr = value;
+    helper_set_pstate_sm(env, FIELD_EX64(value, SVCR, SM));
+    helper_set_pstate_za(env, FIELD_EX64(value, SVCR, ZA));
+    arm_rebuild_hflags(env);
 }
 
 static void smcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
new file mode 100644
index 0000000000..b215725594
--- /dev/null
+++ b/target/arm/sme_helper.c
@@ -0,0 +1,61 @@
+/*
+ * ARM SME Operations
+ *
+ * Copyright (c) 2022 Linaro, Ltd.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+#include "exec/helper-proto.h"
+
+/* ResetSVEState */
+void arm_reset_sve_state(CPUARMState *env)
+{
+    memset(env->vfp.zregs, 0, sizeof(env->vfp.zregs));
+    /* Recall that FFR is stored as pregs[16]. */
+    memset(env->vfp.pregs, 0, sizeof(env->vfp.pregs));
+    vfp_set_fpcr(env, 0x0800009f);
+}
+
+void helper_set_pstate_sm(CPUARMState *env, uint32_t i)
+{
+    if (i == FIELD_EX64(env->svcr, SVCR, SM)) {
+        return;
+    }
+    env->svcr ^= R_SVCR_SM_MASK;
+    arm_reset_sve_state(env);
+}
+
+void helper_set_pstate_za(CPUARMState *env, uint32_t i)
+{
+    if (i == FIELD_EX64(env->svcr, SVCR, ZA)) {
+        return;
+    }
+    env->svcr ^= R_SVCR_ZA_MASK;
+
+    /*
+     * ResetSMEState.
+     *
+     * SetPSTATE_ZA zeros on enable and disable.  We can zero this only
+     * on enable: while disabled, the storage is inaccessible and the
+     * value does not matter.  We're not saving the storage in vmstate
+     * when disabled either.
+     */
+    if (i) {
+        memset(env->zarray, 0, sizeof(env->zarray));
+    }
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index fdc035ad9a..40f2e53983 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1761,6 +1761,30 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         }
         break;
 
+    case 0x1b: /* SVCR* */
+        if (!dc_isar_feature(aa64_sme, s) || crm < 2 || crm > 7) {
+            goto do_unallocated;
+        }
+        if (sme_access_check(s)) {
+            bool i = crm & 1;
+            bool changed = false;
+
+            if ((crm & 2) && i != s->pstate_sm) {
+                gen_helper_set_pstate_sm(cpu_env, tcg_constant_i32(i));
+                changed = true;
+            }
+            if ((crm & 4) && i != s->pstate_za) {
+                gen_helper_set_pstate_za(cpu_env, tcg_constant_i32(i));
+                changed = true;
+            }
+            if (changed) {
+                gen_rebuild_hflags(s);
+            } else {
+                s->base.is_jmp = DISAS_NEXT;
+            }
+        }
+        break;
+
     default:
     do_unallocated:
         unallocated_encoding(s);
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 50f152214a..02c91f72bb 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -47,6 +47,7 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'mte_helper.c',
   'pauth_helper.c',
   'sve_helper.c',
+  'sme_helper.c',
   'translate-a64.c',
   'translate-sve.c',
 ))
-- 
2.34.1

