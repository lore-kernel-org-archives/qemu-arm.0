Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp862839wrt;
        Fri, 4 Jan 2019 10:03:05 -0800 (PST)
X-Google-Smtp-Source: ALg8bN75SGXeE1v0Kn3LDAqVXNhuxOspbRAo9E09aVxRlltKMx8hPaho/abRuGq62wXeDWodXbfm
X-Received: by 2002:a37:8882:: with SMTP id k124mr47774168qkd.1.1546624985486;
        Fri, 04 Jan 2019 10:03:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546624985; cv=none;
        d=google.com; s=arc-20160816;
        b=yJJirFpXLzOb8aSv/MSd6RJi1i28JAuae4Xtj8xUSDQMx0/YQguLY0CJfKpJrqtPUs
         FUayf/58XjPOF8mNonJKn1Q7d08ALoUQcPFKrbYc7s8W8RhETzCr0lRwTlo8irpNIXnU
         Ootq9msB14+LMthd2wOf2nAkVeyhpyRS5URgk/FBDYxfQAqBibFyxh1kr82yjs1T3Egm
         oADjtAuiYJgeqTx8AD5bGJrBThbhBfu08bY84CVEzjS1P2yvZj0ZKnoTBJemamL3JhoR
         xu/1OX7HaADquu10UcIe7JeGgrHqG7clpBZ2YHfkq6wrwi28ilRN7CJFTPzLnf87JIkO
         XjJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=MnjkpCt+nuktI3x8DnMh9Ft+p2dZDtvaoga80a+U+oA=;
        b=abHAQH03NrFgDrdGUEMDXHjlgtvkUZQQfqn5jv9W8cH2V5kOzjBp9fk8ehUDF/6nev
         v+/QxekcSQ11BQ8kfDcwTKN8NuU5fje9DT/rEJuV97wC5Y5QKoGsgrVOontzpHmgPVbZ
         E76+J9sFz53uKLJENJpqrxCbzvJBMKwWcRCWQ9W8A85gB5uKcyVAaYGUVPnQ1/AhghL0
         f9dxj/40kkLHvrAcL3jlOeUa9eWZ6G9LS4EOiqwY7MmmgzzAghYsBZFXuNhSrqCjslva
         A3GDasNKQt9ObhWJ5dCiZ6J6l07wQfSR3V3AncUJJbLTq1RkqGrBMHIQ591qGOWbrVtt
         eQwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id z2si4039206qtf.343.2019.01.04.10.03.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 10:03:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37712 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfToH-0006YM-10
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 13:03:05 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51891)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTlG-0003J9-Mt
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 12:59:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTlD-0004UH-Hu
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 12:59:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43310)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gfTlD-0004Tz-Aq; Fri, 04 Jan 2019 12:59:55 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4481DC051671;
	Fri,  4 Jan 2019 17:59:54 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-119.brq.redhat.com [10.40.204.119])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 846035D6A9;
	Fri,  4 Jan 2019 17:59:40 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Date: Fri,  4 Jan 2019 18:58:35 +0100
Message-Id: <20190104175847.6290-5-philmd@redhat.com>
In-Reply-To: <20190104175847.6290-1-philmd@redhat.com>
References: <20190104175847.6290-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 04 Jan 2019 17:59:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 04/16] hw/devices: Move TC6393XB declarations
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
X-TUID: 9+9jJ9mOkY59

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS                   |  1 +
 hw/arm/tosa.c                 |  2 +-
 hw/display/tc6393xb.c         |  2 +-
 include/hw/devices.h          |  9 ---------
 include/hw/display/tc6393xb.h | 25 +++++++++++++++++++++++++
 5 files changed, 28 insertions(+), 11 deletions(-)
 create mode 100644 include/hw/display/tc6393xb.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 19792cfb2d..dff4b98401 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -685,6 +685,7 @@ F: hw/gpio/zaurus.c
 F: hw/misc/mst_fpga.c
 F: include/hw/arm/pxa.h
 F: include/hw/arm/sharpsl.h
+F: include/hw/display/tc6393xb.h
=20
 SABRELITE / i.MX6
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index 7a925fa5e6..b6d464ab16 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -16,10 +16,10 @@
 #include "hw/hw.h"
 #include "hw/arm/pxa.h"
 #include "hw/arm/arm.h"
-#include "hw/devices.h"
 #include "hw/arm/sharpsl.h"
 #include "hw/pcmcia.h"
 #include "hw/boards.h"
+#include "hw/display/tc6393xb.h"
 #include "hw/i2c/i2c.h"
 #include "hw/ssi/ssi.h"
 #include "hw/sysbus.h"
diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
index 3360be6f84..2a59af2dc3 100644
--- a/hw/display/tc6393xb.c
+++ b/hw/display/tc6393xb.c
@@ -14,7 +14,7 @@
 #include "qapi/error.h"
 #include "qemu/host-utils.h"
 #include "hw/hw.h"
-#include "hw/devices.h"
+#include "hw/display/tc6393xb.h"
 #include "hw/block/flash.h"
 #include "ui/console.h"
 #include "ui/pixel_ops.h"
diff --git a/include/hw/devices.h b/include/hw/devices.h
index 4019b3be17..5ad134232c 100644
--- a/include/hw/devices.h
+++ b/include/hw/devices.h
@@ -49,13 +49,4 @@ void *tahvo_init(qemu_irq irq, int betty);
=20
 void retu_key_event(void *retu, int state);
=20
-/* tc6393xb.c */
-typedef struct TC6393xbState TC6393xbState;
-TC6393xbState *tc6393xb_init(struct MemoryRegion *sysmem,
-                             uint32_t base, qemu_irq irq);
-void tc6393xb_gpio_out_set(TC6393xbState *s, int line,
-                    qemu_irq handler);
-qemu_irq *tc6393xb_gpio_in_get(TC6393xbState *s);
-qemu_irq tc6393xb_l3v_get(TC6393xbState *s);
-
 #endif
diff --git a/include/hw/display/tc6393xb.h b/include/hw/display/tc6393xb.=
h
new file mode 100644
index 0000000000..434c345aa1
--- /dev/null
+++ b/include/hw/display/tc6393xb.h
@@ -0,0 +1,25 @@
+/*
+ * Toshiba TC6393XB I/O Controller.
+ * Found in Sharp Zaurus SL-6000 (tosa) or some
+ * Toshiba e-Series PDAs.
+ *
+ * Copyright (c) 2007 Herv=C3=A9 Poussineau
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef HW_DISPLAY_TC6393XB_H
+#define HW_DISPLAY_TC6393XB_H
+
+#include "exec/memory.h"
+#include "hw/irq.h"
+
+typedef struct TC6393xbState TC6393xbState;
+
+TC6393xbState *tc6393xb_init(struct MemoryRegion *sysmem,
+                             uint32_t base, qemu_irq irq);
+void tc6393xb_gpio_out_set(TC6393xbState *s, int line, qemu_irq handler)=
;
+qemu_irq *tc6393xb_gpio_in_get(TC6393xbState *s);
+qemu_irq tc6393xb_l3v_get(TC6393xbState *s);
+
+#endif
--=20
2.17.2

