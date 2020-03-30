Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp3195247lfi;
        Mon, 30 Mar 2020 14:06:49 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtR61s/lUkpG8DJ75/R1xTjXvIvTBHNlujp6WYdhgQWrizAIspIbtSBj60zGCHcN0WHnoo2
X-Received: by 2002:a05:620a:100d:: with SMTP id z13mr1962630qkj.153.1585602408902;
        Mon, 30 Mar 2020 14:06:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585602408; cv=none;
        d=google.com; s=arc-20160816;
        b=DRINSY3w25aLjFGQt0GO5rgpsSoEOr7Ho7rjmWPu6djK2uylJ2I/R5FGRX3n5ak2vD
         yHDddH41u/oYQvf+PeppcYtJ/NKCpQP/IRNmAC2IH8FDegNX9FxgVork6xBfLdJRgc3L
         +/hGTWT6bQPyTyxjchaTigZYMcYGX7HwIjX5CEgyENVH+xBOUmg+wH5eOSyt+iJwy+//
         GzU6ur+ivGPiY9IrW7G6WndMD7zPxjDuKBGnYqhWMeUN6xIGZcpwuKEvrYS0DyopB7wC
         iFsGnGHEZ5t1ArfvxP69SMEBVJ5Gv5pFkCLf2CxyODpvrILVIXTpxuB/XVoopz3VZ4uU
         eo6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Xwn3cC+kkWDU3qbOHlus1u59utOB7m1NhZTU25s+Z3I=;
        b=iha++1UA4JPgZ6WJMPP+LrdCJO5Rymr6Uo82q6Uw2ur1y7yoV/bdpp7Ugdjj1Ed4gy
         zuLlB2Mwd8LXKFVjIKP/xv6cSZ+mhzz3a7Ir5QoVt+QomTdU0GzSei0ZrfHvVjuVeQkt
         njJ6ywDxm8J+4zOA7ICUvsm4L3PsCvpr0L1LY3pDC9PhH/q+Hu1Nw+oAv5xPU7N5nmE4
         3rCYLUXzWSnWAoBbktFbXK7+Sc5ognrQukN/HDAeAVZKJqqBBuRysLCDk+rFRcuPQI5f
         DUg0w06PMorTMgnyc083/5aoe0OFXGwOlL7pA6AJ+YEi3PpZVXVgTI6UYH3vFDxH7i8+
         m/2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rRn/fRV3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s6si6460897qks.239.2020.03.30.14.06.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Mar 2020 14:06:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rRn/fRV3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJ1cO-0001bv-7H
	for alex.bennee@linaro.org; Mon, 30 Mar 2020 17:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40587)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jJ1Zp-0006ZD-EX
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 17:04:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jJ1Zo-0002hu-1h
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 17:04:09 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:38252)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jJ1Zn-0002hC-QF
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 17:04:07 -0400
Received: by mail-wr1-x443.google.com with SMTP id s1so23383160wrv.5
 for <qemu-arm@nongnu.org>; Mon, 30 Mar 2020 14:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xwn3cC+kkWDU3qbOHlus1u59utOB7m1NhZTU25s+Z3I=;
 b=rRn/fRV36kzerrPWtvd81Uv7oqVpAId6q6Rax5W3B91ObZLyfdIHoyBxmr1BWxfSS2
 fcSYojWnmbKXfUE024RQSOfpOd1vBAXlNfodC4dx7TIoUblfwUxS0SgANzvgLAvupdrr
 BaETpItJ/FpPaMFtXm8pN2uM0m+QzN7iC9/nBX56XO/eF/KVRfPBwUJYts8hoXbbK012
 soxLgm58kNL5InvyhCOHO0LkbSq0M3zleCTrcCAxisnvGYopSLUSdjRKm5u3xnuGuVkI
 iFp3LRgglgKjzAeRw/1t0uYUytZ2qeaPshUQZH/c5j3U3GgRVYh1pS6O3wGsqk8ZVYeZ
 Z5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xwn3cC+kkWDU3qbOHlus1u59utOB7m1NhZTU25s+Z3I=;
 b=kIDEmR2LwDgrqiNrmc623BO33Y9K/v7T1GHXEESBzFQ40TXi8+0afvk7gPK3/Yuh3t
 Zg8FiOAotN9uxzRgZemfR55UbMWN+jsuJHXDgTk/+nT4RqnTWULg5Y/sTpLuc6hpUlf7
 LbfiWBd0HhvKV6DNKkBSWemYkd5YWyVwk2AVBUz3w2K5ME5eOJXimhLKmySkhfLoEp/8
 7B6TFLfRs0shOfBqQJOO1f8uttYQ26xtZ3Q4xEjJvXFoYKoBkXormGrnpiHNHCz1F32A
 vxyiTY/XDx3xqvBSr3TjuBq7K+HmUydVGbNPyTf8M/cyIerLhMQOGuwGCK9AqCdNi1nv
 grvQ==
X-Gm-Message-State: ANhLgQ359dXLSJ3NNuXas95tui6TDn1UQn8keazJ4FFrBZ/7y/v44jhh
 zHmlTbjSNWlCDhbjEkKI41MYq2CLReNwzw==
X-Received: by 2002:a5d:4004:: with SMTP id n4mr16953382wrp.180.1585602246496; 
 Mon, 30 Mar 2020 14:04:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p21sm1012700wma.0.2020.03.30.14.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 14:04:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/arm: Implement ARMv8.2-TTS2UXN
