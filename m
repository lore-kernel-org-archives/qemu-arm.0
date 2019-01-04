Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp863872wrt;
        Fri, 4 Jan 2019 10:04:05 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7ZheF9BRG19FS5TkNwPLpw0bne/AiS8JIMTEE/6q4lVVJUaTmMyc7ht3Xpxa07DeGNWr/t
X-Received: by 2002:ad4:420a:: with SMTP id k10mr50336293qvp.206.1546625045626;
        Fri, 04 Jan 2019 10:04:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546625045; cv=none;
        d=google.com; s=arc-20160816;
        b=lza6sGLoSR2yOie0nEsFI0u689Z2MwQPjfIXUwDdrEwCrW7ksI6zvkFrEbNcZ4LPgF
         DUui4vp0ny9GKISlZ141OWK60Q2KxK3Gh3O+piC/oKcXPeOAraO+ZuZgokWahPk/Kqo8
         gXbBUcykrKzTfYN1+9XioKdeJjeqxekiFa7d6oNqKpzn+Lmk5R2palWareW5j2QbjxfT
         xcWkQbmo3UCIVQhIgJGOHhAQHSAnu9MXeSyhSRUjmstiedJ1weaMq73pS8+dehfG6w0z
         SsLbLcvWP4zgGA5S4Guo1Zz7o+ZARJvytimWYQkch20FtTb5wXgeYdWYYxeQOBWJI9/J
         1hKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=vryffZF4M9HNlLma+MwPoVcep8XveK99ztno2h/SPYw=;
        b=oUyrMnYo7ciVVSH0/4CcH8REuBytM0pX3HzUmhNAL9acMGY775i7wW/H3h1G+0c2uH
         OHg77Jh6LX2NVbeF9jZQqZmkGDY6n+RIpO4tVdM2jEzVHmrAdk2yQ8EM0JcJY0k4WhqM
         sLvNnrKmFoBXfDrKnKU7O5KNirllD5QHrSK9qQyqQov0ke8f1G04B064OALAWjI8Xlz2
         x8rQyCNpXsoizfNYjEYfDYDcUD/sE7jIRzYU8QKnKHlwvkRaa+EagX1LQqviLB96B8Bu
         zjGv8fskKxykqiLYJZSp3NFV996g5R5H/l/BrLmNttTurgCvl/llw7Wmn/ih86vbUrg7
         HLug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from listsout.gnu.org (listsout.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 33si831636qtf.324.2019.01.04.10.04.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 10:04:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37736 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfTpF-0007IA-2i
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 13:04:05 -0500
Received: from eggs.gnu.org ([208.118.235.92]:52151)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTm4-0004Of-Gd
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 13:00:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTm2-0004xb-Vv
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 13:00:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56302)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gfTlx-0004uT-BL; Fri, 04 Jan 2019 13:00:42 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1B4167F6C7;
	Fri,  4 Jan 2019 18:00:39 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-119.brq.redhat.com [10.40.204.119])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 591FA5D76A;
	Fri,  4 Jan 2019 18:00:04 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Date: Fri,  4 Jan 2019 18:58:37 +0100
Message-Id: <20190104175847.6290-7-philmd@redhat.com>
In-Reply-To: <20190104175847.6290-1-philmd@redhat.com>
References: <20190104175847.6290-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 04 Jan 2019 18:00:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 06/16] hw/devices: Move CBus declarations into
 a new header
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
X-TUID: kU2YoEMWptNY

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS            |  1 +
 hw/arm/nseries.c       |  1 +
 hw/misc/cbus.c         |  2 +-
 include/hw/devices.h   | 14 --------------
 include/hw/misc/cbus.h | 31 +++++++++++++++++++++++++++++++
 5 files changed, 34 insertions(+), 15 deletions(-)
 create mode 100644 include/hw/misc/cbus.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 156ce9a698..63ed6636ef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -641,6 +641,7 @@ L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/arm/nseries.c
 F: include/hw/display/blizzard.h
+F: include/hw/misc/cbus.h
=20
 Palm
 M: Andrzej Zaborowski <balrogg@gmail.com>
diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 9521be1cef..ac876b5878 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -32,6 +32,7 @@
 #include "hw/i2c/i2c.h"
 #include "hw/devices.h"
 #include "hw/display/blizzard.h"
+#include "hw/misc/cbus.h"
 #include "hw/block/flash.h"
 #include "hw/hw.h"
 #include "hw/bt.h"
diff --git a/hw/misc/cbus.c b/hw/misc/cbus.c
index 25e337ea77..16ee704bca 100644
--- a/hw/misc/cbus.c
+++ b/hw/misc/cbus.c
@@ -23,7 +23,7 @@
 #include "qemu/osdep.h"
 #include "hw/hw.h"
 #include "hw/irq.h"
-#include "hw/devices.h"
+#include "hw/misc/cbus.h"
 #include "sysemu/sysemu.h"
=20
 //#define DEBUG
diff --git a/include/hw/devices.h b/include/hw/devices.h
index 25f895b330..8b649541b1 100644
--- a/include/hw/devices.h
+++ b/include/hw/devices.h
@@ -28,18 +28,4 @@ void tsc2005_set_transform(void *opaque, MouseTransfor=
mInfo *info);
 /* stellaris_input.c */
 void stellaris_gamepad_init(int n, qemu_irq *irq, const int *keycode);
=20
-/* cbus.c */
-typedef struct {
-    qemu_irq clk;
-    qemu_irq dat;
-    qemu_irq sel;
-} CBus;
-CBus *cbus_init(qemu_irq dat_out);
-void cbus_attach(CBus *bus, void *slave_opaque);
-
-void *retu_init(qemu_irq irq, int vilma);
-void *tahvo_init(qemu_irq irq, int betty);
-
-void retu_key_event(void *retu, int state);
-
 #endif
diff --git a/include/hw/misc/cbus.h b/include/hw/misc/cbus.h
new file mode 100644
index 0000000000..1ce1855ccf
--- /dev/null
+++ b/include/hw/misc/cbus.h
@@ -0,0 +1,31 @@
+/*
+ * CBUS three-pin bus and the Retu / Betty / Tahvo / Vilma / Avilma /
+ * Hinku / Vinku / Ahne / Pihi chips used in various Nokia platforms.
+ * Based on reverse-engineering of a linux driver.
+ *
+ * Copyright (C) 2008 Nokia Corporation
+ * Written by Andrzej Zaborowski <andrew@openedhand.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef HW_MISC_CBUS_H
+#define HW_MISC_CBUS_H
+
+#include "hw/irq.h"
+
+typedef struct {
+    qemu_irq clk;
+    qemu_irq dat;
+    qemu_irq sel;
+} CBus;
+
+CBus *cbus_init(qemu_irq dat_out);
+void cbus_attach(CBus *bus, void *slave_opaque);
+
+void *retu_init(qemu_irq irq, int vilma);
+void *tahvo_init(qemu_irq irq, int betty);
+
+void retu_key_event(void *retu, int state);
+
+#endif
--=20
2.17.2

