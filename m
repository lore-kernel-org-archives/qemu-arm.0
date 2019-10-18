Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1231707wrm;
        Fri, 18 Oct 2019 10:53:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxRwmreYnsQ0v5+aWJ+es2DPpqhtoS+Ht5Qdc07IrTJM1s48CopGX5FSj5u5OBwb0uqIFQX
X-Received: by 2002:aed:3b3b:: with SMTP id p56mr7244325qte.200.1571421192281;
        Fri, 18 Oct 2019 10:53:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571421192; cv=none;
        d=google.com; s=arc-20160816;
        b=jhFukurcixA3cjdUipV5anB7LF7EdyUGt7UYu+rt6J2KxDhAzlpQVMbKPsp1ZfHOIz
         tCTzGtXcF6JCm+e5DO8s/LWy8GrayuNKwh265s/jW65ONFk2N2upJjMwgsbkSllKTEDO
         zJ5hc/QycsCiLwme5kpm5v1BMQrdmwb2y1m5ruwZ0d1JRBFWfPWXUyLvRqFQvUqXuFPm
         DaPHsj9NXPHmlzrnLYFsJqSsB5yUnIBru6lUM8ImINR0hSTOfYRjpYFYjJr00zVIxokH
         LUVst13GZ/zzhsNzrqyQkmTzK0AOjV8NqQgEVPmIdr/7+Mryc/gVpDPTrsl4VvnkmCfd
         aesQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PtanC1h+OlQIbLy4htGIe38tBGV1DOrNspWjSEGlJl4=;
        b=iz5FuwJAKjO6MqiOAJnthA3paGw7tH0vgT1+p3c2iyzHxHOjACo+ZNlEI9ObHycVcd
         dGwyaQzh+zrw0NIDYBnGUOqNdZtTUev3ZLX7yBoyPydsXaBqnXb3UTQ7xinjGIsRpmsj
         VwUo66jeFRM7Vd75aEInhH9B/VYr/TrfhyTT/sDT7+KuS/4DP/YrDrDvFaY1Gz3Cl3Si
         rEM5+Eil25YTyZwQgAJOpsgDZpW6ZspGU/7VhWdkK7/Isy/cMk4uOcGcua0v7K7Q3aUZ
         U8DI72ql6rqGHVWswJTpMmA41liDVF7Zd/k6MajmEyB3r/GmAhsdFzdZbMj3JLx4ShFd
         /bkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FPZScvTz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j1si6315441qtd.317.2019.10.18.10.53.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 10:53:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FPZScvTz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLWR5-00077k-3G
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 13:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59317)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIz-0006dc-GR
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIy-0005VD-9s
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:49 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:39039)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLWIy-0005UZ-43
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:48 -0400
Received: by mail-pf1-x442.google.com with SMTP id v4so4319378pff.6
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 10:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PtanC1h+OlQIbLy4htGIe38tBGV1DOrNspWjSEGlJl4=;
 b=FPZScvTzDGijzfsnuo08ASLnDHdJ5jbt9rzyrPrCCvwHqStJdW3b28sF3atJoDgM8O
 2xLzYSURiSEYnOVegGcspyTFAVSYtNIi21D3A2jqh53FPWgc5bg0oUh8t2pLdG/9EU2E
 szPMfQqOQWIOkAMdWiIw1Ds0ggq/9yoyPkIbgC9gnXR3UcJiYTaZl0/CZ1cj6IlVaOex
 37WpfsysgYtcKtMlQEgP3Gxv/5Ug95AcUFjzq1RyiNUoqVBfDsdpafRMvROvP0PZQTaD
 fQtat0CS4uDsj17m6YjnxIRZ/Ftn9rjNSxOxflAKXPBcnRPn1asEWw7k+GCo9t97Akxq
 NlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PtanC1h+OlQIbLy4htGIe38tBGV1DOrNspWjSEGlJl4=;
 b=nUpo6HMAQctY200USxvZseKuF/Tuf+8oTkwuuFJR4fQHWbdeuAxDPzjXEi3wrn5wwo
 yBKRjacSAF8utxO2oT+2+sWb2NY24XUHzZHDCJic3Bwb4yxejyzlbhwHCJlczYGNzgcx
 7ejEnxsCHR5sLDpntZxekepQOMZaE2NQxTQ93bdKR8WYM9xTrsIBDPyHmgle3CKm9s3K
 //vK9yD2FDqwReQo+kjL9ULPvLGu4ZtrTZ/vY5ED6b3+9Bb9nidF0Qu/lE+9m2T6GOlC
 1ZtE7dyDuyTjz6h0VLZDFn+KircDER7xT73uJyWRZAhKseP2+xTuBN4/xUrD54mgUoEQ
 4d/w==
