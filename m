Received: by 10.223.159.74 with SMTP id f10csp616360wrg;
        Fri, 15 Dec 2017 08:24:53 -0800 (PST)
X-Google-Smtp-Source: ACJfBotn1GgJudRBkvoaaJOi7aXMQTcFlBvSFXCaw6a7YPVVgW0CY/PXG9I5lhyEKtwEni4Ye3wT
X-Received: by 10.129.112.1 with SMTP id l1mr7282858ywc.389.1513355093865;
        Fri, 15 Dec 2017 08:24:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513355093; cv=none;
        d=google.com; s=arc-20160816;
        b=O6Jocz5bRHhslOAzoG5zNalk/yLQ7OVKTwaMGU8syDVW5Rb7Tlb3HM2RKAdsu7WCJx
         UF+/L2ZTkXOJkc3+tXnMyPMn4EyzN7OcGJSbzekHZ1MCnpLQCW5vBA+ePWcNtF6Lb9BT
         wrElK0qSjFwvNi8xVJWhJ2YENt8Itn1Z30a3Z27Mwj8id08kmGUlBckotOxmnX1R+kRy
         L1jprouKCytBy4PEWamBA1LWcw7Mg9qCDRrs5/s0Q4xJzRoKy8+r4Td9Xgt1VEzOMVJw
         kuPTrvL18bgAgInUeSkb6N+kAN3YtMfzwGQFlF8BtDpTaaKbSZ+hH9Yzdih4DCZwAhSl
         gXIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=lR2VonSoBuliqMZ+RGICsGZqxeHtf+erLzMkmRuBt60=;
        b=mfFma7/9KiMive6lJUFciF6kkChKGX0/r4C8r1X3vnVXsX+B9sKbk+WcaXogZ0/A0v
         iZxEhRnCxFFqZdKBqklyWpeM2s5Hjwxd/S1LSpyhGy8yxv/W6KsimrBbojW6CDR8U+ar
         +xizN0j64NrBjMC+u+6022k8102DeMiizKtCB44g0l3A+NHKa47NTH+4+dyDC34W0zUu
         MBobOs5HgAWgwDuaoVwn1rvhm1TFYqvpXsEj4RbVuoCtPYJ0RXE8ryLM7gXJtro71OeZ
         4WkBhn3YHN6++PzNWvBIYjYngFLP4j+yd171ejV6+pVCEiIwwl6rRs/okoOjDjiQ1rzT
         vTqA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f5si1396260ywi.149.2017.12.15.08.24.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Dec 2017 08:24:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47450 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePsn7-0007a5-6u
	for alex.bennee@linaro.org; Fri, 15 Dec 2017 11:24:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42437)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ePsmv-0007Xz-Fx
	for qemu-arm@nongnu.org; Fri, 15 Dec 2017 11:24:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ePsmu-0006OJ-1I
	for qemu-arm@nongnu.org; Fri, 15 Dec 2017 11:24:41 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:39218)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ePsmt-0006Ky-Oj; Fri, 15 Dec 2017 11:24:39 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ePsmr-0002Ch-Oy; Fri, 15 Dec 2017 16:24:37 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 15 Dec 2017 16:24:36 +0000
Message-Id: <1513355076-5075-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] target/arm: Handle page table walk load failures
 correctly
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3EPE4vxFVIib

Instead of ignoring the response from address_space_ld*()
(indicating an attempt to read a page table descriptor from
an invalid physical address), use it to report the failure
correctly.

Since this is another couple of locations where we need to
decide the value of the ARMMMUFaultInfo ea bit based on a
MemTxResult, we factor out that operation into a helper
function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Now we've fixed the get-phys-addr functions to always report
errors via the ARMMMUFaultInfo struct, it's pretty easy to
detect and report external aborts on translation table walks.

 target/arm/internals.h | 10 ++++++++++
 target/arm/helper.c    | 39 ++++++++++++++++++++++++++++++++++-----
 target/arm/op_helper.c |  7 +------
 3 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 876854d..89f5d2f 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -687,6 +687,16 @@ static inline uint32_t arm_fi_to_lfsc(ARMMMUFaultInfo *fi)
     return fsc;
 }
 
