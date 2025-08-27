Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C580CA0FF6
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:22:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4jO-0004Lo-1T; Tue, 26 Aug 2025 21:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hT-0001A9-3A
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:11:43 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hG-00008F-DK
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:11:42 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-770530175b2so2644841b3a.3
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756257085; x=1756861885; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O0PnJfSy2eotU6SdGc2/wnLbs4VZtcwWID5Cx1qd6NU=;
 b=SOrihBTNHwx9Opc4dI/NexjasM7Mu4tSNq8R09N2YUQK7Jt1DqcEIr2IXnOscGyXdk
 OqCITqqoi4Udit8Cl5PiNoUkVNGLz8KWIr+a9hYAvmYafUexDdBqXNswam66bQJgRBln
 0ehtci28EqOp9y4UKKGqe3RCHdYUuQWgo0oR1LDu5S+j2m1bUEqKV7hyWY80k/nQMD6Y
 LqFPS9PvJSzv+F/w5yb98KxMOxrUHCEYlqn+C8Uw7KQBl9LRmZ6+LgltzkkzKle5AzzY
 GyW34zTxzvNQpVX3sEiGuiCUblnixnrN415xwcjUzLTlqCWKUMCES8sC0AZYXkUx+YoZ
 6KFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756257085; x=1756861885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O0PnJfSy2eotU6SdGc2/wnLbs4VZtcwWID5Cx1qd6NU=;
 b=Ob7oE2XFGJRPd17SeGY8y1PsECloyyAnmm6pPqQkzPCvjsFhATjiP9iNsMKoUiuLPX
 6Q5C4IFzHOsNOILDLb/6f5oa6P01cKDOs3ve/RlLz290S9oWJ1b2j4ObMIUFCks1DqLU
 itcNkrz6HfxuRZNX4gyPIAayg7/DRhz2sHsK+aGhb5ocM30DtSeJjAbmhwVf50h9ePwT
 VROkZ9QJLXnQzT4DUNABKHsk1dO+FBrxDT94Ks7RFUEixYTfWa6tnXGst99ZIbYTll1G
 1lPoJKLxHZ4g4PqVY0RFuS8SdB3RkAGwQMJQOKK4w7lcbLdP7Rz4ikOypumKpXwiuf46
 FosQ==
X-Gm-Message-State: AOJu0YyE7ThQE4bTQG//0udckQ87xI587YcHaXwRoPtr8EaHbcHg/LnG
 c+7ktsh+j+1Be0+rn5vXsugQIsITRXkh5lvGZtnIsyTLccIX/n8dAVVUofmjZq4Iaak=
X-Gm-Gg: ASbGncvn1KrLpMAaIO+53UCpbcovMoKcB4Z3Ms9yEWcEhJF2odDtuQ2NvETXy8Dpl6P
 V2n4PKptpynejR+VHymO8e+9KhuYNFF3iKFduuBcyQewVUEfU1ZB7sWDHtACKcjwdH40sF/jaVl
 euUP0iAVkBfuPoscUxgnwmZerNAAq9GLmMsyd9VCNRsJEeGHbJTvvgjcMLrOPTroC+fdLYhVhv5
 qE4gWN0lBdhhWMRmjSrY1Jw6CA5c4eqJBUGPC5zIQfKQOM+qUbEb5PPy/HE+jQSIKOSVBezaWPO
 nQg6AYV2Uy1kmZh5HcMCMznJs8vwRN15CK2q6Tx0p9rgLV8ykMCke/vbf1BwxzsIW+BfWhxz6Za
 AWjqrB+kG+00ImFAVCRV3FnF7kw==
X-Google-Smtp-Source: AGHT+IEqqnggI2hpeXVmJw8Py/cfnUPPCI5NssMRZ4HNcCjJc+bveNIe1bxlFukWl5BtURoOmINotw==
X-Received: by 2002:a05:6a00:3d42:b0:771:fe9d:38f0 with SMTP id
 d2e1a72fcca58-771fe9d4399mr4099098b3a.8.1756257084538; 
 Tue, 26 Aug 2025 18:11:24 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-771f2b2d2bfsm4348408b3a.93.2025.08.26.18.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:11:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 44/61] target/arm: Put 128-bit sysregs into a separate list
Date: Wed, 27 Aug 2025 11:04:35 +1000
Message-ID: <20250827010453.4059782-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

Duplicate the cpreg_{indexes,values,array_len} array as
cpreg128_{indexes,values,array_len}.  Similarly for
cpreg_vmstate_{indexes,values,array_len}.

