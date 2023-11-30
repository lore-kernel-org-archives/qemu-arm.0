Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp268818ejb;
        Thu, 30 Nov 2023 06:32:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwcKMLcpCIWFCnribGuPk8LbeFD+sGBVKInVQ70LQoX0xK7s6TOdTVjTiDEs2rwqBokDua
X-Received: by 2002:a05:622a:4d:b0:417:8eb5:2780 with SMTP id y13-20020a05622a004d00b004178eb52780mr28912656qtw.18.1701354735957;
        Thu, 30 Nov 2023 06:32:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354735; cv=none;
        d=google.com; s=arc-20160816;
        b=FB4Kj+zxqZrzywtK6WhFGTiuxELIUMkeenuNf61JQwdviVx9EUM6Ce5q3DN8czf/cU
         fmhV7dF7f/3mXYdAXw25Jt5Y/mKk0TXc87SzK6XC5UPxUSDIEsgnwMvbIahbjL9k/UdV
         wU0g9uiUQOZAo6MmDHRi3UmYkfJH3CBj9r716JaU3jgRLteP9VPZvnpAHvHQvr3mB9WR
         kJ60e+8UUHO6V3xldDlksaxQWLZFZeimzgBGll4OK08Z8FMYsH5yXZC1VWG6fAY9Bbh0
         hWy/X3DCgI+R9VOpW8mQwqowuj+epRvHeoho9p+ug6EEPZRjE/GOYoOXgBwuNvJESHp5
         ++bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zAA6Wrn4DxKQJWM8/1wruACjatIykstf7VTwuaQnU/8=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=rIg/0mrALUUJKB2stBe2DWPUtZqjK6MCqd+vPxqQ7/gD7XzElNssgJJOR9rftL7Zsl
         KitI81Z7bCA+aFlqQvanoRudJT0qztkW42Q1HiSazW+WMRtqkzWOramYsxiOFiJbNrDZ
         Syqm7I2Hj6I5oAK7f6wyMdKAnWUEbK1h50jcUPUCFCo2oo+/MaVgTYMf/UVTRVQHXYoC
         44icSeQ8V54ogGB1smUefy+y+vE0ind5LkSiu5xLW4M7I7lnZjUG27p6u4XJ4lEvonM8
         WzkwLxAheAyLPe3lLMp5tdW0g2Z0h7NLMH8JZY60gre1voVzyVZH239pBcmTMXljyOOB
         CD2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=TpMoD5mF;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id ke6-20020a05622a288600b004236d30b354si1081938qtb.732.2023.11.30.06.32.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:32:15 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=TpMoD5mF;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354735; x=1732890735;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0HgUkt24A8GDXQknSCYGY0tM/5gPDdFuKpTNl12j5yE=;
  b=TpMoD5mFLHl8SadD7xti3XQ3Gpadhu/gS7oJB4MtbJ6rmhnQbx9EcE8r
   9yIwwiRgGer9MLHsF1rIB7YwkfKEdysg42g7sEep3YkRmQ+gxPqrcEMLP
   cL2UFIPKvpeviAatbKF8HZOVqSxOA7BK8Rx70+gh/bct/euF7PtjM7XfL
   u8O2xG6JlsNp8FoNy969tCPVAqL5m2lMMC0D8uo2zjAj9Iy/oumzb2xV0
   UyLBdUfroi9m6RV+zVxQPc8VWB4FIodUjKB4sNg23g0eVT8lGT0ujXbCR
   ts1u0LsFclGnBf1seANkCacOCB9kwK1iCmdkGqlbxnf2LeyskYfmatQoQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479531407"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479531407"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:31:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729736"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942729736"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:31:38 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Bin Meng <bin.meng@windriver.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org
Cc: Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Zhiyuan Lv <zhiyuan.lv@intel.com>,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC 08/41] hw/core/topo: Introduce CPU topology device abstraction
Date: Thu, 30 Nov 2023 22:41:30 +0800
Message-Id: <20231130144203.2307629-9-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ASlJ+ifJOlVC

From: Zhao Liu <zhao1.liu@intel.com>

To create more flexible CPU topologies (both symmetric and
heterogeneous) via the "-device" interface, it is necessary to convert
the current CPU topology hierarchies into the special CPU topology
devices.

The CPU topology will be built as a tree, and the device with the
CPU_TOPO_ROOT level is the only root of this CPU topology tree.

The different levels of CPU topology devices are connected in the
"-device" cli with the child<> property, which in turn will be set the
Object.parent through the qdev interface. And ultimately at the
realize(), CPU topology devices will be linked to their topological
parent based on the Object.parent field, and then be inserted into the
topology tree.

As the first step, introduce the basic CPU topology device abstraction,
as well as the topology tree and topology hierarchy construction based
on the CPU topology devices.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 MAINTAINERS                |   2 +
 hw/core/cpu-topo.c         | 201 +++++++++++++++++++++++++++++++++++++
 hw/core/meson.build        |   1 +
 include/hw/core/cpu-topo.h |  79 +++++++++++++++
 4 files changed, 283 insertions(+)
 create mode 100644 hw/core/cpu-topo.c
 create mode 100644 include/hw/core/cpu-topo.h

