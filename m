Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp109288wrp;
        Mon, 11 Feb 2019 16:01:58 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZtZ2FQhMf5AU4uxtXKwI5fvHvyeLb7M1LAoHas1Ore+4Z3tRGO+p+DvmSodDjfSac7PMwW
X-Received: by 2002:a25:b187:: with SMTP id h7mr684737ybj.192.1549929718304;
        Mon, 11 Feb 2019 16:01:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549929718; cv=none;
        d=google.com; s=arc-20160816;
        b=BPqhtRX7b2cKl+Y1icY/vQ9ktAGKJaw6KhX8jnddXofnMbUV5xofexv6pP1+fd8Asq
         POm5JLcoa94K3LstOGIainQVSkFtJIPiJNlPsR2mRZMLkQYc1zCWLHpKUvf9sOzIoUAG
         +kLUitgs/UqaoTRHkWxXmo7Z0PNqYpSoUjggTdWucslpr22oUJPo49dH44wbxebQbzDG
         v4K7LTJ2a/eNtQ6A8SNpgXbDxpMoZwB/mlq5FrgfgSXLd2mP4kFMU+s4Oy/9vJCIIFK8
         /2cr7m/d4R4cCIXuM1pMsd/v9COhH69vTuc/+0/sJgoseW+4QVMdslqoVHyEGG90P0Cn
         ji2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=2OQxyPmxfrr4UMT/ZUzdlEYMHFpvU0QnUKFRrfWrKM0=;
        b=eXKoFVjYUYhbFEOXU+GqG2vn7rmhLMge+73o/GmNp7RztShyNkG5mi6PKR56sPLW+Y
         4zkhpolL2aokzGwBQNqi/r7Hjasus3F80OsSqyjoQxVX9iguyRZkZtDIxbg2tEQGvGFK
         BEaycUFSUUajQXH/lAx+DwzkzKnirxfH8ZLy1XlXrzvzO81adg3x7DM5DccVdZeOzoa/
         0hUZMIItZbWSHyHBFC+HM3zbV2shey5nIMMEn9VMukfEZPodzQaoZnJF4Of42hYn0C1S
         g1sQQuKzSRnKjfyo6wXo4bPQ1Awkp3N6lhqkVM2w4MkT8vodxHmiXWE6FLrQKFl03jOv
         fXZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SllnUeWO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o18si6797535yba.376.2019.02.11.16.01.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 16:01:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SllnUeWO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58281 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLWP-00039u-MN
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 19:01:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38402)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOc-0005lI-2n
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOJ-0004i9-Li
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:43 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:33852)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLOG-0004Q9-SG
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:35 -0500
Received: by mail-pl1-x62b.google.com with SMTP id w4so344016plz.1
	for <qemu-devel@nongnu.org>; Mon, 11 Feb 2019 15:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2OQxyPmxfrr4UMT/ZUzdlEYMHFpvU0QnUKFRrfWrKM0=;
	b=SllnUeWOgs4ErlzAnI06C1Py7si6kTzKzUuVbuxV4BwYlUtFsSZ+bb0SJ/+s92b+dy
	peh4X0dvnuLW74kjBHUQo8eljmgwEPQPHp0MCeDyxRVOENM6swxXTub2S3V7OGPAvJgk
	P7/tAfGmCF/LnfXLEuxXbB1f7adKOAZ5rkmys/wld468tU43uTHNyqX0U6W7O+GNPSsu
	ZVxpNiyXwnbUdHyZk3fBIdsz7Bd+acpq1SBC+MLF7Lw0vyLRWp5tjZWBH/Ul0vGf608n
	eJ7YRxhhT06QmkM0yqSo+xgfn/pHI3QjfB6Rpb6PiESvVvg3AiIzEJ3mQkggLm3QvBMq
	vinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2OQxyPmxfrr4UMT/ZUzdlEYMHFpvU0QnUKFRrfWrKM0=;
	b=HPYvwoi7UwnUI6VOpfx9iqgqmP1DYUs7WFXJSYzEAct4W7h2cqJgoBNcR/oCdizaGx
	Ud0mzqiNgZ06odU6+eY1BTi54BemNXj1LcADm70Qs6i5Uh4e5RlFiE4nskhyU66qXz2w
	LSxakr6P5vmONMGfT6BZhIKXLVO8qh3C5c5UzRyvGOwtwUQeO9VWL+VbUVIl3q0U4q/w
	lN3O1CQjvlF2DzO6+denEnR+/YPyaVaemu3vOrROnuR/8qAxFLEextqOyfcU4zVjf7La
	cCgoTIr/GjUayQl3Mk6tg2dF1hDoOx1FwoFdsupiXgudB5QR7sC3CTypXTC7Dn28gQFf
	pAwA==
