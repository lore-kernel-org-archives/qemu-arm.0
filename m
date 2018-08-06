Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3445210wru;
        Mon, 6 Aug 2018 13:18:28 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfD55gl+mTvSlxE7lfZLv1cJJSz89RCE/f7ZRulblUucNujc2Gdp9yHfWJuOOsRYkJ4tS90
X-Received: by 2002:aed:3cc3:: with SMTP id e3-v6mr16364456qtf.356.1533586708663;
        Mon, 06 Aug 2018 13:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533586708; cv=none;
        d=google.com; s=arc-20160816;
        b=Wzjvox0XyiMisdrieQXrj7FrA9PdE3ty/BhzDndJvDPMOO5+qqvAymxzIP3c9Kd3h4
         ia7y/2azVg1HDv/ilRFq/8o1PETl+ulD9rQqPLg51T7ReeTgnCktrXJxSqt8XFDs1W2X
         MSdBZkRpNFb6SCW3cnk4Tx5v2ZEH/Ym6I/PBCqUOyxef7vT3ogNOZdhsakjvJx137goZ
         7x0gPSeUwAoYNGjOKFG0V5vXSacQJxdZ+vb+ZfV9BCXfL0UqKBsjBiD8cBYPhfp9atUs
         Ck78EQ9IAeuCufzAc9h09IHSRrE55Q/75F3Xbwn3IUpPyaMmlyW6jJOOoa4bIUFiyqXQ
         rqPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=xczbdB2i9yPyebqiqW0uOp3ko0cmXpVdvylpOK4OsMs=;
        b=Ps4CglylFWcOhCMRCpj3yEp/O+hCG/czEtEvRjBzVfDoZN+vFPS8QnicmZSyEVXt32
         LmPggJlsrOsf7ViRL/pHYuQgjcdko7lAOxPyIVJrA2ShmJmNhEPcf1n0EnX4gW9khygr
         lVmeWd6Dv6BQpeM8LZzt7w6aRz4sl3gend2MRNagcKVMUy/x26zsrdmnbd3CK8QbmfEm
         dSXseHTYDCETQk2yi5fsjwm7j/VDv0NCEzFaDAFtS/lK6LM0J8yFScYDiL5esDbGS0lk
         j6IMoIDW4RaRLJhlAJ8nuunEYX/55ZfBNwtXmRqhLC5zcDh6CeJcK2ul+9krfSuC9yvX
         MQ4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o126-v6si4806925qke.291.2018.08.06.13.18.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Aug 2018 13:18:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36104 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmlxU-0000Co-3Q
	for alex.bennee@linaro.org; Mon, 06 Aug 2018 16:18:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmlu7-0005p7-Ld
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 16:15:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmlu5-0006Um-Jy
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 16:14:59 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56742 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fmlu5-0006U6-E2; Mon, 06 Aug 2018 16:14:57 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 099187C6A9;
	Mon,  6 Aug 2018 20:14:57 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8FF412156711;
	Mon,  6 Aug 2018 20:14:54 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	mst@redhat.com, jean-philippe.brucker@arm.com
Date: Mon,  6 Aug 2018 22:14:30 +0200
Message-Id: <1533586484-5737-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
References: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 06 Aug 2018 20:14:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 06 Aug 2018 20:14:57 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v7 02/16] virtio-iommu: Add skeleton
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
Cc: kevin.tian@intel.com, tn@semihalf.com, will.deacon@arm.com,
	drjones@redhat.com, peterx@redhat.com, linuc.decode@gmail.com,
	bharat.bhushan@nxp.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bjqLCSTr4GJ1

This patchs adds the skeleton for the virtio-iommu device.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
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
 hw/virtio/trace-events           |   7 ++
 hw/virtio/virtio-iommu.c         | 256 +++++++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-iommu.h |  61 ++++++++++
 4 files changed, 325 insertions(+)
 create mode 100644 hw/virtio/virtio-iommu.c
 create mode 100644 include/hw/virtio/virtio-iommu.h

diff --git a/hw/virtio/Makefile.objs b/hw/virtio/Makefile.objs
index 1b2799c..49eba67 100644
--- a/hw/virtio/Makefile.objs
+++ b/hw/virtio/Makefile.objs
@@ -10,6 +10,7 @@ obj-$(CONFIG_VIRTIO_CRYPTO) += virtio-crypto.o
 obj-$(call land,$(CONFIG_VIRTIO_CRYPTO),$(CONFIG_VIRTIO_PCI)) += virtio-crypto-pci.o
 
 obj-$(CONFIG_LINUX) += vhost.o vhost-backend.o vhost-user.o
+obj-$(CONFIG_LINUX) += virtio-iommu.o
 obj-$(CONFIG_VHOST_VSOCK) += vhost-vsock.o
 endif
 
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 07bcbe9..01dc20f 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -46,3 +46,10 @@ virtio_balloon_handle_output(const char *name, uint64_t gpa) "section name: %s g
 virtio_balloon_get_config(uint32_t num_pages, uint32_t actual) "num_pages: %d actual: %d"
 virtio_balloon_set_config(uint32_t actual, uint32_t oldactual) "actual: %d oldactual: %d"
 virtio_balloon_to_target(uint64_t target, uint32_t num_pages) "balloon target: 0x%"PRIx64" num_pages: %d"
+
+# hw/virtio/virtio-iommu.c
+#
+virtio_iommu_set_features(uint64_t features) "features accepted by the driver =0x%"PRIx64
+virtio_iommu_device_reset(void) "reset!"
+virtio_iommu_device_status(uint8_t status) "driver status = %d"
+virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint8_t ioasid_bits, uint32_t probe_size) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" ioasid_bits=%d probe_size=0x%x"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
new file mode 100644
index 0000000..34c7584
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
index 0000000..f54d09b
--- /dev/null
+++ b/include/hw/virtio/virtio-iommu.h
@@ -0,0 +1,61 @@
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
+    PCIBus *primary_bus;
+    GTree *domains;
+    QemuMutex mutex;
+    GTree *endpoints;
+} VirtIOIOMMU;
+
+#endif
-- 
2.5.5

