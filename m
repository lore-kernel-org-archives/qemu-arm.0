Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp963290wrt;
        Thu, 22 Nov 2018 09:32:06 -0800 (PST)
X-Google-Smtp-Source: AJdET5drW+7LtjTyc37mGA+C8WPwU34JEuxcQnMJLLXuyb00y/ODYofWRvytuts0Wml2hhKrPEc1
X-Received: by 2002:a81:2890:: with SMTP id o138mr12707833ywo.168.1542907926504;
        Thu, 22 Nov 2018 09:32:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542907926; cv=none;
        d=google.com; s=arc-20160816;
        b=ye+oF0vuzzGxoBLPNTYGlfnd//lkNNWO5b+8OglNKQ4p3ZNOKHTEZMw9y+5qAMQ/Qe
         9kmXl2Yqp6HIiIV2zt19pLqhM8AacJ7qmj5yuAyVXRbT2mFDQFVf5FGHpusVSePgq6W4
         sYwBv9ZKLOTu181No0V8h/DXV+RFtz0V/7l8aa+wP/3QsGaPXSHBSj+BLiR9Bbk82Kpk
         ki9OUxnH90fk0sRjfhrm5WYzn8sWaccVVlWvDG0alSNN0FMVZaHsax0tKDRmWkxRvuJT
         Cy+sb5eA0bjMundN84VGvpn82/Ryz582xqmIm1CiYPlZmdq94CX1loyq64jBcSo9yB/C
         Ti8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=xAn3nS/V5ai3HW4F4ScN/ktlNZje9CuhpHABOdDUyL4=;
        b=sVedvaUBX+iocs9NTJ4e5WiblFjoMUz7nTJS/cHTsIJSqZi5o4+rIDYfTPmbrRrBdr
         Opf/Y35Gdi6sZudW97eCLFa375h4inVxugV2dRz0Z3tWGBVVFc9kEs7PuBZTIFDV3UsO
         3WNh2+6RRPWAmCUw8UoWCrcEe4Nz1xlkZA0XbLC5cjJpg0GH/RNnI0aWimXZLOZNBQqZ
         LUZ2zaBj+hFmh26/Dl9p4pNEEbso82t0JCIxlC5eXm4xGwRkdacskUY1+wnf2s9LvL38
         pt04JWt/dQcIdlnasOB3988qscj7l/9B/1KTVzkf4VfUoiiI3ldcfleQ0qbOQIBqI8v4
         Hm/A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u12-v6si33758691ybd.437.2018.11.22.09.32.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 09:32:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48348 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPsph-0002xY-Lo
	for alex.bennee@linaro.org; Thu, 22 Nov 2018 12:32:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48763)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gPsaO-0004mW-JW
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 12:16:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gPsaK-0005aA-Qa
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 12:16:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46832)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gPsaG-0005Uw-Pu; Thu, 22 Nov 2018 12:16:10 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 97BB43138BAB;
	Thu, 22 Nov 2018 17:16:02 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-235.ams2.redhat.com [10.36.116.235])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5451260610;
	Thu, 22 Nov 2018 17:16:00 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	jean-philippe.brucker@arm.com
Date: Thu, 22 Nov 2018 18:15:24 +0100
Message-Id: <20181122171538.12359-4-eric.auger@redhat.com>
In-Reply-To: <20181122171538.12359-1-eric.auger@redhat.com>
References: <20181122171538.12359-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 22 Nov 2018 17:16:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v9 03/17] virtio-iommu: Add skeleton
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
X-TUID: n9+AljqeBLnO

This patchs adds the skeleton for the virtio-iommu device.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v8 -> v9:
- properly initialize tail

v7 -> v8:
- expose VIRTIO_IOMMU_F_BYPASS and VIRTIO_F_VERSION_1
  features
- set_config dummy implementation + tracing
- add trace in get_features
- set the features on realize() and store the acked ones
- remove inclusion of linux/virtio_iommu.h

v6 -> v7:
- removed qapi-event.h include
- add primary_bus and associated property

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
 hw/virtio/trace-events           |   9 +
 hw/virtio/virtio-iommu.c         | 273 +++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-iommu.h |  62 +++++++
 4 files changed, 345 insertions(+)
 create mode 100644 hw/virtio/virtio-iommu.c
 create mode 100644 include/hw/virtio/virtio-iommu.h

