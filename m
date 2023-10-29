Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1175541ejc;
        Sat, 28 Oct 2023 23:05:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMt5umH34gMHLzlrGSJlpi7Ez5iPYVt2af7NbdBIVmNX71YLzhtFxGok29+nJniFKsQvfI
X-Received: by 2002:a05:622a:40f:b0:41e:3ca6:2b37 with SMTP id n15-20020a05622a040f00b0041e3ca62b37mr9101490qtx.2.1698559542061;
        Sat, 28 Oct 2023 23:05:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698559542; cv=none;
        d=google.com; s=arc-20160816;
        b=AMI3NVNiW4r7dtY2N1bzqUlFMOlFkzwtsH28sqE/CYlZbni5xRIUruzRUymUnmE4Ie
         UlzSQu71M5g/9NcZkKNcJm83pIDe303duzm2ic1uXt3KlenMVcKzjNosM7wepElw1wEV
         z171dEXHwhNahqvdQ4YXPRBq2y3WHbAKtPE9sSo+mQuRcHfdrtwgRE9JKdfzuvM9RT+J
         YcYWMVx2PerxwRTWUjbtkac9k4cXZcTqKrCfKardQAGJ0J3CgCTIzbhN6SnL5HWEBVk5
         cbaCVzo9MworxUrIm+21zUbjupmuxcJxf6IT0fPmoZ+n44FjluGODUhu71uxNn5hPpz7
         DIqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=zrq82TLCFypqxKyT1z+K/brbjgrCC84E4FF6pseKFjc=;
        fh=8RLaDFvt4U5QvEIcSitY+s1+5Mo/AC4nim1lLLby+Mo=;
        b=VSCccRDhG5ODIvJ21t0AxI1jBbTI+L4eF8/8x2Z3fSNQVIRGTXoYbybu1iGcRs77sr
         yivUCK2YfHUhv7OnthCYiBeGtwUPabpZFS6xPOE9GpGREeIhjoeqBUBjco56MvFJBbbM
         oPsC174qMzYUw2nfXnIb30GfdESCaYccvqirl4buUhqnvtbEi1PwKXHR+m05czlrtn4F
         lNMup5p/wGjmF24f8jLG3lj1pDjABuYu1ZVSHLNCE8rhhhZwILpE/bMRcGRraDcPIVPm
         DJXsOvl5XZEIfIwXxNXcSbAsWv7VfCll90ouIaVrR8cJqUNTJ3HFQ6Nye75K/4U+CzIg
         iyYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15-20020ac85ccf000000b00403b1d1599asi3398478qta.2.2023.10.28.23.05.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Oct 2023 23:05:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qwyuW-0002HH-IY; Sun, 29 Oct 2023 02:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1qwyuT-0002GG-PY; Sun, 29 Oct 2023 02:04:29 -0400
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1qwyuR-0001pt-WB; Sun, 29 Oct 2023 02:04:29 -0400
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6b20a48522fso3145292b3a.1; 
 Sat, 28 Oct 2023 23:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698559466; x=1699164266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zrq82TLCFypqxKyT1z+K/brbjgrCC84E4FF6pseKFjc=;
 b=SmQ3YJavOJwIE5S27jSye5Tr4S7FgmFeNWouY64IlX8I9bG0swgtIkx1LaCep/bnHO
 vvV5EFWXbk3sCeZvcvMbq0ELDVB88VU8IYNou4Xkkkfm0cZBQwKObrQK2IzvpP2MoyU+
 Gru4MvAC8GACcnaRzKvU6+4QVA5y9DTr8WlBgheDSy498g3s41ynGQIcjhGi0jA2GKrn
 tZ4kRdbEXM9abt63kCC3oyymQLd2y+Jxq8g2zz5+a1rH/2QADDOrDIZQ7o7yv45KQJv+
 SHbQsAK1iFSj7DL7GTrvtuRbKCLKRHbN+JYi4j7G2LMVEcewdpqqrQjjlMhI7J1uykBj
 wfNw==
X-Gm-Message-State: AOJu0Yx386ODzNtvO7ZeV8tkuN4aCCA0SXl899bUpZDdjFO4OcjeNdrR
 S9AkvB37juH/Rz5W7Rj61Mr3eIIkI7QEHg==
X-Received: by 2002:a17:903:88e:b0:1b8:94e9:e7cb with SMTP id
 kt14-20020a170903088e00b001b894e9e7cbmr4423775plb.21.1698559465935; 
 Sat, 28 Oct 2023 23:04:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:642:4c02:6ead:344e:2b1:f5a5:58c6])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a17090341cc00b001b8943b37a5sm4019518ple.24.2023.10.28.23.04.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 28 Oct 2023 23:04:25 -0700 (PDT)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Cc: Joelle van Dyne <j@getutm.app>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 qemu-arm@nongnu.org (open list:Virt)
