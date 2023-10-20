Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1360997ejb;
        Fri, 20 Oct 2023 09:38:13 -0700 (PDT)
X-Received: by 2002:a17:907:d19:b0:9bf:2f84:5de7 with SMTP id gn25-20020a1709070d1900b009bf2f845de7mr1639223ejc.4.1697819893651;
        Fri, 20 Oct 2023 09:38:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697819893; cv=none;
        d=google.com; s=arc-20160816;
        b=C4rjNawzbz1+8AH4W6TFkPc+m+oHCsxs7pprxhNAXDCnG0m3b48y6dmP5DGqDvIwpD
         3pmgsynQSzIc2IITz+/YoDMD9In2DClzakQQI9hsYVmay5kiBmdCCc7Pn0QCzjlNpS5B
         SM2ma4BKQrJIYgXJ3eHFxpy67JGS/ktxoheAV8KijYAv/x91ewnIjA+wlMGe0flEZwMW
         X1KgtUJ3ovyjOx2R7l4Z3Z4YyOCY8kdd5thz70YDhKcv+AYJk7NZ6tCAFneHdBB7DDtn
         IK08T2Vc+QbrrRc1SlF0GLD/6AaA3Qt0lY39s8SKA+2pq8heYDg6ecY4DTHJVcfIUp51
         lT5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=sWVSb4kJOx4Py9xCdpLQSCowqDiVUo6mKEdRlRPdC3M=;
        fh=DKFqlS81ToskO1Fhddh+qidiVb6DHRO0FpOqZOCvJlw=;
        b=jd4OrI5SZjHqqTgi+PjNnPdW/UK+DbowIDoYAkAU+c6Xq73gyxuWhDVVNYdQwWfsyo
         Yw5HyRpZFdIkazOboeGaKcWlhDCVPNUgZF6KbdJj4kQ7/ISprsq4PTrtruswHE2q7ama
         jdRuEdTKJtVwmyIVb+nJ+GttdZ5BfwalI8BlDGMhzxZ2kikB6vLuEr+2jvJA1Lqgb44/
         YqBlNYPxdQGf/4grlVAKVM0NSi2amA5HRyzq/tqmRIK2JyjF+CDFCQMWbXE9dVT5hucz
         LMcA3oAhCufFxdcO/mOf0H9U1ozjq3SXab/iRyTDmM8Q8ca6iAyTv/m3xs2lsJv4XSrU
         x1IQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HBIqM7Gc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id mm22-20020a170906cc5600b009b2cd1d2a18sor718414ejb.10.2023.10.20.09.38.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Oct 2023 09:38:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HBIqM7Gc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697819893; x=1698424693; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWVSb4kJOx4Py9xCdpLQSCowqDiVUo6mKEdRlRPdC3M=;
        b=HBIqM7GcpWRUBHWOl/VG6Yc5myTZ+JWHJDWnJ56c9uh+QYCjIeK1oeL0k4/Ouyy2On
         bKvHYWzO/ER6Oi8ZMsCLC1kcAGALRUStMcAKEHBVcTfNZNf9HXBQr4Pg4W9G2kldpHcK
         8421etkFzfHhLge6ZmuWzwZ7rWOD1NB1Rq2hPWFm1Gg068LPE06/tABPk+h+2nhnHizM
         c0m2ytX7cD8qc3f+sRZIu0iHqWXsZQYGJYjuuguYLsVeofL0jdjqHTz9YKj2CTjcPqB1
         c7XpZAyIo2VF0aXo2Sh5EOAA409SKFWk5JM9H47RFl8NrvPil0cjQeBMIUgkPlMiUeb7
         PkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697819893; x=1698424693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWVSb4kJOx4Py9xCdpLQSCowqDiVUo6mKEdRlRPdC3M=;
        b=Zn+I2wMPAkeAB8p2ffUanao1QKE0xirC4bDW0MKE9pPNZo8O+XiUWhY+zVsQxb6sSv
         wvoblynrdmYgdum5NxjaNZczrcCwPyHoDX3g7yDKLFYn7x6R45XNAs3VJAJ8TIMomVEm
         w3Ne7uMzFfG1I+Gqh5w/x7jzcuaVks/5TZ0axwcokb1za25zkexHLXW35UZOhoWVh+Vt
         5zsoXfp3RZMpuPMq7Dbp30Tix6UciDYWMSo/WBgBZIqWM4acCFiU4S382w3M45nvI/KP
         +2K3adcYX5pDKR8v5KrDUGPdeogg4gZQeYZj0HCiHJB+UeVb6LRbOBM96XYorTWBz+o/
         EpGg==
