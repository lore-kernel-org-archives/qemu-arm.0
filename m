Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp569121wrw;
        Fri, 9 Nov 2018 03:33:14 -0800 (PST)
X-Google-Smtp-Source: AJdET5djkVQSrHPxhxgIxpMCeKOsSAcjp/TKWfnZWxNWo13jFfTLsqWZ8SM4Nj9O0cNZNwvDpxJP
X-Received: by 2002:aed:33e3:: with SMTP id v90mr8079852qtd.261.1541763194564;
        Fri, 09 Nov 2018 03:33:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541763194; cv=none;
        d=google.com; s=arc-20160816;
        b=w43BJi+KiKjW8X/DUB0gZa2AsOndPDEJiFomI94KF1cMFSotJRGXae+RrpdUyvl91D
         k36RqLowxWNkWYIsIEwvYk4aZ1lsyvFbP6k1l9SkmNbP6IXf6voFH+qMmDeZNAwFGTJF
         1Zu+BinwXvTQ6TTuQ47uOwnShUQKXsyTc2ZHFFYB3Nlp+k0rJOjuZLh68jEsNI2pZY1d
         N1GcXgbjZVEzHFe2i/k/aM3QYt8QXMWH+8KVbfc+l8SK/Is16G9uduh7e7XDzRRTro3i
         jZJJcPbMZkvpVmrFBIufyJMtRXaFVyG2g8V65NLAwwUB5E+xol5Msh/ZJvz4XSJcHFno
         MeBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=m7yFXdX0RKgHanQOvRYDZceBKqvzN2ZBmv06OKGAIcc=;
        b=x8O57u0OulQ5F9O4d5QDiUxfo8j3EXpDb+AOYC4prGFYyXAW3v5uRohM6KYs1KnHAn
         8owK/1+pHIa5PKNDNk0fKGi4CTu4q+xNeG1NQ3lwXW6muVX2g3bxDSbNfZM0PliT3/Ea
         53Ia+nqTfiMgTJPAWy3xCAPTxzdu+0zOpkWkozo9q0XEeIvCh/LVHJeaRrLYO14ym0GS
         mb6cD/YaHXy7TVXDfOh8dHvWzntS1zF8jqssox3B5N6Bm7OrOeeohFiulkyVgd8pKyU/
         2aijo1/FsMKg8WcalnzLe3KESM3aoFn1MniWyvdiNfh6BvpurS/p+9PMXoDGQ7c7cFrZ
         JZGg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l54si5601912qtf.302.2018.11.09.03.33.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Nov 2018 03:33:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33277 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gL52H-0000CH-RE
	for alex.bennee@linaro.org; Fri, 09 Nov 2018 06:33:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL4zu-0006cK-UN
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 06:30:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL4zr-0000B4-Ao
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 06:30:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59318)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gL4zq-0007vk-Px; Fri, 09 Nov 2018 06:30:43 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 98126308428B;
	Fri,  9 Nov 2018 11:30:34 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4DCD05C219;
	Fri,  9 Nov 2018 11:30:32 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	jean-philippe.brucker@arm.com
Date: Fri,  9 Nov 2018 12:29:45 +0100
Message-Id: <20181109112957.10067-7-eric.auger@redhat.com>
In-Reply-To: <20181109112957.10067-1-eric.auger@redhat.com>
References: <20181109112957.10067-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 09 Nov 2018 11:30:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v8 06/18] virtio-iommu: Endpoint and domains
 structs and helpers
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
Cc: tn@semihalf.com, kevin.tian@intel.com, bharat.bhushan@nxp.com,
	peterx@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AKvNEwAL1OvZ

This patch introduce domain and endpoint internal
datatypes. Both are stored in RB trees. The domain
owns a list of endpoints attached to it.

Helpers to get/put end points and domains are introduced.
get() helpers will become static in subsequent patches.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v6 -> v7:
- on virtio_iommu_find_add_as the bus number computation may
  not be finalized yet so we cannot register the EPs at that time.
  Hence, let's remove the get_endpoint and also do not use the
  bus number for building the memory region name string (only
  used for debug though).

