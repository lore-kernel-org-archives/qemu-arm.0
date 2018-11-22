Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp974449wrt;
        Thu, 22 Nov 2018 09:43:14 -0800 (PST)
X-Google-Smtp-Source: AJdET5fryxp94TVaV9uexI/IbkG3VAX7DVdP/NEjQPO9csvhEp3vRZSDILM0GrU4OL4ogPMllVU/
X-Received: by 2002:a81:3e05:: with SMTP id l5mr12417552ywa.508.1542908593984;
        Thu, 22 Nov 2018 09:43:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542908593; cv=none;
        d=google.com; s=arc-20160816;
        b=ursjK/Cf+x5NnFtFsEQN+hIJzF8X7BedhXqqH7fP1Urge2hCBIUMQCN+l24yCSl5sh
         h18QbYgtK2iBOgL4XDbwrKWLmXua3mE+53HRNOUtR4AHdaYvWxTexyWStwe3inGpsdPJ
         9Fymip2CcZDvGOoDbkl2dlclZQspWj5SnmrHIUbgFQEBA0ccqFSqoHZ1pThn0lLfBwIo
         nqO/ipgzQhF5ys5f3ZbDIzU+lbni2zGMuGoRzzWcPtZnnQ9Fg+9L5DIIu8tOTs253B4E
         eepH6acTNk/6evkb9wTFmVwi03fx9X7gcoK0gjk67dQ7mOzzTxfh5NT/5g/6EWshUrjl
         Rtvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=xZjH8jf5GQ5sNNCkGyBECCPWe/1Z9ZTayWqRSLmMSOU=;
        b=w/KNgDdBE1Qij4qhGjUiWet3NMK40YoSvkeXPmbrfJMwKbZEY5tp98OnIKFXlSHURA
         2E6o8aaBafBQIjPbvipbtXNVmGJpT66s6TYOIO4BiMtUoeOBDaiN703RT4AJoIu+OzDt
         hYL3Fw0BESivRn8DdrWt1fYTyi0TgJ+zrLg2I4V7Cpjycsn7WsT4xlDoZFjzreuMPFiF
         DCOKFIRKGgI9ZC0/O6lhyxDnNcnrLqlfsu2DpGzJcqjm4+gm+tvlNs57k4CLZA0rRexN
         GGRMs8AAvxUvyEqgDIIxkg834H0gkO1YdWgWfJxsPzSMFjjT4KgNwql4uDh+QDC8mru7
         xvWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c16si4817890ywk.105.2018.11.22.09.43.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 09:43:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48514 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPt0T-00047N-HN
	for alex.bennee@linaro.org; Thu, 22 Nov 2018 12:43:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gPsb0-0005Lu-MP
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 12:16:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gPsat-0006HR-9t
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 12:16:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56048)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gPsaj-0006Bk-D9; Thu, 22 Nov 2018 12:16:37 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5D4B59F733;
	Thu, 22 Nov 2018 17:16:36 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-235.ams2.redhat.com [10.36.116.235])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 919AA60610;
	Thu, 22 Nov 2018 17:16:26 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	jean-philippe.brucker@arm.com
Date: Thu, 22 Nov 2018 18:15:31 +0100
Message-Id: <20181122171538.12359-11-eric.auger@redhat.com>
In-Reply-To: <20181122171538.12359-1-eric.auger@redhat.com>
References: <20181122171538.12359-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 22 Nov 2018 17:16:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v9 10/17] virtio-iommu: Implement probe request
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
X-TUID: 5eVvWN3JQ9Ny

This patch implements the PROBE request. At the moment,
no reserved regions are returned as none are registered
per device. Only a NONE property is returned.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v8 -> v9:
- fix filling of properties (changes induced by v0.7 -> v0.8 spec
  evolution)

v7 -> v8:
- adapt to removal of value filed in virtio_iommu_probe_property

v6 -> v7:
- adapt to the change in virtio_iommu_probe_resv_mem fields
- use get_endpoint() instead of directly checking the EP
  was registered.

