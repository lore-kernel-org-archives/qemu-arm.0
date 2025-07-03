Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp696890dyc;
        Thu, 3 Jul 2025 10:33:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUDKPYFpwwNJPee5D55kk2B/oxQUOSTB0gYpBgmgsNIxkQpK+lS3tAs9p/3s0LShpNikdGgZcSzhBa8Fg==@linaro.org
X-Received: by 2002:a05:600c:540e:b0:43d:b3:f95 with SMTP id 5b1f17b1804b1-454adabf504mr29454785e9.28.1751564032562;
        Thu, 03 Jul 2025 10:33:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751564032; cv=none;
        d=google.com; s=arc-20240605;
        b=Ufkd3VRdVoRMAzJcUJLH68qHJN/f1GTpWklqixGLaTqQPGB3DagMgBZblSgr+getx5
         OYVFBaeHhlwMTShp2W8PoKeL71xl/uXulu6a/b3xYPp8Ty7+f9usvcsOVxaadM0li+lL
         aeD6pnfo+BMWu0ssE8ftSctfEIAjVhuTgS/DX/hwacu57xl5G4c0kT91qrApISwVf3iO
         q8XWgywOQX6HLwXnTbWwlMfdzE4G+IUP/U0MwX5H/pmXp8PhcUM2fVMZ7idofKl59H5Y
         tIV1PY1YfJVXwYQOgetGJyKfoxjvJ3z40KDjmAPdmF5uz7cYVF9v3uVtKtT6nRGgS40J
         k73w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XcfnS13GIUjtg983McguNHeXSVu+J5s+ZUMQk0qRbKs=;
        fh=ZrHIEcx3Xue9+Dc5HrRFxBt0IU/SS5zQ3NVDGDfRg3M=;
        b=jMDGInBNcEPzIwqSQyzJ/kEh3Mn2mKypR60RNzW5u/wtnGwMtDvXpVEheWUBeqtsA/
         KG+oQrIgRzveToAZBLPJmfVDEqBt+ANbHXQTN380fG4fDBzSNMRZw7OlfbYHrzOhiGtu
         iTBprCI8dPXabIeClcb3OAP2jvKaIv17tykyewCMzG69tnfrJCfu6VVce0HDLp4jw+jO
         6IOr+jHvIk8do4+rdDuPm0LChqDCaZo1pFYJXcZCttygDNAdyX2NoXiqNpLKEb8vkvYn
         B/m3IN/khkxSgdgyof9ND73P0b6mvEP5yhCZz+x4bEyd/p+cjgs4Lf2+d2nGQNtRMQ7o
         BEgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N/wFKdVg";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-454b1b9d033sor691605e9.10.2025.07.03.10.33.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Jul 2025 10:33:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N/wFKdVg";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751564032; x=1752168832; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcfnS13GIUjtg983McguNHeXSVu+J5s+ZUMQk0qRbKs=;
        b=N/wFKdVgTiSJdYvnY8Vqmjk9mGA0pa0nC8Co3ayc7PyJSTUcn8PaLt5uBYsCY/b5CH
         2UKOFShtZ1DURc58lPporMLI17UDX66LivByx/XyibndQxKmmG0M2N55ZJBAEeZikpfg
         d0GnpHqvqDcOahDZteNSsaxzM9tScPYMGr7ygMTmrpItaLzS79R9CkhtJtJfD8Rv6yGF
         mPeGv+9wkV/23oTmA0+PHX1mBSRRC7fGBWehYRwOJemPTMA0LcbFeCraXRcTlWON4iAf
         2Oa3fz/8UGCY/Hbol1LTXdSnuVMinUMHgTy3D0MPI2NczcuGx8qVm+2vrlfMA3vPK7bl
         MKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751564032; x=1752168832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XcfnS13GIUjtg983McguNHeXSVu+J5s+ZUMQk0qRbKs=;
        b=PLbzHLQd3Il25A8ibH+fIj60sX9STJaqNWKI+5kERDTblriiz9bwfLAiKXMVSKO6o2
         Bd6bJIAmMzlw2yC6zP/kVieMjyr1rWXQnpfOqQsnAqgXADsoJJAvAEgBUaILZf0zgm8S
         L/o4+w0crru4J4z9Md2VtYc7L5xCrwh+YUyTK81k4g8N3MxvKqnGdEPvjsuJcd45MwXB
         ZdEJUugho/Kkef3j+Pgtbodaw+52TKPMwG4NHwZME2YDNMvtdMKe7XZCyhFCL1VU/E8t
         Wiwfy6JnyvkTlr5km7ub/apak6iOsCCPXEcVg3riNOnwMeadKuQSzQrJlcHJlctDExCa
         WWUw==