diff --git a/MAINTAINERS b/MAINTAINERS
index fdbabaa983cc..564cb776ae80 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1854,6 +1854,7 @@ R: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Yanan Wang <wangyanan55@huawei.com>
 S: Supported
 F: hw/core/cpu.c
+F: hw/core/cpu-topo.c
 F: hw/core/machine-qmp-cmds.c
 F: hw/core/machine.c
 F: hw/core/machine-smp.c
@@ -1865,6 +1866,7 @@ F: qapi/machine-common.json
 F: qapi/machine-target.json
 F: include/hw/boards.h
 F: include/hw/core/cpu.h
+F: include/hw/core/cpu-topo.h
 F: include/hw/cpu/cluster.h
 F: include/sysemu/numa.h
 F: tests/unit/test-smp-parse.c
diff --git a/hw/core/cpu-topo.c b/hw/core/cpu-topo.c
new file mode 100644
index 000000000000..4428b979a5dc
--- /dev/null
+++ b/hw/core/cpu-topo.c
@@ -0,0 +1,201 @@
+/*
+ * General CPU topology device abstraction
+ *
+ * Copyright (c) 2023 Intel Corporation
+ * Author: Zhao Liu <zhao1.liu@intel.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License,
+ * or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/core/cpu-topo.h"
+#include "hw/qdev-properties.h"
+#include "qapi/error.h"
+
+static const char *cpu_topo_level_to_string(CPUTopoLevel level)
+{
+    switch (level) {
+    case CPU_TOPO_UNKNOWN:
+        return "unknown";
+    case CPU_TOPO_THREAD:
+        return "thread";
+    case CPU_TOPO_CORE:
+        return "core";
+    case CPU_TOPO_CLUSTER:
+        return "cluster";
+    case CPU_TOPO_DIE:
+        return "die";
+    case CPU_TOPO_SOCKET:
+        return "socket";
+    case CPU_TOPO_BOOK:
+        return "book";
+    case CPU_TOPO_DRAWER:
+        return "drawer";
+    case CPU_TOPO_ROOT:
+        return "root";
+    }
+
+    return NULL;
+}
+
+static void cpu_topo_build_hierarchy(CPUTopoState *topo, Error **errp)
+{
+    CPUTopoState *parent = topo->parent;
+    CPUTopoLevel level = CPU_TOPO_LEVEL(topo);
+    g_autofree char *name = NULL;
+
+    if (!parent) {
+        return;
+    }
+
+    if (parent->child_level == CPU_TOPO_UNKNOWN) {
+        parent->child_level = level;
+    } else if (parent->child_level != level) {
+        error_setg(errp, "cpu topo: the parent level %s asks for the "
+                   "%s child, but current level is %s",
+                   cpu_topo_level_to_string(CPU_TOPO_LEVEL(parent)),
+                   cpu_topo_level_to_string(parent->child_level),
+                   cpu_topo_level_to_string(level));
+        return;
+    }
+
+    if (parent->max_children && parent->max_children <= parent->num_children) {
+        error_setg(errp, "cpu topo: the parent limit the (%d) children, "
+                   "currently it has %d children",
+                   parent->max_children,
+                   parent->num_children);
+        return;
+    }
+
+    parent->num_children++;
+    QTAILQ_INSERT_TAIL(&parent->children, topo, sibling);
+}
+
+static void cpu_topo_set_parent(CPUTopoState *topo, Error **errp)
+{
+    Object *obj = OBJECT(topo);
+    CPUTopoLevel level = CPU_TOPO_LEVEL(topo);
+
+    if (!obj->parent) {
+        return;
+    }
+
+    if (object_dynamic_cast(obj->parent, TYPE_CPU_TOPO)) {
+        CPUTopoState *parent = CPU_TOPO(obj->parent);
+
+        if (level >= CPU_TOPO_LEVEL(parent)) {
+            error_setg(errp, "cpu topo: current level (%s) should be "
+                       "lower than parent (%s) level",
+                       object_get_typename(obj),
+                       object_get_typename(OBJECT(parent)));
+            return;
+        }
+        topo->parent = parent;
+    }
+
+    if (topo->parent) {
+        cpu_topo_build_hierarchy(topo, errp);
+    }
+}
+
+static void cpu_topo_realize(DeviceState *dev, Error **errp)
+{
+    CPUTopoState *topo = CPU_TOPO(dev);
+    CPUTopoClass *tc = CPU_TOPO_GET_CLASS(topo);
+
+    if (tc->level == CPU_TOPO_UNKNOWN) {
+        error_setg(errp, "cpu topo: no level specified"
+                   " type: %s", object_get_typename(OBJECT(dev)));
+        return;
+    }
+
+    cpu_topo_set_parent(topo, errp);
+}
+
+static void cpu_topo_destroy_hierarchy(CPUTopoState *topo)
+{
+    CPUTopoState *parent = topo->parent;
+
+    if (!parent) {
+        return;
+    }
+
+    QTAILQ_REMOVE(&parent->children, topo, sibling);
+    parent->num_children--;
+
+    if (!parent->num_children) {
+        parent->child_level = CPU_TOPO_UNKNOWN;
+    }
+}
+
+static void cpu_topo_unrealize(DeviceState *dev)
+{
+    CPUTopoState *topo = CPU_TOPO(dev);
+
+    /*
+     * The specific unrealize method must consider the bottom-up,
+     * layer-by-layer unrealization implementation.
+     */
+    g_assert(!topo->num_children);
+
+    if (topo->parent) {
+        cpu_topo_destroy_hierarchy(topo);
+    }
+}
+
+static void cpu_topo_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    CPUTopoClass *tc = CPU_TOPO_CLASS(oc);
+
+    /* All topology devices belong to CPU property. */
+    set_bit(DEVICE_CATEGORY_CPU, dc->categories);
+    dc->realize = cpu_topo_realize;
+    dc->unrealize = cpu_topo_unrealize;
+
+    /*
+     * The general topo device is not hotpluggable by default.
+     * If any topo device needs hotplug support, this flag must be
+     * overridden under arch-specific topo device code.
+     */
+    dc->hotpluggable = false;
+
+    tc->level = CPU_TOPO_UNKNOWN;
+}
+
+static void cpu_topo_instance_init(Object *obj)
+{
+    CPUTopoState *topo = CPU_TOPO(obj);
+    QTAILQ_INIT(&topo->children);
+
+    topo->child_level = CPU_TOPO_UNKNOWN;
+}
+
+static const TypeInfo cpu_topo_type_info = {
+    .name = TYPE_CPU_TOPO,
+    .parent = TYPE_DEVICE,
+    .abstract = true,
+    .class_size = sizeof(CPUTopoClass),
+    .class_init = cpu_topo_class_init,
+    .instance_size = sizeof(CPUTopoState),
+    .instance_init = cpu_topo_instance_init,
+};
+
+static void cpu_topo_register_types(void)
+{
+    type_register_static(&cpu_topo_type_info);
+}
+
+type_init(cpu_topo_register_types)
diff --git a/hw/core/meson.build b/hw/core/meson.build
index 67dad04de559..501d2529697e 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -23,6 +23,7 @@ else
 endif
 
 common_ss.add(files('cpu-common.c'))
