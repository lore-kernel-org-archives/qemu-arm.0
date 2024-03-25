Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp597687ejj;
        Mon, 25 Mar 2024 03:15:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/tRXqpl4U9Xg/0GwzvRps3PScW9RX5trBXyHasBqngwqttpj7EH5KLNzFrbrc+8SecOXH2af2z1klRe1dPKnNOQp8ULKN
X-Received: by 2002:a05:600c:46ca:b0:414:86a6:f9ff with SMTP id q10-20020a05600c46ca00b0041486a6f9ffmr2875616wmo.4.1711361731126;
        Mon, 25 Mar 2024 03:15:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711361731; cv=none;
        d=google.com; s=arc-20160816;
        b=OKB3HdhL+mDL3wbENtDe8UnQsPbCw/5phispRgXAHHEUmM0V/AzJgjgudkAzzzKYFg
         v2OB0PwKF3VViRv3KgnHybWGUuphin/VuGcLgfhLse3VDebJrRmhJLlDla/bkyR2I/ni
         2vuSGnpiKI1Uy5rcL1fMGK+HDUU0EXEIRHzXdz2Pkz0bzL92auRITZmEe5WU6nlm9FgH
         W2qxP/8hERYa29LlJYpOqe6E2g29xKG6ds3DXHJ//6yUpOsr3N8MLwIcNvoU8+coXyyW
         ZXOdawbZTgUHMiMu/FvQzxAsYPARZYD2pbVVlcSDMuf0G1KBjuu48f+YTwDF73aC8o+x
         eijQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=fE8ZJCzy4GplxPwcR6hJO6pmto5bdl5CvCNCWCk7f9Y=;
        fh=yQKIEcF9IUtN611t6gfpIQ6+HVvxkkHdjHFfC746G70=;
        b=qlgXqG5lZlGyQ9X5HLyZxgdkSQm3QoWZLcvlad6HDgz6eJtlu1hLEfTgkoHT4b6GFL
         CjqUWYRDeSz2C3X2kTW41g+1cT+wAWRK2orCyKSw65jyerVsNjvbXwh/isIMIPVEvKgw
         lA6Gmdu/nxaoojVJJUQawgKV+OThRskMTXEvk65TPkoCM352yg7EiUWxyHxtvOpivNiA
         pTtiMlXaDLicGiHKpUbYVG9vvtHTxkmQ5hK4ehJlENeG+CSONv4WmWna4laPoG787znr
         3d+hm4Te0PYEtl2ICjjpNLhszCme2wkXKucvh/zb/Mi2yt8KWoNcQJLvETneZtdLP4/k
         gKGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=OOGNa7n7;
       spf=pass (google.com: domain of 3wk4bzggkc5snhjno5a5bjjbg9.7jh5g9s.69ii99gdi5mj.jmb@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3wk4BZggKC5sNHJNO5A5BJJBG9.7JH5G9S.69II99GDI5MJ.JMB@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3wk4BZggKC5sNHJNO5A5BJJBG9.7JH5G9S.69II99GDI5MJ.JMB@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id l21-20020adfa395000000b0033ec23a4c28sor1858689wrb.10.2024.03.25.03.15.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Mar 2024 03:15:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3wk4bzggkc5snhjno5a5bjjbg9.7jh5g9s.69ii99gdi5mj.jmb@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=OOGNa7n7;
       spf=pass (google.com: domain of 3wk4bzggkc5snhjno5a5bjjbg9.7jh5g9s.69ii99gdi5mj.jmb@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3wk4BZggKC5sNHJNO5A5BJJBG9.7JH5G9S.69II99GDI5MJ.JMB@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711361730; x=1711966530; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fE8ZJCzy4GplxPwcR6hJO6pmto5bdl5CvCNCWCk7f9Y=;
        b=OOGNa7n7HmSG7d1NIsLXBS1chvap4SKCO6TywwryVf1bt4nVTwjqWgtBdNI9SnrV9V
         fzTaN9/ElXkRVFTPLQxE4Ca0HyITAzgvfljGGCf48eLlvTRL+m9ATeEhdnd6/m5QIhic
         Wxq2u3t4UxHo767JidAGVwKHrJe0DRYyW0Ib/XGDfsnYVPD3MkJdF6S9CJ2quLEJiiw6
         TlWpUeRbzkKLhis4HQYk+ndj7h3K9V2263BcAC0+CPmQQOx3PolbrCkGLrxG8wns0jdt
         nQKmrC8JpVUpj3cWFyuUEPbjgN/g9WTCpFPomLXFYtQnkwnekAHfjm+Qg1yLW/C9G6l9
         aZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711361730; x=1711966530;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fE8ZJCzy4GplxPwcR6hJO6pmto5bdl5CvCNCWCk7f9Y=;
        b=su+JkfhopiBnNGdgtNoXLPvNA1W8bhn2HDtEGXR4RgGWC/M9bGLOcaT02M8ueMu37p
         aKgx+Dlrap6r0EYTF7EA1Q3DHEE+JfLqmaMA/EDHsf/RyzU3OuZfgawNnRaQgiyKPkqG
         07kNjqP9QvaFs0zbYKUXjc0tTXdYiZXLBEoM4Jlw85Sw91SWqQvXQNbJUUk5+PP9b3gW
         Ik+O1jsy39myZ03B5zYN8MMICR/d042iOjo+Ocy94MPv2+rxEIH6OskZn98a9E2TgIQC
         ejUYBGgahIu2ljY7jie9cvo3oIPV2cO8Ed5DiPfbNBwhoJsvyYTYZwPOlALR22eW+QUy
         hV1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRHcu7tcb27x1vXomcn50LIQbiWP/vreNbYkXuyrD9raDm1481Y5eTQwO3YDBwZvFiLgGs6sEI6yxYKnz+T3jadCqCYaeg
X-Gm-Message-State: AOJu0YyhsLH5o+3qPxKm++iNXITIQQhjXrCXeRUgKS/RgVqroEJ13FVz
	kgrA8bCLP/75+OzuXwdfVqZe4z0cUplm9UtESSIX2GChS+SNefcFNsmqtxOVvQow6PSqnYHFEZE
	i3Rbk92AyfQ==
X-Google-Smtp-Source: AGHT+IFWK4VglR7yHn2s4Kh3H2ibwXZ5T+0ZQGFNsc+JQtSH3/q0iIZzDQFsGYmyPYdzaxETkEIAV/Z6AL1kTA==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6000:cf:b0:33e:c2c5:6d78 with SMTP id
 q15-20020a05600000cf00b0033ec2c56d78mr15791wrx.5.1711361730758; Mon, 25 Mar
 2024 03:15:30 -0700 (PDT)
Date: Mon, 25 Mar 2024 10:14:08 +0000
In-Reply-To: <20240325101442.1306300-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240325101442.1306300-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Message-ID: <20240325101442.1306300-13-smostafa@google.com>
Subject: [RFC PATCH 12/12] hw/arm/virt: Set SMMU OAS based on CPU PARANGE
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 6R0GjfpFIbpv

Use the new SMMU property to make the SMMU OAS match the CPU PARANGE.
That's according to SMMU manual ARM IHI 0070F.b:
    6.3.6 SMMU_IDR5, OAS must match the system physical address size.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/virt.c      | 14 ++++++++++++--
 target/arm/cpu.h   |  2 ++
 target/arm/cpu64.c |  5 +++++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0af1943697..599c0f752b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -235,6 +235,13 @@ static bool ns_el2_virt_timer_present(void)
         arm_feature(env, ARM_FEATURE_EL2) && cpu_isar_feature(aa64_vh, cpu);
 }
 
+/* We rely on CPU to define system OAS. */
+static int32_t get_system_oas(void)
+{
+    ARMCPU *cpu = ARM_CPU(qemu_get_cpu(0));
+    return cpu_arm_get_oas(cpu);
+}
+
 static void create_fdt(VirtMachineState *vms)
 {
     MachineState *ms = MACHINE(vms);
@@ -1340,7 +1347,7 @@ static void create_pcie_irq_map(const MachineState *ms,
 }
 
 static void create_smmu(const VirtMachineState *vms,
-                        PCIBus *bus)
+                        PCIBus *bus, int32_t oas)
 {
     char *node;
     const char compat[] = "arm,smmu-v3";
@@ -1360,6 +1367,9 @@ static void create_smmu(const VirtMachineState *vms,
 
     object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
                              &error_abort);
+
+    qdev_prop_set_uint64(dev, "oas", oas);
+
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
     for (i = 0; i < NUM_SMMU_IRQS; i++) {
@@ -1534,7 +1544,7 @@ static void create_pcie(VirtMachineState *vms)
 
         switch (vms->iommu) {
         case VIRT_IOMMU_SMMUV3:
-            create_smmu(vms, vms->bus);
+            create_smmu(vms, vms->bus, get_system_oas());
             qemu_fdt_setprop_cells(ms->fdt, nodename, "iommu-map",
                                    0x0, vms->iommu_phandle, 0x0, 0x10000);
             break;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a5b3d8f7da..14ef1a9d37 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3408,4 +3408,6 @@ static inline target_ulong cpu_untagged_addr(CPUState *cs, target_ulong x)
 }
 #endif
 
+int32_t cpu_arm_get_oas(ARMCPU *cpu);
+
 #endif
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 985b1efe16..08da83c082 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -787,6 +787,11 @@ static const gchar *aarch64_gdb_arch_name(CPUState *cs)
     return "aarch64";
 }
 
+int32_t cpu_arm_get_oas(ARMCPU *cpu)
+{
+    return FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
+}
+
 static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
 {
     CPUClass *cc = CPU_CLASS(oc);
-- 
2.44.0.396.g6e790dbe36-goog
