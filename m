Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b48564sm14222655f8f.82.2025.06.17.09.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:33:53 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 434E85F8A6;
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
Subject: [RFC PATCH 04/11] kvm: expose a trap-harder option to the command line
Date: Tue, 17 Jun 2025 17:33:44 +0100
Message-ID: <20250617163351.2640572-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250617163351.2640572-1-alex.bennee@linaro.org>
References: <20250617163351.2640572-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: eunEVinq9YWe

It would be nice to only have the variable for this is a KVM_ARM_STATE
but currently everything is just held together in the common KVMState.
Only KVM ARM can set the flag though.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/system/kvm_int.h |  4 ++++
 target/arm/kvm.c         | 19 +++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/system/kvm_int.h b/include/system/kvm_int.h
index 756a3c0a25..a1e306b7b7 100644
--- a/include/system/kvm_int.h
+++ b/include/system/kvm_int.h
@@ -122,6 +122,10 @@ struct KVMState
     OnOffAuto kernel_irqchip_split;
     bool sync_mmu;
     bool guest_state_protected;
+
+    /* currently Arm only, but we have no KVMArmState */
+    bool trap_harder;
+
     uint64_t manual_dirty_log_protect;
     /*
      * Older POSIX says that ioctl numbers are signed int, but in
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 74fda8b809..8b1719bfc1 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1615,6 +1615,18 @@ static void kvm_arch_set_eager_split_size(Object *obj, Visitor *v,
     s->kvm_eager_split_size = value;
 }
 
+static bool kvm_arch_get_trap_harder(Object *obj, Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+    return s->trap_harder;
+}
+
+static void kvm_arch_set_trap_harder(Object *obj, bool value, Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+    s->trap_harder = value;
+}
+
 void kvm_arch_accel_class_init(ObjectClass *oc)
 {
     object_class_property_add(oc, "eager-split-size", "size",
@@ -1623,6 +1635,13 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
 
     object_class_property_set_description(oc, "eager-split-size",
         "Eager Page Split chunk size for hugepages. (default: 0, disabled)");
+
+    object_class_property_add_bool(oc, "trap-harder",
+                                   kvm_arch_get_trap_harder,
+                                   kvm_arch_set_trap_harder);
+
+    object_class_property_set_description(oc, "trap-harder",
+        "Trap harder mode traps almost everything to QEMU (default: off)");
 }
 
 int kvm_arch_insert_hw_breakpoint(vaddr addr, vaddr len, int type)
-- 
2.47.2
