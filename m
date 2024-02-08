Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp2575ejb;
        Thu, 8 Feb 2024 02:12:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWc3PgsVUThPe0+5QnBUjYMqbF+sdVlPMkpU3g0VCStXdphERAz9XnykeGQWoJ7lAUG1j3Tj7ZXta2WRiUp8HXkt47uFur1
X-Google-Smtp-Source: AGHT+IH4bs0ievNvMW3sfxy4Ut9fN7qk/WDTlEGyVkP3spknS2/N3857yysgYOZ02buEbteTI2mp
X-Received: by 2002:ac8:71c9:0:b0:42b:ff78:2033 with SMTP id i9-20020ac871c9000000b0042bff782033mr7631964qtp.56.1707387125536;
        Thu, 08 Feb 2024 02:12:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707387125; cv=none;
        d=google.com; s=arc-20160816;
        b=bON0b2EnBTUhyQm+EBeD4lpiAV1OVdnkEogHAfzLccqY8FmSoFj2bcgfGi0+sU9ATB
         U3Vz5c9x+FmzmAR+diFNOinhbXJcUNfRrFaBYfUgVyK12DlgsqzCS1Qp4WnzuYSOMG1l
         +VZeRehMxi08oWZ3kprTFOkpQl4xNAgWVd8zMjTUUQj9P0JP90lmcZb6SznWnAYETnDr
         P1C08uT3wJzIguT26LLHfDE4kZsxQoK48YGy4MPXaX3kPFoyw1OiOPQ+OQZsEYEFIvrM
         CMfp/O5iSJUrl6bfv6Irl/nQsLlhHb+auqhopvNpsYaToGCAg8ehXvFCv34LPasF2GJi
         nQhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DPrDVIdiESOiMapBfh0CtAjDydyyKmrnXSgaW0nkP/k=;
        fh=BBENjkS90wynAXfLJm8nPaUDwTKXMcf+3OyHATsabDs=;
        b=ImFeFIca9xQ/1xsreRjq9Q+LiYidim22zY4iX51qdvTh6Pu6wa2CvxZEH0+8cmAL6e
         h01frsKkfUo365p2KbTZiJErPd9tbJN2VCEW6v7p51++lVPuFPDMRq2C68usTwAozWZ6
         icQHUHJALeIFk4uGCfRYjqewaacXvEQQP8gpPOM4zXAxqH4JM8czah6rpZcEAkPIDRp2
         lulTSSx7emZf8oKEhSRwtDxzRRYeD0t064GlECghC4G9me1R5ABv0pdrSl/nlSBHGSvc
         NMo34Ph+Xq+iCn1qEwBViMRU3Ln/CkqR9ypkTKJlzvoiXlzSGxzI3/1Wd3XNeLLPWX/e
         VT8Q==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ByrFqAh9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCVNTBfVMwK0VfXEtfPY+P6So4VJrfpjirCRpYwRA16tyKp3Ph+xydzQbLV2t3gJL3xyCmACbeRN0vgJsE5jHZWywy+U2+DH
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f22-20020ac859d6000000b0042c48441c4bsi1552408qtf.27.2024.02.08.02.12.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Feb 2024 02:12:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ByrFqAh9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rY1Nk-0003zS-8R; Thu, 08 Feb 2024 05:11:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rY1Nj-0003z1-6o
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 05:11:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rY1Nh-0000Sb-Mv
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 05:11:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707387104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPrDVIdiESOiMapBfh0CtAjDydyyKmrnXSgaW0nkP/k=;
 b=ByrFqAh9LPrJ/ponv0perSmSKV0Sky51vpsKrAC9brrTqUjumptO2Yc4Kmp2yfsbg0eqJ3
 okLA6zGupuRRyLVjdjRvB00cyu2N83Iin2EaJtoG4Ig6q9Zdit98W1B/yjmjlFpdnwfUYT
 me+IVGjDFIT+4UI7/l3U6nCTbljfCA8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-0OlgeajHOEa3Qb3qMnwsiw-1; Thu, 08 Feb 2024 05:11:41 -0500
X-MC-Unique: 0OlgeajHOEa3Qb3qMnwsiw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 698B5101FA0B;
 Thu,  8 Feb 2024 10:11:41 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1238BC08EF7;
 Thu,  8 Feb 2024 10:11:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, mst@redhat.com,
 peter.maydell@linaro.org, clg@redhat.com, zhenzhong.duan@intel.com,
 yanghliu@redhat.com
