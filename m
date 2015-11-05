Received: by 10.182.105.169 with SMTP id gn9csp619156obb;
        Thu, 5 Nov 2015 10:16:33 -0800 (PST)
X-Received: by 10.25.133.84 with SMTP id h81mr2215518lfd.76.1446747373898;
        Thu, 05 Nov 2015 10:16:13 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id uq18si4354830lbb.70.2015.11.05.10.16.13
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Thu, 05 Nov 2015 10:16:13 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZuP4p-0004kp-AV; Thu, 05 Nov 2015 18:15:59 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH 09/16] target-arm: Support multiple address spaces in page table walks
Date: Thu,  5 Nov 2015 18:15:51 +0000
Message-Id: <1446747358-18214-10-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
X-TUID: 90i8lMNefoPj

If we have a secure address space, use it in page table walks:
 * when doing the physical accesses to read descriptors,
   make them through the correct address space
 * when the final result indicates a secure access, pass the
   correct address space index to tlb_set_page_with_attrs()

(The descriptor reads are the only direct physical accesses
made in target-arm/ for CPUs which might have TrustZone.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/cpu.h    | 29 +++++++++++++++++++++++++++++
 target-arm/helper.c | 10 +++++++---
 2 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 815fef8..8dbf4d4 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1720,6 +1720,12 @@ static inline int cpu_mmu_index(CPUARMState *env, bool ifetch)
     return el;
 }
 
+/* Indexes used when registering address spaces with cpu_address_space_init */
+typedef enum ARMASIdx {
+    ARMASIdx_NS = 0,
+    ARMASIdx_S = 1,
+} ARMASIdx;
+
 /* Return the Exception Level targeted by debug exceptions;
  * currently always EL1 since we don't implement EL2 or EL3.
  */
@@ -1991,4 +1997,27 @@ enum {
     QEMU_PSCI_CONDUIT_HVC = 2,
 };
 
+#ifndef CONFIG_USER_ONLY
+/* Return the address space index to use for a memory access
+ * (which depends on whether the access is S or NS, and whether
+ * the board gave us a separate AddressSpace for S accesses).
+ */
+static inline int arm_asidx(CPUState *cs, bool is_secure)
+{
+    if (is_secure && cs->num_ases > 1) {
+        return ARMASIdx_S;
+    }
+    return ARMASIdx_NS;
+}
+
+/* Return the AddressSpace to use for a memory access
+ * (which depends on whether the access is S or NS, and whether
+ * the board gave us a separate AddressSpace for S accesses).
+ */
+static inline AddressSpace *arm_addressspace(CPUState *cs, bool is_secure)
+{
+    return cpu_get_address_space(cs, arm_asidx(cs, is_secure));
+}
+#endif
+
 #endif
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 174371b..242928d 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -6260,13 +6260,14 @@ static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     MemTxAttrs attrs = {};
+    AddressSpace *as = arm_addressspace(cs, is_secure);
 
     attrs.secure = is_secure;
     addr = S1_ptw_translate(env, mmu_idx, addr, attrs, fsr, fi);
     if (fi->s1ptw) {
         return 0;
     }
-    return address_space_ldl(cs->as, addr, attrs, NULL);
+    return address_space_ldl(as, addr, attrs, NULL);
 }
 
 static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
@@ -6276,13 +6277,14 @@ static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     MemTxAttrs attrs = {};
+    AddressSpace *as = arm_addressspace(cs, is_secure);
 
     attrs.secure = is_secure;
     addr = S1_ptw_translate(env, mmu_idx, addr, attrs, fsr, fi);
     if (fi->s1ptw) {
         return 0;
     }
-    return address_space_ldq(cs->as, addr, attrs, NULL);
+    return address_space_ldq(as, addr, attrs, NULL);
 }
 
 static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
@@ -7307,6 +7309,7 @@ bool arm_tlb_fill(CPUState *cs, vaddr address,
     target_ulong page_size;
     int prot;
     int ret;
+    int asidx;
     MemTxAttrs attrs = {};
 
     ret = get_phys_addr(env, address, access_type, mmu_idx, &phys_addr,
@@ -7315,7 +7318,8 @@ bool arm_tlb_fill(CPUState *cs, vaddr address,
         /* Map a single [sub]page.  */
         phys_addr &= TARGET_PAGE_MASK;
         address &= TARGET_PAGE_MASK;
-        tlb_set_page_with_attrs(cs, address, 0, phys_addr, attrs,
+        asidx = arm_asidx(cs, attrs.secure);
+        tlb_set_page_with_attrs(cs, address, asidx, phys_addr, attrs,
                                 prot, mmu_idx, page_size);
         return 0;
     }
-- 
1.9.1
