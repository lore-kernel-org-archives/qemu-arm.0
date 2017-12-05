Received: by 10.223.159.74 with SMTP id f10csp3221650wrg;
        Tue, 5 Dec 2017 11:50:26 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYM1WL8GDQF1ZJ+bZYRIwPTsA1JNZlsKezvexklFRmMSiTA9UpViWvSjBlEDeIY7EK6bKbV
X-Received: by 10.37.32.138 with SMTP id g132mr9013838ybg.35.1512503426142;
        Tue, 05 Dec 2017 11:50:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512503426; cv=none;
        d=google.com; s=arc-20160816;
        b=PwgAo5FkU2+IYvw3E1kyyVgG/YX/aMpoqg1HbYI+rguXLEoGtdBXjbzFotDFztbGnj
         MaRuxb4eugR81VmEXFEmdnqf5RBcBg09p99sJSUvI3Ln4eGyqNKkLOPBOYFQWhfHb1B6
         8MhYc1kKu1vh943giA/tveLExWf6hWW/GXxt3M2HBs/TQR7qRFq+O+q+YqDOL4HZ7INW
         BFl6zXGd6tTYMaUHfos9kJlUKCb9U/zClr9oVeWoUPwbpxSeOEHDc2MCLwRzT12ud0Ub
         304DwwAJBPDud5ZKQ7mQpDq8kKKO/kLIkKEaJL30zpvTkgdx8aYSswmhV+K2Wf6M8PjD
         CH3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=CwhYfMOiSAZu0iD7QYDviMwVBzN6EUTqx08eX+sAN+s=;
        b=oj5VlOsSTDWqM5WJWHL2JK35HkwOQISrLNPTSKFfhEakhtQElIoDAwThJMtpIQi25T
         cIyXlCkXace/xCoC4E3UFy7SmIgDxwXjdgGxh7S5epAwVqZRfSLaMCwgtswvlY0dr1wY
         1TIOXYr1gtRBOw8fBKW5D7jtlTv/RrxddAmloR1LTXBTovscTJOaCGpUJcYLkhqbpBsi
         3bng6t4HrNN9FadlkCklAPfZTvWC8Oz+hCBCxfiPZ6SSbx4wLIdl2blERSHF1uvGbDo2
         WGiIqTqB9IET8nuho17eqdxupat4LUkWmi/QFaXTR4CnXqFItV4j4DQkHRGIYdr6UIKw
         Rs7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g24si238209ybj.379.2017.12.05.11.50.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Dec 2017 11:50:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51786 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eMJEX-0004nx-GS
	for alex.bennee@linaro.org; Tue, 05 Dec 2017 14:50:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eMJB1-0000zh-JW
	for qemu-arm@nongnu.org; Tue, 05 Dec 2017 14:46:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eMJB0-0002Jj-73
	for qemu-arm@nongnu.org; Tue, 05 Dec 2017 14:46:47 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38776)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eMJAz-0002CW-Vl; Tue, 05 Dec 2017 14:46:46 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eMJAt-0005CG-OZ; Tue, 05 Dec 2017 19:46:39 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  5 Dec 2017 19:46:29 +0000
Message-Id: <1512503192-2239-10-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512503192-2239-1-git-send-email-peter.maydell@linaro.org>
References: <1512503192-2239-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 09/12] target/arm: Use ARMMMUFaultInfo in
 deliver_fault()
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Stefano Stabellini <sstabellini@kernel.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LTSzi9HG8GQG

Now that ARMMMUFaultInfo is guaranteed to have enough information
to construct a fault status code, we can pass it in to the
deliver_fault() function and let it generate the correct type
of FSR for the destination, rather than relying on the value
provided by get_phys_addr().

