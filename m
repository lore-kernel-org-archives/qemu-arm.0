Received: by 10.28.71.27 with SMTP id u27csp213933wma;
        Mon, 12 Feb 2018 11:09:02 -0800 (PST)
X-Google-Smtp-Source: AH8x226YBQ7gPneUinlXUK3jZWFlnT0AwM4O16Xf0VD7UusnbovFDFCBz4wZrbv9XIOBQjPnDDMm
X-Received: by 10.129.122.197 with SMTP id v188mr8209905ywc.280.1518462542747;
        Mon, 12 Feb 2018 11:09:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518462542; cv=none;
        d=google.com; s=arc-20160816;
        b=P4/8gmeq3M3ZOOd1dXxyu86w5+jzTarZ18TJOYEsSXHwRWlL9DlnmSDzRqSTFwqRzR
         DM95GdMeenNMFnlwykVxEDROp0AMFC6RVz5d0uik3LZMvCFc2lw6fr4IqsCJNv2829XQ
         RWLyZQ1tv8Eti+HRDEhVWikV33iQM7Hu358KeLzMfytYDcrqJPTVbzy1bwdZ2U3Lnt0T
         tW8SamqBMow2L1pTz9EaFrBuUkZBaw40iscF86rlYErev5bzEP83D3tbv3lxeyrOg/Yq
         QSqUFlLp1f2XvEleDz0yxvXhiolUQrgijJFpQsE37f2UrHHsTqwAgi1mSVMsZrRqocWI
         kvjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=W1kdVAEj6hcrnSTj1W8IoVZAFi3PWIa+zeMqVpMmTsU=;
        b=Lc+H0TSkehR4YTCLkYrIPhmLunfncbyY7MxqtZmNQ87OXX12Qj7d+SqzFIRNt36S5a
         Xxn3e9mm63cgURyoxUMOhHspigW6JLTYrlZrqoI4u1TuHPnEz9i+P/6AYFS//ZP/GDTt
         a5uNMEKcmDN11iw3WPWVDYI95JT7in7AKOPWMAuEIPZ35VTS6KzSwSWuI+PSaN5o4oHb
         KHMWGs4Tkszii3MIRlW6E8i/lI8Gyil9tu18/RUPCK8TYx8lfELI51HfCtx+zAjBS2xu
         6GY0vSlf/CDMj4zi4CWPEaVUReZiBwEp+c1nS/YExBnKs6OkhqHq4M92qbfkPRTAVUqf
         wFpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r125si1637442ywh.496.2018.02.12.11.09.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 11:09:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39993 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elJTK-0008U8-3F
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 14:09:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJK1-0000Fl-Uj
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 13:59:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJK0-0003Cq-6M
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 13:59:26 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55978 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1elJJz-0003AA-Cc; Mon, 12 Feb 2018 13:59:23 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA29340FB633;
	Mon, 12 Feb 2018 18:59:22 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-182.ams2.redhat.com [10.36.116.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A5293100858F;
	Mon, 12 Feb 2018 18:59:15 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Mon, 12 Feb 2018 18:58:08 +0000
Message-Id: <1518461904-5305-7-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
References: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 12 Feb 2018 18:59:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 12 Feb 2018 18:59:22 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v6 06/22] virtio-iommu: Add skeleton
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
X-TUID: JENk8/mTFEaq

This patchs adds the skeleton for the virtio-iommu device.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v4 -> v5:
- use the new v0.5 terminology (domain, endpoint)
- add the event virtqueue

v3 -> v4:
- use page_size_mask instead of page_sizes
- added set_features()
- added some traces (reset, set_status, set_features)
- empty virtio_iommu_set_config() as the driver MUST NOT
  write to device configuration fields
- add get_config trace

v2 -> v3:
- rebase on 2.10-rc0, ie. use IOMMUMemoryRegion and remove
  iommu_ops.
- advertise VIRTIO_IOMMU_F_MAP_UNMAP feature
- page_sizes set to TARGET_PAGE_SIZE

Conflicts:
	hw/virtio/trace-events
