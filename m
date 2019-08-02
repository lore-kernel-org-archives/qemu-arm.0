Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp782673wrv;
        Fri, 2 Aug 2019 05:26:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwWRP2wVDzTkFZ2qC05RZvbOjp4w8EEXmqYulmLeT+++xTv++F9M7uMyGQIJCrvFSB725Au
X-Received: by 2002:a37:d95:: with SMTP id 143mr60149680qkn.132.1564748806583;
        Fri, 02 Aug 2019 05:26:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564748806; cv=none;
        d=google.com; s=arc-20160816;
        b=Fq/BxSE/8lQEHZkVk+fP3b0ciC/sNcX1ZEPlImRb3Wdoc5/d/UT5J6/bJ+NQJ6EpTz
         PHXNeIesKJmP762kb2TIMIT1IHBdNSImGGriMy1Mx8Spw1eAWVQBj0X/pBXzn54lQtui
         yl5tFC2HEOrgaL5teqK5KQAhrdNI/kK70kcszqmtVegQ2C16mjcfzHPLmK+NmBjxdh18
         deA2aqa22gmv6xzZPFBmJTeraIq10cDq8XsCfVw3/8bkSohMmcNGyzv6x68JPqP+cOj7
         z7PVlI18LzoGOh6j2csxoSxJU2U4GkbQe2M7SyrYhMjEXpPyscwHUCFHTPuvmmHTNob8
         7Nag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=gj84wfcvdA1Ude+x3dLi9OqSkNDRmq0hZqpDYqRbhAE=;
        b=i6U8B7xZCKt+5O4dqB/+fN9r/1aDPbDkQiApYCqdITYSIgZL1gzpGqhLwg3ELOozBt
         URuQOvfoobyyIWcXyTX+sMKsRpNewQkr3YjDP+KLnT2Y9la4/HagBnOuYqEXcWTTP99x
         Xvp01BZ8LXhPUBS/VsMZ2DoWatSfaDmtfJcrH0AWFBpRmqIFwdvFiPa3ePpm2N+hnIIW
         4cfK2jlehgifdeF1or/8jr4bApEi51a5MFflElb/VhMLhM8DLVJm5wJ8ysGdEuvmi3Wm
         RfLcNc7+XKhOOm6fwsYjQf0Tvtx2YPUrX+Rc83UyZj5PwsyW4jy7nQXz3f9nG9Pq+BzO
         Vu4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id d51si47917015qta.48.2019.08.02.05.26.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 05:26:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB93181F07;
	Fri,  2 Aug 2019 12:26:45 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4451F5C205;
	Fri,  2 Aug 2019 12:26:41 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	armbru@redhat.com,
	eblake@redhat.com,
	Dave.Martin@arm.com,
	eric.auger@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v3 14/15] target/arm/cpu64: max cpu: Support sve properties with KVM
Date: Fri,  2 Aug 2019 14:25:39 +0200
Message-Id: <20190802122540.26385-15-drjones@redhat.com>
In-Reply-To: <20190802122540.26385-1-drjones@redhat.com>
References: <20190802122540.26385-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Fri, 02 Aug 2019 12:26:45 +0000 (UTC)
X-TUID: rqUCZyVfu87o

Extend the SVE vq map initialization and validation with KVM's
supported vector lengths when KVM is enabled. In order to determine
and select supported lengths we add two new KVM functions for getting
and setting the KVM_REG_ARM64_SVE_VLS pseudo-register.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 docs/arm-cpu-features.rst |  36 ++++++---
 target/arm/cpu.h          |   3 +-
 target/arm/cpu64.c        | 159 +++++++++++++++++++++++++++++---------
 target/arm/kvm64.c        | 110 +++++++++++++++++++++++++-
 target/arm/kvm_arm.h      |  12 +++
 target/arm/monitor.c      |   2 +-
 tests/arm-cpu-features.c  |  89 ++++++++++++++++++++-
 7 files changed, 359 insertions(+), 52 deletions(-)

