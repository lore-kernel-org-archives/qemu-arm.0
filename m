Received: by 10.223.188.70 with SMTP id a6csp1284759wrh;
        Fri, 1 Sep 2017 10:22:06 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb6w7FHxhT4js3ksNkDfDu9USMfoXrfCHFIX8i/57uUKI8pbS9l3ELvzkXWRHgPIlZ0hpfII
X-Received: by 10.200.23.74 with SMTP id u10mr4125447qtk.128.1504286526816;
        Fri, 01 Sep 2017 10:22:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504286526; cv=none;
        d=google.com; s=arc-20160816;
        b=MqXXfM0qZmlEJL0kDKU1am2fJWPh4VvSsu38pA0AL7U4zQf7Z6tFsXq+bp9VgUSPI8
         KckKgcE7GHCTCyi5UObQwDt8WLHNMJ5J8WxdxTcAA+vFdcM09s6+vf81D2qGsc1gl9jT
         IzM+qIiCUS1rKYLKBfQL5XArFyea5Tv7Zq4dRhHFpOmcSGY2XOeM7k+aIdMADWsH3EMB
         olIuTPQdPeSReHf4qIGjl6Z9oXpL5HlUnj39C4pDs7flByZuKm/Cr2qF0z80YKGb2bgd
         Up5NUfNh8xtvDT7eTpMg/qtotU+uja/AbnR3i9nLjc7J3DyQDqvMD6+vK2/MdCi513+K
         nQvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=qlJgXrJlkcptz8Te7fAN5WxZWwk0DVSd6Mj+yB9a3NM=;
        b=bf3onbnjem2ymnUHwnvPOLCsql6rqNPMC9d78Jh4NSW1fOM3Qgi4hRlESjlITLA0S5
         uGqvGRxuKfPrt6TYgPqyNbDx5ViN/41nvuQMNokCKzL5CXku+6pZ5sj7PMTiVOtftwbu
         h3RBa9p9Wc7W8SEMSS0sCc5/FoSzo+wvZsV8JKXa3dgl99pMLXtMGS/Z3deQ8102/r7O
         L//bIy64oNVvJOTU6ff/G9PiDohmaS01QTdYJC2x7qMsvzZ7nG5Z0y2nbIvM3iByAufL
         zRVewYMOptM842B0nVgsb3PolrvUMRzE7/RFYktxTbEKMBbnb3jc9VGGvumO3mnmCYnO
         6mHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d44si591857qtb.389.2017.09.01.10.22.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Sep 2017 10:22:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51217 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnpds-0004oW-Ht
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 13:22:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpdm-0004mb-HD
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 13:21:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpdl-000215-9R
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 13:21:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51300)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dnpdl-000209-0t; Fri, 01 Sep 2017 13:21:57 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 051D07EA9F;
	Fri,  1 Sep 2017 17:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 051D07EA9F
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-117-241.ams2.redhat.com
	[10.36.117.241])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9300652FA0;
	Fri,  1 Sep 2017 17:21:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Fri,  1 Sep 2017 19:21:05 +0200
Message-Id: <1504286483-23327-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 01 Sep 2017 17:21:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v7 02/20] hw/arm/smmu-common: IOMMU memory region
 and address space setup
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	will.deacon@arm.com, robin.murphy@arm.com, peterx@redhat.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org, wtownsen@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZT60AKiDzjQm

We enumerate all the PCI devices attached to the SMMU and
initialize an associated IOMMU memory region and address space.
This happens on SMMU base instance init.

Those info are stored in SMMUDevice objects. The devices are
grouped according to the PCIBus they belong to. A hash table
indexed by the PCIBus poinet is used. Also an array indexed by
the bus number allows to find the list of SMMUDevices.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmu-common.c         | 89 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/smmu-common.h |  6 +++
 2 files changed, 95 insertions(+)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 56608f1..3e67992 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -30,8 +30,97 @@
 #include "qemu/error-report.h"
 #include "hw/arm/smmu-common.h"
 
