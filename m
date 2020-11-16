Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3932088lfb;
        Mon, 16 Nov 2020 10:19:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxge6Qk2nQNqkgiuY1+EDw5YCT785OdPUDaexL/cpaG2bRpV97uBTIznPbaiYIwlhsmz/jZ
X-Received: by 2002:a25:cc0c:: with SMTP id l12mr24821317ybf.90.1605550789377;
        Mon, 16 Nov 2020 10:19:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605550789; cv=none;
        d=google.com; s=arc-20160816;
        b=WS1vQ0/G9PMOvayCupLjtR+x6odMlVOGndLI/8I3psfBaE+juKtQGVsYbOGqMoYKvZ
         rxJaAIxkolyJSq3DpyqQoHJV5sxUP8V7/FIs72+oZNRggEyZjcVGcJr9cssrYinAO3QX
         1ei9M2X8kIYBpKLnmPV4zgWYlp60OmR32/bVy/Smlb3T3IBdCNEfDiTtfnOS65u5By31
         +nnfxQVb+aAvzWkd5TVCJbne5glMK1HNDyih8ac79+IImnnyd2t9AOkRbQDaU+CUp5+a
         MTy59UQMrp+XVL+U6qYeUtKTsRHtTdtM/yA/8QDNzTsDLEwRd1iNAx2uJGMITwWwS2W3
         D+5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=l07ju6Fcbnuv3UVQd4J2zrEsL6OqaYfUt8w7xoTLQyc=;
        b=AJA63DuiV9IuxsPusfhaAy/m3R0Ngw2VB3W1PyMc9KY51C0p3kFsPLeaMLU/Hq3EhA
         MCXSm5gvoCfUP+5VqZRHIsV59GxNbaRnY4smFeg2jE8fMo/q61zHrdAsoOOd0wOILSyx
         AmrgfclftWrvKJXd7o9x2qIUxCafka9OObwy+TKIP6zQEy6W/LhhqXy78Vn90+bz3EHL
         p7fCoejMCHHaclpMpL3DuDnFkPt97XytkOeO5ckIG8RuE8EfQH38YKCYroNbjM+BxSdd
         nMiebeUUoomfu/Rx1kGFZ68E0epc4iNNq2XBBTc6YETfGH8vRsuy0gnjxgxQ52Yu8BiJ
         ETtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EMeP0VWZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o72si13586726ybg.361.2020.11.16.10.19.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 10:19:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EMeP0VWZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kej6S-0004HB-MG
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 13:19:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej2J-0000ID-Os
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:15:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej2G-00010Y-FL
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:15:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605550526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l07ju6Fcbnuv3UVQd4J2zrEsL6OqaYfUt8w7xoTLQyc=;
 b=EMeP0VWZ7R81z0UtIol5kglLoq++5n6Xx37AFypNXX/S1ZgCjvpgH09Z6w8+CMu0zuwAad
 ADNwO065XxJoMkfAj+SRNzkyv5mnf4IsZKVLlayb24g0z6QLiD81PFAtUft1NP5VWQFkS8
 0gZplViSUYiI1CBu/82yYfWDeYVvPXc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-g5Gf_BpjNl2LSGc0VGfVyg-1; Mon, 16 Nov 2020 13:15:24 -0500
X-MC-Unique: g5Gf_BpjNl2LSGc0VGfVyg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86BF7100855D;
 Mon, 16 Nov 2020 18:15:22 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-230.ams2.redhat.com [10.36.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88C9A5C1CF;
 Mon, 16 Nov 2020 18:15:05 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v7 08/26] pci: introduce PCIPASIDOps to PCIDevice
Date: Mon, 16 Nov 2020 19:13:31 +0100
Message-Id: <20201116181349.11908-9-eric.auger@redhat.com>
In-Reply-To: <20201116181349.11908-1-eric.auger@redhat.com>
References: <20201116181349.11908-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com,
 shameerali.kolothum.thodi@huawei.com, nicoleotsuka@gmail.com,
 vivek.gautam@arm.com, yi.l.liu@intel.com, peterx@redhat.com,
 zhangfei.gao@gmail.com, yuzenghui@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /dSF+SqlTHpn

