Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1641359wrg;
        Sun, 12 May 2019 01:37:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzjm7rt6aFhmQQWmPHp7cegPH1koCVXkFlpfHmBEoPlR5XBisymBWo0DwNIQFcpcXabs37F
X-Received: by 2002:a0c:d2b0:: with SMTP id q45mr10015476qvh.185.1557650246372;
        Sun, 12 May 2019 01:37:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557650246; cv=none;
        d=google.com; s=arc-20160816;
        b=iKJiASxCCgSJsnz2pIMqLRV4HRAmcpN4pMJ89HdzzCD8VSwH4+wNu/RWoYrby/mWsd
         H5RxQaU9ECh5RshNvXypco6nTIhH0HV7EY0m11Gbb6AvIICrzObnE3/LVxYzf71XUcGI
         uh3wbNLxnR+38DOW3iIAujUY9IF65nxzbX30alytrMsZVMWVTR0EbJUc6BSPd6kS5/gr
         5XBuMNKCTn8BE3dgaLaiBjEFczpQO0nLKlYF4K2szYD6Ry5Vp1mxjP7qEq7eLg2o7c+d
         l2jzYhgwpuOD6cOLKNFY8UD0Xk0i76FfyRIWXmZqv5k66AL4CZ73MY2Kcv21N3XjWEtf
         hrYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=DJG2MCFVNubmLgPbhh0i3Lw8LDDAXfJoqGP3uI+Yn+g=;
        b=A/zvAl3rk2yjSuFCBT65SaXsM0AUuaIMfiNmpYsWmxN+YVV5R6aKXGw9NjXXPMCvJ8
         HU1PLlR3/DWQ/JioiPFKRfeyWpfIWSNRUN10EXAlzHamkTxf5hP0+XrmBaEXjzFoMIh3
         F2gfwzKgbh5Vp71dcqWkDNXbzIStno5keRecCjc8dlMTwxfSpP9WWgqD833zxABAvMDM
         DswtvZkKqWM4Ascu5NgradIBQZGfNfk335uKNCC2tJYazZ54ZmAZ2+S1gSn2A/169M3k
         Aj1ln/4dU7G7xdLjBmZQMtXQ33bZhU07mXmWpIs6fGhDO5ueNalKk880ZhyXRaLQmRAL
         acXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id p19si6152164qkk.85.2019.05.12.01.37.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 01:37:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 75341308427E;
	Sun, 12 May 2019 08:37:25 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-87.ams2.redhat.com [10.36.116.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 077FA5D706;
	Sun, 12 May 2019 08:37:21 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	armbru@redhat.com,
	eblake@redhat.com,
	Dave.Martin@arm.com,
	abologna@redhat.com
Subject: [PATCH 11/13] target/arm/cpu64: max cpu: Introduce sve-vls-map
Date: Sun, 12 May 2019 10:36:22 +0200
Message-Id: <20190512083624.8916-12-drjones@redhat.com>
In-Reply-To: <20190512083624.8916-1-drjones@redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Sun, 12 May 2019 08:37:25 +0000 (UTC)
X-TUID: mzAzp95YYl8W

Introduce another cpu property to control SVE vector lengths,
sve-vls-map, which allows the user to explicitly select the
set of vector lengths the guest can use. The map must conform
to QEMU's limits and architectural constraints, checked when
the property is set. Inconsistencies with sve-max-vq are also
checked. The bit number of a set bit in the map represents the
allowed vector length in number of quadwords.

Note, as the map is implemented with a single 64-bit word we
currently only support up to 8192-bit vectors. As QEMU and
KVM only support up to 2048-bit vectors then this sufficient
now, and probably for some time. Extending the bitmap beyond
a single word will likely require changing the property to
a string and adding yet another parser to QEMU.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/cpu.c     |  4 +++
 target/arm/cpu.h     |  3 ++
 target/arm/cpu64.c   | 70 +++++++++++++++++++++++++++++++++++++++++---
 target/arm/helper.c  | 10 ++++++-
 target/arm/monitor.c |  9 ++++--
 5 files changed, 88 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a181fa8dc1a7..ea0e24bba8b6 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1188,6 +1188,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         set_feature(env, ARM_FEATURE_VBAR);
     }
 
