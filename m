Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1013101wrm;
        Fri, 11 Oct 2019 08:56:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxdK8tXiElburmMR+XxI8t1zElxnJrJcnpJCv96IChMxh3IrOKsuebsLHotMyLERsaTXCpA
X-Received: by 2002:a50:d54c:: with SMTP id f12mr14203095edj.116.1570809384740;
        Fri, 11 Oct 2019 08:56:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570809384; cv=none;
        d=google.com; s=arc-20160816;
        b=pUywOIw3ZZGJ0rp7qubpMtwAaAS+CZdZp3qdBYX/jX4Xd64KCB+cDYXwj5BL9LXe0D
         9d1lBNJnQq8iGUQuzBOicE0VZOYpFFTcEPwmqNLmgJEzAx1SJlBUmW/pkc9mmGqNxUBs
         7N/5nOujsymgnAHDMGXhOSfC6lRTqIE4kubvvaTHTLwLlz7j9XUDtxtwyUsw3qRd1cme
         ofC7b1sf0DG/3LDLgw6+mixPjOq7a+Qh22bnHUGaio9oxP3HdjHp5m/pscC7+LaqxetF
         4kMFM7MejWYablpawoxTg+bUcfSebQ9qeamoddakT8qI6ZiS6Z4se4o5v6pPh8jIkQYM
         wRnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/TI4mK10x/uGohRoaKTTXXODiX4sOLe+8x03viKmFL4=;
        b=b7KojVTw9sbyOiIWDto+449sG9qHSQw81GKYZU/dZHxGCmbQt+xyOtk7qD0/T+2pi4
         L0fRHLsoDdBld5l1BoOBx/CEKFpuF6t1f1PNOQbcFVB8YmJwxQJlZcpdN4dl5d7iUjky
         bt5XYKyJVPf5Ph1sO8mWWpc5nT3J5ATyrScGaB0CkNcJvYea2/4vaMySn+Jd1wyE1rED
         CybR4YWA3SyukwPEusaxmpplU2zjkJFiy24JlS1yl5sdxl7aZgSN2LwYAfATxEdgAJec
         +U2nGnuuXGjgHh5WN2wuw6cDMHtgkellUHD4Sea/kSIRpvzbAVB+ct9nIwGj7LlCl+Gd
         1hsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yvdgAlh5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d25si5299304edq.65.2019.10.11.08.56.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 08:56:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yvdgAlh5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIxHD-0002fW-AH
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 11:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33523)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGh-0002BY-Au
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:55:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGf-0007Wm-Pv
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:55:51 -0400
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:37994)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIxGf-0007W0-LA
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:55:49 -0400
Received: by mail-yw1-xc43.google.com with SMTP id s6so3647542ywe.5
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 08:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/TI4mK10x/uGohRoaKTTXXODiX4sOLe+8x03viKmFL4=;
 b=yvdgAlh5mY6e46DXQGPJiknSbUkSaJEoRRI7courZU9QGr2rpBShPs/779Kx3GV8X9
 koJFprkG+pDHF/+WfKWJF+eEEj7NU1w+SDP/nq1hC//k1U/giNCLV7LKpzUNWpmscghw
 zQRnB/EflkdeKxPtApFXRkpiutUCQ8fyMFr8Po7YX4tRcHn6hL3nw6wdFeV2VVBDtmRp
 +V63jsl6M8fr1YeCjkO4fsQuKE0HDL/s+Ye9uAExtz246QQQigUuP0gLldTK7i39avjX
 qbKepewiMeDY2Qfl6Wt+wOYE+KazjSawZFhsbb+SkybSgbE9queMU6ovKXKac+1wVwpZ
 URuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/TI4mK10x/uGohRoaKTTXXODiX4sOLe+8x03viKmFL4=;
 b=HOFDWiXRyCVEKlUBvfEqOdyeiWOHFQMSqmQ2R6hXXprRgfgtQh0wcGDZSNXmT9zC5k
 fKtFvsa5ghOMCHwNASvTHDKJRZnfeUR11QwbLZMkGqhLeDBYgh31woG5faUVwr9vLYmE
 PCBYdtFnvcI9w7QRPZahQZPdQ6MHmJ2We16/QMkyvsFjq28Vthu8NwSzk8qFIFV80EW4
 lc8Ef8k+uE3soMrA2I8CmdS98OQwsb0Azfp/pv/lTxva/0gpQigLpL/38suI5EufmADO
 uH+s6ewk4PWzsLA8fvW8NCNyW4t1/vcKwu2Qs6fyexUKhvOqC1EX0FF66Vj//ef69lgl
 Ri6Q==
X-Gm-Message-State: APjAAAWSgbU/exXDjKRXBGw8NNXXy4P+JLJS2Zoz7QCNhW01+Ziv0h0q
 CeF7+I20Bg9Bzi6OU4ZtdKX9CQ==
X-Received: by 2002:a0d:d956:: with SMTP id b83mr3096589ywe.68.1570809348858; 
 Fri, 11 Oct 2019 08:55:48 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id d17sm2473139ywb.95.2019.10.11.08.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 08:55:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 01/20] target/arm: Split out rebuild_hflags_common
Date: Fri, 11 Oct 2019 11:55:27 -0400
Message-Id: <20191011155546.14342-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011155546.14342-1-richard.henderson@linaro.org>
References: <20191011155546.14342-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c43
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
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vYKSG0KhOe0E

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

