Received: by 10.28.71.27 with SMTP id u27csp215768wma;
        Mon, 12 Feb 2018 11:11:01 -0800 (PST)
X-Google-Smtp-Source: AH8x226PVag/V0nRdxhnlReDsgNW6WgaLHTB+STOeCNnQvnZwByWSQZ//yFfTXdM1qfQsqn/sTZB
X-Received: by 10.37.180.65 with SMTP id c1mr8560022ybg.438.1518462661077;
        Mon, 12 Feb 2018 11:11:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518462661; cv=none;
        d=google.com; s=arc-20160816;
        b=FMOu3hiPcuy9YQvDEpo7vArhe74bfUDySd6HLLtxuROq9jovVwLkKanL6Bb6zwk7Pr
         yVrnWiLLPLhGEghjDr14jgeA1A7YM9ZMCqzTR/pRc7gf2f/YjeAXzhJixeDM0UI00R4k
         ETBvg3tHj/3gwL4lCeuY7NBjhyiW/Zt41AA/CkOeni3fiMegkhJHsLypRxkxklswFZ0z
         qSMxXaWllos+qfAB1fkQ7HCCmck8+MF8iO95pZPe2ePNwo66tvjkXe6hpl4QzXKOWLYa
         vb9XZJ2YTRXDrPDVdR/cmHkhh69TF7gSGYFDio2pw5OlDo+OJRC8SpLyYgarFJ7rImSN
         zFKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=llXsugy6RaBDzF01XtUyJIReQEKyiCUbnRP9COd/yqQ=;
        b=Ho7HwhUqanAHJa7AyLwKflaD5YjWXrPgI9Hrw5mj1ef7Z0wjk3oHUktyVmnYhrinLC
         13B74cB4aNevxAuLelmilVjLmQyVyO8coJ9YMgzZ20jdLIxg1wHwZE9mwGo/xdEyYEqC
         c1xyoSntwDHI13LbL5Zu4Cs3OMKDOhaQvRbKdm6P6z59M0WIsj72SbQRMa/muk7C4RE9
         ioBLfOmOdWJ4kea8o7L+9EIsbslEwn0Pq3dRli1XYFh9Z5kHZ7qNqf88bM6T4LwVI0EG
         4IlG3WgWk1+CUzWGmmXTvjZ9DNLPjeIhOeV4foEva/8Z0SJhHbClLhbBUgdZhzMqzQ71
         OoFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v201si1603952ywa.70.2018.02.12.11.11.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 11:11:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40081 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elJVE-0001zw-Cc
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 14:11:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJKK-0000Xk-6j
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 13:59:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJKJ-0003qt-03
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 13:59:44 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59608 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1elJKI-0003qG-Qv; Mon, 12 Feb 2018 13:59:42 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 269E640201A0;
	Mon, 12 Feb 2018 18:59:42 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-182.ams2.redhat.com [10.36.116.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7ABD01227915;
	Mon, 12 Feb 2018 18:59:35 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Mon, 12 Feb 2018 18:58:11 +0000
Message-Id: <1518461904-5305-10-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
References: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Mon, 12 Feb 2018 18:59:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Mon, 12 Feb 2018 18:59:42 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v6 09/22] virtio-iommu: Register attached endpoints
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
Cc: kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +Tjqy9uJhtcn

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
index 7123ab2..a7743d2 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -44,3 +44,7 @@ virtio_iommu_map(uint32_t domain_id, uint64_t virt_start, uint64_t virt_end, uin
 virtio_iommu_unmap(uint32_t domain_id, uint64_t virt_start, uint64_t virt_end) "domain=%d virt_start=0x%"PRIx64" virt_end=0x%"PRIx64
 virtio_iommu_translate(const char *name, uint32_t rid, uint64_t iova, int flag) "mr=%s rid=%d addr=0x%"PRIx64" flag=%d"
 virtio_iommu_init_iommu_mr(char *iommu_mr) "init %s"
+virtio_iommu_get_endpoint(uint32_t ep_id) "Alloc endpoint=%d"
+virtio_iommu_put_endpoint(uint32_t ep_id) "Free endpoint=%d"
+virtio_iommu_get_domain(uint32_t domain_id) "Alloc domain=%d"
+virtio_iommu_put_domain(uint32_t domain_id) "Free domain=%d"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 0840854..207b17a 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -35,15 +35,118 @@
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
@@ -69,6 +172,8 @@ static AddressSpace *virtio_iommu_find_add_as(PCIBus *bus, void *opaque,
         sdev->bus = bus;
         sdev->devfn = devfn;
 
+        virtio_iommu_get_endpoint(s, PCI_BUILD_BDF(pci_bus_num(bus), devfn));
+
         trace_virtio_iommu_init_iommu_mr(name);
 
         memory_region_init_iommu(&sdev->iommu_mr, sizeof(sdev->iommu_mr),
@@ -333,6 +438,13 @@ static const VMStateDescription vmstate_virtio_iommu_device = {
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
@@ -359,10 +471,17 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
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
@@ -371,6 +490,10 @@ err:
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

