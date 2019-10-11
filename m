Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp862263wrm;
        Fri, 11 Oct 2019 06:49:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzwExjmInrDabeWWgs3yzOyOSuL6PH2kjSByrSSO1QHyCQ4MFnbdgmbx5dxbvLIkgKNLX5P
X-Received: by 2002:ae9:c307:: with SMTP id n7mr15513608qkg.185.1570801772844;
        Fri, 11 Oct 2019 06:49:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570801772; cv=none;
        d=google.com; s=arc-20160816;
        b=pOV2B3ed0sS1/x0x1SJTaI4o7a7/p/GYcq2csML4IQJJ/hsWa8RXvqiO9OJVt9lggd
         jvy1jamTK4fJFVA321bK8bSm4sztpCXVK+OxDAqmsrl0YdbUxsEDABUZ/uGq8ANFtNJj
         B9qPQXF/CXeW2ZyQDUCVwtzkYnk2pjX17U+noMo305z+QuXdyEWH6A8GYGL1MXxv8PWq
         66V7KisAVkDVaIR1BiGw6GY51VA+8r6bZ85oHKugMjM2VKGeoEGCsD2uBfHN/YG26Gn+
         XwlPb3L+YViEW1yGS19nBUi3tMNEA9f6/Yx52veqSFTqGO46e9b+F1pZMfdX3FjixqT0
         vaHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=7MAQa7mXXpZsLOEqim7Dns+DUUnYD+go50SC8EIGDGk=;
        b=Kl2CKedj7cRyRQaf9ltefwjalAyDvtq4AZOzuw1CimGTkVqjPkhns0JU8kbZ+upKdi
         ABZNC+oLbzFuQKNiWXP2ESaAcXfG9BcT6S56UU6edJRmGbpTXvxKW+DjSDvy5zCbWMPm
         2BTLFq7OEONKN85uJNWTaoh/I3/QkEauh+/IYAenagQuDOj1lClkpkEi2o/562BAD6/V
         fsHDzZN+plSpuIHZh/CPKICyaK8uVGZRlKIrW1VDlfK+etoYLtV2eaxADcx4U6GQPPKp
         8Xah2r286x0s/mzy1IgIqSG0M3JOrcm82A7Lcb9LBYYp53WMZjIyPP9KW64G4PkBGp+M
         CllA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TLSCcxPs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n41si8865342qvg.103.2019.10.11.06.49.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 06:49:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TLSCcxPs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIvIR-0004EX-Nx
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 09:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38716)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvIC-00049N-ON
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:49:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvIA-0003WB-Sa
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:49:16 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:38688)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIvIA-0003W5-IH
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:49:14 -0400
Received: by mail-yb1-xb35.google.com with SMTP id r68so3115090ybf.5
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 06:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7MAQa7mXXpZsLOEqim7Dns+DUUnYD+go50SC8EIGDGk=;
 b=TLSCcxPsU1xpSiz5XqtEWK98olRuZv6jqle8hw1NVLcMHZoeyIWARAX/QxVvs7+YVQ
 X4KjmFf3LrIGUbLdzsPxKkbHtm1y39Tu6ssKrdOkgQ7jOgQZcPEUO6a4EI1byh3mhdgZ
 +DgaqHnwsDUj2Cwqf8rLSLfOhQMxnuKTNCu4TDCxjP/v4B/Su2kYtBqVIxE6rVO3U8d0
 nuagDoC8zEUEgeKC5ESh38gcsGkb2CzL67SrwpNLWF7bB5vQbNFqZqCE4kTyL10xN4Gh
 bnKYernnBNVKijrJ0Agwvkev3dT2Q3Kk8Ks8DmPuaE44gcp9cIkeQj2UlkpnYoVJLaee
 6cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7MAQa7mXXpZsLOEqim7Dns+DUUnYD+go50SC8EIGDGk=;
 b=TE0Ku+NwECQa/zvBlbLB3wngU83qQxByKKjlvTx43LwEfIWPzy9lQRgYDyE1CLXdvO
 FtSHh4nMLLChqsJdlQn9xfTEmAfZHuuw0BfaAbW1pi33yZgxU2aqZ09kQw+NySGfUhK1
 67IDyo/5t2rXpttVnIOfEipl7YjB6aYo9mOIEASukwIxM1CS0ArURM/Axn6ryJHAuZ6a
 zt+n7r04aR2TGJ/TM8oFq6X2XSuNf5Vn8/G112g7pI2LOo8zZWEM8GWiyLinnnGdvHdm
 jlx6sRnmVhuZLcx2scxPlBS45WpskvHjNMRbbJDqfpQxpvwIaJzPGeTt1qyUDGTBJhAs
 h6Vw==
