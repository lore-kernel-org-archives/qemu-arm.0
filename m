Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp1281880dyb;
        Wed, 25 Jun 2025 20:46:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUjv2tlkMFUulBuCSbtEMFPblczs9ir/097mwG5D/bTFraSWIBmtGSx6Qo7L9wj7+BMgtyPsp22cNExRA==@linaro.org
X-Google-Smtp-Source: AGHT+IHf1z6Cj2Mu6BrV3UZ0QZyxPZSJ6nwPY8tn2Tc11JLTKH8JNNa1BBBF9rDrX1QK03bNGMjQ
X-Received: by 2002:a05:622a:586:b0:4a1:3c6c:cda2 with SMTP id d75a77b69052e-4a7c05f56eemr88126151cf.1.1750909574635;
        Wed, 25 Jun 2025 20:46:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750909574; cv=none;
        d=google.com; s=arc-20240605;
        b=RHl5h3zs6rmrfSWZgQk2AjFhoSKJNyPbJNeEY5TNi0O4aDvTisWWziH6eVP1LG7gie
         XZkTVMRhvASlSIA7JHQXoSO8OH70/o0fimiWcAXaqokS6uvj1Jdq+Qd8dLhM6y4FbFbj
         77CLwtqFwrYbaOzSplXvubr/6z/3h5vJcEYe+660jRh3dnHISyPSVfsHVW+7bshLAI84
         gLC4mvB28yViyq16QmVjoD0HOOZVgVjyUVgAuRiR643DlV7dhOJ9Cp/NAZ/7Q8r3jxBu
         j4a6nPhqiI77qNqJ7EaBreWO3cIgPBFJQJQMG81cdiVntH0nNCFUjM5E/v+or4QU+b49
         5/gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6UzzW9v6MprnCdRczOX8R6e+0JAbz2wn/sGSVphEdkU=;
        fh=kJp5zm8Mfs6U4zxdDWQRDwjEAch+t3G7kKIHh+4Vd5k=;
        b=CPTlH/pHfjZw1LwUQAO7RKLeIfmcL2PbMtj+KISkA+fspuQoncrOY9l1c6SBJWazx9
         hkRRwfjOwbGGV4uwTfHHi3G+9e2lz5I0uVtUBw2WD+4+/vBB1Uc+9Guo+ErF6pEI88k+
         g+50EP+l8MErMSSmOOFA52V38omAu++nwy47myP3AVhNKjoQWcGa3Vw/6Pb6i/ZPglhf
         DMQFlJLhL82g8YpYax/rdFtooyue9U4A6BDXND9OrdYLpXzSpZjujm1z4rT5j70O8dKF
         1HRwB5NjgwpKLfcacwwmcwimwe3SttxqsfgJatKOmPcUdFDIod0xjA4/M3qD4Kta+TMG
         QJ/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UL1r2BSW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a779d48e3bsi143747111cf.129.2025.06.25.20.46.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Jun 2025 20:46:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UL1r2BSW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uUdYk-00012Z-C2; Wed, 25 Jun 2025 23:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uUdYi-000123-HU
 for qemu-arm@nongnu.org; Wed, 25 Jun 2025 23:45:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uUdYg-00081i-LL
 for qemu-arm@nongnu.org; Wed, 25 Jun 2025 23:45:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750909546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6UzzW9v6MprnCdRczOX8R6e+0JAbz2wn/sGSVphEdkU=;
 b=UL1r2BSWc6c1/kn1zvgGdSohMmm2hL0m6M7m7xUzYCv2X0rZ9xbqzJbd4u2KGsRcvHXaQh
 ZUCtHh/IV2LWRAC7uyYIgu6qSXECBo9JAy7eOctzWPWhq5hv3XUdy5Th4isr/4SfA6Hn+O
 8IJYBjqijPMHyQdriVl3IpcGn6lc8ps=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-8-U6T9dA3QMjO6p3J4iAcSKg-1; Wed,
 25 Jun 2025 23:45:43 -0400
X-MC-Unique: U6T9dA3QMjO6p3J4iAcSKg-1
X-Mimecast-MFC-AGG-ID: U6T9dA3QMjO6p3J4iAcSKg_1750909542
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 041691956086; Thu, 26 Jun 2025 03:45:42 +0000 (UTC)
Received: from virt-mtcollins-01.lab.eng.rdu2.redhat.com
 (virt-mtcollins-01.lab.eng.rdu2.redhat.com [10.8.1.196])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 09B6E1956096; Thu, 26 Jun 2025 03:45:39 +0000 (UTC)
From: Shaoqin Huang <shahuang@redhat.com>
To: qemu-arm@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Auger <eauger@redhat.com>,
 Shaoqin Huang <shahuang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v5 2/2] hw/i386: Add the ramfb romfile compatibility
