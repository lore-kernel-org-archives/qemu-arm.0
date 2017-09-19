Received: by 10.223.172.38 with SMTP id v35csp4645474wrc;
        Tue, 19 Sep 2017 00:54:31 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDrbq5zjXpxS7CkTJ7Ht0UcoCuC5902/iIYU0NUcIAdLvRbi8ccCxummLXOUXyDAc5eGniV
X-Received: by 10.200.46.209 with SMTP id i17mr738245qta.235.1505807671467;
        Tue, 19 Sep 2017 00:54:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505807671; cv=none;
        d=google.com; s=arc-20160816;
        b=bXagZmFIXZ0Tdfg/FcJtCTLlIxlOEZmUl/2v7q/uHkjQSEsFOrl6DuXcaq6/EFYO01
         lgAveVwV0GzDAcjpZ8ywmIr9jjEb9nTTF8q53MNreYTb77363diLPTzaHRjPwidsgmc5
         wevK45lD8yaF7gwX73AFwtduB+cbaJUwXJr4vfyYpmO/Lt7TDYEgO9VSDyPi3m+cpyiF
         ETOVnL7nNbuyq80w37/o8w6OOGoL5fcZIGuvXKl77RRfQWDa9J8iSG2Q2kEg7tNSc4jy
         +jCQVFy52pdK18kXar+LtAL+6G58QzE6OzWxhBVxWDzzOPaNfzM70EI+6CbdT7oGXYcr
         Gsig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=+KBjuJSNdjofTLZTQCpXfFIZvDVPJjtn3fWsodeRw0w=;
        b=Vst+nrH9XX6AnpRbq2lRp9JEM6XWTeS8afhai4l+4reK5JXBX8XkmWQl/m2QX+r2KN
         iRA4kQURlPSvj6gbi9jI78TzX5uK4othYFQPBiJojO0CMyG/jP1S9LM3BfWi1YZtRYu+
         ut7lVBd9ZK+Fh/YcPDZGYrbct2EdayjU8tWjBPz9j66NH0JCCfdFWcUMvq72EEnvRLB0
         NKG+wSUjKtsMjQlWC3MfHkbEBE/LlQrivl/D0r5luXo6sWrCaV04JeI1P+HDoVXGITSo
         bW3qbpFromLwLB/Unx0S6y0lVEoJZhmi6mndprGCXthST78TMSHVpDyT6Df7BoYIpJFI
         +qMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j187si284942qkd.510.2017.09.19.00.54.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 00:54:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40623 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duDMT-0004wb-3f
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 03:54:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDHW-0000nV-9i
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 03:49:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDHS-0001Lr-3D
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 03:49:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46580)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1duDHR-0001Lc-QM; Tue, 19 Sep 2017 03:49:18 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B4783C0546EC;
	Tue, 19 Sep 2017 07:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B4783C0546EC
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-197.ams2.redhat.com
	[10.36.116.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C9CFF61348;
	Tue, 19 Sep 2017 07:48:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Tue, 19 Sep 2017 09:46:42 +0200
Message-Id: <1505807208-9063-11-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 19 Sep 2017 07:49:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 10/16] virtio-iommu: Implement probe request
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
X-TUID: BPZw+zB3GhCm

This patch implements the PROBE request. At the moment,
no reserved regions are returned.

At the moment reserved regions are stored per device.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

