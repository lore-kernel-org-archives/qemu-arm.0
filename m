Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3294523ejc;
        Mon, 23 Jan 2023 16:02:08 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtQVnLg0fjJ8vXqFVEnxfwBXspXVWc/hZd9TyMYJipVVJx3+e8kcy9MGYBD6TmxRL8NKL74
X-Received: by 2002:a05:6871:1cb:b0:15f:dd64:417f with SMTP id q11-20020a05687101cb00b0015fdd64417fmr6514418oad.1.1674518527506;
        Mon, 23 Jan 2023 16:02:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674518527; cv=none;
        d=google.com; s=arc-20160816;
        b=YCZYdL5x9628BexTEHtMZmAyP0ltqu3G3UE8FmngKmZrIk2OYxjRgpFhuuL51Vr6Wc
         G1l+VF8rAjAInJetvOANppk2cxMVaS2P23mTTLjpK3zFcI8DHVblT7F/9m4dO870Y6gL
         J4XDfLK5+sq78JQUKDKgVziUGFRIPR+79dlSfeZ51JW1tA/1GiPaZfLUM9zRL4BPkpEO
         00YbvTPNlJR0ug/BB22pDXonJ90QwXCnFm4jem7fnbAbTRhNxgiKcadfqItfrxO2PgAm
         8+VmPzHKoR6zhpc5yH5dN7pN8ztQdG/CE6IobFej6k9sT6Ep6C1I187Y45C32EzcYBzH
         9UXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ws2G4XMOp0lestkCd2/peNLCEqyj7X/oLG8H4z1egnA=;
        b=ugNl3XwfIUnRsb5jqnwfuqW5YUwv/wuEQsj1etFQf/C7rT2MS+aDBbB7dKSte8Gmzf
         aGcJdJuaf3FNMZhqcVGxCHa1cBj5+/0Sp+ulv0NsYUnTqb03HRetbOcAruYmIHpQ1nbA
         +zG+FfQ1gQc1hSQPxghifZTsNUbg0bW9IqX5wE9XstbYOnEL3+3YCaBKQAnzbq+yKGgX
         2xm8Hyv5NxWPJe3bR2sVyfasbZWJNH0a2oY4Rq68fTQfm8XFeVu6Zy07jVEPT8hBi2F9
         lxzW+cr/MAVNJw0LG5GVjwLZb7ipYLaTgNM9BGcekcN/GymkcTNiE2br7axXNMxdNn30
         ZxDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F1UsYk8Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w185-20020a3794c2000000b006fec73e2573si472183qkd.210.2023.01.23.16.02.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 16:02:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F1UsYk8Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pK6kj-0001jS-U4; Mon, 23 Jan 2023 19:01:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kh-0001Z2-2R
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 19:01:27 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kb-0001zf-17
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 19:01:26 -0500
Received: by mail-pj1-x1029.google.com with SMTP id 88so1636856pjo.3
 for <qemu-arm@nongnu.org>; Mon, 23 Jan 2023 16:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ws2G4XMOp0lestkCd2/peNLCEqyj7X/oLG8H4z1egnA=;
 b=F1UsYk8YbUCHY9MKFjtXVLhh8m8ty0CppWkNqOBcAXgdNdclsUA3OvUbmplkm5F0Rq
 LVerCf7IQBc5TTPr/g0r26K5txGpW28P/VgO/hvYaRLb7kMko5nNPWJ52nQFqKtehDl+
 t+FwyZrhd6QbErK3Y2z0bgPVcDHNTnGeTdHiITLsNA3Z42IyL74gFxk7+2XWWAZXaNN8
 8xgGPYCbhJKALZ3zK/E+upP0eyS9vPqt9iynlfbTj6Zr4sxnGr0OQY3eFCQuGWr+K2Vz
 pQbyAgulLLImZ62ffDNEoFp4Zzyd0VAE0d07sQI6MfiP5zcJi9viEkq7m8vRBrEfCWFD
 Ngdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ws2G4XMOp0lestkCd2/peNLCEqyj7X/oLG8H4z1egnA=;
 b=zAqfKctbXfGR1hw92EhPfnGdPzCj8yej55keHpn5WRPaTJ2XJigySQCL1t49Hi+P1+
 TRVAIcpjiji6RlB/6xz6q9WQpDNnBcya7A1++DF82XIuBCMcLcu5+evYQiztJzVuUIL8
 jo39ryITIJjAkB1biQFKhu3FNu8Z0Riwjz9XnDqv4oPSUDEo/6jay49xWv6c3ITxwNdU
 ii4t0io+KoWNq1i3TOlyHL1HmxMCjXWRJmc07HAPYu6aQDCPG5RQpLX2Kot4V4R25+7W
 WV7NcJpSMn5MGK9i3R/d2pZ/Pb8Hgt0ELXvuJf6zMPN8Lg+w3E4ZMwzsR4oO2ni66/zt
 pdrw==