Date: Wed, 25 Jun 2025 23:45:26 -0400
Message-Id: <20250626034526.2136585-3-shahuang@redhat.com>
In-Reply-To: <20250626034526.2136585-1-shahuang@redhat.com>
References: <20250626034526.2136585-1-shahuang@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=shahuang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: hBKoX4D0q27V

Set the "use-legacy-x86-rom" property to false by default, and only set
it to true on x86 since only x86 will need it.

Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
---
 hw/display/ramfb-standalone.c |  2 +-
 hw/i386/pc_piix.c             | 10 ++++++++++
 hw/i386/pc_q35.c              |  3 +++
 hw/vfio/pci.c                 |  2 +-
 4 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb-standalone.c
index af1175bf96..ddbf42f181 100644
--- a/hw/display/ramfb-standalone.c
+++ b/hw/display/ramfb-standalone.c
@@ -63,7 +63,7 @@ static const VMStateDescription ramfb_dev_vmstate = {
 
 static const Property ramfb_properties[] = {
     DEFINE_PROP_BOOL("x-migrate", RAMFBStandaloneState, migrate,  true),
-    DEFINE_PROP_BOOL("use-legacy-x86-rom", RAMFBStandaloneState, use_legacy_x86_rom, true),
+    DEFINE_PROP_BOOL("use-legacy-x86-rom", RAMFBStandaloneState, use_legacy_x86_rom, false),
 };
 
 static void ramfb_class_initfn(ObjectClass *klass, void *data)
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 6c91e2d292..4a8bbc0e28 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -49,6 +49,7 @@
 #include "hw/i2c/smbus_eeprom.h"
 #include "exec/memory.h"
 #include "hw/acpi/acpi.h"
+#include "hw/vfio/pci.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "system/xen.h"
@@ -77,6 +78,13 @@ static const int ide_iobase2[MAX_IDE_BUS] = { 0x3f6, 0x376 };
 static const int ide_irq[MAX_IDE_BUS] = { 14, 15 };
 #endif
 
+static GlobalProperty pc_piix_compat_defaults[] = {
+    { TYPE_RAMFB_DEVICE, "use-legacy-x86-rom", "true" },
+    { TYPE_VFIO_PCI, "use-legacy-x86-rom", "true" },
+};
+static const size_t pc_piix_compat_defaults_len =
+    G_N_ELEMENTS(pc_piix_compat_defaults);
+
 /*
  * Return the global irq number corresponding to a given device irq
  * pin. We could also use the bus number to have a more precise mapping.
@@ -477,6 +485,8 @@ static void pc_i440fx_machine_options(MachineClass *m)
                                    pc_set_south_bridge);
     object_class_property_set_description(oc, "x-south-bridge",
                                      "Use a different south bridge than PIIX3");
+    compat_props_add(m->compat_props,
+                     pc_piix_compat_defaults, pc_piix_compat_defaults_len);
 }
 
 static void pc_i440fx_machine_10_0_options(MachineClass *m)
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index fd96d0345c..f6d89578d0 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -45,6 +45,7 @@
 #include "hw/i386/pc.h"
 #include "hw/i386/amd_iommu.h"
 #include "hw/i386/intel_iommu.h"
+#include "hw/vfio/pci.h"
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/display/ramfb.h"
 #include "hw/ide/pci.h"
@@ -67,6 +68,8 @@
 
 static GlobalProperty pc_q35_compat_defaults[] = {
     { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "39" },
+    { TYPE_RAMFB_DEVICE, "use-legacy-x86-rom", "true" },
+    { TYPE_VFIO_PCI, "use-legacy-x86-rom", "true" },
 };
 static const size_t pc_q35_compat_defaults_len =
     G_N_ELEMENTS(pc_q35_compat_defaults);
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index ff0d93fae0..a529500b70 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3564,7 +3564,7 @@ static const TypeInfo vfio_pci_dev_info = {
 
 static const Property vfio_pci_dev_nohotplug_properties[] = {
     DEFINE_PROP_BOOL("ramfb", VFIOPCIDevice, enable_ramfb, false),
-    DEFINE_PROP_BOOL("use-legacy-x86-rom", VFIOPCIDevice, use_legacy_x86_rom, true),
+    DEFINE_PROP_BOOL("use-legacy-x86-rom", VFIOPCIDevice, use_legacy_x86_rom, false),
     DEFINE_PROP_ON_OFF_AUTO("x-ramfb-migrate", VFIOPCIDevice, ramfb_migrate,
                             ON_OFF_AUTO_AUTO),
 };
-- 
2.40.1

