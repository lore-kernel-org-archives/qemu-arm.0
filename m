Received: by 10.28.4.212 with SMTP id 203csp872606wme;
        Wed, 25 Apr 2018 07:16:47 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqXnxbluIDsHjtPH3W5mxT0FMkkopKhFYbThftu9arqfiQW+JavX+ztCR0+8cxoWOypdIy/
X-Received: by 10.12.134.97 with SMTP id p88mr6280108qva.56.1524665807521;
        Wed, 25 Apr 2018 07:16:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524665807; cv=none;
        d=google.com; s=arc-20160816;
        b=OoJmZqEPtyXGSKBSAkFHktYMO5MZKfWKwMZ3R7xrIypJ/shCRo66T8PbDMqFz/M5s/
         EyKyuMee97MRUc9RQwlx55I+5YnWbc6mKF3qNdQSDpbMPuvEEoAqXJ1uguUhfLLaO6Vr
         IVQLRJdtF9Fy6kwwwLu48q4a0HMOWV58oGJCYPCanp6j6MdXOJcjcS2zLrvqPJcHCEZv
         TM0mi0Co4e5PQc8aVJKwPJE7xVl0V3Y4+3JdEzz1txmnySAOLqIvUQbMgg9uPTEIpDSC
         otp/QYCZtOM05IFgcgJq8Wdkpz0KrCB4tRqhc7yPUCmlwHpTYEjapOUzwORw13JMwRMK
         l6BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=g0uWCIQBBYLbagACEdRwCe5page3GVrE3FDfDKp6o88=;
        b=A9VzdT9EyFTVJgIwm6kKkHXjiBHIyJZX9ZOqRqx3QYin3uCHZWZRA1YcfPqFEECN6/
         /jC2YVYQEBj2PaT/1opxYfAxUr7DVmTntEJLBFg0fyIlxdhCxnHPLFrTg0mKcrOk0Z7V
         VqRjZBLj10opBTedK5cQO9LVsYP7PH5tAWscx7BzDyqE44TMbd1Jo2W+982NKgjfTuc4
         HJZipxhm4LdhI0FjYFpiirGGLg02+4CX29XsjVdC6AP72kJoPo66+Wm+tWycC5DMcUb7
         4dlChhKTjtz6ja/Auq5zAKKfhNn+dUJgfnl/iD9SNrOSgGd47u0YW9/k1N6auN5+bHVm
         IN+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y17si1977839qkj.210.2018.04.25.07.16.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Apr 2018 07:16:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37169 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBLDy-0000Y6-ST
	for alex.bennee@linaro.org; Wed, 25 Apr 2018 10:16:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55584)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLDb-0000Sr-F6
	for qemu-arm@nongnu.org; Wed, 25 Apr 2018 10:16:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLDX-0005iv-KB
	for qemu-arm@nongnu.org; Wed, 25 Apr 2018 10:16:23 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33102 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fBLDX-0005ic-EU; Wed, 25 Apr 2018 10:16:19 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 075808DC3B;
	Wed, 25 Apr 2018 14:16:19 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-141.ams2.redhat.com
	[10.36.116.141])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 73EDC2023239;
	Wed, 25 Apr 2018 14:16:16 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Wed, 25 Apr 2018 16:15:47 +0200
Message-Id: <1524665762-31355-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
References: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Wed, 25 Apr 2018 14:16:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Wed, 25 Apr 2018 14:16:19 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v12 02/17] hw/arm/smmu-common: IOMMU memory
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
X-TUID: 9mmNlkWIddVq

We set up the infrastructure to enumerate all the PCI devices
attached to the SMMU and create an associated IOMMU memory
region and address space.

Those info are stored in SMMUDevice objects. The devices are
grouped according to the PCIBus they belong to. A hash table
indexed by the PCIBus pointer is used. Also an array indexed by
the bus number allows to find the list of SMMUDevices.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---
v11 -> v12:
- use PCI_BUILD_BDF in smmu_get_sid and add Peter's R-b

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
 hw/arm/smmu-common.c         | 69 ++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/trace-events          |  3 ++
 include/hw/arm/smmu-common.h |  8 +++++
 3 files changed, 80 insertions(+)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index e086ff5..3d64bcf 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -28,8 +28,69 @@
 #include "qemu/error-report.h"
 #include "hw/arm/smmu-common.h"
 
+/**
+ * The bus number is used for lookup when SID based invalidation occurs.
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
+    SMMUState *s = ARM_SMMU(dev);
     SMMUBaseClass *sbc = ARM_SMMU_GET_CLASS(dev);
     Error *local_err = NULL;
 
@@ -38,6 +99,14 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
         error_propagate(errp, local_err);
         return;
     }
+
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
index d682be8..8b94777 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -120,4 +120,12 @@ typedef struct {
 #define ARM_SMMU_GET_CLASS(obj)                              \
     OBJECT_GET_CLASS(SMMUBaseClass, (obj), TYPE_ARM_SMMU)
 
+/* Return the SMMUPciBus handle associated to a PCI bus number */
+SMMUPciBus *smmu_find_smmu_pcibus(SMMUState *s, uint8_t bus_num);
+
+/* Return the stream ID of an SMMU device */
+static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
+{
+    return PCI_BUILD_BDF(pci_bus_num(sdev->bus), sdev->devfn);
+}
 #endif  /* HW_ARM_SMMU_COMMON */
-- 
2.5.5