X-Gm-Message-State: AOJu0YznY47SNgKxAyb1aGpSsQ4NMiASj9hSv+8/uaeFEwdXOkt/eQCX
	XsHoErbpcR0L7XSTHf50e00Z3UP0
X-Google-Smtp-Source: AGHT+IEMqrtne6Pvcq15oEXxD3gxQ67/Vyyv98aCsGT08pg/OfAYRxDc6BbyAqJ31WIn3cQ2nejFNA==
X-Received: by 2002:a17:907:948e:b0:9bf:9c58:e91e with SMTP id dm14-20020a170907948e00b009bf9c58e91emr1600709ejc.56.1697819892970;
        Fri, 20 Oct 2023 09:38:12 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr. [176.171.212.97])
        by smtp.gmail.com with ESMTPSA id w21-20020a170907271500b009ad81554c1bsm1780965ejk.55.2023.10.20.09.38.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Oct 2023 09:38:12 -0700 (PDT)
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
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [PATCH 11/19] cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_POWERPC_CPU)
Date: Fri, 20 Oct 2023 18:36:33 +0200
Message-ID: <20231020163643.86105-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: o0TNNUDLUTX0

Mechanical change using the following coccinelle script:

  @@ @@
  -   first_cpu
  +   qemu_get_cpu(0, TYPE_POWERPC_CPU)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/e500.c          |  2 +-
 hw/ppc/ppc.c           |  4 ++--
 hw/ppc/prep_systemio.c |  2 +-
 hw/ppc/spapr.c         | 11 ++++++-----
 hw/ppc/spapr_caps.c    | 10 +++++-----
 hw/ppc/spapr_rtas.c    |  2 +-
 hw/ppc/spapr_vof.c     |  2 +-
 hw/ppc/vof.c           |  3 ++-
 target/ppc/arch_dump.c |  4 ++--
 9 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index c4bf3fef32..02d14404d9 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -373,7 +373,7 @@ static int ppce500_load_device_tree(PPCE500MachineState *pms,
     MachineState *machine = MACHINE(pms);
     unsigned int smp_cpus = machine->smp.cpus;
     const PPCE500MachineClass *pmc = PPCE500_MACHINE_GET_CLASS(pms);
-    CPUPPCState *env = cpu_env(first_cpu);
+    CPUPPCState *env = cpu_env(qemu_get_cpu(0, TYPE_POWERPC_CPU));
     int ret = -1;
     uint64_t mem_reg_property[] = { 0, cpu_to_be64(machine->ram_size) };
     int fdt_size;
diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index be167710a3..be0b1536f5 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -970,7 +970,7 @@ void cpu_ppc_store_purr(CPUPPCState *env, uint64_t value)
 static void timebase_save(PPCTimebase *tb)
 {
     uint64_t ticks = cpu_get_host_ticks();
-    PowerPCCPU *first_ppc_cpu = POWERPC_CPU(first_cpu);
+    PowerPCCPU *first_ppc_cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
 
     if (!first_ppc_cpu->env.tb_env) {
         error_report("No timebase object");
@@ -998,7 +998,7 @@ static void timebase_save(PPCTimebase *tb)
 static void timebase_load(PPCTimebase *tb)
 {
     CPUState *cpu;
-    PowerPCCPU *first_ppc_cpu = POWERPC_CPU(first_cpu);
+    PowerPCCPU *first_ppc_cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
     int64_t tb_off_adj, tb_off;
     unsigned long freq;
 
diff --git a/hw/ppc/prep_systemio.c b/hw/ppc/prep_systemio.c
index c96cefb13d..0431cde91c 100644
--- a/hw/ppc/prep_systemio.c
+++ b/hw/ppc/prep_systemio.c
@@ -261,7 +261,7 @@ static void prep_systemio_realize(DeviceState *dev, Error **errp)
     s->iomap_type = PORT0850_IOMAP_NONCONTIGUOUS;
     qemu_set_irq(s->non_contiguous_io_map_irq,
                  s->iomap_type & PORT0850_IOMAP_NONCONTIGUOUS);
-    cpu = POWERPC_CPU(first_cpu);
+    cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
     s->softreset_irq = qdev_get_gpio_in(DEVICE(cpu), PPC6xx_INPUT_HRESET);
 
     isa_register_portio_list(isa, &s->portio, 0x0, ppc_io800_port_list, s,
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index cb840676d3..a5006eaa5e 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -981,7 +981,7 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
 static void spapr_dt_ov5_platform_support(SpaprMachineState *spapr, void *fdt,
                                           int chosen)
 {
-    PowerPCCPU *first_ppc_cpu = POWERPC_CPU(first_cpu);
+    PowerPCCPU *first_ppc_cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
 
     char val[2 * 4] = {
         23, 0x00, /* XICS / XIVE mode */
@@ -1125,7 +1125,7 @@ static void spapr_dt_hypervisor(SpaprMachineState *spapr, void *fdt)
          * Older KVM versions with older guest kernels were broken
          * with the magic page, don't allow the guest to map it.
          */
-        if (!kvmppc_get_hypercall(cpu_env(first_cpu), hypercall,
+        if (!kvmppc_get_hypercall(cpu_env(qemu_get_cpu(0, TYPE_POWERPC_CPU)), hypercall,
                                   sizeof(hypercall))) {
             _FDT(fdt_setprop(fdt, hypervisor, "hcall-instructions",
                              hypercall, sizeof(hypercall)));
@@ -1669,7 +1669,7 @@ static void spapr_machine_reset(MachineState *machine, ShutdownCause reason)
     pef_kvm_reset(machine->cgs, &error_fatal);
     spapr_caps_apply(spapr);
 
-    first_ppc_cpu = POWERPC_CPU(first_cpu);
+    first_ppc_cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
     if (kvm_enabled() && kvmppc_has_cap_mmu_radix() &&
         ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LOGICAL_3_00, 0,
                               spapr->max_compat_pvr)) {
@@ -1845,7 +1845,7 @@ static int spapr_post_load(void *opaque, int version_id)
     }
 
     if (kvm_enabled() && spapr->patb_entry) {
-        PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
+        PowerPCCPU *cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
         bool radix = !!(spapr->patb_entry & PATE1_GR);
         bool gtse = !!(cpu->env.spr[SPR_LPCR] & LPCR_GTSE);
 
@@ -4014,7 +4014,8 @@ static void spapr_core_plug(HotplugHandler *hotplug_dev, DeviceState *dev)
      */
     if (hotplugged) {
         for (i = 0; i < cc->nr_threads; i++) {
-            ppc_set_compat(core->threads[i], POWERPC_CPU(first_cpu)->compat_pvr,
+            ppc_set_compat(core->threads[i],
+                           POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU))->compat_pvr,
                            &error_abort);
         }
     }
diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index 5a0755d34f..0c1f00d869 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -194,7 +194,7 @@ static void cap_htm_apply(SpaprMachineState *spapr, uint8_t val, Error **errp)
 static void cap_vsx_apply(SpaprMachineState *spapr, uint8_t val, Error **errp)
 {
     ERRP_GUARD();
-    PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
+    PowerPCCPU *cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
     CPUPPCState *env = &cpu->env;
 
     if (!val) {
@@ -213,7 +213,7 @@ static void cap_vsx_apply(SpaprMachineState *spapr, uint8_t val, Error **errp)
 static void cap_dfp_apply(SpaprMachineState *spapr, uint8_t val, Error **errp)
 {
     ERRP_GUARD();
-    PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
+    PowerPCCPU *cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
     CPUPPCState *env = &cpu->env;
 
     if (!val) {
@@ -440,7 +440,7 @@ static void cap_nested_kvm_hv_apply(SpaprMachineState *spapr,
                                     uint8_t val, Error **errp)
 {
     ERRP_GUARD();
-    PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
+    PowerPCCPU *cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
     CPUPPCState *env = &cpu->env;
 
     if (!val) {
@@ -494,7 +494,7 @@ static void cap_large_decr_apply(SpaprMachineState *spapr,
                                  uint8_t val, Error **errp)
 {
     ERRP_GUARD();
-    PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
+    PowerPCCPU *cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
 
     if (!val) {
@@ -632,7 +632,7 @@ static void cap_ail_mode_3_apply(SpaprMachineState *spapr,
                                      uint8_t val, Error **errp)
 {
     ERRP_GUARD();
-    PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
+    PowerPCCPU *cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
 
     if (!val) {
diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 7df21581c2..3d4e93a188 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -539,7 +539,7 @@ uint64_t qtest_rtas_call(char *cmd, uint32_t nargs, uint64_t args,
     for (token = 0; token < RTAS_TOKEN_MAX - RTAS_TOKEN_BASE; token++) {
         if (strcmp(cmd, rtas_table[token].name) == 0) {
             SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
-            PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
+            PowerPCCPU *cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
 
             rtas_table[token].fn(cpu, spapr, token + RTAS_TOKEN_BASE,
                                  nargs, args, nret, rets);
diff --git a/hw/ppc/spapr_vof.c b/hw/ppc/spapr_vof.c
index 09f29be0b9..301b3cd433 100644
--- a/hw/ppc/spapr_vof.c
+++ b/hw/ppc/spapr_vof.c
@@ -58,7 +58,7 @@ void spapr_vof_reset(SpaprMachineState *spapr, void *fdt, Error **errp)
 {
     target_ulong stack_ptr;
     Vof *vof = spapr->vof;
-    PowerPCCPU *first_ppc_cpu = POWERPC_CPU(first_cpu);
+    PowerPCCPU *first_ppc_cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
 
     vof_init(vof, spapr->rma_size, errp);
 
diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
index e3b430a81f..9fa1cd9e19 100644
--- a/hw/ppc/vof.c
+++ b/hw/ppc/vof.c
@@ -797,7 +797,8 @@ static uint32_t vof_call_method(MachineState *ms, Vof *vof, uint32_t methodaddr,
                 VofMachineIfClass *vmc = VOF_MACHINE_GET_CLASS(vmo);
 
                 g_assert(vmc->client_architecture_support);
-                ret = (uint32_t)vmc->client_architecture_support(ms, first_cpu,
+                ret = (uint32_t)vmc->client_architecture_support(ms,
+                                                                 qemu_get_cpu(0, TYPE_POWERPC_CPU),
                                                                  param1);
             }
 
diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
index a8315659d9..be2a78d01f 100644
--- a/target/ppc/arch_dump.c
+++ b/target/ppc/arch_dump.c
@@ -228,11 +228,11 @@ int cpu_get_dump_info(ArchDumpInfo *info,
 {
     PowerPCCPU *cpu;
 
-    if (first_cpu == NULL) {
+    if (qemu_get_cpu(0, TYPE_POWERPC_CPU) == NULL) {
         return -1;
     }
 
-    cpu = POWERPC_CPU(first_cpu);
+    cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
 
     info->d_machine = PPC_ELF_MACHINE;
     info->d_class = ELFCLASS;
-- 
2.41.0