diff --git a/docs/arm-cpu-features.rst b/docs/arm-cpu-features.rst
index aaaed861cda2..4181539e06a5 100644
--- a/docs/arm-cpu-features.rst
+++ b/docs/arm-cpu-features.rst
@@ -188,10 +188,17 @@ SVE CPU Property Dependencies and Constraints
 
   1) At least one vector length must be enabled when `sve` is enabled.
 
-  2) If a vector length `N` is enabled, then all power-of-2 vector
-     lengths smaller than `N` must also be enabled.  E.g. if `sve512`
-     is enabled, then `sve128` and `sve256` must also be enabled,
-     but `sve384` is not required.
+  2) If a vector length `N` is enabled, then, when KVM is enabled, all
+     smaller, host supported vector lengths must also be enabled.  If
+     KVM is not enabled, then only all the smaller, power-of-2 vector
+     lengths must be enabled.  E.g. with KVM if the host supports all
+     vector lengths up to 512-bits (128, 256, 384, 512), then if
+     `sve512` is enabled, `sve128`, `sve256`, and `sve384` must also
+     be enabled. Without KVM `sve384` would not be required.
+
+  3) If KVM is enabled then only vector lengths that the host CPU type
+     support may be enabled.  If SVE is not supported by the host, then
+     no `sve*` properties may be enabled.
 
 SVE CPU Property Parsing Semantics
 ----------------------------------
@@ -210,20 +217,29 @@ SVE CPU Property Parsing Semantics
      disable the last enabled vector length (see constraint (1) of "SVE
      CPU Property Dependencies and Constraints").
 
-  4) If one or more `sve<N>` CPU properties are set `off`, but no `sve<N>`,
+  4) When KVM is enabled, if the host does not support SVE, then an error
+     is generated when attempting to enable any `sve*` properties.
+
+  5) When KVM is enabled, if the host does support SVE, then an error is
+     generated when attempting to enable any vector lengths not supported
+     by the host.
+
+  6) If one or more `sve<N>` CPU properties are set `off`, but no `sve<N>`,
      CPU properties are set `on`, then the specified vector lengths are
      disabled but the default for any unspecified lengths remains enabled.
-     Disabling a power-of-2 vector length also disables all vector lengths
-     larger than the power-of-2 length (see constraint (2) of "SVE CPU
-     Property Dependencies and Constraints").
+     When KVM is not enabled, disabling a power-of-2 vector length also
+     disables all vector lengths larger than the power-of-2 length.  When
+     KVM is enabled, then disabling any length also disables all larger
+     vector lengths (see constraint (2) of "SVE CPU Property Dependencies
+     and Constraints").
 
-  5) If one or more `sve<N>` CPU properties are set to `on`, then they
+  7) If one or more `sve<N>` CPU properties are set to `on`, then they
      are enabled and all unspecified lengths default to disabled, except
      for the required lengths per constraint (2) of "SVE CPU Property
      Dependencies and Constraints", which will even be auto-enabled if
      they were not explicitly enabled.
 
-  6) If SVE was disabled (`sve=off`), allowing all vector lengths to be
+  8) If SVE was disabled (`sve=off`), allowing all vector lengths to be
      explicitly disabled (i.e. avoiding the error specified in (3) of
      "SVE CPU Property Parsing Semantics"), then if later an `sve=on` is
      provided an error will be generated.  To avoid this error, one must
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c8b96293c5e2..b6cd721c91f5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -926,7 +926,8 @@ struct ARMCPU {
      * (bit-number + 1) * 16 bytes, i.e. each bit number + 1 is the vector
      * length in quadwords. We need a map size twice the maximum
      * quadword length though because we use two bits for each vector
-     * length in order to track three states: uninitialized, off, and on.
+     * length in order to track four states: uninitialized, uninitialized
+     * but supported by KVM, off, and on.
      */
     DECLARE_BITMAP(sve_vq_map, ARM_MAX_VQ * 2);
 };
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f8ed393ed16c..0d0664b24865 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -261,13 +261,19 @@ static void aarch64_a72_initfn(Object *obj)
  * While we eventually use cpu->sve_vq_map as a typical bitmap, where each vq
  * has only two states (off/on), until we've finalized the map at realize time
  * we use an extra bit, at the vq - 1 + ARM_MAX_VQ bit number, to also allow
