Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp405176lfq;
        Fri, 8 Apr 2022 07:49:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9yIzkA4M1gBqRF7q0h+K2c4IDJSnHPPrjSmSwhtmMAkbyxZJOvAKM4CQw/mHofsafDMX5
X-Received: by 2002:a25:5482:0:b0:63d:ab3e:f72 with SMTP id i124-20020a255482000000b0063dab3e0f72mr13466872ybb.130.1649429354696;
        Fri, 08 Apr 2022 07:49:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649429354; cv=none;
        d=google.com; s=arc-20160816;
        b=mhDWCv+Za9C757SKfY2g64CaTsI8sp5MZlXHkd6GNn9yN45Ge8nbEHGzbboIfxV3RH
         BLn0JEfyR53Fs2SL7JZMgFFvHulZVlTWEWXX7rMp/CQhj7CXWweQnQOfFuCy1f6YmOEo
         crV1O5wvzyP7YiPiHq94X1hX1h+7Tn6oFuv5D3aVQNKGwJjUY55WiGk8VMHV0dFlPE61
         V+AeXaQC64dCxGeaBARaH6RWc44O+H7SJZTaUKAtXlLw5WQrLuOWDieAK2X2fQ8COheD
         IBm+GLUscT9w17IJ426W2npVXWIq78OwPcoSCL3xFJZy0d/EAaidWMvhTLRoRpSAnzQz
         E2gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QiNb/fWTGwmLaiD1DUdHdEATfanLil6GCXqbm2UfHKk=;
        b=SeyLfc32gnEX6yo8rnnJD/SVZQoexuJqVSRlnZE2h5ooW+1HXDWFZH/FmQ5Al+UNHn
         npPCvEwYceKU6reMOIlV4+eOmI2YCviHXhbWfxF4DTiBhLv6xnM65E/bo/35FHa39SHg
         xGEZe+RzYQNROKQPiRE31ErxP4ZGxor15+jW6AEhclB6FiV29QvzBTqnmiGh+yoW9fgS
         cAGkn0DG+6/zlgmVe/TdjfXODuRV67hKNM6GYerZqfTUMx65iCM6a305lF3CvVLs50pw
         Gkuu8pO2/uQmVotZ4/n2zV3C0WqdDX+eVtgV+dcf6rwIBvBdsfbTDxGWQVKqZK5E5UO8
         kygA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yVHLooKa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v203-20020a252fd4000000b00641191cae62si246738ybv.452.2022.04.08.07.49.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 07:49:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yVHLooKa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncpvF-0007FH-WD
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 10:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPe-0007ZB-Ji
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:34 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPc-0002VP-9b
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:34 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 i6-20020a1c3b06000000b0038e710da2dcso7685953wma.1
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 07:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QiNb/fWTGwmLaiD1DUdHdEATfanLil6GCXqbm2UfHKk=;
 b=yVHLooKaPmkQsaX+sIyiO3+MAUYHyaYySYKjxQbGPel7pHs/FzES2952urnlI6VWzb
 FwUvn1MnsUmlskMH/n907h3ULItBwdn9Tf8QJ7+mwxpsMrAgTYlJoxZkjUdzwnwYX+qA
 61Eykp33mRGMn/yFTy+sj/S4NNcHIedQvguMdcZeXL7noC6nMuzR23HfkxGDL7COBsHm
 6Avs/ng+6IJUHGRSmuY7YOZrW5ob1lWdYWEh3nmV6YSUO20YsHFu/NMAEXm8FV4y2o7N
 eZ0g/5R32PQ8xTevVwpL8FMYWAjNmzggnNwkRdrsMLumMfL9WUaWTt98r/n2Uw/mZiU6
 greA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QiNb/fWTGwmLaiD1DUdHdEATfanLil6GCXqbm2UfHKk=;
 b=zKt8QQqIOuWloNV4nu28UjxUeTZoKuEWxQ7PZsc/FB+KTqPJqq+7tkHYK1PEiBmCF0
 HiPXaGzCU8ocYSqiP5/TrZbPGGYpI/5wQojo8Qz8pDz5wKsJOtGT5B0OTHAbo6ASfgi0
 Hd2gULN4FveAB28BrP8VCUVEbIdFw1SZ3Q2z87UrvbfJnqOLObS8QDf8GaOgx47Qhii8
 1YETXR9VCkyyGzWLCBctQuqCFBFjsEu7RK3qtqY5ucqEIIr0jV9xcuN39BnK5E7pouv2
 KFcf+HUIgMhVuyrhZM7GovDkuZFeksQJs7lsBnDRMpbX+rCw5K4jlB58ZJc26cURX+6K
 ZbMQ==