X-Forwarded-Encrypted: i=1; AJvYcCUht51u/mpflqwAix8asRlziZGOLYOIESWfeTAkYRp1RScwgnRmzeD/HxIR1CgQ4nKiW0oVO4z2hbm5FA==@linaro.org
X-Gm-Message-State: AOJu0Yy2fPy9a066+rcCFAWEhq+W0KNZgDdcbSAYqs/9xdib/CzPUKH1
	1osz4Ym12aByoev3zbePHcjtgf31rN8AA82yX61w76aPiPePIhw+XuPgFM3zPjZO5hEKnQ==
X-Gm-Gg: ASbGncv6eNfStEDTzwKGDeduYiqxjJ1qsaKHdyxxZZ8Z0/nipKwK1QdRx1o1m3mbIBl
	bIyucapaU+cU18aCMW7n6LeEQh5aAss+sm4O94+/vUbCC6IF/JKl51RKU4xbeqxXEpm/SJbyagr
	bgQaaxKIRWc49LpncTK/ee05IsRT9milojFddhrffRvIutqAXftVryb/xQYpgtQ7oS6UG1/W9W7
	1Mtwd6KPV4bIis08/MJK59cT6GZZNdAYAWaoKdZswFlS9ZYHbt5emJMgzs33dJWakTz86de/I37
	Mi1GA7Is+uLmcW6kQF4vPNqa1W3aOPLfgrbJUgYo+F15ZF9LScl4wEagA2T8bOSMhKgI9OX8+AC
	cQTX2cCpiUFoZP28ZUge2WMag8cRokGKh3WpT
X-Google-Smtp-Source: AGHT+IEFHjox5AGA4sYKqeK/FG7AbGqmsv8ejvJN4rlnX1vF5JW7xikwMjQzSAdkM74+gnv+3GpQ/A==
X-Received: by 2002:a05:600c:1554:b0:450:d4a6:79ad with SMTP id 5b1f17b1804b1-454a9ca8543mr46409505e9.23.1751564031784;
        Thu, 03 Jul 2025 10:33:51 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1628ed7sm3556035e9.15.2025.07.03.10.33.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Jul 2025 10:33:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Mads Ynddal <mads@ynddal.dk>,
	Alexander Graf <agraf@csgraf.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v6 12/39] accel: Move supports_guest_debug() declaration to AccelClass
Date: Thu,  3 Jul 2025 19:32:18 +0200
Message-ID: <20250703173248.44995-13-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703173248.44995-1-philmd@linaro.org>
References: <20250703173248.44995-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: amqytS78b2bd

AccelOpsClass is for methods dealing with vCPUs.
When only dealing with AccelState, AccelClass is sufficient.

In order to have AccelClass methods instrospect their state,
we need to pass AccelState by argument.

Restrict kvm_supports_guest_debug() scope.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/kvm/kvm-cpus.h       | 1 -
 include/qemu/accel.h       | 1 +
 include/system/accel-ops.h | 1 -
 include/system/hvf.h       | 2 +-
 accel/hvf/hvf-accel-ops.c  | 2 +-
 accel/kvm/kvm-accel-ops.c  | 1 -
 accel/kvm/kvm-all.c        | 5 ++++-
 accel/tcg/tcg-accel-ops.c  | 6 ------
 accel/tcg/tcg-all.c        | 6 ++++++
 gdbstub/system.c           | 8 +++++---
 target/arm/hvf/hvf.c       | 2 +-
 target/i386/hvf/hvf.c      | 2 +-
 12 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/accel/kvm/kvm-cpus.h b/accel/kvm/kvm-cpus.h
