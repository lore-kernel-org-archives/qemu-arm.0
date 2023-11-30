Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp270222ejb;
        Thu, 30 Nov 2023 06:34:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZNWdWC5XckSKpt2xisLTwZXxUDmkTCL5u3JvCASz5Nh2cxYa4DprGGRAjG1Hske3UpEBd
X-Received: by 2002:ac8:4dd5:0:b0:423:b622:6dd7 with SMTP id g21-20020ac84dd5000000b00423b6226dd7mr13488838qtw.6.1701354851656;
        Thu, 30 Nov 2023 06:34:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354851; cv=none;
        d=google.com; s=arc-20160816;
        b=NkwLrXCP1XTDqi41Xk7Ozf7Re/vSvtweditkcaI861MQRsaW2Tc1RS7vU2eNo4nWvK
         WAiXGmGO4xDLmvhxVNCYEQUgJH69fgXgeTqp2ZHgwSzuWvIXTuJb9MAC8JWg+by961fA
         UpqyvjWLeiPPkhZsUfSitkd6q4XFvVP7tN0gHTH8Me/p4lgCELZH99SZbL8vf5b5WSgA
         fHozsYQkky0/dGbdL57pkNp4/sY6DRtJosZcemriwSMPzeBwrPxNj+amyS/Sb0mVm50N
         NAh96ownNQ3P7SC+WNOEPPlNet3ap+C5x3I7sgRLJJLmo1/f7JFkvduwAvS8a3P38CBv
         MoPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nFABTT5Yh+aPai95tE3eMLRSQEusNuwuwX2PUaKd0/Q=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=euQX9D+FQkuJ00k8iTkx5bjjyDToGJhFl6VO+SXo4MtwcJffyWHbWvVGd57fQzm32m
         M3fhxaPWSUHrwZKUUy5QNgIMAstR4eekEQp92SJzPn2RwZ5hB6vzbXJGndidkuqwFmjD
         2FkK0iZgIXyymjM4kgVhNRL0mpXg7dPNrJz5zXK2rZkKxEDZGS2DwHaJoO3rCEgGJOKT
         XzdciKR0mGKsIUaMwFHNFzldbVlNdKHSj54lAzugsULWPfKqtxmK3YM7/Dj7B1ao14cP
         Kt+98xxot60qnvqo07/pORfpM9S5Jy3W3aaIadgqMMeBWU2LdNHv7JHU5cdp7QwzOels
         qBZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=b51yF4Oi;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id j7-20020ac806c7000000b00423a48ec8adsi1111841qth.103.2023.11.30.06.34.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:34:11 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=b51yF4Oi;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354851; x=1732890851;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IhpodbfJau6szIdQazmb+IK5Vtn7KUNNpXNSlzloW+Q=;
  b=b51yF4Oir5xZZusp7izSrF3IpwO5SQdCqrdJ7aQMK2t1m+RWMPOOXHLF
   9p9DKeoOP0tDw5gZebKCHy1AP68kRpbFdxQEkL6xKrguzYooJeHe/igbk
   uLJH4DbVs0X9pyiq4ursmpkAHtB47scRo+b42eMQqaaUZGeDRnJdcI2LO
   YfGpnW+TFyBWco8eWRi8M2o66DScUBpflPaXeeR08CsOzsNJOfC+loEgP
   LQq6NXm1D/OWG6MpZbu76+Ukr5kv0aCnFZzRXJbVid3Gucs3/DgEgxTdj
   5wL1xL3l7Kq2NmiCZTA72W8Ime3NnPk/QEiS8C1eFh2prN9RCdSDZkHB8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532147"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532147"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:34:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730068"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730068"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:34:00 -0800
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
Subject: [RFC 23/41] hw/cpu/die: Abstract cpu-die level as topology device
Date: Thu, 30 Nov 2023 22:41:45 +0800
Message-Id: <20231130144203.2307629-24-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8rDNj/UWoWYA