Cc: alex.williamson@redhat.com,
	jasowang@redhat.com
Subject: [PATCH v3 3/3] hw: Set virtio-iommu aw-bits default value on pc_q35
 and arm virt
Date: Thu,  8 Feb 2024 11:10:19 +0100
Message-ID: <20240208101128.655167-4-eric.auger@redhat.com>
In-Reply-To: <20240208101128.655167-1-eric.auger@redhat.com>
References: <20240208101128.655167-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.106,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 6o2CUnVleFHo

Currently the default input range can extend to 64 bits. On x86,
when the virtio-iommu protects vfio devices, the physical iommu
may support only 39 bits. Let's set the default to 39, as done
for the intel-iommu. On ARM we set 48b as a default (matching
SMMUv3 SMMU_IDR5.VAX == 0).

We use hw_compat_8_2 to handle the compatibility for machines
before 9.0 which used to have a virtio-iommu default input range
of 64 bits.

Of course if aw-bits is set from the command line, the default
is overriden.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Tested-by: Yanghang Liu<yanghliu@redhat.com>

---

v2 -> v3:
- collected Zhenzhong's R-b
- use &error_abort instead of NULL error handle
  on object_property_get_uint() call (Cédric)
- use VTD_HOST_AW_39BIT (Cédric)

v1 -> v2:
- set aw-bits to 48b on ARM
- use hw_compat_8_2 to handle the compat for older machines
  which used 64b as a default
---
 hw/arm/virt.c            | 6 ++++++
 hw/core/machine.c        | 5 ++++-
 hw/i386/pc.c             | 6 ++++++
 hw/virtio/virtio-iommu.c | 2 +-
 4 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 368c2a415a..0994f2a560 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2716,10 +2716,16 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
         virtio_md_pci_pre_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        uint8_t aw_bits = object_property_get_uint(OBJECT(dev),
+                                                   "aw-bits", &error_abort);
         hwaddr db_start = 0, db_end = 0;
         QList *reserved_regions;
         char *resv_prop_str;
 
+        if (!aw_bits) {
+            qdev_prop_set_uint8(dev, "aw-bits", 48);
+        }
+
         if (vms->iommu != VIRT_IOMMU_NONE) {
             error_setg(errp, "virt machine does not support multiple IOMMUs");
             return;
diff --git a/hw/core/machine.c b/hw/core/machine.c
index fb5afdcae4..70ac96954c 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -30,9 +30,12 @@
 #include "exec/confidential-guest-support.h"
 #include "hw/virtio/virtio-pci.h"
 #include "hw/virtio/virtio-net.h"
+#include "hw/virtio/virtio-iommu.h"
 #include "audio/audio.h"
 
-GlobalProperty hw_compat_8_2[] = {};
+GlobalProperty hw_compat_8_2[] = {
+    { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "64" },
+};
 const size_t hw_compat_8_2_len = G_N_ELEMENTS(hw_compat_8_2);
 
 GlobalProperty hw_compat_8_1[] = {
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 196827531a..ee2d379c90 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1456,6 +1456,8 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
         virtio_md_pci_pre_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        uint8_t aw_bits = object_property_get_uint(OBJECT(dev),
+                                                   "aw-bits", &error_abort);
         /* Declare the APIC range as the reserved MSI region */
         char *resv_prop_str = g_strdup_printf("0xfee00000:0xfeefffff:%d",
                                               VIRTIO_IOMMU_RESV_MEM_T_MSI);
@@ -1464,6 +1466,10 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
         qlist_append_str(reserved_regions, resv_prop_str);
         qdev_prop_set_array(dev, "reserved-regions", reserved_regions);
 
+        if (!aw_bits) {
+            qdev_prop_set_uint8(dev, "aw-bits", VTD_HOST_AW_39BIT);
+        }
+
         g_free(resv_prop_str);
     }
 
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 7870bdbeee..c468e9b13b 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1529,7 +1529,7 @@ static Property virtio_iommu_properties[] = {
     DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus,
                      TYPE_PCI_BUS, PCIBus *),
     DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
-    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 64),
+    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.41.0

