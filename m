Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp189282njb;
        Wed, 4 Sep 2024 09:15:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUk0AJNBVApVvEXxt4RTYorKONIOn8ab9oBVWhq36J8SrCMd5tOpJiPqlt7w4mjkMLH6Am82zGNP+ptHA==@linaro.org
X-Received: by 2002:a05:6512:12c7:b0:533:3fc8:43ee with SMTP id 2adb3069b0e04-53546b249fcmr11970007e87.13.1725466552438;
        Wed, 04 Sep 2024 09:15:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725466552; cv=none;
        d=google.com; s=arc-20160816;
        b=rcltPJ3wW1rF5nyAelRMj1dDgST7zDL/i/uhArxc79arvNPQsSVHKkxOtt9p6JweSh
         j+p6DLfiu8V7GNSZaKPMr6jfBcrIF8NMYwX7aLmcmO5paGBmo6B/keys/4/SIZvFOkYW
         LLjbWYUN5/sYC7h+kOT0PlwCNSSblp0i8ENEDLJlAnVH8L5GR8tzLUM/0qUz33UgSrhA
         EWKSd/VQky00U1pau3tEQWGIwJyC44krGQEPWgSkd/t0KaIN1UOLbh9bE/JxHytiJ9nb
         JDrVaFgLZ9lg090RQVv+8tH9wDI+7DDyDBPJSK2T3nYqmDanUIRDzzQl52aGogB+XYtG
         fj7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9ixH95d7Al9xFTOStqh6VLaEXX0BKF8+hj7xVV9eDrA=;
        fh=fmhAngK5SNaPnZ7JIPrtAdUZNi710YJolzJjAFu5zYs=;
        b=x3EbUZtX5WnIA2TGJXv6JL2N7eoZ6YbtZvqV1rcjrV3UwZNrQbKtBL1tPaVZTcWarI
         R8eZuVpoY7e0EDayo4EFZGSgfWhE2XwCTZmRnSLdVUVMhiKbfh33CJrQHWjnzQ49zkkM
         NJJ6bik3fcVn+fllCKbZh9w6lmeGgSFJS2uE9oSNSZ1/pnmZxTrnh+DLXMh16n5uP54Z
         9fTd7SK/3PFNvsMctDzOZ8w8wcvxKKOKgwh8DXD1giURAt3juQrYphCkTL1wFbag4bCc
         fxGsboo9V0Vd90W1W2kldgCuRD8UPuz0zdfFkECo2/qXb85Ui8tEhtDWHoNOFT746qAH
         3G4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=a62ue82F;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-5354081bc25sor4994316e87.23.2024.09.04.09.15.52
        (Google Transport Security);
        Wed, 04 Sep 2024 09:15:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=a62ue82F;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725466552; x=1726071352; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ixH95d7Al9xFTOStqh6VLaEXX0BKF8+hj7xVV9eDrA=;
        b=a62ue82FL/MOAlyeTZEyn4JIi7NgLUdyb9yumpx7xkedVPXfQhQOVsBwvaT6Y1fT88
         kDrGrxlnipZoRbpBbonI9AhEblki+eaQGv9Q3MPfRT35bUUDlhC68XAoZjKj5xTMWMdB
         BQs1mbX1AyIjc24AMuZfM1a5gsqpenOWME4SD9cOg1dzJuS3hicAvkQ9KCNR5NDzswkB
         PGCbuN9ZATGZRdv5RKFXv1fvlxFmoxERZOvh6begXAQiHKjxNT8U3w3MLLCpKv9QdckU
         vRqimIu6L7p2oU3mrHObrI854zPXvPoENAcbDwh66rqSjVDuWJ4LJI7mrn6+aOQfsR5y
         6oLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725466552; x=1726071352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ixH95d7Al9xFTOStqh6VLaEXX0BKF8+hj7xVV9eDrA=;
        b=lTwuaRqxm53DU2xSVxON+T8HJmHOQ54uDus268/NGT5bSzkr5tvKYFkbzQEurR/UcA
         E+Jzx1qCTWR/IbNJMl0ipXwIEJvxx2bmsYxRhb8sgh5ddckwt9eKDS+sizEuioisZcQx
         Ey7O8pbaU6SUyDWkPRnzUVFByKgvAGqz0XbA+woGRIZgY/qygIKhd6e5gfv6mP6uWtPj
         vJQsnNxbO5ZeADjCzwZhtH8SWvZznelx17TsQJ+9luekQCdM4tSX0auppo9cw5oat68J
         IYKJo3ww6rPr4dHsq3he/njM8Vw/6bMxil/gOX1HfulbIXGIFdQV2kWhItekQNONBitl
         Go+w==
