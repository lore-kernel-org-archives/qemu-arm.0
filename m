Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp871726wrt;
        Fri, 4 Jan 2019 10:11:25 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4Bgb+XBgHEIHEbnOeeshALdNKQC0rA9A9mVgr1GmSAsibcuQHvL4cfYoPzj2bwJFjUa3uh
X-Received: by 2002:ad4:5307:: with SMTP id y7mr52410014qvr.9.1546625485054;
        Fri, 04 Jan 2019 10:11:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546625485; cv=none;
        d=google.com; s=arc-20160816;
        b=f7NiQ02kfo3xoEU0QC+1CUtnSQos0qJV5Ys+E6Jbg9jS66ZjeCpozI+Ci9uShpCU2w
         GCcbiLo6p2qPVHkMy/CQAmSejivv0IsA5tgutvUFtHRATb5Xp3SOP9lOzMUg86qlFeiS
         aiKPXZnp9k3SGA2ZRjE5PowH5YXg5g2WPibhH9t0Nr6vunEqxpNWcZAO87cJ2EP4l8wl
         L+7CysPBQEHEsiHQw4WgrNYD7r8ZdWLkG9mNWKWqJKIhzt1daD5OqCyrs3SLsHliDi3v
         jIuoAGKkCm13qWaK4AlBwBaNwCMIDZ1mon25NXQYFUes3uFTmgRSuKH2m3mX76vudFY3
         ynrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Iw/QFtU9r3q4lZKREr5rowH9wRQflynd4+c6XZWx9Uw=;
        b=ih6egjEbIT2yOJVlv3kj4H5wFPKjhiUTPH14B6AwQlDM/+sZISW+Jmde9HCRqos0D5
         WKMPhXA7fYSNICnJQMJ7ITSWz1lnwBBbmENHfDCh8DMZyeI5GpzVyAaI5lG4c/oBQQ9G
         rGtJro1dPxJyFav3up3kSu5eD59JS7R8qIDuQ2yqiYcinyNz76g2KjciqSNACgzjjqZU
         vFyjq+nVKTQHDHMA+T1U2/0UaKjDZ+G7OdSuXY69HmwcpApBrBcuySzcRidECZuUTN0h
         YHguagCL91IQYmZBJ8QJlQxiylUItvRQmA2kNCxkr8dMrCOPRBu9lydeD6tmOGpsVo5z
         iS/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id g17si2976772qta.83.2019.01.04.10.11.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 10:11:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37827 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfTwK-00008O-7M
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 13:11:24 -0500
Received: from eggs.gnu.org ([208.118.235.92]:52705)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTn2-0005U3-5k
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 13:01:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTn1-0005bc-7A
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 13:01:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57298)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gfTmz-0005ZN-1J; Fri, 04 Jan 2019 13:01:45 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D83F81DEA;
	Fri,  4 Jan 2019 18:01:43 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-119.brq.redhat.com [10.40.204.119])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C388A5D6A6;
	Fri,  4 Jan 2019 18:01:33 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Date: Fri,  4 Jan 2019 18:58:43 +0100
Message-Id: <20190104175847.6290-13-philmd@redhat.com>
In-Reply-To: <20190104175847.6290-1-philmd@redhat.com>
References: <20190104175847.6290-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 04 Jan 2019 18:01:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 12/16] hw/devices: Move LAN9118 declarations
 into a new header
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tr4CuyNKl6e9

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/kzm.c             |  2 +-
 hw/arm/mps2.c            |  2 +-
 hw/arm/realview.c        |  1 +
 hw/arm/vexpress.c        |  2 +-
 hw/net/lan9118.c         |  2 +-
 include/hw/devices.h     |  3 ---
 include/hw/net/lan9118.h | 21 +++++++++++++++++++++
 7 files changed, 26 insertions(+), 7 deletions(-)
 create mode 100644 include/hw/net/lan9118.h

diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
index 864c7bd411..139934c4ec 100644
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
index e3d698ba6c..54b7395849 100644
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
index 242f5a87b6..e9983c8763 100644
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
index c02d18ee61..12e2c3986f 100644
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
index a6269d9463..a428b16eda 100644
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
index ba9034050b..ebc45c8799 100644
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
index 0000000000..340d6681b7
--- /dev/null
+++ b/include/hw/net/lan9118.h
@@ -0,0 +1,21 @@
+/*
+ * SMSC LAN9118 Ethernet interface emulation
+ *
+ * Copyright (c) 2009 CodeSourcery, LLC.
+ * Written by Paul Brook
+ *
+ * This code is licensed under the GNU GPL v2
+ *
+ * Contributions after 2012-01-13 are licensed under the terms of the
+ * GNU GPL, version 2 or (at your option) any later version.
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
2.17.2

