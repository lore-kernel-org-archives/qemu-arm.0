Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp449415dyc;
        Thu, 3 Jul 2025 03:57:18 -0700 (PDT)
X-Received: by 2002:a05:600c:638e:b0:450:d104:29eb with SMTP id 5b1f17b1804b1-454a36d7ab3mr60879355e9.5.1751540238282;
        Thu, 03 Jul 2025 03:57:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751540238; cv=none;
        d=google.com; s=arc-20240605;
        b=CQCoJgQAGKGuCgzuShauxBTTtruUEMEGE762ZYgv3mGW0vHdLRnHm8NB9rs96Z8ByE
         1+DBssytTNeJGjE1isibTteeBrMsuD6sqLh5GidRlg4jpQgt2utV2v1E9J7/atqm7H/i
         Urk4sKcmmiiLvZEPcw8tIH7Q5u0feXPZCNPXHkX7cuT13KMwuVxSkLGYik7kKCvAVyC9
         gINKIwTiMHOSaItBU4CFss19c8QMhP4YDM60aYijyvQth+MFwX4GaqNe6zuQPt+N4oL4
         WT9B69dzBKTrBaT8LP8aecTjUCFCBVObna7k9sa0bKg45a3iPZM2q5pagGLOo83COpT3
         Wjfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bV84MiQpGOn60kTDkD54slrXkuHu95fcxpVNCRAl6i0=;
        fh=uJ3dFTbL6U4oY1jR+3e9dBFvfZBH369kHbvQi/mdha8=;
        b=VX8d0MEw4WDPiET2dVdYPqdtL7rA4zaJ+PipQ2y3pLAN5TnDxb3Mek570Y7NtyLtRI
         kFR73StF7Hc6OlcAGJ3/qlSPliICXOWuwDFX79F7aB7q4AOByLoD0E+aoLDiax0nkQdX
         A7ihyxZ23kOH+3rClZHuihKPHsoabxhvDgWOfqCJUjKhq2G26XeS7TmbIJVQ6eUzH0X+
         w8aR4TpnCIVWmGYw50hRUGHm2Ebu5as2J67kssB3fay6JLz9dy5R8B8mYjgZRmTiZdlT
         ylpQ+4ioUA2G+J9pIsFw9xWg+GVjA3fDBcBsmeYvE/DzKbvpVfXdPNqn5gvOaK/+qn3O
         A6Bw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OmSshK4b;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-454b04ccf38sor683285e9.1.2025.07.03.03.57.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Jul 2025 03:57:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OmSshK4b;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751540238; x=1752145038; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bV84MiQpGOn60kTDkD54slrXkuHu95fcxpVNCRAl6i0=;
        b=OmSshK4bpJhRZVFg+EfHk4IwDUx/zk5tFVaHTGWiKpNOPNAlDMExAKCTTProGJrJLJ
         NhHDmm3UMmJwyXx9K+ZmaqAnrO8jV+aXmyGoGhvW5FYoUlr7n20qfGF9RlPg7ZeZQb90
         fwVwqRxfWGjtUGEt1QAaLjTuBYVAGeoA9fGqoKmrFjqgUjRxWn3boxP3L0RBrHNVGr4S
         fOAVdu6RkJcISrmp6LHfnzYD5pYvgx4hWUjmU/+BjFhlHNydOEPh1nn7T+MoYn2o6vYH
         BQbBa9Ub4u4Ff2k3jaONSTRSgsRi2ze8Pa/PFDeiNyKullBJM7LCvuW+vOvzFzZqjk36
         jc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751540238; x=1752145038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bV84MiQpGOn60kTDkD54slrXkuHu95fcxpVNCRAl6i0=;
        b=Rbo9/kahClM69Sk2Qq4pklsoKnpxn5nI1TxKuUY1dpf/9fw7WwO1F2H+w64WS2K3D7
         itmYFJkQVVt6nAGv/YdTfo61llPQO184hy0HKhyishrH39q6bmIFQ70wTELqyvUgKvJ4
         u7iodZhr64RVdNoBzPqoxexNBhRaHBTQzmMbzmxDovO0YaiHaDbJoLEfoZKHb9CKOhmC
         SkQZ5citOCT/fDSiQ4/a9Ulf562vVea7K7ra/oqEjQSomQO6toYGIh/xaLswvdAJ6Qv1
         j1qFQe5pDtiONCYzNkw8ySv7p0di3Mvp37wIZMKf3EoyAB1t4hjXr1RJ8kzzMQwoMVoe
         w7EA==