Waiting for clarifications on v0.4 spec
---
 hw/virtio/trace-events   |   2 +
 hw/virtio/virtio-iommu.c | 173 ++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 173 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 9010fbd..9ccfad1 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -46,3 +46,5 @@ virtio_iommu_unmap_left_interval(uint64_t low, uint64_t high, uint64_t next_low,
 virtio_iommu_unmap_right_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap right [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
 virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap inc [0x%"PRIx64",0x%"PRIx64"]"
 virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
+virtio_iommu_fill_resv_property(uint32_t devid, uint8_t subtype, uint64_t addr, uint64_t size, uint32_t flags, size_t filled) "dev= %d, subtype=%d addr=0x%"PRIx64" size=0x%"PRIx64" flags=%d filled=0x%lx"
+virtio_iommu_fill_none_property(uint32_t devid) "devid=%d"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index db46a91..281b0f8 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -37,6 +37,11 @@
 
 /* Max size */
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
+#define VIOMMU_PROBE_SIZE 512
+
+#define SUPPORTED_PROBE_PROPERTIES (\
+    VIRTIO_IOMMU_PROBE_T_NONE | \
+    VIRTIO_IOMMU_PROBE_T_RESV_MEM)
 
 typedef struct viommu_as {
     uint32_t id;
@@ -49,6 +54,7 @@ typedef struct viommu_dev {
     viommu_as *as;
     QLIST_ENTRY(viommu_dev) next;
     VirtIOIOMMU *viommu;
+    GTree *reserved_regions;
 } viommu_dev;
 
 typedef struct viommu_interval {
@@ -63,6 +69,13 @@ typedef struct viommu_mapping {
     uint32_t flags;
 } viommu_mapping;
 
+typedef struct viommu_property_buffer {
+    viommu_dev *dev;
+    size_t filled;
+    uint8_t *start;
+    bool error;
+} viommu_property_buffer;
+
 static inline uint16_t virtio_iommu_get_sid(IOMMUDevice *dev)
 {
     return PCI_BUILD_BDF(pci_bus_num(dev->bus), dev->devfn);
@@ -101,6 +114,9 @@ static viommu_dev *virtio_iommu_get_dev(VirtIOIOMMU *s, uint32_t devid)
     dev->viommu = s;
     trace_virtio_iommu_get_dev(devid);
     g_tree_insert(s->devices, GUINT_TO_POINTER(devid), dev);
+    dev->reserved_regions = g_tree_new_full((GCompareDataFunc)interval_cmp,
+                                            NULL, (GDestroyNotify)g_free,
+                                            (GDestroyNotify)g_free);
     return dev;
 }
 
@@ -114,6 +130,7 @@ static void virtio_iommu_put_dev(gpointer data)
     }
 
     trace_virtio_iommu_put_dev(dev->id);
+    g_tree_destroy(dev->reserved_regions);
     g_free(dev);
 }
 
@@ -369,6 +386,123 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
     return VIRTIO_IOMMU_S_INVAL;
 }
 
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
+    total_size = size + 4;
+
+    if (bufstate->filled >= VIOMMU_PROBE_SIZE) {
+        bufstate->error = true;
+        return true;
+    }
+    prop = (struct virtio_iommu_probe_property *)
+                (bufstate->start + bufstate->filled);
+    prop->type = cpu_to_le16(VIRTIO_IOMMU_PROBE_T_RESV_MEM) &
+                    VIRTIO_IOMMU_PROBE_T_MASK;
+    prop->length = size;
+
+    current = (struct virtio_iommu_probe_resv_mem *)prop->value;
+    *current = *resv;
+    bufstate->filled += total_size;
+    trace_virtio_iommu_fill_resv_property(bufstate->dev->id,
+                                          resv->subtype, resv->addr,
+                                          resv->size, resv->flags,
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
+    bufstate->filled += 4;
+    trace_virtio_iommu_fill_none_property(bufstate->dev->id);
+    return 0;
+}
+
+static int virtio_iommu_fill_property(int devid, int type,
+                                      viommu_property_buffer *bufstate)
+{
+    int ret = -ENOSPC;
+
+    if (bufstate->filled + 4 >= VIOMMU_PROBE_SIZE) {
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
+        viommu_dev *dev = bufstate->dev;
+
+        g_tree_foreach(dev->reserved_regions,
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
+static int virtio_iommu_probe(VirtIOIOMMU *s,
+                              struct virtio_iommu_req_probe *req,
+                              uint8_t *buf)
+{
+    uint32_t devid = le32_to_cpu(req->device);
+    int16_t prop_types = SUPPORTED_PROBE_PROPERTIES, type;
+    viommu_property_buffer bufstate;
+    viommu_dev *dev;
+    int ret;
+
+    dev = g_tree_lookup(s->devices, GUINT_TO_POINTER(devid));
+    if (!dev) {
+        return -EINVAL;
+    }
+
+    bufstate.start = buf;
+    bufstate.filled = 0;
+    bufstate.dev = dev;
+
+    while ((type = ctz32(prop_types)) != 32) {
+        ret = virtio_iommu_fill_property(devid, 1 << type, &bufstate);
+        if (ret) {
+            break;
+        }
+        prop_types &= ~(1 << type);
+    }
+    virtio_iommu_fill_property(devid, VIRTIO_IOMMU_PROBE_T_NONE, &bufstate);
+
+    return VIRTIO_IOMMU_S_OK;
+}
+
 #define get_payload_size(req) (\
 sizeof((req)) - sizeof(struct virtio_iommu_req_tail))
 
@@ -433,6 +567,24 @@ static int virtio_iommu_handle_unmap(VirtIOIOMMU *s,
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
+    payload_sz = get_payload_size(req);
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
@@ -477,16 +629,31 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
         case VIRTIO_IOMMU_T_UNMAP:
             tail.status = virtio_iommu_handle_unmap(s, iov, iov_cnt);
             break;
+        case VIRTIO_IOMMU_T_PROBE:
+        {
+            struct virtio_iommu_req_tail *ptail;
+            uint8_t *buf = g_malloc0(s->config.probe_size + sizeof(tail));
+
+            ptail = (struct virtio_iommu_req_tail *)buf + s->config.probe_size;
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
@@ -574,6 +741,7 @@ static uint64_t virtio_iommu_get_features(VirtIODevice *vdev, uint64_t f,
     virtio_add_feature(&f, VIRTIO_RING_F_INDIRECT_DESC);
     virtio_add_feature(&f, VIRTIO_IOMMU_F_INPUT_RANGE);
     virtio_add_feature(&f, VIRTIO_IOMMU_F_MAP_UNMAP);
+    virtio_add_feature(&f, VIRTIO_IOMMU_F_PROBE);
     return f;
 }
 
@@ -631,6 +799,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 
     s->config.page_size_mask = TARGET_PAGE_MASK;
     s->config.input_range.end = -1UL;
+    s->config.probe_size = VIOMMU_PROBE_SIZE;
 
     qemu_mutex_init(&s->mutex);
 
-- 
2.5.5

