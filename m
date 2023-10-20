Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1361052ejb;
        Fri, 20 Oct 2023 09:38:20 -0700 (PDT)
X-Received: by 2002:a17:906:7315:b0:9be:71ab:fb5e with SMTP id di21-20020a170906731500b009be71abfb5emr2164464ejc.22.1697819900543;
        Fri, 20 Oct 2023 09:38:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697819900; cv=none;
        d=google.com; s=arc-20160816;
        b=q8cFGxZDEmSswoulfhuRB94/kTgCQMYjewqTkXEYKAY2E1qqfFTbEdAObQ6CPkHJLA
         U+jVs1WfYX5rqGBQ3+ffLXDFke8nASdz/0sH5H2KECwPaFGsMa2yGyiRD/rJSFKQgEoh
         EFgWU4hT5BmOan8Gl6RZQWaBm3yGFhT68ymkpdRaETNy6kUOCZUACpZhbSjoVIEo9DXF
         9flm1IRTVwBv73gMjoy3GwLtIkL8obxMlUzZlae5BuV3GNKvzm2AeYhO1BSMKigMcPw9
         JK6BFQvMWglitmx+Kn4DtTuIhpBv+hkdWxngaOrH6tVEAyYTGcqdlQf4D6lfTFVgUktr
         6pSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gyJaNaz+yQUi1oc2/ICF5HBrjSZAS7PKSP5aD7nnSG8=;
        fh=JEUv0ENVBkrMu1SiyCFOcz21tzlcIi2TU77zrHQ7sGc=;
        b=QLCMc0en8b5h8IS9i3Ga3CyDilmP+DkY5fJZzDTLisEHXTJy5IJeYoh4e/Ed/CK7Gy
         G9YS4RThvUuu1ufI6ZnYNHnkWbD1AOSzNKVo+Z9QM1kG/+okV2DIeznxiNd9+lM7pWib
         WCP2CJGmNBzl/Jf3JoFaFnE2WBhLiq7jbz2WlXWS8u/XckbwLXRjrNULUUqT8TmJq+hf
         glHpS+cQrCxAIBGnlYHW8P8oG9qH+ekcjJyCC9oEeuxJ5jQjZTmCLkE2/HaXQVADray2
         jiIeFFqdB2hUi3uu/9ASYWkgi/RBf9pxAoBwzgGcUB9Jhfwh2G8teRvjGPQxr92dmwn+
         TYVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xjxTw8uS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ty21-20020a170907c71500b009b298be8ae6sor726981ejc.20.2023.10.20.09.38.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Oct 2023 09:38:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xjxTw8uS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697819900; x=1698424700; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyJaNaz+yQUi1oc2/ICF5HBrjSZAS7PKSP5aD7nnSG8=;
        b=xjxTw8uSA3/WrMVJk5/67kDBYgorlQmTbOhYCiW8osUVwf1p9DFNKX6Vzdm5Ou3WWN
         4RF9aWOXeg8TxmmnX4TKiuVvA7/QDtJqGws5CHbDxnl75T7et/yDklo9zjg1UIqrWP85
         niZP1sofJHmKUG34cHnir5DCe3NaAPD9UP1YUk/Wk/FlqKduy+Fs4VzDcf3JlD5PXJn2
         1fGbnWXMlaZ9vrEBLNNjJqz/fubAabhRinf7fa60apBwv6+4LXyJbJj+imQjvho244TM
         v0IQHtGAUby6Gyi1yTS5Gkq6642hxKMO8iou3VJtF+CvKqS3/np9fEfW+CcDqtl0J3Jo
         mCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697819900; x=1698424700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyJaNaz+yQUi1oc2/ICF5HBrjSZAS7PKSP5aD7nnSG8=;
        b=Au7Ay7ksAt0X7Mv3t5DDNhh/dioILElh4oYNjHqAnWV8l+TBiW8b8bL6QbqSaYkfXu
         q3J72geYmjy6a3MOvtR9RTm1pjkFGbzNtajeEPynkjV48KeceoCpCHAgjvIfEhXFB5KG
         faNi1X0ORFrPqozt8kAfh26X8dd8+yFQaJV2CdLCrXQqmCK7S3L2HJ8wxjIXWI4Q0sUs
         4fxrlF6ElDjsXFm8W40l4XJK8f6/7Z4sMFZU2tQF1U7bm2bnm5LZ+pt4BQlOukJsnSIJ
         ecM2CtLWKWNSqySoHjyROmaeqWZr4y92K0jfSNfC4m3Qk7TxOo3sXZIYL2uf28biilzm
         tNLA==