- * tracking of the uninitialized state. The arm_vq_state typedef and following
- * functions allow us to more easily work with the bitmap.
+ * tracking of the uninitialized state and the uninitialized but supported by
+ * KVM state. The arm_vq_state typedef and following functions allow us to more
+ * easily work with the bitmap.
  */
 typedef enum arm_vq_state {
     ARM_VQ_OFF,
     ARM_VQ_ON,
     ARM_VQ_UNINITIALIZED,
+    ARM_VQ_UNINITIALIZED_KVM_SUPPORTED
+    /*
+     * More states cannot be added without adding bits to sve_vq_map
+     * and modifying its supporting functions.
+     */
 } arm_vq_state;
 
 static arm_vq_state arm_cpu_vq_map_get(ARMCPU *cpu, uint32_t vq)
@@ -292,6 +298,22 @@ static void arm_cpu_vq_map_set(ARMCPU *cpu, uint32_t vq, arm_vq_state state)
     }
 }
 
+static bool arm_cpu_vq_kvm_supported(ARMCPU *cpu, uint32_t vq)
+{
+    return arm_cpu_vq_map_get(cpu, vq) != ARM_VQ_UNINITIALIZED;
+}
+
+static bool arm_cpu_vq_uninitialized(ARMCPU *cpu, uint32_t vq)
+{
+    arm_vq_state vq_state = arm_cpu_vq_map_get(cpu, vq);
+
+    if (kvm_enabled()) {
+        return vq_state == ARM_VQ_UNINITIALIZED_KVM_SUPPORTED;
+    }
+
+    return vq_state == ARM_VQ_UNINITIALIZED;
+}
+
 /*
  * Uninitialized vector lengths need a default value to use in case we need
  * to query their value prior to map finalization. Additionally map finalizing
@@ -341,11 +363,9 @@ static int arm_cpu_num_vqs_available(ARMCPU *cpu)
     defval = arm_cpu_vq_map_get_default(cpu);
 
     for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
-        arm_vq_state vq_state = arm_cpu_vq_map_get(cpu, vq);
-
-        if (vq_state == ARM_VQ_ON) {
+        if (arm_cpu_vq_map_get(cpu, vq) == ARM_VQ_ON) {
             ++num;
-        } else if (defval && vq_state == ARM_VQ_UNINITIALIZED) {
+        } else if (defval && arm_cpu_vq_uninitialized(cpu, vq)) {
             ++num;
         }
     }
@@ -358,6 +378,18 @@ static void arm_cpu_vq_map_init(ARMCPU *cpu)
     /* Set all vq's to 0b10 (ARM_VQ_UNINITIALIZED) */
     bitmap_clear(cpu->sve_vq_map, 0, ARM_MAX_VQ);
     bitmap_set(cpu->sve_vq_map, ARM_MAX_VQ, ARM_MAX_VQ);
+
+    if (kvm_enabled()) {
+        /*
+         * As the upper bits of the ARM_VQ_UNINITIALIZED_KVM_SUPPORTED (0b11)
+         * states have already been set with the bitmap_set() above, we only
+         * need to OR in the lower bits.
+         */
+        DECLARE_BITMAP(kvm_supported, ARM_MAX_VQ);
+
+        kvm_arm_sve_get_vls(CPU(cpu), kvm_supported);
+        bitmap_or(cpu->sve_vq_map, cpu->sve_vq_map, kvm_supported, ARM_MAX_VQ);
+    }
 }
 
 void arm_cpu_sve_finalize(ARMCPU *cpu)
@@ -366,9 +398,9 @@ void arm_cpu_sve_finalize(ARMCPU *cpu)
     uint32_t vq, max_vq;
 
     for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