X-Gm-Message-State: AOAM531ngjs56/MFUq/q0ixamjfZFJGSxIAjamklgy4GGJlJfaR/PMrR
 KYS0VHsErYjesKfieDDJyDSvcp7vjZBefg==
X-Received: by 2002:a7b:cb4b:0:b0:38e:9c4c:9120 with SMTP id
 v11-20020a7bcb4b000000b0038e9c4c9120mr5266668wmj.76.1649427390881; 
 Fri, 08 Apr 2022 07:16:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 41/41] hw/arm/virt: Support TCG GICv4
Date: Fri,  8 Apr 2022 15:15:50 +0100
Message-Id: <20220408141550.1271295-42-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9OacoAAjhJZW

Add support for the TCG GICv4 to the virt board. For the board,
the GICv4 is very similar to the GICv3, with the only difference
being the size of the redistributor frame. The changes here are thus:
 * calculating virt_redist_capacity correctly for GICv4
 * changing various places which were "if GICv3" to be "if not GICv2"
 * the commandline option handling

Note that using GICv4 reduces the maximum possible number of CPUs on
the virt board from 512 to 317, because we can now only fit half as
many redistributors into the redistributor regions we have defined.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/virt.rst |  5 ++-
 include/hw/arm/virt.h    | 12 +++++--
 hw/arm/virt.c            | 70 ++++++++++++++++++++++++++++++----------
 3 files changed, 67 insertions(+), 20 deletions(-)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 1544632b674..5d13ec2798a 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -99,11 +99,14 @@ gic-version
     GICv2
   ``3``
     GICv3
