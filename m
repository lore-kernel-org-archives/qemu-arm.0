Received: by 10.25.208.211 with SMTP id h202csp369271lfg;
        Wed, 23 Mar 2016 19:58:19 -0700 (PDT)
X-Received: by 10.140.91.245 with SMTP id z108mr7503767qgd.99.1458788299381;
        Wed, 23 Mar 2016 19:58:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l34si4797606qgf.84.2016.03.23.19.58.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 19:58:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47252 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aivTX-0004w5-1W
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 22:58:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aivRa-0001io-Ig
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 22:56:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aivRZ-0000xC-Hs
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 22:56:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52777)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1aivRZ-0000x8-Cm; Wed, 23 Mar 2016 22:56:17 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id E702E1F585;
	Thu, 24 Mar 2016 02:56:16 +0000 (UTC)
Received: from pxdev.xzpeter.org.com (vpn1-7-35.pek2.redhat.com [10.72.7.35])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u2O2tlUL013405; Wed, 23 Mar 2016 22:56:11 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 24 Mar 2016 10:55:42 +0800
Message-Id: <1458788142-17509-5-git-send-email-peterx@redhat.com>
In-Reply-To: <1458788142-17509-1-git-send-email-peterx@redhat.com>
References: <1458788142-17509-1-git-send-email-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	libvir-list@redhat.com, armbru@redhat.com, peterx@redhat.com,
	abologna@redhat.com, qemu-arm@nongnu.org, eblake@redhat.com,
	christoffer.dall@linaro.org
Subject: [Qemu-arm] [PATCH v7 4/4] arm: implement query-gic-capabilities
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
X-TUID: M+bHSaSA2BMK

For emulated GIC capabilities, currently only gicv2 is supported. We
need to add gicv3 in when emulated gicv3 ready. For KVM accelerated ARM
VM, we detect the capability bits by creating a scratch VM.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 target-arm/monitor.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/target-arm/monitor.c b/target-arm/monitor.c
index 4c9bef3..1ee59a2 100644
--- a/target-arm/monitor.c
+++ b/target-arm/monitor.c
@@ -21,8 +21,64 @@
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
+
+static inline void gic_cap_kvm_probe(GICCapability *v2, GICCapability *v3)
+{
+#ifdef CONFIG_KVM
+    int fdarray[3];
+
+    if (!kvm_arm_create_scratch_host_vcpu(NULL, fdarray, NULL)) {
+        return;
+    }
+
+    /* Test KVM GICv2 */
+    if (kvm_device_supported(fdarray[1], KVM_DEV_TYPE_ARM_VGIC_V2)) {
+        v2->kernel = true;
+    }
+
+    /* Test KVM GICv3 */
+    if (kvm_device_supported(fdarray[1], KVM_DEV_TYPE_ARM_VGIC_V3)) {
+        v3->kernel = true;
+    }
+
+    kvm_arm_destroy_scratch_host_vcpu(fdarray);
+#endif
+}
 
 GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
 {
-    return NULL;
+    GICCapabilityList *head = NULL;
+    GICCapability *v2 = gic_cap_new(2), *v3 = gic_cap_new(3);
+
+    v2->emulated = true;
+    /* TODO: we'd change to true after we get emulated GICv3. */
+    v3->emulated = false;
+
+    gic_cap_kvm_probe(v2, v3);
+
+    head = gic_cap_list_add(head, v2);
+    head = gic_cap_list_add(head, v3);
+
+    return head;
 }
-- 
2.4.3