Split the values between the two arrays during
write_cpustate_to_list, write_list_to_cpustate,
count_cpreg, and add_cpreg_to_list.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  19 +++++--
 target/arm/helper.c | 125 +++++++++++++++++++++++++++++++++++---------
 2 files changed, 116 insertions(+), 28 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 919bd3d7eb..a5a8779aba 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -911,25 +911,36 @@ struct ArchCPU {
 
     /* Coprocessor information */
     GHashTable *cp_regs;
-    /* For marshalling (mostly coprocessor) register state between the
+    /*
+     * For marshalling (mostly coprocessor) register state between the
      * kernel and QEMU (for KVM) and between two QEMUs (for migration),
      * we use these arrays.
      */
-    /* List of register indexes managed via these arrays; (full KVM style
-     * 64 bit indexes, not CPRegInfo 32 bit indexes)
+    /*
+     * List of register indexes managed via these arrays (full KVM style
+     * 64 bit indexes, not CPRegInfo 32 bit indexes).  The registers are
+     * segregated by size, with 64-bit registers in cpreg_indexes and
+     * 128-bit registers in cpreg128_indexes.
      */
     uint64_t *cpreg_indexes;
+    uint64_t *cpreg128_indexes;
     /* Values of the registers (cpreg_indexes[i]'s value is cpreg_values[i]) */
     uint64_t *cpreg_values;
+    Int128 *cpreg128_values;
     /* Length of the indexes, values, reset_values arrays */
     int32_t cpreg_array_len;
-    /* These are used only for migration: incoming data arrives in
+    int32_t cpreg128_array_len;
+    /*
+     * These are used only for migration: incoming data arrives in
      * these fields and is sanity checked in post_load before copying
      * to the working data structures above.
      */
     uint64_t *cpreg_vmstate_indexes;
+    uint64_t *cpreg128_vmstate_indexes;
     uint64_t *cpreg_vmstate_values;
+    Int128 *cpreg128_vmstate_values;
     int32_t cpreg_vmstate_array_len;
+    int32_t cpreg128_vmstate_array_len;
 
     DynamicGDBFeatureInfo dyn_sysreg_feature;
     DynamicGDBFeatureInfo dyn_svereg_feature;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3efc14da3a..6f20d3986e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -207,10 +207,11 @@ static bool raw_accessors_invalid(const ARMCPRegInfo *ri)
 bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync)
 {
     /* Write the coprocessor state from cpu->env to the (index,value) list. */
-    int i;
+    int i, n;
     bool ok = true;
 
-    for (i = 0; i < cpu->cpreg_array_len; i++) {
+    n = cpu->cpreg_array_len;
+    for (i = 0; i < n; i++) {
         uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
         const ARMCPRegInfo *ri;
         uint64_t newval;
@@ -220,6 +221,10 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync)
             ok = false;
             continue;
         }
+        if (ri->type & ARM_CP_128BIT) {
+            ok = false;
+            continue;
+        }
         if (ri->type & ARM_CP_NO_RAW) {
             continue;
         }
@@ -247,35 +252,77 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync)
         }
         cpu->cpreg_values[i] = newval;
     }
-    return ok;
-}
 
