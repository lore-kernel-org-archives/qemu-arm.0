Received: by 10.28.71.27 with SMTP id u27csp848331wma;
        Fri, 19 Jan 2018 07:07:56 -0800 (PST)
X-Google-Smtp-Source: ACJfBosnBTzVLg89plKfGiQcdERxEtjGa9PJTh0IebN/RrFaYckmV2+tAGWw4NcrPnYn/BxQgrel
X-Received: by 10.37.215.148 with SMTP id o142mr16977676ybg.314.1516374438137;
        Fri, 19 Jan 2018 07:07:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516374438; cv=none;
        d=google.com; s=arc-20160816;
        b=J0pbJvyRJcLE3uDSH5O3xOIQD1Kd3stTCcu8CRzEqtt/alFSkobWfgLnoJDKZAFYnx
         RWJfUo/38UwHgvQ6MfNdqJZObVSHw9lgvk+LC7d4TOvh+7Th6bxAniMIp3EZNSma0lEJ
         xSc0IHupqfalzQVhOSCMhDL1OgmYQIPnrccdobHcdxfyNjayvnK0QaOoB4m0fj1vg1X7
         V7uDMmxBO+oysT6cNVz17qaVvcx45h96YvUy2FdX08P1cMjKZEXFz0Gl3vVJMYI5NDKp
         6RadCDh4ak9z/FeOnHivphhrufm8ohcTgI1KIO5C+Sq15+nrD4p/WzoR3DK7xYJMWQzS
         FZdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=n+c8F8i9qmBCsHMbrOnFDNmv0IyQfsGyxoAKif07GoI=;
        b=PqqDdmH+JMlsAVbN721VqJft2nmHjBCGHd6h8DhyJSIjDwc69KZmsCU5qQm2CGAz/x
         WLkCpwuN0T/erCZboWZ2SWWJHMay0Ku6L5EAUl6WqVgTaCPVIinG7fhy69dud8chqFFK
         5zbDe80akkZqwaSqQznMduH9hiCBIi13RYE6q9RjD0xt9XDzUf4TH17eAzo8rdwySx0V
         t0mR6x8I3JqLcAubvaD8V8zn7IhVrEoZDrH6xLf1L8R6OIofLcpUz8sY5sX2H6QL3sdH
         hMR8WfLN/zD/4B6U67Of0PRyVv0sOdyjXtTlIyv/NsXwl7akgcTYpfRUuUk1Petb7xE4
         zPlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j12si1410117ywi.37.2018.01.19.07.07.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 07:07:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54238 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecYGD-0001Zu-DB
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 10:07:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48905)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYCs-0007Ne-3W
	for qemu-devel@nongnu.org; Fri, 19 Jan 2018 10:03:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYCq-0008AH-Jf
	for qemu-devel@nongnu.org; Fri, 19 Jan 2018 10:03:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46630)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ecYCl-00084T-BH; Fri, 19 Jan 2018 10:03:43 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 66E8AC08EC24;
	Fri, 19 Jan 2018 15:03:42 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-129.ams2.redhat.com [10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A56A45C1B7;
	Fri, 19 Jan 2018 15:03:12 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Fri, 19 Jan 2018 14:49:06 +0000
Message-Id: <1516373355-305-14-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
References: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 19 Jan 2018 15:03:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v5 13/22] virtio-iommu: Implement probe request
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
X-TUID: hLxADittxbGf

