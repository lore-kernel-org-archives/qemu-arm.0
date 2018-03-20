Received: by 10.28.91.67 with SMTP id p64csp3776788wmb;
        Tue, 20 Mar 2018 05:38:27 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsRSvJVmvbTyed/7kWTAFCRHbJMI/OCulFX1eD7lAGwQxuk8uHZfMnlVJSOWzRl+I4qaRxY
X-Received: by 10.55.170.83 with SMTP id t80mr23518051qke.275.1521549507404;
        Tue, 20 Mar 2018 05:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521549507; cv=none;
        d=google.com; s=arc-20160816;
        b=UukG2QPZYttI8iN4Jh94UsquxOB0SK9TTQlcpCJKYNS4CacXGU0JdDsyvgQPnLuEyJ
         J8Y300ItBkp9TJ8F0OG6IEU/Db8RmjdmHh1q4rcUBPKsGQRXCxKWoZg1CHu9ML3ZZLrX
         mSxBPfnwKzXE3CcflX5eMjB8yvgNO1YP05al3wdSrdIjFJcAMsOTlHEc7lqDm7yMd7Cj
         mGXkqSw5WULURruKGel3q5S84akNSOFkBique5PjRWXFhQK42eoWYf2TZE80Lq8Ar65U
         xsgvXwkefzn0WT6kkagFTcrmvM+6eQAIuCos9VCUYGDBmUbZMQ1uf5dB1mQZQj0AYDdt
         4Pdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=JNzSnV7j6hYq2571KFK2Rg96J6+PQ1BxSB7pCmH/B4o=;
        b=valzxGoKiXL2jQRwSnt6PnBUFevSm4Cw+zQl2XTk1jdH1RxEQgtIFyZ1Rg6A2OLAuv
         8eYDqy6mRR6w9pz+2dlGt5faW8Lji0bOQzC/yV2nC7JcV2vNHi9h68z426c4z9I5MXpv
         /7n2WrHmzybrXGswUZxmufInBa1+6xMD9C5Bkzn03+nPEaBlAk/TM+hLg9J5C64PttTH
         bw+xR2KYkrgxnFeKaxfud9QMkG5eY97f0tL7JZ3W20l6C+cRc4PapY7BSesurigo87F/
         ZBndGBhlzAw32cMbiRwT4J8qAMW/F0QVW3oY/6PfIDOQyv07qmSGpN0cqvpp2xyMM+W6
         Y4wg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l10si1906719qti.32.2018.03.20.05.38.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 05:38:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48202 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyGX4-0007Kk-Sm
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 08:38:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eyGWh-00078e-Ag
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 08:38:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eyGWc-00030J-By
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 08:38:03 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43372 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eyGWb-0002zG-VM; Tue, 20 Mar 2018 08:37:58 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 78DF5EBFE9;
	Tue, 20 Mar 2018 12:37:57 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E322D946A9;
	Tue, 20 Mar 2018 12:37:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Tue, 20 Mar 2018 13:37:24 +0100
Message-Id: <1521549456-14072-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1521549456-14072-1-git-send-email-eric.auger@redhat.com>
References: <1521549456-14072-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 20 Mar 2018 12:37:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 20 Mar 2018 12:37:57 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v10 02/14] hw/arm/smmu-common: IOMMU memory
 region and address space setup
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
Cc: cdall@kernel.org, mst@redhat.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, peterx@redhat.com, alex.williamson@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, jintack@cs.columbia.edu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t/0wAXIkJqAB

We set up the infrastructure to enumerate all the PCI devices
attached to the SMMU and create an associated IOMMU memory
region and address space.

Those info are stored in SMMUDevice objects. The devices are
grouped according to the PCIBus they belong to. A hash table
indexed by the PCIBus pointer is used. Also an array indexed by
the bus number allows to find the list of SMMUDevices.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>

---
v9 -> v10:
- comment functions added to the header
- g_free(name)
- renamed smmu_find_as_from_bus_num into smmu_find_smmu_pcibus
- add a comment about lazy init in smmu_find_smmu_pcibus
- add a trace event when creating the smmu iommu mr

