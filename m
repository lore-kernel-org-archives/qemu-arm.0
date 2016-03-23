Received: by 10.25.208.211 with SMTP id h202csp2264100lfg;
        Tue, 22 Mar 2016 22:34:34 -0700 (PDT)
X-Received: by 10.55.71.195 with SMTP id u186mr989902qka.38.1458711274339;
        Tue, 22 Mar 2016 22:34:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 5si822388qhz.29.2016.03.22.22.34.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Mar 2016 22:34:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41045 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aibRB-0006KP-QE
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 01:34:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aibQ3-0003rv-1S
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 01:33:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aibPz-0001Qp-Ld
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 01:33:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46881)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1aibPz-0001Qj-FJ; Wed, 23 Mar 2016 01:33:19 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 1BAB06438E;
	Wed, 23 Mar 2016 05:33:19 +0000 (UTC)
Received: from pxdev.xzpeter.org.com (dhcp-14-238.nay.redhat.com
	[10.66.14.238])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2N5WeSI011002; Wed, 23 Mar 2016 01:33:10 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 23 Mar 2016 13:32:33 +0800
Message-Id: <1458711153-15988-5-git-send-email-peterx@redhat.com>
In-Reply-To: <1458711153-15988-1-git-send-email-peterx@redhat.com>
References: <1458711153-15988-1-git-send-email-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 23 Mar 2016 05:33:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	libvir-list@redhat.com, armbru@redhat.com, peterx@redhat.com,
	abologna@redhat.com, qemu-arm@nongnu.org, eblake@redhat.com
Subject: [Qemu-arm] [PATCH v6 4/4] arm: implement query-gic-capabilities
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
X-TUID: uPOnb/TDfowV

For emulated GIC capabilities, currently only gicv2 is supported. We
need to add gicv3 in when emulated gicv3 ready. For KVM accelerated ARM
VM, we detect the capability bits by creating a scratch VM.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 target-arm/monitor.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/target-arm/monitor.c b/target-arm/monitor.c
index 254a9c9..4a2db59 100644
--- a/target-arm/monitor.c
+++ b/target-arm/monitor.c
@@ -21,8 +21,66 @@
  */
 #include "qemu/osdep.h"
 #include "qmp-commands.h"
+#include "hw/boards.h"
+#include "kvm_arm.h"
+
+static GICCapability *gic_cap_new(int version)
+{
+    GICCapability *cap = g_new0(GICCapability, 1);
+    cap->version = version;
+    /* by default, support none */
+    cap->emulated = false;
+    cap->kernel = false;
+    return cap;
+}
+
+static GICCapabilityList *gic_cap_list_add(GICCapabilityList *head,
+                                           GICCapability *cap)
+{
+    GICCapabilityList *item = g_new0(GICCapabilityList, 1);
+    item->value = cap;
+    item->next = head;
+    return item;
+}
 
 GICCapabilityResult *qmp_query_gic_capabilities(Error **errp)
 {
-    return NULL;
+    GICCapabilityResult *result = g_new0(GICCapabilityResult, 1);
+    GICCapabilityList *head = NULL;
+    GICCapability *v2 = gic_cap_new(2), *v3 = gic_cap_new(3);
+
+    v2->emulated = true;
+    /* FIXME: we'd change to true after we get emulated GICv3. */
+    v3->emulated = false;
+
+#ifdef CONFIG_KVM
+    {
+        int fdarray[3];
+
+        if (!kvm_arm_create_scratch_host_vcpu(NULL, fdarray, NULL)) {
+            goto out;
+        }
+
+        /* Test KVM GICv2 */
+        if (kvm_support_device(fdarray[1], KVM_DEV_TYPE_ARM_VGIC_V2)) {
+            v2->kernel = true;
+        }
+
+        /* Test KVM GICv3 */
+        if (kvm_support_device(fdarray[1], KVM_DEV_TYPE_ARM_VGIC_V3)) {
+            v3->kernel = true;
+        }
+
+        kvm_arm_destroy_scratch_host_vcpu(fdarray);
+out:
+        ;
+    }
+#endif
+
+    head = gic_cap_list_add(head, v2);
+    head = gic_cap_list_add(head, v3);
+
+    result->capabilities = head;
+
+    return result;
 }
-- 
2.4.3