+    if (!kvm_enabled() && !cpu->sve_vls_map) {
+        cpu->sve_vls_map = BIT_MASK(cpu->sve_max_vq) - 1;
+    }
+
     register_cp_regs_for_features(cpu);
     arm_cpu_register_gdb_regs_for_features(cpu);
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8292d547e8f9..f0d0ce759ba8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -920,6 +920,9 @@ struct ARMCPU {
 
     /* Used to set the maximum vector length the cpu will support.  */
     uint32_t sve_max_vq;
+
+    /* Each bit represents a supported vector length of (bitnum * 16) bytes */
+    uint64_t sve_vls_map;
 };
 
 static inline ARMCPU *arm_env_get_cpu(CPUARMState *env)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 3756e7e2a3e5..9ac702d54136 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -273,14 +273,73 @@ static void cpu_max_set_sve_vq(Object *obj, Visitor *v, const char *name,
 
     visit_type_uint32(v, name, &cpu->sve_max_vq, &err);
 
-    if (!err && (cpu->sve_max_vq == 0 || cpu->sve_max_vq > ARM_MAX_VQ)) {
-        error_setg(&err, "unsupported SVE vector length");
-        error_append_hint(&err, "Valid sve-max-vq in range [1-%d]\n",
-                          ARM_MAX_VQ);
+    if (!err) {
+        if (cpu->sve_max_vq == 0 || cpu->sve_max_vq > ARM_MAX_VQ) {
+            error_setg(&err, "unsupported SVE vector length");
+            error_append_hint(&err, "Valid sve-max-vq in range [1-%d]\n",
+                              ARM_MAX_VQ);
+        } else if (cpu->sve_vls_map &&
+                   cpu->sve_max_vq != arm_cpu_fls64(cpu->sve_vls_map)) {
+            error_setg(&err, "sve-vls-map and sve-max-vq are inconsistent");
+        }
     }
     error_propagate(errp, err);
 }
 
+static void cpu_get_sve_vls_map(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    visit_type_uint64(v, name, &cpu->sve_vls_map, errp);
+}
+
+static void cpu_set_sve_vls_map(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    Error *err = NULL;
+    uint64_t mask = ~(BIT_MASK(ARM_MAX_VQ - 1) - 1);
+    int i;
+
+    visit_type_uint64(v, name, &cpu->sve_vls_map, errp);
+
+    if (!err) {
+        if (cpu->sve_vls_map == 0) {
+            error_setg(&err, "SVE vector length map cannot be zero");
+        } else if (cpu->sve_vls_map & mask) {
+            error_setg(&err, "SVE vector length map has unsupported lengths");
+            error_append_hint(&err, "Valid vector lengths in range [1-%d]\n",
+                              ARM_MAX_VQ);
+        } else if (cpu->sve_max_vq != ARM_MAX_VQ &&
+                   cpu->sve_max_vq != arm_cpu_fls64(cpu->sve_vls_map)) {
+            /*
+             * If the user provides both sve-max-vq and sve-vls-map, with
+             * sve-max-vq first, then, unless ARM_MAX_VQ is selected for
+             * sve-max-vq, we can catch inconsistencies. If ARM_MAX_VQ was
+             * selected then sve-max-vq will get silently overwritten with
+             * the max sve-vls-map provides. This is the best we can do
+             * without initially setting sve-max-vq to -1 like we do for KVM.
+             */
+            error_setg(&err, "sve-vls-map and sve-max-vq are inconsistent");
+        } else {
+            cpu->sve_max_vq = arm_cpu_fls64(cpu->sve_vls_map);
+            mask = 0;
+            for (i = 1; i < cpu->sve_max_vq; ++i) {
+                if (is_power_of_2(i)) {
+                    mask |= BIT_MASK(i - 1);
+                }
+            }
+            if ((cpu->sve_vls_map & mask) != mask) {
+                error_setg(&err, "SVE vector length map is missing lengths");
+                error_append_hint(&err, "All power-of-2 vector lengths up to "
+                                  "the max supported length are required.\n");
+            }
+        }
+    }
+
+    error_propagate(errp, err);
+}
+
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
  * otherwise, a CPU with as many features enabled as our emulation supports.
  * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
@@ -374,6 +433,9 @@ static void aarch64_max_initfn(Object *obj)
 #endif
 
         cpu->sve_max_vq = ARM_MAX_VQ;
+
+        object_property_add(obj, "sve-vls-map", "uint64", cpu_get_sve_vls_map,
+                            cpu_set_sve_vls_map, NULL, NULL, &error_fatal);
     }
 
     object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_vq,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1e6eb0d0f360..bedec1ea0b27 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5254,12 +5254,20 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
 static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                       uint64_t value)
 {
+    ARMCPU *cpu = arm_env_get_cpu(env);
     int cur_el = arm_current_el(env);
     int old_len = sve_zcr_len_for_el(env, cur_el);
     int new_len;
 
     /* Bits other than [3:0] are RAZ/WI.  */
-    raw_write(env, ri, value & 0xf);
+    value &= 0xf;
+
+    if (value && !(BIT_MASK(value) & cpu->sve_vls_map)) {
+        uint64_t map = cpu->sve_vls_map & (BIT_MASK(value) - 1);
+        value = arm_cpu_fls64(map) - 1;
+    }
+
+    raw_write(env, ri, value);
 
     /*
      * Because we arrived here, we know both FP and SVE are enabled;
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 3e13dd7c7b7a..192012659e36 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -133,9 +133,12 @@ static SVEVectorLengths *qmp_sve_vls_get(void)
     }
 
     for (i = 1; i <= cpu->sve_max_vq; ++i) {
-        *v = g_new0(intList, 1);
-        (*v)->value = i;
-        v = &(*v)->next;
+        int bitval = (cpu->sve_vls_map >> (i - 1)) & 1;
+        if (bitval) {
+            *v = g_new0(intList, 1);
+            (*v)->value = i;
+            v = &(*v)->next;
+        }
     }
 
     return vls;
-- 
2.20.1
