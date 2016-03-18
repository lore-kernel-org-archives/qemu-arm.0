Received: by 10.25.208.211 with SMTP id h202csp792847lfg;
        Thu, 17 Mar 2016 20:27:59 -0700 (PDT)
X-Received: by 10.140.128.21 with SMTP id 21mr12498803qha.59.1458271679869;
        Thu, 17 Mar 2016 20:27:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h68si4709582qgf.82.2016.03.17.20.27.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2016 20:27:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41273 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agl4x-00060m-AZ
	for alex.bennee@linaro.org; Thu, 17 Mar 2016 23:27:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1agl4t-0005va-81
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 23:27:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1agl4q-0000tm-0A
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 23:27:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41204)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1agl4p-0000th-Oo; Thu, 17 Mar 2016 23:27:51 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 61D712191;
	Fri, 18 Mar 2016 03:27:51 +0000 (UTC)
Received: from pxdev.xzpeter.org.com (vpn1-7-63.pek2.redhat.com [10.72.7.63])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u2I3Rce3023061; Thu, 17 Mar 2016 23:27:47 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 18 Mar 2016 11:27:31 +0800
Message-Id: <1458271654-23706-3-git-send-email-peterx@redhat.com>
In-Reply-To: <1458271654-23706-1-git-send-email-peterx@redhat.com>
References: <1458271654-23706-1-git-send-email-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	armbru@redhat.com, peterx@redhat.com, abologna@redhat.com,
	qemu-arm@nongnu.org, eblake@redhat.com
Subject: [Qemu-arm] [PATCH v5 2/5] arm: qmp: add query-gic-capabilities
	interface
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3wCrBuUhg0RR

This patch adds the command "query-gic-capabilities" but not implemnet
it. The command is ARM-only. Return of the command is a list of
GICCapability struct that describes all GIC versions that current QEMU
and system support.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 monitor.c                |  8 ++++++++
 qapi-schema.json         | 11 +++++++++++
 qmp-commands.hx          | 26 ++++++++++++++++++++++++++
 scripts/qapi.py          |  1 +
 target-arm/Makefile.objs |  2 +-
 target-arm/monitor.c     | 31 +++++++++++++++++++++++++++++++
 6 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 target-arm/monitor.c

diff --git a/monitor.c b/monitor.c
index 894f862..d463dc4 100644
--- a/monitor.c
+++ b/monitor.c
@@ -4257,3 +4257,11 @@ void qmp_dump_skeys(const char *filename, Error **errp)
     error_setg(errp, QERR_FEATURE_DISABLED, "dump-skeys");
 }
 #endif
+
+#ifndef TARGET_ARM
+GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
+{
+    error_setg(errp, QERR_FEATURE_DISABLED, "query-gic-capabilities");
+    return NULL;
+}
+#endif
diff --git a/qapi-schema.json b/qapi-schema.json
index da9671a..b2ef149 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -4156,3 +4156,14 @@
   'data': { 'version': 'int',
             'emulated': 'bool',
             'kernel': 'bool' } }
+
+##
+# @query-gic-capabilities:
+#
+# Return a list of supported GIC version capabilities.
+#
+# Returns: a list of GICCapability.
+#
+# Since: 2.6
+##
+{ 'command': 'query-gic-capabilities', 'returns': ['GICCapability'] }
diff --git a/qmp-commands.hx b/qmp-commands.hx
index 9e05365..a124ea8 100644
--- a/qmp-commands.hx
+++ b/qmp-commands.hx
@@ -4853,3 +4853,29 @@ Example:
                  {"type": 0, "out-pport": 0, "pport": 0, "vlan-id": 3840,
                   "pop-vlan": 1, "id": 251658240}
    ]}
+
+EQMP
+
+#if defined TARGET_ARM
+    {
+        .name       = "query-gic-capabilities",
+        .args_type  = "",
+        .mhandler.cmd_new = qmp_marshal_query_gic_capabilities,
+    },
+#endif
+
+SQMP
+query-gic-capabilities
+---------------
+
+Return a list of supported ARM GIC versions and their capabilities.
+
+Arguments: None
+
+Example:
+
+-> { "execute": "query-gic-capabilities" }
+<- { "return": [{ "version": 2, "emulated": true, "kernel": false },
+                { "version": 3, "emulated": false, "kernel": true } ] }
+
+EQMP
diff --git a/scripts/qapi.py b/scripts/qapi.py
index 6b2aa6e..716474e 100644
--- a/scripts/qapi.py
+++ b/scripts/qapi.py
@@ -46,6 +46,7 @@ returns_whitelist = [
     'query-tpm-models',
     'query-tpm-types',
     'ringbuf-read',
+    'query-gic-capability',
 
     # From QGA:
     'guest-file-open',
diff --git a/target-arm/Makefile.objs b/target-arm/Makefile.objs
index a80eb39..334074c 100644
--- a/target-arm/Makefile.objs
+++ b/target-arm/Makefile.objs
@@ -8,4 +8,4 @@ obj-y += translate.o op_helper.o helper.o cpu.o
 obj-y += neon_helper.o iwmmxt_helper.o
 obj-y += gdbstub.o
 obj-$(TARGET_AARCH64) += cpu64.o translate-a64.o helper-a64.o gdbstub64.o
-obj-y += crypto_helper.o
+obj-y += crypto_helper.o monitor.o
diff --git a/target-arm/monitor.c b/target-arm/monitor.c
new file mode 100644
index 0000000..5678eb8
--- /dev/null
+++ b/target-arm/monitor.c
@@ -0,0 +1,31 @@
+/*
+ * QEMU monitor.c for ARM.
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
+#include "qemu/osdep.h"
+#include "hw/boards.h"
+#include "qemu/error-report.h"
+#include "sysemu/kvm.h"
+#include "qmp-commands.h"
+
+GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
+{
+    return NULL;
+}
-- 
2.4.3