index 688511151c8..3185659562d 100644
--- a/accel/kvm/kvm-cpus.h
+++ b/accel/kvm/kvm-cpus.h
@@ -16,7 +16,6 @@ void kvm_destroy_vcpu(CPUState *cpu);
 void kvm_cpu_synchronize_post_reset(CPUState *cpu);
 void kvm_cpu_synchronize_post_init(CPUState *cpu);
 void kvm_cpu_synchronize_pre_loadvm(CPUState *cpu);
-bool kvm_supports_guest_debug(void);
 int kvm_insert_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr len);
 int kvm_remove_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr len);
 void kvm_remove_all_breakpoints(CPUState *cpu);
diff --git a/include/qemu/accel.h b/include/qemu/accel.h
index fbd3d897fef..fb176e89bad 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -47,6 +47,7 @@ typedef struct AccelClass {
                        hwaddr start_addr, hwaddr size);
 
     /* gdbstub related hooks */
+    bool (*supports_guest_debug)(AccelState *as);
     int (*gdbstub_supported_sstep_flags)(void);
 
     bool *allowed;
diff --git a/include/system/accel-ops.h b/include/system/accel-ops.h
index 4c99d25aeff..700df92ac6d 100644
--- a/include/system/accel-ops.h
+++ b/include/system/accel-ops.h
@@ -63,7 +63,6 @@ struct AccelOpsClass {
     int64_t (*get_elapsed_ticks)(void);
 
     /* gdbstub hooks */
-    bool (*supports_guest_debug)(void);
     int (*update_guest_debug)(CPUState *cpu);
     int (*insert_breakpoint)(CPUState *cpu, int type, vaddr addr, vaddr len);
     int (*remove_breakpoint)(CPUState *cpu, int type, vaddr addr, vaddr len);
diff --git a/include/system/hvf.h b/include/system/hvf.h
index a9a502f0c8f..a9fd13d9bba 100644
--- a/include/system/hvf.h
+++ b/include/system/hvf.h
@@ -71,7 +71,7 @@ void hvf_arch_update_guest_debug(CPUState *cpu);
 /*
  * Return whether the guest supports debugging.
  */
-bool hvf_arch_supports_guest_debug(void);
+bool hvf_arch_supports_guest_debug(AccelState *as);
 #endif /* COMPILING_PER_TARGET */
 
 #endif
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index b38977207d2..aed791a3f3e 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -366,6 +366,7 @@ static void hvf_accel_class_init(ObjectClass *oc, const void *data)
     ac->name = "HVF";
     ac->init_machine = hvf_accel_init;
     ac->allowed = &hvf_allowed;
+    ac->supports_guest_debug = hvf_arch_supports_guest_debug;
     ac->gdbstub_supported_sstep_flags = hvf_gdbstub_sstep_flags;
 }
 
@@ -600,7 +601,6 @@ static void hvf_accel_ops_class_init(ObjectClass *oc, const void *data)
     ops->remove_breakpoint = hvf_remove_breakpoint;
     ops->remove_all_breakpoints = hvf_remove_all_breakpoints;
     ops->update_guest_debug = hvf_update_guest_debug;
-    ops->supports_guest_debug = hvf_arch_supports_guest_debug;
 };
 static const TypeInfo hvf_accel_ops_type = {
     .name = ACCEL_OPS_NAME("hvf"),
diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index e5c15449aa6..96606090889 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -104,7 +104,6 @@ static void kvm_accel_ops_class_init(ObjectClass *oc, const void *data)
 
 #ifdef TARGET_KVM_HAVE_GUEST_DEBUG
     ops->update_guest_debug = kvm_update_guest_debug_ops;
-    ops->supports_guest_debug = kvm_supports_guest_debug;
     ops->insert_breakpoint = kvm_insert_breakpoint;
     ops->remove_breakpoint = kvm_remove_breakpoint;
     ops->remove_all_breakpoints = kvm_remove_all_breakpoints;
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 17235f26464..c8611552d19 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3533,7 +3533,7 @@ int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap)
     return data.err;
 }
 