+common_ss.add(files('cpu-topo.c'))
 common_ss.add(files('machine-smp.c'))
 system_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
 system_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true: files('generic-loader.c'))
diff --git a/include/hw/core/cpu-topo.h b/include/hw/core/cpu-topo.h
new file mode 100644
index 000000000000..ebcbdd854da5
--- /dev/null
+++ b/include/hw/core/cpu-topo.h
@@ -0,0 +1,79 @@
+/*
+ * General CPU topology device abstraction
+ *
+ * Copyright (c) 2023 Intel Corporation
+ * Author: Zhao Liu <zhao1.liu@intel.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License,
+ * or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef CPU_TOPO_H
+#define CPU_TOPO_H
+
+#include "hw/qdev-core.h"
+#include "qemu/queue.h"
+
+typedef enum CPUTopoLevel {
+    CPU_TOPO_UNKNOWN,
+    CPU_TOPO_THREAD,
+    CPU_TOPO_CORE,
+    CPU_TOPO_CLUSTER,
+    CPU_TOPO_DIE,
+    CPU_TOPO_SOCKET,
+    CPU_TOPO_BOOK,
+    CPU_TOPO_DRAWER,
+    CPU_TOPO_ROOT,
+} CPUTopoLevel;
+
+#define TYPE_CPU_TOPO "cpu-topo"
+OBJECT_DECLARE_TYPE(CPUTopoState, CPUTopoClass, CPU_TOPO)
+
+/**
+ * CPUTopoClass:
+ * @level: Topology level for this CPUTopoClass.
+ */
+struct CPUTopoClass {
+    /*< private >*/
+    DeviceClass parent_class;
+
+    /*< public >*/
+    CPUTopoLevel level;
+};
+
+/**
+ * CPUTopoState:
+ * @num_children: Number of topology children under this topology device.
+ * @max_children: Maximum number of children allowed to be inserted under
+ *     this topology device.
+ * @child_level: Topology level for children.
+ * @parent: Topology parent of this topology device.
+ * @children: Queue of topology children.
+ * @sibling: Queue node to be inserted in parent's topology queue.
+ */
+struct CPUTopoState {
+    /*< private >*/
+    DeviceState parent_obj;
+
+    /*< public >*/
+    int num_children;
+    int max_children;
+    CPUTopoLevel child_level;
+    struct CPUTopoState *parent;
+    QTAILQ_HEAD(, CPUTopoState) children;
+    QTAILQ_ENTRY(CPUTopoState) sibling;
+};
+
+#define CPU_TOPO_LEVEL(topo)    (CPU_TOPO_GET_CLASS(topo)->level)
+
+#endif /* CPU_TOPO_H */
-- 
2.34.1
