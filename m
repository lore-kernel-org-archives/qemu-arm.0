Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp784938wrx;
        Fri, 12 Apr 2019 09:58:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxx/zeUHv37Ej9TV0h4+4s299K23Cm82dTZ/0GXCb8ejnbkgvAFhCjfsnFtqPuxEl9y2cjx
X-Received: by 2002:adf:f30b:: with SMTP id i11mr22141405wro.297.1555088285395;
        Fri, 12 Apr 2019 09:58:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555088285; cv=none;
        d=google.com; s=arc-20160816;
        b=hXhelI96lnbo2aX2BOVw2z7ZHZpRZKukYc61603Uy/C58nmUHrZ6mnyhiNfHJqmBA+
         R+9uPAiye3AqqqvQ7EHWigY8dsFTk/WaMCVRsXSdUfOq5XTxt/5mRqsRZWgrD/ujQCpQ
         NW16q4SVpaUlqbRXzuzWrC44vKjrWspL5jJkCG2rslY8iGhT72B9FAbqCRyg62DoIPBs
         QNu/oouhP/6Olrx9Q1N9pq8cAq6iH2lWgG6AW0PkzXnf0KHNWKFmrkTNOi95G+CZnJOy
         d5BoubfeNZ/ySdpgcWErWn1onIhX4FXJN0TE8b77OFcAmGGKWGNo8C7jP0JalG+X0U0p
         QOOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=W6vFTG+Gt4trbhQMdFLvuGN+M7x4jWe3k2CSJkKICC8=;
        b=xhPwJE5JAn2hizy+WFepzRhSGOCvzeVmgyQ4mknnnktrL5y8Z6SxFFRMs7+OyMRVZK
         DDjppj+NhlE3tqxYwkQq0zUq9y8qsvuF1Jf+K5PWKr/Duw2PxU91xZGFQiTA6FKA5jqp
         QKW9muGMEx8TpFa/1xyUKbRBgMQBfTUAhUAR1Du3jURPKUUHpp1su+ii3eedZ34Pnqua
         JPH4iGx0FFiFq7JcZ0NscCH3X5+90HY6nJcUZON7DJk+16LVQ7P8x1PAoN9aSabVazFI
         9NNyiJsHGR/sjsR2/5QXGqd/p7M7RKkk61FZMDpyAhr/0iWfPoE00oAnvy8aaksR4aVz
         MS2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11si27505591wrp.341.2019.04.12.09.58.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 09:58:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40087 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEzV6-0004Fy-Dl
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 12:58:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEzS0-00017f-6P
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 12:54:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEzRy-0007Lt-SQ
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 12:54:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53398)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hEzRw-0007Cf-DS; Fri, 12 Apr 2019 12:54:50 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8B311C04FF86;
	Fri, 12 Apr 2019 16:54:46 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-66.brq.redhat.com [10.40.204.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B02D60BEC;
	Fri, 12 Apr 2019 16:54:43 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Date: Fri, 12 Apr 2019 18:54:11 +0200
Message-Id: <20190412165416.7977-8-philmd@redhat.com>
In-Reply-To: <20190412165416.7977-1-philmd@redhat.com>
References: <20190412165416.7977-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 12 Apr 2019 16:54:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 07/12] hw/devices: Move Gamepad declarations
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
	qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
	Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IY5td3Q8wlou

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v3:
 Drop "Gamepad devices that have nowhere better to go" comment (Markus)
---
 MAINTAINERS                |  1 +
 hw/arm/stellaris.c         |  2 +-
 hw/input/stellaris_input.c |  2 +-
 include/hw/devices.h       |  3 ---
 include/hw/input/gamepad.h | 19 +++++++++++++++++++
 5 files changed, 22 insertions(+), 5 deletions(-)
 create mode 100644 include/hw/input/gamepad.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 041c939952f..e7c3d282a0a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -744,6 +744,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/*/stellaris*
+F: include/hw/input/gamepad.h
=20
 Versatile Express
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 05f86749f40..5059aedbaa2 100644
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
 #include "hw/watchdog/cmsdk-apb-watchdog.h"
 #include "hw/misc/unimp.h"
 #include "cpu.h"
diff --git a/hw/input/stellaris_input.c b/hw/input/stellaris_input.c
index 99168bfeef1..20c87d86f40 100644
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
index e400f9eac09..7a630da47f7 100644
--- a/include/hw/devices.h
+++ b/include/hw/devices.h
@@ -26,7 +26,4 @@ void *tsc2005_init(qemu_irq pintdav);
 uint32_t tsc2005_txrx(void *opaque, uint32_t value, int len);
 void tsc2005_set_transform(void *opaque, MouseTransformInfo *info);
=20
-/* stellaris_input.c */
-void stellaris_gamepad_init(int n, qemu_irq *irq, const int *keycode);
-
 #endif
diff --git a/include/hw/input/gamepad.h b/include/hw/input/gamepad.h
new file mode 100644
index 00000000000..e20211baef8
--- /dev/null
+++ b/include/hw/input/gamepad.h
@@ -0,0 +1,19 @@
+/*
+ * Gamepad style buttons connected to IRQ/GPIO lines
+ *
+ * Copyright (c) 2007 CodeSourcery.
+ * Written by Paul Brook
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_INPUT_GAMEPAD_H
+#define HW_INPUT_GAMEPAD_H
+
+#include "hw/irq.h"
+
+/* stellaris_input.c */
+void stellaris_gamepad_init(int n, qemu_irq *irq, const int *keycode);
+
+#endif
--=20
2.20.1