X-Gm-Message-State: AFqh2kpZQkQr4frQgdLUdWXuVMQRorQvgVgUyfBN6KunIljQxwEe/e/1
 CrNzUmtH3e5l0lhnPnut+hmS2g==
X-Received: by 2002:a05:6a20:8e18:b0:ad:97cc:e957 with SMTP id
 y24-20020a056a208e1800b000ad97cce957mr65445314pzj.39.1674518479461; 
 Mon, 23 Jan 2023 16:01:19 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056a00189500b0058bc37f3d13sm174104pfh.43.2023.01.23.16.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 16:01:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, yier.jin@huawei.com, jonathan.cameron@huawei.com,
 leonardo.garcia@linaro.org
Subject: [PATCH 19/22] target/arm: Implement GPC exceptions
Date: Mon, 23 Jan 2023 14:00:24 -1000
Message-Id: <20230124000027.3565716-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124000027.3565716-1-richard.henderson@linaro.org>
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xlnKtQtykdBb

Handle GPC Fault types in arm_deliver_fault, reporting as
either a GPC exception at EL3, or falling through to insn
or data aborts at various exception levels.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h        |  1 +
 target/arm/internals.h  | 27 ++++++++++++
 target/arm/helper.c     |  5 +++
 target/arm/tlb_helper.c | 92 +++++++++++++++++++++++++++++++++++++++--
 4 files changed, 122 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 21b9afb773..7f6f157f54 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -57,6 +57,7 @@
 #define EXCP_UNALIGNED      22   /* v7M UNALIGNED UsageFault */
 #define EXCP_DIVBYZERO      23   /* v7M DIVBYZERO UsageFault */
 #define EXCP_VSERR          24
+#define EXCP_GPC            25   /* v9 Granule Protection Check Fault */
 /* NB: add new EXCP_ defines to the array in arm_log_exception() too */
 
 #define ARMV7M_EXCP_RESET   1
diff --git a/target/arm/internals.h b/target/arm/internals.h
index d9555309df..c9137e814c 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -352,14 +352,27 @@ typedef enum ARMFaultType {
     ARMFault_ICacheMaint,
     ARMFault_QEMU_NSCExec, /* v8M: NS executing in S&NSC memory */
     ARMFault_QEMU_SFault, /* v8M: SecureFault INVTRAN, INVEP or AUVIOL */
+    ARMFault_GPCFOnWalk,
+    ARMFault_GPCFOnOutput,
 } ARMFaultType;
 
