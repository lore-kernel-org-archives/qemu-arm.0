Received: by 2002:a05:7022:f8d:b0:8a:132c:44a7 with SMTP id eg13csp85932dlb;
        Wed, 18 Sep 2024 22:56:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUkrUxaGxtWeSt5zn5VKJuxMFoPcCEy6+JzKZFTZPupAPFTRWFxVLmEC3ZgktYIA+gtUodP4lv/F8Mkyg==@linaro.org
X-Google-Smtp-Source: AGHT+IGEVWknrvnAhINbvAzmwk9wBR3RQbTj+sV6dBNSTmbmWFEADuPtr5GGqQv8PbSsfdFD32GK
X-Received: by 2002:a05:6214:2f93:b0:6c5:9bc6:8962 with SMTP id 6a1803df08f44-6c59bc68c4bmr245756486d6.30.1726725387198;
        Wed, 18 Sep 2024 22:56:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726725387; cv=none;
        d=google.com; s=arc-20240605;
        b=dyH7TiBWJzMTE7nstQXfWgDBhodecybSdIflCCEK9qM28GV2pKGEZ7+hW7d6dQIOFm
         E03cWSHma2DkTWO4HuN0UsTW6qi8Ygk+ApOWhhpTYA0iWdozGUpdUWiTWdfEi/4WYjaG
         T4YLvVRboEfgEKR1vKoI9e1l4fx9HmoA2bqs5H8D1Y4ZBkNaMkrXpqif26vCgpliijQG
         wTRHO93W6hXKPVroEAxjOqQ0OxfKB4/ZmPYcvTkO07pY9IMrXxfehyldwDj3l6HQk/9F
         UjRe6qJY//z4pde5Q2519FPNyBMnO/PHBTAV7pcQjLdIODaUPSDHVXzUQEvM4j03o/FX
         gaIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3S695knr8Clzf1jpPPHukJMqZsHhQpIk6zvZaUzuIXM=;
        fh=33vV7fdwuF57f9/cQTMVCjJLx99l6PrD70Pt7L6JrPg=;
        b=PlpQI3JDWkbyukkcdlSUIKWBWsJFIjt2IjQUD7azK7XlravtNIEQ1dQ95w661lj0N+
         WEf43A3g5MgAEvz/wEZ7xZsYYHFHo33UOexFgTsp+FARsGIzdZxIfZSJVpN0NMPz8jvl
         WQqJGbsW2JlB9SfFEXajEYyGNIihol1Pw1zFh08ZFG/JNLlB07prXVYC+d9c2nVkl+Yi
         qoD///RPd6ey3CUeQw7teiUOPayr07Q8HXJN4HhhYrn0qPh6Ht7XhuIptQKirF9lud8i
         WqN1GH6YyBGT5iUvbNLB++Fz5sjxXOQ7wyvq+BCOHj3KKey6T3d/nEmli+rQijHntqM0
         G+SQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=YYNoeKfD;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.15])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c75e561fefsi11380346d6.306.2024.09.18.22.56.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 22:56:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) client-ip=192.198.163.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=YYNoeKfD;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726725387; x=1758261387;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qJ6NOfIv6xlTy3/VIJhTGfDVU1kuzHahvjHb/mzi/Yo=;
  b=YYNoeKfDS+55N6bL0A9VY3pRxYKOnKXayykRLsG3pZnuHjLWGL0nZasy
   V6P5i4rdiVQ+TojnAfmAHsCnDr4p5pTrqwUM4zAUnT90rUBGa9DkEG3pi
   swP59QwvHVdtF7hhZNnRK5Qzc7P2Fc0G/z15VEilhqPXQi6URk8slVJwg
   s7ONEN5OeYhcGV4LnSR3EL7uWJJnx55hFR2pDUxkwe/er6HIY+ZuMhuIv
   2huNCHE7iUtCUuLmNX/rmRmjkDCletuv4BCil2L7Y8yfCU+Rr9eB1lqhK
   PlfFBAcHg8j5MUI1Abnf+bpoFEOcxMdiOERWqlFwrfs0CbuNBgjl1SGH2
   g==;
X-CSE-ConnectionGUID: aii5aDJXRsm7O1fCgbmH2Q==
X-CSE-MsgGUID: n54SHe6eTXqJYJ7gO0Qwqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25813694"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="25813694"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 22:56:26 -0700
X-CSE-ConnectionGUID: RNragx4JQm++GP/Zqhw+Sw==
X-CSE-MsgGUID: ix81mjh5Tfy9LecwpDpOIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="69418793"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa006.fm.intel.com with ESMTP; 18 Sep 2024 22:56:20 -0700
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
	Sergio Lopez <slp@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC v2 09/12] i386: Introduce x86 CPU core abstractions
