Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A60CCF9F8
	for <qemu-arm@archiver.kernel.org>; Sat,  1 Nov 2025 12:03:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFAJU-0000vA-AD; Sat, 01 Nov 2025 08:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vFAJK-0000tX-EY
 for qemu-arm@nongnu.org; Sat, 01 Nov 2025 08:02:23 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vFAJC-000513-6O
 for qemu-arm@nongnu.org; Sat, 01 Nov 2025 08:02:22 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4771b03267bso20584965e9.0
 for <qemu-arm@nongnu.org>; Sat, 01 Nov 2025 05:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761998532; x=1762603332; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RxjBBbo0CplmIm6482HdTp5yYHVqehJsD3pVEmh1LjI=;
 b=CH+WyLaOuOQtFR4s7f6UdHmOdZ2rqeTJhHc3/v22X6uLeQJx7iUh7v6yfw7GFS8ECa
 P3uLQOQ8wd8G7hSOaopxzo0bVt/61B15Sgc0+3IUcy7WSFY7trE7K1NLiIjFOw0qE/UT
 +UQWKD3GX9Z4j74Jmeo+M9vU66my3LaV6EF+I6Cs4yiW56KQxSuEzMH616nyJ6vouljO
 7pgnLLZ28XSyzfwrg6eo4KiAnwmy2awe88hSuD+g9a36cbGhjzmLlb8FMi4algAEPEii
 dLgFjWEVC+7jWaMxGthDOutUsRzlW7NVUMvj2McXzGzCfeyw/DLQyOxyQggcbqf7HGWV
 lB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761998532; x=1762603332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RxjBBbo0CplmIm6482HdTp5yYHVqehJsD3pVEmh1LjI=;
 b=s71EG8GCqmhlxj5ye2aUWeit8aeKAbawXD4pfocC2rmIia7x2fVbIWwBfF6EHCdRa5
 f3qIh/0EtInTfnbt9HDd3hCCHp2canN9cbDFMuSPThjwz0zHUQBG28vW/r4G+DEW2OyJ
 MB2zg7H2PI9Wtn/NeiZubIP4uqmaGdZeTzeobCgfxKLJEt+v5OOJ57AEnxShrkrGhwXD
 K9ekIgbFcYzrUJXEvsQLrcU8rX6GMdzgOJAzRhmhWOcQwwVxSlQthumt/AQmM3MYmstP
 9KOIb1xUfQapsASN9Ec7dUF3Qa4KFMBnMXOtjRFlFavExTkl/pj38+bYHtNXnblS6h6S
 g9RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnRAZS99KrIkrE9dz6g8yx1Kw+dN+fInVqiNwJfmJlOdlRWR+A/VeEKAwMcBkT6WUBRsHEomNtmQ==@nongnu.org
X-Gm-Message-State: AOJu0YxFPEykcXheTZOh/GYuFJJqKpos0krHjAOtFENn5RdR6VzItvsH
 SGFOZIZWfaCF99S2nqUm3zmt0f1P+yLnEzYLJh0tnGvZ4c7IlqbE0VVR
X-Gm-Gg: ASbGncuall0IIXfAqYlR52xaFcHGI/MympTGWG1bqNqWBehFQFKkkuze1GX61QYOSoI
 P63F4B7uglkH4rzKT1zqGg2jtJlQeq8HRcYaeSjHEYL245P1jt4R6+FSxNtMAWZbPJCQXzLdLJR
 w3rZZBklFTImFnHepjxb6mlfPNORED4oeits3v3ytqPgvMMkd2JeSufcybX7In63LahUjS9pqUv
 gTC9DtwHOsIHLa1Zdoyo8KQevH4XClkMxfO7aFz4/SdkApj8535s86Oz6os2EeFcZOJwl+1K8fA
 NxbNxFJips/XUpBG0Qtu3axGSAnOUsBboL8Z6otSLPth80B8RbvmsugMHJMd7gEizNpScOGmiCG
 Rm/EzQGfAyBBI+ta3Arznx4LKTmWs89085UxrekfcnugIHRHzH+TSEeS3htCMRpiCtorZg2XjSX
 kLBojLTcDL79wMwUridoqHtmBN2VFIC3MOElCY/y13qGK22WdG9b8EPQ==
