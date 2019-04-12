Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp782935wrx;
        Fri, 12 Apr 2019 09:55:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxqDoKlheRwq4KvcXo7+34qqC1XIIEhRyWtXFV/EeTNg6JptTmhkBi1u4F97v8grC9ICebB
X-Received: by 2002:a1c:1d49:: with SMTP id d70mr12098551wmd.36.1555088148831;
        Fri, 12 Apr 2019 09:55:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555088148; cv=none;
        d=google.com; s=arc-20160816;
        b=HOz9u+ac5YRYD8r5XqbP1hMDKA5sPnwCc7y7XFpoMI2Go09kAjaERZJH8PbgLfuh6l
         GbLie3KfDoFiQwAtifgTgOvlZMXohdTkL8HWfh0rYBO1S3CteUeH4eou6L8xj90brNcV
         /1ZDIkH0q83G+AUWOd+yK/94qH76PCz7Vk0Nm1EfyydDc+U3xI1zhXbPh667n7LgQDCC
         ElM/Xvrzn4QRlGHtFSaOE7eZcNzDIc1DBL7cpV9nIM9pzAzay0F/6mfTh7Mx4PJ+yyvQ
         uv+tbszSwOUnMxWHgnFO7iwcWhsqQgw77guBbkvrlhQacbpnHS3haJMqEMEdcowq+JpN
         333Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=65D6E5pEYByAYybnj3oGblQ5bY8KRa3I+3/daKuQzhY=;
        b=q57s6tUWin74hi1sU7Yz5E3Z/ZhzknMoIb80NaZ5AY+vnGR2HEJHacPnHO6eOxnAVe
         aObwpKGA0wM2HPnBFVBY+LhFv1wb7No4aCyRoDLthXFj2g2/XyCsmICzIKg3pf7zXbLc
         sG9D2aDElpWMRLlKCPhNCbSJXxTrmGKRKan79N2FnxtXaf3xDqLWcWdniACSLNHmJr+y
         LPX3ctuRLbLA9vz79qYNnnVeP4wtnVcLq/OKTgAYyoRLAMosj3/3oBwzuDPg830sMB5d
         5bTs3KkNTwf3SKPi8Tw+bTM3UM1kRacZajOMkgpjh3Iztso55lJeYCqKaov0Tfsp+aUS
         /6LQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7si28142523wri.286.2019.04.12.09.55.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 09:55:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40029 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEzSt-00019c-SI
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 12:55:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEzRs-0000yT-LE
	for qemu-devel@nongnu.org; Fri, 12 Apr 2019 12:54:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEzRq-00070c-Lv
	for qemu-devel@nongnu.org; Fri, 12 Apr 2019 12:54:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38476)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hEzRk-0006e5-CK; Fri, 12 Apr 2019 12:54:36 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A2913DBCA;
	Fri, 12 Apr 2019 16:54:35 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-66.brq.redhat.com [10.40.204.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 357B360BEC;
	Fri, 12 Apr 2019 16:54:33 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Date: Fri, 12 Apr 2019 18:54:08 +0200
Message-Id: <20190412165416.7977-5-philmd@redhat.com>
In-Reply-To: <20190412165416.7977-1-philmd@redhat.com>
References: <20190412165416.7977-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 12 Apr 2019 16:54:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 04/12] hw/devices: Move TC6393XB
 declarations into a new header
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fZkw8whO9r1i

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS                   |  1 +
 hw/arm/tosa.c                 |  2 +-
 hw/display/tc6393xb.c         |  2 +-
 include/hw/devices.h          |  6 ------
 include/hw/display/tc6393xb.h | 24 ++++++++++++++++++++++++
 5 files changed, 27 insertions(+), 8 deletions(-)
 create mode 100644 include/hw/display/tc6393xb.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 56139ac8ab0..ccf8097f413 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -714,6 +714,7 @@ F: hw/misc/mst_fpga.c
 F: hw/misc/max111x.c
 F: include/hw/arm/pxa.h
 F: include/hw/arm/sharpsl.h
+F: include/hw/display/tc6393xb.h
=20
 SABRELITE / i.MX6
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index eef9d427e76..9a1247797fe 100644
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
index 6d133d9a66c..0b7c59cde7d 100644
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
index 0850f697451..1e2141caad1 100644
--- a/include/hw/devices.h
+++ b/include/hw/devices.h
@@ -50,10 +50,4 @@ void *tahvo_init(qemu_irq irq, int betty);
=20
 void retu_key_event(void *retu, int state);
=20
-/* tc6393xb.c */
-typedef struct TC6393xbState TC6393xbState;
-TC6393xbState *tc6393xb_init(struct MemoryRegion *sysmem,
-                             uint32_t base, qemu_irq irq);
-qemu_irq tc6393xb_l3v_get(TC6393xbState *s);
-
 #endif
diff --git a/include/hw/display/tc6393xb.h b/include/hw/display/tc6393xb.=
h
new file mode 100644
index 00000000000..5c4da91f80d
--- /dev/null
+++ b/include/hw/display/tc6393xb.h
@@ -0,0 +1,24 @@
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
+qemu_irq tc6393xb_l3v_get(TC6393xbState *s);
+
+#endif
--=20
2.20.1

