Received: by 10.25.15.230 with SMTP id 99csp763773lfp;
        Thu, 6 Apr 2017 06:44:30 -0700 (PDT)
X-Received: by 10.55.145.198 with SMTP id t189mr2547412qkd.155.1491486269989;
        Thu, 06 Apr 2017 06:44:29 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o16si1433340qto.176.2017.04.06.06.44.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Apr 2017 06:44:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45922 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cw7i9-0002hY-DH
	for alex.bennee@linaro.org; Thu, 06 Apr 2017 09:44:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60905)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cw7gU-0001aN-LS
	for qemu-devel@nongnu.org; Thu, 06 Apr 2017 09:42:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cw7gT-0007cH-MS
	for qemu-devel@nongnu.org; Thu, 06 Apr 2017 09:42:46 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:49074)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cw7gR-0007Ze-4o; Thu, 06 Apr 2017 09:42:43 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cw7gH-0001oB-8m; Thu, 06 Apr 2017 14:42:33 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Apr 2017 14:42:32 +0100
Message-Id: <1491486152-24304-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH] target/arm: Add assertion about FSC format for
 syndrome registers
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3klOFnUPn+gB

In tlb_fill() we construct a syndrome register value from a
fault status register value which is filled in by arm_tlb_fill().
arm_tlb_fill() returns FSR values which might be in the format
used with short-format page descriptors, or the format used
with long-format (LPAE) descriptors. The syndrome register
always uses LPAE-format FSR status codes.

It isn't actually possible to end up delivering a syndrome
register value to the guest for a fault which is reported
with a short-format FSR (that kind of stage 1 fault will only
happen for an AArch32 translation regime which doesn't have
a syndrome register, and can never be redirected to an AArch64
or Hyp exception level). Add an assertion which checks this,
and adjust the code so that we construct a syndrome with
an invalid status code, rather than allowing set bits in
the FSR input to randomly corrupt other fields in the syndrome.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
It took me a little while to convince myself that you'd
never take a short-format FSR to a using-syndrome EL :-)
---
 target/arm/op_helper.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index d64c867..156b825 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -130,7 +130,7 @@ void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
     if (unlikely(ret)) {
         ARMCPU *cpu = ARM_CPU(cs);
         CPUARMState *env = &cpu->env;
-        uint32_t syn, exc;
+        uint32_t syn, exc, fsc;
         unsigned int target_el;
         bool same_el;
 
@@ -145,19 +145,32 @@ void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
             env->cp15.hpfar_el2 = extract64(fi.s2addr, 12, 47) << 4;
         }
         same_el = arm_current_el(env) == target_el;
-        /* AArch64 syndrome does not have an LPAE bit */
-        syn = fsr & ~(1 << 9);
+
+        if (fsr & (1 << 9)) {
+            /* LPAE format fault status register : bottom 6 bits are
+             * status code in the same form as needed for syndrome
+             */
+            fsc = extract32(fsr, 0, 6);
+        } else {
+            /* Short format FSR : this fault will never actually be reported
+             * to an EL that uses a syndrome register. Check that here,
+             * and use a (currently) reserved FSR code in case the constructed
+             * syndrome does leak into the guest somehow.
+             */
+            assert(target_el != 2 && !arm_el_is_aa64(env, target_el));
+            fsc = 0x3f;
+        }
 
         /* For insn and data aborts we assume there is no instruction syndrome
          * information; this is always true for exceptions reported to EL1.
          */
         if (access_type == MMU_INST_FETCH) {
-            syn = syn_insn_abort(same_el, 0, fi.s1ptw, syn);
+            syn = syn_insn_abort(same_el, 0, fi.s1ptw, fsc);
             exc = EXCP_PREFETCH_ABORT;
         } else {
             syn = merge_syn_data_abort(env->exception.syndrome, target_el,
                                        same_el, fi.s1ptw,
-                                       access_type == MMU_DATA_STORE, syn);
+                                       access_type == MMU_DATA_STORE, fsc);
             if (access_type == MMU_DATA_STORE
                 && arm_feature(env, ARM_FEATURE_V6)) {
                 fsr |= (1 << 11);
-- 
2.7.4