This patch implements the PROBE request. At the moment,
no reserved regions are returned as none are registered
per device. Only a NONE property is returned.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v4 -> v5:
- initialize bufstate.error to false
- add cpu_to_le64(size)
---
 hw/virtio/trace-events   |   2 +
 hw/virtio/virtio-iommu.c | 190 ++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 190 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 873e4fc..6a502cc 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -46,3 +46,5 @@ virtio_iommu_unmap_left_interval(uint64_t low, uint64_t high, uint64_t next_low,
 virtio_iommu_unmap_right_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap right [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
 virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap inc [0x%"PRIx64",0x%"PRIx64"]"
 virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
+virtio_iommu_fill_resv_property(uint32_t devid, uint8_t subtype, uint64_t addr, uint64_t size, uint32_t flags, size_t filled) "dev= %d, subtype=%d addr=0x%"PRIx64" size=0x%"PRIx64" flags=%d filled=0x%lx"
+virtio_iommu_fill_none_property(uint32_t devid) "devid=%d"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index c96aacc..0e712b3 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -39,6 +39,11 @@
 
 /* Max size */
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
+#define VIOMMU_PROBE_SIZE 512
+
+#define SUPPORTED_PROBE_PROPERTIES (\
+    VIRTIO_IOMMU_PROBE_T_NONE | \
+    VIRTIO_IOMMU_PROBE_T_RESV_MEM)
 
 typedef struct viommu_domain {
     uint32_t id;
@@ -51,6 +56,7 @@ typedef struct viommu_endpoint {
     viommu_domain *domain;
     QLIST_ENTRY(viommu_endpoint) next;
     VirtIOIOMMU *viommu;
+    GTree *reserved_regions;
 } viommu_endpoint;
 
 typedef struct viommu_interval {
@@ -65,6 +71,13 @@ typedef struct viommu_mapping {
     uint32_t flags;
 } viommu_mapping;
 
+typedef struct viommu_property_buffer {
+    viommu_endpoint *endpoint;
+    size_t filled;
+    uint8_t *start;
+    bool error;
+} viommu_property_buffer;
+
 static inline uint16_t virtio_iommu_get_sid(IOMMUDevice *dev)
 {
     return PCI_BUILD_BDF(pci_bus_num(dev->bus), dev->devfn);
@@ -104,6 +117,9 @@ static viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
     ep->viommu = s;
     trace_virtio_iommu_get_endpoint(ep_id);
     g_tree_insert(s->endpoints, GUINT_TO_POINTER(ep_id), ep);
+    ep->reserved_regions = g_tree_new_full((GCompareDataFunc)interval_cmp,
+                                            NULL, (GDestroyNotify)g_free,
+                                            (GDestroyNotify)g_free);
     return ep;
 }
 
@@ -117,6 +133,7 @@ static void virtio_iommu_put_endpoint(gpointer data)
     }
 
     trace_virtio_iommu_put_endpoint(ep->id);
+    g_tree_destroy(ep->reserved_regions);
     g_free(ep);
 }
 
@@ -358,6 +375,139 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
     return VIRTIO_IOMMU_S_INVAL;
 }
 
+/**
+ * virtio_iommu_fill_resv_mem_prop - Add a RESV_MEM probe
+ * property into the probe request buffer
+ *
+ * @key: interval handle
+ * @value: handle to the reserved memory region
+ * @data: handle to the probe request buffer state
+ */
+static gboolean virtio_iommu_fill_resv_mem_prop(gpointer key,
+                                                gpointer value,
+                                                gpointer data)
+{
+    struct virtio_iommu_probe_resv_mem *resv =
+        (struct virtio_iommu_probe_resv_mem *)value;
+    struct virtio_iommu_probe_property *prop;
+    struct virtio_iommu_probe_resv_mem *current;
+    viommu_property_buffer *bufstate = (viommu_property_buffer *)data;
+    size_t size = sizeof(*resv), total_size;
+
+    total_size = size + sizeof(*prop);
+
+    if (bufstate->filled + total_size >= VIOMMU_PROBE_SIZE) {
+        bufstate->error = true;
+        /* get the traversal stopped by returning true */
+        return true;
+    }
+    prop = (struct virtio_iommu_probe_property *)
+                (bufstate->start + bufstate->filled);
+    prop->type = cpu_to_le16(VIRTIO_IOMMU_PROBE_T_RESV_MEM) &
+                    VIRTIO_IOMMU_PROBE_T_MASK;
+    prop->length = cpu_to_le16(size);
+
+    current = (struct virtio_iommu_probe_resv_mem *)prop->value;
+    *current = *resv;
+    bufstate->filled += total_size;
+    trace_virtio_iommu_fill_resv_property(bufstate->endpoint->id,
+                                          resv->subtype, resv->addr,
+                                          resv->size, resv->subtype,
+                                          bufstate->filled);
+    return false;
+}
+
+static int virtio_iommu_fill_none_prop(viommu_property_buffer *bufstate)
+{
+    struct virtio_iommu_probe_property *prop;
+
+    prop = (struct virtio_iommu_probe_property *)
+                (bufstate->start + bufstate->filled);
+    prop->type = cpu_to_le16(VIRTIO_IOMMU_PROBE_T_NONE)
+                    & VIRTIO_IOMMU_PROBE_T_MASK;
+    prop->length = 0;
+    bufstate->filled += sizeof(*prop);
+    trace_virtio_iommu_fill_none_property(bufstate->endpoint->id);
+    return 0;
+}
+
+static int virtio_iommu_fill_property(int type,
+                                      viommu_property_buffer *bufstate)
+{
+    int ret = -ENOSPC;
+
+    if (bufstate->filled + 4 >= VIOMMU_PROBE_SIZE) {
+        /* Even the property header cannot be filled */
+        bufstate->error = true;
+        goto out;
+    }
+
+    switch (type) {
+    case VIRTIO_IOMMU_PROBE_T_NONE:
+        ret = virtio_iommu_fill_none_prop(bufstate);
+        break;
+    case VIRTIO_IOMMU_PROBE_T_RESV_MEM:
+    {
+        viommu_endpoint *ep = bufstate->endpoint;
+
+        g_tree_foreach(ep->reserved_regions,
+                       virtio_iommu_fill_resv_mem_prop,
+                       bufstate);
+        if (!bufstate->error) {
+            ret = 0;
+        }
+        break;
+    }
+    default:
+        ret = -ENOENT;
+        break;
+    }
+out:
+    if (ret) {
+        error_report("%s property of type=%d could not be filled (%d),"
+                     " remaining size = 0x%lx",
+                     __func__, type, ret, bufstate->filled);
+    }
+    return ret;
+}
+
+/**
+ * virtio_iommu_probe - Fill the probe request buffer with all
+ * the properties the device is able to return and add a NONE
+ * property at the end.
+ */
+static int virtio_iommu_probe(VirtIOIOMMU *s,
+                              struct virtio_iommu_req_probe *req,
+                              uint8_t *buf)
+{
+    uint32_t ep_id = le32_to_cpu(req->endpoint);
+    int16_t prop_types = SUPPORTED_PROBE_PROPERTIES, type;
+    viommu_property_buffer bufstate;
+    viommu_endpoint *ep;
+    int ret;
+
+    ep = g_tree_lookup(s->endpoints, GUINT_TO_POINTER(ep_id));
+    if (!ep) {
+        return -EINVAL;
+    }
+
+    bufstate.start = buf;
+    bufstate.filled = 0;
+    bufstate.error = false;
+    bufstate.endpoint = ep;
+
+    while ((type = ctz32(prop_types)) != 32) {
+        ret = virtio_iommu_fill_property(1 << type, &bufstate);
+        if (ret) {
+            break;
+        }
+        prop_types &= ~(1 << type);
+    }
+    virtio_iommu_fill_property(VIRTIO_IOMMU_PROBE_T_NONE, &bufstate);
+
+    return VIRTIO_IOMMU_S_OK;
+}
+
 #define get_payload_size(req) (\
 sizeof((req)) - sizeof(struct virtio_iommu_req_tail))
 
