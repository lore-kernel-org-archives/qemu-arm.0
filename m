Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp72115dyc;
        Wed, 2 Jul 2025 11:55:38 -0700 (PDT)
X-Received: by 2002:adf:e54d:0:b0:3a5:25e0:ab53 with SMTP id ffacd0b85a97d-3b20095ce32mr2284666f8f.32.1751482538205;
        Wed, 02 Jul 2025 11:55:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751482538; cv=none;
        d=google.com; s=arc-20240605;
        b=HXZ++xlkjgU6hQndFDr4GxtWkcNixPH0VJk3ogJg+SrkMRuudS0UTrpF2vjKzdSAhO
         2D/IxR3zMjG7ywv78FzQEHqqxer2sYl2b0gw2XQFjkSaDzqVClZ9XJvt4k9CzFhUs7hi
         MJBlMHmM0w+uPEtayWyaBc02dRAkT0gaBRZZCDC5PmAb6c/nZxEhwhw3pQVUKNveXZ86
         BHIhy9RLm3HBjo4ZF3xE5DGBYYVsA9xaG7QiP7hHbMhGRX38rS8cuCSi2FzEgFq/cN5s
         qk97G4EqU2qW8G7Nhac+OadTkSXHGAVeHUC68Q/J8zd0V0zyi8/sGbNTmOORA3JfAvCP
         2mrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bV84MiQpGOn60kTDkD54slrXkuHu95fcxpVNCRAl6i0=;
        fh=cCwRpkpEkGMfe41hd/ps1Kewpy5SFDI6sTYzDAIxE4c=;
        b=hekRCEClWA9jMXFI2P5N2Xy0A32N0eMXLiEZE1dEcUtl7vQc99tgJ3uv77F1C+AEkg
         Cx0tWJFOPTWFwcCOSxAquomNSVXejCCw6osLE9IUpZfW7ScbiwkRCBacMmNohtseQ1KM
         k1knTJ3HQHYCcvl6b8BXs87jYk5g2DC5Tm0OcvoEv4ye6a/cbnDh4qI7baasfZnhzBQV
         zQ1eo/KU8Bj2jGbzq7hOXa8qK/gFAQSQACs0+lBtMR10fJPcAO7VeMmn1yYX3fZ13X35
         /jBgFpHANhh8WIG7ng+6vIghKmPtIqZcOmBt6XZdzln0/UNnFl1MJxmLb1tln/fAE2Yy
         a2zA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=poADFmzj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a892e65853sor4332241f8f.8.2025.07.02.11.55.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Jul 2025 11:55:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=poADFmzj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751482538; x=1752087338; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bV84MiQpGOn60kTDkD54slrXkuHu95fcxpVNCRAl6i0=;
        b=poADFmzjutVR86Ua6DgtAsR0SDarmkK6ag6uDxYHr4eoJnPE9fFUeowvsA1qmdbVdb
         nLPzt7I5LNO7U5h/yAjaRSMVu3AyG9HjEd8TLOTSm/Bp88BEgAPPK8mzFJZlaOPByhfX
         CkK8SDeGH2wjQ3ZF0eHPXJ6zo6ZT4l2786gIhxywjKMoRw7Dqb6jyJ3xTy1qZAgxZ3Dt
         HBk/79nUPZmcIfGG/FnyknMo/yt3RAxxMe7MMwyslkumbWGi7ify33UGkmu0iGNgVeKc
         JFrv6NhBHG2WzgEgsLdSSEUwFBE0vXr41Fhj0r7W+sTPT/xBmHibA32k3RV4esVBLVbc
         THzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751482538; x=1752087338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bV84MiQpGOn60kTDkD54slrXkuHu95fcxpVNCRAl6i0=;
        b=aRpaushlleMAIZredu49Vl/m+kB6jWoU9DsUgHRkNHilvrgq/7MY18BPFWS1zpn0gC
         70UQslLvmC85w8lz7TrgPCo3sbQ+Q0ockg/p6pPqFViR4Yb+f0B8tWJuiS0cFXg+vN09
         UJMaj9Pn7i08LGwf0z1yvFo1jbpv56vOPne53IMeL4xiEXv5Q+vkDJnbyEJmLt7XpoBo
         7KMOavbOJQ0vdh+fWjdcMD8cl/bCBAPTv8ezV7LkiQVyacft+oYJ8mtfg8e2qopPZvwR
         lto+1CF1ae+dYcV+wDY5KftuQAlgyIqgXDnO6V9kqhNC7fSYLnmJXlDCGeq1L40BRTq1
         MYAA==
X-Gm-Message-State: AOJu0YydfCbIpX4c/Xkfa758a4Jm8MEPv0sXO0p3GujloWpY8rmHcdBA
	NZEo3tnjpwSm5LPSJR+9OOgZRGd7DKBsQRu4MgdxOnapPRZyUeiuzLs6kefT3N+2Y2UKqA==
X-Gm-Gg: ASbGncv0caQ8YeqHdtLFgUxiMQHiRAkrzqnk2M9R3JBzx/PFrPmTLV3G1ZqcAqg0AW3
	Cu9uKvOkhC1xQuKIohF1PUlc94pMlZhuf3ZT1hhH6LQQuiH1dQgDOmCAmiHICQ+eCRaZdESQ5Nh
	rfwHxloCMHoh73200UTRk00yyjmid2vAjTDcGCZv4iywCxkVHq0f9n209NU+Ii/lD2Ruh4Zx987
	fRmBbulXFSG5beKgkyJHiA4WzVERT5oIC4eXz/A12Q9SpAFygJvhh+814x64VLgkIdFis1Rivbh
	Dtd+liobakO8n/0T02a9gR7/r6aD2p+dREqVfhv4THzLTRT/V+hkOUyYU4F8x0i0G2DvaHZnk9K
	pw7rvJgAzXqdtN8/KZW0EBbtYTjKpDbHcDFa8
X-Google-Smtp-Source: AGHT+IFODJ+D1AFeTvC1vkdycvK6lOL44CSBA8lY+BbJ04aT22gqywY98ryhDAizdMHORIqFjKZtkA==
X-Received: by 2002:a05:6000:1a8a:b0:3a4:f786:4fa1 with SMTP id ffacd0b85a97d-3b1fe5bf079mr3216108f8f.2.1751482537445;
        Wed, 02 Jul 2025 11:55:37 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f44dsm16538961f8f.87.2025.07.02.11.55.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 02 Jul 2025 11:55:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Mads Ynddal <mads@ynddal.dk>,
	Alexander Graf <agraf@csgraf.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v4 17/65] accel: Move supports_guest_debug() declaration to AccelClass
Date: Wed,  2 Jul 2025 20:52:39 +0200
Message-ID: <20250702185332.43650-18-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702185332.43650-1-philmd@linaro.org>
References: <20250702185332.43650-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: R8XnLpQa2lXl

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
