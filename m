Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4114271wrt;
        Mon, 4 Feb 2019 15:22:55 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYZ6kCoFMox2ABN0uzipIoIUmNQpNK2wzofrPDvhapjJBuOW4a2Xv7Dol7+xWe/i67lLCzr
X-Received: by 2002:a25:a1e1:: with SMTP id a88mr1609997ybi.187.1549322574997;
        Mon, 04 Feb 2019 15:22:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549322574; cv=none;
        d=google.com; s=arc-20160816;
        b=zP4qXOMKpCTUTxMQIGHKgHCvBoqP4uP/aofc3hEYmyJsaw70eORswluFRyWQNbkcoN
         5VwybEYTf+gjzLnrnwr8W4VRg6LWg7zSafk9LAixwrYo/zkGRwMdN1l2cR80yJbt3im0
         A5G0QLs1isP6n05Dti82ASoyik6pCFKw9FanuBf8Ppzhy7acZw7k9l9o6VF17XYE4mRE
         OMqx6DizH0otdl7voidtp7QbXvFnxVrkJlXq5UtB4EvIIT6wY9t1JgtafjE2O+u3i+s2
         cIAIajnD5+W43xcOlABRt5fUuR3haG2J1NXBfzD7eq3h09PvyH5Pq2yh/TBhDa/4jhsY
         mJkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=MYX6mbVN8Ocl3jf0pfP7DiCs437mZ78R/M/i1gdoow4=;
        b=DVHUQojN2QnQQrSkaMuHJoNrsQ9Lhj8viHtho99T6foi/mcAncopP54YauFaNvbLWw
         sRxum2mvEpovrmVAkOwaPJB6fvOzz5lkQfSBhB8LSaCBo8yEVvBXEkXFJVTv1QbBneon
         +McryC/inTZJPcz8zg672XyGqbrAO66eoDOvq8RevV/12ESyqxzPWI6OoWsXMI0pNmQq
         5qQmYbyIWvC/QcJqTswbWl+jawA3bYhjGfAtWM+KLp1/4ZmK1TH1GKWSQtobfPfc4kNG
         Pq2Jr74uNHYJnutrujqYupWSCvjD6PjnFeRS0m+C1pbLM4TGTC6vXS8hb5aIuS2T+RFc
         OJ+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j69si886588ywb.67.2019.02.04.15.22.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Feb 2019 15:22:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50954 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gqnZm-0003S3-DL
	for alex.bennee@linaro.org; Mon, 04 Feb 2019 18:22:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqnWp-0001Wv-BQ
	for qemu-devel@nongnu.org; Mon, 04 Feb 2019 18:19:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqnWo-0001DR-Bx
	for qemu-devel@nongnu.org; Mon, 04 Feb 2019 18:19:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52848)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gqnWf-00013Z-LX; Mon, 04 Feb 2019 18:19:44 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B1682C05001B;
	Mon,  4 Feb 2019 23:19:33 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-98.brq.redhat.com [10.40.204.98])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA6C212A5D;
	Mon,  4 Feb 2019 23:19:12 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  5 Feb 2019 00:18:10 +0100
Message-Id: <20190204231815.29661-7-philmd@redhat.com>
In-Reply-To: <20190204231815.29661-1-philmd@redhat.com>
References: <20190204231815.29661-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 04 Feb 2019 23:19:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 06/11] hw/devices: Move Gamepad declarations
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
	Joel Stanley <joel@jms.id.au>, Richard Henderson <rth@twiddle.net>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i9WXDGb66hUT

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS                |  1 +
 hw/arm/stellaris.c         |  2 +-
 hw/input/stellaris_input.c |  2 +-
 include/hw/devices.h       |  3 ---
 include/hw/input/gamepad.h | 21 +++++++++++++++++++++
 5 files changed, 24 insertions(+), 5 deletions(-)
 create mode 100644 include/hw/input/gamepad.h

diff --git a/MAINTAINERS b/MAINTAINERS
index daae4a3beb..a38086f767 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -729,6 +729,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/*/stellaris*
+F: include/hw/input/gamepad.h
=20
 Versatile Express
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 442529cc65..24c20bf612 100644
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
index e400f9eac0..7a630da47f 100644
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
index 0000000000..112bad5e4c
--- /dev/null
+++ b/include/hw/input/gamepad.h
@@ -0,0 +1,21 @@
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
+/* Gamepad devices that have nowhere better to go.  */
+
+#include "hw/irq.h"
+
+/* stellaris_input.c */
+void stellaris_gamepad_init(int n, qemu_irq *irq, const int *keycode);
+
+#endif
--=20
2.20.1