v4 -> v5:
- initialize as->endpoint_list

v3 -> v4:
- new separate patch
---
 hw/virtio/trace-events   |   4 ++
 hw/virtio/virtio-iommu.c | 125 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 128 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 9270b0463e..4b15086872 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -61,3 +61,7 @@ virtio_iommu_map(uint32_t domain_id, uint64_t virt_start, uint64_t virt_end, uin
 virtio_iommu_unmap(uint32_t domain_id, uint64_t virt_start, uint64_t virt_end) "domain=%d virt_start=0x%"PRIx64" virt_end=0x%"PRIx64
 virtio_iommu_translate(const char *name, uint32_t rid, uint64_t iova, int flag) "mr=%s rid=%d addr=0x%"PRIx64" flag=%d"
 virtio_iommu_init_iommu_mr(char *iommu_mr) "init %s"
+virtio_iommu_get_endpoint(uint32_t ep_id) "Alloc endpoint=%d"
+virtio_iommu_put_endpoint(uint32_t ep_id) "Free endpoint=%d"
+virtio_iommu_get_domain(uint32_t domain_id) "Alloc domain=%d"
+virtio_iommu_put_domain(uint32_t domain_id) "Free domain=%d"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 2043623b30..e4014a8800 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -33,20 +33,124 @@
 #include "hw/virtio/virtio-bus.h"
 #include "hw/virtio/virtio-access.h"
 #include "hw/virtio/virtio-iommu.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci.h"
 
 /* Max size */
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
 
+typedef struct viommu_domain {
+    uint32_t id;
+    GTree *mappings;
+    QLIST_HEAD(, viommu_endpoint) endpoint_list;
+} viommu_domain;
+
+typedef struct viommu_endpoint {
+    uint32_t id;
+    viommu_domain *domain;
+    QLIST_ENTRY(viommu_endpoint) next;
+    VirtIOIOMMU *viommu;
+} viommu_endpoint;
+
+typedef struct viommu_interval {
+    uint64_t low;
+    uint64_t high;
+} viommu_interval;
+
 static inline uint16_t virtio_iommu_get_sid(IOMMUDevice *dev)
 {
     return PCI_BUILD_BDF(pci_bus_num(dev->bus), dev->devfn);
 }
 
+static gint interval_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
+{
+    viommu_interval *inta = (viommu_interval *)a;
+    viommu_interval *intb = (viommu_interval *)b;
+
+    if (inta->high <= intb->low) {
+        return -1;
+    } else if (intb->high <= inta->low) {
+        return 1;
+    } else {
+        return 0;
+    }
+}
+
+static void virtio_iommu_detach_endpoint_from_domain(viommu_endpoint *ep)
+{
+    QLIST_REMOVE(ep, next);
+    ep->domain = NULL;
+}
+
+viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s, uint32_t ep_id);
+viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s, uint32_t ep_id)
+{
+    viommu_endpoint *ep;
+
+    ep = g_tree_lookup(s->endpoints, GUINT_TO_POINTER(ep_id));
+    if (ep) {
+        return ep;
+    }
+    ep = g_malloc0(sizeof(*ep));
+    ep->id = ep_id;
+    ep->viommu = s;
+    trace_virtio_iommu_get_endpoint(ep_id);
+    g_tree_insert(s->endpoints, GUINT_TO_POINTER(ep_id), ep);
+    return ep;
+}
+
+static void virtio_iommu_put_endpoint(gpointer data)
+{
+    viommu_endpoint *ep = (viommu_endpoint *)data;
+
+    if (ep->domain) {
+        virtio_iommu_detach_endpoint_from_domain(ep);
+        g_tree_unref(ep->domain->mappings);
+    }
+
+    trace_virtio_iommu_put_endpoint(ep->id);
+    g_free(ep);
+}
+
+viommu_domain *virtio_iommu_get_domain(VirtIOIOMMU *s, uint32_t domain_id);
+viommu_domain *virtio_iommu_get_domain(VirtIOIOMMU *s, uint32_t domain_id)
+{
+    viommu_domain *domain;
+
+    domain = g_tree_lookup(s->domains, GUINT_TO_POINTER(domain_id));
+    if (domain) {
+        return domain;
+    }
+    domain = g_malloc0(sizeof(*domain));
+    domain->id = domain_id;
+    domain->mappings = g_tree_new_full((GCompareDataFunc)interval_cmp,
+                                   NULL, (GDestroyNotify)g_free,
+                                   (GDestroyNotify)g_free);
+    g_tree_insert(s->domains, GUINT_TO_POINTER(domain_id), domain);
+    QLIST_INIT(&domain->endpoint_list);
+    trace_virtio_iommu_get_domain(domain_id);
+    return domain;
+}
+
+static void virtio_iommu_put_domain(gpointer data)
+{
+    viommu_domain *domain = (viommu_domain *)data;
+    viommu_endpoint *iter, *tmp;
+
+    QLIST_FOREACH_SAFE(iter, &domain->endpoint_list, next, tmp) {
+        virtio_iommu_detach_endpoint_from_domain(iter);
+    }
+    g_tree_destroy(domain->mappings);
+    trace_virtio_iommu_put_domain(domain->id);
+    g_free(domain);
+}
+
 static AddressSpace *virtio_iommu_find_add_as(PCIBus *bus, void *opaque,
                                               int devfn)
 {
     VirtIOIOMMU *s = opaque;
     IOMMUPciBus *sbus = g_hash_table_lookup(s->as_by_busptr, bus);
+    static uint32_t mr_index;
     IOMMUDevice *sdev;
 
     if (!sbus) {
@@ -60,7 +164,7 @@ static AddressSpace *virtio_iommu_find_add_as(PCIBus *bus, void *opaque,
     if (!sdev) {
         char *name = g_strdup_printf("%s-%d-%d",
                                      TYPE_VIRTIO_IOMMU_MEMORY_REGION,
-                                     pci_bus_num(bus), devfn);
+                                     mr_index++, devfn);
         sdev = sbus->pbdev[devfn] = g_malloc0(sizeof(IOMMUDevice));
 
         sdev->viommu = s;
@@ -75,6 +179,7 @@ static AddressSpace *virtio_iommu_find_add_as(PCIBus *bus, void *opaque,
                                  UINT64_MAX);
         address_space_init(&sdev->as,
                            MEMORY_REGION(&sdev->iommu_mr), TYPE_VIRTIO_IOMMU);
+        g_free(name);
     }
 
     return &sdev->as;
@@ -332,6 +437,13 @@ static const VMStateDescription vmstate_virtio_iommu_device = {
     },
 };
 
+static gint int_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
+{
+    uint ua = GPOINTER_TO_UINT(a);
+    uint ub = GPOINTER_TO_UINT(b);
+    return (ua > ub) - (ua < ub);
+}
+
 static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
@@ -356,6 +468,8 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MAP_UNMAP);
     virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS);
 
+    qemu_mutex_init(&s->mutex);
+
     memset(s->as_by_bus_num, 0, sizeof(s->as_by_bus_num));
     s->as_by_busptr = g_hash_table_new(NULL, NULL);
 
@@ -364,11 +478,20 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     } else {
         error_setg(errp, "VIRTIO-IOMMU is not attached to any PCI bus!");
     }
+
+    s->domains = g_tree_new_full((GCompareDataFunc)int_cmp,
+                                 NULL, NULL, virtio_iommu_put_domain);
+    s->endpoints = g_tree_new_full((GCompareDataFunc)int_cmp,
+                                   NULL, NULL, virtio_iommu_put_endpoint);
 }
 
 static void virtio_iommu_device_unrealize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
+
+    g_tree_destroy(s->domains);
+    g_tree_destroy(s->endpoints);
 
     virtio_cleanup(vdev);
 }
-- 
2.17.2

