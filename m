Received: by 10.80.166.35 with SMTP id d32csp642856edc;
        Mon, 17 Oct 2016 13:00:14 -0700 (PDT)
X-Received: by 10.55.111.68 with SMTP id k65mr15412853qkc.9.1476734414181;
        Mon, 17 Oct 2016 13:00:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b34si18771660qkh.220.2016.10.17.13.00.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Oct 2016 13:00:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35594 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwE4z-0002sf-I7
	for alex.bennee@linaro.org; Mon, 17 Oct 2016 16:00:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56537)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bwDkT-0001RV-M8
	for qemu-arm@nongnu.org; Mon, 17 Oct 2016 15:39:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bwDkS-0007vb-L1
	for qemu-arm@nongnu.org; Mon, 17 Oct 2016 15:39:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59444)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1bwDkS-0007v9-FQ; Mon, 17 Oct 2016 15:39:00 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB2D44E4D7;
	Mon, 17 Oct 2016 19:38:59 +0000 (UTC)
Received: from localhost.redhat.com (vpn1-5-170.ams2.redhat.com [10.36.5.170])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u9HJcVFZ009529; Mon, 17 Oct 2016 15:38:56 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com
Date: Mon, 17 Oct 2016 19:38:28 +0000
Message-Id: <1476733110-14293-7-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1476733110-14293-1-git-send-email-eric.auger@redhat.com>
References: <1476733110-14293-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 17 Oct 2016 19:38:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 6/8] hw: platform-bus: Add platform bus stub
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
Cc: diana.craciun@freescale.com, Bharat.Bhushan@freescale.com,
	drjones@redhat.com, christoffer.dall@linaro.org, fkan@apm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7us1ccnTYDwR

platform_bus_map_region is bound to be called in VFIO common code.

Let's compile this stub in case CONFIG_SOFTMMU is set (VFIO requirement)
and CONFIG_PLATFORM_BUS is not set.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/core/Makefile.objs       |  2 +-
 hw/core/platform-bus-stub.c | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 hw/core/platform-bus-stub.c

diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index a4c94e5..f6ececc 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -18,5 +18,5 @@ common-obj-$(CONFIG_SOFTMMU) += qdev-properties-system.o
 common-obj-$(CONFIG_SOFTMMU) += register.o
 common-obj-$(CONFIG_SOFTMMU) += or-irq.o
 common-obj-$(CONFIG_PLATFORM_BUS) += platform-bus.o
-
+common-obj-$(call land,$(CONFIG_SOFTMMU),$(call lnot,$(CONFIG_PLATFORM_BUS))) += platform-bus-stub.o
 obj-$(CONFIG_SOFTMMU) += generic-loader.o
diff --git a/hw/core/platform-bus-stub.c b/hw/core/platform-bus-stub.c
new file mode 100644
index 0000000..41d4ab6
--- /dev/null
+++ b/hw/core/platform-bus-stub.c
@@ -0,0 +1,27 @@
+/*
+ * Platform Bus device stub
+ *
+ * platform_bus_map_region is used in VFIO common code
+ *
+ * Copyright Red Hat, Inc. 2016
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/platform-bus.h"
+
+void platform_bus_map_region(PlatformBusDevice *pbus, MemoryRegion *mr)
+{
+}
-- 
1.9.1

