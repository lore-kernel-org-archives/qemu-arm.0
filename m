Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4114039wrt;
        Mon, 4 Feb 2019 15:22:32 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbJmG/weTv6ZHKSvC2NxdbYKQCc0lixy+mLJDkUCHpl2PF2YV7By4R82IhklZmQs9S5wcHM
X-Received: by 2002:a5b:9c9:: with SMTP id y9mr1571675ybq.242.1549322552100;
        Mon, 04 Feb 2019 15:22:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549322552; cv=none;
        d=google.com; s=arc-20160816;
        b=icobWxJYiMZNvEF8Q7WRBpZOD7h9xQrn0x35NO4U7VG0kfjZS9Mutbh7tvgfzwIbF3
         BF6FKMScw5TRgv/gkk+fvdHScc+pEhK512sjlVc3kjQRMzR3BPXtEFSk75D0PsN5tUzf
         Gk8iRIQ/FP61BxAq1+B4usg8UWb59KYlVlY5dAvnBjhBcEV10/1Bf00QKHFjqAM4Wr0G
         J3GfP45kDAsPUMuNEkp6wsFNtwg73ZDRC4QOqkdp2ap9YpntaNAQtInih8LX+p4ONGgl
         VfclaodEKFaUaIOJnLTFyDf6uTgx0YQss9Q8rjz2N5EXfrOYrxSThrFnCKhkJus0FquE
         v/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=XB18Sqq964Lhi0i6+/upmWSwhuzSASjr7UabZp5gaA4=;
        b=EIqNotxktJozGSKgZXctwh3i+hVqhuz66OIoORshca4IeGkemdWLWYwRlTz6pLbzXi
         ye0AqvIBGcMWVwIsfs6IbGjzDobNyLZHZA54c8Q7e+t6ruo+XKSJ657Me//ffST/a8qt
         YmKkFsg8Mlg3a3xSeqkXdz4skggptPDYpelLUtEmeNcRJf23HcY/4tmzLyqvmSkDtkHz
         oiZDBy+v4kCzcu60xnO6chTfhNkwax3vvpc+oslzw67T1JQZT7MOlP/bcTCG48x8SYh8
         MHsXo6AoxefvWmvMx36K6X7btlOXwxbrsuzz59hGzeV2WPjDhbZiN8+HA9z30aIxkwSS
         iRiA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j83si932387ywj.13.2019.02.04.15.22.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Feb 2019 15:22:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50958 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gqnZP-0003c2-Bk
	for alex.bennee@linaro.org; Mon, 04 Feb 2019 18:22:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqnVw-0000ju-Jq
	for qemu-arm@nongnu.org; Mon, 04 Feb 2019 18:18:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqnVv-0000do-NQ
	for qemu-arm@nongnu.org; Mon, 04 Feb 2019 18:18:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60766)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gqnVv-0000Zk-Eb; Mon, 04 Feb 2019 18:18:55 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4635C4E92A;
	Mon,  4 Feb 2019 23:18:54 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-98.brq.redhat.com [10.40.204.98])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E3C787A5;
	Mon,  4 Feb 2019 23:18:48 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  5 Feb 2019 00:18:07 +0100
Message-Id: <20190204231815.29661-4-philmd@redhat.com>
In-Reply-To: <20190204231815.29661-1-philmd@redhat.com>
References: <20190204231815.29661-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 04 Feb 2019 23:18:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 03/11] hw/devices: Move TC6393XB declarations
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
	BALATON Zoltan <balaton@eik.bme.hu>,
	Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Richard Henderson <rth@twiddle.net>,
	Andrzej Zaborowski <balrogg@gmail.com>,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vKhqJQ3gfeQc

The TC6393XB_RAM definition introduced in 64b40bc54a9 is no
more used since a0b753dfd39. Remove it.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS                   |  1 +
 hw/arm/tosa.c                 |  2 +-
 hw/display/tc6393xb.c         |  2 +-
 include/hw/devices.h          | 10 ----------
 include/hw/display/tc6393xb.h | 26 ++++++++++++++++++++++++++
 5 files changed, 29 insertions(+), 12 deletions(-)
 create mode 100644 include/hw/display/tc6393xb.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 9a76845581..52058a8983 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -699,6 +699,7 @@ F: hw/misc/mst_fpga.c
 F: hw/misc/max111x.c
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
index e1b1e302f2..5305c06816 100644
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
index b5f1662225..1e2141caad 100644
--- a/include/hw/devices.h
+++ b/include/hw/devices.h
@@ -50,14 +50,4 @@ void *tahvo_init(qemu_irq irq, int betty);
=20
 void retu_key_event(void *retu, int state);
=20
-/* tc6393xb.c */
-typedef struct TC6393xbState TC6393xbState;
-#define TC6393XB_RAM	0x110000 /* amount of ram for Video and USB */
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
index 0000000000..387c143b44
--- /dev/null
+++ b/include/hw/display/tc6393xb.h
@@ -0,0 +1,26 @@
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
+
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
2.20.1