Subject: [PATCH v3 09/14] tpm_tis_sysbus: move DSDT AML generation to device
Date: Sat, 28 Oct 2023 23:03:22 -0700
Message-ID: <20231029060404.71196-10-j@getutm.app>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231029060404.71196-1-j@getutm.app>
References: <20231029060404.71196-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.210.182; envelope-from=osy86dev@gmail.com;
 helo=mail-pf1-f182.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RLBAAqOByeRU

This reduces redundent code in different machine types with ACPI table
generation. Additionally, this will allow us to support different TPM
interfaces with the same AML logic. Finally, this matches up with the
TPM TIS ISA implementation.

Ideally, we would be able to call `qbus_build_aml` and avoid any TPM
specific code in the ACPI table generation. However, currently we
still have to call `build_tpm2` anyways and it does not look like
most other ACPI devices support the `ACPI_DEV_AML_IF` interface.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 hw/arm/virt-acpi-build.c  | 38 ++------------------------------------
 hw/loongarch/acpi-build.c | 38 ++------------------------------------
 hw/tpm/tpm_tis_sysbus.c   | 37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 72 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 9ce136cd88..3efbe6bd09 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -35,6 +35,7 @@
 #include "target/arm/cpu.h"
 #include "hw/acpi/acpi-defs.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/acpi_aml_interface.h"
 #include "hw/nvram/fw_cfg.h"
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/acpi/aml-build.h"
@@ -208,41 +209,6 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
     aml_append(scope, dev);
 }
 
-#ifdef CONFIG_TPM
-static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
-{
-    PlatformBusDevice *pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
-    hwaddr pbus_base = vms->memmap[VIRT_PLATFORM_BUS].base;
-    SysBusDevice *sbdev = SYS_BUS_DEVICE(tpm_find());
-    MemoryRegion *sbdev_mr;
-    hwaddr tpm_base;
-
-    if (!sbdev) {
-        return;
-    }
-
-    tpm_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
-    assert(tpm_base != -1);
-
-    tpm_base += pbus_base;
-
-    sbdev_mr = sysbus_mmio_get_region(sbdev, 0);
-
-    Aml *dev = aml_device("TPM0");
-    aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
-    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
-    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
-
-    Aml *crs = aml_resource_template();
-    aml_append(crs,
-               aml_memory32_fixed(tpm_base,
-                                  (uint32_t)memory_region_size(sbdev_mr),
-                                  AML_READ_WRITE));
-    aml_append(dev, aml_name_decl("_CRS", crs));
-    aml_append(scope, dev);
-}
-#endif
-
 #define ID_MAPPING_ENTRY_SIZE 20
 #define SMMU_V3_ENTRY_SIZE 68
 #define ROOT_COMPLEX_ENTRY_SIZE 36
@@ -891,7 +857,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     acpi_dsdt_add_power_button(scope);
 #ifdef CONFIG_TPM
-    acpi_dsdt_add_tpm(scope, vms);
+    call_dev_aml_func(DEVICE(tpm_find()), scope);
 #endif
 
     aml_append(dsdt, scope);
diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
index ae292fc543..1969bfc8f9 100644
--- a/hw/loongarch/acpi-build.c
+++ b/hw/loongarch/acpi-build.c
@@ -14,6 +14,7 @@
 #include "target/loongarch/cpu.h"
 #include "hw/acpi/acpi-defs.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/acpi_aml_interface.h"
 #include "hw/nvram/fw_cfg.h"
 #include "hw/acpi/bios-linker-loader.h"
 #include "migration/vmstate.h"
@@ -328,41 +329,6 @@ static void build_flash_aml(Aml *scope, LoongArchMachineState *lams)
     aml_append(scope, dev);
 }
 
-#ifdef CONFIG_TPM
-static void acpi_dsdt_add_tpm(Aml *scope, LoongArchMachineState *vms)
-{
-    PlatformBusDevice *pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
-    hwaddr pbus_base = VIRT_PLATFORM_BUS_BASEADDRESS;
-    SysBusDevice *sbdev = SYS_BUS_DEVICE(tpm_find());
-    MemoryRegion *sbdev_mr;
-    hwaddr tpm_base;
-
-    if (!sbdev) {
-        return;
-    }
-
-    tpm_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
-    assert(tpm_base != -1);
-
-    tpm_base += pbus_base;
-
-    sbdev_mr = sysbus_mmio_get_region(sbdev, 0);
-
-    Aml *dev = aml_device("TPM0");
-    aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
-    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
-    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
-
-    Aml *crs = aml_resource_template();
-    aml_append(crs,
-               aml_memory32_fixed(tpm_base,
-                                  (uint32_t)memory_region_size(sbdev_mr),
-                                  AML_READ_WRITE));
-    aml_append(dev, aml_name_decl("_CRS", crs));
-    aml_append(scope, dev);
-}
-#endif
-
 /* build DSDT */
 static void
 build_dsdt(GArray *table_data, BIOSLinker *linker, MachineState *machine)
