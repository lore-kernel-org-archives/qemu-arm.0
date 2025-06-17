Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e232219sm178762495e9.9.2025.06.17.09.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:33:54 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 5B8825F8B5;
	Tue, 17 Jun 2025 17:33:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
	qemu-arm@nongnu.org,
	Mark Burton <mburton@qti.qualcomm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 05/11] target/arm: enable KVM_VM_TYPE_ARM_TRAP_ALL when asked
Date: Tue, 17 Jun 2025 17:33:45 +0100
Message-ID: <20250617163351.2640572-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250617163351.2640572-1-alex.bennee@linaro.org>
References: <20250617163351.2640572-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ildxAQarQlAV

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/kvm_arm.h | 9 +++++++++
 hw/arm/virt.c        | 7 +++++--
 target/arm/kvm.c     | 7 +++++++
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 7dc83caed5..a4f68e14cb 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -191,6 +191,15 @@ bool kvm_arm_sve_supported(void);
  */
 bool kvm_arm_mte_supported(void);
 
+/**
+ * kvm_arm_get_type: return the base KVM type flags
+ * @ms: Machine state handle
+ *
+ * Returns the base type flags, usually zero. These will be combined
+ * with the IPA flags from bellow.
+ */
+int kvm_arm_get_type(MachineState *ms);
+
 /**
  * kvm_arm_get_max_vm_ipa_size:
  * @ms: Machine state handle
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9a6cd085a3..55433f8fce 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3037,11 +3037,14 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
 
 /*
  * for arm64 kvm_type [7-0] encodes the requested number of bits
- * in the IPA address space
+ * in the IPA address space.
+ *
+ * For trap-me-harder we apply KVM_VM_TYPE_ARM_TRAP_ALL
  */
 static int virt_kvm_type(MachineState *ms, const char *type_str)
 {
     VirtMachineState *vms = VIRT_MACHINE(ms);
+    int kvm_type = kvm_arm_get_type(ms);
     int max_vm_pa_size, requested_pa_size;
     bool fixed_ipa;
 
@@ -3071,7 +3074,7 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
      * the implicit legacy 40b IPA setting, in which case the kvm_type
      * must be 0.
      */
-    return fixed_ipa ? 0 : requested_pa_size;
+    return fixed_ipa ? kvm_type : deposit32(kvm_type, 0, 8, requested_pa_size);
 }
 
 static int virt_hvf_get_physical_address_range(MachineState *ms)
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 8b1719bfc1..ed0f6024d6 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -515,6 +515,13 @@ int kvm_arm_get_max_vm_ipa_size(MachineState *ms, bool *fixed_ipa)
     return ret > 0 ? ret : 40;
 }
 
+int kvm_arm_get_type(MachineState *ms)
+{
+    KVMState *s = KVM_STATE(ms->accelerator);
+
+    return s->trap_harder ? KVM_VM_TYPE_ARM_TRAP_ALL : 0;
+}
+
 int kvm_arch_get_default_type(MachineState *ms)
 {
     bool fixed_ipa;
-- 
2.47.2