I don't think there are any cases the old code was getting
wrong, but this is more obviously correct.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/op_helper.c | 79 ++++++++++++++------------------------------------
 1 file changed, 22 insertions(+), 57 deletions(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index a40a84a..38e6993 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -116,12 +116,13 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
 }
 
 static void deliver_fault(ARMCPU *cpu, vaddr addr, MMUAccessType access_type,
-                          uint32_t fsr, uint32_t fsc, ARMMMUFaultInfo *fi)
+                          int mmu_idx, ARMMMUFaultInfo *fi)
 {
     CPUARMState *env = &cpu->env;
     int target_el;
     bool same_el;
-    uint32_t syn, exc;
+    uint32_t syn, exc, fsr, fsc;
+    ARMMMUIdx arm_mmu_idx = core_to_arm_mmu_idx(env, mmu_idx);
 
     target_el = exception_target_el(env);
     if (fi->stage2) {
@@ -130,14 +131,21 @@ static void deliver_fault(ARMCPU *cpu, vaddr addr, MMUAccessType access_type,
     }
     same_el = (arm_current_el(env) == target_el);
 
-    if (fsc == 0x3f) {
-        /* Caller doesn't have a long-format fault status code. This
-         * should only happen if this fault will never actually be reported
-         * to an EL that uses a syndrome register. Check that here.
-         * 0x3f is a (currently) reserved FSC code, in case the constructed
-         * syndrome does leak into the guest somehow.
+    if (target_el == 2 || arm_el_is_aa64(env, target_el) ||
+        arm_s1_regime_using_lpae_format(env, arm_mmu_idx)) {
+        /* LPAE format fault status register : bottom 6 bits are
+         * status code in the same form as needed for syndrome
+         */
+        fsr = arm_fi_to_lfsc(fi);
+        fsc = extract32(fsr, 0, 6);
+    } else {
+        fsr = arm_fi_to_sfsc(fi);
+        /* Short format FSR : this fault will never actually be reported
+         * to an EL that uses a syndrome register. Use a (currently)
+         * reserved FSR code in case the constructed syndrome does leak
+         * into the guest somehow.
          */
-        assert(target_el != 2 && !arm_el_is_aa64(env, target_el));
+        fsc = 0x3f;
     }
 
     if (access_type == MMU_INST_FETCH) {
@@ -174,29 +182,13 @@ void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
     ret = arm_tlb_fill(cs, addr, access_type, mmu_idx, &fsr, &fi);
     if (unlikely(ret)) {
         ARMCPU *cpu = ARM_CPU(cs);
-        uint32_t fsc;
 
         if (retaddr) {
             /* now we have a real cpu fault */
             cpu_restore_state(cs, retaddr);
         }
 
-        if (fsr & (1 << 9)) {
-            /* LPAE format fault status register : bottom 6 bits are
-             * status code in the same form as needed for syndrome
-             */
-            fsc = extract32(fsr, 0, 6);
-        } else {
-            /* Short format FSR : this fault will never actually be reported
-             * to an EL that uses a syndrome register. Use a (currently)
-             * reserved FSR code in case the constructed syndrome does leak
-             * into the guest somehow. deliver_fault will assert that
-             * we don't target an EL using the syndrome.
-             */
-            fsc = 0x3f;
-        }
-
-        deliver_fault(cpu, addr, access_type, fsr, fsc, &fi);
+        deliver_fault(cpu, addr, access_type, mmu_idx, &fi);
     }
 }
 
@@ -206,27 +198,15 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                  int mmu_idx, uintptr_t retaddr)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    uint32_t fsr, fsc;
     ARMMMUFaultInfo fi = {};
-    ARMMMUIdx arm_mmu_idx = core_to_arm_mmu_idx(env, mmu_idx);
 
     if (retaddr) {
         /* now we have a real cpu fault */
         cpu_restore_state(cs, retaddr);
     }
 
-    /* the DFSR for an alignment fault depends on whether we're using
-     * the LPAE long descriptor format, or the short descriptor format
-     */
-    if (arm_s1_regime_using_lpae_format(env, arm_mmu_idx)) {
-        fsr = (1 << 9) | 0x21;
-    } else {
-        fsr = 0x1;
-    }
-    fsc = 0x21;
-
-    deliver_fault(cpu, vaddr, access_type, fsr, fsc, &fi);
+    fi.type = ARMFault_Alignment;
+    deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
 }
 
 /* arm_cpu_do_transaction_failed: handle a memory system error response
@@ -240,10 +220,7 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                    MemTxResult response, uintptr_t retaddr)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    uint32_t fsr, fsc;
     ARMMMUFaultInfo fi = {};
-    ARMMMUIdx arm_mmu_idx = core_to_arm_mmu_idx(env, mmu_idx);
 
     if (retaddr) {
         /* now we have a real cpu fault */
@@ -256,20 +233,8 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
      * Slave error (1); in QEMU we follow that.
      */
     fi.ea = (response != MEMTX_DECODE_ERROR);
-
-    /* The fault status register format depends on whether we're using
-     * the LPAE long descriptor format, or the short descriptor format.
-     */
-    if (arm_s1_regime_using_lpae_format(env, arm_mmu_idx)) {
-        /* long descriptor form, STATUS 0b010000: synchronous ext abort */
-        fsr = (fi.ea << 12) | (1 << 9) | 0x10;
-    } else {
-        /* short descriptor form, FSR 0b01000 : synchronous ext abort */
-        fsr = (fi.ea << 12) | 0x8;
-    }
-    fsc = 0x10;
-
-    deliver_fault(cpu, addr, access_type, fsr, fsc, &fi);
+    fi.type = ARMFault_SyncExternal;
+    deliver_fault(cpu, addr, access_type, mmu_idx, &fi);
 }
 
 #endif /* !defined(CONFIG_USER_ONLY) */
-- 
2.7.4

