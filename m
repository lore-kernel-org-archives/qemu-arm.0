Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp874198wrt;
        Fri, 4 Jan 2019 10:13:56 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6pfXEh032UpZyFTQKQmkm828HJpiRpy1JKo6XTAQIk0plAObEC728fAxqtIHEqp+fqWYCn
X-Received: by 2002:a37:d6ce:: with SMTP id p75mr47969101qkl.270.1546625636399;
        Fri, 04 Jan 2019 10:13:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546625636; cv=none;
        d=google.com; s=arc-20160816;
        b=xfEjs7uR9YEy8Q9w/2x8cv5MVy7auh/HUWtKRw+ggnu58RnLgHI/BoE8qwIboNcVTS
         AyGwoyUbVd84qNBKrvGe7k36bYM+HNNcoAUbGuG8YdWLG8GK5NU16rC6B4zr+hVvqrZm
         dxQDZfLXbM81JwgjoX68sLTvB0NmtJoQHwAC5w0uMGbITHaKioVgzBUmN1T9Pcet+wTa
         vhWy9I6vSY8tVUEGGCeY37v4g9lKOb6f0geusyLoybgG1h9iHC1I2s+yiskaVLig+TOo
         EN4l6N7xiHM+2WoKtBPooFzDzBX9pLIfsqmJgp4pJEgrW1lW512bOYTWK+w84ACRyZd3
         OiaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Fw9oCDQkbq3kpPmxRhcbCb/IznJtKhkgHFVHBDB/CJc=;
        b=x+6vO+pl9/toSLwe9fPcBdDDovjJ3QjSlLvIUC4RYjQNWcOIGOVKVSCVztEOwRNWsS
         iWlLSS/V8waKjcOXJgNSMCALmZIgRV1dxZoK/D9Ij00oOFsFNOd4yd0wEikuEjTpUopV
         xCf5vbrQ4dOfQqtkq1uS9td1Sk1Wkk2bByq73fJzUKUEkXiyMfecFmJCEe9jq8tX3bii
         uO/cmSQg/6pdpGhxtJ3FmTWOK9wezPlGCVAc6yHnu7/7FV0c7l0TCMtU/414H4AuYNHa
         0ShfHO8Siq2Y54GSSHqsXK7qQw1eByySgJWwJMPOUiMvv1PhtXLAdBiNJyY0s8HstSFb
         LbWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from listsout.gnu.org (listsout.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o6si257383qtp.370.2019.01.04.10.13.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 10:13:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37869 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfTyl-0003WK-R3
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 13:13:55 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTnq-0006Kx-P3
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 13:02:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTnp-00068Y-OO
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 13:02:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54422)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gfTnp-00067f-Fp; Fri, 04 Jan 2019 13:02:37 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4AEEEC079C40;
	Fri,  4 Jan 2019 18:02:35 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-119.brq.redhat.com [10.40.204.119])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 339FE5D78C;
	Fri,  4 Jan 2019 18:02:10 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Date: Fri,  4 Jan 2019 18:58:46 +0100
Message-Id: <20190104175847.6290-16-philmd@redhat.com>
In-Reply-To: <20190104175847.6290-1-philmd@redhat.com>
References: <20190104175847.6290-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 04 Jan 2019 18:02:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 15/16] hw/devices: Move SMSC 91C111 declaration
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Joel Stanley <joel@jms.id.au>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h0NheDpTduig

This commit finally deletes "hw/devices.h".

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/gumstix.c           |  2 +-
 hw/arm/integratorcp.c      |  2 +-
 hw/arm/mainstone.c         |  2 +-
 hw/arm/realview.c          |  2 +-
 hw/arm/versatilepb.c       |  2 +-
 hw/net/smc91c111.c         |  2 +-
 include/hw/devices.h       | 11 -----------
 include/hw/net/smc91c111.h | 18 ++++++++++++++++++
 8 files changed, 24 insertions(+), 17 deletions(-)
 delete mode 100644 include/hw/devices.h
 create mode 100644 include/hw/net/smc91c111.h

diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index 56cb763c4e..98c3e6d41c 100644
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
index 4eceebb9ea..0b6f24465e 100644
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
index 0beb5c426b..fbe8d5cbd4 100644
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
index e9983c8763..05a244df25 100644
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
index 22b09a1e61..70b5fda737 100644
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
index 99da2d9297..d19ea0750d 100644
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
index ebc45c8799..0000000000
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
index 0000000000..46f7d9a5d4
--- /dev/null
+++ b/include/hw/net/smc91c111.h
@@ -0,0 +1,18 @@
+/*
+ * SMSC 91C111 Ethernet interface emulation
+ *
+ * Copyright (c) 2005 CodeSourcery, LLC.
+ * Written by Paul Brook
+ *
+ * This code is licensed under the GPL
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
2.17.2

