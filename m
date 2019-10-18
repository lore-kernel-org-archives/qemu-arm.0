Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1228613wrm;
        Fri, 18 Oct 2019 10:49:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxFOWlILHW2D73dsz45ffHxbvLijNW3lSiMbfk+D6D1tb+v+pZRD20DcCbzBbGcEjBGaZ6d
X-Received: by 2002:a37:444b:: with SMTP id r72mr9894375qka.320.1571420977350;
        Fri, 18 Oct 2019 10:49:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571420977; cv=none;
        d=google.com; s=arc-20160816;
        b=mNh0bqqCyPViPww3WByWR6+5DsLRRtHii9FOyE2BeFadj63KGkDcvtDPcQX9eCh/Li
         N40Lgy2ZbW7UDUx09CnP58Zf49iHHc0LVrJZMQJk6Q3gLCj5Lx+2chBC17SBvroX7UwR
         7+w5ZW4HK/FKYMusZ4RKghFu3Le1VxDuiXDbxqRgK9RcAlZ1pxHJGRhDyZE9WDAikrn+
         M3srdALOQ7g86bwhZMG92iyT54G2mVtNeAQgXvNpmtTppFN5MQjQ3MGGsPjnzvpeHjei
         H0Rx/1wbMXKgbWUTs7Zi84rrCvyM/5BaHxxOcQfKXREDeG86m707Y7GTMiMPj1oKuWsd
         l7Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/TI4mK10x/uGohRoaKTTXXODiX4sOLe+8x03viKmFL4=;
        b=PvAKa3sorc6okGz5eK+XYg7JpLW/X4MKHuNvP1moXtW9zxNi2C3IIsleDVGrieguq7
         /dkOTvABawpsIddKDsJ/Bk6OF3lVHUtTjHbhT4+9p+1Gy6PgLpmUZTi3H6riG2h1Dra5
         etdMLeG2ec2c74373zsXjgdAc1cLG4G4C+vJQRBNS3dLqsUeAEtY/+gh5cG6drFDnTzj
         CzSG75g2LPkg4+AgNpbgKGItAMgGEoYj6/48Nht2F/M+MfJQ2osK45nMmujwerLqDpAW
         nV0zh7ajYdkmdq8nTQBzuphrvxGhc+Q5Iq8nL8o7N3aOBgCy0VqbyzXksdGYdh/4D52m
         QN3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LmIafnQP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10si6721548qtl.331.2019.10.18.10.49.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 10:49:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LmIafnQP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLWNc-0002XN-1F
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 13:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59034)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIn-0006Or-Nz
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIl-0005JL-0K
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:37 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:45013)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLWIk-0005In-Qm
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:34 -0400
Received: by mail-pl1-x643.google.com with SMTP id q15so3177585pll.11
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 10:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/TI4mK10x/uGohRoaKTTXXODiX4sOLe+8x03viKmFL4=;
 b=LmIafnQPZ1zka4369ciWgZJRpt6Q/xgZJuKCoFEIN4P4lNA0DvAPJkq4Sa5EbZUajq
 wRQb2fUtgpCnTRXFPWhWgVnXQp1BBIF5A+nkJ6UsRUJkXINgiGFf+AZbvRvH1XrUWDZX
 eChLrwHKsGhTDCVzVsYJSJr5R5ONpuBPQpBKURYeluoDEDxgrzzvJ9pNX+KPeHocgWzr
 zMct9uqLBmmr4xEkCIzg24rduEbuF6EGNxIG/QZWbz1ocoXdTs3/pKLCtYht6Oe5qV/k
 0VUGYK30bJxfVOWP1tXDWdGcGaBlCWEJstFO+ziGuzQPSH/4w+YfX6QURqCMU2xanMrh
 zJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/TI4mK10x/uGohRoaKTTXXODiX4sOLe+8x03viKmFL4=;
 b=aMvdK3dLOptYxLkPHQ/1iUeINtaHUimEmambo+KpmsIUCln7Y4Sv/h4ltXbaySImhK
 bconsFoUDZ+BJXMeWQyrGzxefsAH8TJn6bBozqE3ex282/2qSifuP+UnTV4Jg3/VFmHU
 MYSiMUPKJDgnrkWYBNjejA5p9vfPUsTvrw+i70ZycZ5BIrgod4h2+uJmey6JfYfdjfQU
 gJO0aDJq4XmlUc6RNiXzG+9GAYwzL8gZ1cziuS2HyKiknzloV0Ug0faaZ5BCosHYQZvh
 YFkABhLKBq9/qMu7Ku+4epYT4XXBHOZgavOAJ/5Y9/lX9sI560fj0A7xN2DPHO6dd5yw
 3O2g==
