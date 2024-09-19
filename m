Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1112860njg;
        Wed, 18 Sep 2024 18:40:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVgTgD6SehA/EhZ3uuKiiCWZzJXMcW//duVrCkjxcXD9hQDFDaax8QWKkWnY3LQ6/AO1vZpsNkK2lJsDA==@linaro.org
X-Google-Smtp-Source: AGHT+IHOO7D7lDGzjpq+ahZ4CyyZpGlGuxivKzZu6ujV+7xHntEl02sxR1IZOi3v1heINA2KO8r1
X-Received: by 2002:a05:620a:3954:b0:7a9:ab0f:839b with SMTP id af79cd13be357-7a9e5fba0f4mr4049348085a.57.1726710046197;
        Wed, 18 Sep 2024 18:40:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726710046; cv=none;
        d=google.com; s=arc-20240605;
        b=fONy8X2csg6D9w4yrkDczU3sQiJ3iN8W4cXM1Wh6BSxaOQwt/j9+4YC21tZDkCcpas
         brqfJlBAnUzJHbA1rVKDYZSqDxya7y55utjg08229UrQJAkZ78NSwdGdkCPxGpbEoNbu
         FUC4jjIKmtWOek1fr/QbtanDkhAMrchKJfK3uXxdKfw9nvNUAesuC27NsrTyk7e4g0XQ
         KnLR1x8y/dDoBLzqDo9C69aeCTtdwRk7Q8ioYVkz7htqTuQyEY7S4dc1IjDGgnxuA0Vo
         GYnw08f5SiTtxukOhQZZAnTg5jSjIXAifIdhDk9EHPXuPVuylOM0qSoYvevEiZAg0i0z
         apmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=pOjN2cSryjW56PTuLpl7YZ2dYj79EnsBUpZihOEruJo=;
        fh=N9JXs6UlidM8EsUInW73fWjlYrhprlUzJ9DsuKSk+BQ=;
        b=cNWyrmeETb5PuOtUzJh60ufxNariQV0Gpve4e6y876T4+o9zO734XH+Rsb9eQPP1zI
         0Z6+MY6bNAZURNVgWV5PJDBRI/6s6vIU3CzILuQwkqkI/I4ZjaV+RGCDKYoP5qdpewBz
         yVBswmpHudgmzcFslnq1dan4q9WhetT/VsOTqq8E5jvfFAPkHE0SCuU3gH3mFSQqdnkm
         QV1mtU2XVpfED3OOjwa71Zsj9T+c25Jb9i6q608swvXOIF69wYxaA/IZW5io6dr+EaBT
         JGbJwgh14oXPq2JXTQ6uBMQpB544ru0QVD6NIWWUZBuYZmd8pVC8I2PF0XxzHMsXuB9D
         raew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=nEKaKNBv;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.15])
        by mx.google.com with ESMTPS id af79cd13be357-7acb08c51cdsi77239385a.267.2024.09.18.18.40.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 18:40:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) client-ip=192.198.163.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=nEKaKNBv;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726710046; x=1758246046;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4Lv6y5pVsU6DtDjzxhv1VCs53XCauucInvDj9vyaeKw=;
  b=nEKaKNBvG5jm34kLSDqlQtThtL4nxOAnj4pDOppuiIxTTMGh12tyUpKp
   tZXR3Yad8KYUIGjZnfEh71i/lAy3ggwqhejDMu0p1cWsfcWDu/1UdsX6m
   o1MTuYo/1jhqCF/gWcbdw2dp8gW+xfIKvzmYnFSx7ZV61zwPHXJB+8CoP
   GbcCITr0nWqdh8Xn1EXqdjFvI1oq0J32r/ZeoFtvoktB90S0/Gdjp7V+t
   oWZLae7lhikvFhD6BCJsPGDf4T/hziO4CEE8kxHeF8QwE7/pRFbo0Yhoi
   X9z1Ku8R9DflYp8amxFKqZNF75X9FHP14KphRuFqzPW2i1c4N6ofuJppx
   g==;
