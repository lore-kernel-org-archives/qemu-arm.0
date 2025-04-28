Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5871894njd;
        Mon, 28 Apr 2025 03:31:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU6T0YkosUvRibKAFwolDONJuez7UlV/AfDrcLJSlJIUgP8CHQSsncL21TYu4ltFtlTRlFEi/k3nJKmZQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHnAKgKR10e4BvwUa9M62pWpezgYpUR3ho0UZRstCrOjpfcy1r1HafDmo67mxsBZE8OiRBB
X-Received: by 2002:a05:620a:2710:b0:7c5:3ef2:8c40 with SMTP id af79cd13be357-7c96685c2aamr1319900285a.12.1745836301860;
        Mon, 28 Apr 2025 03:31:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745836301; cv=none;
        d=google.com; s=arc-20240605;
        b=LK7+y1hSF7U2mRhiIHRtEmJQU8VQe6IWZNeneabe6XGYPfhipsiKI84D7sY6Ukk+vd
         RtnMIW5Xot7fElpJdyDD8LGCZac1cHax24v7VDSYLB81DlBh52lla28YyLCseQirSgtZ
         2K0nTvY0p1y6E+nRjHAyIG0zp2Znyc6XrJIFCB7dNHVsfj/Sm1oJ006tMlS8u5cHW3le
         /HEZ90UpEpfRUSFyGb4lMYaKoEAjRXyyX4+C8AziFCPiMm1uRqFZ5tHEQczH397sasHx
         3f+0SmnJko48tmud7+MHt8ZBvi0Pd4Nwgcw+HFkWgdUMU3pzcyoEw39Ui3YODJTOZCCY
         DNFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oecAaZTuaAEeNI6Op2mn9gHfBukTJUjdImla9AWMhx0=;
        fh=+sxB8NkS+xL+1QwPgIVnaMhN8Q9GX11v/uLdEosqQQA=;
        b=SYNvoOeHpgkmEkJbtcOwgM6fM+YAT+UElHW2Klfh35R7giVOWnKBVmGE6jDm4CxKKD
         kSig7wLaGLRcvUhEVRpBHqHH/ygFV2Houn/uaRwLFDHdDB6hL9jVeJAcMAla7lmH5SD8
         GoSZAs1FvLeXKkVw8wUQGM7rIDtubFi5LAxUyyutsnqSYDTwJrnlPyTwD+uYsrZCVGTk
         LOjuaQisBOTO5GjH+Kvp5Z4yOAe36L066bTEEw2B9BQR9tGLfqgJJ2tmhdSBTfJucVJi
         mpX/0gH7l1hgcHMjSNL8/lUKsjJmwqkISWtK7roes8cqeJJw61aURspbS8nYt2/AtAXv
         aLug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LS05nLsY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c958d8612csi951204885a.246.2025.04.28.03.31.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Apr 2025 03:31:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LS05nLsY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u9Ljt-0003tM-A1; Mon, 28 Apr 2025 06:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u9Lj6-00014z-MS
 for qemu-arm@nongnu.org; Mon, 28 Apr 2025 06:28:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u9Lj2-0003W7-Ki
 for qemu-arm@nongnu.org; Mon, 28 Apr 2025 06:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745836105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oecAaZTuaAEeNI6Op2mn9gHfBukTJUjdImla9AWMhx0=;
 b=LS05nLsYN7oyCcwwzhyM+rMWRZ1dSfDZxMSbP5B5lkVShA+xISqki8qITWnQqj/5VB6ill
 vER+1dLY331A/XAnSO0E/uVio/sOFp1QR7wjB2taFEFOxTFOXtsew0IqCw6icgKENQRAnN
 Gxrm3mdczCmm65mHT2+RqmHRZuJeS0M=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-304-jG8hEmhsMWKe7Vpv4T7xKA-1; Mon,
 28 Apr 2025 06:28:21 -0400
X-MC-Unique: jG8hEmhsMWKe7Vpv4T7xKA-1
X-Mimecast-MFC-AGG-ID: jG8hEmhsMWKe7Vpv4T7xKA_1745836100
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3AD3618001D5; Mon, 28 Apr 2025 10:28:20 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.14])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C9A12180045C; Mon, 28 Apr 2025 10:28:15 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com
Subject: [RFC 22/24] hw/arm/virt: Let virt support pci hotplug/unplug GED event
Date: Mon, 28 Apr 2025 12:25:48 +0200
Message-ID: <20250428102628.378046-23-eric.auger@redhat.com>
In-Reply-To: <20250428102628.378046-1-eric.auger@redhat.com>
References: <20250428102628.378046-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.492,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 6n62iz80AKgq

