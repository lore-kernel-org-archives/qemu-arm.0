Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5579C10ED659
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:24:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65Di-00013u-Oz; Fri, 27 Mar 2026 07:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65CY-0007Xt-2z
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:18:07 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65CT-0000AZ-G0
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:18:04 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-439c56e822eso2108702f8f.2
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610278; x=1775215078; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CReBByvpzpB+DOsYFrY4nglOIG+4SryQVlLfXuYbQ0g=;
 b=jZ7by7kJ8hX3IEPTeLgmw5+0iyVNOLMunl6XZfylrLinzr9j2N/lZpOeYyWfoM+YNr
 dk0NL0jZBFc9fablhI/99a4iWTB3av9c+ywDQvI0+3PSM8rbpV62LdH5HVRnCgWrWBav
 bN+dI7BEh0gxvU/ZkBr256BeS0iN8CQinwpBfCLuO5+f6e73Etg/z4zAXnaNyhUC1Ma+
 ZwylSKf3YkUW0TX0CSWtcetcdCOgo6kHcrHZTE4J8rrca7r8FO/lsxJsQSxBqG4BlYVK
 vEZYfjJddRuWQwLCtsaPKkD0mPcpUq+qsMo2nE9Fm1xfyo3xilzrYO/mCnp8E5CwJO+6
 0Pkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610278; x=1775215078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CReBByvpzpB+DOsYFrY4nglOIG+4SryQVlLfXuYbQ0g=;
 b=bUqlNnJodBrQ7p/F6R3s801jrxx0vi210o9znpSrWObbDEoe4SstqXivqSImjNZoBV
 Gxi1ewuKOXU+3i9Dl7ljdbfYHzys88FdLcNmSy4aOIuVpw4LakGmhX0QVECL/axRWhAn
 YpHBr8QJBRVF5ePUIbubfoEjDiQAT3wFVZ0FMZEyNAqdX3ORiSCc1UyaurK+UCCkr10u
 1hnjB5y0rES6k2lDyxNmxeUqav5fkMVz62GEa42/E17wYtwfvDQj12s/NqqK7ETbLdF9
 kAJFe5y2yM+FQMOCb6RvuKyJ/sJ2eyfSpWOtnXsxQM5CCqIiRDbUdjrcPWumJ3wz0Qb7
 rT8Q==
X-Gm-Message-State: AOJu0YyPkvZaYQvXDFcmgn9ZXqSYEppenHh6B0EH8zNGy8Mhv8odqgQg
 s9K1gLH4B7guNreGx2vb/PN1JO0PZWgMQc7GvWOsdg2ykBJGXjlLkPbGL1EKZSMsMBVXGr3nMlC
 lkM/VMBU=
X-Gm-Gg: ATEYQzxdYTMf5/g9o5uragEwmKplOstJwFp0/7KvfSD7xOJkl9Vdoyb8306M7XCG8MV
 NVrE/ghsWSVgZ6LPQm5UNHYLXnf4l/d8zIfQuIpf3Muyebn8mV2gg+vFUwBJDUhzcGnckBxwiH6
 E9m9lNwGLgO1uznBOD9zJ7zeqV+npIvJYMTbPczhAOcN81aykQfV6IhjCy4SqQZc7xdECr5wuhk
 ke42RwKhxnJKIFkxLc5hJ+Fvpa7h1BB7RLGiqOG+5OySJfzYFkgwrGbzDEp0ivFJVE0txIrENJE
 pM3k/MVkXP5syaEQAh1HqdI+wFP+YdgVoqnYi5GxDweUgguYmZmDFQMlK13wG2siBHmWhCt+Ne7
 SPdEerfgmrBRIHlpSz8GlP7GRmgw/RpIK8atBrEs6bnmsjQlHn2Dm42FN5HHMxb8Itxg6YMhHVl
 7Ab2TDjwl3998zSZDeuUvDZJjyI4YJQuuNkYfQRYuWzcBduSC/27VURTQpCpEQ1yQAFBPVNMEcn
 ThkvsocJ/7Mtm2rF372t75QQq68xKY=
X-Received: by 2002:a05:6000:2884:b0:43b:54c9:85f4 with SMTP id
 ffacd0b85a97d-43b9eaad5e6mr3657995f8f.39.1774610277750; 
 Fri, 27 Mar 2026 04:17:57 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 59/65] hw/arm/virt: Split GICv2 and GICv3/4 creation
