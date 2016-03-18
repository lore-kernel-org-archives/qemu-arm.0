Received: by 10.25.208.211 with SMTP id h202csp793359lfg;
        Thu, 17 Mar 2016 20:29:53 -0700 (PDT)
X-Received: by 10.55.77.216 with SMTP id a207mr18846375qkb.80.1458271793234;
        Thu, 17 Mar 2016 20:29:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m69si3536753qge.48.2016.03.17.20.29.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2016 20:29:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41298 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agl6m-0001iK-OL
	for alex.bennee@linaro.org; Thu, 17 Mar 2016 23:29:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1agl54-0006IV-AZ
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 23:28:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1agl53-0000wk-2J
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 23:28:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54345)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1agl52-0000wc-T7; Thu, 17 Mar 2016 23:28:04 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 89C81C00DDEA;
	Fri, 18 Mar 2016 03:28:04 +0000 (UTC)
Received: from pxdev.xzpeter.org.com (vpn1-7-63.pek2.redhat.com [10.72.7.63])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u2I3Rce6023061; Thu, 17 Mar 2016 23:28:00 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 18 Mar 2016 11:27:34 +0800
Message-Id: <1458271654-23706-6-git-send-email-peterx@redhat.com>
In-Reply-To: <1458271654-23706-1-git-send-email-peterx@redhat.com>
References: <1458271654-23706-1-git-send-email-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	armbru@redhat.com, peterx@redhat.com, abologna@redhat.com,
	qemu-arm@nongnu.org, eblake@redhat.com
Subject: [Qemu-arm] [PATCH v5 5/5] arm: implement query-gic-capabilities
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
X-TUID: EfEw5BsmTGvV

For emulated GIC capabilities, currently only gicv2 is supported. We
need to add gicv3 in when emulated gicv3 ready. For KVM accelerated ARM
VM, we detect the capability bits by creating a scratch VM.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 target-arm/monitor.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/target-arm/monitor.c b/target-arm/monitor.c
index 5678eb8..5493ea6 100644
--- a/target-arm/monitor.c
+++ b/target-arm/monitor.c
@@ -24,8 +24,63 @@
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
 #include "qmp-commands.h"
+#include "kvm_arm.h"
+#include <sys/ioctl.h>
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
 
 GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
 {
-    return NULL;
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
+    return head;
 }
-- 
2.4.3