v8 -> v9:
- fix key value for lookup

v7 -> v8:
- introduce SMMU_MAX_VA_BITS
- use PCI bus handle as a key
- do not clear s->smmu_as_by_bus_num
- use g_new0 instead of g_malloc0
- use primary_bus field
---
 hw/arm/smmu-common.c         | 67 ++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/trace-events          |  3 ++
 include/hw/arm/smmu-common.h |  8 ++++++
 3 files changed, 78 insertions(+)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index f4cda1f..fe0cd70 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -28,6 +28,66 @@
 #include "qemu/error-report.h"
 #include "hw/arm/smmu-common.h"
 
+/**
+ * The bus number is used for lookup when SID based invalidatation occurs.
+ * In that case we lazily populate the SMMUPciBus array from the bus hash
+ * table. At the time the SMMUPciBus is created (smmu_find_add_as), the bus
+ * numbers may not be always initialized yet.
+ */
+SMMUPciBus *smmu_find_smmu_pcibus(SMMUState *s, uint8_t bus_num)
+{
+    SMMUPciBus *smmu_pci_bus = s->smmu_pcibus_by_bus_num[bus_num];
+
+    if (!smmu_pci_bus) {
+        GHashTableIter iter;
+
+        g_hash_table_iter_init(&iter, s->smmu_pcibus_by_busptr);
+        while (g_hash_table_iter_next(&iter, NULL, (void **)&smmu_pci_bus)) {
+            if (pci_bus_num(smmu_pci_bus->bus) == bus_num) {
+                s->smmu_pcibus_by_bus_num[bus_num] = smmu_pci_bus;
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
+    SMMUPciBus *sbus = g_hash_table_lookup(s->smmu_pcibus_by_busptr, bus);
+    SMMUDevice *sdev;
+
+    if (!sbus) {
+        sbus = g_malloc0(sizeof(SMMUPciBus) +
+                         sizeof(SMMUDevice *) * SMMU_PCI_DEVFN_MAX);
+        sbus->bus = bus;
+        g_hash_table_insert(s->smmu_pcibus_by_busptr, bus, sbus);
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
+        trace_smmu_add_mr(name);
+        g_free(name);
+    }
+
+    return &sdev->as;
+}
+
 static void smmu_base_realize(DeviceState *dev, Error **errp)
 {
     SMMUState *s = ARM_SMMU(dev);
@@ -42,6 +102,13 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
 
     s->configs = g_hash_table_new_full(NULL, NULL, NULL, g_free);
     s->iotlb = g_hash_table_new_full(NULL, NULL, NULL, g_free);
+    s->smmu_pcibus_by_busptr = g_hash_table_new(NULL, NULL);
+
+    if (s->primary_bus) {
+        pci_setup_iommu(s->primary_bus, smmu_find_add_as, s);
+    } else {
+        error_setg(errp, "SMMU is not attached to any PCI bus!");
+    }
 }
 
 static void smmu_base_reset(DeviceState *dev)
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 193063e..8e8b53c 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -2,3 +2,6 @@
 
 # hw/arm/virt-acpi-build.c
 virt_acpi_setup(void) "No fw cfg or ACPI disabled. Bailing out."
+
+# hw/arm/smmu-common.c
+smmu_add_mr(const char *name) "%s"
\ No newline at end of file
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 5910692..76cf4aa 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -121,4 +121,12 @@ typedef struct {
 #define ARM_SMMU_GET_CLASS(obj)                              \
     OBJECT_GET_CLASS(SMMUBaseClass, (obj), TYPE_ARM_SMMU)
 
+/* Return the SMMUPciBus handle associated to a PCI bus number */
+SMMUPciBus *smmu_find_smmu_pcibus(SMMUState *s, uint8_t bus_num);
+
+/* Return the stream ID of an SMMU device */
+static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
+{
+    return  ((pci_bus_num(sdev->bus) & 0xff) << 8) | sdev->devfn;
+}
 #endif  /* HW_ARM_SMMU_COMMON */
-- 
2.5.5

