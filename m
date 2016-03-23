Received: by 10.25.208.211 with SMTP id h202csp2263631lfg;
        Tue, 22 Mar 2016 22:33:01 -0700 (PDT)
X-Received: by 10.55.201.81 with SMTP id q78mr963034qki.98.1458711181594;
        Tue, 22 Mar 2016 22:33:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w74si801412qgw.78.2016.03.22.22.33.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Mar 2016 22:33:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41029 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aibPh-0003AD-2f
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 01:33:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aibPd-00036n-7d
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 01:32:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aibPc-0001Dv-1g
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 01:32:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52923)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1aibPb-0001Dq-Q1; Wed, 23 Mar 2016 01:32:55 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 6E8D880E4A;
	Wed, 23 Mar 2016 05:32:55 +0000 (UTC)
Received: from pxdev.xzpeter.org.com (dhcp-14-238.nay.redhat.com
	[10.66.14.238])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2N5WeSF011002; Wed, 23 Mar 2016 01:32:49 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 23 Mar 2016 13:32:30 +0800
Message-Id: <1458711153-15988-2-git-send-email-peterx@redhat.com>
In-Reply-To: <1458711153-15988-1-git-send-email-peterx@redhat.com>
References: <1458711153-15988-1-git-send-email-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	libvir-list@redhat.com, armbru@redhat.com, peterx@redhat.com,
	abologna@redhat.com, qemu-arm@nongnu.org, eblake@redhat.com
Subject: [Qemu-arm] [PATCH v6 1/4] arm: qmp: add query-gic-capabilities
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
X-TUID: 3/soMjkMRfgd

This patch add "query-gic-capabilities" but does not implemnet it. The
command is ARM-only. The command will return one GICCapabilityResult
object, which contains a array of GICCapability struct that describes
all GIC versions that current QEMU and system support.

Libvirt is possibly the first consumer of this new command.

Before this patch, user will successfully configure all kinds of GIC
devices for ARM guests, no matter whether current QEMU/kernel support
it. If the specified GIC version/type is not supported, user will got an
ambiguous "QEMU boot failure" when trying to start the VM. This is not
user-friendly.

With this patch, libvirt should be able to query which type (and which
version) of GIC device that we support. Use this information, libvirt
can warn the user during configuration of guests when specified GIC
device type is not supported. Or better, we can just list those versions
that we support, and filter out those not-supported ones.

Besides, the community is working on a more generic way to query these
kind of information. However, due to the eagerness of this command, we
decided to first implement this ad-hoc one, then when the generic method
is ready, we can move on to that one smoothly.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 monitor.c                |  8 ++++++++
 qapi-schema.json         | 50 ++++++++++++++++++++++++++++++++++++++++++++++++
 qmp-commands.hx          | 28 +++++++++++++++++++++++++++
 target-arm/Makefile.objs |  2 +-
 target-arm/monitor.c     | 28 +++++++++++++++++++++++++++
 5 files changed, 115 insertions(+), 1 deletion(-)
 create mode 100644 target-arm/monitor.c

diff --git a/monitor.c b/monitor.c
index 4c02f0f..3845213 100644
--- a/monitor.c
+++ b/monitor.c
@@ -4258,3 +4258,11 @@ void qmp_dump_skeys(const char *filename, Error **errp)
     error_setg(errp, QERR_FEATURE_DISABLED, "dump-skeys");
 }
 #endif
+
+#ifndef TARGET_ARM
+GICCapabilityResult *qmp_query_gic_capabilities(Error **errp)
+{
+    error_setg(errp, QERR_FEATURE_DISABLED, "query-gic-capabilities");
+    return NULL;
+}
+#endif
diff --git a/qapi-schema.json b/qapi-schema.json
index 88f9b81..72359dd 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -4126,3 +4126,53 @@
 ##
 { 'enum': 'ReplayMode',
   'data': [ 'none', 'record', 'play' ] }
+
+##
+# @GICCapability:
+#
+# The struct describes capability for a specific GIC (Generic
+# Interrupt Controller) version. These bits are not only decided by
+# QEMU/KVM software version, but also decided by the hardware that
+# the program is running upon.
+#
+# @version:  version of GIC to be described. Currently, only 2 and 3
+#            are supported.
+#
+# @emulated: whether current QEMU/hardware supports emulated GIC
+#            device in user space.
+#
+# @kernel:   whether current QEMU/hardware supports hardware
+#            accelerated GIC device in kernel.
+#
+# Since: 2.6
+##
+{ 'struct': 'GICCapability',
+  'data': { 'version': 'int',
+            'emulated': 'bool',
+            'kernel': 'bool' } }
+
+##
+# @GICCapabilityResult:
+#
+# Query result for GIC capabilities.
+#
+# @data:  currently with a single key 'capabilities', which contains
+#         a list of GICCapability elements, describing all supported
+#         versions/kinds of GIC devices.
+#
+# Since: 2.6
+##
+{ 'struct': 'GICCapabilityResult',
+  'data': { 'capabilities': ['GICCapability'] } }
+
+##
+# @query-gic-capabilities:
+#
+# This command is ARM-only. It will return a GICCapabilityResult
+# object that describes its capability bits.
+#
+# Returns: GICCapabilityResult object.
+#
+# Since: 2.6
+##
+{ 'command': 'query-gic-capabilities', 'returns': 'GICCapabilityResult' }
diff --git a/qmp-commands.hx b/qmp-commands.hx
index 9e05365..4144982 100644
--- a/qmp-commands.hx
+++ b/qmp-commands.hx
@@ -4853,3 +4853,31 @@ Example:
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
+Return a GICCapabilityResult object, which contains a list of
+GICCapability elements, describing supported GIC versions.
+
+Arguments: None
+
+Example:
+
+-> { "execute": "query-gic-capabilities" }
+<- { "return": { "capabilities": [
+                { "version": 2, "emulated": true, "kernel": false },
+                { "version": 3, "emulated": false, "kernel": true } ] } }
+
+EQMP
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
index 0000000..254a9c9
--- /dev/null
+++ b/target-arm/monitor.c
@@ -0,0 +1,28 @@
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
+#include "qmp-commands.h"
+
+GICCapabilityResult *qmp_query_gic_capabilities(Error **errp)
+{
+    return NULL;
+}
-- 
2.4.3

