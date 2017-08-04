Received: by 10.25.221.202 with SMTP id w71csp2347832lfi;
        Fri, 4 Aug 2017 10:23:20 -0700 (PDT)
X-Received: by 10.55.41.217 with SMTP id p86mr3867911qkp.149.1501867400752;
        Fri, 04 Aug 2017 10:23:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501867400; cv=none;
        d=google.com; s=arc-20160816;
        b=hsOPCldRp67BT0xrJcV+wk3UcV/VP2Tke5N/UaB5MnYL1pngrdCwzGF7ORYg5guVDM
         eVcgdOg0Fc0tOcTIX343+u2TSzmw6Z2GEY5ojmeAV8Ccy++Ts6W17qFij3d4rdFtUvx7
         sUFTI3g2/GDbXLMHbffTNLrsuvGTwmvBEQ/oMZv9JPuWFshg/XCf01kROUKhmnNe7xMZ
         9V2AhtUZKQQ3TGp1LfALQe4PFANcj+1fD2CL5kWUPh+Up/M8bQCpxDXVzTBh/3E7qRF2
         Rst83YF7xYi9t8FqjdoTFOuVzDo+EYzj/F7MLd/C9iw/Gi35/MGEzOS0InRZvG7znV9+
         ciaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=C16fJ8JYr8wFFHw+NaG9FU/yBLMYYDgNg9wiKW8V0nw=;
        b=Sc4EiXDYa7CjDErvfWVPZ9EfQXx0ThXZUF4PTkcf8qrxzd3dKl13Nx7PiETiI6dekd
         u/d0xibvte4/5AWanRcpxYnj8nNlhPgoGQqMR12bgPfG+/xdOyskrGOkJb4bFpN2OEvo
         lyzZvhh9/XSUgw5BTf2rBNpeSIEnYV5w6g+dO9eU/A409wNvd5KKZUWve6tJXNT3+Egs
         3tCXhvKhaTdjPRd0afh92xa+t/J/qACHSzIRQclJ1Be+m3qycBlI776IM6IYAaPN8TBt
         /53EBChaAxMnrLDmJVUS7Aqmu/xHXMzUtOiqKPXpZ1Uph8JsAIgMi8N6UwpDhYq4VLAN
         GztQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p18si1962813qta.19.2017.08.04.10.23.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 10:23:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38760 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddgJi-0000NH-6w
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 13:23:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39770)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ddgHX-0007Ew-Qu
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 13:21:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ddgHW-0001Wf-CO
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 13:21:03 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37794)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ddgHW-0001Dp-3J; Fri, 04 Aug 2017 13:21:02 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ddgHN-0006to-DB; Fri, 04 Aug 2017 18:20:53 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  4 Aug 2017 18:20:47 +0100
Message-Id: <1501867249-1924-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 6/8] target/arm: Factor out fault delivery code
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <rth@twiddle.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rkx0mzHpQpo0

We currently have some similar code in tlb_fill() and in
arm_cpu_do_unaligned_access() for delivering a data abort or prefetch
abort.  We're also going to want to do the same thing to handle
external aborts.  Factor out the common code into a new function
deliver_fault().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/op_helper.c | 110 +++++++++++++++++++++++++------------------------
 1 file changed, 57 insertions(+), 53 deletions(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 2a85666..aa52a98 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -115,6 +115,51 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
     return syn;
 }
 
+static void deliver_fault(ARMCPU *cpu, vaddr addr, MMUAccessType access_type,
+                          uint32_t fsr, uint32_t fsc, ARMMMUFaultInfo *fi)
+{
+    CPUARMState *env = &cpu->env;
+    int target_el;
+    bool same_el;
+    uint32_t syn, exc;
+
+    target_el = exception_target_el(env);
+    if (fi->stage2) {
+        target_el = 2;
+        env->cp15.hpfar_el2 = extract64(fi->s2addr, 12, 47) << 4;
+    }
+    same_el = (arm_current_el(env) == target_el);
+
+    if (fsc == 0x3f) {
+        /* Caller doesn't have a long-format fault status code. This
+         * should only happen if this fault will never actually be reported
+         * to an EL that uses a syndrome register. Check that here.
+         * 0x3f is a (currently) reserved FSR code, in case the constructed
+         * syndrome does leak into the guest somehow.
+         */
+        assert(target_el != 2 && !arm_el_is_aa64(env, target_el));
+    }
+
+    if (access_type == MMU_INST_FETCH) {
+        syn = syn_insn_abort(same_el, 0, fi->s1ptw, fsc);
+        exc = EXCP_PREFETCH_ABORT;
+    } else {
+        syn = merge_syn_data_abort(env->exception.syndrome, target_el,
+                                   same_el, fi->s1ptw,
+                                   access_type == MMU_DATA_STORE,
+                                   fsc);
+        if (access_type == MMU_DATA_STORE
+            && arm_feature(env, ARM_FEATURE_V6)) {
+            fsr |= (1 << 11);
+        }
+        exc = EXCP_DATA_ABORT;
+    }
+
+    env->exception.vaddress = addr;
+    env->exception.fsr = fsr;
+    raise_exception(env, exc, syn, target_el);
+}
+
 /* try to fill the TLB and return an exception if error. If retaddr is
  * NULL, it means that the function was called in C code (i.e. not
  * from generated code or from helper.c)
@@ -129,23 +174,13 @@ void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
     ret = arm_tlb_fill(cs, addr, access_type, mmu_idx, &fsr, &fi);
     if (unlikely(ret)) {
         ARMCPU *cpu = ARM_CPU(cs);
-        CPUARMState *env = &cpu->env;
-        uint32_t syn, exc, fsc;
-        unsigned int target_el;
-        bool same_el;
+        uint32_t fsc;
 
         if (retaddr) {
             /* now we have a real cpu fault */
             cpu_restore_state(cs, retaddr);
         }
 
