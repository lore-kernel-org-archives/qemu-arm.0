Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3672302dye;
        Wed, 2 Jul 2025 01:57:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUtnob9MLm3MvuSKJuJSVTrHzBxPKjXmRDpbUQsWIz8X3zdjRKcQvdudY1Ek0gUsrQNFbb95W8z/p3INg==@linaro.org
X-Google-Smtp-Source: AGHT+IG94Nk9wJBBIGeQ2Z2dIBGBMk+5cRQ/bluW22Q2sHd4F/MorJzr/Q05U7GmJvSN778YTpDR
X-Received: by 2002:a05:620a:4555:b0:7d4:3bc6:1df4 with SMTP id af79cd13be357-7d5c472de61mr258193685a.16.1751446645821;
        Wed, 02 Jul 2025 01:57:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751446645; cv=none;
        d=google.com; s=arc-20240605;
        b=BNCqDCmqwv26zJ5xyQGYoUEqMDUth/M7ot407wviaQ8xOus1EsRJ1UYYy8v7prysUm
         Nz+WZYEMjrCCAQC26CWxjQ8286iuE5mVkVOGn7hx4kymTmJzEjS6wy5flgyBkHed8Ut6
         KQAvnSRymOAs1WVPcFWZukMUK+0fHCJ20IpyOIQzTrYiAOePih/VB4qCyaCA9S+K1WCF
         D2qAKERC6P08NZ7oOMinJlrRqODUwex/EyyESImRHZsZsMRr4iTzEMlHUYTB7T/FEROW
         7cQVl72Izv94yy2IK3HuMkCL8c5pBKo96xoHo4y7ojxCPdN0QxyYh3drizavdkxv2FXG
         0ZFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=c6i3mXapUDIV5FNQgN2v94ERC/Yp8nOvPk/20GxAPXU=;
        fh=fY4HreV2KcFVZwm1moichaqEO3OwT0knG+RPxN+4VJ0=;
        b=em7fVmFzhyy0sKkohwsTNoPaZbm0IIWEX3fdw94g6nWgDbm+ihUYIretfGVAjHQ8tb
         ObG7cb2QSmjjjQT1nRyoGasv4uwv/2BSWqMKnOwxG0aHNY3JYakbtkOHHCDuJebKE8H0
         VgZhANebQuE4/9SdnFij3Bqd5r0nSdqebbeB1Hs6uZWdc41Pl1KANAV+ZNhWUoMWvYvp
         JZdL4THw3JSrjzselaMFBePR9CPGSmVQ6EcIon5gEq7UW7Mzo4CeP5unJsMnziQzdtA3
         PbrNtllNiKkqBml28/Y+MCkDohcYbR5GOB3y1fMhvLAf78ecAgJLKs9kF0uXVWL/G5+q
         9zAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iWIKDAaD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d44322538bsi1091335385a.240.2025.07.02.01.57.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 01:57:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iWIKDAaD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uWtGi-0001gb-J8; Wed, 02 Jul 2025 04:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uWtGg-0001fH-M5
 for qemu-devel@nongnu.org; Wed, 02 Jul 2025 04:56:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uWtGe-0003y2-N6
 for qemu-devel@nongnu.org; Wed, 02 Jul 2025 04:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751446594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c6i3mXapUDIV5FNQgN2v94ERC/Yp8nOvPk/20GxAPXU=;
 b=iWIKDAaDFz62rMJIFDGLhNggMra/Fy2wJpn5m35RDmS96EtQKeMkepCe3rY37omG7MEJ+I
 XOPuySDAsgXvBxo0FEbEONn805bi8gA19ticQ6lsTnRnX4pBPeYA20eENpNDaoRS8/nMj6
 utGDCgiYBxhdD7rI5Wv3KgqEODXcD1E=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-376-MiiuMqMtOuOJbLBB0wigyQ-1; Wed,
 02 Jul 2025 04:56:30 -0400