X-Gm-Message-State: APjAAAVZfqqwyQyOCzfeYh1TbY36mjNPBE/hU+65bqFpDvuYd/xJbf5c
 utKGGu5ZX94mnF7qHI+Yv1pSvw==
X-Received: by 2002:a17:902:9f96:: with SMTP id
 g22mr3953269plq.286.1571420673623; 
 Fri, 18 Oct 2019 10:44:33 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d20sm7857534pfq.88.2019.10.18.10.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 10:44:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 01/22] target/arm: Split out rebuild_hflags_common
Date: Fri, 18 Oct 2019 10:44:10 -0700
Message-Id: <20191018174431.1784-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018174431.1784-1-richard.henderson@linaro.org>
References: <20191018174431.1784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
X-TUID: UOe4yo5dkCbP

Create a function to compute the values of the TBFLAG_ANY bits
that will be cached.  For now, the env->hflags variable is not
used, and the results are fed back to cpu_get_tb_cpu_state.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 29 ++++++++++++++++++-----------
 target/arm/helper.c | 26 +++++++++++++++++++-------
 2 files changed, 37 insertions(+), 18 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 297ad5e47a..ad79a6153b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -231,6 +231,9 @@ typedef struct CPUARMState {
     uint32_t pstate;
     uint32_t aarch64; /* 1 if CPU is in aarch64 state; inverse of PSTATE.nRW */
 
+    /* Cached TBFLAGS state.  See below for which bits are included.  */
+    uint32_t hflags;
+
     /* Frequently accessed CPSR bits are stored separately for efficiency.
        This contains all the other bits.  Use cpsr_{read,write} to access
        the whole CPSR.  */
@@ -3140,15 +3143,18 @@ typedef ARMCPU ArchCPU;
 
 #include "exec/cpu-all.h"
 
-/* Bit usage in the TB flags field: bit 31 indicates whether we are
+/*
+ * Bit usage in the TB flags field: bit 31 indicates whether we are
  * in 32 or 64 bit mode. The meaning of the other bits depends on that.
  * We put flags which are shared between 32 and 64 bit mode at the top
  * of the word, and flags which apply to only one mode at the bottom.
+ *
+ * Unless otherwise noted, these bits are cached in env->hflags.
  */
 FIELD(TBFLAG_ANY, AARCH64_STATE, 31, 1)
 FIELD(TBFLAG_ANY, MMUIDX, 28, 3)
 FIELD(TBFLAG_ANY, SS_ACTIVE, 27, 1)
-FIELD(TBFLAG_ANY, PSTATE_SS, 26, 1)
+FIELD(TBFLAG_ANY, PSTATE_SS, 26, 1)     /* Not cached. */
 /* Target EL if we take a floating-point-disabled exception */
 FIELD(TBFLAG_ANY, FPEXC_EL, 24, 2)
 FIELD(TBFLAG_ANY, BE_DATA, 23, 1)
@@ -3159,13 +3165,14 @@ FIELD(TBFLAG_ANY, BE_DATA, 23, 1)
 FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 21, 2)
 
 /* Bit usage when in AArch32 state: */
-FIELD(TBFLAG_A32, THUMB, 0, 1)
-FIELD(TBFLAG_A32, VECLEN, 1, 3)
-FIELD(TBFLAG_A32, VECSTRIDE, 4, 2)
+FIELD(TBFLAG_A32, THUMB, 0, 1)          /* Not cached. */
+FIELD(TBFLAG_A32, VECLEN, 1, 3)         /* Not cached. */
+FIELD(TBFLAG_A32, VECSTRIDE, 4, 2)      /* Not cached. */
 /*
  * We store the bottom two bits of the CPAR as TB flags and handle
  * checks on the other bits at runtime. This shares the same bits as
  * VECSTRIDE, which is OK as no XScale CPU has VFP.
+ * Not cached, because VECLEN+VECSTRIDE are not cached.
  */
 FIELD(TBFLAG_A32, XSCALE_CPAR, 4, 2)
 /*
@@ -3174,15 +3181,15 @@ FIELD(TBFLAG_A32, XSCALE_CPAR, 4, 2)
  * the same thing as the current security state of the processor!
  */
 FIELD(TBFLAG_A32, NS, 6, 1)