diff --git a/hw/virtio/Makefile.objs b/hw/virtio/Makefile.objs
index 1b2799cfd8..49eba67a54 100644
--- a/hw/virtio/Makefile.objs
+++ b/hw/virtio/Makefile.objs
@@ -10,6 +10,7 @@ obj-$(CONFIG_VIRTIO_CRYPTO) += virtio-crypto.o
 obj-$(call land,$(CONFIG_VIRTIO_CRYPTO),$(CONFIG_VIRTIO_PCI)) += virtio-crypto-pci.o
 
 obj-$(CONFIG_LINUX) += vhost.o vhost-backend.o vhost-user.o
+obj-$(CONFIG_LINUX) += virtio-iommu.o
 obj-$(CONFIG_VHOST_VSOCK) += vhost-vsock.o
 endif
 
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 07bcbe9e85..84da904d8b 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -46,3 +46,12 @@ virtio_balloon_handle_output(const char *name, uint64_t gpa) "section name: %s g
 virtio_balloon_get_config(uint32_t num_pages, uint32_t actual) "num_pages: %d actual: %d"
 virtio_balloon_set_config(uint32_t actual, uint32_t oldactual) "actual: %d oldactual: %d"
 virtio_balloon_to_target(uint64_t target, uint32_t num_pages) "balloon target: 0x%"PRIx64" num_pages: %d"
+
+# hw/virtio/virtio-iommu.c
+#
+virtio_iommu_device_reset(void) "reset!"
+virtio_iommu_get_features(uint64_t features) "device supports features=0x%"PRIx64
+virtio_iommu_set_features(uint64_t features) "features accepted by the driver =0x%"PRIx64
+virtio_iommu_device_status(uint8_t status) "driver status = %d"
+virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint8_t domain_bits, uint32_t probe_size) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" domain_bits=%d probe_size=0x%x"
+virtio_iommu_set_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint8_t domain_bits, uint32_t probe_size) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" domain_bits=%d probe_size=0x%x"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
new file mode 100644
index 0000000000..d8894f047b
--- /dev/null
+++ b/hw/virtio/virtio-iommu.c
@@ -0,0 +1,273 @@
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
+#include "trace.h"
+
+#include "standard-headers/linux/virtio_ids.h"
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
+    struct virtio_iommu_req_tail tail = {};
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
+    struct virtio_iommu_config config;
+
+    memcpy(&config, config_data, sizeof(struct virtio_iommu_config));
+    trace_virtio_iommu_set_config(config.page_size_mask,
+                                  config.input_range.start,
+                                  config.input_range.end,
+                                  config.domain_bits,
+                                  config.probe_size);
+}
+
+static uint64_t virtio_iommu_get_features(VirtIODevice *vdev, uint64_t f,
+                                          Error **errp)
+{
+    VirtIOIOMMU *dev = VIRTIO_IOMMU(vdev);
+
+    f |= dev->features;
+    trace_virtio_iommu_get_features(f);
+    return f;
+}
+
+static void virtio_iommu_set_features(VirtIODevice *vdev, uint64_t val)
+{
+    VirtIOIOMMU *dev = VIRTIO_IOMMU(vdev);
+
+    dev->acked_features = val;
+    trace_virtio_iommu_set_features(dev->acked_features);
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
+    s->config.domain_bits = 32;
+
+    virtio_add_feature(&s->features, VIRTIO_RING_F_EVENT_IDX);
+    virtio_add_feature(&s->features, VIRTIO_RING_F_INDIRECT_DESC);
+    virtio_add_feature(&s->features, VIRTIO_F_VERSION_1);
+    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_INPUT_RANGE);
+    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_DOMAIN_BITS);
+    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MAP_UNMAP);
+    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS);
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
+    DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus, "PCI", PCIBus *),
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
index 0000000000..4d47b6abeb
--- /dev/null
+++ b/include/hw/virtio/virtio-iommu.h
@@ -0,0 +1,62 @@
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
+    uint64_t features;
+    uint64_t acked_features;
+    GHashTable *as_by_busptr;
+    IOMMUPciBus *as_by_bus_num[IOMMU_PCI_BUS_MAX];
+    PCIBus *primary_bus;
+    GTree *domains;
+    QemuMutex mutex;
+    GTree *endpoints;
+} VirtIOIOMMU;
+
+#endif
-- 
2.17.2