Date: Thu, 19 Sep 2024 14:11:25 +0800
Message-Id: <20240919061128.769139-10-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919061128.769139-1-zhao1.liu@intel.com>
References: <20240919061128.769139-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: du96YtqWB5jO

Abstract 3 core types for i386: common core, Intel Core (P-core) and
Intel atom (E-core). This is in preparation for creating the hybrid
topology from the CLI.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 target/i386/core.c      | 56 +++++++++++++++++++++++++++++++++++++++++
 target/i386/core.h      | 53 ++++++++++++++++++++++++++++++++++++++
 target/i386/meson.build |  1 +
 3 files changed, 110 insertions(+)
 create mode 100644 target/i386/core.c
 create mode 100644 target/i386/core.h

diff --git a/target/i386/core.c b/target/i386/core.c
new file mode 100644
index 000000000000..d76186a6a070
--- /dev/null
+++ b/target/i386/core.c
@@ -0,0 +1,56 @@
+/*
+ * x86 CPU core
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
+#include "core.h"
+
+static void x86_common_core_class_init(ObjectClass *oc, void *data)
+{
+    X86CPUCoreClass *cc = X86_CPU_CORE_CLASS(oc);
+
+    cc->core_type = COMMON_CORE;
+}
+
+static void x86_intel_atom_class_init(ObjectClass *oc, void *data)
+{
+    X86CPUCoreClass *cc = X86_CPU_CORE_CLASS(oc);
+
+    cc->core_type = INTEL_ATOM;
+}
+
+static void x86_intel_core_class_init(ObjectClass *oc, void *data)
+{
+    X86CPUCoreClass *cc = X86_CPU_CORE_CLASS(oc);
+
+    cc->core_type = INTEL_CORE;
+}
+
+static const TypeInfo x86_cpu_core_infos[] = {
+    {
+        .name = TYPE_X86_CPU_CORE,
+        .parent = TYPE_CPU_CORE,
+        .class_size = sizeof(X86CPUCoreClass),
+        .class_init = x86_common_core_class_init,
+        .instance_size = sizeof(X86CPUCore),
+    },
+    {
+        .parent = TYPE_X86_CPU_CORE,
+        .name = X86_CPU_CORE_TYPE_NAME("intel-atom"),
+        .class_init = x86_intel_atom_class_init,
+    },
+    {
+        .parent = TYPE_X86_CPU_CORE,
+        .name = X86_CPU_CORE_TYPE_NAME("intel-core"),
+        .class_init = x86_intel_core_class_init,
+    },
+};
+
+DEFINE_TYPES(x86_cpu_core_infos)
diff --git a/target/i386/core.h b/target/i386/core.h
new file mode 100644
index 000000000000..b942153b2c0d
--- /dev/null
+++ b/target/i386/core.h
@@ -0,0 +1,53 @@
+/*
+ * x86 CPU core header
+ *
+ * Copyright (C) 2024 Intel Corporation.
+ *
+ * Author: Zhao Liu <zhao1.liu@intel.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#include "hw/cpu/core.h"
+#include "hw/cpu/cpu-topology.h"
+#include "qom/object.h"
+
+#ifndef I386_CORE_H
+#define I386_CORE_H
+
+#ifdef TARGET_X86_64
+#define TYPE_X86_PREFIX "x86-"
+#else
+#define TYPE_X86_PREFIX "i386-"
+#endif
+
+#define TYPE_X86_CPU_CORE TYPE_X86_PREFIX "core"
+
+OBJECT_DECLARE_TYPE(X86CPUCore, X86CPUCoreClass, X86_CPU_CORE)
+
+typedef enum {
+    COMMON_CORE = 0,
+    INTEL_ATOM,
+    INTEL_CORE,
+} X86CoreType;
+
+struct X86CPUCoreClass {
+    /*< private >*/
+    CPUTopoClass parent_class;
+
+    /*< public >*/
+    DeviceRealize parent_realize;
+    X86CoreType core_type;
+};
+
+struct X86CPUCore {
+    /*< private >*/
+    CPUCore parent_obj;
+
+    /*< public >*/
+};
+
+#define X86_CPU_CORE_TYPE_NAME(core_type_str) (TYPE_X86_PREFIX core_type_str)
+
+#endif /* I386_CORE_H */
diff --git a/target/i386/meson.build b/target/i386/meson.build
index 075117989b9d..80a32526d98b 100644
--- a/target/i386/meson.build
+++ b/target/i386/meson.build
@@ -18,6 +18,7 @@ i386_system_ss.add(files(
   'arch_memory_mapping.c',
   'machine.c',
   'monitor.c',
+  'core.c',
   'cpu-apic.c',
   'cpu-sysemu.c',
 ))
-- 
2.34.1