-        target_el = exception_target_el(env);
-        if (fi.stage2) {
-            target_el = 2;
-            env->cp15.hpfar_el2 = extract64(fi.s2addr, 12, 47) << 4;
-        }
-        same_el = arm_current_el(env) == target_el;
-
         if (fsr & (1 << 9)) {
             /* LPAE format fault status register : bottom 6 bits are
              * status code in the same form as needed for syndrome
@@ -153,34 +188,15 @@ void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
             fsc = extract32(fsr, 0, 6);
         } else {
             /* Short format FSR : this fault will never actually be reported
-             * to an EL that uses a syndrome register. Check that here,
-             * and use a (currently) reserved FSR code in case the constructed
-             * syndrome does leak into the guest somehow.
+             * to an EL that uses a syndrome register. Use a (currently)
+             * reserved FSR code in case the constructed syndrome does leak
+             * into the guest somehow. deliver_fault will assert that
+             * we don't target an EL using the syndrome.
              */
-            assert(target_el != 2 && !arm_el_is_aa64(env, target_el));
             fsc = 0x3f;
         }
 
-        /* For insn and data aborts we assume there is no instruction syndrome
-         * information; this is always true for exceptions reported to EL1.
-         */
-        if (access_type == MMU_INST_FETCH) {
-            syn = syn_insn_abort(same_el, 0, fi.s1ptw, fsc);
-            exc = EXCP_PREFETCH_ABORT;
-        } else {
-            syn = merge_syn_data_abort(env->exception.syndrome, target_el,
-                                       same_el, fi.s1ptw,
-                                       access_type == MMU_DATA_STORE, fsc);
-            if (access_type == MMU_DATA_STORE
-                && arm_feature(env, ARM_FEATURE_V6)) {
-                fsr |= (1 << 11);
-            }
-            exc = EXCP_DATA_ABORT;
-        }
-
-        env->exception.vaddress = addr;
-        env->exception.fsr = fsr;
-        raise_exception(env, exc, syn, target_el);
+        deliver_fault(cpu, addr, access_type, fsr, fsc, &fi);
     }
 }
 
@@ -191,9 +207,8 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    int target_el;
-    bool same_el;
-    uint32_t syn;
+    uint32_t fsr, fsc;
+    ARMMMUFaultInfo fi = {};
     ARMMMUIdx arm_mmu_idx = core_to_arm_mmu_idx(env, mmu_idx);
 
     if (retaddr) {
@@ -201,28 +216,17 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
         cpu_restore_state(cs, retaddr);
     }
 
-    target_el = exception_target_el(env);
-    same_el = (arm_current_el(env) == target_el);
-
-    env->exception.vaddress = vaddr;
-
     /* the DFSR for an alignment fault depends on whether we're using
      * the LPAE long descriptor format, or the short descriptor format
      */
     if (arm_s1_regime_using_lpae_format(env, arm_mmu_idx)) {
-        env->exception.fsr = (1 << 9) | 0x21;
+        fsr = (1 << 9) | 0x21;
     } else {
-        env->exception.fsr = 0x1;
-    }
-
-    if (access_type == MMU_DATA_STORE && arm_feature(env, ARM_FEATURE_V6)) {
-        env->exception.fsr |= (1 << 11);
+        fsr = 0x1;
     }
+    fsc = 0x21;
 
-    syn = merge_syn_data_abort(env->exception.syndrome, target_el,
-                               same_el, 0, access_type == MMU_DATA_STORE,
-                               0x21);
-    raise_exception(env, EXCP_DATA_ABORT, syn, target_el);
+    deliver_fault(cpu, vaddr, access_type, fsr, fsc, &fi);
 }
 
 #endif /* !defined(CONFIG_USER_ONLY) */
-- 
2.7.4

