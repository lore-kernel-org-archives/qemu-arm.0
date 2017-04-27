Received: by 10.25.0.144 with SMTP id 138csp885729lfa;
        Thu, 27 Apr 2017 10:39:05 -0700 (PDT)
X-Received: by 10.31.146.12 with SMTP id u12mr2830555vkd.102.1493314745348;
        Thu, 27 Apr 2017 10:39:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a123si873815vkf.210.2017.04.27.10.39.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Apr 2017 10:39:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33477 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d3nNg-00049G-O8
	for alex.bennee@linaro.org; Thu, 27 Apr 2017 13:39:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1d3nNa-000491-St
	for qemu-arm@nongnu.org; Thu, 27 Apr 2017 13:38:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1d3nNY-0005Dt-PM
	for qemu-arm@nongnu.org; Thu, 27 Apr 2017 13:38:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44636)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1d3nNY-0005Dh-Ir; Thu, 27 Apr 2017 13:38:56 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 727A146D093;
	Thu, 27 Apr 2017 17:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 727A146D093
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=wei@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 727A146D093
Received: from weilaptop.redhat.com (ovpn-125-235.rdu2.redhat.com
	[10.10.125.235])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E30B5996D0;
	Thu, 27 Apr 2017 17:38:54 +0000 (UTC)
From: Wei Huang <wei@redhat.com>
To: qemu-arm@nongnu.org
Date: Thu, 27 Apr 2017 12:38:47 -0500
Message-Id: <1493314727-6951-3-git-send-email-wei@redhat.com>
In-Reply-To: <1493314727-6951-1-git-send-email-wei@redhat.com>
References: <1493314727-6951-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 27 Apr 2017 17:38:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 2/2] armv7m: Use stub functions if CONFIG_ARM_V7M
 is not defined
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GHkBF8xa2jNC

M-profile CPUs relies on NVIC controller which won't be compiled if
CONFIG_ARM_V7M is not defined. To solve the problem, this patch
defines four NVIC stub functions. These functions are called when
CONFIG_ARM_V7M is not defined.

Signed-off-by: Wei Huang <wei@redhat.com>
---
 target/arm/Makefile.objs |  1 +
 target/arm/armv7m-stub.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 target/arm/armv7m-stub.c

diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 847fb52..328367d 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -4,6 +4,7 @@ obj-$(CONFIG_KVM) += kvm.o
 obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) += kvm32.o
 obj-$(call land,$(CONFIG_KVM),$(TARGET_AARCH64)) += kvm64.o
 obj-$(call lnot,$(CONFIG_KVM)) += kvm-stub.o
+obj-$(call lnot,$(CONFIG_ARM_V7M)) += armv7m-stub.o
 obj-y += translate.o op_helper.o helper.o cpu.o
 obj-y += neon_helper.o iwmmxt_helper.o
 obj-y += gdbstub.o
diff --git a/target/arm/armv7m-stub.c b/target/arm/armv7m-stub.c
new file mode 100644
index 0000000..1be3874
--- /dev/null
+++ b/target/arm/armv7m-stub.c
@@ -0,0 +1,43 @@
+/*
+ * ARMv7M stubs
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "cpu.h"
+#include "hw/arm/armv7m.h"
+
+void armv7m_nvic_acknowledge_irq(void *opaque)
+{
+    NVICState *s = (NVICState *)opaque;
+
+    cpu_abort(CPU(s->cpu), "No NVIC avaialable to acknowledge IRQ\n");
+}
+
+void armv7m_nvic_set_pending(void *opaque, int irq)
+{
+    NVICState *s = (NVICState *)opaque;
+
+    cpu_abort(CPU(s->cpu), "No NVIC avaialable to set IRQ pending\n");
+}
+
+int armv7m_nvic_complete_irq(void *opaque, int irq)
+{
+    NVICState *s = (NVICState *)opaque;
+
+    cpu_abort(CPU(s->cpu), "No NVIC avaialable to complete IRQ\n");
+
+    return 0;
+}
+
+bool armv7m_nvic_can_take_pending_exception(void *opaque)
+{
+    NVICState *s = (NVICState *)opaque;
+
+    cpu_abort(CPU(s->cpu), "No NVIC avaialable to check pending exception\n");
+
+    return false;
+}
-- 
1.8.3.1