X-Gm-Message-State: AOJu0Yyu/pegREBlLZyjHqA+mIog55KlW77Yw3EAuhqmSr84Jurh8YfS
	lUlbuuLBLhBLaIaJzs/3suM3+GO1
X-Google-Smtp-Source: AGHT+IFBfKbQwH9V3tIztlCgedZL06X6xkpxRSX0F2ztCJXYo/UXY7UYQxkYQktWmALhyqPrbSACzw==
X-Received: by 2002:a50:f683:0:b0:53f:2128:ff4f with SMTP id d3-20020a50f683000000b0053f2128ff4fmr1999564edn.17.1697819900211;
        Fri, 20 Oct 2023 09:38:20 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr. [176.171.212.97])
        by smtp.gmail.com with ESMTPSA id y90-20020a50bb63000000b0053e8bb112adsm1775109ede.53.2023.10.20.09.38.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Oct 2023 09:38:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-ppc@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-s390x@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH 12/19] cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_MIPS_CPU)
Date: Fri, 20 Oct 2023 18:36:34 +0200
Message-ID: <20231020163643.86105-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: sfHwtAHgE96l

Mechanical change using the following coccinelle script:

  @@ @@
  -   first_cpu
  +   qemu_get_cpu(0, TYPE_MIPS_CPU)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/internal.h              | 2 +-
 hw/intc/mips_gic.c                  | 2 +-
 hw/mips/bootloader.c                | 3 ++-
 hw/mips/cps.c                       | 5 +++--
 hw/mips/loongson3_bootp.c           | 2 +-
 hw/mips/loongson3_virt.c            | 7 ++++---
 hw/mips/malta.c                     | 2 +-
 hw/misc/mips_cpc.c                  | 4 ++--
 target/mips/tcg/sysemu/cp0_helper.c | 8 ++++----
 target/mips/tcg/sysemu/tlb_helper.c | 2 +-
 10 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 1d0c026c7d..d373063fd0 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -270,7 +270,7 @@ static inline int mips_vpe_active(CPUMIPSState *env)
 
 static inline int mips_vp_active(CPUMIPSState *env)
 {
-    CPUState *other_cs = first_cpu;
+    CPUState *other_cs = qemu_get_cpu(0, TYPE_MIPS_CPU);
 
     /* Check if the VP disabled other VPs (which means the VP is enabled) */
     if ((env->CP0_VPControl >> CP0VPCtl_DIS) & 1) {
diff --git a/hw/intc/mips_gic.c b/hw/intc/mips_gic.c
index 77ba7348a3..4c4791aefa 100644
--- a/hw/intc/mips_gic.c
+++ b/hw/intc/mips_gic.c
@@ -406,7 +406,7 @@ static void mips_gic_init(Object *obj)
 static void mips_gic_realize(DeviceState *dev, Error **errp)
 {
     MIPSGICState *s = MIPS_GIC(dev);
-    CPUState *cs = first_cpu;
+    CPUState *cs = qemu_get_cpu(0, TYPE_MIPS_CPU);
     int i;
 
     if (s->num_vps > GIC_MAX_VPS) {
diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
index 1dd6ef2096..c4943f193f 100644
--- a/hw/mips/bootloader.c
+++ b/hw/mips/bootloader.c
@@ -51,7 +51,8 @@ typedef enum bl_reg {
 
 static bool bootcpu_supports_isa(uint64_t isa_mask)
 {
-    return cpu_supports_isa(&MIPS_CPU(first_cpu)->env, isa_mask);
+    return cpu_supports_isa(&MIPS_CPU(qemu_get_cpu(0, TYPE_MIPS_CPU))->env,
+                            isa_mask);
 }
 
 static void st_nm32_p(void **ptr, uint32_t insn)
diff --git a/hw/mips/cps.c b/hw/mips/cps.c
index 2b5269ebf1..d2f72cbf90 100644
--- a/hw/mips/cps.c
+++ b/hw/mips/cps.c
@@ -107,7 +107,8 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
     if (itu_present) {
         object_initialize_child(OBJECT(dev), "itu", &s->itu, TYPE_MIPS_ITU);
         object_property_set_link(OBJECT(&s->itu), "cpu[0]",
-                                 OBJECT(first_cpu), &error_abort);
+                                 OBJECT(qemu_get_cpu(0, TYPE_MIPS_CPU)),
+                                 &error_abort);
         object_property_set_uint(OBJECT(&s->itu), "num-fifo", 16,
                                 &error_abort);
         object_property_set_uint(OBJECT(&s->itu), "num-semaphores", 16,
@@ -147,7 +148,7 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
                             sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gic), 0));
 
     /* Global Configuration Registers */
-    gcr_base = MIPS_CPU(first_cpu)->env.CP0_CMGCRBase << 4;
+    gcr_base = MIPS_CPU(qemu_get_cpu(0, TYPE_MIPS_CPU))->env.CP0_CMGCRBase << 4;
 
     object_initialize_child(OBJECT(dev), "gcr", &s->gcr, TYPE_MIPS_GCR);
     object_property_set_uint(OBJECT(&s->gcr), "num-vp", s->num_vp,
diff --git a/hw/mips/loongson3_bootp.c b/hw/mips/loongson3_bootp.c
index f99af22932..3ad9cf2f0c 100644
--- a/hw/mips/loongson3_bootp.c
+++ b/hw/mips/loongson3_bootp.c
@@ -32,7 +32,7 @@ static void init_cpu_info(void *g_cpuinfo, uint64_t cpu_freq)
     struct efi_cpuinfo_loongson *c = g_cpuinfo;
 
     c->cputype = cpu_to_le32(Loongson_3A);
-    c->processor_id = cpu_to_le32(MIPS_CPU(first_cpu)->env.CP0_PRid);
+    c->processor_id = cpu_to_le32(MIPS_CPU(qemu_get_cpu(0, TYPE_MIPS_CPU))->env.CP0_PRid);
     if (cpu_freq > UINT_MAX) {
         c->cpu_clock_freq = cpu_to_le32(UINT_MAX);
     } else {
diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
index b74b358874..9dd943d477 100644
--- a/hw/mips/loongson3_virt.c
+++ b/hw/mips/loongson3_virt.c
@@ -159,7 +159,8 @@ static uint64_t get_cpu_freq_hz(void)
     };
 
     if (kvm_enabled()) {
-        ret = kvm_vcpu_ioctl(first_cpu, KVM_GET_ONE_REG, &freq_reg);
+        ret = kvm_vcpu_ioctl(qemu_get_cpu(0, TYPE_MIPS_CPU), KVM_GET_ONE_REG,
+                             &freq_reg);
         if (ret >= 0) {
             return freq * 2;
         }
@@ -387,7 +388,7 @@ static void main_cpu_reset(void *opaque)
 
     /* Loongson-3 reset stuff */
     if (loaderparams.kernel_filename) {
-        if (cpu == MIPS_CPU(first_cpu)) {
+        if (cpu == MIPS_CPU(qemu_get_cpu(0, TYPE_MIPS_CPU))) {
             env->active_tc.gpr[4] = loaderparams.a0;
             env->active_tc.gpr[5] = loaderparams.a1;
             env->active_tc.gpr[6] = loaderparams.a2;
@@ -543,7 +544,7 @@ static void mips_loongson3_virt_init(MachineState *machine)
                                pin, cpu->env.irq[ip + 2]);
         }
     }
-    env = &MIPS_CPU(first_cpu)->env;
+    env = &MIPS_CPU(qemu_get_cpu(0, TYPE_MIPS_CPU))->env;
 
     /* Allocate RAM/BIOS, 0x00000000~0x10000000 is alias of 0x80000000~0x90000000 */
     memory_region_init_rom(bios, NULL, "loongson3.bios",
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index dac27fad9d..2e26b8a26d 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1044,7 +1044,7 @@ static void create_cpu_without_cps(MachineState *ms, MaltaState *s,
         qemu_register_reset(main_cpu_reset, cpu);
     }
 
-    cpu = MIPS_CPU(first_cpu);
+    cpu = MIPS_CPU(qemu_get_cpu(0, TYPE_MIPS_CPU));
     env = &cpu->env;
     *i8259_irq = env->irq[2];
     *cbus_irq = env->irq[4];
diff --git a/hw/misc/mips_cpc.c b/hw/misc/mips_cpc.c
index 4a94c87054..583081cdeb 100644
--- a/hw/misc/mips_cpc.c
+++ b/hw/misc/mips_cpc.c
@@ -44,7 +44,7 @@ static void mips_cpu_reset_async_work(CPUState *cs, run_on_cpu_data data)
 
 static void cpc_run_vp(MIPSCPCState *cpc, uint64_t vp_run)
 {
-    CPUState *cs = first_cpu;
+    CPUState *cs = qemu_get_cpu(0, TYPE_MIPS_CPU);
 
     CPU_FOREACH(cs) {
         uint64_t i = 1ULL << cs->cpu_index;
@@ -62,7 +62,7 @@ static void cpc_run_vp(MIPSCPCState *cpc, uint64_t vp_run)
 
 static void cpc_stop_vp(MIPSCPCState *cpc, uint64_t vp_stop)
 {
-    CPUState *cs = first_cpu;
+    CPUState *cs = qemu_get_cpu(0, TYPE_MIPS_CPU);
 
     CPU_FOREACH(cs) {
         uint64_t i = 1ULL << cs->cpu_index;
diff --git a/target/mips/tcg/sysemu/cp0_helper.c b/target/mips/tcg/sysemu/cp0_helper.c
index af0cd60829..bf934be58a 100644
--- a/target/mips/tcg/sysemu/cp0_helper.c
+++ b/target/mips/tcg/sysemu/cp0_helper.c
@@ -1633,7 +1633,7 @@ target_ulong helper_emt(void)
 
 target_ulong helper_dvpe(CPUMIPSState *env)
 {
-    CPUState *other_cs = first_cpu;
+    CPUState *other_cs = qemu_get_cpu(0, TYPE_MIPS_CPU);
     target_ulong prev = env->mvp->CP0_MVPControl;
 
     CPU_FOREACH(other_cs) {
@@ -1649,7 +1649,7 @@ target_ulong helper_dvpe(CPUMIPSState *env)
 
 target_ulong helper_evpe(CPUMIPSState *env)
 {
-    CPUState *other_cs = first_cpu;
+    CPUState *other_cs = qemu_get_cpu(0, TYPE_MIPS_CPU);
     target_ulong prev = env->mvp->CP0_MVPControl;
 
     CPU_FOREACH(other_cs) {
@@ -1669,7 +1669,7 @@ target_ulong helper_evpe(CPUMIPSState *env)
 /* R6 Multi-threading */
 target_ulong helper_dvp(CPUMIPSState *env)
 {
-    CPUState *other_cs = first_cpu;
+    CPUState *other_cs = qemu_get_cpu(0, TYPE_MIPS_CPU);
     target_ulong prev = env->CP0_VPControl;
 
     if (!((env->CP0_VPControl >> CP0VPCtl_DIS) & 1)) {
@@ -1687,7 +1687,7 @@ target_ulong helper_dvp(CPUMIPSState *env)
 
 target_ulong helper_evp(CPUMIPSState *env)
 {
-    CPUState *other_cs = first_cpu;
+    CPUState *other_cs = qemu_get_cpu(0, TYPE_MIPS_CPU);
     target_ulong prev = env->CP0_VPControl;
 
     if ((env->CP0_VPControl >> CP0VPCtl_DIS) & 1) {
diff --git a/target/mips/tcg/sysemu/tlb_helper.c b/target/mips/tcg/sysemu/tlb_helper.c
index 7dbc2e24c4..2d31c8e17f 100644
--- a/target/mips/tcg/sysemu/tlb_helper.c
+++ b/target/mips/tcg/sysemu/tlb_helper.c
@@ -344,7 +344,7 @@ void helper_ginvt(CPUMIPSState *env, target_ulong arg, uint32_t type)
     uint32_t invMsgVPN2 = arg & (TARGET_PAGE_MASK << 1);
     uint8_t invMsgR = 0;
     uint32_t invMsgMMid = env->CP0_MemoryMapID;
-    CPUState *other_cs = first_cpu;
+    CPUState *other_cs = qemu_get_cpu(0, TYPE_MIPS_CPU);
 
 #ifdef TARGET_MIPS64
     invMsgR = extract64(arg, 62, 2);
-- 
2.41.0
