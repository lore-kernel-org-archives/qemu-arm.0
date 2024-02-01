Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp353555ejb;
        Thu, 1 Feb 2024 08:33:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8HVtQ5/vdXnaCSlMi0WbjbJHKbOnKbDYk5qPjQX9ObK3ksjWZdxPOMm7He6gwimjrWfG+
X-Received: by 2002:a0c:ebd1:0:b0:68c:4118:7636 with SMTP id k17-20020a0cebd1000000b0068c41187636mr10101600qvq.3.1706805236411;
        Thu, 01 Feb 2024 08:33:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706805236; cv=none;
        d=google.com; s=arc-20160816;
        b=bYBHzMYA4Um/Z54P215KB0Wfe7HjSKIRgEOLh3T2FD3Yb0e3W4UX1Hw+tvsu1FNzy8
         FYbHVTpZIKewa+Be6aDGSBS1jCDpFfCSqLPrgf8/JnCgY3CaWt6XhyTfU2B9ByL8WdmL
         oIZ3/n9To3QzFLFpngCbCVPkxXjJ4OHpANf1G2Bnit5KvCNdgPPEFcG/XJGe/eMdNTG8
         d6+MIXNN8lS0kPbJp3oVwRjnKp9E+uUjt2H3scocqjM1SK98KVfPChN3c/Qu8NmBRCh4
         zRnPr9I0OYorJQzH4wC6jKoFMAmwsS4PwM4yckB1RJDtpCnqOCQcmjufgDVT8wW5TeH3
         rWjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=v7DZE+s2i2KbZeYEYOMdIz2ytMOea1x+BGZ16J/V5Qs=;
        fh=AZ6hGbI0AY4jXFbN6KATjeekORq4v/El4LIYSyBaOiY=;
        b=vJCDOEudtCrTRSeOICry0YIvhXI9/+gtfgzhorGYnS2p4cyTJU5m7pE8oK2oVuuLqL
         FgB+iVRkSOusbMHagDNkJPngmA2voTJyb0PNWsO458hXuYJHOZpyGrHa8WldMzx0n+/T
         5hgW3E178wc0ZteUQO6sToA4RtA/gL+H7RSwJPjPWaxldxIIZ6cqgBaBNOZTTyHijp6S
         Esj6aJ15Mct640fVZUVlAWLB+x43w2shJy6gUKpbtXXd8wVj7Ciw2qd9itqovz5u/Da1
         L5VWmn9NVgyS88Tal/0+51helvx9tiqfl4x15iUN1qmihbySVoEsVF5XNUp/+Es/H9ts
         2C1Q==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R6xIMeuu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=0; AJvYcCWut+CsAc4nBdcyysjTnOHF7fMhWaJH0BFn7u0uZ271F8ErNJmezX5XOkGOlr0ihV+2Kmz130nRJcj+IvpMiD/LSkJyWTgO
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pt4-20020a056214048400b00681991637e6si14951958qvb.484.2024.02.01.08.33.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 08:33:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R6xIMeuu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVa0b-0004Y9-Lu; Thu, 01 Feb 2024 11:33:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rVa0a-0004XS-CS
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 11:33:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rVa0Y-0006xw-Ts
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 11:33:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706805225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v7DZE+s2i2KbZeYEYOMdIz2ytMOea1x+BGZ16J/V5Qs=;
 b=R6xIMeuu4UGFPykaVfjjbTI6uX5pE6OUwQnTtdlMDgBhWL8Gdh7c4YTUnFo4+6IpR6JuZZ
 sjFmDwzbakibjXsJlHhOGGMvzzA2ZldXBQ9gZXzDF9MoBum+9MFqyCLvKuTL3od3OY6ufS
 Gkx30fSdmVk503mZRECeN/WU7FQWtpk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-cosXeOKANn-wrVv28Ut2cQ-1; Thu, 01 Feb 2024 11:33:39 -0500
X-MC-Unique: cosXeOKANn-wrVv28Ut2cQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8354B85A588;
 Thu,  1 Feb 2024 16:33:39 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A98A492BC6;
 Thu,  1 Feb 2024 16:33:36 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, alex.williamson@redhat.com,
 peter.maydell@linaro.org, zhenzhong.duan@intel.com, yanghliu@redhat.com
Cc: mst@redhat.com,
	clg@redhat.com,
	jasowang@redhat.com
Subject: [PATCH v2 3/3] hw: Set virtio-iommu aw-bits default value on
 pc_q35_9.0 and arm virt
Date: Thu,  1 Feb 2024 17:32:24 +0100
Message-ID: <20240201163324.564525-4-eric.auger@redhat.com>
In-Reply-To: <20240201163324.564525-1-eric.auger@redhat.com>
References: <20240201163324.564525-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.292,
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
X-TUID: TYh3Pzz/sx69

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

---

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
index e6ead2c5c8..56539f2fc5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2718,10 +2718,16 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
         virtio_md_pci_pre_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        uint8_t aw_bits = object_property_get_uint(OBJECT(dev),
+                                                   "aw-bits", NULL);
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
index 803244e5cc..0e2bcb4840 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1458,6 +1458,8 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
         virtio_md_pci_pre_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        uint8_t aw_bits = object_property_get_uint(OBJECT(dev),
+                                                   "aw-bits", NULL);
         /* Declare the APIC range as the reserved MSI region */
         char *resv_prop_str = g_strdup_printf("0xfee00000:0xfeefffff:%d",
                                               VIRTIO_IOMMU_RESV_MEM_T_MSI);
@@ -1466,6 +1468,10 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
         qlist_append_str(reserved_regions, resv_prop_str);
         qdev_prop_set_array(dev, "reserved-regions", reserved_regions);
 
+        if (!aw_bits) {
+            qdev_prop_set_uint8(dev, "aw-bits", 39);
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