-bool write_list_to_cpustate(ARMCPU *cpu)
-{
-    int i;
-    bool ok = true;
+    n = cpu->cpreg128_array_len;
+    if (n == 0) {
+        return ok;
+    }
+    assert(!kvm_sync);
 
-    for (i = 0; i < cpu->cpreg_array_len; i++) {
-        uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
-        uint64_t v = cpu->cpreg_values[i];
-        const ARMCPRegInfo *ri;
+    for (i = 0; i < n; i++) {
+        uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg128_indexes[i]);
+        const ARMCPRegInfo *ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
 
-        ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
         if (!ri) {
             ok = false;
             continue;
         }
+        if (!(ri->type & ARM_CP_128BIT)) {
+            ok = false;
+            continue;
+        }
         if (ri->type & ARM_CP_NO_RAW) {
             continue;
         }
-        /*
-         * Write value and confirm it reads back as written
-         * (to catch read-only registers and partially read-only
-         * registers where the incoming migration value doesn't match)
-         */
-        write_raw_cp_reg(&cpu->env, ri, v);
-        if (read_raw_cp_reg(&cpu->env, ri) != v) {
+
+        cpu->cpreg128_values[i] = read_raw_cp_reg128(&cpu->env, ri);
+    }
+    return ok;
+}
+
+bool write_list_to_cpustate(ARMCPU *cpu)
+{
+    int i, n;
+    bool ok = true;
+
+    n = cpu->cpreg_array_len;
+    for (i = 0; i < n; i++) {
+        uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
+        const ARMCPRegInfo *ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
+
+        if (!ri) {
             ok = false;
+        } else if (ri->type & ARM_CP_128BIT) {
+            ok = false;
+        } else if (!(ri->type & ARM_CP_NO_RAW)) {
+            /*
+             * Write value and confirm it reads back as written
+             * (to catch read-only registers and partially read-only
+             * registers where the incoming migration value doesn't match)
+             */
+            uint64_t v = cpu->cpreg_values[i];
+            write_raw_cp_reg(&cpu->env, ri, v);
+            if (read_raw_cp_reg(&cpu->env, ri) != v) {
+                ok = false;
+            }
+        }
+    }
+
+    n = cpu->cpreg128_array_len;
+    for (i = 0; i < n; i++) {
+        uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg128_indexes[i]);
+        const ARMCPRegInfo *ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
+
+        if (!ri) {
+            ok = false;
+        } else if (!(ri->type & ARM_CP_128BIT)) {
+            ok = false;
+        } else if (!(ri->type & ARM_CP_NO_RAW)) {
+            Int128 v = cpu->cpreg128_values[i];
+            write_raw_cp_reg128(&cpu->env, ri, v);
+            if (int128_ne(read_raw_cp_reg128(&cpu->env, ri), v)) {
+                ok = false;
+            }
         }
     }
     return ok;
@@ -288,9 +335,14 @@ static void add_cpreg_to_list(gpointer key, gpointer value, gpointer opaque)
     const ARMCPRegInfo *ri = value;
 
     if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_ALIAS))) {
-        cpu->cpreg_indexes[cpu->cpreg_array_len] = cpreg_to_kvm_id(regidx);
+        uint64_t idx = cpreg_to_kvm_id(regidx);
+
         /* The value array need not be initialized at this point */
-        cpu->cpreg_array_len++;
+        if (ri->type & ARM_CP_128BIT) {
+            cpu->cpreg128_indexes[cpu->cpreg128_array_len++] = idx;
+        } else {
+            cpu->cpreg_indexes[cpu->cpreg_array_len++] = idx;
+        }
     }
 }
 
@@ -300,7 +352,11 @@ static void count_cpreg(gpointer key, gpointer value, gpointer opaque)
     const ARMCPRegInfo *ri = value;
 
     if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_ALIAS))) {
-        cpu->cpreg_array_len++;
+        if (ri->type & ARM_CP_128BIT) {
+            cpu->cpreg128_array_len++;
+        } else {
+            cpu->cpreg_array_len++;
+        }
     }
 }
 
@@ -310,9 +366,10 @@ void init_cpreg_list(ARMCPU *cpu)
      * Initialise the cpreg_tuples[] array based on the cp_regs hash.
      * Note that we require cpreg_tuples[] to be sorted by key ID.
      */
-    int arraylen;
+    int arraylen, array128len;
 
     cpu->cpreg_array_len = 0;
+    cpu->cpreg128_array_len = 0;
     g_hash_table_foreach(cpu->cp_regs, count_cpreg, cpu);
 
     arraylen = cpu->cpreg_array_len;
@@ -330,13 +387,33 @@ void init_cpreg_list(ARMCPU *cpu)
     cpu->cpreg_vmstate_array_len = arraylen;
     cpu->cpreg_array_len = 0;
 
+    array128len = cpu->cpreg128_array_len;
+    if (array128len) {
+        cpu->cpreg128_indexes = g_new(uint64_t, array128len);
+        cpu->cpreg128_values = g_new(Int128, array128len);
+        cpu->cpreg128_vmstate_indexes = g_new(uint64_t, array128len);
+        cpu->cpreg128_vmstate_values = g_new(Int128, array128len);
+    } else {
+        cpu->cpreg128_indexes = NULL;
+        cpu->cpreg128_values = NULL;
+        cpu->cpreg128_vmstate_indexes = NULL;
+        cpu->cpreg128_vmstate_values = NULL;
+    }
+    cpu->cpreg128_vmstate_array_len = array128len;
+    cpu->cpreg128_array_len = 0;
+
     g_hash_table_foreach(cpu->cp_regs, add_cpreg_to_list, cpu);
 
     assert(cpu->cpreg_array_len == arraylen);
+    assert(cpu->cpreg128_array_len == array128len);
 
     if (arraylen) {
         qsort(cpu->cpreg_indexes, arraylen, sizeof(uint64_t), compare_u64);
     }
+    if (array128len) {
+        qsort(cpu->cpreg128_indexes, array128len,
+              sizeof(uint64_t), compare_u64);
+    }
 }
 
 bool arm_pan_enabled(CPUARMState *env)
-- 
2.43.0


