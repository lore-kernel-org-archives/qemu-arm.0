Received: by 10.28.71.27 with SMTP id u27csp841555wma;
        Fri, 19 Jan 2018 07:02:32 -0800 (PST)
X-Google-Smtp-Source: ACJfBotuk6fzwQZbMFQjzAcGN+SuqDLd3Ps0NbYFQ7DiRbtu+2qxsQUC0OuQFKJh912jotx/Sqnh
X-Received: by 10.13.247.70 with SMTP id h67mr9654030ywf.105.1516374152411;
        Fri, 19 Jan 2018 07:02:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516374152; cv=none;
        d=google.com; s=arc-20160816;
        b=P7Pc3IycXhKFjRTY0YmQQfhcfML4GQpZelGZhgphgU2CtrSGNiHvXw7BL1K8P2e8Q9
         1GzuUeSDz+VBVc34cXFOBsJNoq7gCqb5VWXalwveFVSeD3IjOrJ9D+RghyKl0D1yXUY5
         lDqivH6zWCZGeI8M16IdIgEtqWVw/v7nqbO5iMsQ1Ij73/2RfeZwA6GitXLzd0KGBzuo
         zIrx6SUPhUsj96IcOS73ofWbmpRQpSQJ24K/tjLHqKi1bT5KWzckWOdCPBQrQvtDyiw8
         7fQMZJPcDrNyKKNgiBvrYs6LzQRqzOyAGO3V7MrBJ1M88mCeibH7bj9XFVHDG/gWB0mC
         4diw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=d3hL6uHL6QbsUXqqPvpDRSHf/oIWRyZb26EOwAG+AeE=;
        b=SxPZdgj8dQlBwuFcvfPgiQWL7/O9gEt2aLXiAoUhJPSMKsW0xbfuJYblb0yaFLY2Gg
         5o+S0wR+/OouVHYwsqfCY30GzXo4RlSMzvTTrokcek/c0NPpg9riUzL7JQIQBw83vayk
         DZLaURYqXe7hQl8d/3hR125Lh8OwYsFcwbyOQYs6AgwMyI5+bNABO35qgBUy9yy3DidS
         KrykJoyMiH04RpDTB8D9985T3jXraIJUmGwGAEhXS/fpem+jiQIbnmg3pRmW6vDIcIpK
         QMttq9lYvWttLqer/7nCG+OpZZ1pP3rcErT4wUzd+4ROujLSN71mBe+hobtBv06k0mZp
         CM0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f6si2347819ywe.387.2018.01.19.07.02.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 07:02:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecYBb-0005vM-R2
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 10:02:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYAv-0005nl-PT
	for qemu-devel@nongnu.org; Fri, 19 Jan 2018 10:01:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYAr-0006N2-Ic
	for qemu-devel@nongnu.org; Fri, 19 Jan 2018 10:01:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53894)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ecYAl-0006Ha-75; Fri, 19 Jan 2018 10:01:39 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F0C22132CCF;
	Fri, 19 Jan 2018 15:01:37 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-129.ams2.redhat.com [10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 111125C886;
	Fri, 19 Jan 2018 14:57:21 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Fri, 19 Jan 2018 14:49:02 +0000
Message-Id: <1516373355-305-10-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
References: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 19 Jan 2018 15:01:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v5 09/22] virtio-iommu: Register attached
 endpoints
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wei@redhat.com, kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XuX1YJLpMTje

This patch introduce domain and endpoint internal
datatypes. Both are stored in RB trees. The domain
owns a list of endpoints attached to it.

It is assumed the endpoint ID corresponds to the PCI BDF.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v4 -> v5:
- initialize as->endpoint_list

v3 -> v4:
- new separate patch
---
 hw/virtio/trace-events   |   4 ++
 hw/virtio/virtio-iommu.c | 123 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 127 insertions(+)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 1739db5..59c75da 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -38,3 +38,7 @@ virtio_iommu_map(uint32_t domain_id, uint64_t phys_addr, uint64_t virt_addr, uin
 virtio_iommu_unmap(uint32_t domain_id, uint64_t virt_addr, uint64_t size) "domain=%d virt_addr=0x%"PRIx64" size=0x%"PRIx64
 virtio_iommu_translate(const char *name, uint32_t rid, uint64_t iova, int flag) "mr=%s rid=%d addr=0x%"PRIx64" flag=%d"
 virtio_iommu_init_iommu_mr(char *iommu_mr) "init %s"
+virtio_iommu_get_endpoint(uint32_t ep_id) "Alloc endpoint=%d"
+virtio_iommu_put_endpoint(uint32_t ep_id) "Free endpoint=%d"
+virtio_iommu_get_domain(uint32_t domain_id) "Alloc domain=%d"
+virtio_iommu_put_domain(uint32_t domain_id) "Free domain=%d"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 5d335d1..cca2614 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -34,15 +34,118 @@
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
+static viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
+                                                  uint32_t ep_id)
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
@@ -68,6 +171,8 @@ static AddressSpace *virtio_iommu_find_add_as(PCIBus *bus, void *opaque,
         sdev->bus = bus;
         sdev->devfn = devfn;
 
+        virtio_iommu_get_endpoint(s, PCI_BUILD_BDF(pci_bus_num(bus), devfn));
+
         trace_virtio_iommu_init_iommu_mr(name);
 
         memory_region_init_iommu(&sdev->iommu_mr, sizeof(sdev->iommu_mr),
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
@@ -358,10 +470,17 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     s->config.page_size_mask = TARGET_PAGE_MASK;
     s->config.input_range.end = -1UL;
 
+    qemu_mutex_init(&s->mutex);
+
     memset(s->as_by_bus_num, 0, sizeof(s->as_by_bus_num));
     s->as_by_busptr = g_hash_table_new(NULL, NULL);
 
     pci_setup_iommu(pcibus, virtio_iommu_find_add_as, s);
+
+    s->domains = g_tree_new_full((GCompareDataFunc)int_cmp,
+                                 NULL, NULL, virtio_iommu_put_domain);
+    s->endpoints = g_tree_new_full((GCompareDataFunc)int_cmp,
+                                   NULL, NULL, virtio_iommu_put_endpoint);
     return;
 err:
     error_setg(&error_fatal, "virtio-iommu: no pci bus identified");
@@ -370,6 +489,10 @@ err:
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
1.9.1