From: Liu Yi L <yi.l.liu@intel.com>

This patch introduces PCIPASIDOps for IOMMU related operations.

https://lists.gnu.org/archive/html/qemu-devel/2018-03/msg00078.html
https://lists.gnu.org/archive/html/qemu-devel/2018-03/msg00940.html

So far, to setup virt-SVA for assigned SVA capable device, needs to
configure host translation structures for specific pasid. (e.g. bind
guest page table to host and enable nested translation in host).
Besides, vIOMMU emulator needs to forward guest's cache invalidation
to host since host nested translation is enabled. e.g. on VT-d, guest
owns 1st level translation table, thus cache invalidation for 1st
level should be propagated to host.

This patch adds two functions: alloc_pasid and free_pasid to support
guest pasid allocation and free. The implementations of the callbacks
would be device passthru modules. Like vfio.

Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Yi Sun <yi.y.sun@linux.intel.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
Signed-off-by: Yi Sun <yi.y.sun@linux.intel.com>
---
 include/hw/pci/pci.h | 11 +++++++++++
 hw/pci/pci.c         | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 72ce649eee..833b330ee1 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -9,6 +9,7 @@
 
 #include "hw/pci/pcie.h"
 #include "qom/object.h"
+#include "hw/iommu/iommu.h"
 
 extern bool pci_available;
 
@@ -264,6 +265,11 @@ struct PCIReqIDCache {
 };
 typedef struct PCIReqIDCache PCIReqIDCache;
 
+struct PCIPASIDOps {
+    int (*set_pasid_table)(PCIBus *bus, int32_t devfn, IOMMUConfig *config);
+};
+typedef struct PCIPASIDOps PCIPASIDOps;
+
 struct PCIDevice {
     DeviceState qdev;
     bool partially_hotplugged;
@@ -357,6 +363,7 @@ struct PCIDevice {
 
     /* ID of standby device in net_failover pair */
     char *failover_pair_id;
+    PCIPASIDOps *pasid_ops;
 };
 
 void pci_register_bar(PCIDevice *pci_dev, int region_num,
@@ -488,6 +495,10 @@ typedef AddressSpace *(*PCIIOMMUFunc)(PCIBus *, void *, int);
 AddressSpace *pci_device_iommu_address_space(PCIDevice *dev);
 void pci_setup_iommu(PCIBus *bus, PCIIOMMUFunc fn, void *opaque);
 
+void pci_setup_pasid_ops(PCIDevice *dev, PCIPASIDOps *ops);
+bool pci_device_is_pasid_ops_set(PCIBus *bus, int32_t devfn);
+int pci_device_set_pasid_table(PCIBus *bus, int32_t devfn, IOMMUConfig *config);
+
 static inline void
 pci_set_byte(uint8_t *config, uint8_t val)
 {
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 0131d9d02c..4e21feb758 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2725,6 +2725,40 @@ void pci_setup_iommu(PCIBus *bus, PCIIOMMUFunc fn, void *opaque)
     bus->iommu_opaque = opaque;
 }
 
+void pci_setup_pasid_ops(PCIDevice *dev, PCIPASIDOps *ops)
+{
+    assert(ops && !dev->pasid_ops);
+    dev->pasid_ops = ops;
+}
+
+bool pci_device_is_pasid_ops_set(PCIBus *bus, int32_t devfn)
+{
+    PCIDevice *dev;
+
+    if (!bus) {
+        return false;
+    }
+
+    dev = bus->devices[devfn];
+    return !!(dev && dev->pasid_ops);
+}
+
+int pci_device_set_pasid_table(PCIBus *bus, int32_t devfn,
+                               IOMMUConfig *config)
+{
+    PCIDevice *dev;
+
+    if (!bus) {
+        return -EINVAL;
+    }
+
+    dev = bus->devices[devfn];
+    if (dev && dev->pasid_ops && dev->pasid_ops->set_pasid_table) {
+        return dev->pasid_ops->set_pasid_table(bus, devfn, config);
+    }
+    return -ENOENT;
+}
+
 static void pci_dev_get_w64(PCIBus *b, PCIDevice *dev, void *opaque)
 {
     Range *range = opaque;
-- 
2.21.3