+  ``4``
+    GICv4 (requires ``virtualization`` to be ``on``)
   ``host``
     Use the same GIC version the host provides, when using KVM
   ``max``
     Use the best GIC version possible (same as host when using KVM;
-    currently same as ``3``` for TCG, but this may change in future)
+    with TCG this is currently ``3`` if ``virtualization`` is ``off`` and
+    ``4`` if ``virtualization`` is ``on``, but this may change in future)
 
 its
   Set ``on``/``off`` to enable/disable ITS instantiation. The default is ``on``
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 360463e6bfb..15feabac63d 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -113,6 +113,7 @@ typedef enum VirtGICType {
     VIRT_GIC_VERSION_HOST,
     VIRT_GIC_VERSION_2,
     VIRT_GIC_VERSION_3,
+    VIRT_GIC_VERSION_4,
     VIRT_GIC_VERSION_NOSEL,
 } VirtGICType;
 
@@ -188,7 +189,14 @@ bool virt_is_acpi_enabled(VirtMachineState *vms);
 /* Return number of redistributors that fit in the specified region */
 static uint32_t virt_redist_capacity(VirtMachineState *vms, int region)
 {
-    return vms->memmap[region].size / GICV3_REDIST_SIZE;
+    uint32_t redist_size;
+
+    if (vms->gic_version == VIRT_GIC_VERSION_3) {
+        redist_size = GICV3_REDIST_SIZE;
+    } else {
+        redist_size = GICV4_REDIST_SIZE;
+    }
+    return vms->memmap[region].size / redist_size;
 }
 
 /* Return the number of used redistributor regions  */
@@ -196,7 +204,7 @@ static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
 {
     uint32_t redist0_capacity = virt_redist_capacity(vms, VIRT_GIC_REDIST);
 
-    assert(vms->gic_version == VIRT_GIC_VERSION_3);
+    assert(vms->gic_version != VIRT_GIC_VERSION_2);
 
     return (MACHINE(vms)->smp.cpus > redist0_capacity &&
             vms->highmem_redists) ? 2 : 1;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 577c1e65188..dfedc6b22ee 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -522,7 +522,7 @@ static void fdt_add_gic_node(VirtMachineState *vms)
     qemu_fdt_setprop_cell(ms->fdt, nodename, "#address-cells", 0x2);
     qemu_fdt_setprop_cell(ms->fdt, nodename, "#size-cells", 0x2);
     qemu_fdt_setprop(ms->fdt, nodename, "ranges", NULL, 0);
-    if (vms->gic_version == VIRT_GIC_VERSION_3) {
+    if (vms->gic_version != VIRT_GIC_VERSION_2) {
         int nb_redist_regions = virt_gicv3_redist_region_count(vms);
 
         qemu_fdt_setprop_string(ms->fdt, nodename, "compatible",
@@ -708,6 +708,9 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     case VIRT_GIC_VERSION_3:
         revision = 3;
         break;
+    case VIRT_GIC_VERSION_4:
+        revision = 4;
+        break;
     default:
         g_assert_not_reached();
     }
@@ -722,7 +725,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
         qdev_prop_set_bit(vms->gic, "has-security-extensions", vms->secure);
     }
 
-    if (vms->gic_version == VIRT_GIC_VERSION_3) {
+    if (vms->gic_version != VIRT_GIC_VERSION_2) {
         uint32_t redist0_capacity = virt_redist_capacity(vms, VIRT_GIC_REDIST);
         uint32_t redist0_count = MIN(smp_cpus, redist0_capacity);
 
@@ -756,7 +759,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     gicbusdev = SYS_BUS_DEVICE(vms->gic);
     sysbus_realize_and_unref(gicbusdev, &error_fatal);
     sysbus_mmio_map(gicbusdev, 0, vms->memmap[VIRT_GIC_DIST].base);
-    if (vms->gic_version == VIRT_GIC_VERSION_3) {
+    if (vms->gic_version != VIRT_GIC_VERSION_2) {
         sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_REDIST].base);
         if (nb_redist_regions == 2) {
             sysbus_mmio_map(gicbusdev, 2,
@@ -794,7 +797,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
                                                    ppibase + timer_irq[irq]));
         }
 
-        if (vms->gic_version == VIRT_GIC_VERSION_3) {
+        if (vms->gic_version != VIRT_GIC_VERSION_2) {
             qemu_irq irq = qdev_get_gpio_in(vms->gic,
                                             ppibase + ARCH_GIC_MAINT_IRQ);
             qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt",
@@ -820,7 +823,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 
     fdt_add_gic_node(vms);
 
-    if (vms->gic_version == VIRT_GIC_VERSION_3 && vms->its) {
+    if (vms->gic_version != VIRT_GIC_VERSION_2 && vms->its) {
         create_its(vms);
     } else if (vms->gic_version == VIRT_GIC_VERSION_2) {
         create_v2m(vms);
@@ -1672,10 +1675,10 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
          * purposes are to make TCG consistent (with 64-bit KVM hosts)
          * and to improve SGI efficiency.
          */
-        if (vms->gic_version == VIRT_GIC_VERSION_3) {
-            clustersz = GICV3_TARGETLIST_BITS;
-        } else {
+        if (vms->gic_version == VIRT_GIC_VERSION_2) {
             clustersz = GIC_TARGETLIST_BITS;
+        } else {
+            clustersz = GICV3_TARGETLIST_BITS;
         }
     }
     return arm_cpu_mp_affinity(idx, clustersz);
@@ -1808,6 +1811,10 @@ static void finalize_gic_version(VirtMachineState *vms)
                 error_report(
                     "gic-version=3 is not supported with kernel-irqchip=off");
                 exit(1);
+            case VIRT_GIC_VERSION_4:
+                error_report(
+                    "gic-version=4 is not supported with kernel-irqchip=off");
+                exit(1);
             }
         }
 
@@ -1845,6 +1852,9 @@ static void finalize_gic_version(VirtMachineState *vms)
         case VIRT_GIC_VERSION_2:
         case VIRT_GIC_VERSION_3:
             break;
+        case VIRT_GIC_VERSION_4:
+            error_report("gic-version=4 is not supported with KVM");
+            exit(1);
         }
 
         /* Check chosen version is effectively supported by the host */
@@ -1868,7 +1878,12 @@ static void finalize_gic_version(VirtMachineState *vms)
     case VIRT_GIC_VERSION_MAX:
         if (module_object_class_by_name("arm-gicv3")) {
             /* CONFIG_ARM_GICV3_TCG was set */
-            vms->gic_version = VIRT_GIC_VERSION_3;
+            if (vms->virt) {
+                /* GICv4 only makes sense if CPU has EL2 */
+                vms->gic_version = VIRT_GIC_VERSION_4;
+            } else {
+                vms->gic_version = VIRT_GIC_VERSION_3;
+            }
         } else {
             vms->gic_version = VIRT_GIC_VERSION_2;
         }
@@ -1876,6 +1891,12 @@ static void finalize_gic_version(VirtMachineState *vms)
     case VIRT_GIC_VERSION_HOST:
         error_report("gic-version=host requires KVM");
         exit(1);
+    case VIRT_GIC_VERSION_4:
+        if (!vms->virt) {
+            error_report("gic-version=4 requires virtualization enabled");
+            exit(1);
+        }
+        break;
     case VIRT_GIC_VERSION_2:
     case VIRT_GIC_VERSION_3:
         break;
@@ -2043,14 +2064,16 @@ static void machvirt_init(MachineState *machine)
         vms->psci_conduit = QEMU_PSCI_CONDUIT_HVC;
     }
 
-    /* The maximum number of CPUs depends on the GIC version, or on how
-     * many redistributors we can fit into the memory map.
+    /*
+     * The maximum number of CPUs depends on the GIC version, or on how
+     * many redistributors we can fit into the memory map (which in turn
+     * depends on whether this is a GICv3 or v4).
      */
-    if (vms->gic_version == VIRT_GIC_VERSION_3) {
+    if (vms->gic_version == VIRT_GIC_VERSION_2) {
+        virt_max_cpus = GIC_NCPU;
+    } else {
         virt_max_cpus = virt_redist_capacity(vms, VIRT_GIC_REDIST) +
             virt_redist_capacity(vms, VIRT_HIGH_GIC_REDIST2);
-    } else {
-        virt_max_cpus = GIC_NCPU;
     }
 
     if (max_cpus > virt_max_cpus) {
@@ -2431,8 +2454,19 @@ static void virt_set_mte(Object *obj, bool value, Error **errp)
 static char *virt_get_gic_version(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
-    const char *val = vms->gic_version == VIRT_GIC_VERSION_3 ? "3" : "2";
+    const char *val;
 
+    switch (vms->gic_version) {
+    case VIRT_GIC_VERSION_4:
+        val = "4";
+        break;
+    case VIRT_GIC_VERSION_3:
+        val = "3";
+        break;
+    default:
+        val = "2";
+        break;
+    }
     return g_strdup(val);
 }
 
@@ -2440,7 +2474,9 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
 
-    if (!strcmp(value, "3")) {
+    if (!strcmp(value, "4")) {
+        vms->gic_version = VIRT_GIC_VERSION_4;
+    } else if (!strcmp(value, "3")) {
         vms->gic_version = VIRT_GIC_VERSION_3;
     } else if (!strcmp(value, "2")) {
         vms->gic_version = VIRT_GIC_VERSION_2;
@@ -2898,7 +2934,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                   virt_set_gic_version);
     object_class_property_set_description(oc, "gic-version",
                                           "Set GIC version. "
-                                          "Valid values are 2, 3, host and max");
+                                          "Valid values are 2, 3, 4, host and max");
 
     object_class_property_add_str(oc, "iommu", virt_get_iommu, virt_set_iommu);
     object_class_property_set_description(oc, "iommu",
-- 
2.25.1