@@ -379,7 +345,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     build_la_ged_aml(dsdt, machine);
     build_flash_aml(dsdt, lams);
 #ifdef CONFIG_TPM
-    acpi_dsdt_add_tpm(dsdt, lams);
+    call_dev_aml_func(DEVICE(tpm_find()), dsdt);
 #endif
     /* System State Package */
     scope = aml_scope("\\");
diff --git a/hw/tpm/tpm_tis_sysbus.c b/hw/tpm/tpm_tis_sysbus.c
index 2fc550f119..462b0e1571 100644
--- a/hw/tpm/tpm_tis_sysbus.c
+++ b/hw/tpm/tpm_tis_sysbus.c
@@ -30,6 +30,7 @@
 #include "hw/sysbus.h"
 #include "tpm_tis.h"
 #include "qom/object.h"
+#include "hw/acpi/acpi_aml_interface.h"
 
 struct TPMStateSysBus {
     /*< private >*/
@@ -37,6 +38,8 @@ struct TPMStateSysBus {
 
     /*< public >*/
     TPMState state; /* not a QOM object */
+    uint64_t baseaddr;
+    uint64_t size;
 };
 
 OBJECT_DECLARE_SIMPLE_TYPE(TPMStateSysBus, TPM_TIS_SYSBUS)
@@ -93,6 +96,10 @@ static void tpm_tis_sysbus_reset(DeviceState *dev)
 static Property tpm_tis_sysbus_properties[] = {
     DEFINE_PROP_UINT32("irq", TPMStateSysBus, state.irq_num, TPM_TIS_IRQ),
     DEFINE_PROP_TPMBE("tpmdev", TPMStateSysBus, state.be_driver),
+    DEFINE_PROP_UINT64("x-baseaddr", TPMStateSysBus, baseaddr,
+                       TPM_TIS_ADDR_BASE),
+    DEFINE_PROP_UINT64("x-size", TPMStateSysBus, size,
+                       TPM_TIS_ADDR_SIZE),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -125,10 +132,38 @@ static void tpm_tis_sysbus_realizefn(DeviceState *dev, Error **errp)
     }
 }
 
+static void build_tpm_tis_sysbus_aml(AcpiDevAmlIf *adev, Aml *scope)
+{
+    Aml *dev, *crs;
+    TPMStateSysBus *sbdev = TPM_TIS_SYSBUS(adev);
+    TPMIf *ti = TPM_IF(sbdev);
+
+    dev = aml_device("TPM");
+    if (tpm_tis_sysbus_get_tpm_version(ti) == TPM_VERSION_2_0) {
+        aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
+        aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
+    } else {
+        aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0C31")));
+    }
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+    aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
+    crs = aml_resource_template();
+    aml_append(crs, aml_memory32_fixed(sbdev->baseaddr, sbdev->size,
+                                      AML_READ_WRITE));
+    /*
+     * FIXME: TPM_TIS_IRQ=5 conflicts with PNP0C0F irqs,
+     * fix default TPM_TIS_IRQ value there to use some unused IRQ
+     */
+    /* aml_append(crs, aml_irq_no_flags(sbdev->state.irq_num)); */
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    aml_append(scope, dev);
+}
+
 static void tpm_tis_sysbus_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     TPMIfClass *tc = TPM_IF_CLASS(klass);
+    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
     device_class_set_props(dc, tpm_tis_sysbus_properties);
     dc->vmsd  = &vmstate_tpm_tis_sysbus;
@@ -139,6 +174,7 @@ static void tpm_tis_sysbus_class_init(ObjectClass *klass, void *data)
     tc->request_completed = tpm_tis_sysbus_request_completed;
     tc->get_version = tpm_tis_sysbus_get_tpm_version;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    adevc->build_dev_aml = build_tpm_tis_sysbus_aml;
 }
 
 static const TypeInfo tpm_tis_sysbus_info = {
@@ -149,6 +185,7 @@ static const TypeInfo tpm_tis_sysbus_info = {
     .class_init  = tpm_tis_sysbus_class_init,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_TPM_IF },
+        { TYPE_ACPI_DEV_AML_IF },
         { }
     }
 };
-- 
2.41.0