X-Forwarded-Encrypted: i=1; AJvYcCVkzzhEZ7K4/U2pIanrDwHeCKhhOapXzjCNERhDP1WtAFbz0xNsstn3RYSqvtzY90NZ5KoXOyYdNRwpngEb8w==@linaro.org, AJvYcCX6WS3kzKyr8SLAF7YWoElHkEjqzkU2ixO5NCwYewI1j+oSxDrmrlhOWnA6epZIcUfuJiMiXWrtaL0oPA==@linaro.org
X-Gm-Message-State: AOJu0YzVUxtLqeYauVin6KXqQuu2v10RtM1ylkcZz6bd5ySL2BPk5rex
	5GZuU03Uv6dEoUC6ohAAtoaTWzvgUlIsp4MXUeBGgSaST90vszRG
X-Google-Smtp-Source: AGHT+IG1JgHcK/HSPjvz/v7e/HA3h7W7yVxrlLa32XoSdRwuQdNw8Nv6kbTy/cV1UOn6hD+yiZ1CvQ==
X-Received: by 2002:a05:6512:159e:b0:52e:7542:f469 with SMTP id 2adb3069b0e04-53546a56629mr12273709e87.0.1725466551489;
        Wed, 04 Sep 2024 09:15:51 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535692d9bf6sm176341e87.41.2024.09.04.09.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 09:15:50 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com,
	jason.andryuk@amd.com,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-arm@nongnu.org
Subject: [PULL v1 07/12] hw/arm: xenpvh: Break out a common PVH machine
Date: Wed,  4 Sep 2024 18:15:31 +0200
Message-ID: <20240904161537.664189-8-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904161537.664189-1-edgar.iglesias@gmail.com>
References: <20240904161537.664189-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: A0g+tF4K/0/v

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Break out a common Xen PVH machine in preparation for
adding a x86 Xen PVH machine.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/arm/trace-events             |   5 -
 hw/arm/xen_arm.c                | 198 +++--------------------
 hw/xen/meson.build              |   1 +
 hw/xen/trace-events             |   4 +
 hw/xen/xen-pvh-common.c         | 275 ++++++++++++++++++++++++++++++++
 include/hw/xen/xen-pvh-common.h |  59 +++++++
 6 files changed, 358 insertions(+), 184 deletions(-)
 create mode 100644 hw/xen/xen-pvh-common.c
 create mode 100644 include/hw/xen/xen-pvh-common.h

diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index be6c8f720b..c64ad344bd 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -68,10 +68,5 @@ z2_aer915_send_too_long(int8_t msg) "message too long (%i bytes)"
 z2_aer915_send(uint8_t reg, uint8_t value) "reg %d value 0x%02x"
 z2_aer915_event(int8_t event, int8_t len) "i2c event =0x%x len=%d bytes"
 
-# xen_arm.c
-xen_create_virtio_mmio_devices(int i, int irq, uint64_t base) "Created virtio-mmio device %d: irq %d base 0x%"PRIx64
-xen_init_ram(uint64_t machine_ram_size) "Initialized xen ram with size 0x%"PRIx64
-xen_enable_tpm(uint64_t addr) "Connected tpmdev at address 0x%"PRIx64
-
 # bcm2838.c
 bcm2838_gic_set_irq(int irq, int level) "gic irq:%d lvl:%d"
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index f0868e7be5..04cb9855af 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -7,44 +7,12 @@
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
 #include "qapi/qapi-commands-migration.h"