+static inline bool arm_extabort_type(MemTxResult result)
+{
+    /* The EA bit in syndromes and fault status registers is an
+     * IMPDEF classification of external aborts. ARM implementations
+     * usually use this to indicate AXI bus Decode error (0) or
+     * Slave error (1); in QEMU we follow that.
+     */
+    return result != MEMTX_DECODE_ERROR;
+}
+
 /* Do a page table walk and add page to TLB if possible */
 bool arm_tlb_fill(CPUState *cpu, vaddr address,
                   MMUAccessType access_type, int mmu_idx,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d1395f9..2575a83 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8305,6 +8305,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         ret = get_phys_addr_lpae(env, addr, 0, ARMMMUIdx_S2NS, &s2pa,
                                  &txattrs, &s2prot, &s2size, fi, NULL);
         if (ret) {
+            assert(fi->type != ARMFault_None);
             fi->s2addr = addr;
             fi->stage2 = true;
             fi->s1ptw = true;
@@ -8328,7 +8329,9 @@ static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     MemTxAttrs attrs = {};
+    MemTxResult result = MEMTX_OK;
     AddressSpace *as;
+    uint32_t data;
 
     attrs.secure = is_secure;
     as = arm_addressspace(cs, attrs);
@@ -8337,10 +8340,16 @@ static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
         return 0;
     }
     if (regime_translation_big_endian(env, mmu_idx)) {
-        return address_space_ldl_be(as, addr, attrs, NULL);
+        data = address_space_ldl_be(as, addr, attrs, &result);
     } else {
-        return address_space_ldl_le(as, addr, attrs, NULL);
+        data = address_space_ldl_le(as, addr, attrs, &result);
     }
+    if (result == MEMTX_OK) {
+        return data;
+    }
+    fi->type = ARMFault_SyncExternalOnWalk;
+    fi->ea = arm_extabort_type(result);
+    return 0;
 }
 
 static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
@@ -8349,7 +8358,9 @@ static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     MemTxAttrs attrs = {};
+    MemTxResult result = MEMTX_OK;
     AddressSpace *as;
+    uint32_t data;
 
     attrs.secure = is_secure;
     as = arm_addressspace(cs, attrs);
@@ -8358,10 +8369,16 @@ static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
         return 0;
     }
     if (regime_translation_big_endian(env, mmu_idx)) {
-        return address_space_ldq_be(as, addr, attrs, NULL);
+        data = address_space_ldq_be(as, addr, attrs, &result);
     } else {
-        return address_space_ldq_le(as, addr, attrs, NULL);
+        data = address_space_ldq_le(as, addr, attrs, &result);
+    }
+    if (result == MEMTX_OK) {
+        return data;
     }
+    fi->type = ARMFault_SyncExternalOnWalk;
+    fi->ea = arm_extabort_type(result);
+    return 0;
 }
 
 static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
@@ -8390,6 +8407,9 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
     }
     desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
                        mmu_idx, fi);
+    if (fi->type != ARMFault_None) {
+        goto do_fault;
+    }
     type = (desc & 3);
     domain = (desc >> 5) & 0x0f;
     if (regime_el(env, mmu_idx) == 1) {
@@ -8426,6 +8446,9 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         }
         desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
                            mmu_idx, fi);
+        if (fi->type != ARMFault_None) {
+            goto do_fault;
+        }
         switch (desc & 3) {
         case 0: /* Page translation fault.  */
             fi->type = ARMFault_Translation;
@@ -8508,6 +8531,9 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
     }
     desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
                        mmu_idx, fi);
+    if (fi->type != ARMFault_None) {
+        goto do_fault;
+    }
     type = (desc & 3);
     if (type == 0 || (type == 3 && !arm_feature(env, ARM_FEATURE_PXN))) {
         /* Section translation fault, or attempt to use the encoding
@@ -8559,6 +8585,9 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
         desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
                            mmu_idx, fi);
+        if (fi->type != ARMFault_None) {
+            goto do_fault;
+        }
         ap = ((desc >> 4) & 3) | ((desc >> 7) & 4);
         switch (desc & 3) {
         case 0: /* Page translation fault.  */
@@ -8964,7 +8993,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         descaddr &= ~7ULL;
         nstable = extract32(tableattrs, 4, 1);
         descriptor = arm_ldq_ptw(cs, descaddr, !nstable, mmu_idx, fi);
-        if (fi->s1ptw) {
+        if (fi->type != ARMFault_None) {
             goto do_fault;
         }
 
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index c2bb4f3..2f35ff7 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -226,12 +226,7 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
         cpu_restore_state(cs, retaddr);
     }
 
-    /* The EA bit in syndromes and fault status registers is an
-     * IMPDEF classification of external aborts. ARM implementations
-     * usually use this to indicate AXI bus Decode error (0) or
-     * Slave error (1); in QEMU we follow that.
-     */
-    fi.ea = (response != MEMTX_DECODE_ERROR);
+    fi.ea = arm_extabort_type(response);
     fi.type = ARMFault_SyncExternal;
     deliver_fault(cpu, addr, access_type, mmu_idx, &fi);
 }
-- 
2.7.4

