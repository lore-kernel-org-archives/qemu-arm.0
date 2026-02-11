Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E917E9E309
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Feb 2026 13:47:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqAYv-00073Z-VF; Wed, 11 Feb 2026 08:47:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mbawa@redhat.com>) id 1vq9LQ-0006go-EY
 for qemu-arm@nongnu.org; Wed, 11 Feb 2026 07:29:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mbawa@redhat.com>) id 1vq9LO-0008Mu-O2
 for qemu-arm@nongnu.org; Wed, 11 Feb 2026 07:29:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770812961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Bfo71XqCSKmxPUviffHaEkHQ6i/xi5Ji/h2hsH26RrU=;
 b=PMuF6izqmleKv3RBFcIAkWNSt6VbRNi1kkb0rBpsCZON3S1761+Vy449jDOOPODvvdbIKp
 k3KIXspNoa1tlmLRYhzi9OxQVJOtC9jd5DzQCYZA/0/XcJ+9zO1g0G7gzcPgFK2rBdTuij
 avOfXB4DiXrJURJ0BLSHuE/Ye6+YhSU=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-wQ89PMKvNtWSIX1IYPFnmA-1; Wed, 11 Feb 2026 07:28:14 -0500
X-MC-Unique: wQ89PMKvNtWSIX1IYPFnmA-1
X-Mimecast-MFC-AGG-ID: wQ89PMKvNtWSIX1IYPFnmA_1770812894
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-35464d7c539so5237185a91.0
 for <qemu-arm@nongnu.org>; Wed, 11 Feb 2026 04:28:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770812893; x=1771417693;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bfo71XqCSKmxPUviffHaEkHQ6i/xi5Ji/h2hsH26RrU=;
 b=Hg/HECiQEYuHEFXDwsQaODQJ/BX8Vvw9sfg3v4iEozLoGIcb3S7M1xQc1dCeomk99l
 XtOQ2OAaNtvC8dqRLHEfAfnK7AS4prkYSMS/ccxs/PA7vH9/yY1RG+rIhp/yt2fa6QFF
 flUn1YNjutZtPzwcwasUr3Q7Z3G5puU4yTjASarH7re4BuEhnYLM0SmkZlWk6UVMsgw4
 CEndc4KYHPfrewT2nWqLJIUCAQsVNlnQggEIza1YL6UPwpYaDw5S5Qr7PLowj+yIStln
 P5trEOA8Wbbv8Z4DcC+DwILZwCY/AIuZ80pnh67igWRIzmtcC5FxQPmXKBr9F+7MCqsU
 sTKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeCvvibxNXe1L6ipAFlos7vUqUa+zmgSm7/fJaed62MYS59mziaby8bOi2DBMlp0+xnchk2+DvYg==@nongnu.org
X-Gm-Message-State: AOJu0Yyxhkl+kHHWNiN1xaNc+aK5USlrAK5rxNCtHFTfo/2iY/zfQhii
 H2takSBXqoh8CJdclrI55HOnvyBiOrS2iSlh+TcXxLlGjNrBriQ3+1UlVXQiBy5ijUPRtMI1wKc
 Llwj6RByMkhcn8r9JaWbYp+O24d4+DtiBNqxC0c4O0/ChMjXasB4ZRA==
X-Gm-Gg: AZuq6aI7ZRHVOuzr03ddNnsTqi4cWAJG/3T2YNjycWHmJtH5u/KRo9Rn125IasnNcjS
 dRmAHamb09D+Dtu0Bwj51YiVcfJu//hk0tev7MmnS464kzECUA8jzXTe2mfQDWbDxePla99VJoa
 II166kHr3NsvDNQnbZHZGb0NqqFEQvMKRilytCyZG/LurP7vHiZ6ocC6OsyDdx+KJQE0dl7ha5X
 Z8ocv7lDJhbCo66ir88H6LlShKQ7FzDoOuM8PsJtAwMydDrRgynK5PxAO1EQAAOTR9rRh4CHDsf
 zmU0WVtGZXDDM8ULZT3cble/lwHdmWeZwBxHB12epqf+KWS0mQ3IAmEtSk+0E6yljtgyOd92YQ+
 nNulwmCwrOW5UWH4pSaUkRvTiGRQ/6jj94mD4rGXfZAitAQo=
X-Received: by 2002:a17:90b:4c0c:b0:34a:8c77:d37b with SMTP id
 98e67ed59e1d1-3567afb221bmr2753543a91.16.1770812893636; 
 Wed, 11 Feb 2026 04:28:13 -0800 (PST)
X-Received: by 2002:a17:90b:4c0c:b0:34a:8c77:d37b with SMTP id
 98e67ed59e1d1-3567afb221bmr2753516a91.16.1770812893191; 
 Wed, 11 Feb 2026 04:28:13 -0800 (PST)