X-Google-Smtp-Source: AGHT+IFJLKJpnEGjv0zP/9TjK6mvdFv/nhF0EHJjYe18e6Vf72zV6W2gzoo9bXexsEn5uiMaGPxFag==
X-Received: by 2002:a05:600c:138f:b0:45d:d8d6:7fcc with SMTP id
 5b1f17b1804b1-4773632cf5amr40605615e9.27.1761998531573; 
 Sat, 01 Nov 2025 05:02:11 -0700 (PDT)
Received: from archlinux (pd95edc07.dip0.t-ipconnect.de. [217.94.220.7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772ff83182sm40734215e9.4.2025.11.01.05.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Nov 2025 05:02:10 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 1/2] hw/arm/imx8mp-evk: Add KVM support
Date: Sat,  1 Nov 2025 13:01:29 +0100
Message-ID: <20251101120130.236721-2-shentey@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251101120130.236721-1-shentey@gmail.com>
References: <20251101120130.236721-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Allows the imx8mp-evk machine to run guests with KVM acceleration.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 docs/system/arm/imx8mp-evk.rst | 19 +++++++++++++++++++
 hw/arm/fsl-imx8mp.c            | 34 +++++++++++++++++++++++++++++-----
 hw/arm/imx8mp-evk.c            | 11 +++++++++++
 hw/arm/Kconfig                 |  3 ++-
 4 files changed, 61 insertions(+), 6 deletions(-)

diff --git a/docs/system/arm/imx8mp-evk.rst b/docs/system/arm/imx8mp-evk.rst
index b2f7d29ade..75c8fbd366 100644
--- a/docs/system/arm/imx8mp-evk.rst
+++ b/docs/system/arm/imx8mp-evk.rst
@@ -60,3 +60,22 @@ Now that everything is prepared the machine can be started as follows:
       -dtb imx8mp-evk.dtb \
       -append "root=/dev/mmcblk2p2" \
       -drive file=sdcard.img,if=sd,bus=2,format=raw,id=mmcblk2
+
+
+KVM Acceleration
+----------------
+
+To enable hardware-assisted acceleration via KVM, append
+``-accel kvm -cpu host`` to the command line. While this speeds up performance
+significantly, be aware of the following limitations:
+
+* The ``imx8mp-evk`` machine is not included under the "virtualization use case"
+  of :doc:`QEMU's security policy </system/security>`. This means that you
+  should not trust that it can contain malicious guests, whether it is run
+  using TCG or KVM. If you don't trust your guests and you're relying on QEMU to
+  be the security boundary, you want to choose another machine such as ``virt``.
+* Rather than Cortex-A53 CPUs, the same CPU type as the host's will be used.
+  This is a limitation of KVM and may not work with guests with a tight
+  dependency on Cortex-A53.
+* No EL2 and EL3 exception levels are available which is also a KVM limitation.
+  Direct kernel boot should work but running U-Boot, TF-A, etc. won't succeed.
diff --git a/hw/arm/fsl-imx8mp.c b/hw/arm/fsl-imx8mp.c
index 866f4d1d74..ee6f3e42d2 100644
--- a/hw/arm/fsl-imx8mp.c
+++ b/hw/arm/fsl-imx8mp.c
@@ -12,11 +12,13 @@
 #include "system/address-spaces.h"
 #include "hw/arm/bsa.h"
 #include "hw/arm/fsl-imx8mp.h"
-#include "hw/intc/arm_gicv3.h"
 #include "hw/misc/unimp.h"
 #include "hw/boards.h"
+#include "system/kvm.h"
 #include "system/system.h"
+#include "target/arm/cpu.h"
 #include "target/arm/cpu-qom.h"
+#include "target/arm/kvm_arm.h"
 #include "qapi/error.h"
 #include "qobject/qlist.h"
 
@@ -193,15 +195,15 @@ static void fsl_imx8mp_init(Object *obj)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
     FslImx8mpState *s = FSL_IMX8MP(obj);
+    const char *cpu_type = ms->cpu_type ?: ARM_CPU_TYPE_NAME("cortex-a53");
     int i;
 
     for (i = 0; i < MIN(ms->smp.cpus, FSL_IMX8MP_NUM_CPUS); i++) {
         g_autofree char *name = g_strdup_printf("cpu%d", i);
-        object_initialize_child(obj, name, &s->cpu[i],
-                                ARM_CPU_TYPE_NAME("cortex-a53"));
+        object_initialize_child(obj, name, &s->cpu[i], cpu_type);
     }
 
-    object_initialize_child(obj, "gic", &s->gic, TYPE_ARM_GICV3);
+    object_initialize_child(obj, "gic", &s->gic, gicv3_class_name());
 
     object_initialize_child(obj, "ccm", &s->ccm, TYPE_IMX8MP_CCM);
 
@@ -274,7 +276,8 @@ static void fsl_imx8mp_realize(DeviceState *dev, Error **errp)
     /* CPUs */
     for (i = 0; i < ms->smp.cpus; i++) {
         /* On uniprocessor, the CBAR is set to 0 */
-        if (ms->smp.cpus > 1) {
+        if (ms->smp.cpus > 1 &&
+                object_property_find(OBJECT(&s->cpu[i]), "reset-cbar")) {
             object_property_set_int(OBJECT(&s->cpu[i]), "reset-cbar",
                                     fsl_imx8mp_memmap[FSL_IMX8MP_GIC_DIST].addr,
                                     &error_abort);
@@ -286,6 +289,16 @@ static void fsl_imx8mp_realize(DeviceState *dev, Error **errp)
         object_property_set_int(OBJECT(&s->cpu[i]), "cntfrq", 8000000,
                                 &error_abort);
 
+        if (object_property_find(OBJECT(&s->cpu[i]), "has_el2")) {
+            object_property_set_bool(OBJECT(&s->cpu[i]), "has_el2",
+                                     !kvm_enabled(), &error_abort);
+        }
+
+        if (object_property_find(OBJECT(&s->cpu[i]), "has_el3")) {
+            object_property_set_bool(OBJECT(&s->cpu[i]), "has_el3",
+                                     !kvm_enabled(), &error_abort);
+        }
+
         if (i) {
             /*
              * Secondary CPUs start in powered-down state (and can be
@@ -304,6 +317,7 @@ static void fsl_imx8mp_realize(DeviceState *dev, Error **errp)
     {
         SysBusDevice *gicsbd = SYS_BUS_DEVICE(&s->gic);
         QList *redist_region_count;
+        bool pmu = object_property_get_bool(OBJECT(first_cpu), "pmu", NULL);
 
         qdev_prop_set_uint32(gicdev, "num-cpu", ms->smp.cpus);
         qdev_prop_set_uint32(gicdev, "num-irq",
@@ -360,6 +374,16 @@ static void fsl_imx8mp_realize(DeviceState *dev, Error **errp)
                                qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
             sysbus_connect_irq(gicsbd, i + 3 * ms->smp.cpus,
                                qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
+
+            if (kvm_enabled()) {
+                if (pmu) {
+                    assert(arm_feature(&s->cpu[i].env, ARM_FEATURE_PMU));
+                    if (kvm_irqchip_in_kernel()) {
+                        kvm_arm_pmu_set_irq(&s->cpu[i], VIRTUAL_PMU_IRQ);
+                    }
+                    kvm_arm_pmu_init(&s->cpu[i]);
+                }
+            }
         }
     }
 
diff --git a/hw/arm/imx8mp-evk.c b/hw/arm/imx8mp-evk.c
index fc880a1d44..3ddcf1af5a 100644
--- a/hw/arm/imx8mp-evk.c
+++ b/hw/arm/imx8mp-evk.c
@@ -13,6 +13,7 @@
 #include "hw/arm/machines-qom.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
+#include "system/kvm.h"
 #include "system/qtest.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
@@ -94,12 +95,22 @@ static void imx8mp_evk_init(MachineState *machine)
     }
 }
 
+static const char *imx8mp_evk_get_default_cpu_type(const MachineState *ms)
+{
+    if (kvm_enabled()) {
+        return ARM_CPU_TYPE_NAME("host");
+    }
+
+    return ARM_CPU_TYPE_NAME("cortex-a53");
+}
+
 static void imx8mp_evk_machine_init(MachineClass *mc)
 {
     mc->desc = "NXP i.MX 8M Plus EVK Board";
     mc->init = imx8mp_evk_init;
     mc->max_cpus = FSL_IMX8MP_NUM_CPUS;
     mc->default_ram_id = "imx8mp-evk.ram";
+    mc->get_default_cpu_type = imx8mp_evk_get_default_cpu_type;
 }
 
 DEFINE_MACHINE_AARCH64("imx8mp-evk", imx8mp_evk_machine_init)
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index b44b85f436..0cdeb60f1f 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -622,7 +622,8 @@ config FSL_IMX8MP
 config FSL_IMX8MP_EVK
     bool
     default y
-    depends on TCG && AARCH64
+    depends on AARCH64
+    depends on TCG || KVM
     select FSL_IMX8MP
 
 config ARM_SMMUV3
-- 
2.51.2