-FIELD(TBFLAG_A32, VFPEN, 7, 1)
-FIELD(TBFLAG_A32, CONDEXEC, 8, 8)
+FIELD(TBFLAG_A32, VFPEN, 7, 1)          /* Not cached. */
+FIELD(TBFLAG_A32, CONDEXEC, 8, 8)       /* Not cached. */
 FIELD(TBFLAG_A32, SCTLR_B, 16, 1)
 /* For M profile only, set if FPCCR.LSPACT is set */
-FIELD(TBFLAG_A32, LSPACT, 18, 1)
+FIELD(TBFLAG_A32, LSPACT, 18, 1)        /* Not cached. */
 /* For M profile only, set if we must create a new FP context */
-FIELD(TBFLAG_A32, NEW_FP_CTXT_NEEDED, 19, 1)
+FIELD(TBFLAG_A32, NEW_FP_CTXT_NEEDED, 19, 1) /* Not cached. */
 /* For M profile only, set if FPCCR.S does not match current security state */
-FIELD(TBFLAG_A32, FPCCR_S_WRONG, 20, 1)
+FIELD(TBFLAG_A32, FPCCR_S_WRONG, 20, 1) /* Not cached. */
 /* For M profile only, Handler (ie not Thread) mode */
 FIELD(TBFLAG_A32, HANDLER, 21, 1)
 /* For M profile only, whether we should generate stack-limit checks */
@@ -3194,7 +3201,7 @@ FIELD(TBFLAG_A64, SVEEXC_EL, 2, 2)
 FIELD(TBFLAG_A64, ZCR_LEN, 4, 4)
 FIELD(TBFLAG_A64, PAUTH_ACTIVE, 8, 1)
 FIELD(TBFLAG_A64, BT, 9, 1)
-FIELD(TBFLAG_A64, BTYPE, 10, 2)
+FIELD(TBFLAG_A64, BTYPE, 10, 2)         /* Not cached. */
 FIELD(TBFLAG_A64, TBID, 12, 2)
 
 static inline bool bswap_code(bool sctlr_b)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0d9a2d2ab7..8829d91ae1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11054,6 +11054,22 @@ ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
 }
 #endif
 
+static uint32_t rebuild_hflags_common(CPUARMState *env, int fp_el,
+                                      ARMMMUIdx mmu_idx, uint32_t flags)
+{
+    flags = FIELD_DP32(flags, TBFLAG_ANY, FPEXC_EL, fp_el);
+    flags = FIELD_DP32(flags, TBFLAG_ANY, MMUIDX,
+                       arm_to_core_mmu_idx(mmu_idx));
+
+    if (arm_cpu_data_is_big_endian(env)) {
+        flags = FIELD_DP32(flags, TBFLAG_ANY, BE_DATA, 1);
+    }
+    if (arm_singlestep_active(env)) {
+        flags = FIELD_DP32(flags, TBFLAG_ANY, SS_ACTIVE, 1);
+    }
+    return flags;
+}
+
 void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
@@ -11145,7 +11161,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         }
     }
 
-    flags = FIELD_DP32(flags, TBFLAG_ANY, MMUIDX, arm_to_core_mmu_idx(mmu_idx));
+    flags = rebuild_hflags_common(env, fp_el, mmu_idx, flags);
 
     /* The SS_ACTIVE and PSTATE_SS bits correspond to the state machine
      * states defined in the ARM ARM for software singlestep:
@@ -11153,9 +11169,9 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
      *     0            x       Inactive (the TB flag for SS is always 0)
      *     1            0       Active-pending
      *     1            1       Active-not-pending
+     * SS_ACTIVE is set in hflags; PSTATE_SS is computed every TB.
      */
-    if (arm_singlestep_active(env)) {
-        flags = FIELD_DP32(flags, TBFLAG_ANY, SS_ACTIVE, 1);
+    if (FIELD_EX32(flags, TBFLAG_ANY, SS_ACTIVE)) {
         if (is_a64(env)) {
             if (env->pstate & PSTATE_SS) {
                 flags = FIELD_DP32(flags, TBFLAG_ANY, PSTATE_SS, 1);
@@ -11166,10 +11182,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             }
         }
     }
-    if (arm_cpu_data_is_big_endian(env)) {
-        flags = FIELD_DP32(flags, TBFLAG_ANY, BE_DATA, 1);
-    }
-    flags = FIELD_DP32(flags, TBFLAG_ANY, FPEXC_EL, fp_el);
 
     if (arm_v7m_is_handler_mode(env)) {
         flags = FIELD_DP32(flags, TBFLAG_A32, HANDLER, 1);
-- 
2.17.1

