Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1360199ejb;
        Fri, 20 Oct 2023 09:37:14 -0700 (PDT)
X-Received: by 2002:a17:907:9445:b0:9bd:d405:4e80 with SMTP id dl5-20020a170907944500b009bdd4054e80mr1697854ejc.46.1697819834824;
        Fri, 20 Oct 2023 09:37:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697819834; cv=none;
        d=google.com; s=arc-20160816;
        b=Knxrp/HMGH6hw0g8n9xWY7OmR6aTFadL5P/JlY3NuHzR7dDtHaLlWMpitknYqPf76J
         uHz3GBvXuUqpvTn9R4ElLVYEtvrYQGIVUYDj665c4KxL0NIosR5iw2KtL3eubJbGFPAU
         1NomViwtBSroXziTn06iVj6GtwLvwa3y55ZyCKQj/5aTS9K51h5lNDr6BiIEzQrTvgG0
         6xoJ1Owg8iCeGvBgB+wFKh7c/AR1d7qZaKk00bJBAAb73iaem7WvjXCPA9/mltBeBPJ4
         7HmS4+ak5C2YLWGgIXPaO1YsS/0Aw0YDXOUI5xVspdBqg0cU7YaHRbSWOBZ+FLRVYbrz
         5BNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xSJLVJB+BSGW/cgUeZYPxlitCJtzsUBSAokmrhtXDW0=;
        fh=KG7o60OuN84U9YayVlp04kMMLDqyx+iirUaH2Y+Q6eo=;
        b=iwkzbZ8agPC+dHRIqepM99N+By1tkSHQ5JR+F/+LfhsDaF8aD0YZrUz/Bhc0vpBrFK
         DMppxmYNW8QMA7v69RiWDavYlC1lbgHGhcSqiAycUGipo1TSP1BmNUrNzOU+mjWpeTWt
         d/U3Cgr1TOrMhtFnFVB0sdl2n0Ae7jXHumYf9M80Hq8riAKvtIsJsjMUieRTEC21eq8z
         uM+IbjvgwM6rGfREBB2v5Cjt8vulZLfG+HJkgGwYWTjOq6dJuZIPvaKAESQMao18wjcE
         m+/JNoq0oepYgRnOcEcuSV1TNQQGjLc1ut9UjBwzA8fJNIhfemLH+vlee0djUnKIwaRB
         ZItg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BeuIIAjc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jz26-20020a17090775fa00b009b2b42978adsor704180ejc.7.2023.10.20.09.37.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Oct 2023 09:37:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BeuIIAjc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697819834; x=1698424634; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSJLVJB+BSGW/cgUeZYPxlitCJtzsUBSAokmrhtXDW0=;
        b=BeuIIAjcrrZCwWBjAosLO8prrmr09aHhTBgHISGLAhrUky2pHM+37g/4v2ZfsAeHmu
         Ji9RQ+a36QTny/X7aDdDA/VZuYXdb4wWj2OjXFp4OLStH+fIUYFeruTn9me/eHqD8KRH
         Mq9XG7549FoCUWn2lBsIStnKt4ja699yjsJWyflx36dLD0jjVSy1Zx+a5KdLH2kF00sB
         8vV79/n4KRJlYuIh2ciovQ09/+wAF8I/CCoPy4FVuRlZecXjOvQpUDLn3yg8Zy9uLMfM
         Q+7Mu5uKAOdWLdzW4M2cHEselGakgW7KWJnXgvaDd2D1SLeee7mVRNxevfayle+HtfFY
         +5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697819834; x=1698424634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSJLVJB+BSGW/cgUeZYPxlitCJtzsUBSAokmrhtXDW0=;
        b=vjG57HT5QTNJfzk85Ohq/2U4GReyukbH5WcyCM3OuPUDdx6LLUMjHgH5Ruh5Pks/bm
         EkGhodn67uB5c+4YKlgF0x4jEPimKJzJXrHivSsENAW4Qmad4WOBqVdtbKV5IqSiXfU1
         F26uR9kx6o2nZ6nHl44FdS7kCKuEtL7VKXNH+qHmz98d7W96Dtj/I6DITbQpX0jQqOKs
         CFstuQVG2LtbDDQvOMpzuuu9Ka05u2UZplTmE2fR82doP1qTLlxhegXDYhIYY1kFw8Eu
         Tk/l8nu3YG14rmKQF+JqJJyUPY3KWmdST7t35l3RhVVc/g5xTxI/9A4rT7wWVTVhsffU
         pJRA==
X-Gm-Message-State: AOJu0YxdPG3vhkQyvcnbWHNQXB2HvHKDuCVRFQ7j7RSiIM3kuIl2Peu+
	l6KFcgNastGt71Zay/+cBmHOGAJp
X-Google-Smtp-Source: AGHT+IFwR4eeI0PcMji7bsSOyXqIPfeWK3QXSfkKqlegpEm8Ef2v2EFfCuR8JZGzeu/3ji8Uqg5M9Q==
X-Received: by 2002:a17:906:d555:b0:9bd:cd8b:6247 with SMTP id cr21-20020a170906d55500b009bdcd8b6247mr2128857ejc.38.1697819834495;
        Fri, 20 Oct 2023 09:37:14 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr. [176.171.212.97])
        by smtp.gmail.com with ESMTPSA id d24-20020a170906041800b0099cb1a2cab0sm1813134eja.28.2023.10.20.09.37.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Oct 2023 09:37:14 -0700 (PDT)
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
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 03/19] cpus: Filter for target specific CPU (arm)
Date: Fri, 20 Oct 2023 18:36:25 +0200
Message-ID: <20231020163643.86105-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HJ9wAxOjLj23

