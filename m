Received: by 10.28.71.27 with SMTP id u27csp2116519wma;
        Sat, 17 Feb 2018 11:30:59 -0800 (PST)
X-Google-Smtp-Source: AH8x227AllklGd4VZBBttSw8nM9PJtY10xtaURKL3/qeYMhiY5zCuG3wqm7L1jcLrFdqyWe2DkoP
X-Received: by 10.129.135.6 with SMTP id x6mr7401215ywf.263.1518895859097;
        Sat, 17 Feb 2018 11:30:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518895859; cv=none;
        d=google.com; s=arc-20160816;
        b=LLCcEPwsXyMcIbIXtdpI8bTqIuxDqywgQ2KMTg7tVd3Cl+aUoTxtphW3MSrnNTT21T
         G3Ydt5Ea3CLRkkcZchmqJamqvBuzaUAfXz+oEBde/FO1a0+8BGZYd8jBdIOQkI8+G88V
         4pgj4Amb2XZNNXHXYSBQGJtboN1wAisL5tfHppJikjIQMoZ+iJrIhKTXGjGzvWD8vrxb
         GYvPLB0ZY8vcN+1HqZHf7THUcwveDb3XFMXDxlsewlUV8/iYjwpolvF6JpBkfYPXhMRA
         Vhtzt73wCwxjHnXU+x5663IN+xxuZdzHChAoKo2iHilx2Ol97KiGomqjVMwDEP6y6b59
         h91Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=xaMoSZHqcFlG4J6V3h1S0x+Txy2gpkPGbjmobkweG9I=;
        b=QPJai46ai1DSX9abAKs2+U9hiU//r6VXYPmFAzCIRP+21Q1+e08rhDZd+YPkwiEGSJ
         2qNoG04pLy0KfdS/V3t/ZGKxHvaiL9aKPUlwpubvhwZ8GOMLZmEE8hPqyjNyeAKoF9mm
         fjRukvwfsWV4oosfm3HrAdnsu7rzNPOGANMJszb+ek8FltB+JiLHlivNfH+Fi0dCLFf2
         EDYTURYu0XOzIhxEYUxHhmyDQuIHs10BMIhb8KISUwrZ1+F8VPbLTfC96dxeQMPGenoT
         AGwtIV1MpKkXkKgRdt+tfLV2tWcfZJXKbaJi6BBkMf78PS5K1lV0ChhAbnLQI4AzP49H
         hc2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o185si3435587ybb.817.2018.02.17.11.30.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:30:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51158 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en8CI-0001YP-GS
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:30:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44778)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1en7W0-0003Fz-F2
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:47:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1en7Vw-0000Vf-HL
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:47:16 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:52358 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1en7Vw-0000UE-Ap; Sat, 17 Feb 2018 13:47:12 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C07EE402242D;
	Sat, 17 Feb 2018 18:47:11 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-21.ams2.redhat.com
	[10.36.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 30C312024CA2;
	Sat, 17 Feb 2018 18:47:09 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Sat, 17 Feb 2018 19:46:44 +0100
Message-Id: <1518893216-9983-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Sat, 17 Feb 2018 18:47:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Sat, 17 Feb 2018 18:47:11 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v9 02/14] hw/arm/smmu-common: IOMMU memory region
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
Cc: mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	peterx@redhat.com, linuc.decode@gmail.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g27JZERCw7VT

We enumerate all the PCI devices attached to the SMMU and
initialize an associated IOMMU memory region and address space.
This happens on SMMU base instance init.

Those info are stored in SMMUDevice objects. The devices are
grouped according to the PCIBus they belong to. A hash table
indexed by the PCIBus poinet is used. Also an array indexed by
the bus number allows to find the list of SMMUDevices.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v8 -> v9:
- fix key value for lookup

v7 -> v8:
- introduce SMMU_MAX_VA_BITS
- use PCI bus handle as a key
- do not clear s->smmu_as_by_bus_num
- use g_new0 instead of g_malloc0
- use primary_bus field
---
 hw/arm/smmu-common.c         | 59 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/smmu-common.h |  6 +++++
 2 files changed, 65 insertions(+)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 86a5aab..d0516dc 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -28,12 +28,71 @@
 #include "qemu/error-report.h"
 #include "hw/arm/smmu-common.h"
 
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
+    SMMUPciBus *sbus = g_hash_table_lookup(s->smmu_as_by_busptr, bus);
+    SMMUDevice *sdev;
+
+    if (!sbus) {
+        sbus = g_malloc0(sizeof(SMMUPciBus) +
+                         sizeof(SMMUDevice *) * SMMU_PCI_DEVFN_MAX);
+        sbus->bus = bus;
+        g_hash_table_insert(s->smmu_as_by_busptr, bus, sbus);
+    }
+
+    sdev = sbus->pbdev[devfn];
+    if (!sdev) {
+        char *name = g_strdup_printf("%s-%d-%d",
+                                     s->mrtypename,
+                                     pci_bus_num(bus), devfn);
+        sdev = sbus->pbdev[devfn] = g_new0(SMMUDevice, 1);
+
+        sdev->smmu = s;
+        sdev->bus = bus;
+        sdev->devfn = devfn;
+
+        memory_region_init_iommu(&sdev->iommu, sizeof(sdev->iommu),
+                                 s->mrtypename,
+                                 OBJECT(s), name, 1ULL << SMMU_MAX_VA_BITS);
+        address_space_init(&sdev->as,
+                           MEMORY_REGION(&sdev->iommu), name);
+    }
+
+    return &sdev->as;
+}
+
 static void smmu_base_realize(DeviceState *dev, Error **errp)
 {
     SMMUState *s = ARM_SMMU(dev);
 
     s->configs = g_hash_table_new_full(NULL, NULL, NULL, g_free);
     s->iotlb = g_hash_table_new_full(NULL, NULL, NULL, g_free);
+    s->smmu_as_by_busptr = g_hash_table_new(NULL, NULL);
+
+    if (s->primary_bus) {
+        pci_setup_iommu(s->primary_bus, smmu_find_add_as, s);
+    } else {
+        error_setg(errp, "SMMU is not attached to any PCI bus!");
+    }
 }
 
 static void smmu_base_reset(DeviceState *dev)
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 8a9d931..aee96c2 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -121,4 +121,10 @@ typedef struct {
 #define ARM_SMMU_GET_CLASS(obj)                              \
     OBJECT_GET_CLASS(SMMUBaseClass, (obj), TYPE_ARM_SMMU)
 
+SMMUPciBus *smmu_find_as_from_bus_num(SMMUState *s, uint8_t bus_num);
+
+static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
+{
+    return  ((pci_bus_num(sdev->bus) & 0xff) << 8) | sdev->devfn;
+}
 #endif  /* HW_ARM_SMMU_COMMON */
-- 
2.5.5