v4 -> v5:
- initialize bufstate.error to false
- add cpu_to_le64(size)
---
 hw/virtio/trace-events   |   2 +
 hw/virtio/virtio-iommu.c | 181 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 181 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 1f0e143b55..19824c3e91 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -69,3 +69,5 @@ virtio_iommu_unmap_left_interval(uint64_t low, uint64_t high, uint64_t next_low,
 virtio_iommu_unmap_right_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap right [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
 virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap inc [0x%"PRIx64",0x%"PRIx64"]"
 virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
+virtio_iommu_fill_resv_property(uint32_t devid, uint8_t subtype, uint64_t start, uint64_t end, uint32_t flags, size_t filled) "dev= %d, subtype=%d start=0x%"PRIx64" end=0x%"PRIx64" flags=%d filled=0x%lx"
+virtio_iommu_fill_none_property(uint32_t devid) "devid=%d"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index af90413b37..4fc43494d9 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -39,6 +39,10 @@
 
 /* Max size */
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
+#define VIOMMU_PROBE_SIZE 512
+
+#define SUPPORTED_PROBE_PROPERTIES (\
+    1 << VIRTIO_IOMMU_PROBE_T_RESV_MEM)
 
 typedef struct viommu_domain {
     uint32_t id;
@@ -51,6 +55,7 @@ typedef struct viommu_endpoint {
     viommu_domain *domain;
     QLIST_ENTRY(viommu_endpoint) next;
     VirtIOIOMMU *viommu;
+    GTree *reserved_regions;
 } viommu_endpoint;
 
 typedef struct viommu_interval {
@@ -65,6 +70,13 @@ typedef struct viommu_mapping {
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
@@ -104,6 +116,9 @@ static viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
     ep->viommu = s;
     trace_virtio_iommu_get_endpoint(ep_id);
     g_tree_insert(s->endpoints, GUINT_TO_POINTER(ep_id), ep);
+    ep->reserved_regions = g_tree_new_full((GCompareDataFunc)interval_cmp,
+                                            NULL, (GDestroyNotify)g_free,
+                                            (GDestroyNotify)g_free);
     return ep;
 }
 
@@ -117,6 +132,7 @@ static void virtio_iommu_put_endpoint(gpointer data)
     }
 
     trace_virtio_iommu_put_endpoint(ep->id);
+    g_tree_destroy(ep->reserved_regions);
     g_free(ep);
 }
 
@@ -352,6 +368,131 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
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
+    struct virtio_iommu_probe_resv_mem *buf_prop;
+    viommu_property_buffer *bufstate = (viommu_property_buffer *)data;
+    size_t prop_size = sizeof(*resv);
+
+    if (bufstate->filled + prop_size >= VIOMMU_PROBE_SIZE) {
+        bufstate->error = true;
+        /* get the traversal stopped by returning true */
+        return true;
+    }
+    buf_prop = (struct virtio_iommu_probe_resv_mem *)
+                (bufstate->start + bufstate->filled);
+    *buf_prop = *resv;
+
+    bufstate->filled += prop_size;
+    trace_virtio_iommu_fill_resv_property(bufstate->endpoint->id,
+                                          resv->subtype, resv->start,
+                                          resv->end, resv->subtype,
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
+/* Fill the properties[] buffer with properties of type @type */
+static int virtio_iommu_fill_property(int type,
+                                      viommu_property_buffer *bufstate)
+{
+    int ret = -ENOSPC;
+
+    if (bufstate->filled + sizeof(struct virtio_iommu_probe_property)
+            >= VIOMMU_PROBE_SIZE) {
+        /* no space left for the header */
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
+    ep = virtio_iommu_get_endpoint(s, ep_id);
+
+    bufstate.start = buf;
+    bufstate.filled = 0;
+    bufstate.error = false;
+    bufstate.endpoint = ep;
+
+    while ((type = ctz32(prop_types)) != 32) {
+        ret = virtio_iommu_fill_property(type, &bufstate);
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
 
@@ -416,6 +557,24 @@ static int virtio_iommu_handle_unmap(VirtIOIOMMU *s,
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
@@ -460,16 +619,32 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
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
@@ -632,6 +807,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     s->config.page_size_mask = TARGET_PAGE_MASK;
     s->config.input_range.end = -1UL;
     s->config.domain_bits = 32;
+    s->config.probe_size = VIOMMU_PROBE_SIZE;
 
     virtio_add_feature(&s->features, VIRTIO_RING_F_EVENT_IDX);
     virtio_add_feature(&s->features, VIRTIO_RING_F_INDIRECT_DESC);
@@ -640,6 +816,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     virtio_add_feature(&s->features, VIRTIO_IOMMU_F_DOMAIN_BITS);
     virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MAP_UNMAP);
     virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS);
+    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_PROBE);
 
     qemu_mutex_init(&s->mutex);
 
-- 
2.17.2