Received: from mbawa-thinkpadt14gen5.bengluru.csb
 ([2406:7400:51:e13a:21f1:8c60:5b7:96f5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8249e81976dsm2443786b3a.52.2026.02.11.04.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 04:28:12 -0800 (PST)
From: Mohammadfaiz Bawa <mbawa@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 alex.bennee@linaro.org, philmd@linaro.org
Cc: cohuck@redhat.com,
	eric.auger@redhat.com,
	sebott@redhat.com
Subject: [PATCH] hw/arm/virt: Add virtio-transports property
Date: Wed, 11 Feb 2026 17:57:59 +0530
Message-ID: <20260211122759.125094-1-mbawa@redhat.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 976xLHrsy27uwYnVG0uNcVb5GqjpmK4zsIAqP-l4Wuk_1770812894
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mbawa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 11 Feb 2026 08:47:18 -0500
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

Windows ARM64 guests detect virtio-mmio devices declared in ACPI
tables even when no backend is attached. This causes "Unknown
devices" (ACPI\LNRO0005) to appear in Device Manager.

Until Windows fixes that by supporting, adding a new machine
property 'virtio-transports' to control the number of
virtio-mmio transports instantiated. The default remains
NUM_VIRTIO_TRANSPORTS (32) for backward compatibility.
Setting it to 0 allows users to disable virtio-mmio entirely.

Usage: -machine virt,virtio-transports=0

Signed-off-by: Mohammadfaiz Bawa <mbawa@redhat.com>
---
 hw/arm/virt-acpi-build.c |  2 +-
 hw/arm/virt.c            | 43 ++++++++++++++++++++++++++++++++++++++--
 include/hw/arm/virt.h    |  1 +
 3 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index c145678185..27c007fd62 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -1150,7 +1150,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     fw_cfg_acpi_dsdt_add(scope, &memmap[VIRT_FW_CFG]);
     virtio_acpi_dsdt_add(scope, memmap[VIRT_MMIO].base, memmap[VIRT_MMIO].size,
                          (irqmap[VIRT_MMIO] + ARM_SPI_BASE),
-                         0, NUM_VIRTIO_TRANSPORTS);
+                         0, vms->virtio_transports);
     acpi_dsdt_add_pci(scope, memmap, irqmap[VIRT_PCIE] + ARM_SPI_BASE, vms);
     if (vms->acpi_dev) {
         build_ged_aml(scope, "\\_SB."GED_DEVICE,
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 390845c503..0a659ba540 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1206,7 +1206,7 @@ static void create_virtio_devices(const VirtMachineState *vms)
      * between kernel versions). For reliable and stable identification
      * of disks users must use UUIDs or similar mechanisms.
      */
-    for (i = 0; i < NUM_VIRTIO_TRANSPORTS; i++) {
+    for (i = 0; i < vms->virtio_transports; i++) {
         int irq = vms->irqmap[VIRT_MMIO] + i;
         hwaddr base = vms->memmap[VIRT_MMIO].base + i * size;
 
@@ -1221,7 +1221,7 @@ static void create_virtio_devices(const VirtMachineState *vms)
      * loop influences virtio device to virtio transport assignment, whereas
      * this loop controls how virtio transports are laid out in the dtb.
      */
-    for (i = NUM_VIRTIO_TRANSPORTS - 1; i >= 0; i--) {
+    for (i = vms->virtio_transports - 1; i >= 0; i--) {
         char *nodename;
         int irq = vms->irqmap[VIRT_MMIO] + i;
         hwaddr base = vms->memmap[VIRT_MMIO].base + i * size;
@@ -2705,6 +2705,36 @@ static void virt_set_highmem_mmio_size(Object *obj, Visitor *v,
     extended_memmap[VIRT_HIGH_PCIE_MMIO].size = size;
 }
 
+static void virt_get_virtio_transports(Object *obj, Visitor *v,
+                                       const char *name, void *opaque,
+                                       Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+    uint8_t transports = vms->virtio_transports;
+
+    visit_type_uint8(v, name, &transports, errp);
+}
+
+static void virt_set_virtio_transports(Object *obj, Visitor *v,
+                                       const char *name, void *opaque,
+                                       Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+    uint8_t transports;
+
+    if (!visit_type_uint8(v, name, &transports, errp)) {
+        return;
+    }
+
+    if (transports > NUM_VIRTIO_TRANSPORTS) {
+        error_setg(errp, "virtio-transports must not exceed %d",
+                   NUM_VIRTIO_TRANSPORTS);
+        return;
+    }
+
+    vms->virtio_transports = transports;
+}
+
 static bool virt_get_its(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -3427,6 +3457,13 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
                                           "Set the high memory region size "
                                           "for PCI MMIO");
 
+    object_class_property_add(oc, "virtio-transports", "uint8",
+                                   virt_get_virtio_transports,
+                                   virt_set_virtio_transports,
+                                   NULL, NULL);
+    object_class_property_set_description(oc, "virtio-transports",
+                                          "Set the number of virtio-mmio transports to instantiate");
+
     object_class_property_add_str(oc, "gic-version", virt_get_gic_version,
                                   virt_set_gic_version);
     object_class_property_set_description(oc, "gic-version",
@@ -3540,6 +3577,8 @@ static void virt_instance_init(Object *obj)
 
     vms->irqmap = a15irqmap;
 
+    vms->virtio_transports = NUM_VIRTIO_TRANSPORTS;
+
     virt_flash_create(vms);
 
     vms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 3b382bdf49..f898afaa6e 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -169,6 +169,7 @@ struct VirtMachineState {
     uint32_t msi_phandle;
     uint32_t iommu_phandle;
     int psci_conduit;
+    uint8_t virtio_transports;
     hwaddr highest_gpa;
     DeviceState *gic;
     DeviceState *acpi_dev;
-- 
2.53.0


