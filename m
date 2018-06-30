Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1611211wrq;
        Sat, 30 Jun 2018 02:20:46 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd8AMCytbwfnBhyWrxrzgpdIi6basUL+L7eLfXcw0gx3TDBbkm76EbzFP9B5NtVh4mn7Kfn
X-Received: by 2002:a37:c65c:: with SMTP id b89-v6mr15351765qkj.421.1530350446524;
        Sat, 30 Jun 2018 02:20:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530350446; cv=none;
        d=google.com; s=arc-20160816;
        b=WDEuOnhYAKQHVJVLPx4Cd7pYjNXLHj8l+Suk7q3VTy2YP87bcs3OY3KMCAiVO/BrNB
         c2Oy37P745iKhOzp2Yu9T2mtQRKF35B0sGmDqRRBL3vK8C9TzETO5nBpccNTqLu1AaFb
         KngaRpbzqLFY4fSQU/9cwM+SJrfP4qxGlhKauR0X6VRTiFGL+FjuwJ7YWiAdBNWhwUGE
         Izo0VFIvRsqMSPvgFWhpYWnWsR5hFdySKvGU2XRR2vBm2NIvOne2OODOuuqEP7DIhdQJ
         DTzfF9/9t2dSYRxA7kms2/4QkJx4NQ9bQVj/Bx0IQk4UFPK7dQQ8MTTOTHPngy8Z4UdO
         5Vrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=/lR/KwmyYOi8ZBqULJrnDXmVueolS+ODAmP40Gig7x0=;
        b=et9Lq6SXwysXpdxMQhhIDVYx1w2Kmt/sMCHhNmIXHE64N2a9ll9QV5+MaWnaqCZ2vn
         EKcHHErGmZdFiXJrWg/JSL9KTZa0J+YFlNkWP7WNf/CiM4i6xJUX1lLk+A72IBKUKz3a
         zYDe4lr7kIwBOPQIo5vtNynwUq7Y3P2eDP+oEcGfluWPXKe44OmsvILadVsLQc44Y0YM
         VfrskgiwpSV9CzfPlGWKa9147aD+Awd9pGA4PI3KyQveEF8KtxtoiyyPk4ayIYq53CD9
         WKlJR50rV4QkcsmsOnlR+WMu3REgmsBbo02m9pWRImHb5VVl25ViM7RByDKXKjBIDTVS
         Nlwg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 31-v6si3682228qtw.104.2018.06.30.02.20.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 30 Jun 2018 02:20:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46205 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fZC3i-0008Cx-0g
	for alex.bennee@linaro.org; Sat, 30 Jun 2018 05:20:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fZC3U-0008Bh-Ue
	for qemu-arm@nongnu.org; Sat, 30 Jun 2018 05:20:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fZC3T-0001lU-Md
	for qemu-arm@nongnu.org; Sat, 30 Jun 2018 05:20:32 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37642 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fZC3T-0001k3-2j; Sat, 30 Jun 2018 05:20:31 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A70D67264E;
	Sat, 30 Jun 2018 09:20:30 +0000 (UTC)
Received: from localhost (unknown [10.33.36.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D1D47C3F;
	Sat, 30 Jun 2018 09:20:28 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 30 Jun 2018 10:13:42 +0100
Message-Id: <20180630091343.14391-3-stefanha@redhat.com>
In-Reply-To: <20180630091343.14391-1-stefanha@redhat.com>
References: <20180630091343.14391-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Sat, 30 Jun 2018 09:20:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Sat, 30 Jun 2018 09:20:30 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 2/3] hw/arm: add ARMv6M object
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, ilg@livius.net,
	Alistair Francis <alistair@alistair23.me>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
	joel@jms.id.au, Stefan Hajnoczi <stefanha@redhat.com>, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6plq4pPDbolF

The ARMv6M object will be used by machine types that need ARMv6-M CPUs.

There is no logic beyond what the ARMMProfile base class already
provides because ARMv6-M is a pretty small microcontroller without many
bells and whistles.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/arm/Makefile.objs            |  1 +
 include/hw/arm/armv6m.h         | 24 ++++++++++++++++++++++++
 hw/arm/armv6m.c                 | 23 +++++++++++++++++++++++
 default-configs/arm-softmmu.mak |  1 +
 4 files changed, 49 insertions(+)
 create mode 100644 include/hw/arm/armv6m.h
 create mode 100644 hw/arm/armv6m.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 2c43d34c64..e693d86cd3 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -17,6 +17,7 @@ obj-$(CONFIG_VERSATILE) += vexpress.o versatilepb.o
 obj-$(CONFIG_ZYNQ) += xilinx_zynq.o
 
 obj-$(CONFIG_ARM_M_PROFILE) += arm-m-profile.o
+obj-$(CONFIG_ARM_V6M) += armv6m.o
 obj-$(CONFIG_ARM_V7M) += armv7m.o
 obj-$(CONFIG_EXYNOS4) += exynos4210.o
 obj-$(CONFIG_PXA2XX) += pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
diff --git a/include/hw/arm/armv6m.h b/include/hw/arm/armv6m.h
new file mode 100644
index 0000000000..5f80120266
--- /dev/null
+++ b/include/hw/arm/armv6m.h
@@ -0,0 +1,24 @@
+/*
+ * ARMv6M CPU object
+ *
+ * Copyright (C) 2018 Red Hat, Inc.
+ *
+ * This code is licensed under the GPL version 2 or later.
+ */
+
+#ifndef HW_ARM_ARMV6M_H
+#define HW_ARM_ARMV6M_H
+
+#include "hw/arm/arm-m-profile.h"
+
+#define TYPE_ARMV6M "armv6m"
+#define ARMV6M(obj) OBJECT_CHECK(ARMv6MState, (obj), TYPE_ARMV6M)
+
+/* ARMv6M container object.
+ */
+typedef struct ARMv6MState {
+    /*< private >*/
+    ARMMProfileState parent_obj;
+} ARMv6MState;
+
+#endif
diff --git a/hw/arm/armv6m.c b/hw/arm/armv6m.c
new file mode 100644
index 0000000000..89c4727a87
--- /dev/null
+++ b/hw/arm/armv6m.c
@@ -0,0 +1,23 @@
+/*
+ * ARMv6M CPU object
+ *
+ * Copyright (C) 2018 Red Hat, Inc.
+ *
+ * This code is licensed under the GPL version 2 or later.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/arm/armv6m.h"
+
+static const TypeInfo armv6m_info = {
+    .name = TYPE_ARMV6M,
+    .parent = TYPE_ARM_M_PROFILE,
+    .instance_size = sizeof(ARMv6MState),
+};
+
+static void armv6m_register_types(void)
+{
+    type_register_static(&armv6m_info);
+}
+
+type_init(armv6m_register_types)
diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index e704cb6e34..a381817126 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -49,6 +49,7 @@ CONFIG_A9MPCORE=y
 CONFIG_A15MPCORE=y
 
 CONFIG_ARM_M_PROFILE=y
+CONFIG_ARM_V6M=y
 CONFIG_ARM_V7M=y
 CONFIG_NETDUINO2=y
 
-- 
2.17.1

