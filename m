Received: by 10.28.71.27 with SMTP id u27csp219063wma;
        Mon, 12 Feb 2018 11:14:41 -0800 (PST)
X-Google-Smtp-Source: AH8x225EI4yDfH6tisC6rmWjtHzeU9/skIHWlGN+soJ5BkM9m+5b96eBYxeLdJ1NIPRxW/5buP/o
X-Received: by 10.129.103.87 with SMTP id b84mr8976020ywc.470.1518462881117;
        Mon, 12 Feb 2018 11:14:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518462881; cv=none;
        d=google.com; s=arc-20160816;
        b=ga8XAbq5ruCKte33zVgKXIMGLVrxd89vF1foHDtQtXT6h5A2nKMu3/PXGYYuwTQeD/
         x4G9eM53g5qSYAxE6wu06rxisFFf1Uf2O9d/1C7Miw7jbR1tV+pebbiK6NKGLHMu2XjK
         kFqkdfmEYNT8WyaNiZHxdp4iVYPklUu0zmZXutTZIYusZYZWwcL651DfVXGIUb5IdPyW
         OmAi21oXjBy3z/puJhcT+51wztTf0Mmd2NUhEAK5WVrpILq1ZblWwbzIaH+HikI7UOwm
         +qf2zs64QoBvXx/Ha7yfez+oLzogmxJ7q8Gy/3AlIEXtp6JCk6p7jepDIC42wwTAtVcr
         eS0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=PKttefg7CUBQwYJuilfB0hpG8RbcQz7N2/j4nOcPnSM=;
        b=L1B8Ez9aRVXgzzGJFBSa/yCiZfaD8AnWv7KvYftWfvG/Q0DDAfm+oiqCgYUldBBNSC
         PxYsb5zF1gT3hCzeX02YihrBtV66q05ofW0IOxS053ucNB6fM7XJ+1o09V2rVfVslCMj
         BONmmaB042E8JMPVaKavD8+3S+bZOCk4O2zNHKJo+wHrMVKz2XNx2MYqdXLFN/Sff3m2
         ENvR2Pk/a9R2GjHLWrbB8CXWTaZeFgYNT6+n+/AYTiKfnK3jlmG4WmFPdhww+qWMd8T3
         brIRi9lTYv+qYbOhY1Xn0PicLZS2RwYZp6aLsvBVPWUz79mksNLXS0glHXo40lT18RQx
         EyUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i203si1617046yba.59.2018.02.12.11.14.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 11:14:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40129 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elJYm-00054z-Eg
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 14:14:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48383)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJKp-00013L-Rq
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 14:00:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJKl-0004ml-93
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 14:00:15 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34252 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1elJKl-0004lR-3W; Mon, 12 Feb 2018 14:00:11 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8846A8182D32;
	Mon, 12 Feb 2018 19:00:10 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-182.ams2.redhat.com [10.36.116.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7AAB81008591;
	Mon, 12 Feb 2018 19:00:01 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Mon, 12 Feb 2018 18:58:15 +0000
Message-Id: <1518461904-5305-14-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
References: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 12 Feb 2018 19:00:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 12 Feb 2018 19:00:10 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v6 13/22] virtio-iommu: Implement probe request
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
X-TUID: ulrz5d93JgHI

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
index 785d1fa..e3a916c 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -52,3 +52,5 @@ virtio_iommu_unmap_left_interval(uint64_t low, uint64_t high, uint64_t next_low,
 virtio_iommu_unmap_right_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap right [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
 virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap inc [0x%"PRIx64",0x%"PRIx64"]"
 virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
+virtio_iommu_fill_resv_property(uint32_t devid, uint8_t subtype, uint64_t addr, uint64_t size, uint32_t flags, size_t filled) "dev= %d, subtype=%d addr=0x%"PRIx64" size=0x%"PRIx64" flags=%d filled=0x%lx"
+virtio_iommu_fill_none_property(uint32_t devid) "devid=%d"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 8c806dc..85c5b95 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -41,6 +41,11 @@
 
 /* Max size */
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
+#define VIOMMU_PROBE_SIZE 512
+
+#define SUPPORTED_PROBE_PROPERTIES (\
+    VIRTIO_IOMMU_PROBE_T_NONE | \
+    VIRTIO_IOMMU_PROBE_T_RESV_MEM)
 
 typedef struct viommu_domain {
     uint32_t id;
@@ -53,6 +58,7 @@ typedef struct viommu_endpoint {
     viommu_domain *domain;
     QLIST_ENTRY(viommu_endpoint) next;
     VirtIOIOMMU *viommu;
+    GTree *reserved_regions;
 } viommu_endpoint;
 
 typedef struct viommu_interval {
@@ -67,6 +73,13 @@ typedef struct viommu_mapping {
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
@@ -106,6 +119,9 @@ static viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
     ep->viommu = s;
     trace_virtio_iommu_get_endpoint(ep_id);
     g_tree_insert(s->endpoints, GUINT_TO_POINTER(ep_id), ep);
+    ep->reserved_regions = g_tree_new_full((GCompareDataFunc)interval_cmp,
+                                            NULL, (GDestroyNotify)g_free,
+                                            (GDestroyNotify)g_free);
     return ep;
 }
 
@@ -119,6 +135,7 @@ static void virtio_iommu_put_endpoint(gpointer data)
     }
 
     trace_virtio_iommu_put_endpoint(ep->id);
+    g_tree_destroy(ep->reserved_regions);
     g_free(ep);
 }
 
@@ -362,6 +379,139 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
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
 
@@ -426,6 +576,24 @@ static int virtio_iommu_handle_unmap(VirtIOIOMMU *s,
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
@@ -470,16 +638,32 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
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
@@ -575,6 +759,7 @@ static uint64_t virtio_iommu_get_features(VirtIODevice *vdev, uint64_t f,
     virtio_add_feature(&f, VIRTIO_RING_F_INDIRECT_DESC);
     virtio_add_feature(&f, VIRTIO_IOMMU_F_INPUT_RANGE);
     virtio_add_feature(&f, VIRTIO_IOMMU_F_MAP_UNMAP);
+    virtio_add_feature(&f, VIRTIO_IOMMU_F_PROBE);
     return f;
 }
 
@@ -630,6 +815,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 
     s->config.page_size_mask = TARGET_PAGE_MASK;
     s->config.input_range.end = -1UL;
+    s->config.probe_size = VIOMMU_PROBE_SIZE;
 
     qemu_mutex_init(&s->mutex);
 
-- 
1.9.1

