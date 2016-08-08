Received: by 10.25.21.156 with SMTP id 28csp2952634lfv;
        Mon, 8 Aug 2016 00:28:33 -0700 (PDT)
X-Received: by 10.237.33.111 with SMTP id 102mr26514661qtc.56.1470641313053;
        Mon, 08 Aug 2016 00:28:33 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l68si7706419qkd.59.2016.08.08.00.28.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Aug 2016 00:28:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55431 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bWezA-00060W-EJ
	for alex.bennee@linaro.org; Mon, 08 Aug 2016 03:28:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bWeyC-0004vX-Hj
	for qemu-arm@nongnu.org; Mon, 08 Aug 2016 03:27:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bWeyA-0006aJ-69
	for qemu-arm@nongnu.org; Mon, 08 Aug 2016 03:27:31 -0400
Received: from mga01.intel.com ([192.55.52.88]:31245)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>)
	id 1bWey2-0006Zd-FS; Mon, 08 Aug 2016 03:27:22 -0400
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Aug 2016 00:27:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,488,1464678000"; d="scan'208";a="1037012339"
Received: from lvzheng-z530.sh.intel.com ([10.239.159.23])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2016 00:27:20 -0700
From: Lv Zheng <lv.zheng@intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Shannon Zhao <shannon.zhao@linaro.org>
Date: Mon,  8 Aug 2016 15:26:59 +0800
Message-Id: <5d4b5e6b17eadf92b61e9ef6f3118f7658bb99d0.1470641028.git.lv.zheng@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <24044757332cd427e378053739e6f49980e0ac5d.1470392366.git.lv.zheng@intel.com>
References: <24044757332cd427e378053739e6f49980e0ac5d.1470392366.git.lv.zheng@intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.88
Subject: [Qemu-arm] [PATCH v2] ACPI: Enable AML DBUG() control method
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
Cc: qemu-arm@nongnu.org, Lv Zheng <lv.zheng@intel.com>,
	Lv Zheng <zetalog@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T0tpYF9IVt7s

This patch enables DBUG() control method, making it independent of seabios.

DBUG() is defined in the default DSDT, and is used to dump the AML
debugging information to the debug port. Thus it can be used by the ACPI
open source community developers to probe the de-facto standard AML
interpreter behavior.

But the debug IO port address used in DBUG() (DBG operation region field)
is currently not synchronized to any debugging facility implemented in
qemu.

Originally, we managed to use this feature by specifying
"-global isa-debugcon.iobase=0x402 -debugcon stdio" to make it working with
the debug console device. Note that the "iobase=0x402" implies that this
feature is currently dependent on seabios.

But since the AML tables are now provided by qemu itself, this feature
shouldn't be dependent on any BIOS rom. This patch thus changes DBG AML
generation code using isa-debugcon iobase so that we can always use this
feature by only specifying "-debugcon stdio".

Signed-off-by: Lv Zheng <lv.zheng@intel.com>
---
 hw/char/debugcon.c         |   23 +++++++++++++++++++++++
 hw/i386/acpi-build.c       |    4 +++-
 include/hw/char/debugcon.h |   33 +++++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/char/debugcon.h

diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
index e7f025e..7f70ec3 100644
--- a/hw/char/debugcon.c
+++ b/hw/char/debugcon.c
@@ -30,6 +30,7 @@
 #include "sysemu/char.h"
 #include "hw/isa/isa.h"
 #include "hw/i386/pc.h"
+#include "hw/char/debugcon.h"
 
 #define TYPE_ISA_DEBUGCON_DEVICE "isa-debugcon"
 #define ISA_DEBUGCON_DEVICE(obj) \
@@ -134,6 +135,28 @@ static const TypeInfo debugcon_isa_info = {
     .class_init    = debugcon_isa_class_initfn,
 };
 
+static Object *debugcon_isa_find(void)
+{
+    bool ambig;
+    Object *o = object_resolve_path_type("", TYPE_ISA_DEBUGCON_DEVICE,
+                                         &ambig);
+
+    if (ambig) {
+        return NULL;
+    }
+    return o;
+}
+
+uint32_t debugcon_get_port(void)
+{
+    Object *obj = debugcon_isa_find();
+
+    if (obj) {
+        return object_property_get_int(obj, "iobase", &error_abort);
+    }
+    return 0xe9;
+}
+
 static void debugcon_register_types(void)
 {
     type_register_static(&debugcon_isa_info);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a26a4bb..ce7cbc5 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -44,6 +44,7 @@
 #include "hw/acpi/tpm.h"
 #include "sysemu/tpm_backend.h"
 #include "hw/timer/mc146818rtc_regs.h"
+#include "hw/char/debugcon.h"
 #include "sysemu/numa.h"
 
 /* Supported chipsets: */
@@ -1442,7 +1443,8 @@ static void build_dbg_aml(Aml *table)
     Aml *idx = aml_local(2);
 
     aml_append(scope,
-       aml_operation_region("DBG", AML_SYSTEM_IO, aml_int(0x0402), 0x01));
+       aml_operation_region("DBG", AML_SYSTEM_IO,
+                            aml_int(debugcon_get_port()), 0x01));
     field = aml_field("DBG", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
     aml_append(field, aml_named_field("DBGB", 8));
     aml_append(scope, field);
diff --git a/include/hw/char/debugcon.h b/include/hw/char/debugcon.h
new file mode 100644
index 0000000..a2420fd
--- /dev/null
+++ b/include/hw/char/debugcon.h
@@ -0,0 +1,33 @@
+/*
+ * QEMU debug console emulation
+ *
+ * Copyright (c) 2016 Lv Zheng <lv.zheng@intel.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef HW_DEBUGCON_H
+#define HW_DEBUGCON_H
+
+#include "hw/hw.h"
+#include "sysemu/sysemu.h"
+
+extern uint32_t debugcon_get_port(void);
+
+#endif
-- 
1.7.10

