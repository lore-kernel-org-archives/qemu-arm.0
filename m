Received: by 10.182.158.201 with SMTP id ww9csp129502obb;
        Mon, 16 Nov 2015 06:22:11 -0800 (PST)
X-Received: by 10.194.178.164 with SMTP id cz4mr4593677wjc.57.1447683730098;
        Mon, 16 Nov 2015 06:22:10 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id u185si26051606wmu.20.2015.11.16.06.22.09
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 16 Nov 2015 06:22:10 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZyKPM-00013e-0o; Mon, 16 Nov 2015 14:05:24 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH v2 16/19] target-arm: Support multiple address spaces in page table walks
Date: Mon, 16 Nov 2015 14:05:20 +0000
Message-Id: <1447682723-3977-17-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
References: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
X-TUID: HrK2BaXNFHwm

If we have a secure address space, use it in page table walks:
when doing the physical accesses to read descriptors, make them
through the correct address space.

(The descriptor reads are the only direct physical accesses
made in target-arm/ for CPUs which might have TrustZone.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/cpu.h    | 9 +++++++++
 target-arm/helper.c | 8 ++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index ee873b7..5f81342 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -2003,6 +2003,15 @@ static inline int arm_asidx_from_attrs(CPUState *cs, MemTxAttrs attrs)
 {
     return attrs.secure ? ARMASIdx_S : ARMASIdx_NS;
 }
+
+/* Return the AddressSpace to use for a memory access
+ * (which depends on whether the access is S or NS, and whether
+ * the board gave us a separate AddressSpace for S accesses).
+ */
+static inline AddressSpace *arm_addressspace(CPUState *cs, MemTxAttrs attrs)
+{
+    return cpu_get_address_space(cs, arm_asidx_from_attrs(cs, attrs));
+}
 #endif
 
 #endif
diff --git a/target-arm/helper.c b/target-arm/helper.c
index ac388d1..415aa21 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -6260,13 +6260,15 @@ static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     MemTxAttrs attrs = {};
+    AddressSpace *as;
 
     attrs.secure = is_secure;
+    as = arm_addressspace(cs, attrs);
     addr = S1_ptw_translate(env, mmu_idx, addr, attrs, fsr, fi);
     if (fi->s1ptw) {
         return 0;
     }
-    return address_space_ldl(cs->as, addr, attrs, NULL);
+    return address_space_ldl(as, addr, attrs, NULL);
 }
 
 static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
@@ -6276,13 +6278,15 @@ static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     MemTxAttrs attrs = {};
+    AddressSpace *as;
 
     attrs.secure = is_secure;
+    as = arm_addressspace(cs, attrs);
     addr = S1_ptw_translate(env, mmu_idx, addr, attrs, fsr, fi);
     if (fi->s1ptw) {
         return 0;
     }
-    return address_space_ldq(cs->as, addr, attrs, NULL);
+    return address_space_ldq(as, addr, attrs, NULL);
 }
 
 static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
-- 
1.9.1