---
 hw/virtio/Makefile.objs          |   1 +
 hw/virtio/trace-events           |   7 ++
 hw/virtio/virtio-iommu.c         | 256 +++++++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-iommu.h |  60 +++++++++
 4 files changed, 324 insertions(+)
 create mode 100644 hw/virtio/virtio-iommu.c
 create mode 100644 include/hw/virtio/virtio-iommu.h

diff --git a/hw/virtio/Makefile.objs b/hw/virtio/Makefile.objs
index 765d363..8967a4a 100644
--- a/hw/virtio/Makefile.objs
+++ b/hw/virtio/Makefile.objs
@@ -6,6 +6,7 @@ common-obj-y += virtio-mmio.o
 
 obj-y += virtio.o virtio-balloon.o 
 obj-$(CONFIG_LINUX) += vhost.o vhost-backend.o vhost-user.o
+obj-$(CONFIG_LINUX) += virtio-iommu.o
 obj-$(CONFIG_VHOST_VSOCK) += vhost-vsock.o
 obj-y += virtio-crypto.o
 obj-$(CONFIG_VIRTIO_PCI) += virtio-crypto-pci.o
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 2b8f81e..0094703 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -31,3 +31,10 @@ vhost_region_add(void *p, const char *mr) "dev %p mr %s"
 vhost_region_del(void *p, const char *mr) "dev %p mr %s"
 vhost_iommu_region_add(void *p, const char *mr) "dev %p mr %s"
 vhost_iommu_region_del(void *p, const char *mr) "dev %p mr %s"