From: Zhao Liu <zhao1.liu@intel.com>

Abstract die level as a topology device "cpu-die" to allow user to
create die level topology from cli and later the cpu-dies could be added
into topology tree.

In addition, mark the cpu-die as DEVICE_CATEGORY_CPU_DEF category to
indicate it belongs to the basic CPU definition and should be created
from cli before board initialization.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 MAINTAINERS          |  2 ++
 hw/cpu/die.c         | 46 ++++++++++++++++++++++++++++++++++++++++++++
 hw/cpu/meson.build   |  2 +-
 include/hw/cpu/die.h | 38 ++++++++++++++++++++++++++++++++++++
 4 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 hw/cpu/die.c
 create mode 100644 include/hw/cpu/die.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 89e350866d6a..91d0936edb32 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1863,6 +1863,7 @@ F: hw/core/machine-smp.c
 F: hw/core/null-machine.c
 F: hw/core/numa.c
 F: hw/cpu/cluster.c
+F: hw/cpu/die.c
 F: qapi/machine.json
 F: qapi/machine-common.json
 F: qapi/machine-target.json
@@ -1870,6 +1871,7 @@ F: include/hw/boards.h
 F: include/hw/core/cpu.h
 F: include/hw/core/cpu-topo.h
 F: include/hw/cpu/cluster.h
+F: include/hw/cpu/die.h
 F: include/sysemu/numa.h
 F: tests/unit/test-smp-parse.c
 T: git https://gitlab.com/ehabkost/qemu.git machine-next
diff --git a/hw/cpu/die.c b/hw/cpu/die.c
new file mode 100644
index 000000000000..06c4f7cc8fa2
--- /dev/null
+++ b/hw/cpu/die.c
@@ -0,0 +1,46 @@
+/*
+ * CPU die abstract device
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
+#include "hw/cpu/die.h"
+
+static void cpu_die_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    CPUTopoClass *tc = CPU_TOPO_CLASS(oc);
+
+    set_bit(DEVICE_CATEGORY_CPU_DEF, dc->categories);
+
+    tc->level = CPU_TOPO_DIE;
+}
+
+static const TypeInfo cpu_die_type_info = {
+    .name = TYPE_CPU_DIE,
+    .parent = TYPE_CPU_TOPO,
+    .class_init = cpu_die_class_init,
+    .instance_size = sizeof(CPUDie),
+};
+
+static void cpu_die_register_types(void)
+{
+    type_register_static(&cpu_die_type_info);
+}
+
+type_init(cpu_die_register_types)
diff --git a/hw/cpu/meson.build b/hw/cpu/meson.build
index 6d319947ca0b..e685fe1c7d8a 100644
--- a/hw/cpu/meson.build
+++ b/hw/cpu/meson.build
@@ -1,4 +1,4 @@
-system_ss.add(files('core.c', 'cluster.c'))
+system_ss.add(files('core.c', 'cluster.c', 'die.c'))
 
 system_ss.add(when: 'CONFIG_ARM11MPCORE', if_true: files('arm11mpcore.c'))
 system_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview_mpcore.c'))
diff --git a/include/hw/cpu/die.h b/include/hw/cpu/die.h
new file mode 100644
index 000000000000..4c68786b5f2f
--- /dev/null
+++ b/include/hw/cpu/die.h
@@ -0,0 +1,38 @@
+/*
+ * CPU die abstract device
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
+#ifndef HW_CPU_DIE_H
+#define HW_CPU_DIE_H
+
+#include "hw/core/cpu-topo.h"
+#include "hw/qdev-core.h"
+
+#define TYPE_CPU_DIE "cpu-die"
+
+OBJECT_DECLARE_SIMPLE_TYPE(CPUDie, CPU_DIE)
+
+struct CPUDie {
+    /*< private >*/
+    CPUTopoState obj;
+
+    /*< public >*/
+};
+
+#endif /* HW_CPU_DIE_H */
-- 
2.34.1