Date: Mon, 30 Mar 2020 22:04:00 +0100
Message-Id: <20200330210400.11724-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200330210400.11724-1-peter.maydell@linaro.org>
References: <20200330210400.11724-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ohhFShcmJhD2

The ARMv8.2-TTS2UXN feature extends the XN field in stage 2
translation table descriptors from just bit [54] to bits [54:53],
allowing stage 2 to control execution permissions separately for EL0
and EL1. Implement the new semantics of the XN field and enable
the feature for our 'max' CPU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 15 +++++++++++++++
 target/arm/cpu.c    |  1 +
 target/arm/cpu64.c  |  2 ++
 target/arm/helper.c | 37 +++++++++++++++++++++++++++++++------
 4 files changed, 49 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index fe03a74bf08..9aae324d0f6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3610,6 +3610,11 @@ static inline bool isar_feature_aa32_ccidx(const ARMISARegisters *id)
     return FIELD_EX32(id->id_mmfr4, ID_MMFR4, CCIDX) != 0;
 }
 
+static inline bool isar_feature_aa32_tts2uxn(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_mmfr4, ID_MMFR4, XNX) != 0;
+}
+
 /*
  * 64-bit feature tests via id registers.
  */
@@ -3822,6 +3827,11 @@ static inline bool isar_feature_aa64_ccidx(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, CCIDX) != 0;
 }
 
+static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, XNX) != 0;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
@@ -3850,6 +3860,11 @@ static inline bool isar_feature_any_ccidx(const ARMISARegisters *id)
     return isar_feature_aa64_ccidx(id) || isar_feature_aa32_ccidx(id);
 }
 
+static inline bool isar_feature_any_tts2uxn(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_tts2uxn(id) || isar_feature_aa32_tts2uxn(id);
+}
+
 /*
  * Forward to the above feature tests given an ARMCPU pointer.
  */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a79f233b170..d5dfb30525d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2684,6 +2684,7 @@ static void arm_max_initfn(Object *obj)
             t = FIELD_DP32(t, ID_MMFR4, HPDS, 1); /* AA32HPD */
             t = FIELD_DP32(t, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
             t = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
+            t = FIELD_DP32(t, ID_MMFR4, XNX, 1); /* TTS2UXN */
             cpu->isar.id_mmfr4 = t;
         }
 #endif
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 62d36f9e8d3..5fc6330c968 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -673,6 +673,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);
         t = FIELD_DP64(t, ID_AA64MMFR1, PAN, 2); /* ATS1E1 */
         t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* VMID16 */
+        t = FIELD_DP64(t, ID_AA64MMFR1, XNX, 1); /* TTS2UXN */
         cpu->isar.id_aa64mmfr1 = t;
 
         t = cpu->isar.id_aa64mmfr2;
@@ -706,6 +707,7 @@ static void aarch64_max_initfn(Object *obj)
         u = FIELD_DP32(u, ID_MMFR4, HPDS, 1); /* AA32HPD */
         u = FIELD_DP32(u, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
         u = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
+        u = FIELD_DP32(t, ID_MMFR4, XNX, 1); /* TTS2UXN */
         cpu->isar.id_mmfr4 = u;
 
         u = cpu->isar.id_aa64dfr0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 47a175b8e9d..cba8ac57983 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9891,9 +9891,10 @@ simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
  *
  * @env:     CPUARMState
  * @s2ap:    The 2-bit stage2 access permissions (S2AP)
- * @xn:      XN (execute-never) bit
+ * @xn:      XN (execute-never) bits
+ * @s1_is_el0: true if this is S2 of an S1+2 walk for EL0
  */
-static int get_S2prot(CPUARMState *env, int s2ap, int xn)
+static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
 {
     int prot = 0;
 
@@ -9903,9 +9904,32 @@ static int get_S2prot(CPUARMState *env, int s2ap, int xn)
     if (s2ap & 2) {
         prot |= PAGE_WRITE;
     }
-    if (!xn) {
-        if (arm_el_is_aa64(env, 2) || prot & PAGE_READ) {
+
+    if (cpu_isar_feature(any_tts2uxn, env_archcpu(env))) {
+        switch (xn) {
+        case 0:
             prot |= PAGE_EXEC;
+            break;
+        case 1:
+            if (s1_is_el0) {
+                prot |= PAGE_EXEC;
+            }
+            break;
+        case 2:
+            break;
+        case 3:
+            if (!s1_is_el0) {
+                prot |= PAGE_EXEC;
+            }
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    } else {
+        if (!extract32(xn, 1, 1)) {
+            if (arm_el_is_aa64(env, 2) || prot & PAGE_READ) {
+                prot |= PAGE_EXEC;
+            }
         }
     }
     return prot;
@@ -10889,13 +10913,14 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
     }
 
     ap = extract32(attrs, 4, 2);
-    xn = extract32(attrs, 12, 1);
 
     if (mmu_idx == ARMMMUIdx_Stage2) {
         ns = true;
-        *prot = get_S2prot(env, ap, xn);
+        xn = extract32(attrs, 11, 2);
+        *prot = get_S2prot(env, ap, xn, s1_is_el0);
     } else {
         ns = extract32(attrs, 3, 1);
+        xn = extract32(attrs, 12, 1);
         pxn = extract32(attrs, 11, 1);
         *prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
     }
-- 
2.20.1