X-Gm-Message-State: AHQUAub9eSx1MpGpOAVK+bnfPoQ34KvQcdqi5C9BXD+GIDkIk12nsHP6
	rwEnj8zo0BsCOsTRBo8jtWIkywk/zPo=
X-Received: by 2002:a17:902:b10c:: with SMTP id
	q12mr939990plr.210.1549929191807; 
	Mon, 11 Feb 2019 15:53:11 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:38 -0800
Message-Id: <20190211235258.542-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62b
Subject: [Qemu-devel] [PATCH v3 08/28] target/arm: Add helper_mte_check{1, 2}
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: duV5MwG1yTsf

Implements the rules of "PE generation of Checked and Unchecked
accesses" which aren't already implied by TB_FLAGS_MTE_ACTIVE.
Implements the rules of "PE handling of Tag Check Failure".

Does not implement tag physical address space, so all operations
reduce to unchecked so far.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix TFSR update.
v3: Split helper_mte_check per {1,2} IAs; take tbi data from translate.
---
 target/arm/helper-a64.h    |   3 +
 target/arm/mte_helper.c    | 133 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c |  14 +++-
 target/arm/Makefile.objs   |   2 +-
 4 files changed, 150 insertions(+), 2 deletions(-)
 create mode 100644 target/arm/mte_helper.c

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index a915c1247f..c88797a922 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -102,3 +102,6 @@ DEF_HELPER_FLAGS_3(autda, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(autdb, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_2(xpaci, TCG_CALL_NO_RWG_SE, i64, env, i64)
 DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
+
+DEF_HELPER_FLAGS_2(mte_check1, TCG_CALL_NO_WG, i64, env, i64)
+DEF_HELPER_FLAGS_3(mte_check2, TCG_CALL_NO_WG, i64, env, i64, i32)
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
new file mode 100644
index 0000000000..bcd82a9be0
--- /dev/null
+++ b/target/arm/mte_helper.c
@@ -0,0 +1,133 @@
+/*
+ * ARM v8.5-MemTag Operations
+ *
+ * Copyright (c) 2019 Linaro, Ltd.
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
+#include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
+#include "exec/helper-proto.h"
+
+
+static int get_allocation_tag(CPUARMState *env, uint64_t ptr, uintptr_t ra)
+{
+    /* Tag storage not implemented.  */
+    return -1;
+}
+
+static int allocation_tag_from_addr(uint64_t ptr)
+{
+    ptr += 1ULL << 55;  /* carry ptr[55] into ptr[59:56].  */
+    return extract64(ptr, 56, 4);
+}
+
+/*
+ * Perform a checked access for MTE.
+ * On arrival, TBI is known to enabled, as is allocation_tag_access_enabled.
+ */
+static uint64_t do_mte_check(CPUARMState *env, uint64_t dirty_ptr,
+                             uint64_t clean_ptr, uint32_t select,
+                             uintptr_t ra)
+{
+    int ptr_tag, mem_tag;
+
+    /*
+     * If TCMA is enabled, then physical tag 0 is unchecked.
+     * Note the rules R0076 & R0077 are written with logical tags,
+     * and we need the physical tag below anyway.
+     */
+    ptr_tag = allocation_tag_from_addr(dirty_ptr);
+    if (ptr_tag == 0) {
+        ARMMMUIdx stage1 = arm_stage1_mmu_idx(env);
+        ARMVAParameters p = aa64_va_parameters(env, dirty_ptr, stage1, true);
+        if (p.tcma) {
+            return clean_ptr;
+        }
+    }
+
+    /*
+     * If an access is made to an address that does not provide tag storage,
+     * the result is implementation defined (R0006).  We choose to treat the
+     * access as unchecked.
+     * This is similar to MemAttr != Tagged, which are also unchecked.
+     */
+    mem_tag = get_allocation_tag(env, clean_ptr, ra);
+    if (mem_tag < 0) {
+        return clean_ptr;
+    }
+
+    /* If the tags do not match, the tag check operation fails.  */
+    if (unlikely(ptr_tag != mem_tag)) {
+        int tcf, el = arm_current_el(env);
+
+        if (el == 0) {
+            /* FIXME: ARMv8.1-VHE S2 translation regime.  */
+            tcf = extract64(env->cp15.sctlr_el[1], 38, 2);
+        } else {
+            tcf = extract64(env->cp15.sctlr_el[el], 40, 2);
+        }
+        if (tcf == 1) {
+            /*
+             * Tag check fail causes a synchronous exception.
+             *
+             * In restore_state_to_opc, we set the exception syndrome
+             * for the load or store operation.  Do that first so we
+             * may overwrite that with the syndrome for the tag check.
+             */
+            cpu_restore_state(ENV_GET_CPU(env), ra, true);
+            env->exception.vaddress = dirty_ptr;
+            raise_exception(env, EXCP_DATA_ABORT,
+                            syn_data_abort_no_iss(el != 0, 0, 0, 0, 0, 0x11),
+                            exception_target_el(env));
+        } else if (tcf == 2) {
+            /* Tag check fail causes asynchronous flag set.  */
+            env->cp15.tfsr_el[el] |= 1 << select;
+        }
+    }
+
+    return clean_ptr;
+}
+
+/*
+ * Perform check in translation regime w/single IA range.
+ * It is known that TBI is enabled on entry.
+ */
+uint64_t HELPER(mte_check1)(CPUARMState *env, uint64_t dirty_ptr)
+{
+    uint64_t clean_ptr = extract64(dirty_ptr, 0, 56);
+    return do_mte_check(env, dirty_ptr, clean_ptr, 0, GETPC());
+}
+
+/*
+ * Perform check in translation regime w/two IA ranges.
+ * The TBI argument is the concatenation of TBI1:TBI0.  We have filtered
+ * TBI==0, but still need to check the IA range being referenced.
+ */
+uint64_t HELPER(mte_check2)(CPUARMState *env, uint64_t dirty_ptr, uint32_t tbi)
+{
+    uint32_t select = extract64(dirty_ptr, 55, 1);
+
+    if ((tbi >> select) & 1) {
+        uint64_t clean_ptr = sextract64(dirty_ptr, 0, 56);
+        return do_mte_check(env, dirty_ptr, clean_ptr, select, GETPC());
+    } else {
+        /* TBI is disabled; the access is unchecked.  */
+        return dirty_ptr;
+    }
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f397603688..1465c52a05 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -343,7 +343,19 @@ static void gen_a64_set_pc(DisasContext *s, TCGv_i64 src)
 static TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr)
 {
     TCGv_i64 clean = new_tmp_a64(s);
-    gen_top_byte_ignore(s, clean, addr, s->tbid);
+
+    if (s->mte_active) {
+        if (s->current_el >= 2) {
+            /* FIXME: ARMv8.1-VHE S2 translation regime.  */
+            gen_helper_mte_check1(clean, cpu_env, addr);
+        } else {
+            TCGv_i32 tbi = tcg_const_i32(s->tbid);
+            gen_helper_mte_check2(clean, cpu_env, addr, tbi);
+            tcg_temp_free_i32(tbi);
+        }
+    } else {
+        gen_top_byte_ignore(s, clean, addr, s->tbid);
+    }
     return clean;
 }
 
diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 1a4fc06448..c86cb1af5c 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -8,7 +8,7 @@ obj-y += translate.o op_helper.o helper.o cpu.o
 obj-y += neon_helper.o iwmmxt_helper.o vec_helper.o
 obj-y += gdbstub.o
 obj-$(TARGET_AARCH64) += cpu64.o translate-a64.o helper-a64.o gdbstub64.o
-obj-$(TARGET_AARCH64) += pauth_helper.o
+obj-$(TARGET_AARCH64) += pauth_helper.o mte_helper.o
 obj-y += crypto_helper.o
 obj-$(CONFIG_SOFTMMU) += arm-powerctl.o
 
-- 
2.17.2