Date: Fri, 27 Mar 2026 11:16:54 +0000
Message-ID: <20260327111700.795099-60-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Currently create_gic() handles GICv2 and GICv3/4 in a single
function, with large sections that are conditional on the
vms->gic_version.  GICv5 will be different to both.

Refactor into create_gicv2() and create_gicv3().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 hw/arm/virt.c | 137 ++++++++++++++++++++++++++++++--------------------
 1 file changed, 82 insertions(+), 55 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5a2cb81919..8c383d7e40 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -861,26 +861,58 @@ static void gic_connect_ppis(VirtMachineState *vms)
     }
 }
 
-static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
+static void create_gicv2(VirtMachineState *vms, MemoryRegion *mem)
 {
     MachineState *ms = MACHINE(vms);
     /* We create a standalone GIC */
     SysBusDevice *gicbusdev;
-    const char *gictype;
     unsigned int smp_cpus = ms->smp.cpus;
-    uint32_t nb_redist_regions = 0;
-    int revision;
 
-    if (vms->gic_version == VIRT_GIC_VERSION_2) {
-        gictype = gic_class_name();
-    } else {
-        gictype = gicv3_class_name();
+    if (kvm_enabled() && vms->virt) {
+        error_report("KVM EL2 is only supported with in-kernel GICv3");
+        exit(1);
     }
 
+    vms->gic = qdev_new(gic_class_name());
+    qdev_prop_set_uint32(vms->gic, "revision", 2);
+    qdev_prop_set_uint32(vms->gic, "num-cpu", smp_cpus);
+    /*
+     * Note that the num-irq property counts both internal and external
+     * interrupts; there are always 32 of the former (mandated by GIC spec).
+     */
+    qdev_prop_set_uint32(vms->gic, "num-irq", NUM_IRQS + 32);
+    if (!kvm_irqchip_in_kernel()) {
+        qdev_prop_set_bit(vms->gic, "has-security-extensions", vms->secure);
+        qdev_prop_set_bit(vms->gic, "has-virtualization-extensions", vms->virt);
+    }
+
+    gicbusdev = SYS_BUS_DEVICE(vms->gic);
+    sysbus_realize_and_unref(gicbusdev, &error_fatal);
+    sysbus_mmio_map(gicbusdev, 0, vms->memmap[VIRT_GIC_DIST].base);
+    sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_CPU].base);
+    if (vms->virt) {
+        sysbus_mmio_map(gicbusdev, 2, vms->memmap[VIRT_GIC_HYP].base);
+        sysbus_mmio_map(gicbusdev, 3, vms->memmap[VIRT_GIC_VCPU].base);
+    }
+
+    gic_connect_ppis(vms);
+
+    fdt_add_gic_node(vms);
+}
+
+static void create_gicv3(VirtMachineState *vms, MemoryRegion *mem)
+{
+    MachineState *ms = MACHINE(vms);
+    /* We create a standalone GIC */
+    SysBusDevice *gicbusdev;
+    unsigned int smp_cpus = ms->smp.cpus;
+    uint32_t nb_redist_regions;
+    int revision;
+    QList *redist_region_count;
+    uint32_t redist0_capacity = virt_redist_capacity(vms, VIRT_GIC_REDIST);
+    uint32_t redist0_count = MIN(smp_cpus, redist0_capacity);
+
     switch (vms->gic_version) {
-    case VIRT_GIC_VERSION_2:
-        revision = 2;
-        break;
     case VIRT_GIC_VERSION_3:
         revision = 3;
         break;
@@ -897,10 +929,11 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
         exit(1);
     }
 
-    vms->gic = qdev_new(gictype);
+    vms->gic = qdev_new(gicv3_class_name());
     qdev_prop_set_uint32(vms->gic, "revision", revision);
     qdev_prop_set_uint32(vms->gic, "num-cpu", smp_cpus);
-    /* Note that the num-irq property counts both internal and external
+    /*
+     * Note that the num-irq property counts both internal and external
      * interrupts; there are always 32 of the former (mandated by GIC spec).
      */
     qdev_prop_set_uint32(vms->gic, "num-irq", NUM_IRQS + 32);
@@ -908,40 +941,28 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
         qdev_prop_set_bit(vms->gic, "has-security-extensions", vms->secure);
     }
 