@@ -422,6 +572,24 @@ static int virtio_iommu_handle_unmap(VirtIOIOMMU *s,
     return virtio_iommu_unmap(s, &req);
 }
 
+static int virtio_iommu_handle_probe(VirtIOIOMMU *s,
+                                     struct iovec *iov,
+                                     unsigned int iov_cnt,
+                                     uint8_t *buf)
+{
+    struct virtio_iommu_req_probe req;
+    size_t sz, payload_sz;
+
+    payload_sz = sizeof(req);
+
+    sz = iov_to_buf(iov, iov_cnt, 0, &req, payload_sz);
+    if (sz != payload_sz) {
+        return VIRTIO_IOMMU_S_INVAL;
+    }
+
+    return virtio_iommu_probe(s, &req, buf);
+}
+
 static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
@@ -466,16 +634,32 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
         case VIRTIO_IOMMU_T_UNMAP:
             tail.status = virtio_iommu_handle_unmap(s, iov, iov_cnt);
             break;
+        case VIRTIO_IOMMU_T_PROBE:
+        {
+            struct virtio_iommu_req_tail *ptail;
+            uint8_t *buf = g_malloc0(s->config.probe_size + sizeof(tail));
+
+            ptail = (struct virtio_iommu_req_tail *)
+                        (buf + s->config.probe_size);
+            ptail->status = virtio_iommu_handle_probe(s, iov, iov_cnt, buf);
+
+            sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
+                              buf, s->config.probe_size + sizeof(tail));
+            g_free(buf);
+            assert(sz == s->config.probe_size + sizeof(tail));
+            goto push;
+        }
         default:
             tail.status = VIRTIO_IOMMU_S_UNSUPP;
         }
-        qemu_mutex_unlock(&s->mutex);
 
         sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
                           &tail, sizeof(tail));
         assert(sz == sizeof(tail));
 
-        virtqueue_push(vq, elem, sizeof(tail));
+push:
+        qemu_mutex_unlock(&s->mutex);
+        virtqueue_push(vq, elem, sz);
         virtio_notify(vdev, vq);
         g_free(elem);
     }
@@ -568,6 +752,7 @@ static uint64_t virtio_iommu_get_features(VirtIODevice *vdev, uint64_t f,
     virtio_add_feature(&f, VIRTIO_RING_F_INDIRECT_DESC);
     virtio_add_feature(&f, VIRTIO_IOMMU_F_INPUT_RANGE);
     virtio_add_feature(&f, VIRTIO_IOMMU_F_MAP_UNMAP);
+    virtio_add_feature(&f, VIRTIO_IOMMU_F_PROBE);
     return f;
 }
 
@@ -623,6 +808,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 
     s->config.page_size_mask = TARGET_PAGE_MASK;
     s->config.input_range.end = -1UL;
+    s->config.probe_size = VIOMMU_PROBE_SIZE;
 
     qemu_mutex_init(&s->mutex);
 
-- 
1.9.1