X-Gm-Message-State: AOJu0YzvipER4yIwBpUIBmtrz4UKldlhUGxSiVBLEwr11KkeTW3VsFrU
	YNNHwOkfcE/sOGPSuvD+cFPGkHWAAGHL7/aKNfBZpNq/wCOR4fW80YVonBsSvnWQvoAkcA==
X-Gm-Gg: ASbGncscZVK+6ZhFE2Y5amYsTTRSi8szJOBtZsV6ko68K/9KqKFgA1e9mDzd7tpRV3j
	+nl5yLhG71rXrUoacFgkB6UGHbVijRjTvpZDUwMaPonOdkACUC8IEQWxo7WN+rAXsdxHz3k7ASQ
	V1d7TfQNh0WroY9TPi+PTC9MC9xwkH897vy445LDrW6sBrL8eGefiFlVZ1uLK3fu8ZAZt7C4uKw
	FCABfW88OCoa7ceJHWe516PEhRnrAJmOg66QjVApkMdouJS4K0Ai/eGNtMnXvyaXa1lFQQMTRya
	ZygO+aB5fza09BBOj0MIlNEtcFzQA7/nAIuN/bC6f3ZzCxtFq+gOwzf+7oDB1eC78jgcAwc31Lz
	n0msEQ6sJPuo=
X-Google-Smtp-Source: AGHT+IEmNLvtVHQf9NpB/fQmjEXmTAthaVxxUyGp9hx2gO4yuAi9n/eHxM8kk1TDX0WcFyurTuexYQ==
X-Received: by 2002:a05:600c:5248:b0:453:dda:a52e with SMTP id 5b1f17b1804b1-454a373d342mr54355175e9.33.1751540237572;
        Thu, 03 Jul 2025 03:57:17 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([83.247.137.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e591d7sm18631695f8f.67.2025.07.03.03.57.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Jul 2025 03:57:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	kvm@vger.kernel.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Mads Ynddal <mads@ynddal.dk>,
	Alexander Graf <agraf@csgraf.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH v5 18/69] accel: Move supports_guest_debug() declaration to AccelClass
Date: Thu,  3 Jul 2025 12:54:44 +0200
Message-ID: <20250703105540.67664-19-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703105540.67664-1-philmd@linaro.org>
References: <20250703105540.67664-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kbGZjkvTMF5y

AccelOpsClass is for methods dealing with vCPUs.
When only dealing with AccelState, AccelClass is sufficient.

In order to have AccelClass methods instrospect their state,
we need to pass AccelState by argument.

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
 gdbstub/system.c           | 7 ++++---
 target/arm/hvf/hvf.c       | 2 +-
 target/i386/hvf/hvf.c      | 2 +-
 12 files changed, 19 insertions(+), 17 deletions(-)

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
index 1c097ac4dfb..c6fe8dc3913 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -50,6 +50,7 @@ typedef struct AccelClass {
                        hwaddr start_addr, hwaddr size);
 
     /* gdbstub related hooks */
+    bool (*supports_guest_debug)(AccelState *as);
     int (*gdbstub_supported_sstep_flags)(AccelState *as);
 
     bool *allowed;
diff --git a/include/system/accel-ops.h b/include/system/accel-ops.h
index a863fe59388..51faf47ac69 100644
--- a/include/system/accel-ops.h
+++ b/include/system/accel-ops.h
@@ -65,7 +65,6 @@ struct AccelOpsClass {
     int64_t (*get_elapsed_ticks)(void);
 
     /* gdbstub hooks */
-    bool (*supports_guest_debug)(void);
     int (*update_guest_debug)(CPUState *cpu);
     int (*insert_breakpoint)(CPUState *cpu, int type, vaddr addr, vaddr len);
     int (*remove_breakpoint)(CPUState *cpu, int type, vaddr addr, vaddr len);
diff --git a/include/system/hvf.h b/include/system/hvf.h
index 8c4409a13f1..7b9384d816c 100644
--- a/include/system/hvf.h
+++ b/include/system/hvf.h
@@ -71,7 +71,7 @@ void hvf_arch_update_guest_debug(CPUState *cpu);
 /*
  * Return whether the guest supports debugging.
  */
-bool hvf_arch_supports_guest_debug(void);
+bool hvf_arch_supports_guest_debug(AccelState *as);
 
 bool hvf_arch_cpu_realize(CPUState *cpu, Error **errp);
 
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 640f41faa43..e7f40888c26 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -364,6 +364,7 @@ static void hvf_accel_class_init(ObjectClass *oc, const void *data)
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
index 45579f80fa5..a9d917f1ea6 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3528,7 +3528,7 @@ int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap)
     return data.err;
 }
 
