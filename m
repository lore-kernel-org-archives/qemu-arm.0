Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp865669wrt;
        Fri, 4 Jan 2019 10:05:50 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6ujaKYyqrQ2B+bw5q9xnI4f+b1IBxHZl0LiOQNMEXZB7JNxlo6vJlHcfHiox/dDdxTD048
X-Received: by 2002:a37:6e43:: with SMTP id j64mr45719490qkc.278.1546625150606;
        Fri, 04 Jan 2019 10:05:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546625150; cv=none;
        d=google.com; s=arc-20160816;
        b=RibaZHAK3o63tUbyYTX7AjnF5aOVdQtcl402M2OmHxz54lRbBxAeQKkM9PNOwb1pmI
         8mOU18YpcX4kI2BxF588kZewjoxw3HE4Jr8DQQKLaAxuZR/DDZ/wFLWX7Ho0QLzpNCn+
         DQyKX/hQO/yNVjXglB+ZZRNOYQKzaYOBoaZ8Ee91VI5MvOlqnRhgUyE9KzH3E0NUbmAM
         iyrKOuXDRqJ0kz+v5P08E7bf3gt6+X1v3Ui+ZMMbIjOu53JSgCKFKCqSkLSTPt4alDnC
         ZyDL7uVPG4m74+TOlKbmkm5Uq3Bg9DZdMZ7cxjZWKiby4kxZhkw3tn51TUEeR3c8oBCg
         nRcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=dhAxLAMm16VpkJD8roh38a44u3PIVV+SYxKmGMNtdr4=;
        b=e8YFrifkGeWSqnHT3QC7vXBP2GwOI2+p1ly+lXDPEjIgk+MMVXDsM3Aw2OemVgz/OE
         SEiEaMRRVIUJUDC7nLhJMfSKvan/mxkPXpzV7rxIp/oky+B8PwGUORadzRop+GipexQp
         KbHf5nF6ue9Da1RPOMJUjHDUXXsA1wCBiPsOSbgEoSKGpi9fvezhd69siUscFRxWyBu4
         iHZ5ZJ7VPUi5tAYtqb1wRSaBLZqHE4kaq6ujFGNzbMB7u52OSP734P9egYw0wac4+VCT
         yLVqt8of/VOytwz0rC1sSKUxRV+ZxRs62R0jrwZR+deoFORFe4JiOoHHWmNpmjs0k1RI
         lsLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id h13si7182638qtn.354.2019.01.04.10.05.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 10:05:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37747 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfTqw-000069-2W
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 13:05:50 -0500
Received: from eggs.gnu.org ([208.118.235.92]:52243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTmK-0004eY-7C
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 13:01:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTmG-00054t-7D
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 13:01:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37434)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gfTm7-0004ym-1z; Fri, 04 Jan 2019 13:00:52 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 486BA89AC6;
	Fri,  4 Jan 2019 18:00:49 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-119.brq.redhat.com [10.40.204.119])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0D095D6AA;
	Fri,  4 Jan 2019 18:00:39 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Date: Fri,  4 Jan 2019 18:58:38 +0100
Message-Id: <20190104175847.6290-8-philmd@redhat.com>
In-Reply-To: <20190104175847.6290-1-philmd@redhat.com>
References: <20190104175847.6290-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 04 Jan 2019 18:00:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 07/16] hw/devices: Move Gamepad declarations
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
X-TUID: Yv+ujOYIlRsr

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS                |  1 +
 hw/arm/stellaris.c         |  2 +-
 hw/input/stellaris_input.c |  2 +-
 include/hw/devices.h       |  3 ---
 include/hw/input/gamepad.h | 11 +++++++++++
 5 files changed, 14 insertions(+), 5 deletions(-)
 create mode 100644 include/hw/input/gamepad.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 63ed6636ef..f571b29077 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -714,6 +714,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/*/stellaris*
+F: include/hw/input/gamepad.h
=20
 Versatile Express
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 6c69ce79b2..0b4b382cdc 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -12,7 +12,6 @@
 #include "hw/sysbus.h"
 #include "hw/ssi/ssi.h"
 #include "hw/arm/arm.h"
-#include "hw/devices.h"
 #include "qemu/timer.h"
 #include "hw/i2c/i2c.h"
 #include "net/net.h"
@@ -22,6 +21,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/arm/armv7m.h"
 #include "hw/char/pl011.h"
+#include "hw/input/gamepad.h"
 #include "hw/misc/unimp.h"
 #include "cpu.h"
=20
diff --git a/hw/input/stellaris_input.c b/hw/input/stellaris_input.c
index 99168bfeef..20c87d86f4 100644
--- a/hw/input/stellaris_input.c
+++ b/hw/input/stellaris_input.c
@@ -8,7 +8,7 @@
  */
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "hw/devices.h"
+#include "hw/input/gamepad.h"
 #include "ui/console.h"
=20
 typedef struct {
diff --git a/include/hw/devices.h b/include/hw/devices.h
index 8b649541b1..d9c06de7ab 100644
--- a/include/hw/devices.h
+++ b/include/hw/devices.h
@@ -25,7 +25,4 @@ void *tsc2005_init(qemu_irq pintdav);
 uint32_t tsc2005_txrx(void *opaque, uint32_t value, int len);
 void tsc2005_set_transform(void *opaque, MouseTransformInfo *info);
=20
-/* stellaris_input.c */
-void stellaris_gamepad_init(int n, qemu_irq *irq, const int *keycode);
-
 #endif
diff --git a/include/hw/input/gamepad.h b/include/hw/input/gamepad.h
new file mode 100644
index 0000000000..5cd33a55bd
--- /dev/null
+++ b/include/hw/input/gamepad.h
@@ -0,0 +1,11 @@
+#ifndef HW_INPUT_GAMEPAD_H
+#define HW_INPUT_GAMEPAD_H
+
+/* Gamepad devices that have nowhere better to go.  */
+
+#include "hw/irq.h"
+
+/* stellaris_input.c */
+void stellaris_gamepad_init(int n, qemu_irq *irq, const int *keycode);
+
+#endif
--=20
2.17.2