X-CSE-ConnectionGUID: J3cofrPTRgK+FIWUunHD8A==
X-CSE-MsgGUID: 6mnaFIW9SxWvDzFZBuBnvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25797981"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="25797981"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 18:40:45 -0700
X-CSE-ConnectionGUID: oRBjSbnIQmSIHRcM58FHEg==
X-CSE-MsgGUID: BCnW7jNJTSGl38Hi7C4luQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="70058880"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa006.jf.intel.com with ESMTP; 18 Sep 2024 18:40:39 -0700
From: Zhao Liu <zhao1.liu@intel.com>
To: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC v2 09/15] hw/cpu: Abstract module/die/socket levels as topology devices
Date: Thu, 19 Sep 2024 09:55:27 +0800
Message-Id: <20240919015533.766754-10-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919015533.766754-1-zhao1.liu@intel.com>
References: <20240919015533.766754-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: cIjCJPDfA8ia

Abstract module/die/socket levels as the cpu-module/cpu-die/cpu-socket
topology devices then they can be inserted into topology tree.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 MAINTAINERS             |  6 ++++++
 hw/cpu/die.c            | 34 ++++++++++++++++++++++++++++++++++
 hw/cpu/meson.build      |  3 +++
 hw/cpu/module.c         | 34 ++++++++++++++++++++++++++++++++++
 hw/cpu/socket.c         | 34 ++++++++++++++++++++++++++++++++++
 include/hw/cpu/die.h    | 29 +++++++++++++++++++++++++++++
 include/hw/cpu/module.h | 29 +++++++++++++++++++++++++++++
 include/hw/cpu/socket.h | 29 +++++++++++++++++++++++++++++
 8 files changed, 198 insertions(+)
 create mode 100644 hw/cpu/die.c
 create mode 100644 hw/cpu/module.c
 create mode 100644 hw/cpu/socket.c
 create mode 100644 include/hw/cpu/die.h
 create mode 100644 include/hw/cpu/module.h
 create mode 100644 include/hw/cpu/socket.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8e5b2cd91dca..03c1a13de074 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1886,6 +1886,9 @@ F: hw/core/numa.c
 F: hw/cpu/cluster.c
 F: hw/cpu/cpu-slot.c
 F: hw/cpu/cpu-topology.c
+F: hw/cpu/die.c
+F: hw/cpu/module.c
+F: hw/cpu/socket.c
 F: qapi/machine.json
 F: qapi/machine-common.json
 F: qapi/machine-target.json
@@ -1894,6 +1897,9 @@ F: include/hw/core/cpu.h
 F: include/hw/cpu/cluster.h
 F: include/hw/cpu/cpu-slot.h
 F: include/hw/cpu/cpu-topology.h
+F: include/hw/cpu/die.h
+F: include/hw/cpu/module.h
+F: include/hw/cpu/socket.h
 F: include/sysemu/numa.h
 F: tests/functional/test_cpu_queries.py
 F: tests/functional/test_empty_cpu_model.py
