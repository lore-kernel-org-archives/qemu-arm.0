Received: by 10.28.71.27 with SMTP id u27csp2510584wma;
        Mon, 5 Feb 2018 05:41:00 -0800 (PST)
X-Google-Smtp-Source: AH8x225wNYt48qhuXb6/PPXvCgZjTn/om56UE2S+tt4cjDoCEdwjlNC2HTshNpZswRHW0uqbW/Rb
X-Received: by 10.129.44.215 with SMTP id s206mr30735308yws.361.1517838060268;
        Mon, 05 Feb 2018 05:41:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517838060; cv=none;
        d=google.com; s=arc-20160816;
        b=UNRBMIEmE8WNBdgRquInT3cGpcwjj+YXXMc6OwonaNc67mXSlMmgKErI0ZZcvTDD33
         hx4dXa6rZrnrsS2SsAPufjG1k5/1GNvpfcD4sAhC09EFgJKasP0zZ6aF5phUN8ttUdAZ
         XsfEUr3y4LPPQYFQG+3fyjQg61jj+fGv8hVIVY0FvBN1XiVaYifks4kQl9KszHVy7qje
         pONJMy6Mu1c6/rChvlknteXSpuhUfDJBmqacAWpfMgL6QiuPbMQByNzi+aYewk0ZvJfW
         OZZoL4yWL+DnKSttj3blxqCaxn+k8iVrs92UCfKKKNR/AKeblZuILXMZa8buWVYaPt12
         ufWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=M/QcNzXX64jB8jlJ2BFf1YGVP+QuqDOnpTLClrx4v7A=;
        b=PSNcCuYGgh/7VDi99EfdpxCoGYnVaIS5M/VItcTwJgCbi5PtCDBkWJg0ZtBPY2MleM
         ixloKgmoK9JToTNm9+E1pCrSif+FSYgkOefJzJnCa7ToezaX7tHJARbkSmDcZyvqQKIq
         PLwIr2lah+Wa0qFSkHltIuvpD3KTH7EefK/LxhGthAEFiQ8s43lETq3Ns7aGno9U+RQS
         rVhKmsDVtgzWPMOXjSCx9x/jpd8RL4LmjE436ZOsi6KFAQcMKAl6wHCBv9+oqbRuZWSY
         ojW80MMRJXJ8NgzQAiRLsEVkpgtdXSOpC35r2DhS4w4fnvJSPwAsz6TQbSJriy7eRDo3
         3OeA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b4si1056902ybb.464.2018.02.05.05.41.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Feb 2018 05:41:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44966 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eih11-00057S-Lc
	for alex.bennee@linaro.org; Mon, 05 Feb 2018 08:40:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eih0q-000558-6K
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 08:40:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eih0l-0005Xa-9e
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 08:40:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41234)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eih0l-0005Wk-20; Mon, 05 Feb 2018 08:40:43 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 43696883BC;
	Mon,  5 Feb 2018 13:40:42 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-112.ams2.redhat.com
	[10.36.116.112])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 95EFE5F70E;
	Mon,  5 Feb 2018 13:40:20 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Mon,  5 Feb 2018 14:39:20 +0100
Message-Id: <1517837972-1904-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1517837972-1904-1-git-send-email-eric.auger@redhat.com>
References: <1517837972-1904-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 05 Feb 2018 13:40:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v8 02/14] hw/arm/smmu-common: IOMMU memory region
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
X-TUID: R7YitQnHLQm0

We enumerate all the PCI devices attached to the SMMU and
initialize an associated IOMMU memory region and address space.
This happens on SMMU base instance init.

Those info are stored in SMMUDevice objects. The devices are
grouped according to the PCIBus they belong to. A hash table
indexed by the PCIBus poinet is used. Also an array indexed by
the bus number allows to find the list of SMMUDevices.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v7 -> v8:
- introduce SMMU_MAX_VA_BITS
- use PCI bus handle as a key
- do not clear s->smmu_as_by_bus_num
- use g_new0 instead of g_malloc0
- use primary_bus field
---
 hw/arm/smmu-common.c         | 61 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/smmu-common.h |  6 +++++
 2 files changed, 67 insertions(+)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index c2f6b15..7bf8e57 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -32,8 +32,69 @@
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
+    SMMUPciBus *sbus = g_hash_table_lookup(s->smmu_as_by_busptr, &bus);
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
+    SMMUState *s = ARM_SMMU(dev);
+
+    s->smmu_as_by_busptr = g_hash_table_new(NULL, NULL);
+
+    if (s->primary_bus) {
+        pci_setup_iommu(s->primary_bus, smmu_find_add_as, s);
+    } else {
+        error_setg(errp, "SMMU is not attached to any PCI bus!");
+    }
 }
 
 static Property smmu_dev_properties[] = {
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 0f9af40..1495bce 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -123,4 +123,10 @@ typedef struct {
 #define ARM_SMMU_GET_CLASS(obj)                              \
     OBJECT_GET_CLASS(SMMUBaseClass, (obj), TYPE_ARm_SMMU)
 
+SMMUPciBus *smmu_find_as_from_bus_num(SMMUState *s, uint8_t bus_num);
+
+static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
+{
+    return  ((pci_bus_num(sdev->bus) & 0xff) << 8) | sdev->devfn;
+}
 #endif  /* HW_ARM_SMMU_COMMON */
-- 
2.5.5

