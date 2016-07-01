Received: by 10.25.21.96 with SMTP id l93csp280088lfi;
        Fri, 1 Jul 2016 06:02:27 -0700 (PDT)
X-Received: by 10.200.40.181 with SMTP id i50mr5989831qti.89.1467378147323;
        Fri, 01 Jul 2016 06:02:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g12si2311874qtg.83.2016.07.01.06.02.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jul 2016 06:02:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33455 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bIy5S-0006nC-Km
	for alex.bennee@linaro.org; Fri, 01 Jul 2016 09:02:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bIy5N-0006lE-EM
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 09:02:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bIy5J-0004xE-7Z
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 09:02:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43785)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bIy5J-0004x1-2E; Fri, 01 Jul 2016 09:02:17 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8DE91C0624B0;
	Fri,  1 Jul 2016 13:02:16 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-139.brq.redhat.com [10.34.1.139])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u61D2DDC023420; Fri, 1 Jul 2016 09:02:15 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Fri,  1 Jul 2016 15:02:08 +0200
Message-Id: <1467378129-23302-2-git-send-email-drjones@redhat.com>
In-Reply-To: <1467378129-23302-1-git-send-email-drjones@redhat.com>
References: <1467378129-23302-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 01 Jul 2016 13:02:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 1/2] gic: provide defines for v2/v3 targetlist
 sizes
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d9t3EoVZRCXM

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 include/hw/intc/arm_gic.h          | 3 +++
 include/hw/intc/arm_gicv3_common.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/include/hw/intc/arm_gic.h b/include/hw/intc/arm_gic.h
index 0971e37710dd6..42bb535fd4571 100644
--- a/include/hw/intc/arm_gic.h
+++ b/include/hw/intc/arm_gic.h
@@ -23,6 +23,9 @@
 
 #include "arm_gic_common.h"
 
+/* Number of SGI target-list bits */
+#define GIC_TARGETLIST_BITS 8
+
 #define TYPE_ARM_GIC "arm_gic"
 #define ARM_GIC(obj) \
      OBJECT_CHECK(GICState, (obj), TYPE_ARM_GIC)
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index f72e49922feb1..341a3118f0f44 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -35,6 +35,9 @@
 #define GICV3_MAXIRQ 1020
 #define GICV3_MAXSPI (GICV3_MAXIRQ - GIC_INTERNAL)
 
+/* Number of SGI target-list bits */
+#define GICV3_TARGETLIST_BITS 16
+
 /* Minimum BPR for Secure, or when security not enabled */
 #define GIC_MIN_BPR 0
 /* Minimum BPR for Nonsecure when security is enabled */
-- 
2.7.4