-#include "qapi/visitor.h"
 #include "hw/boards.h"
-#include "hw/irq.h"
-#include "hw/sysbus.h"
-#include "sysemu/block-backend.h"
-#include "sysemu/tpm_backend.h"
 #include "sysemu/sysemu.h"
-#include "hw/xen/xen-hvm-common.h"
-#include "sysemu/tpm.h"
+#include "hw/xen/xen-pvh-common.h"
 #include "hw/xen/arch_hvm.h"
-#include "trace.h"
 
 #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
-OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
-
-static const MemoryListener xen_memory_listener = {
-    .region_add = xen_region_add,
-    .region_del = xen_region_del,
-    .log_start = NULL,
-    .log_stop = NULL,
-    .log_sync = NULL,
-    .log_global_start = NULL,
-    .log_global_stop = NULL,
-    .priority = MEMORY_LISTENER_PRIORITY_ACCEL,
-};
-
-struct XenArmState {
-    /*< private >*/
-    MachineState parent;
-
-    XenIOState *state;
-
-    struct {
-        uint64_t tpm_base_addr;
-    } cfg;
-};
-
-static MemoryRegion ram_lo, ram_hi;
 
 /*
  * VIRTIO_MMIO_DEV_SIZE is imported from tools/libs/light/libxl_arm.c under Xen
@@ -57,147 +25,26 @@ static MemoryRegion ram_lo, ram_hi;
 #define NR_VIRTIO_MMIO_DEVICES   \
    (GUEST_VIRTIO_MMIO_SPI_LAST - GUEST_VIRTIO_MMIO_SPI_FIRST)
 
-static void xen_set_irq(void *opaque, int irq, int level)
-{
-    if (xendevicemodel_set_irq_level(xen_dmod, xen_domid, irq, level)) {
-        error_report("xendevicemodel_set_irq_level failed");
-    }
-}
-
-static void xen_create_virtio_mmio_devices(XenArmState *xam)
-{
-    int i;
-
-    for (i = 0; i < NR_VIRTIO_MMIO_DEVICES; i++) {
-        hwaddr base = GUEST_VIRTIO_MMIO_BASE + i * VIRTIO_MMIO_DEV_SIZE;
-        qemu_irq irq = qemu_allocate_irq(xen_set_irq, NULL,
-                                         GUEST_VIRTIO_MMIO_SPI_FIRST + i);
-
-        sysbus_create_simple("virtio-mmio", base, irq);
-
-        trace_xen_create_virtio_mmio_devices(i,
-                                             GUEST_VIRTIO_MMIO_SPI_FIRST + i,
-                                             base);
-    }
-}
-
-static void xen_init_ram(MachineState *machine)
+static void xen_arm_instance_init(Object *obj)
 {
-    MemoryRegion *sysmem = get_system_memory();
-    ram_addr_t block_len, ram_size[GUEST_RAM_BANKS];
-
-    trace_xen_init_ram(machine->ram_size);
-    if (machine->ram_size <= GUEST_RAM0_SIZE) {
-        ram_size[0] = machine->ram_size;
-        ram_size[1] = 0;
-        block_len = GUEST_RAM0_BASE + ram_size[0];
-    } else {
-        ram_size[0] = GUEST_RAM0_SIZE;
-        ram_size[1] = machine->ram_size - GUEST_RAM0_SIZE;
-        block_len = GUEST_RAM1_BASE + ram_size[1];
-    }
+    XenPVHMachineState *s = XEN_PVH_MACHINE(obj);
 
-    memory_region_init_ram(&xen_memory, NULL, "xen.ram", block_len,
-                           &error_fatal);
+    /* Default values.  */
+    s->cfg.ram_low = (MemMapEntry) { GUEST_RAM0_BASE, GUEST_RAM0_SIZE };
+    s->cfg.ram_high = (MemMapEntry) { GUEST_RAM1_BASE, GUEST_RAM1_SIZE };
 
