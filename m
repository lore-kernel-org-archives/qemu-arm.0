Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp863732wrt;
        Fri, 4 Jan 2019 10:03:57 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5XFNtgR/8V0UZzs6nEjBIvVrZfqiRXujxuLeswEQf8lxEtPMl/vm+C+yHBkl/PBx4fg/az
X-Received: by 2002:ac8:6c3:: with SMTP id j3mr49911051qth.84.1546625037626;
        Fri, 04 Jan 2019 10:03:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546625037; cv=none;
        d=google.com; s=arc-20160816;
        b=S8HbzoAUucgClLXl2rs4YAJWNqNSkB/ytNIucoqf7ZlBSVnuKzJ5e25ds66mZtGHs/
         iBwrt29sAkwtqTXwh3vLRfmmNwbVxqN54Vcj2gZkpV9qoVwbIAQfhzgAaHKGlG/RqWPH
         t4G38PxR0EGj6vEH3iOYR+yr49gCGm6XlrDxoxvGUFKyBhqHwmJ+4Mh0byDaE/KiVHOF
         fuKjIh8629Sinpt3w+oVGwolE/zJttlw50YxKzJEkbSQRPiQcvXXVbRcT7BakXSKNtN3
         oeQMybLwAGl2Ory63rS+W7z7Bk/QqeC+/27thx18TtCSlGpa+MSUZJuONw8fnPgCcz5a
         f4fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Rs8L2up2UQF5DDxezNYPaq3TZANoNy+ZIvQiKb5+NZw=;
        b=Aq9zqHFel50DcogC+U8Eez+7KLLQT+MjBi4sSJoE4BWY8cbjmk7T7ZHWmLZxiYqzTO
         2nbRdkBIYnX/l1ejC7ULbVHQ0TH/gvk0jQYejf0yybbtYwGDpwiXSNhmAe8fl5G72zbN
         EurTZFfdbokiWaPeUWdDh9kyJ8srz50SVobWBOzNMfULsgdwWEGbPfrGSLBZykAXpzzv
         7hW93jBsGE3V7vPSPIlgi3Wf1WyPoH8EOMyytJy+BJCtc+GFaQek5CmXJ3yAM0aR8qik
         MOstwsYuH2OPE6SSRwm4vQbfx/IIHWYGcvdqr5Qo741C4q/bFpmiV5Wtl/Z+Y/4ameJF
         Q+pg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id r1si311386qkk.116.2019.01.04.10.03.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 10:03:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37740 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfTp7-0007SG-40
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 13:03:57 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTlQ-0003Xa-KZ
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 13:00:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTlN-0004aw-Fk
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 13:00:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36394)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gfTlN-0004aV-8p; Fri, 04 Jan 2019 13:00:05 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DCF7058E46;
	Fri,  4 Jan 2019 18:00:03 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-119.brq.redhat.com [10.40.204.119])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8A265D6A9;
	Fri,  4 Jan 2019 17:59:54 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Date: Fri,  4 Jan 2019 18:58:36 +0100
Message-Id: <20190104175847.6290-6-philmd@redhat.com>
In-Reply-To: <20190104175847.6290-1-philmd@redhat.com>
References: <20190104175847.6290-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 04 Jan 2019 18:00:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 05/16] hw/devices: Move Blizzard declarations
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
X-TUID: 4Yv9XdYNgXG0

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS                   |  1 +
 hw/arm/nseries.c              |  1 +
 hw/display/blizzard.c         |  2 +-
 include/hw/devices.h          |  7 -------
 include/hw/display/blizzard.h | 21 +++++++++++++++++++++
 5 files changed, 24 insertions(+), 8 deletions(-)
 create mode 100644 include/hw/display/blizzard.h

diff --git a/MAINTAINERS b/MAINTAINERS
index dff4b98401..156ce9a698 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -640,6 +640,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/arm/nseries.c
+F: include/hw/display/blizzard.h
=20
 Palm
 M: Andrzej Zaborowski <balrogg@gmail.com>
diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 906b7ca22d..9521be1cef 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -31,6 +31,7 @@
 #include "hw/boards.h"
 #include "hw/i2c/i2c.h"
 #include "hw/devices.h"
+#include "hw/display/blizzard.h"
 #include "hw/block/flash.h"
 #include "hw/hw.h"
 #include "hw/bt.h"
diff --git a/hw/display/blizzard.c b/hw/display/blizzard.c
index 291abe6fca..471bd0ed99 100644
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
index 5ad134232c..25f895b330 100644
--- a/include/hw/devices.h
+++ b/include/hw/devices.h
@@ -28,13 +28,6 @@ void tsc2005_set_transform(void *opaque, MouseTransfor=
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
index 0000000000..8132557da1
--- /dev/null
+++ b/include/hw/display/blizzard.h
@@ -0,0 +1,21 @@
+/*
+ * Epson S1D13744/S1D13745 (Blizzard/Hailstorm/Tornado) LCD/TV controlle=
r.
+ *
+ * Copyright (C) 2008 Nokia Corporation
+ * Written by Andrzej Zaborowski <andrew@openedhand.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
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
2.17.2

