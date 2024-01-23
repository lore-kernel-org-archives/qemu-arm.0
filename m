Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp492466ejc;
        Tue, 23 Jan 2024 10:19:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESFLZpQz9RR0VPhQiWybn4Thq8zo0HU0usGU+8H0u3L+NEgIsOCEm+M7pKLxr9GJRnZHNO
X-Received: by 2002:a05:620a:1d89:b0:783:549a:aa3f with SMTP id pj9-20020a05620a1d8900b00783549aaa3fmr6958007qkn.67.1706033966317;
        Tue, 23 Jan 2024 10:19:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706033966; cv=none;
        d=google.com; s=arc-20160816;
        b=ferpQo5R04y3kqK5xtDnFbIDqaoRYleOPfzrGPyOsqRb2lSXvCg7ScPkSk0wSZ21Qm
         vYfJLbd5KruT6d6SvN6iCM6XsmZWuccVRGg3zkpep+U9jWADz3EWW0n0Py80nkNjQIHg
         UJMEVIGIUBNQGIOytkcqOeR+js5cI0dWOBILkCJV6/hWQ8Y6ZNymzfGJKYpqnEoeXnQH
         ZWayGSajVQOsUhyWrxDQUaOOyNt+Ay79xaDqIK9tnWGsKnMlp05+NGWFUWoUNgLapsbw
         6/LaSYkhgi/CXSBAwYhAm7C8EQ8Wypia7PmxpsCcvt+d33SUkwuAPzPxhdLAaWNgg0Uy
         3gTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4E9PS+wmquzixnBAkIzbuS/d8cmi9np9eCbZNk4hpos=;
        fh=6gTb9VNh6LOeqNyIPKrEwVzrOlAOUavPKoS18EAi0QU=;
        b=qxxe91rzJdevb6Fjd9RnprQxqDcLUSblhRxmVzhh5SW9CVkGDIn9cXc3euioM+0M3q
         BNBkwYANeR93miIajrQz9O3W9ZZgqLVelUADM/VQ62cvxrOF3vtn+lieQpEceuRsyOnj
         NnyNsIR0ptZF/bMg56MJ20n7ECg0CEX39fZlPUfDBS1Y1HiaPqj86jBPwQ9Zr7Q5fEGD
         T5TyIE3dWCr7UAkCLxPYhjn2SrKvOlOEQnpYCxCld6eDIuI8lvkPGA9i2lQmbnVPGWIH
         w4lN5Yz68vOokl3233QCDT7Y+HI4/OfjS3dzzpxLvLOMRVikDFD3nzLlFtU1K0AeuFpz
         2Y/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MOnrkTM8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v18-20020a05620a091200b00783210fdd8dsi8200297qkv.690.2024.01.23.10.19.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jan 2024 10:19:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MOnrkTM8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSLLo-0007Gm-Ik; Tue, 23 Jan 2024 13:18:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rSLLj-0007AM-IY
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 13:18:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rSLLg-00066c-EC
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 13:18:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706033891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4E9PS+wmquzixnBAkIzbuS/d8cmi9np9eCbZNk4hpos=;
 b=MOnrkTM8GeocqPtZlCptH7BzAG0ml6R7b35E7yUdKXNLUYabc/F+HNaV/vDzxAxZBvZlFY
 oG8BeWaaNEYeqTkt6rnQ6pfN2iIdoFgCFgobR22o/2pu7pN6SHb6/lZkYlCCGjUkqBCaIg
 QG9oOO4bvN5oj28CDidUuCWgyb4YfYc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-6h_DB6LDPuybBo2N080mBQ-1; Tue, 23 Jan 2024 13:18:07 -0500
X-MC-Unique: 6h_DB6LDPuybBo2N080mBQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6C111013663;
 Tue, 23 Jan 2024 18:18:06 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DD7C2166B32;
 Tue, 23 Jan 2024 18:18:03 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, alex.williamson@redhat.com,
 peter.maydell@linaro.org, zhenzhong.duan@intel.com, peterx@redhat.com,
 yanghliu@redhat.com
Cc: mst@redhat.com,
	clg@redhat.com,
	jasowang@redhat.com
Subject: [PATCH 3/3] hw/pc: Set the default virtio-iommu aw-bits to 39 on
 pc_q35_9.0 onwards
Date: Tue, 23 Jan 2024 19:15:57 +0100
Message-ID: <20240123181753.413961-4-eric.auger@redhat.com>
In-Reply-To: <20240123181753.413961-1-eric.auger@redhat.com>
References: <20240123181753.413961-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.327,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: Jpzo5uaaoJJD

Currently the default input range can extend to 64 bits. On x86,
when the virtio-iommu protects vfio devices, the physical iommu
may support only 39 bits. Let's set the default to 39, as done
for the intel-iommu. We introduce a new compat to make sure older
pc_q35 machine types still use 64 bits. On ARM we keep 64b as
the default input address width. Of course if aw-bits is set
from the command line, the default is overriden.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c            |  6 ++++++
 hw/i386/pc.c             | 10 +++++++++-
 hw/virtio/virtio-iommu.c |  2 +-
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 2793121cb4..a27fe13c73 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2715,10 +2715,16 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
         virtio_md_pci_pre_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        uint8_t aw_bits = object_property_get_uint(OBJECT(dev),
+                                                   "aw-bits", NULL);
         hwaddr db_start = 0, db_end = 0;
         QList *reserved_regions;
         char *resv_prop_str;
 
+        if (!aw_bits) {
+            qdev_prop_set_uint8(dev, "aw-bits", 64);
+        }
+
         if (vms->iommu != VIRT_IOMMU_NONE) {
             error_setg(errp, "virt machine does not support multiple IOMMUs");
             return;
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 496498df3a..a8dbc99946 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -78,7 +78,9 @@
     { "qemu64-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
     { "athlon-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },
 
-GlobalProperty pc_compat_8_2[] = {};
+GlobalProperty pc_compat_8_2[] = {
+    { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "64" },
+};
 const size_t pc_compat_8_2_len = G_N_ELEMENTS(pc_compat_8_2);
 
 GlobalProperty pc_compat_8_1[] = {};
@@ -1458,6 +1460,8 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
         virtio_md_pci_pre_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        uint8_t aw_bits = object_property_get_uint(OBJECT(dev),
+                                                   "aw-bits", NULL);
         /* Declare the APIC range as the reserved MSI region */
         char *resv_prop_str = g_strdup_printf("0xfee00000:0xfeefffff:%d",
                                               VIRTIO_IOMMU_RESV_MEM_T_MSI);
@@ -1466,6 +1470,10 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
         qlist_append_str(reserved_regions, resv_prop_str);
         qdev_prop_set_array(dev, "reserved-regions", reserved_regions);
 
+        if (!aw_bits) {
+            qdev_prop_set_uint8(dev, "aw-bits", 39);
+        }
+
         g_free(resv_prop_str);
     }
 
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index e7f299e0c6..a7c268a01a 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1526,7 +1526,7 @@ static Property virtio_iommu_properties[] = {
     DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus,
                      TYPE_PCI_BUS, PCIBus *),
     DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
-    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 64),
+    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.41.0