+/******************/
+/* Infrastructure */
+/******************/
+
+static inline gboolean smmu_uint64_equal(gconstpointer v1, gconstpointer v2)
+{
+    return *((const uint64_t *)v1) == *((const uint64_t *)v2);
+}
+
+static inline guint smmu_uint64_hash(gconstpointer v)
+{
+    return (guint)*(const uint64_t *)v;
+}
+
+SMMUPciBus *smmu_find_as_from_bus_num(SMMUState *s, uint8_t bus_num)
+{
+    SMMUPciBus *smmu_pci_bus = s->smmu_as_by_bus_num[bus_num];
+
+    if (!smmu_pci_bus) {
+        GHashTableIter iter;
+
+        g_hash_table_iter_init(&iter, s->smmu_as_by_busptr);
+        while (g_hash_table_iter_next(&iter, NULL, (void **)&smmu_pci_bus)) {
+            if (pci_bus_num(smmu_pci_bus->bus) == bus_num) {
+                s->smmu_as_by_bus_num[bus_num] = smmu_pci_bus;
+                return smmu_pci_bus;
+            }
+        }
+    }
+    return smmu_pci_bus;
+}
+
+static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
+{
+    SMMUState *s = opaque;
+    uintptr_t key = (uintptr_t)bus;
+    SMMUPciBus *sbus = g_hash_table_lookup(s->smmu_as_by_busptr, &key);
+    SMMUDevice *sdev;
+
+    if (!sbus) {
+        uintptr_t *new_key = g_malloc(sizeof(*new_key));
+
+        *new_key = (uintptr_t)bus;
+        sbus = g_malloc0(sizeof(SMMUPciBus) +
+                         sizeof(SMMUDevice *) * SMMU_PCI_DEVFN_MAX);
+        sbus->bus = bus;
+        g_hash_table_insert(s->smmu_as_by_busptr, new_key, sbus);
+    }
+
+    sdev = sbus->pbdev[devfn];
+    if (!sdev) {
+        char *name = g_strdup_printf("%s-%d-%d",
+                                     s->mrtypename,
+                                     pci_bus_num(bus), devfn);
+        sdev = sbus->pbdev[devfn] = g_malloc0(sizeof(SMMUDevice));
+
+        sdev->smmu = s;
+        sdev->bus = bus;
+        sdev->devfn = devfn;
+
+        memory_region_init_iommu(&sdev->iommu, sizeof(sdev->iommu),
+                                 s->mrtypename,
+                                 OBJECT(s), name, 1ULL << 48);
+        address_space_init(&sdev->as,
+                           MEMORY_REGION(&sdev->iommu), name);
+    }
+
+    return &sdev->as;
+}
+
+static void smmu_init_iommu_as(SMMUState *s)
+{
+    PCIBus *pcibus = pci_find_primary_bus();
+
+    if (pcibus) {
+        pci_setup_iommu(pcibus, smmu_find_add_as, s);
+    } else {
+        error_report("No PCI bus, SMMU is not registered");
+    }
+}
+
 static void smmu_base_instance_init(Object *obj)
 {
+    SMMUState *s = SMMU_SYS_DEV(obj);
+
+    memset(s->smmu_as_by_bus_num, 0, sizeof(s->smmu_as_by_bus_num));
+
+    s->smmu_as_by_busptr = g_hash_table_new_full(smmu_uint64_hash,
+                                                 smmu_uint64_equal,
+                                                 g_free, g_free);
+    smmu_init_iommu_as(s);
 }
 
 static void smmu_base_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 38cd18f..20f3fe6 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -105,4 +105,10 @@ typedef struct {
 #define SMMU_DEVICE_CLASS(klass)                                    \
     OBJECT_CLASS_CHECK(SMMUBaseClass, (klass), TYPE_SMMU_DEV_BASE)
 
+SMMUPciBus *smmu_find_as_from_bus_num(SMMUState *s, uint8_t bus_num);
+
+static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
+{
+    return  ((pci_bus_num(sdev->bus) & 0xff) << 8) | sdev->devfn;
+}
 #endif  /* HW_ARM_SMMU_COMMON */
-- 
2.5.5

