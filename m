Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2127093wro;
        Fri, 2 Nov 2018 06:42:17 -0700 (PDT)
X-Google-Smtp-Source: AJdET5f7rsay0aXWkNhLNnSHGu/k0CYMXcHUPPt9r/WAHwL0HBUrIB4BQZJEr8Fwtyw32xNjp1Ob
X-Received: by 2002:a0c:9927:: with SMTP id h36mr10828416qvd.171.1541166137569;
        Fri, 02 Nov 2018 06:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541166137; cv=none;
        d=google.com; s=arc-20160816;
        b=xgcLl0zNuV3AVyrMsy5crkuLzDIys/YKv7o2l5uIKVM/lwo8xwgPHnAcO654BmKhkK
         D+NjX0aExyXt7w5lgNuC3CI8np0uPzgIgb8TPccGDEEvn+/0YsZie2ckJcx9GzkImoo7
         dOFj1iebxxgTASQk3Lgjwx2pvhA29LGj9VdWHReBWAKId2rQvwA5mYe3tym2RMHOtsfw
         EsVqYv9j2bDS+1vLHeqE1aad01PPdHasSFPs/fAYxbDpzMuKSP6vVCgg9CF3avGbSRKG
         XJpXAXQyutX4w3fCBbm79KAzrVg2WNILfof8oDi3p/MvdNzj1LOC7OI+E1LXrfw+rq3G
         AsDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ZY6/7urjTRhGhj35nknHL71Em7/fMwMHdiIzfHKXepI=;
        b=jxv0S67HoV74kvViJooJ7Vjw99L83Y0GPxsL+H1/NoHqY0ZAZhFeS2woytpSVwN8kq
         Q/iW9Z5J4BiFLtgUe82CtWffbk/7CWedk9cGg7/rqUnTMco+rf9tuVUvZ+8WHlB5Dv2B
         Y3lQ+v1BVbZ/zLinchsgH6nC2f5CivbaFDTcIgRxrWycNy5yKulfTz8KV9/uWM3O9non
         7+BtJhrnsHBF6/UrsDIKgM9NeSCt1EeRZGOV5reMOQJqrRyk4AYV9WZIOx9qYqHIFIwk
         qk7Fkzy2AUXKUXbobBH1aItKBQ9zrubgUy/w1DZPzdC2uTcKyntm8iFvVEhralszqmML
         KcYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ia+gWIRo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o1si2703076qvq.24.2018.11.02.06.42.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 06:42:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ia+gWIRo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51759 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIZiL-0007BA-2j
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 09:42:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gIZhl-00078u-AI
	for qemu-devel@nongnu.org; Fri, 02 Nov 2018 09:41:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gIZhj-0007MM-A0
	for qemu-devel@nongnu.org; Fri, 02 Nov 2018 09:41:41 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:44552)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gIZhh-0007CH-Ae
	for qemu-devel@nongnu.org; Fri, 02 Nov 2018 09:41:37 -0400
Received: by mail-wr1-x443.google.com with SMTP id d17-v6so2014235wre.11
	for <qemu-devel@nongnu.org>; Fri, 02 Nov 2018 06:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZY6/7urjTRhGhj35nknHL71Em7/fMwMHdiIzfHKXepI=;
	b=Ia+gWIRo5PISXCS2QBrl/mV7hI9ZmkEINGeOAHVeJl6ikstds/dVFlrtguEtAvVZOQ
	tGCzJhlLGlXoQm+ZrqStuftZLi25Ra+uWT+DjkHL6DzKrp3pG/gSfcM8ivgCT7Tw2TZL
	0V0PYmV8oCti79d883wGMVOCbPTz6vieUUniE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZY6/7urjTRhGhj35nknHL71Em7/fMwMHdiIzfHKXepI=;
	b=sjWYzm/hJ6Z4kpb6pWCfLQ8vJgHdRVBO9lQKaaY9TnvnANASK3optOOc9bJ2AmS8bR
	KpH2elBYtWV3QDbx+OwdmGfLUcXmhhSBFpURc6leSoesUPRi3dxyvWkA06REVRTKqPCj
	bPIV/1zbHgDqmEyDDtomxeblb0u3Y3JQV8E0vREj1Ifq63DvI5jZJy0+rk7kqICaMY5K
	teTCJFIPT9hC4x22Y5qHl+gWGD3KU4pMB1ummZGRV3HSqArpFLBtCu+PY9ymQdWu7C8V
	1MVThVb8UnaRRyzmmAtDfH6KVZRfYXtfd13FwFAT/Mk4zUtVgm0y5Qbv3KnyTMgrG3Yf
	9mTA==
X-Gm-Message-State: AGRZ1gJqVUvUL2ZVxMQaLTpLVk1h9H2sXR/7vqKSWXQe+k11y7HXor6q
	EPMC242rGzhBW4vEqG0/+IY4ZwieeCM=
X-Received: by 2002:a5d:4306:: with SMTP id
	h6-v6mr10823361wrq.189.1541166081721; 
	Fri, 02 Nov 2018 06:41:21 -0700 (PDT)
Received: from cloudburst.Home ([2a02:c7f:504f:6300:a3de:88d8:75ae:bf4c])
	by smtp.gmail.com with ESMTPSA id
	e10-v6sm1629686wrp.56.2018.11.02.06.41.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 02 Nov 2018 06:41:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  2 Nov 2018 13:41:12 +0000