+typedef enum ARMGPCF {
+    GPCF_None,
+    GPCF_AddressSize,
+    GPCF_Walk,
+    GPCF_EABT,
+    GPCF_Fail,
+} ARMGPCF;
+
 /**
  * ARMMMUFaultInfo: Information describing an ARM MMU Fault
  * @type: Type of fault
+ * @gpcf: Subtype of ARMFault_GPCFOn{Walk,Output}.
  * @level: Table walk level (for translation, access flag and permission faults)
  * @domain: Domain of the fault address (for non-LPAE CPUs only)
  * @s2addr: Address that caused a fault at stage 2
+ * @paddr: physical address that caused a fault for gpc
+ * @paddr_space: physical address space that caused a fault for gpc
  * @stage2: True if we faulted at stage 2
  * @s1ptw: True if we faulted at stage 2 while doing a stage 1 page-table walk
  * @s1ns: True if we faulted on a non-secure IPA while in secure state
@@ -368,7 +381,10 @@ typedef enum ARMFaultType {
 typedef struct ARMMMUFaultInfo ARMMMUFaultInfo;
 struct ARMMMUFaultInfo {
     ARMFaultType type;
+    ARMGPCF gpcf;
     target_ulong s2addr;
+    target_ulong paddr;
+    ARMSecuritySpace paddr_space;
     int level;
     int domain;
     bool stage2;
@@ -542,6 +558,17 @@ static inline uint32_t arm_fi_to_lfsc(ARMMMUFaultInfo *fi)
     case ARMFault_Exclusive:
         fsc = 0x35;
         break;
+    case ARMFault_GPCFOnWalk:
+        assert(fi->level >= -1 && fi->level <= 3);
+        if (fi->level < 0) {
+            fsc = 0b100011;
+        } else {
+            fsc = 0b100100 | fi->level;
+        }
+        break;
+    case ARMFault_GPCFOnOutput:
+        fsc = 0b101000;
+        break;
     default:
         /* Other faults can't occur in a context that requires a
          * long-format status code.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index bf78a1d74e..8d0b9a13c5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10014,6 +10014,7 @@ void arm_log_exception(CPUState *cs)
             [EXCP_UNALIGNED] = "v7M UNALIGNED UsageFault",
             [EXCP_DIVBYZERO] = "v7M DIVBYZERO UsageFault",
             [EXCP_VSERR] = "Virtual SERR",
+            [EXCP_GPC] = "Granule Protection Check",
         };
 
         if (idx >= 0 && idx < ARRAY_SIZE(excnames)) {
@@ -10740,6 +10741,10 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     }
 
     switch (cs->exception_index) {
+    case EXCP_GPC:
+        qemu_log_mask(CPU_LOG_INT, "...with MFAR 0x%" PRIx64 "\n",
+                      env->cp15.mfar_el3);
+        /* fall through */
     case EXCP_PREFETCH_ABORT:
     case EXCP_DATA_ABORT:
         /*
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 60abcbebe6..861dc0d566 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -109,17 +109,102 @@ static uint32_t compute_fsr_fsc(CPUARMState *env, ARMMMUFaultInfo *fi,
     return fsr;
 }
 
+static bool report_as_gpc_exception(ARMCPU *cpu, int current_el,
+                                    ARMMMUFaultInfo *fi)
+{
+    bool ret;
+
+    switch (fi->gpcf) {
+    case GPCF_None:
+        return false;
+    case GPCF_AddressSize:
+    case GPCF_Walk:
+    case GPCF_EABT:
+        /* R_PYTGX: GPT faults are reported as GPC. */
+        ret = true;
+        break;
+    case GPCF_Fail:
+        /*
+         * R_BLYPM: A GPF at EL3 is reported as insn or data abort.
+         * R_VBZMW, R_LXHQR: A GPF at EL[0-2] is reported as a GPC
+         * if SCR_EL3.GPF is set, otherwise an insn or data abort.
+         */
+        ret = (cpu->env.cp15.scr_el3 & SCR_GPF) && current_el != 3;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    assert(cpu_isar_feature(aa64_rme, cpu));
+    assert(fi->type == ARMFault_GPCFOnWalk ||
+           fi->type == ARMFault_GPCFOnOutput);
+    assert(fi->level >= 0 && fi->level <= 1);
+
+    return ret;
+}
+
+static unsigned encode_gpcsc(ARMMMUFaultInfo *fi)
+{
+    static uint8_t const gpcsc[] = {
+        [GPCF_AddressSize] = 0b00000,
+        [GPCF_Walk] = 0b00010,
+        [GPCF_Fail] = 0b00110,
+        [GPCF_EABT] = 0b01010,
+    };
+
+    /* Note that we've validated fi->gpcf and fi->level above. */
+    return gpcsc[fi->gpcf] | fi->level;
+}
+
 static G_NORETURN
 void arm_deliver_fault(ARMCPU *cpu, vaddr addr,
                        MMUAccessType access_type,
                        int mmu_idx, ARMMMUFaultInfo *fi)
 {
     CPUARMState *env = &cpu->env;
-    int target_el;
+    int target_el = exception_target_el(env);
+    int current_el = arm_current_el(env);
     bool same_el;
     uint32_t syn, exc, fsr, fsc;
 
-    target_el = exception_target_el(env);
+    if (report_as_gpc_exception(cpu, current_el, fi)) {
+        target_el = 3;
+
+        fsr = compute_fsr_fsc(env, fi, target_el, mmu_idx, &fsc);
+
+        syn = syn_gpc(fi->stage2 && fi->type == ARMFault_GPCFOnWalk,
+                      access_type == MMU_INST_FETCH,
+                      encode_gpcsc(fi), 0, fi->s1ptw,
+                      access_type == MMU_DATA_STORE, fsc);
+
+        env->cp15.mfar_el3 = fi->paddr;
+        switch (fi->paddr_space) {
+        case ARMSS_Secure:
+            break;
+        case ARMSS_NonSecure:
+            env->cp15.mfar_el3 |= R_MFAR_NS_MASK;
+            break;
+        case ARMSS_Root:
+            env->cp15.mfar_el3 |= R_MFAR_NSE_MASK;
+            break;
+        case ARMSS_Realm:
+            env->cp15.mfar_el3 |= R_MFAR_NSE_MASK | R_MFAR_NS_MASK;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
+        exc = EXCP_GPC;
+        goto do_raise;
+    }
+
+    /* If SCR_EL3.GPF is unset, GPF may still be routed to EL2. */
+    if (fi->gpcf == GPCF_Fail && target_el < 2) {
+        if (arm_hcr_el2_eff(env) & HCR_GPF) {
+            target_el = 2;
+        }
+    }
+
     if (fi->stage2) {
         target_el = 2;
         env->cp15.hpfar_el2 = extract64(fi->s2addr, 12, 47) << 4;
@@ -127,8 +212,8 @@ void arm_deliver_fault(ARMCPU *cpu, vaddr addr,
             env->cp15.hpfar_el2 |= HPFAR_NS;
         }
     }
-    same_el = (arm_current_el(env) == target_el);
 
+    same_el = current_el == target_el;
     fsr = compute_fsr_fsc(env, fi, target_el, mmu_idx, &fsc);
 
     if (access_type == MMU_INST_FETCH) {
@@ -146,6 +231,7 @@ void arm_deliver_fault(ARMCPU *cpu, vaddr addr,
         exc = EXCP_DATA_ABORT;
     }
 
+ do_raise:
     env->exception.vaddress = addr;
     env->exception.fsr = fsr;
     raise_exception(env, exc, syn, target_el);
-- 
2.34.1

