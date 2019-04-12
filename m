Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp784762wrx;
        Fri, 12 Apr 2019 09:57:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxTGurAhlxFToyZC3sEJuropVh771LP6fdZsOblSUl63F5LFPyg+jXTxg9XZ6/NRWGjBo1h
X-Received: by 2002:adf:fc0b:: with SMTP id i11mr48623wrr.145.1555088268714;
        Fri, 12 Apr 2019 09:57:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555088268; cv=none;
        d=google.com; s=arc-20160816;
        b=KDMzbH5FR01iGxA1ySDitL1moH8oTfP3w/O41UQaocG+a5wGmefyBkImqFazes0LWk
         +iNjjqGTNNMybUnIBWqjur2YZ4v6TPoR2MKRNcVFqyGcj0+nq1a4WkTw2f2g2A3ds/c0
         8BIifNJKgRMeQaT8VF/QlcozShqb0URM+LoWqKYeiGROrlQseyq7J5tPmDFjKUIO/oxA
         hOyNLEFuF+eo/+c/qjMcKso7CsFRJbO+uFH2wPhP5mSEIO3rLpKjMiQUyI10z164mYiM
         4xqOoxvVkmWyDSQmjfVAA7H/JqUZUXmH+1A7kvrqzJdAZqqujK6+jfR2bghoa5R9LwqE
         k7Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Xfqz97vnHhYSGMpQhH+piG0gNtjBQYewS5HyNaylhMs=;
        b=Yop3zshqvWuQgTwfvq0U52st44o7E5217jUQ5aeF7yjuy+W+l0Jv69h9pN3+eRblOT
         aPN/BEtjX862M7DU25+u14+KkEhI/XECGipbCHx99Kznkzz3F9ku/XDLX3/q2khMsLfw
         X+OQV1Xy1wLPo5UwX4iITD1RRwZmkF5sckmbfxjMGnEaISU7YnL0CRtbeI801zAWDX0O
         qN9Ho9oGWabwWRbBW9/caPkqW7Gtbe4bTfjH7B507cJBbH56ja/1F7heBIbJocAZtHJp
         Z6IUmi9lqKO1tF52FkeiMMfu74+/8xprKSJaslhoB6Q1UsVnKBGt2+r47V61TkeFHTA7
         vKHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n15si5627372wmk.180.2019.04.12.09.57.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 09:57:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40081 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEzUp-0003xa-MG
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 12:57:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEzRs-0000yR-L9
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 12:54:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEzRq-00071l-Vp
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 12:54:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45640)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hEzRo-0006qL-Oc; Fri, 12 Apr 2019 12:54:42 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 953A13169BAB;
	Fri, 12 Apr 2019 16:54:38 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-66.brq.redhat.com [10.40.204.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32D0360BEC;
	Fri, 12 Apr 2019 16:54:35 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Date: Fri, 12 Apr 2019 18:54:09 +0200
Message-Id: <20190412165416.7977-6-philmd@redhat.com>
In-Reply-To: <20190412165416.7977-1-philmd@redhat.com>
References: <20190412165416.7977-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Fri, 12 Apr 2019 16:54:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 05/12] hw/devices: Move Blizzard declarations
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
X-TUID: m39Jw64QT0Cv

Add an entries the Blizzard device in MAINTAINERS.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS                   |  2 ++
 hw/arm/nseries.c              |  1 +
 hw/display/blizzard.c         |  2 +-
 include/hw/devices.h          |  7 -------
 include/hw/display/blizzard.h | 22 ++++++++++++++++++++++
 5 files changed, 26 insertions(+), 8 deletions(-)
 create mode 100644 include/hw/display/blizzard.h

diff --git a/MAINTAINERS b/MAINTAINERS
index ccf8097f413..e1e30b071ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -663,10 +663,12 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/arm/nseries.c
+F: hw/display/blizzard.c
 F: hw/input/lm832x.c
 F: hw/input/tsc2005.c
 F: hw/misc/cbus.c
 F: hw/timer/twl92230.c
+F: include/hw/display/blizzard.h
=20
 Palm
 M: Andrzej Zaborowski <balrogg@gmail.com>
diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 2b710c3d49f..ef09b3bf79f 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -31,6 +31,7 @@
 #include "hw/boards.h"
 #include "hw/i2c/i2c.h"
 #include "hw/devices.h"
+#include "hw/display/blizzard.h"
 #include "hw/misc/tmp105.h"
 #include "hw/block/flash.h"
 #include "hw/hw.h"
diff --git a/hw/display/blizzard.c b/hw/display/blizzard.c
index 291abe6fcae..471bd0ed997 100644
--- a/hw/display/blizzard.c
+++ b/hw/display/blizzard.c
@@ -21,7 +21,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "ui/console.h"
-#include "hw/devices.h"
+#include "hw/display/blizzard.h"
 #include "ui/pixel_ops.h"
=20
 typedef void (*blizzard_fn_t)(uint8_t *, const uint8_t *, unsigned int);
diff --git a/include/hw/devices.h b/include/hw/devices.h
index 1e2141caad1..77d66113021 100644
--- a/include/hw/devices.h
+++ b/include/hw/devices.h
@@ -29,13 +29,6 @@ void tsc2005_set_transform(void *opaque, MouseTransfor=
mInfo *info);
 /* stellaris_input.c */
 void stellaris_gamepad_init(int n, qemu_irq *irq, const int *keycode);
=20
-/* blizzard.c */
-void *s1d13745_init(qemu_irq gpio_int);
-void s1d13745_write(void *opaque, int dc, uint16_t value);
-void s1d13745_write_block(void *opaque, int dc,
-                void *buf, size_t len, int pitch);
-uint16_t s1d13745_read(void *opaque, int dc);
-
 /* cbus.c */
 typedef struct {
     qemu_irq clk;
diff --git a/include/hw/display/blizzard.h b/include/hw/display/blizzard.=
h
new file mode 100644
index 00000000000..ef72bbc1865
--- /dev/null
+++ b/include/hw/display/blizzard.h
@@ -0,0 +1,22 @@
+/*
+ * Epson S1D13744/S1D13745 (Blizzard/Hailstorm/Tornado) LCD/TV controlle=
r.
+ *
+ * Copyright (C) 2008 Nokia Corporation
+ * Written by Andrzej Zaborowski
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_DISPLAY_BLIZZARD_H
+#define HW_DISPLAY_BLIZZARD_H
+
+#include "hw/irq.h"
+
+void *s1d13745_init(qemu_irq gpio_int);
+void s1d13745_write(void *opaque, int dc, uint16_t value);
+void s1d13745_write_block(void *opaque, int dc,
+                          void *buf, size_t len, int pitch);
+uint16_t s1d13745_read(void *opaque, int dc);
+
+#endif
--=20
2.20.1