Message-Id: <20181102134112.26370-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181102134112.26370-1-richard.henderson@linaro.org>
References: <20181102134112.26370-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PATCH for-4.0 4/4] target/arm: Implement the
 ARMv8.2-AA32HPD extension
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wSpAV48tFEA0

The bulk of the work here, beyond base HPD, is defining the TTBCR2 register.
In addition we must check TTBCR.T2E, which is not present (RES0) for AArch64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  8 ++++++++
 target/arm/cpu.c    |  4 ++++
 target/arm/helper.c | 37 +++++++++++++++++++++++++++++--------
 3 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f12a6afddc..a253cdebde 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1517,6 +1517,14 @@ FIELD(ID_ISAR6, FHM, 8, 4)
 FIELD(ID_ISAR6, SB, 12, 4)
 FIELD(ID_ISAR6, SPECRES, 16, 4)
 
+FIELD(ID_MMFR4, SPECSEI, 0, 4)
+FIELD(ID_MMFR4, AC2, 4, 4)
+FIELD(ID_MMFR4, XNX, 8, 4)
+FIELD(ID_MMFR4, CNP, 12, 4)
+FIELD(ID_MMFR4, HPDS, 16, 4)
+FIELD(ID_MMFR4, LSM, 20, 4)
+FIELD(ID_MMFR4, CCIDX, 24, 4)
+
 FIELD(ID_AA64ISAR0, AES, 4, 4)
 FIELD(ID_AA64ISAR0, SHA1, 8, 4)
 FIELD(ID_AA64ISAR0, SHA2, 12, 4)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8f16e96b6c..3fd85f21c5 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1856,6 +1856,10 @@ static void arm_max_initfn(Object *obj)
             t = cpu->isar.id_isar6;
             t = FIELD_DP32(t, ID_ISAR6, DP, 1);
             cpu->isar.id_isar6 = t;
+
+            t = cpu->id_mmfr4;
+            t = FIELD_DP32(t, ID_MMFR4, HPDS, 1); /* AA32HPD */
+            cpu->id_mmfr4 = t;
         }
 #endif
     }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 312d3e6f02..85d3f4ad89 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2722,6 +2722,7 @@ static void vmsa_ttbcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
+    TCR *tcr = raw_ptr(env, ri);
 
     if (arm_feature(env, ARM_FEATURE_LPAE)) {
         /* With LPAE the TTBCR could result in a change of ASID
@@ -2729,6 +2730,8 @@ static void vmsa_ttbcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
          */
         tlb_flush(CPU(cpu));
     }
+    /* Preserve the high half of TCR_EL1, set via TTBCR2.  */
+    value = deposit64(tcr->raw_tcr, 0, 32, value);
     vmsa_ttbcr_raw_write(env, ri, value);
 }
 
@@ -2831,6 +2834,16 @@ static const ARMCPRegInfo vmsa_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+/* Note that unlike TTBCR, writing to TTBCR2 does not require flushing
+ * qemu tlbs nor adjusting cached masks.
+ */
+static const ARMCPRegInfo ttbcr2_reginfo = {
+    .name = "TTBCR2", .cp = 15, .crn = 2, .crm = 0, .opc1 = 0, .opc2 = 3,
+    .access = PL1_RW, .type = ARM_CP_ALIAS,
+    .bank_fieldoffsets = { offsetofhigh32(CPUARMState, cp15.tcr_el[3]),
+                           offsetofhigh32(CPUARMState, cp15.tcr_el[1]) },
+};
+
 static void omap_ticonfig_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                 uint64_t value)
 {
@@ -5454,6 +5467,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     } else {
         define_arm_cp_regs(cpu, vmsa_pmsa_cp_reginfo);
         define_arm_cp_regs(cpu, vmsa_cp_reginfo);
+        /* TTCBR2 is introduced with ARMv8.2-A32HPD.  */
+        if (FIELD_EX32(cpu->id_mmfr4, ID_MMFR4, HPDS) != 0) {
+            define_one_arm_cp_reg(cpu, &ttbcr2_reginfo);
+        }
     }
     if (arm_feature(env, ARM_FEATURE_THUMB2EE)) {
         define_arm_cp_regs(cpu, t2ee_cp_reginfo);
@@ -9797,12 +9814,14 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         if (tg == 2) { /* 16KB pages */
             stride = 11;
         }
-        if (aarch64) {
-            if (el > 1) {
-                hpd = extract64(tcr->raw_tcr, 24, 1);
-            } else {
-                hpd = extract64(tcr->raw_tcr, 41, 1);
-            }
+        if (aarch64 && el > 1) {
+            hpd = extract64(tcr->raw_tcr, 24, 1);
+        } else {
+            hpd = extract64(tcr->raw_tcr, 41, 1);
+        }
+        if (!aarch64) {
+            /* For aarch32, hpd0 is not enabled without t2e as well.  */
+            hpd &= extract64(tcr->raw_tcr, 6, 1);
         }
     } else {
         /* We should only be here if TTBR1 is valid */
@@ -9819,8 +9838,10 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         if (tg == 1) { /* 16KB pages */
             stride = 11;
         }
-        if (aarch64) {
-            hpd = extract64(tcr->raw_tcr, 42, 1);
+        hpd = extract64(tcr->raw_tcr, 42, 1);
+        if (!aarch64) {
+            /* For aarch32, hpd1 is not enabled without t2e as well.  */
+            hpd &= extract64(tcr->raw_tcr, 6, 1);
         }
     }
 
-- 
2.17.2