Enforce qemu_get_cpu() to return ARM CPUs in ARM specific files.

Mechanical change using the following coccinelle script:

  @@ expression index; @@
  -   qemu_get_cpu(index, NULL)
  +   qemu_get_cpu(index, TYPE_ARM_CPU)

and manually including "target/arm/cpu-qom.h" in
hw/intc/arm_gicv3_common.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/fsl-imx7.c          | 2 +-
 hw/arm/sbsa-ref.c          | 2 +-
 hw/arm/vexpress.c          | 2 +-
 hw/arm/virt.c              | 2 +-
 hw/cpu/a15mpcore.c         | 4 ++--
 hw/cpu/a9mpcore.c          | 2 +-
 hw/intc/arm_gicv3_common.c | 3 ++-
 7 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 1c1585f3e1..7a62e9f5cf 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -212,7 +212,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
 
     for (i = 0; i < smp_cpus; i++) {
         SysBusDevice *sbd = SYS_BUS_DEVICE(&s->a7mpcore);
-        DeviceState  *d   = DEVICE(qemu_get_cpu(i, NULL));
+        DeviceState  *d   = DEVICE(qemu_get_cpu(i, TYPE_ARM_CPU));
 
         irq = qdev_get_gpio_in(d, ARM_CPU_IRQ);
         sysbus_connect_irq(sbd, i, irq);
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index f6f64099c3..a85004809f 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -478,7 +478,7 @@ static void create_gic(SBSAMachineState *sms, MemoryRegion *mem)
      * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the CPU's inputs.
      */
     for (i = 0; i < smp_cpus; i++) {
-        DeviceState *cpudev = DEVICE(qemu_get_cpu(i, NULL));
+        DeviceState *cpudev = DEVICE(qemu_get_cpu(i, TYPE_ARM_CPU));
         int ppibase = NUM_IRQS + i * GIC_INTERNAL + GIC_NR_SGIS;
         int irq;
         /*
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 0590332fe5..e20d865d5a 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -257,7 +257,7 @@ static void init_cpus(MachineState *ms, const char *cpu_type,
 
     /* Connect the CPUs to the GIC */
     for (n = 0; n < smp_cpus; n++) {
-        DeviceState *cpudev = DEVICE(qemu_get_cpu(n, NULL));
+        DeviceState *cpudev = DEVICE(qemu_get_cpu(n, TYPE_ARM_CPU));
 
         sysbus_connect_irq(busdev, n, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
         sysbus_connect_irq(busdev, n + smp_cpus,
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index be31ef5718..da5b738f0a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -799,7 +799,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
      * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the CPU's inputs.
      */
     for (i = 0; i < smp_cpus; i++) {
-        DeviceState *cpudev = DEVICE(qemu_get_cpu(i, NULL));
+        DeviceState *cpudev = DEVICE(qemu_get_cpu(i, TYPE_ARM_CPU));
         int ppibase = NUM_IRQS + i * GIC_INTERNAL + GIC_NR_SGIS;
         /* Mapping from the output timer irq lines from the CPU to the
          * GIC PPI inputs we use for the virt board.
diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
index 8c9098d5d3..7ec5b27207 100644
--- a/hw/cpu/a15mpcore.c
+++ b/hw/cpu/a15mpcore.c
@@ -65,7 +65,7 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
         /* Make the GIC's TZ support match the CPUs. We assume that
          * either all the CPUs have TZ, or none do.
          */
-        cpuobj = OBJECT(qemu_get_cpu(0, NULL));
+        cpuobj = OBJECT(qemu_get_cpu(0, TYPE_ARM_CPU));
         has_el3 = object_property_find(cpuobj, "has_el3") &&
             object_property_get_bool(cpuobj, "has_el3", &error_abort);
         qdev_prop_set_bit(gicdev, "has-security-extensions", has_el3);
@@ -90,7 +90,7 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
      * appropriate GIC PPI inputs
      */
     for (i = 0; i < s->num_cpu; i++) {
-        DeviceState *cpudev = DEVICE(qemu_get_cpu(i, NULL));
+        DeviceState *cpudev = DEVICE(qemu_get_cpu(i, TYPE_ARM_CPU));
         int ppibase = s->num_irq - 32 + i * 32;
         int irq;
         /* Mapping from the output timer irq lines from the CPU to the
diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
index 62b7fb3836..a9919ac78a 100644
--- a/hw/cpu/a9mpcore.c
+++ b/hw/cpu/a9mpcore.c
@@ -56,7 +56,7 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
     CPUState *cpu0;
     Object *cpuobj;
 
-    cpu0 = qemu_get_cpu(0, NULL);
+    cpu0 = qemu_get_cpu(0, TYPE_ARM_CPU);
     cpuobj = OBJECT(cpu0);
     if (strcmp(object_get_typename(cpuobj), ARM_CPU_TYPE_NAME("cortex-a9"))) {
         /* We might allow Cortex-A5 once we model it */
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index cdf21dfc11..e7ad5aa202 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -31,6 +31,7 @@
 #include "migration/vmstate.h"
 #include "gicv3_internal.h"
 #include "hw/arm/linux-boot-if.h"
+#include "target/arm/cpu-qom.h"
 #include "sysemu/kvm.h"
 
 
@@ -392,7 +393,7 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
     s->cpu = g_new0(GICv3CPUState, s->num_cpu);
 
     for (i = 0; i < s->num_cpu; i++) {
-        CPUState *cpu = qemu_get_cpu(i, NULL);
+        CPUState *cpu = qemu_get_cpu(i, TYPE_ARM_CPU);
         uint64_t cpu_affid;
 
         s->cpu[i].cpu = cpu;
-- 
2.41.0