-        arm_vq_state vq_state = arm_cpu_vq_map_get(cpu, vq);
-
-        if (vq_state == ARM_VQ_UNINITIALIZED) {
+        if (kvm_enabled() && !arm_cpu_vq_kvm_supported(cpu, vq)) {
+            arm_cpu_vq_map_set(cpu, vq, ARM_VQ_OFF);
+        } else if (arm_cpu_vq_uninitialized(cpu, vq)) {
             if (defval) {
                 arm_cpu_vq_map_set(cpu, vq, ARM_VQ_ON);
             } else {
@@ -421,6 +453,12 @@ static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
         return;
     }
 
+    if (kvm_enabled() && !kvm_arm_sve_supported(CPU(cpu))) {
+        error_setg(errp, "cannot set sve-max-vq");
+        error_append_hint(errp, "SVE not supported by KVM on this host\n");
+        return;
+    }
+
     if (cpu->sve_max_vq == 0 || cpu->sve_max_vq > ARM_MAX_VQ) {
         error_setg(errp, "unsupported SVE vector length");
         error_append_hint(errp, "Valid sve-max-vq in range [1-%d]\n",
@@ -435,6 +473,12 @@ static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
             sprintf(tmp, "sve%d", vq * 128);
             object_property_set_bool(obj, true, tmp, &err);
             if (err) {
+                if (kvm_enabled()) {
+                    error_append_hint(&err, "It is not possible to use "
+                                      "sve-max-vq with this KVM host. Try "
+                                      "using only sve<vl-bits> "
+                                      "properties.\n");
+                }
                 error_propagate(errp, err);
                 return;
             }
@@ -459,6 +503,8 @@ static void cpu_arm_get_sve_vq(Object *obj, Visitor *v, const char *name,
         value = true;
     } else if (vq_state == ARM_VQ_OFF) {
         value = false;
+    } else if (kvm_enabled() && !arm_cpu_vq_kvm_supported(cpu, vq)) {
+        value = false;
     } else if (arm_cpu_vq_map_get_default(cpu)) {
         value = true;
     } else {
@@ -483,6 +529,12 @@ static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
         return;
     }
 
+    if (value && kvm_enabled() && !kvm_arm_sve_supported(CPU(cpu))) {
+        error_setg(errp, "cannot enable %s", name);
+        error_append_hint(errp, "SVE not supported by KVM on this host\n");
+        return;
+    }
+
     /*
      * We need to know the maximum vector length, which may just currently
      * be the maximum length, in order to validate the enabling/disabling
@@ -507,69 +559,101 @@ static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
         error_append_hint(errp, "The maximum vector length must be "
                           "enabled, sve-max-vq=%d (%d bits)\n",
                           cpu->sve_max_vq, cpu->sve_max_vq * 128);
-    } else if (cpu->sve_max_vq && !value && vq < cpu->sve_max_vq &&
-               is_power_of_2(vq)) {
+    } else if (!kvm_enabled() && cpu->sve_max_vq && !value &&
+               vq < cpu->sve_max_vq && is_power_of_2(vq)) {
         error_setg(errp, "cannot disable %s", name);
         error_append_hint(errp, "vq=%d (%d bits) is required as it is a "
                           "power-of-2 length smaller than the maximum, "
                           "sve-max-vq=%d (%d bits)\n", vq, vq * 128,
                           cpu->sve_max_vq, cpu->sve_max_vq * 128);
-    } else if (max_vq && !value && vq < max_vq && is_power_of_2(vq)) {
+    } else if (!kvm_enabled() && max_vq && !value && vq < max_vq &&
+               is_power_of_2(vq)) {
         error_setg(errp, "cannot disable %s", name);
         error_append_hint(errp, "Vector length %d-bits is required as it "
                           "is a power-of-2 length smaller than another "
                           "enabled vector length. Disable all larger vector "
                           "lengths first.\n", vq * 128);
+    } else if (kvm_enabled() && !value && vq < max_vq &&
+                arm_cpu_vq_kvm_supported(cpu, vq)) {
+        error_setg(errp, "cannot disable %s", name);
+        error_append_hint(errp, "Vector length %d-bits is a KVM supported "
+                          "length smaller than another enabled vector "
+                          "length. Disable all larger vector lengths "
+                          "first.\n", vq * 128);
+    } else if (kvm_enabled() && value && !arm_cpu_vq_kvm_supported(cpu, vq)) {
+        error_setg(errp, "cannot enable %s", name);
+        error_append_hint(errp, "This KVM host does not support "
+                          "the vector length %d-bits.\n", vq * 128);
     } else {
         uint32_t s;
 
         if (value) {
-            arm_vq_state vq_state;
             bool fail = false;
 
             /*
              * Enabling a vector length automatically enables all
              * uninitialized power-of-2 lengths smaller than it, as
              * per the architecture.
+             *
+             * For KVM we have to automatically enable all supported,
+             * uninitialized lengths smaller than this length, even
+             * when the smaller lengths are not power-of-2's.
              */
             for (s = 1; s < vq; ++s) {
-                if (is_power_of_2(s)) {
-                    vq_state = arm_cpu_vq_map_get(cpu, s);
-                    if (vq_state == ARM_VQ_UNINITIALIZED) {
+                if (kvm_enabled() || is_power_of_2(s)) {
+                    if (arm_cpu_vq_uninitialized(cpu, s)) {
                         arm_cpu_vq_map_set(cpu, s, ARM_VQ_ON);
-                    } else if (vq_state == ARM_VQ_OFF) {
+                    } else if (arm_cpu_vq_map_get(cpu, s) == ARM_VQ_OFF) {
                         fail = true;
                         break;
                     }
                 }
             }
 
-            if (fail) {
+            if (!kvm_enabled() && fail) {
                 error_setg(errp, "cannot enable %s", name);
                 error_append_hint(errp, "Vector length %d-bits is disabled "
                                   "and is a power-of-2 length smaller than "
                                   "%s. All power-of-2 vector lengths smaller "
                                   "than the maximum length are required.\n",
                                   s * 128, name);
+
+            } else if (fail) {
+                error_setg(errp, "cannot enable %s", name);
+                error_append_hint(errp, "Vector length %d-bits is disabled "
+                                  "and the KVM host requires all supported "
+                                  "vector lengths smaller than %s to also be "
+                                  "enabled.\n", s * 128, name);
             } else {
                 arm_cpu_vq_map_set(cpu, vq, ARM_VQ_ON);
             }
         } else {
             /*
+             * When disabling vector lengths with KVM enabled if the vq wasn't
+             * supported then we leave it in the ARM_VQ_UNINITIALIZED state in
+             * order to keep that unsupported information. It'll be set to OFF
+             * later when we finalize the map.
+             *
              * We would have errored-out already if we were attempting to
              * disable a power-of-2 vector length less than another enabled
              * vector length, but there may be uninitialized vector lengths
              * larger than a power-of-2 vector length that we're disabling.
              * We disable all of those lengths now too, as they can no longer
-             * be enabled.
+             * be enabled. Additionally, for KVM, we have to automatically
+             * disable all supported, uninitialized lengths larger than this
+             * length, even when this length is not a power-of-2.
              */
-            if (is_power_of_2(vq)) {
+            if (kvm_enabled() || is_power_of_2(vq)) {
                 for (s = vq + 1; s <= ARM_MAX_VQ; ++s) {
-                    arm_cpu_vq_map_set(cpu, s, ARM_VQ_OFF);
+                    if (!kvm_enabled() || arm_cpu_vq_kvm_supported(cpu, vq)) {
+                        arm_cpu_vq_map_set(cpu, s, ARM_VQ_OFF);
+                    }
                 }
             }
 
-            arm_cpu_vq_map_set(cpu, vq, ARM_VQ_OFF);
+            if (!kvm_enabled() || arm_cpu_vq_kvm_supported(cpu, vq)) {
+                arm_cpu_vq_map_set(cpu, vq, ARM_VQ_OFF);
+            }
 
             /*
              * We just disabled one or more vector lengths. We need to make
@@ -727,26 +811,25 @@ static void aarch64_max_initfn(Object *obj)
         cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
         cpu->dcz_blocksize = 7; /*  512 bytes */
 #endif
-
-        object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
-                            cpu_max_set_sve_max_vq, NULL, NULL, &error_fatal);
-
-        /*
-         * sve_vq_map uses a special state while setting properties, so
-         * we initialize it here with its init function and finalize it
-         * in arm_cpu_realizefn().
-         */
-        arm_cpu_vq_map_init(cpu);
-        for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
-            char name[8];
-            sprintf(name, "sve%d", vq * 128);
-            object_property_add(obj, name, "bool", cpu_arm_get_sve_vq,
-                                cpu_arm_set_sve_vq, NULL, NULL, &error_fatal);
-        }
     }
 
     object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
                         cpu_arm_set_sve, NULL, NULL, &error_fatal);
+    object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
+                        cpu_max_set_sve_max_vq, NULL, NULL, &error_fatal);
+
+    /*
+     * sve_vq_map uses a special state while setting properties, so
+     * we initialize it here with its init function and finalize it
+     * in arm_cpu_realizefn().
+     */
+    arm_cpu_vq_map_init(cpu);
+    for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
+        char name[8];
+        sprintf(name, "sve%d", vq * 128);
+        object_property_add(obj, name, "bool", cpu_arm_get_sve_vq,
+                            cpu_arm_set_sve_vq, NULL, NULL, &error_fatal);
+    }
 }
 
 struct ARMCPUInfo {
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 48adfc16b3d7..f6e2389f9f29 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -613,6 +613,110 @@ bool kvm_arm_sve_supported(CPUState *cpu)
     return kvm_check_extension(s, KVM_CAP_ARM_SVE);
 }
 
+QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
+
+void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
+{
+    static uint64_t vls[KVM_ARM64_SVE_VLS_WORDS];
+    static bool probed;
+    uint32_t vq = 0;
+    int i, j;
+
+    bitmap_clear(map, 0, ARM_MAX_VQ);
+
+    /*
+     * KVM ensures all host CPUs support the same set of vector lengths.
+     * So we only need to create the scratch VCPUs once and then cache
+     * the results.
+     */
+    if (!probed) {
+        struct kvm_vcpu_init init = {
+            .target = -1,
+            .features[0] = (1 << KVM_ARM_VCPU_SVE),
+        };
+        struct kvm_one_reg reg = {
+            .id = KVM_REG_ARM64_SVE_VLS,
+            .addr = (uint64_t)&vls[0],
+        };
+        int fdarray[3], ret;
+
+        probed = true;
+
+        if (!kvm_arm_create_scratch_host_vcpu(NULL, fdarray, NULL)) {
+            error_report("failed to create scratch vcpu");
+            abort();
+        }
+        ret = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE);
+        kvm_arm_destroy_scratch_host_vcpu(fdarray);
+        if (ret <= 0) {
+            /* The host doesn't support SVE. */
+            return;
+        }
+
+        if (!kvm_arm_create_scratch_host_vcpu(NULL, fdarray, &init)) {
+            error_report("failed to create scratch vcpu");
+            abort();
+        }
+        ret = ioctl(fdarray[2], KVM_GET_ONE_REG, &reg);
+        kvm_arm_destroy_scratch_host_vcpu(fdarray);
+        if (ret) {
+            error_report("failed to get KVM_REG_ARM64_SVE_VLS: %s",
+                         strerror(errno));
+            abort();
+        }
+
+        for (i = KVM_ARM64_SVE_VLS_WORDS - 1; i >= 0; --i) {
+            if (vls[i]) {
+                vq = 64 - clz64(vls[i]) + i * 64;
+                break;
+            }
+        }
+        if (vq > ARM_MAX_VQ) {
+            warn_report("KVM supports vector lengths larger than "
+                        "QEMU can enable");
+        }
+    }
+
+    for (i = 0; i < KVM_ARM64_SVE_VLS_WORDS; ++i) {
+        if (!vls[i]) {
+            continue;
+        }
+        for (j = 1; j <= 64; ++j) {
+            vq = j + i * 64;
+            if (vq > ARM_MAX_VQ) {
+                return;
+            }
+            if (vls[i] & (1UL << (j - 1))) {
+                set_bit(vq - 1, map);
+            }
+        }
+    }
+}
+
+static int kvm_arm_sve_set_vls(CPUState *cs)
+{
+    uint64_t vls[KVM_ARM64_SVE_VLS_WORDS] = {0};
+    struct kvm_one_reg reg = {
+        .id = KVM_REG_ARM64_SVE_VLS,
+        .addr = (uint64_t)&vls[0],
+    };
+    ARMCPU *cpu = ARM_CPU(cs);
+    uint32_t vq;
+    int i, j;
+
+    assert(cpu->sve_max_vq <= KVM_ARM64_SVE_VQ_MAX);
+
+    for (vq = 1; vq <= cpu->sve_max_vq; ++vq) {
+        if (test_bit(vq - 1, cpu->sve_vq_map)) {
+            i = (vq - 1) / 64;
+            j = (vq - 1) % 64;
+            vls[i] |= 1UL << j;
+        }
+    }
+
+    return kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+}
+
 #define ARM_CPU_ID_MPIDR       3, 0, 0, 0, 5
 
 int kvm_arch_init_vcpu(CPUState *cs)