-    memory_region_init_alias(&ram_lo, NULL, "xen.ram.lo", &xen_memory,
-                             GUEST_RAM0_BASE, ram_size[0]);
-    memory_region_add_subregion(sysmem, GUEST_RAM0_BASE, &ram_lo);
-    if (ram_size[1] > 0) {
-        memory_region_init_alias(&ram_hi, NULL, "xen.ram.hi", &xen_memory,
-                                 GUEST_RAM1_BASE, ram_size[1]);
-        memory_region_add_subregion(sysmem, GUEST_RAM1_BASE, &ram_hi);
-    }
-
-    /* Setup support for grants.  */
-    memory_region_init_ram(&xen_grants, NULL, "xen.grants", block_len,
-                           &error_fatal);
-    memory_region_add_subregion(sysmem, XEN_GRANT_ADDR_OFF, &xen_grants);
+    s->cfg.virtio_mmio_num = NR_VIRTIO_MMIO_DEVICES;
+    s->cfg.virtio_mmio_irq_base = GUEST_VIRTIO_MMIO_SPI_FIRST;
+    s->cfg.virtio_mmio = (MemMapEntry) { GUEST_VIRTIO_MMIO_BASE,
+                                         VIRTIO_MMIO_DEV_SIZE };
 }
 
-#ifdef CONFIG_TPM
-static void xen_enable_tpm(XenArmState *xam)
-{
-    Error *errp = NULL;
-    DeviceState *dev;
-    SysBusDevice *busdev;
-
-    TPMBackend *be = qemu_find_tpm_be("tpm0");
-    if (be == NULL) {
-        error_report("Couldn't find tmp0 backend");
-        return;
-    }
-    dev = qdev_new(TYPE_TPM_TIS_SYSBUS);
-    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp);
-    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);
-    busdev = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(busdev, &error_fatal);
-    sysbus_mmio_map(busdev, 0, xam->cfg.tpm_base_addr);
-
-    trace_xen_enable_tpm(xam->cfg.tpm_base_addr);
-}
-#endif
-
-static void xen_arm_init(MachineState *machine)
-{
-    XenArmState *xam = XEN_ARM(machine);
-
-    xam->state =  g_new0(XenIOState, 1);
-
-    if (machine->ram_size == 0) {
-        warn_report("%s: ram size not specified. QEMU machine started"
-                    " without IOREQ (no emulated devices including virtio)",
-                    MACHINE_CLASS(object_get_class(OBJECT(machine)))->desc);
-        return;
-    }
-
-    xen_init_ram(machine);
-
-    xen_register_ioreq(xam->state, machine->smp.max_cpus, &xen_memory_listener);
-
-    xen_create_virtio_mmio_devices(xam);
-
-#ifdef CONFIG_TPM
-    if (xam->cfg.tpm_base_addr) {
-        xen_enable_tpm(xam);
-    } else {
-        warn_report("tpm-base-addr is not provided. TPM will not be enabled");
-    }
-#endif
-}
-
-#ifdef CONFIG_TPM
-static void xen_arm_get_tpm_base_addr(Object *obj, Visitor *v,
-                                      const char *name, void *opaque,
-                                      Error **errp)
-{
-    XenArmState *xam = XEN_ARM(obj);
-    uint64_t value = xam->cfg.tpm_base_addr;
-
-    visit_type_uint64(v, name, &value, errp);
-}
-
-static void xen_arm_set_tpm_base_addr(Object *obj, Visitor *v,
-                                      const char *name, void *opaque,
-                                      Error **errp)
-{
-    XenArmState *xam = XEN_ARM(obj);
-    uint64_t value;
-
-    if (!visit_type_uint64(v, name, &value, errp)) {
-        return;
-    }
-
-    xam->cfg.tpm_base_addr = value;
-}
-#endif
-
 static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
 {
-
+    XenPVHMachineClass *xpc = XEN_PVH_MACHINE_CLASS(oc);
     MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Xen PVH ARM machine";
-    mc->init = xen_arm_init;
 
     /*
      * mc->max_cpus holds the MAX value allowed in the -smp command-line opts.
@@ -218,27 +65,20 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
      * mc->max_cpus, QEMU will bail out with an error message.
      */
     mc->max_cpus = GUEST_MAX_VCPUS;
-    mc->default_machine_opts = "accel=xen";
-    /* Set explicitly here to make sure that real ram_size is passed */
-    mc->default_ram_size = 0;
 
-#ifdef CONFIG_TPM
-    object_class_property_add(oc, "tpm-base-addr", "uint64_t",
-                              xen_arm_get_tpm_base_addr,
-                              xen_arm_set_tpm_base_addr,
-                              NULL, NULL);
-    object_class_property_set_description(oc, "tpm-base-addr",
-                                          "Set Base address for TPM device.");
+    /* List of supported features known to work on PVH ARM.  */
+    xpc->has_tpm = true;
+    xpc->has_virtio_mmio = true;
 
-    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
-#endif
+    xen_pvh_class_setup_common_props(xpc);
 }
 
 static const TypeInfo xen_arm_machine_type = {
     .name = TYPE_XEN_ARM,
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_XEN_PVH_MACHINE,
     .class_init = xen_arm_machine_class_init,
-    .instance_size = sizeof(XenArmState),
+    .instance_size = sizeof(XenPVHMachineState),
+    .instance_init = xen_arm_instance_init,
 };
 
 static void xen_arm_machine_register_types(void)
diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index d887fa9ba4..4a486e3673 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -15,6 +15,7 @@ xen_specific_ss = ss.source_set()
 xen_specific_ss.add(files(
   'xen-mapcache.c',
   'xen-hvm-common.c',
+  'xen-pvh-common.c',
 ))
 if have_xen_pci_passthrough
   xen_specific_ss.add(files(
diff --git a/hw/xen/trace-events b/hw/xen/trace-events
index d1b27f6c11..a07fe41c6d 100644
--- a/hw/xen/trace-events
+++ b/hw/xen/trace-events
@@ -64,6 +64,10 @@ destroy_hvm_domain_cannot_acquire_handle(void) "Cannot acquire xenctrl handle"
 destroy_hvm_domain_failed_action(const char *action, int sts, char *errno_s) "xc_domain_shutdown failed to issue %s, sts %d, %s"
 destroy_hvm_domain_action(int xen_domid, const char *action) "Issued domain %d %s"
 
+# xen-pvh-common.c
+xen_create_virtio_mmio_devices(int i, int irq, uint64_t base) "Created virtio-mmio device %d: irq %d base 0x%"PRIx64
+xen_enable_tpm(uint64_t addr) "Connected tpmdev at address 0x%"PRIx64
+
 # xen-mapcache.c
 xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
 xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
new file mode 100644
index 0000000000..880e8143d7
--- /dev/null
+++ b/hw/xen/xen-pvh-common.c
@@ -0,0 +1,275 @@
+/*
+ * QEMU Xen PVH machine - common code.
+ *
+ * Copyright (c) 2024 Advanced Micro Devices, Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "hw/boards.h"
+#include "hw/irq.h"
+#include "hw/sysbus.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/tpm.h"
+#include "sysemu/tpm_backend.h"
+#include "hw/xen/xen-pvh-common.h"
+#include "trace.h"
+
+static const MemoryListener xen_memory_listener = {
+    .region_add = xen_region_add,
+    .region_del = xen_region_del,
+    .log_start = NULL,
+    .log_stop = NULL,
+    .log_sync = NULL,
+    .log_global_start = NULL,
+    .log_global_stop = NULL,
+    .priority = MEMORY_LISTENER_PRIORITY_ACCEL,
+};
+
+static void xen_pvh_init_ram(XenPVHMachineState *s,
+                             MemoryRegion *sysmem)
+{
+    MachineState *ms = MACHINE(s);
+    ram_addr_t block_len, ram_size[2];
+
+    if (ms->ram_size <= s->cfg.ram_low.size) {
+        ram_size[0] = ms->ram_size;
+        ram_size[1] = 0;
+        block_len = s->cfg.ram_low.base + ram_size[0];
+    } else {
+        ram_size[0] = s->cfg.ram_low.size;
+        ram_size[1] = ms->ram_size - s->cfg.ram_low.size;
+        block_len = s->cfg.ram_high.base + ram_size[1];
+    }
+
+    memory_region_init_ram(&xen_memory, NULL, "xen.ram", block_len,
+                           &error_fatal);
+
+    memory_region_init_alias(&s->ram.low, NULL, "xen.ram.lo", &xen_memory,
+                             s->cfg.ram_low.base, ram_size[0]);
+    memory_region_add_subregion(sysmem, s->cfg.ram_low.base, &s->ram.low);
+    if (ram_size[1] > 0) {
+        memory_region_init_alias(&s->ram.high, NULL, "xen.ram.hi", &xen_memory,
+                                 s->cfg.ram_high.base, ram_size[1]);
+        memory_region_add_subregion(sysmem, s->cfg.ram_high.base, &s->ram.high);
+    }
+
+    /* Setup support for grants.  */
+    memory_region_init_ram(&xen_grants, NULL, "xen.grants", block_len,
+                           &error_fatal);
+    memory_region_add_subregion(sysmem, XEN_GRANT_ADDR_OFF, &xen_grants);
+}
+
+static void xen_set_irq(void *opaque, int irq, int level)
+{
+    if (xendevicemodel_set_irq_level(xen_dmod, xen_domid, irq, level)) {
+        error_report("xendevicemodel_set_irq_level failed");
+    }
+}
+
+static void xen_create_virtio_mmio_devices(XenPVHMachineState *s)
+{
+    int i;
+
+    for (i = 0; i < s->cfg.virtio_mmio_num; i++) {
+        hwaddr base = s->cfg.virtio_mmio.base + i * s->cfg.virtio_mmio.size;
+        qemu_irq irq = qemu_allocate_irq(xen_set_irq, NULL,
+                                         s->cfg.virtio_mmio_irq_base + i);
+
+        sysbus_create_simple("virtio-mmio", base, irq);
+
+        trace_xen_create_virtio_mmio_devices(i,
+                                             s->cfg.virtio_mmio_irq_base + i,
+                                             base);
+    }
+}
+
+#ifdef CONFIG_TPM
+static void xen_enable_tpm(XenPVHMachineState *s)
+{
+    Error *errp = NULL;
+    DeviceState *dev;
+    SysBusDevice *busdev;
+
+    TPMBackend *be = qemu_find_tpm_be("tpm0");
+    if (be == NULL) {
+        error_report("Couldn't find tmp0 backend");
+        return;
+    }
+    dev = qdev_new(TYPE_TPM_TIS_SYSBUS);
+    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp);
+    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);
+    busdev = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(busdev, &error_fatal);
+    sysbus_mmio_map(busdev, 0, s->cfg.tpm.base);
+
+    trace_xen_enable_tpm(s->cfg.tpm.base);
+}
+#endif
+
+static void xen_pvh_init(MachineState *ms)
+{
+    XenPVHMachineState *s = XEN_PVH_MACHINE(ms);
+    XenPVHMachineClass *xpc = XEN_PVH_MACHINE_GET_CLASS(s);
+    MemoryRegion *sysmem = get_system_memory();
+
+    if (ms->ram_size == 0) {
+        warn_report("%s: ram size not specified. QEMU machine started"
+                    " without IOREQ (no emulated devices including virtio)",
+                    MACHINE_CLASS(object_get_class(OBJECT(ms)))->desc);
+        return;
+    }
+
+    xen_pvh_init_ram(s, sysmem);
+    xen_register_ioreq(&s->ioreq, ms->smp.max_cpus, &xen_memory_listener);
+
+    if (s->cfg.virtio_mmio_num) {
+        xen_create_virtio_mmio_devices(s);
+    }
+
+#ifdef CONFIG_TPM
+    if (xpc->has_tpm) {
+        if (s->cfg.tpm.base) {
+            xen_enable_tpm(s);
+        } else {
+            warn_report("tpm-base-addr is not set. TPM will not be enabled");
+        }
+    }
+#endif
+
+    /* Call the implementation specific init.  */
+    if (xpc->init) {
+        xpc->init(ms);
+    }
+}
+
+#define XEN_PVH_PROP_MEMMAP_SETTER(n, f)                                   \
+static void xen_pvh_set_ ## n ## _ ## f(Object *obj, Visitor *v,           \
+                                       const char *name, void *opaque,     \
+                                       Error **errp)                       \
+{                                                                          \
+    XenPVHMachineState *xp = XEN_PVH_MACHINE(obj);                         \
+    uint64_t value;                                                        \
+                                                                           \
+    if (!visit_type_size(v, name, &value, errp)) {                         \
+        return;                                                            \
+    }                                                                      \
+    xp->cfg.n.f = value;                                                   \
+}
+
+#define XEN_PVH_PROP_MEMMAP_GETTER(n, f)                                   \
+static void xen_pvh_get_ ## n ## _ ## f(Object *obj, Visitor *v,           \
+                                       const char *name, void *opaque,     \
+                                       Error **errp)                       \
+{                                                                          \
+    XenPVHMachineState *xp = XEN_PVH_MACHINE(obj);                         \
+    uint64_t value = xp->cfg.n.f;                                          \
+                                                                           \
+    visit_type_uint64(v, name, &value, errp);                              \
+}
+
+#define XEN_PVH_PROP_MEMMAP_BASE(n)        \
+    XEN_PVH_PROP_MEMMAP_SETTER(n, base)    \
+    XEN_PVH_PROP_MEMMAP_GETTER(n, base)    \
+
+#define XEN_PVH_PROP_MEMMAP_SIZE(n)        \
+    XEN_PVH_PROP_MEMMAP_SETTER(n, size)    \
+    XEN_PVH_PROP_MEMMAP_GETTER(n, size)
+
+#define XEN_PVH_PROP_MEMMAP(n)             \
+    XEN_PVH_PROP_MEMMAP_BASE(n)            \
+    XEN_PVH_PROP_MEMMAP_SIZE(n)
+
+XEN_PVH_PROP_MEMMAP(ram_low)
+XEN_PVH_PROP_MEMMAP(ram_high)
+/* TPM only has a base-addr option.  */
+XEN_PVH_PROP_MEMMAP_BASE(tpm)
+XEN_PVH_PROP_MEMMAP(virtio_mmio)
+
+void xen_pvh_class_setup_common_props(XenPVHMachineClass *xpc)
+{
+    ObjectClass *oc = OBJECT_CLASS(xpc);
+    MachineClass *mc = MACHINE_CLASS(xpc);
+
+#define OC_MEMMAP_PROP_BASE(c, prop_name, name)                           \
+do {                                                                      \
+    object_class_property_add(c, prop_name "-base", "uint64_t",           \
+                              xen_pvh_get_ ## name ## _base,              \
+                              xen_pvh_set_ ## name ## _base, NULL, NULL); \
+    object_class_property_set_description(oc, prop_name "-base",          \
+                              "Set base address for " prop_name);         \
+} while (0)
+
+#define OC_MEMMAP_PROP_SIZE(c, prop_name, name)                           \
+do {                                                                      \
+    object_class_property_add(c, prop_name "-size", "uint64_t",           \
+                              xen_pvh_get_ ## name ## _size,              \
+                              xen_pvh_set_ ## name ## _size, NULL, NULL); \
+    object_class_property_set_description(oc, prop_name "-size",          \
+                              "Set memory range size for " prop_name);    \
+} while (0)
+
+#define OC_MEMMAP_PROP(c, prop_name, name)                                \
+do {                                                                      \
+        OC_MEMMAP_PROP_BASE(c, prop_name, name);                          \
+        OC_MEMMAP_PROP_SIZE(c, prop_name, name);                          \
+} while (0)
+
+    /*
+     * We provide memmap properties to allow Xen to move things to other
+     * addresses for example when users need to accomodate the memory-map
+     * for 1:1 mapped devices/memory.
+     */
+    OC_MEMMAP_PROP(oc, "ram-low", ram_low);
+    OC_MEMMAP_PROP(oc, "ram-high", ram_high);
+
+    if (xpc->has_virtio_mmio) {
+        OC_MEMMAP_PROP(oc, "virtio-mmio", virtio_mmio);
+    }
+
+#ifdef CONFIG_TPM
+    if (xpc->has_tpm) {
+        object_class_property_add(oc, "tpm-base-addr", "uint64_t",
+                                  xen_pvh_get_tpm_base,
+                                  xen_pvh_set_tpm_base,
+                                  NULL, NULL);
+        object_class_property_set_description(oc, "tpm-base-addr",
+                                  "Set Base address for TPM device.");
+
+        machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
+    }
+#endif
+}
+
+static void xen_pvh_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->init = xen_pvh_init;
+
+    mc->desc = "Xen PVH machine";
+    mc->max_cpus = 1;
+    mc->default_machine_opts = "accel=xen";
+    /* Set to zero to make sure that the real ram size is passed. */
+    mc->default_ram_size = 0;
+}
+
+static const TypeInfo xen_pvh_info = {
+    .name = TYPE_XEN_PVH_MACHINE,
+    .parent = TYPE_MACHINE,
+    .abstract = true,
+    .instance_size = sizeof(XenPVHMachineState),
+    .class_size = sizeof(XenPVHMachineClass),
+    .class_init = xen_pvh_class_init,
+};
+
+static void xen_pvh_register_types(void)
+{
+    type_register_static(&xen_pvh_info);
+}
+
+type_init(xen_pvh_register_types);
diff --git a/include/hw/xen/xen-pvh-common.h b/include/hw/xen/xen-pvh-common.h
new file mode 100644
index 0000000000..77fd98b9fe
--- /dev/null
+++ b/include/hw/xen/xen-pvh-common.h
@@ -0,0 +1,59 @@
+/*
+ * QEMU Xen PVH machine - common code.
+ *
+ * Copyright (c) 2024 Advanced Micro Devices, Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef XEN_PVH_COMMON_H__
+#define XEN_PVH_COMMON_H__
+
+#include <assert.h>
+#include "hw/sysbus.h"
+#include "hw/hw.h"
+#include "hw/xen/xen-hvm-common.h"
+#include "hw/pci-host/gpex.h"
+
+#define TYPE_XEN_PVH_MACHINE MACHINE_TYPE_NAME("xen-pvh-base")
+OBJECT_DECLARE_TYPE(XenPVHMachineState, XenPVHMachineClass,
+                    XEN_PVH_MACHINE)
+
+struct XenPVHMachineClass {
+    MachineClass parent;
+
+    /* PVH implementation specific init.  */
+    void (*init)(MachineState *state);
+
+    /*
+     * Each implementation can optionally enable features that it
+     * supports and are known to work.
+     */
+    bool has_tpm;
+    bool has_virtio_mmio;
+};
+
+struct XenPVHMachineState {
+    /*< private >*/
+    MachineState parent;
+
+    XenIOState ioreq;
+
+    struct {
+        MemoryRegion low;
+        MemoryRegion high;
+    } ram;
+
+    struct {
+        MemMapEntry ram_low, ram_high;
+        MemMapEntry tpm;
+
+        /* Virtio-mmio */
+        MemMapEntry virtio_mmio;
+        uint32_t virtio_mmio_num;
+        uint32_t virtio_mmio_irq_base;
+    } cfg;
+};
+
+void xen_pvh_class_setup_common_props(XenPVHMachineClass *xpc);
+#endif
-- 
2.43.0