Set up the IO registers used to communicate between QEMU
and ACPI.

Move the create_pcie() call after the creation of the acpi
ged device since pcie coldplug will soon require the acpi pcihp
resources allocated and reset during the ged initialization.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/arm/virt.h    |  1 +
 hw/arm/virt-acpi-build.c |  1 +
 hw/arm/virt.c            | 35 ++++++++++++++++++++++++++++++-----
 3 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index b8ca753644..6a6a8be3ff 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -35,6 +35,7 @@
 #include "hw/boards.h"
 #include "hw/arm/boot.h"
 #include "hw/arm/bsa.h"
+#include "hw/acpi/pcihp.h"
 #include "hw/block/flash.h"
 #include "system/kvm.h"
 #include "hw/intc/arm_gicv3_common.h"
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 7bee57d489..fce3ab9417 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -44,6 +44,7 @@
 #include "hw/acpi/generic_event_device.h"
 #include "hw/acpi/tpm.h"
 #include "hw/acpi/hmat.h"
+#include "hw/acpi/pcihp.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 2790853927..aaee5443bb 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -687,6 +687,8 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
 {
     DeviceState *dev;
     MachineState *ms = MACHINE(vms);
+    SysBusDevice *sbdev;
+
     int irq = vms->irqmap[VIRT_ACPI_GED];
     uint32_t event = ACPI_GED_PWR_DOWN_EVT;
 
@@ -698,12 +700,28 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
         event |= ACPI_GED_NVDIMM_HOTPLUG_EVT;
     }
 
+    if (vms->acpi_pcihp) {
+        event |= ACPI_GED_PCI_HOTPLUG_EVT;
+    }
+
     dev = qdev_new(TYPE_ACPI_GED);
     qdev_prop_set_uint32(dev, "ged-event", event);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sbdev = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(sbdev, &error_fatal);
 
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_ACPI_GED].base);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, vms->memmap[VIRT_PCDIMM_ACPI].base);
+    sysbus_mmio_map(sbdev, 0, vms->memmap[VIRT_ACPI_GED].base);
+    sysbus_mmio_map(sbdev, 1, vms->memmap[VIRT_PCDIMM_ACPI].base);
+    if (vms->acpi_pcihp) {
+        AcpiGedState *acpi_ged_state = ACPI_GED(dev);
+        int i;
+
+        i = sysbus_mmio_map_name(sbdev, "pcihp container",
+                                 vms->memmap[VIRT_ACPI_PCIHP].base);
+        assert(i >= 0);
+        acpi_pcihp_init(OBJECT(dev), &acpi_ged_state->pcihp_state,
+                        vms->bus, sysbus_mmio_get_region(sbdev, i), 0);
+        acpi_ged_state->pcihp_state.use_acpi_hotplug_bridge = true;
+    }
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, qdev_get_gpio_in(vms->gic, irq));
 
     return dev;
@@ -1765,6 +1783,13 @@ void virt_machine_done(Notifier *notifier, void *data)
     pci_bus_add_fw_cfg_extra_pci_roots(vms->fw_cfg, vms->bus,
                                        &error_abort);
 
+
+    if (vms->acpi_pcihp) {
+        AcpiGedState *acpi_ged_state = ACPI_GED(vms->acpi_dev);
+
+        acpi_pcihp_reset(&acpi_ged_state->pcihp_state);
+    }
+
     virt_acpi_setup(vms);
     virt_build_smbios(vms);
 }
@@ -2412,8 +2437,6 @@ static void machvirt_init(MachineState *machine)
 
     create_rtc(vms);
 
-    create_pcie(vms);
-
     if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
         vms->acpi_pcihp &= !vmc->no_acpi_pcihp;
         vms->acpi_dev = create_acpi_ged(vms);
@@ -2422,6 +2445,8 @@ static void machvirt_init(MachineState *machine)
         create_gpio_devices(vms, VIRT_GPIO, sysmem);
     }
 
+    create_pcie(vms);
+
     if (vms->secure && !vmc->no_secure_gpio) {
         create_gpio_devices(vms, VIRT_SECURE_GPIO, secure_sysmem);
     }
-- 
2.49.0