@@ -624,7 +728,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
 
     if (cpu->kvm_target == QEMU_KVM_ARM_TARGET_NONE ||
         !object_dynamic_cast(OBJECT(cpu), TYPE_AARCH64_CPU)) {
-        fprintf(stderr, "KVM is not supported for this guest CPU type\n");
+        error_report("KVM is not supported for this guest CPU type");
         return -EINVAL;
     }
 
@@ -660,6 +764,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
     }
 
     if (cpu_isar_feature(aa64_sve, cpu)) {
+        ret = kvm_arm_sve_set_vls(cs);
+        if (ret) {
+            return ret;
+        }
         ret = kvm_arm_vcpu_finalize(cs, KVM_ARM_VCPU_SVE);
         if (ret) {
             return ret;
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 1151877f97ea..a1cc6513f72b 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -212,6 +212,17 @@ typedef struct ARMHostCPUFeatures {
  */
 bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf);
 
+/**
+ * kvm_arm_sve_get_vls:
+ * @cs: CPUState
+ * @map: bitmap to fill in
+ *
+ * Get all the SVE vector lengths supported by the KVM host, setting
+ * the bits corresponding to their length in quadwords minus one
+ * (vq - 1) in @map up to ARM_MAX_VQ.
+ */
+void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map);
+
 /**
  * kvm_arm_set_cpu_features_from_host:
  * @cpu: ARMCPU to set the features for
@@ -315,6 +326,7 @@ static inline int kvm_arm_vgic_probe(void)
 static inline void kvm_arm_pmu_set_irq(CPUState *cs, int irq) {}
 static inline void kvm_arm_pmu_init(CPUState *cs) {}
 
+static inline void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map) {}
 #endif
 
 static inline const char *gic_class_name(void)
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index f7099917e137..e2d559c2301a 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -101,7 +101,7 @@ QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
  *
  * The sve<vl-bits> features need to be in reverse order in order to
  * enable/disable the largest vector lengths first, ensuring all
- * power-of-2 vector lengths smaller can also be enabled/disabled.
+ * smaller required vector lengths can also be enabled/disabled.
  */
 static const char *cpu_model_advertised_features[] = {
     "aarch64", "pmu", "sve",
diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
index 51fbb1739d8e..720741375bc8 100644
--- a/tests/arm-cpu-features.c
+++ b/tests/arm-cpu-features.c
@@ -117,6 +117,17 @@ static QDict *resp_get_props(QDict *resp)
     return qdict;
 }
 
+static bool resp_get_feature(QDict *resp, const char *feature)
+{
+    QDict *props;
+
+    g_assert(resp);
+    g_assert(resp_has_props(resp));
+    props = resp_get_props(resp);
+    g_assert(qdict_get(props, feature));
+    return qdict_get_bool(props, feature);
+}
+
 #define assert_has_feature(qts, cpu_type, feature)                     \
 ({                                                                     \
     QDict *_resp = do_query_no_props(qts, cpu_type);                   \
@@ -344,6 +355,25 @@ static void sve_tests_sve_off(const void *data)
     qtest_quit(qts);
 }
 
+static void sve_tests_sve_off_kvm(const void *data)
+{
+    QTestState *qts;
+
+    qts = qtest_init(MACHINE "-accel kvm -cpu max,sve=off");
+
+    /*
+     * We don't know if this host supports SVE so we don't
+     * attempt to test enabling anything. We only test that
+     * everything is disabled (as it should be with sve=off)
+     * and that using sve<vl-bits>=off to explicitly disable
+     * vector lengths is OK too.
+     */
+    assert_sve_vls(qts, "max", 0, NULL);
+    assert_sve_vls(qts, "max", 0, "{ 'sve128': false }");
+
+    qtest_quit(qts);
+}
+
 static void test_query_cpu_model_expansion(const void *data)
 {
     QTestState *qts;
@@ -393,12 +423,65 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
     assert_has_feature(qts, "host", "pmu");
 
     if (g_str_equal(qtest_get_arch(), "aarch64")) {
+        bool kvm_supports_sve;
+        uint32_t max_vq, vq;
+        uint64_t vls;
+        char name[8];
+        QDict *resp;
+        char *error;
+
         assert_has_feature(qts, "host", "aarch64");
-        assert_has_feature(qts, "max", "sve");
 
         assert_error(qts, "cortex-a15",
             "We cannot guarantee the CPU type 'cortex-a15' works "
             "with KVM on this host", NULL);
+
+        assert_has_feature(qts, "max", "sve");
+        resp = do_query_no_props(qts, "max");
+        kvm_supports_sve = resp_get_feature(resp, "sve");
+        vls = resp_get_sve_vls(resp);
+        qobject_unref(resp);
+
+        if (kvm_supports_sve) {
+            g_assert(vls != 0);
+            max_vq = 64 - __builtin_clzll(vls);
+
+            /* Enabling a supported length is of course fine. */
+            sprintf(name, "sve%d", max_vq * 128);
+            assert_sve_vls(qts, "max", vls, "{ %s: true }", name);
+
+            /* Also disabling the largest lengths is fine. */
+            assert_sve_vls(qts, "max", (vls & ~BIT(max_vq - 1)),
+                           "{ %s: false }", name);
+
+            for (vq = 1; vq <= max_vq; ++vq) {
+                if (!(vls & BIT(vq - 1))) {
+                    /* vq is unsupported */
+                    break;
+                }
+            }
+            if (vq <= SVE_MAX_VQ) {
+                sprintf(name, "sve%d", vq * 128);
+                error = g_strdup_printf("cannot enable %s", name);
+                assert_error(qts, "max", error, "{ %s: true }", name);
+                g_free(error);
+            }
+
+            if (max_vq > 1) {
+                /*
+                 * Smaller, supported vector lengths cannot be disabled
+                 * unless all larger, supported vector lengths are disabled
+                 * first.
+                 */
+                vq = 64 - __builtin_clzll(vls & ~BIT(max_vq - 1));
+                sprintf(name, "sve%d", vq * 128);
+                error = g_strdup_printf("cannot disable %s", name);
+                assert_error(qts, "max", error, "{ %s: false }", name);
+                g_free(error);
+            }
+        } else {
+            g_assert(vls == 0);
+        }
     } else {
         assert_error(qts, "host",
                      "'pmu' feature not supported by KVM on this host",
@@ -435,6 +518,10 @@ int main(int argc, char **argv)
     if (kvm_available) {
         qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
                             NULL, test_query_cpu_model_expansion_kvm);
+        if (g_str_equal(qtest_get_arch(), "aarch64")) {
+            qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
+                                NULL, sve_tests_sve_off_kvm);
+        }
     }
 
     return g_test_run();
-- 
2.20.1