diff --git a/hw/cpu/die.c b/hw/cpu/die.c
new file mode 100644
index 000000000000..f00907ffd78b
--- /dev/null
+++ b/hw/cpu/die.c
@@ -0,0 +1,34 @@
+/*
+ * CPU die abstract device
+ *
+ * Copyright (C) 2024 Intel Corporation.
+ *
+ * Author: Zhao Liu <zhao1.liu@intel.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/cpu/die.h"
+
+static void cpu_die_class_init(ObjectClass *oc, void *data)
+{
+    CPUTopoClass *tc = CPU_TOPO_CLASS(oc);
+
+    tc->level = CPU_TOPOLOGY_LEVEL_DIE;
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
index 358e2b3960fa..c64eec4460d8 100644
--- a/hw/cpu/meson.build
+++ b/hw/cpu/meson.build
@@ -3,6 +3,9 @@ common_ss.add(files('cpu-topology.c'))
 system_ss.add(files('core.c'))
 system_ss.add(files('cpu-slot.c'))
 system_ss.add(when: 'CONFIG_CPU_CLUSTER', if_true: files('cluster.c'))
+system_ss.add(files('die.c'))
+system_ss.add(files('module.c'))
+system_ss.add(files('socket.c'))
 
 system_ss.add(when: 'CONFIG_ARM11MPCORE', if_true: files('arm11mpcore.c'))
 system_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview_mpcore.c'))
diff --git a/hw/cpu/module.c b/hw/cpu/module.c
new file mode 100644
index 000000000000..b6f50a2ba588
--- /dev/null
+++ b/hw/cpu/module.c
@@ -0,0 +1,34 @@
+/*
+ * CPU module abstract device
+ *
+ * Copyright (C) 2024 Intel Corporation.
+ *
+ * Author: Zhao Liu <zhao1.liu@intel.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/cpu/module.h"
+
+static void cpu_module_class_init(ObjectClass *oc, void *data)
+{
+    CPUTopoClass *tc = CPU_TOPO_CLASS(oc);
+
+    tc->level = CPU_TOPOLOGY_LEVEL_MODULE;
+}
+
+static const TypeInfo cpu_module_type_info = {
+    .name = TYPE_CPU_MODULE,
+    .parent = TYPE_CPU_TOPO,
+    .class_init = cpu_module_class_init,
+    .instance_size = sizeof(CPUModule),
+};
+
+static void cpu_module_register_types(void)
+{
+    type_register_static(&cpu_module_type_info);
+}
+
+type_init(cpu_module_register_types)
diff --git a/hw/cpu/socket.c b/hw/cpu/socket.c
new file mode 100644
index 000000000000..516e93389e11
--- /dev/null
+++ b/hw/cpu/socket.c
@@ -0,0 +1,34 @@
+/*
+ * CPU socket abstract device
+ *
+ * Copyright (C) 2024 Intel Corporation.
+ *
+ * Author: Zhao Liu <zhao1.liu@intel.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/cpu/socket.h"
+
+static void cpu_socket_class_init(ObjectClass *oc, void *data)
+{
+    CPUTopoClass *tc = CPU_TOPO_CLASS(oc);
+
+    tc->level = CPU_TOPOLOGY_LEVEL_SOCKET;
+}
+
+static const TypeInfo cpu_socket_type_info = {
+    .name = TYPE_CPU_SOCKET,
+    .parent = TYPE_CPU_TOPO,
+    .class_init = cpu_socket_class_init,
+    .instance_size = sizeof(CPUSocket),
+};
+
+static void cpu_socket_register_types(void)
+{
+    type_register_static(&cpu_socket_type_info);
+}
+
+type_init(cpu_socket_register_types)
diff --git a/include/hw/cpu/die.h b/include/hw/cpu/die.h
new file mode 100644
index 000000000000..682e226ac569
--- /dev/null
+++ b/include/hw/cpu/die.h
@@ -0,0 +1,29 @@
+/*
+ * CPU die abstract device
+ *
+ * Copyright (C) 2024 Intel Corporation.
+ *
+ * Author: Zhao Liu <zhao1.liu@intel.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_CPU_DIE_H
+#define HW_CPU_DIE_H
+
+#include "hw/cpu/cpu-topology.h"
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
diff --git a/include/hw/cpu/module.h b/include/hw/cpu/module.h
new file mode 100644
index 000000000000..242cd623a3b3
--- /dev/null
+++ b/include/hw/cpu/module.h
@@ -0,0 +1,29 @@
+/*
+ * CPU module abstract device
+ *
+ * Copyright (C) 2024 Intel Corporation.
+ *
+ * Author: Zhao Liu <zhao1.liu@intel.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_CPU_MODULE_H
+#define HW_CPU_MODULE_H
+
+#include "hw/cpu/cpu-topology.h"
+#include "hw/qdev-core.h"
+
+#define TYPE_CPU_MODULE "cpu-module"
+
+OBJECT_DECLARE_SIMPLE_TYPE(CPUModule, CPU_MODULE)
+
+struct CPUModule {
+    /*< private >*/
+    CPUTopoState obj;
+
+    /*< public >*/
+};
+
+#endif /* HW_CPU_MODULE_H */
diff --git a/include/hw/cpu/socket.h b/include/hw/cpu/socket.h
new file mode 100644
index 000000000000..a25bf8727a22
--- /dev/null
+++ b/include/hw/cpu/socket.h
@@ -0,0 +1,29 @@
+/*
+ * CPU socket abstract device
+ *
+ * Copyright (C) 2024 Intel Corporation.
+ *
+ * Author: Zhao Liu <zhao1.liu@intel.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_CPU_SOCKET_H
+#define HW_CPU_SOCKET_H
+
+#include "hw/cpu/cpu-topology.h"
+#include "hw/qdev-core.h"
+
+#define TYPE_CPU_SOCKET "cpu-socket"
+
+OBJECT_DECLARE_SIMPLE_TYPE(CPUSocket, CPU_SOCKET)
+
+struct CPUSocket {
+    /*< private >*/
+    CPUTopoState parent_obj;
+
+    /*< public >*/
+};
+
+#endif /* HW_CPU_SOCKET_H */
-- 
2.34.1
