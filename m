Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp787217wrx;
        Fri, 12 Apr 2019 10:00:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyke+8u7tIgU/WFzQJ30YJaQaKQFmvfDi0qOe9uYZiJvW1byUFEvzXN6ac7dwhEilEjwtrB
X-Received: by 2002:a7b:c4d5:: with SMTP id g21mr11521852wmk.133.1555088430070;
        Fri, 12 Apr 2019 10:00:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555088430; cv=none;
        d=google.com; s=arc-20160816;
        b=xGpOmsTVEE6EO3XslAkNfU2c35ELOJCCYGkHqLznZO5dIy2PVaHG4BrwSCD9V1dYSF
         Jr+smrmnQuogKlDdwEraEipupDXlZZwfdK85MTocuVt7qjNda9qpkAMbVE80x+B8rpad
         moJnHDwAUK/uR2ZK1E54UZyLMPwHAmIgdoA9DQf2uC6Kkm6DQGv3IEpco8qSWXmbGLpU
         uqpf4fjOLbdguNDSfM7pPy08N4+TsRlvSSn9m07MI+F+NQT46Q/p2eXvGoBC5r8kZeGf
         53C372+0KPAlZTKbxHsVcRKhWphYBrO99slBt02+fAMM1DPqmQSi6EW8NpR1mPAr1hct
         /gdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=LaX86iBVcNZH7XoiEeqH83gi1tPphHrNzYNQlvkW1Y8=;
        b=Ej4BLE6lcxukCTr8Gkjh7UQXsmqh6NKxHf9qgUO+4AHQaa0m/S7lm1adP6PHOVcN1D
         uJjkdfNFXwCbuCFmqmOFhcOyLZPcibE7ZNVqKHRQNnWQTgHAu83xfwv0j2aAp0f8/V++
         on9Xcx2wVEHyrYbVv3W4X7ASUPqcaOBeAPEU3HeaMBaZV1tMZSKV9TJnCcIwTte5SQoe
         8Ey2iPfS5CPE3F6IECCT+75Otu9csu+VcRygA59PDSjVMVCXCEEwq+0XSFfGrq6R0Ipn
         Dq0yejmxqS5Q2G9yGdMsJrZlaYVKfW7drxhRfTtHC8usXssCEMycpb6IoAJkXq8CzFjY
         7a8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g141si5406507wme.154.2019.04.12.10.00.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 10:00:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40149 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEzXR-0006Qk-3g
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 13:00:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEzS8-0001Fp-Ci
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 12:55:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEzS6-0007cX-D7
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 12:55:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44166)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hEzS2-0007Rb-KH; Fri, 12 Apr 2019 12:54:56 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1662BDA334;
	Fri, 12 Apr 2019 16:54:53 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-66.brq.redhat.com [10.40.204.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06D4460BEC;
	Fri, 12 Apr 2019 16:54:49 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Date: Fri, 12 Apr 2019 18:54:13 +0200
Message-Id: <20190412165416.7977-10-philmd@redhat.com>
In-Reply-To: <20190412165416.7977-1-philmd@redhat.com>
References: <20190412165416.7977-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 12 Apr 2019 16:54:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 09/12] hw/devices: Move LAN9118 declarations
 into a new header
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Peter Chubb <peter.chubb@nicta.com.au>,
	Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RC6IjQViGjBf

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/kzm.c             |  2 +-
 hw/arm/mps2.c            |  2 +-
 hw/arm/realview.c        |  1 +
 hw/arm/vexpress.c        |  2 +-
 hw/net/lan9118.c         |  2 +-
 include/hw/devices.h     |  3 ---
 include/hw/net/lan9118.h | 19 +++++++++++++++++++
 7 files changed, 24 insertions(+), 7 deletions(-)
 create mode 100644 include/hw/net/lan9118.h

diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
index 864c7bd4114..139934c4ecf 100644
--- a/hw/arm/kzm.c
+++ b/hw/arm/kzm.c
@@ -22,7 +22,7 @@
 #include "qemu/error-report.h"
 #include "exec/address-spaces.h"
 #include "net/net.h"
-#include "hw/devices.h"
+#include "hw/net/lan9118.h"
 #include "hw/char/serial.h"
 #include "sysemu/qtest.h"
=20
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index e3d698ba6c4..54b7395849f 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -36,7 +36,7 @@
 #include "hw/timer/cmsdk-apb-timer.h"
 #include "hw/timer/cmsdk-apb-dualtimer.h"
 #include "hw/misc/mps2-scc.h"
-#include "hw/devices.h"
+#include "hw/net/lan9118.h"
 #include "net/net.h"
=20
 typedef enum MPS2FPGAType {
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 242f5a87b6a..e9983c87639 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -15,6 +15,7 @@
 #include "hw/arm/arm.h"
 #include "hw/arm/primecell.h"
 #include "hw/devices.h"
+#include "hw/net/lan9118.h"
 #include "hw/pci/pci.h"
 #include "net/net.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index f07134c4245..d8634f3dd29 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -28,7 +28,7 @@
 #include "hw/sysbus.h"
 #include "hw/arm/arm.h"
 #include "hw/arm/primecell.h"
-#include "hw/devices.h"
+#include "hw/net/lan9118.h"
 #include "hw/i2c/i2c.h"
 #include "net/net.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index a6269d9463b..a428b16eda5 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -14,7 +14,7 @@
 #include "hw/sysbus.h"
 #include "net/net.h"
 #include "net/eth.h"
-#include "hw/devices.h"
+#include "hw/net/lan9118.h"
 #include "sysemu/sysemu.h"
 #include "hw/ptimer.h"
 #include "qemu/log.h"
diff --git a/include/hw/devices.h b/include/hw/devices.h
index ba9034050b4..ebc45c87997 100644
--- a/include/hw/devices.h
+++ b/include/hw/devices.h
@@ -8,7 +8,4 @@
 /* smc91c111.c */
 void smc91c111_init(NICInfo *, uint32_t, qemu_irq);
=20
-/* lan9118.c */
-void lan9118_init(NICInfo *, uint32_t, qemu_irq);
-
 #endif
diff --git a/include/hw/net/lan9118.h b/include/hw/net/lan9118.h
new file mode 100644
index 00000000000..d13d8cd3d22
--- /dev/null
+++ b/include/hw/net/lan9118.h
@@ -0,0 +1,19 @@
+/*
+ * SMSC LAN9118 Ethernet interface emulation
+ *
+ * Copyright (c) 2009 CodeSourcery, LLC.
+ * Written by Paul Brook
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_NET_LAN9118_H
+#define HW_NET_LAN9118_H
+
+#include "hw/irq.h"
+#include "net/net.h"
+
+void lan9118_init(NICInfo *, uint32_t, qemu_irq);
+
+#endif
--=20
2.20.1

