Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q3sm7211868wrr.43.2021.06.04.10.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 10:12:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C96491FF9D;
	Fri,  4 Jun 2021 16:53:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	kvm@vger.kernel.org (open list:X86 KVM CPUs)
Subject: [PATCH  v16 14/99] accel: add cpu_reset
Date: Fri,  4 Jun 2021 16:51:47 +0100
Message-Id: <20210604155312.15902-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4OkzkxSI1ONj

From: Claudio Fontana <cfontana@suse.de>

in cpu_reset(), implemented in the common cpu.c,
add a call to a new accel_cpu_reset(), which ensures that the CPU accel
interface is also reset when the CPU is reset.

Use this first for x86/kvm, simply moving the kvm_arch_reset_vcpu() call.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/core/accel-cpu.h | 2 ++
 include/qemu/accel.h        | 6 ++++++
 accel/accel-common.c        | 9 +++++++++
 hw/core/cpu-common.c        | 3 ++-
 target/i386/cpu.c           | 4 ----
 target/i386/kvm/kvm-cpu.c   | 6 ++++++
 6 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/accel-cpu.h b/include/hw/core/accel-cpu.h
index 5dbfd79955..700a5bd266 100644
--- a/include/hw/core/accel-cpu.h
+++ b/include/hw/core/accel-cpu.h
@@ -33,6 +33,8 @@ typedef struct AccelCPUClass {
     void (*cpu_class_init)(CPUClass *cc);
     void (*cpu_instance_init)(CPUState *cpu);
     bool (*cpu_realizefn)(CPUState *cpu, Error **errp);
+    void (*cpu_reset)(CPUState *cpu);
+
 } AccelCPUClass;
 
 #endif /* ACCEL_CPU_H */
diff --git a/include/qemu/accel.h b/include/qemu/accel.h
index 4f4c283f6f..8d3a15b916 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -91,4 +91,10 @@ void accel_cpu_instance_init(CPUState *cpu);
  */
 bool accel_cpu_realizefn(CPUState *cpu, Error **errp);
 
+/**
+ * accel_cpu_reset:
+ * @cpu: The CPU that needs to call accel-specific reset.
+ */
+void accel_cpu_reset(CPUState *cpu);
+
 #endif /* QEMU_ACCEL_H */
diff --git a/accel/accel-common.c b/accel/accel-common.c
index cf07f78421..3331a9dcfd 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -121,6 +121,15 @@ bool accel_cpu_realizefn(CPUState *cpu, Error **errp)
     return true;
 }
 
+void accel_cpu_reset(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->accel_cpu && cc->accel_cpu->cpu_reset) {
+        cc->accel_cpu->cpu_reset(cpu);
+    }
+}
+
 static const TypeInfo accel_cpu_type = {
     .name = TYPE_ACCEL_CPU,
     .parent = TYPE_OBJECT,
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index e2f5a64604..ab258ad4f2 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -34,6 +34,7 @@
 #include "hw/qdev-properties.h"
 #include "trace/trace-root.h"
 #include "qemu/plugin.h"
+#include "qemu/accel.h"
 
 CPUState *cpu_by_arch_id(int64_t id)
 {
@@ -112,7 +113,7 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
 void cpu_reset(CPUState *cpu)
 {
     device_cold_reset(DEVICE(cpu));
-
+    accel_cpu_reset(cpu);
     trace_guest_cpu_reset(cpu);
 }
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index e0ba36cc23..0c22324daf 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5749,10 +5749,6 @@ static void x86_cpu_reset(DeviceState *dev)
     apic_designate_bsp(cpu->apic_state, s->cpu_index == 0);
 
     s->halted = !cpu_is_bsp(cpu);
-
-    if (kvm_enabled()) {
-        kvm_arch_reset_vcpu(cpu);
-    }
 #endif
 }
 
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index 5235bce8dc..63410d3f18 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -135,12 +135,18 @@ static void kvm_cpu_instance_init(CPUState *cs)
     }
 }
 
+static void kvm_cpu_reset(CPUState *cpu)
+{
+    kvm_arch_reset_vcpu(X86_CPU(cpu));
+}
+
 static void kvm_cpu_accel_class_init(ObjectClass *oc, void *data)
 {
     AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
 
     acc->cpu_realizefn = kvm_cpu_realizefn;
     acc->cpu_instance_init = kvm_cpu_instance_init;
+    acc->cpu_reset = kvm_cpu_reset;
 }
 static const TypeInfo kvm_cpu_accel_type_info = {
     .name = ACCEL_CPU_NAME("kvm"),
-- 
2.20.1
