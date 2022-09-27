Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id az19-20020a05600c601300b003a83ca67f73sm2107341wmb.3.2022.09.27.07.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 07:15:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DAF1D1FFBC;
	Tue, 27 Sep 2022 15:15:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org (open list:Overall KVM CPUs)
Subject: [PATCH  v3 04/15] target/arm: ensure KVM traps set appropriate MemTxAttrs
Date: Tue, 27 Sep 2022 15:14:53 +0100
Message-Id: <20220927141504.3886314-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927141504.3886314-1-alex.bennee@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: X/Lxntk2tkq/

Although most KVM users will use the in-kernel GIC emulation it is
perfectly possible not to. In this case we need to ensure the
MemTxAttrs are correctly populated so the GIC can divine the source
CPU of the operation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - new for v3
---
 target/arm/kvm.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index e5c1bd50d2..05056562f4 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -801,13 +801,14 @@ MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
 {
     ARMCPU *cpu;
     uint32_t switched_level;
+    MemTxAttrs attrs = MEMTXATTRS_CPU(cs);
 
     if (kvm_irqchip_in_kernel()) {
         /*
          * We only need to sync timer states with user-space interrupt
          * controllers, so return early and save cycles if we don't.
          */
-        return MEMTXATTRS_UNSPECIFIED;
+        return attrs;
     }
 
     cpu = ARM_CPU(cs);
@@ -848,7 +849,7 @@ MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
         qemu_mutex_unlock_iothread();
     }
 
-    return MEMTXATTRS_UNSPECIFIED;
+    return attrs;
 }
 
 void kvm_arm_vm_state_change(void *opaque, bool running, RunState state)
@@ -1003,6 +1004,10 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
     hwaddr xlat, len, doorbell_gpa;
     MemoryRegionSection mrs;
     MemoryRegion *mr;
+    MemTxAttrs attrs = {
+        .requester_type = MTRT_PCI,
+        .requester_id = pci_requester_id(dev)
+    };
 
     if (as == &address_space_memory) {
         return 0;
@@ -1012,8 +1017,7 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
 
     RCU_READ_LOCK_GUARD();
 
-    mr = address_space_translate(as, address, &xlat, &len, true,
-                                 MEMTXATTRS_UNSPECIFIED);
+    mr = address_space_translate(as, address, &xlat, &len, true, attrs);
 
     if (!mr) {
         return 1;
-- 
2.34.1