-bool kvm_supports_guest_debug(void)
+static bool kvm_supports_guest_debug(AccelState *as)
 {
     /* probed during kvm_init() */
     return kvm_has_guest_debug;
@@ -3993,6 +3993,9 @@ static void kvm_accel_class_init(ObjectClass *oc, const void *data)
     ac->has_memory = kvm_accel_has_memory;
     ac->allowed = &kvm_allowed;
     ac->gdbstub_supported_sstep_flags = kvm_gdbstub_sstep_flags;
+#ifdef TARGET_KVM_HAVE_GUEST_DEBUG
+    ac->supports_guest_debug = kvm_supports_guest_debug;
+#endif
 
     object_class_property_add(oc, "kernel-irqchip", "on|off|split",
         NULL, kvm_set_kernel_irqchip,
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 37b4b21f882..07b1ec4ea50 100644
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
@@ -218,7 +213,6 @@ static void tcg_accel_ops_init(AccelClass *ac)
     }
 
     ops->cpu_reset_hold = tcg_cpu_reset_hold;
-    ops->supports_guest_debug = tcg_supports_guest_debug;
     ops->insert_breakpoint = tcg_insert_breakpoint;
     ops->remove_breakpoint = tcg_remove_breakpoint;
     ops->remove_all_breakpoints = tcg_remove_all_breakpoints;
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index 5904582a68d..93972bc0919 100644
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
 static int tcg_gdbstub_supported_sstep_flags(AccelState *as)
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
index 8a32d8e1a1d..bced226fd94 100644
--- a/gdbstub/system.c
+++ b/gdbstub/system.c
@@ -634,9 +634,10 @@ int gdb_signal_to_target(int sig)
 
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
index 4c4d21e38cd..bd19a9f475d 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2357,7 +2357,7 @@ void hvf_arch_update_guest_debug(CPUState *cpu)
     hvf_arch_set_traps(cpu);
 }
 
-bool hvf_arch_supports_guest_debug(void)
+bool hvf_arch_supports_guest_debug(AccelState *as)
 {
     return true;
 }
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 28484496710..bcf30662bec 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -1024,7 +1024,7 @@ void hvf_arch_update_guest_debug(CPUState *cpu)
 {
 }
 
-bool hvf_arch_supports_guest_debug(void)
+bool hvf_arch_supports_guest_debug(AccelState *as)
 {
     return false;
 }
-- 
2.49.0