-bool kvm_supports_guest_debug(void)
+static bool kvm_supports_guest_debug(AccelState *as)
 {
     /* probed during kvm_init() */
     return kvm_has_guest_debug;
@@ -3998,6 +3998,9 @@ static void kvm_accel_class_init(ObjectClass *oc, const void *data)
     ac->has_memory = kvm_accel_has_memory;
     ac->allowed = &kvm_allowed;
     ac->gdbstub_supported_sstep_flags = kvm_gdbstub_sstep_flags;
+#ifdef TARGET_KVM_HAVE_GUEST_DEBUG
+    ac->supports_guest_debug = kvm_supports_guest_debug;
+#endif
 
     object_class_property_add(oc, "kernel-irqchip", "on|off|split",
         NULL, kvm_set_kernel_irqchip,
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 6116644d1c0..f579685a611 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -106,11 +106,6 @@ void tcg_handle_interrupt(CPUState *cpu, int mask)
     }
 }
 
-static bool tcg_supports_guest_debug(void)
-{
-    return true;
-}
-
 /* Translate GDB watchpoint type to a flags value for cpu_watchpoint_* */
 static inline int xlat_gdb_type(CPUState *cpu, int gdbtype)
 {
@@ -216,7 +211,6 @@ static void tcg_accel_ops_init(AccelOpsClass *ops)
     }
 
     ops->cpu_reset_hold = tcg_cpu_reset_hold;
-    ops->supports_guest_debug = tcg_supports_guest_debug;
     ops->insert_breakpoint = tcg_insert_breakpoint;
     ops->remove_breakpoint = tcg_remove_breakpoint;
     ops->remove_all_breakpoints = tcg_remove_all_breakpoints;
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index 6e5dc333d59..0cff0f8a0f9 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -219,6 +219,11 @@ static void tcg_set_one_insn_per_tb(Object *obj, bool value, Error **errp)
     qatomic_set(&one_insn_per_tb, value);
 }
 
+static bool tcg_supports_guest_debug(AccelState *as)
+{
+    return true;
+}
+
 static int tcg_gdbstub_supported_sstep_flags(void)
 {
     /*
@@ -242,6 +247,7 @@ static void tcg_accel_class_init(ObjectClass *oc, const void *data)
     ac->cpu_common_realize = tcg_exec_realizefn;
     ac->cpu_common_unrealize = tcg_exec_unrealizefn;
     ac->allowed = &tcg_allowed;
+    ac->supports_guest_debug = tcg_supports_guest_debug;
     ac->gdbstub_supported_sstep_flags = tcg_gdbstub_supported_sstep_flags;
 
     object_class_property_add_str(oc, "thread",
diff --git a/gdbstub/system.c b/gdbstub/system.c
index 8a32d8e1a1d..03934deed49 100644
--- a/gdbstub/system.c
+++ b/gdbstub/system.c
@@ -13,6 +13,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
+#include "qemu/accel.h"
 #include "qemu/cutils.h"
 #include "exec/gdbstub.h"
 #include "gdbstub/syscalls.h"
@@ -634,9 +635,10 @@ int gdb_signal_to_target(int sig)
 
 bool gdb_supports_guest_debug(void)
 {
-    const AccelOpsClass *ops = cpus_get_accel();
-    if (ops->supports_guest_debug) {
-        return ops->supports_guest_debug();
+    AccelState *accel = current_accel();
+    AccelClass *acc = ACCEL_GET_CLASS(accel);
+    if (acc->supports_guest_debug) {
+        return acc->supports_guest_debug(accel);
     }
     return false;
 }
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 7b6d291e79c..995a6a74b06 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2352,7 +2352,7 @@ void hvf_arch_update_guest_debug(CPUState *cpu)
     hvf_arch_set_traps(cpu);
 }
 
-bool hvf_arch_supports_guest_debug(void)
+bool hvf_arch_supports_guest_debug(AccelState *as)
 {
     return true;
 }
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 99e37a33e50..b25bff0df41 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -1019,7 +1019,7 @@ void hvf_arch_update_guest_debug(CPUState *cpu)
 {
 }
 
-bool hvf_arch_supports_guest_debug(void)
+bool hvf_arch_supports_guest_debug(AccelState *as)
 {
     return false;
 }
-- 
2.49.0