X-MC-Unique: MiiuMqMtOuOJbLBB0wigyQ-1
X-Mimecast-MFC-AGG-ID: MiiuMqMtOuOJbLBB0wigyQ_1751446589
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 879B918001D6; Wed,  2 Jul 2025 08:56:28 +0000 (UTC)
Received: from virt-mtcollins-01.lab.eng.rdu2.redhat.com
 (virt-mtcollins-01.lab.eng.rdu2.redhat.com [10.8.1.196])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 28ACD180045C; Wed,  2 Jul 2025 08:56:25 +0000 (UTC)
From: Shaoqin Huang <shahuang@redhat.com>
To: qemu-arm@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Auger <eauger@redhat.com>,
 Shaoqin Huang <shahuang@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v7 2/2] hw/i386: Add the ramfb romfile compatibility
Date: Wed,  2 Jul 2025 04:56:16 -0400
Message-Id: <20250702085616.2172722-3-shahuang@redhat.com>
In-Reply-To: <20250702085616.2172722-1-shahuang@redhat.com>
References: <20250702085616.2172722-1-shahuang@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: o6gw8zuTsqOJ

Set the "use-legacy-x86-rom" property to false by default, and only set
it to true on x86 since only x86 will need it.

At the same time, set the "use-legacy-x86-rom" property to true on those
historical versioned machine types in order to avoid the memory layout
being changed.

Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
---
 hw/core/machine.c             |  2 ++
 hw/display/ramfb-standalone.c |  2 +-
 hw/i386/pc_piix.c             | 10 ++++++++++
 hw/i386/pc_q35.c              |  3 +++
 hw/vfio/pci.c                 |  2 +-
 5 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index e869821b22..a7043e2a34 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -39,6 +39,8 @@
 
 GlobalProperty hw_compat_10_0[] = {
     { "scsi-hd", "dpofua", "off" },
+    { "ramfb", "use-legacy-x86-rom", "true"},
+    { "vfio-pci", "use-legacy-x86-rom", "true" },
 };
 const size_t hw_compat_10_0_len = G_N_ELEMENTS(hw_compat_10_0);
 
diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb-standalone.c
index 725aef9896..b20a7c57b3 100644
--- a/hw/display/ramfb-standalone.c
+++ b/hw/display/ramfb-standalone.c
@@ -63,7 +63,7 @@ static const VMStateDescription ramfb_dev_vmstate = {
 
 static const Property ramfb_properties[] = {
     DEFINE_PROP_BOOL("x-migrate", RAMFBStandaloneState, migrate,  true),
-    DEFINE_PROP_BOOL("use-legacy-x86-rom", RAMFBStandaloneState, use_legacy_x86_rom, true),
+    DEFINE_PROP_BOOL("use-legacy-x86-rom", RAMFBStandaloneState, use_legacy_x86_rom, false),
 };
 
 static void ramfb_class_initfn(ObjectClass *klass, const void *data)
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index ea7572e783..8ec8d8ae6d 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -49,6 +49,7 @@
 #include "hw/i2c/smbus_eeprom.h"
 #include "system/memory.h"
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
@@ -482,6 +490,8 @@ static void pc_i440fx_machine_options(MachineClass *m)
                                    pc_set_south_bridge);
     object_class_property_set_description(oc, "x-south-bridge",
                                      "Use a different south bridge than PIIX3");
+    compat_props_add(m->compat_props,
+                     pc_piix_compat_defaults, pc_piix_compat_defaults_len);
 }
 
 static void pc_i440fx_machine_10_1_options(MachineClass *m)
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 33211b1876..0096eef6f4 100644
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
index f4fa8a5610..604b337389 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3710,7 +3710,7 @@ static const TypeInfo vfio_pci_dev_info = {
 
 static const Property vfio_pci_dev_nohotplug_properties[] = {
     DEFINE_PROP_BOOL("ramfb", VFIOPCIDevice, enable_ramfb, false),
-    DEFINE_PROP_BOOL("use-legacy-x86-rom", VFIOPCIDevice, use_legacy_x86_rom, true),
+    DEFINE_PROP_BOOL("use-legacy-x86-rom", VFIOPCIDevice, use_legacy_x86_rom, false),
     DEFINE_PROP_ON_OFF_AUTO("x-ramfb-migrate", VFIOPCIDevice, ramfb_migrate,
                             ON_OFF_AUTO_AUTO),
 };
-- 
2.40.1

