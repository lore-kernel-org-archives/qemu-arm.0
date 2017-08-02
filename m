Received: by 10.25.44.15 with SMTP id s15csp6353909lfs;
        Wed, 2 Aug 2017 09:44:34 -0700 (PDT)
X-Received: by 10.200.58.199 with SMTP id x65mr31446322qte.205.1501692274265;
        Wed, 02 Aug 2017 09:44:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501692274; cv=none;
        d=google.com; s=arc-20160816;
        b=Pa0+tfuw5XTejS+EXsdLc3B6ZnOZsmUoB8qb/ekzoGPDFvcr7TXScVQ3gHV2ZP/IBO
         xr8x9zdPwn7lwfx072Ejp/34kfdRPsTqzp8WUk2CuYS6bgf8As8hwKMZmCoWCrqKFl3U
         079zMazYE80d5ihIQZ9F+Q84tORiZSy8ixEwivKlZg27RZj8OZ5CwD8fU5OZtNrfWNxH
         ZOsuO+wNoa/ZP1SqIvCkkpCILIsUbPNIWi/kvIaoWsvGe69A/k3JzkQL/XAGKCxr0ccZ
         6wx6jphfA3LhgJZ8RyJPDnowuak7PQVVhmTz/YWO0Of0q+nTtxeTkOmFnKAIPlWaiXN+
         bUnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=CQdlDl5aBe8iqU3gOzUqL5ebvEfFMPwSAjNBCTRywp8=;
        b=yAVkeZQP7Xlp2Oh2QvcjUG30QJRhWUYa3TXhfjNU/OjfX4AMADLMlu9lW3o9syqqKp
         8sH2RcGStLmmrlIYFZPXEeOQgmoMQYflY5/TCdqYLtPLJ90wtoRpzJSjTe4rh7bEykvx
         Aixok4NAQsXnfhrDYuXs303dxcf8qtlAJYmsxwkX4HeTWfTG5nEH8soPjvV1eK2VYBf6
         KUnqg1aHAQHfbz+fe4dTO/TY8AWFj1TN+4l73Zu7u7YrWXR8Mgbmw/9ljbI8DaDtK1TD
         Bc13NhTq8MiZHkifyBedvD3Fdf1XzcvX65Fx8qgHmrsc7V+agKAncjVe+fZR0HqNJm+f
         Dtcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v62si28597712qkc.104.2017.08.02.09.44.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 09:44:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48667 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcwl5-0003Ti-Hp
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 12:44:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwl2-0003TY-BL
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 12:44:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwl1-0004Xg-1i
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 12:44:28 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37764)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dcwl0-0003zA-NO; Wed, 02 Aug 2017 12:44:26 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dcwkc-0003wC-QZ; Wed, 02 Aug 2017 17:44:02 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed,  2 Aug 2017 17:43:47 +0100
Message-Id: <1501692241-23310-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 01/15] target/arm: Use MMUAccessType enum rather
 than int
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
X-TUID: GV6GgvxjeH6Z

In the ARM get_phys_addr() code, switch to using the MMUAccessType
enum and its MMU_* values rather than int and literal 0/1/2.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c    | 30 +++++++++++++++---------------
 target/arm/internals.h |  3 ++-
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index fa60040..b78d277 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -20,13 +20,13 @@
 
 #ifndef CONFIG_USER_ONLY
 static bool get_phys_addr(CPUARMState *env, target_ulong address,
-                          int access_type, ARMMMUIdx mmu_idx,
+                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
                           hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
                           target_ulong *page_size, uint32_t *fsr,
                           ARMMMUFaultInfo *fi);
 
 static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
-                               int access_type, ARMMMUIdx mmu_idx,
+                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
                                target_ulong *page_size_ptr, uint32_t *fsr,
                                ARMMMUFaultInfo *fi);
@@ -2135,7 +2135,7 @@ static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
 }
 
 static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