-    if (vms->gic_version != VIRT_GIC_VERSION_2) {
-        QList *redist_region_count;
-        uint32_t redist0_capacity = virt_redist_capacity(vms, VIRT_GIC_REDIST);
-        uint32_t redist0_count = MIN(smp_cpus, redist0_capacity);
+    nb_redist_regions = virt_gicv3_redist_region_count(vms);
 
-        nb_redist_regions = virt_gicv3_redist_region_count(vms);
+    redist_region_count = qlist_new();
+    qlist_append_int(redist_region_count, redist0_count);
+    if (nb_redist_regions == 2) {
+        uint32_t redist1_capacity =
+            virt_redist_capacity(vms, VIRT_HIGH_GIC_REDIST2);
 
-        redist_region_count = qlist_new();
-        qlist_append_int(redist_region_count, redist0_count);
-        if (nb_redist_regions == 2) {
-            uint32_t redist1_capacity =
-                virt_redist_capacity(vms, VIRT_HIGH_GIC_REDIST2);
+        qlist_append_int(redist_region_count,
+                         MIN(smp_cpus - redist0_count, redist1_capacity));
+    }
+    qdev_prop_set_array(vms->gic, "redist-region-count", redist_region_count);
 
-            qlist_append_int(redist_region_count,
-                MIN(smp_cpus - redist0_count, redist1_capacity));
-        }
-        qdev_prop_set_array(vms->gic, "redist-region-count",
-                            redist_region_count);
-
-        if (!kvm_irqchip_in_kernel()) {
-            if (vms->tcg_its) {
-                object_property_set_link(OBJECT(vms->gic), "sysmem",
-                                         OBJECT(mem), &error_fatal);
-                qdev_prop_set_bit(vms->gic, "has-lpi", true);
-            }
-        } else if (vms->virt) {
-            qdev_prop_set_uint32(vms->gic, "maintenance-interrupt-id",
-                                 ARCH_GIC_MAINT_IRQ);
-        }
-    } else {
-        if (!kvm_irqchip_in_kernel()) {
-            qdev_prop_set_bit(vms->gic, "has-virtualization-extensions",
-                              vms->virt);
+    if (!kvm_irqchip_in_kernel()) {
+        if (vms->tcg_its) {
+            object_property_set_link(OBJECT(vms->gic), "sysmem", OBJECT(mem),
+                                     &error_fatal);
+            qdev_prop_set_bit(vms->gic, "has-lpi", true);
         }
+    } else if (vms->virt) {
+        qdev_prop_set_uint32(vms->gic, "maintenance-interrupt-id",
+                             ARCH_GIC_MAINT_IRQ);
     }
 
     if (gicv3_nmi_present(vms)) {
@@ -951,18 +972,9 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     gicbusdev = SYS_BUS_DEVICE(vms->gic);
     sysbus_realize_and_unref(gicbusdev, &error_fatal);
     sysbus_mmio_map(gicbusdev, 0, vms->memmap[VIRT_GIC_DIST].base);
-    if (vms->gic_version != VIRT_GIC_VERSION_2) {
-        sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_REDIST].base);
-        if (nb_redist_regions == 2) {
-            sysbus_mmio_map(gicbusdev, 2,
-                            vms->memmap[VIRT_HIGH_GIC_REDIST2].base);
-        }
-    } else {
-        sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_CPU].base);
-        if (vms->virt) {
-            sysbus_mmio_map(gicbusdev, 2, vms->memmap[VIRT_GIC_HYP].base);
-            sysbus_mmio_map(gicbusdev, 3, vms->memmap[VIRT_GIC_VCPU].base);
-        }
+    sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_REDIST].base);
+    if (nb_redist_regions == 2) {
+        sysbus_mmio_map(gicbusdev, 2, vms->memmap[VIRT_HIGH_GIC_REDIST2].base);
     }
 
     gic_connect_ppis(vms);
@@ -970,6 +982,21 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     fdt_add_gic_node(vms);
 }
 
+static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
+{
+    switch (vms->gic_version) {
+    case VIRT_GIC_VERSION_2:
+        create_gicv2(vms, mem);
+        break;
+    case VIRT_GIC_VERSION_3:
+    case VIRT_GIC_VERSION_4:
+        create_gicv3(vms, mem);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static void create_msi_controller(VirtMachineState *vms)
 {
     switch (vms->msi_controller) {
-- 
2.43.0