X-Gm-Message-State: APjAAAWHt/4KpuOeAN7+gpeevqs4B9epTiSF63Dkgi0cXkp6btFv49P+
 QDi7mcbnDSI5Rv6QHFtctp7OtlUbSL0=
X-Received: by 2002:a63:3d41:: with SMTP id k62mr11117117pga.129.1571420687048; 
 Fri, 18 Oct 2019 10:44:47 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d20sm7857534pfq.88.2019.10.18.10.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 10:44:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 12/22] target/arm: Add arm_rebuild_hflags
Date: Fri, 18 Oct 2019 10:44:21 -0700
Message-Id: <20191018174431.1784-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018174431.1784-1-richard.henderson@linaro.org>
References: <20191018174431.1784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
X-TUID: qGNps8O19qN4

This function assumes nothing about the current state of the cpu,
and writes the computed value to env->hflags.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  6 ++++++
 target/arm/helper.c | 30 ++++++++++++++++++++++--------
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9909ff89d4..d844ea21d8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3297,6 +3297,12 @@ void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
 void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook, void
         *opaque);
 
+/**
+ * arm_rebuild_hflags:
+ * Rebuild the cached TBFLAGS for arbitrary changed processor state.
+ */
+void arm_rebuild_hflags(CPUARMState *env);
+
 /**
  * aa32_vfp_dreg:
  * Return a pointer to the Dn register within env in 32-bit mode.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 89aa6fd933..85de96d071 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11198,17 +11198,35 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
     return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
 }
 
+static uint32_t rebuild_hflags_internal(CPUARMState *env)
+{
+    int el = arm_current_el(env);
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
+
+    if (is_a64(env)) {
+        return rebuild_hflags_a64(env, el, fp_el, mmu_idx);
+    } else if (arm_feature(env, ARM_FEATURE_M)) {
+        return rebuild_hflags_m32(env, fp_el, mmu_idx);
+    } else {
+        return rebuild_hflags_a32(env, fp_el, mmu_idx);
+    }
+}
+
+void arm_rebuild_hflags(CPUARMState *env)
+{
+    env->hflags = rebuild_hflags_internal(env);
+}
+
 void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
-    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
-    int current_el = arm_current_el(env);
-    int fp_el = fp_exception_el(env, current_el);
     uint32_t flags, pstate_for_ss;
 
+    flags = rebuild_hflags_internal(env);
+
     if (is_a64(env)) {
         *pc = env->pc;
-        flags = rebuild_hflags_a64(env, current_el, fp_el, mmu_idx);
         if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
             flags = FIELD_DP32(flags, TBFLAG_A64, BTYPE, env->btype);
         }
@@ -11217,8 +11235,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         *pc = env->regs[15];
 
         if (arm_feature(env, ARM_FEATURE_M)) {
-            flags = rebuild_hflags_m32(env, fp_el, mmu_idx);
-
             if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
                 FIELD_EX32(env->v7m.fpccr[M_REG_S], V7M_FPCCR, S)
                 != env->v7m.secure) {
@@ -11242,8 +11258,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                 flags = FIELD_DP32(flags, TBFLAG_A32, LSPACT, 1);
             }
         } else {
-            flags = rebuild_hflags_a32(env, fp_el, mmu_idx);
-
             /*
              * Note that XSCALE_CPAR shares bits with VECSTRIDE.
              * Note that VECLEN+VECSTRIDE are RES0 for M-profile.
-- 
2.17.1