X-Gm-Message-State: APjAAAU2GElZ4SMzbv8nZX7HglNxkrLz3BXeUMiU5bY8qeNxZmF09GP9
 /sY9upxS4giiUlyniqCmYbHFWg==
X-Received: by 2002:a25:3b51:: with SMTP id i78mr10621264yba.186.1570801753553; 
 Fri, 11 Oct 2019 06:49:13 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id f68sm2534000ywb.96.2019.10.11.06.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 06:49:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/22] target/arm: Add helper_mte_check{1,2,3}
Date: Fri, 11 Oct 2019 09:47:26 -0400
Message-Id: <20191011134744.2477-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011134744.2477-1-richard.henderson@linaro.org>
References: <20191011134744.2477-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b35
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5OzR67FfK6IM

Implements the rules of "PE generation of Checked and Unchecked
accesses" which aren't already implied by TB_FLAGS_MTE_ACTIVE.
Implements the rules of "PE handling of Tag Check Failure".

Does not implement tag physical address space, so all operations
reduce to unchecked so far.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix TFSR update.
v3: Split helper_mte_check per {1,2} IAs; take tbi data from translate.
v5: Split helper_mte_check3, the only one that needs a runtime check for tbi.
---
 target/arm/helper-a64.h    |   4 +
 target/arm/mte_helper.c    | 167 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c |  15 +++-
 target/arm/Makefile.objs   |   1 +
 4 files changed, 186 insertions(+), 1 deletion(-)
 create mode 100644 target/arm/mte_helper.c

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index a915c1247f..a82e21f15a 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -102,3 +102,7 @@ DEF_HELPER_FLAGS_3(autda, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(autdb, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_2(xpaci, TCG_CALL_NO_RWG_SE, i64, env, i64)
 DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
+
+DEF_HELPER_FLAGS_2(mte_check1, TCG_CALL_NO_WG, i64, env, i64)
+DEF_HELPER_FLAGS_2(mte_check2, TCG_CALL_NO_WG, i64, env, i64)
+DEF_HELPER_FLAGS_3(mte_check3, TCG_CALL_NO_WG, i64, env, i64, i32)
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
new file mode 100644
index 0000000000..bbb90cbe86
--- /dev/null
+++ b/target/arm/mte_helper.c
@@ -0,0 +1,167 @@
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
+    ARMMMUIdx stage1 = arm_stage1_mmu_idx(env);
+    int ptr_tag, mem_tag;
+
+    /*
+     * If TCMA is enabled, then physical tag 0 is unchecked.
+     * Note the rules in D6.8.1 are written with logical tags, where
+     * the corresponding physical tag rule is simpler: equal to 0.
+     * We will need the physical tag below anyway.
+     */
+    ptr_tag = allocation_tag_from_addr(dirty_ptr);
+    if (ptr_tag == 0) {
+        ARMVAParameters p = aa64_va_parameters(env, dirty_ptr, stage1, true);
+        if (p.tcma) {
+            return clean_ptr;
+        }
+    }
+
+    /*
+     * If an access is made to an address that does not provide tag
+     * storage, the result is IMPLEMENTATION DEFINED.  We choose to
+     * treat the access as unchecked.
+     * This is similar to MemAttr != Tagged, which are also unchecked.
+     */
+    mem_tag = get_allocation_tag(env, clean_ptr, ra);
+    if (mem_tag < 0) {
+        return clean_ptr;
+    }
+
+    /* If the tags do not match, the tag check operation fails.  */
+    if (unlikely(ptr_tag != mem_tag)) {
+        int el, regime_el, tcf;
+        uint64_t sctlr;
+
+        el = arm_current_el(env);
+        regime_el = (el ? el : 1);   /* TODO: ARMv8.1-VHE EL2&0 regime */
+        sctlr = env->cp15.sctlr_el[regime_el];
+        if (el == 0) {
+            tcf = extract64(sctlr, 38, 2);
+        } else {
+            tcf = extract64(sctlr, 40, 2);
+        }
+
+        switch (tcf) {
+        case 1:
+            /*
+             * Tag check fail causes a synchronous exception.
+             *
+             * In restore_state_to_opc, we set the exception syndrome
+             * for the load or store operation.  Do that first so we
+             * may overwrite that with the syndrome for the tag check.
+             */
+            cpu_restore_state(env_cpu(env), ra, true);
+            env->exception.vaddress = dirty_ptr;
+            raise_exception(env, EXCP_DATA_ABORT,
+                            syn_data_abort_no_iss(el != 0, 0, 0, 0, 0, 0x11),
+                            exception_target_el(env));
+            /* noreturn; fall through to assert anyway */
+
+        case 0:
+            /*
+             * Tag check fail does not affect the PE.
+             * We eliminate this case by not setting MTE_ACTIVE
+             * in tb_flags, so that we never make this runtime call.
+             */
+            g_assert_not_reached();
+
+        case 2:
+            /* Tag check fail causes asynchronous flag set.  */
+            env->cp15.tfsr_el[regime_el] |= 1 << select;
+            break;
+
+        default:
+            /* Case 3: Reserved. */
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "Tag check failure with SCTLR_EL%d.TCF "
+                          "set to reserved value %d\n", regime_el, tcf);
+            break;
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
+ * It is known that TBI is enabled on entry.
+ */
+uint64_t HELPER(mte_check2)(CPUARMState *env, uint64_t dirty_ptr)
+{
+    uint32_t select = extract64(dirty_ptr, 55, 1);
+    uint64_t clean_ptr = sextract64(dirty_ptr, 0, 56);
+    return do_mte_check(env, dirty_ptr, clean_ptr, select, GETPC());
+}
+
+/*
+ * Perform check in translation regime w/two IA ranges.
+ * The TBI argument is the concatenation of TBI1:TBI0.
+ */
+uint64_t HELPER(mte_check3)(CPUARMState *env, uint64_t dirty_ptr, uint32_t tbi)
+{
+    uint32_t select = extract64(dirty_ptr, 55, 1);
+    uint64_t clean_ptr = sextract64(dirty_ptr, 0, 56);
+
+    if ((tbi >> select) & 1) {
+        return do_mte_check(env, dirty_ptr, clean_ptr, select, GETPC());
+    } else {
+        /* TBI is disabled; the access is unchecked.  */
+        return dirty_ptr;
+    }
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 62bdf50796..8e4fea6b4c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -214,7 +214,20 @@ static void gen_a64_set_pc(DisasContext *s, TCGv_i64 src)
 static TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr)
 {
     TCGv_i64 clean = new_tmp_a64(s);
-    gen_top_byte_ignore(s, clean, addr, s->tbid);
+
+    /* Note that s->mte_active already includes a check for s->tbid != 0. */
+    if (!s->mte_active) {
+        gen_top_byte_ignore(s, clean, addr, s->tbid);
+    } else if (!regime_has_2_ranges(s->mmu_idx)) {
+        gen_helper_mte_check1(clean, cpu_env, addr);
+    } else if (s->tbid == 3) {
+        /* Both TBI1:TBI0 are set; no need to check at runtime. */
+        gen_helper_mte_check2(clean, cpu_env, addr);
+    } else {
+        TCGv_i32 tbi = tcg_const_i32(s->tbid);
+        gen_helper_mte_check3(clean, cpu_env, addr, tbi);
+        tcg_temp_free_i32(tbi);
+    }
     return clean;
 }
 
diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index cf26c16f5f..8fd7d086c8 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -67,3 +67,4 @@ obj-$(CONFIG_SOFTMMU) += psci.o
 obj-$(TARGET_AARCH64) += translate-a64.o helper-a64.o
 obj-$(TARGET_AARCH64) += translate-sve.o sve_helper.o
 obj-$(TARGET_AARCH64) += pauth_helper.o
+obj-$(TARGET_AARCH64) += mte_helper.o
-- 
2.17.1

