Received: by 10.25.0.23 with SMTP id 23csp2161170lfa;
        Wed, 7 Jun 2017 09:06:00 -0700 (PDT)
X-Received: by 10.200.41.112 with SMTP id z45mr869503qtz.238.1496851560374;
        Wed, 07 Jun 2017 09:06:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496851560; cv=none;
        d=google.com; s=arc-20160816;
        b=Dl2bW9zQmhO1QbtWn2/s7EgqNFEbVyG1ZAo9cgxSZO1IvI9AWTb9Kcvs0UeIihq1cj
         nhsDasS4sGY3dtz+35fsHTyFDjV3Jrti/mivebO/6WUrmETFPDr4s+L7opPne6JpM/hV
         S+iQE9zr45vxtabOHbpic/48YnA4w0ZkMTG9mPggUwdEw/CILra/eh0mUgmjw1i0UcbB
         2MbKm2SNu/otMncBde0zvHVOxeLgUCUCKu5NOf2cr7WB0zomZYFZxlcyt8YKF8FobVrF
         64AA1dtc/5OvN7NS31Z6L1UbwXWTcxubiHSqOMe3os/UEv0y759/Afg1GvjUEIppLc9H
         7XIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=qwY1d0z9Wyi+jQYvVZH5z7JNBu95w6cqMeVEpEReRdk=;
        b=H+x1GUvhIS/zaibHTxpyyBNWCvbRWQlhhyUZ+4OI3rRvv+njuHpSbZQ7uR/l9oJbtq
         UYm6GbOvYg4OdLW8s9/EhTN8TqA6URuXJNik5e06VYClX+YcVTRjwZwn+cq+r0RBcw2/
         GV4ZRlOlRYCHi9e0R0izzW63HhWE61hFrr5+x6uQdoJTvOdrOG0hMfKOUXEBU+r+HhsM
         qWnuy6CvvHVTY6+XzNbLDKzim6msNQY28YjMuN2agtYQMStV4wVt0yDX53BhsrceFCFp
         uQy0mtX7BS82eJkuIkccg+FlWckvF6vzDWn2Mq4I304r56atNIRIOkItHg3fiWZxCXxz
         83LQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a31si2422873qtb.176.2017.06.07.09.05.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Jun 2017 09:06:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44942 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dIdT3-0001o8-PP
	for alex.bennee@linaro.org; Wed, 07 Jun 2017 12:05:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dIdPP-0006KE-Du
	for qemu-devel@nongnu.org; Wed, 07 Jun 2017 12:02:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dIdPJ-000843-U6
	for qemu-devel@nongnu.org; Wed, 07 Jun 2017 12:02:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46914)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dIdPE-00082H-7K; Wed, 07 Jun 2017 12:02:00 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F060283F3D;
	Wed,  7 Jun 2017 16:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com F060283F3D
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com F060283F3D
Received: from localhost.localdomain.com (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 41DEB189A9;
	Wed,  7 Jun 2017 16:01:48 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Wed,  7 Jun 2017 18:01:22 +0200
Message-Id: <1496851287-9428-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 07 Jun 2017 16:01:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v2 3/8] virtio_iommu: add skeleton
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
Cc: wei@redhat.com, kevin.tian@intel.com, bharat.bhushan@nxp.com,
	marc.zyngier@arm.com, tn@semihalf.com, will.deacon@arm.com,
	drjones@redhat.com, robin.murphy@arm.com, christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h2SAAWZyrfkI

This patchs adds the skeleton for the virtio-iommu device.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/Makefile.objs          |   1 +
 hw/virtio/virtio-iommu.c         | 247 +++++++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-iommu.h |  60 ++++++++++
 3 files changed, 308 insertions(+)
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
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
new file mode 100644
index 0000000..86129ef
--- /dev/null
+++ b/hw/virtio/virtio-iommu.c
@@ -0,0 +1,247 @@
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
+
+    memcpy(config_data, &dev->config, sizeof(struct virtio_iommu_config));
+}
+
+static void virtio_iommu_set_config(VirtIODevice *vdev,
+                                      const uint8_t *config_data)
+{
+    VirtIOIOMMU *dev = VIRTIO_IOMMU(vdev);
+    struct virtio_iommu_config config;
+
+    memcpy(&config, config_data, sizeof(struct virtio_iommu_config));
+
+    dev->config.page_sizes = le64_to_cpu(config.page_sizes);
+    dev->config.input_range.end = le64_to_cpu(config.input_range.end);
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
+    return f;
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
+    s->vq = virtio_add_queue(vdev, VIOMMU_DEFAULT_QUEUE_SIZE,
+                             virtio_iommu_handle_command);
+
+    s->config.page_sizes = ~((1ULL << 12) - 1);
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
+}
+
+static void virtio_iommu_set_status(VirtIODevice *vdev, uint8_t status)
+{
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
index 0000000..2259413
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
+    MemoryRegion  iommu_mr;
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
+    VirtQueue *vq;
+    struct virtio_iommu_config config;
+    MemoryRegionIOMMUOps iommu_ops;
+    uint32_t host_features;
+    GHashTable *as_by_busptr;
+    IOMMUPciBus *as_by_bus_num[IOMMU_PCI_BUS_MAX];
+    GTree *address_spaces;
+    QemuMutex mutex;
+    GTree *devices;
+} VirtIOIOMMU;
+
+#endif
-- 
2.5.5

