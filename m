Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp794688wrx;
        Fri, 12 Apr 2019 10:06:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyNqGhuqHzsKEd73+vPwSLWDLxIG/4p7LOhm+yvp0aj5LaKI+hF5dh10X3z7W06PhWh1Q19
X-Received: by 2002:a1c:c8:: with SMTP id 191mr11558167wma.44.1555088814724;
        Fri, 12 Apr 2019 10:06:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555088814; cv=none;
        d=google.com; s=arc-20160816;
        b=xwTyXnD2kj+JTfSsEsxWB8KzbZ453zg+ffOqJCZZwcSLkY9uElLISGuDFnZNkbolTP
         F+LZw+xQSYO82HSlKrgbHXh3wsAXNOJ7m4Un01RhZTCeSBzKsMzdxoI9oEaT74A8Ktah
         911f9e8iDTFFDoxhT4xoiGGlqXdxx/ovRfdEuJpv40CiqPPwoETNs56rNtcL6I8SNpjg
         kJ3TePg4KdyoZbZH3XJh21xpvW8G+4p1lE1/MWS3QBFZh14EOgz4G19dPqC6N9LjY/oe
         4GlW9dZ2DPVXL1Y0aOixIJ/ATYmyOB8jqNb5nOw/ftCYDmrIaf7ZlZq9/i7rWc0TUqWP
         auOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=iVJkhut4uhg3sHXgCCYmpbsIVPK6CqtRt34ODIyqfds=;
        b=E3DjBlUcDi8PHrWl1dSD3RZtxTgN/jlEBC5AxE3LKsneguI9IOZEaQz3t+X+FP8URq
         5gE20BeB6WNVf+PXA6RngkrPzqVxScic1+Ow5Ku8vaVDoGhcYoaUcY10JlOq24YY1FD5
         jixJ0OXkue8x+Mnow/JMnwMc39HpvkafC9fwKmmDvTO79iPMpFqxao9MKZjoSw5/1AgZ
         BooRgDm+7OQNCe22s2O1VzOjIW94kKuSmIj8DOGzGYzrS4sbL3afGQpMYN0XQvuy+WP/
         Po0nIqbBUvaevk5/RbKr6FNauZUp0t/tQtSkEQsxo7sSmnyLyWQbRryjCLkvf1ZfXzrn
         vTpg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p7si26899218wrj.26.2019.04.12.10.06.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 10:06:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40238 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEzdb-0003hY-FG
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 13:06:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEzSL-0001PW-4G
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 12:55:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEzSJ-00083j-U6
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 12:55:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40384)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hEzSJ-00081h-Jo; Fri, 12 Apr 2019 12:55:11 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C718F59463;
	Fri, 12 Apr 2019 16:55:10 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-66.brq.redhat.com [10.40.204.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C393C60BEC;
	Fri, 12 Apr 2019 16:55:03 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Date: Fri, 12 Apr 2019 18:54:16 +0200
Message-Id: <20190412165416.7977-13-philmd@redhat.com>
In-Reply-To: <20190412165416.7977-1-philmd@redhat.com>
References: <20190412165416.7977-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 12 Apr 2019 16:55:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 12/12] hw/devices: Move SMSC 91C111
 declaration into a new header
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
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
	Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m/yeKxU39lTo

This commit finally deletes "hw/devices.h".

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/gumstix.c           |  2 +-
 hw/arm/integratorcp.c      |  2 +-
 hw/arm/mainstone.c         |  2 +-
 hw/arm/realview.c          |  2 +-
 hw/arm/versatilepb.c       |  2 +-
 hw/net/smc91c111.c         |  2 +-
 include/hw/devices.h       | 11 -----------
 include/hw/net/smc91c111.h | 19 +++++++++++++++++++
 8 files changed, 25 insertions(+), 17 deletions(-)
 delete mode 100644 include/hw/devices.h
 create mode 100644 include/hw/net/smc91c111.h

diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index 79886ce3787..343cbfd7da8 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -40,7 +40,7 @@
 #include "hw/arm/pxa.h"
 #include "net/net.h"
 #include "hw/block/flash.h"
-#include "hw/devices.h"
+#include "hw/net/smc91c111.h"
 #include "hw/boards.h"
 #include "exec/address-spaces.h"
 #include "sysemu/qtest.h"
diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index 4eceebb9ea7..0b6f24465e4 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -12,10 +12,10 @@
 #include "qemu-common.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
-#include "hw/devices.h"
 #include "hw/boards.h"
 #include "hw/arm/arm.h"
 #include "hw/misc/arm_integrator_debug.h"
+#include "hw/net/smc91c111.h"
 #include "net/net.h"
 #include "exec/address-spaces.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index e96738ad267..c1cec590379 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -18,7 +18,7 @@
 #include "hw/arm/pxa.h"
 #include "hw/arm/arm.h"
 #include "net/net.h"
-#include "hw/devices.h"
+#include "hw/net/smc91c111.h"
 #include "hw/boards.h"
 #include "hw/block/flash.h"
 #include "hw/sysbus.h"
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index e9983c87639..05a244df255 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -14,8 +14,8 @@
 #include "hw/sysbus.h"
 #include "hw/arm/arm.h"
 #include "hw/arm/primecell.h"
-#include "hw/devices.h"
 #include "hw/net/lan9118.h"
+#include "hw/net/smc91c111.h"
 #include "hw/pci/pci.h"
 #include "net/net.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index d67181810a6..25166e15171 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -13,7 +13,7 @@
 #include "cpu.h"
 #include "hw/sysbus.h"
 #include "hw/arm/arm.h"
-#include "hw/devices.h"
+#include "hw/net/smc91c111.h"
 #include "net/net.h"
 #include "sysemu/sysemu.h"
 #include "hw/pci/pci.h"
diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index 99da2d92973..d19ea0750d3 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -10,7 +10,7 @@
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
 #include "net/net.h"
-#include "hw/devices.h"
+#include "hw/net/smc91c111.h"
 #include "qemu/log.h"
 /* For crc32 */
 #include <zlib.h>
diff --git a/include/hw/devices.h b/include/hw/devices.h
deleted file mode 100644
index ebc45c87997..00000000000
--- a/include/hw/devices.h
+++ /dev/null
@@ -1,11 +0,0 @@
-#ifndef QEMU_DEVICES_H
-#define QEMU_DEVICES_H
-
-/* Devices that have nowhere better to go.  */
-
-#include "hw/hw.h"
-
-/* smc91c111.c */
-void smc91c111_init(NICInfo *, uint32_t, qemu_irq);
-
-#endif
diff --git a/include/hw/net/smc91c111.h b/include/hw/net/smc91c111.h
new file mode 100644
index 00000000000..a66ba4112f8
--- /dev/null
+++ b/include/hw/net/smc91c111.h
@@ -0,0 +1,19 @@
+/*
+ * SMSC 91C111 Ethernet interface emulation
+ *
+ * Copyright (c) 2005 CodeSourcery, LLC.
+ * Written by Paul Brook
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_NET_SMC91C111_H
+#define HW_NET_SMC91C111_H
+
+#include "hw/irq.h"
+#include "net/net.h"
+
+void smc91c111_init(NICInfo *, uint32_t, qemu_irq);
+
+#endif
--=20
2.20.1