-                             int access_type, ARMMMUIdx mmu_idx)
+                             MMUAccessType access_type, ARMMMUIdx mmu_idx)
 {
     hwaddr phys_addr;
     target_ulong page_size;
@@ -2194,7 +2194,7 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
 
 static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
-    int access_type = ri->opc2 & 1;
+    MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
     uint64_t par64;
     ARMMMUIdx mmu_idx;
     int el = arm_current_el(env);
@@ -2253,7 +2253,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 static void ats1h_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
-    int access_type = ri->opc2 & 1;
+    MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
     uint64_t par64;
 
     par64 = do_ats_write(env, value, access_type, ARMMMUIdx_S2NS);
@@ -2273,7 +2273,7 @@ static CPAccessResult at_s1e2_access(CPUARMState *env, const ARMCPRegInfo *ri,
 static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
-    int access_type = ri->opc2 & 1;
+    MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
     ARMMMUIdx mmu_idx;
     int secure = arm_is_secure_below_el3(env);
 
@@ -7510,7 +7510,7 @@ static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
 }
 
 static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
-                             int access_type, ARMMMUIdx mmu_idx,
+                             MMUAccessType access_type, ARMMMUIdx mmu_idx,
                              hwaddr *phys_ptr, int *prot,
                              target_ulong *page_size, uint32_t *fsr,
                              ARMMMUFaultInfo *fi)
@@ -7626,7 +7626,7 @@ do_fault:
 }
 
 static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
-                             int access_type, ARMMMUIdx mmu_idx,
+                             MMUAccessType access_type, ARMMMUIdx mmu_idx,
                              hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
                              target_ulong *page_size, uint32_t *fsr,
                              ARMMMUFaultInfo *fi)
@@ -7733,7 +7733,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         if (pxn && !regime_is_user(env, mmu_idx)) {
             xn = 1;
         }
-        if (xn && access_type == 2)
+        if (xn && access_type == MMU_INST_FETCH)
             goto do_fault;
 
         if (arm_feature(env, ARM_FEATURE_V6K) &&
@@ -7848,7 +7848,7 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
 }
 
 static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
-                               int access_type, ARMMMUIdx mmu_idx,
+                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
                                target_ulong *page_size_ptr, uint32_t *fsr,
                                ARMMMUFaultInfo *fi)
@@ -8256,7 +8256,7 @@ static inline bool m_is_system_region(CPUARMState *env, uint32_t address)
 }
 
 static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
-                                 int access_type, ARMMMUIdx mmu_idx,
+                                 MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                  hwaddr *phys_ptr, int *prot, uint32_t *fsr)
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
@@ -8415,7 +8415,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 }
 
 static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
-                                 int access_type, ARMMMUIdx mmu_idx,
+                                 MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                  hwaddr *phys_ptr, int *prot, uint32_t *fsr)
 {
     int n;
@@ -8442,7 +8442,7 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
         return true;
     }
 
-    if (access_type == 2) {
+    if (access_type == MMU_INST_FETCH) {
         mask = env->cp15.pmsav5_insn_ap;
     } else {
         mask = env->cp15.pmsav5_data_ap;
@@ -8513,7 +8513,7 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
  * @fsr: set to the DFSR/IFSR value on failure
  */
 static bool get_phys_addr(CPUARMState *env, target_ulong address,
-                          int access_type, ARMMMUIdx mmu_idx,
+                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
                           hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
                           target_ulong *page_size, uint32_t *fsr,
                           ARMMMUFaultInfo *fi)
@@ -8626,7 +8626,7 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
  * fsr with ARM DFSR/IFSR fault register format value on failure.
  */
 bool arm_tlb_fill(CPUState *cs, vaddr address,
-                  int access_type, int mmu_idx, uint32_t *fsr,
+                  MMUAccessType access_type, int mmu_idx, uint32_t *fsr,
                   ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = ARM_CPU(cs);
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1f6efef..bb06946 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -457,7 +457,8 @@ struct ARMMMUFaultInfo {
 };
 
 /* Do a page table walk and add page to TLB if possible */
-bool arm_tlb_fill(CPUState *cpu, vaddr address, int rw, int mmu_idx,
+bool arm_tlb_fill(CPUState *cpu, vaddr address,
+                  MMUAccessType access_type, int mmu_idx,
                   uint32_t *fsr, ARMMMUFaultInfo *fi);
 
 /* Return true if the stage 1 translation regime is using LPAE format page
-- 
2.7.4