+
+# hw/virtio/virtio-iommu.c
+#
+virtio_iommu_set_features(uint64_t features) "features accepted by the driver =0x%"PRIx64
+virtio_iommu_device_reset(void) "reset!"
+virtio_iommu_device_status(uint8_t status) "driver status = %d"
+virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint8_t ioasid_bits, uint32_t probe_size) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" ioasid_bits=%d probe_size=0x%x"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
new file mode 100644
index 0000000..52430dc
--- /dev/null
+++ b/hw/virtio/virtio-iommu.c
@@ -0,0 +1,256 @@
+/*
+ * virtio-iommu device
+ *
+ * Copyright (c) 2017 Red Hat, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/iov.h"
+#include "qemu-common.h"
+#include "hw/virtio/virtio.h"
+#include "sysemu/kvm.h"
+#include "qapi-event.h"
+#include "trace.h"
+
+#include "standard-headers/linux/virtio_ids.h"
+#include <linux/virtio_iommu.h>
+
+#include "hw/virtio/virtio-bus.h"
+#include "hw/virtio/virtio-access.h"
+#include "hw/virtio/virtio-iommu.h"
+
+/* Max size */
+#define VIOMMU_DEFAULT_QUEUE_SIZE 256
+
+static int virtio_iommu_handle_attach(VirtIOIOMMU *s,
+                                      struct iovec *iov,
+                                      unsigned int iov_cnt)
+{
+    return -ENOENT;
+}
+static int virtio_iommu_handle_detach(VirtIOIOMMU *s,
+                                      struct iovec *iov,
+                                      unsigned int iov_cnt)
+{
+    return -ENOENT;
+}
+static int virtio_iommu_handle_map(VirtIOIOMMU *s,
+                                   struct iovec *iov,
+                                   unsigned int iov_cnt)
+{
+    return -ENOENT;
+}
+static int virtio_iommu_handle_unmap(VirtIOIOMMU *s,
+                                     struct iovec *iov,
+                                     unsigned int iov_cnt)
+{
+    return -ENOENT;
+}
+
+static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
+{
+    VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
+    VirtQueueElement *elem;
+    struct virtio_iommu_req_head head;
+    struct virtio_iommu_req_tail tail;
+    unsigned int iov_cnt;
+    struct iovec *iov;
+    size_t sz;
+
+    for (;;) {
+        elem = virtqueue_pop(vq, sizeof(VirtQueueElement));
+        if (!elem) {
+            return;
+        }
+
+        if (iov_size(elem->in_sg, elem->in_num) < sizeof(tail) ||
+            iov_size(elem->out_sg, elem->out_num) < sizeof(head)) {
+            virtio_error(vdev, "virtio-iommu erroneous head or tail");
+            virtqueue_detach_element(vq, elem, 0);
+            g_free(elem);
+            break;
+        }
+
+        iov_cnt = elem->out_num;
+        iov = g_memdup(elem->out_sg, sizeof(struct iovec) * elem->out_num);
+        sz = iov_to_buf(iov, iov_cnt, 0, &head, sizeof(head));
+        if (sz != sizeof(head)) {
+            tail.status = VIRTIO_IOMMU_S_UNSUPP;
+        }
+        qemu_mutex_lock(&s->mutex);
+        switch (head.type) {
+        case VIRTIO_IOMMU_T_ATTACH:
+            tail.status = virtio_iommu_handle_attach(s, iov, iov_cnt);
+            break;
+        case VIRTIO_IOMMU_T_DETACH:
+            tail.status = virtio_iommu_handle_detach(s, iov, iov_cnt);
+            break;
+        case VIRTIO_IOMMU_T_MAP:
+            tail.status = virtio_iommu_handle_map(s, iov, iov_cnt);
+            break;
+        case VIRTIO_IOMMU_T_UNMAP:
+            tail.status = virtio_iommu_handle_unmap(s, iov, iov_cnt);
+            break;
+        default:
+            tail.status = VIRTIO_IOMMU_S_UNSUPP;
+        }
+        qemu_mutex_unlock(&s->mutex);
+
+        sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
+                          &tail, sizeof(tail));
+        assert(sz == sizeof(tail));
+
+        virtqueue_push(vq, elem, sizeof(tail));
+        virtio_notify(vdev, vq);
+        g_free(elem);
+    }
+}
+
+static void virtio_iommu_get_config(VirtIODevice *vdev, uint8_t *config_data)
+{
+    VirtIOIOMMU *dev = VIRTIO_IOMMU(vdev);
+    struct virtio_iommu_config *config = &dev->config;
+
+    trace_virtio_iommu_get_config(config->page_size_mask,
+                                  config->input_range.start,
+                                  config->input_range.end,
+                                  config->domain_bits,
+                                  config->probe_size);
+    memcpy(config_data, &dev->config, sizeof(struct virtio_iommu_config));
+}
+
+static void virtio_iommu_set_config(VirtIODevice *vdev,
+                                      const uint8_t *config_data)
+{
+}
+
+static uint64_t virtio_iommu_get_features(VirtIODevice *vdev, uint64_t f,
+                                            Error **errp)
+{
+    VirtIOIOMMU *dev = VIRTIO_IOMMU(vdev);
+    f |= dev->host_features;
+    virtio_add_feature(&f, VIRTIO_RING_F_EVENT_IDX);
+    virtio_add_feature(&f, VIRTIO_RING_F_INDIRECT_DESC);
+    virtio_add_feature(&f, VIRTIO_IOMMU_F_INPUT_RANGE);
+    virtio_add_feature(&f, VIRTIO_IOMMU_F_MAP_UNMAP);
+    return f;
+}
+
+static void virtio_iommu_set_features(VirtIODevice *vdev, uint64_t val)
+{
+    trace_virtio_iommu_set_features(val);
+}
+
+static int virtio_iommu_post_load_device(void *opaque, int version_id)
+{
+    return 0;
+}
+
+static const VMStateDescription vmstate_virtio_iommu_device = {
+    .name = "virtio-iommu-device",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .post_load = virtio_iommu_post_load_device,
+    .fields = (VMStateField[]) {
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
+
+    virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
+                sizeof(struct virtio_iommu_config));
+
+    s->req_vq = virtio_add_queue(vdev, VIOMMU_DEFAULT_QUEUE_SIZE,
+                             virtio_iommu_handle_command);
+    s->event_vq = virtio_add_queue(vdev, VIOMMU_DEFAULT_QUEUE_SIZE, NULL);
+
+    s->config.page_size_mask = TARGET_PAGE_MASK;
+    s->config.input_range.end = -1UL;
+}
+
+static void virtio_iommu_device_unrealize(DeviceState *dev, Error **errp)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+
+    virtio_cleanup(vdev);
+}
+
+static void virtio_iommu_device_reset(VirtIODevice *vdev)
+{
+    trace_virtio_iommu_device_reset();
+}
+
+static void virtio_iommu_set_status(VirtIODevice *vdev, uint8_t status)
+{
+    trace_virtio_iommu_device_status(status);
+}
+
+static void virtio_iommu_instance_init(Object *obj)
+{
+}
+
+static const VMStateDescription vmstate_virtio_iommu = {
+    .name = "virtio-iommu",
+    .minimum_version_id = 1,
+    .version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_VIRTIO_DEVICE,
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static Property virtio_iommu_properties[] = {
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void virtio_iommu_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
+
+    dc->props = virtio_iommu_properties;
+    dc->vmsd = &vmstate_virtio_iommu;
+
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    vdc->realize = virtio_iommu_device_realize;
+    vdc->unrealize = virtio_iommu_device_unrealize;
+    vdc->reset = virtio_iommu_device_reset;
+    vdc->get_config = virtio_iommu_get_config;
+    vdc->set_config = virtio_iommu_set_config;
+    vdc->get_features = virtio_iommu_get_features;
+    vdc->set_features = virtio_iommu_set_features;
+    vdc->set_status = virtio_iommu_set_status;
+    vdc->vmsd = &vmstate_virtio_iommu_device;
+}
+
+static const TypeInfo virtio_iommu_info = {
+    .name = TYPE_VIRTIO_IOMMU,
+    .parent = TYPE_VIRTIO_DEVICE,
+    .instance_size = sizeof(VirtIOIOMMU),
+    .instance_init = virtio_iommu_instance_init,
+    .class_init = virtio_iommu_class_init,
+};
+
+static void virtio_register_types(void)
+{
+    type_register_static(&virtio_iommu_info);
+}
+
+type_init(virtio_register_types)
diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
new file mode 100644
index 0000000..d7cf73b
--- /dev/null
+++ b/include/hw/virtio/virtio-iommu.h
@@ -0,0 +1,60 @@
+/*
+ * virtio-iommu device
+ *
+ * Copyright (c) 2017 Red Hat, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#ifndef QEMU_VIRTIO_IOMMU_H
+#define QEMU_VIRTIO_IOMMU_H
+
+#include "standard-headers/linux/virtio_iommu.h"
+#include "hw/virtio/virtio.h"
+#include "hw/pci/pci.h"
+
+#define TYPE_VIRTIO_IOMMU "virtio-iommu-device"
+#define VIRTIO_IOMMU(obj) \
+        OBJECT_CHECK(VirtIOIOMMU, (obj), TYPE_VIRTIO_IOMMU)
+
+#define IOMMU_PCI_BUS_MAX      256
+#define IOMMU_PCI_DEVFN_MAX    256
+
+typedef struct IOMMUDevice {
+    void         *viommu;
+    PCIBus       *bus;
+    int           devfn;
+    IOMMUMemoryRegion  iommu_mr;
+    AddressSpace  as;
+} IOMMUDevice;
+
+typedef struct IOMMUPciBus {
+    PCIBus       *bus;
+    IOMMUDevice  *pbdev[0]; /* Parent array is sparse, so dynamically alloc */
+} IOMMUPciBus;
+
+typedef struct VirtIOIOMMU {
+    VirtIODevice parent_obj;
+    VirtQueue *req_vq;
+    VirtQueue *event_vq;
+    struct virtio_iommu_config config;
+    uint32_t host_features;
+    GHashTable *as_by_busptr;
+    IOMMUPciBus *as_by_bus_num[IOMMU_PCI_BUS_MAX];
+    GTree *domains;
+    QemuMutex mutex;
+    GTree *endpoints;
+} VirtIOIOMMU;
+
+#endif
-- 
1.9.1

