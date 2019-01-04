Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp879856wrt;
        Fri, 4 Jan 2019 10:20:14 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4akdTF+fve4OK396tMTHIbIiDZJ8j82cMO6aWGwVjNOReE3dcLpkWZxAUAyISt8JARh6o7
X-Received: by 2002:aed:352b:: with SMTP id a40mr51840043qte.153.1546626014286;
        Fri, 04 Jan 2019 10:20:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546626014; cv=none;
        d=google.com; s=arc-20160816;
        b=deb/SV6odpiekdabQCB1hmUyYAUX3h6M9zdsj1fatQTyXFc5PHfpne/hGbYUV2gqQ0
         ecYCQVj+7DZdwakea1X+3IhU1IdFqQBMpiNGflpp/2s4/NvsLKuc8VSP0nEmkVcU08Uz
         YNA0I1QyPhhzarVUGTYRPo+QnyTG0gDPTEcg7cr39PuVC8uxep9DOaniqigAg9ARdTYQ
         LLk5cNeOiOGmvTQ24i31vqH/gxgQMBMfEc51R4nDV/5ew/i8aZLLZz011wkhbMEWfeYF
         nS66g3zMy+SgdyQd1c2JC9Ke9354+kD5O2Cfd7aXQ2w9v7j++AZ/WDlWE3DCV+p2wTeD
         ce2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=K04IMxN/yLhV02VG13rJpfxQRr31e0hnBRvfyvK12D8=;
        b=fKmShmpAFkzgQ8yt2lkCdGsKXZVhkbOahTULsGMOtDPsjzbN+rsC6v9/wsYApjcxQy
         Y+m3zfSniG7fyb6uOj6jriE15p+9JaP0Di98xWoZ3Or5YpI7aHdZJIJ9QcZmx7JLKoKt
         AgCZdopDEP4QTHWpf4r4NLJPXX8g1YIDXD5WCJqZ2I3fnw6IYXrSuIg4hvdK7LEL4p0o
         7aPQ/CyONVEh/7X/iJKFT/k+oirNj+sze/1ku66wJMmZ6riCKvwPO6hLSG9XqybjdFAM
         sSDMSKcZ4PZBMM14GguQS/ERMzOQ6GnS78wYM27zSoH+GxxlGrBSAbeNop39Gf5gTaAM
         KZ8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from listsout.gnu.org (listsout.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17si918qkl.76.2019.01.04.10.20.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 10:20:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37969 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfU4r-0001vQ-PQ
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 13:20:13 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfToC-0006mr-MW
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 13:03:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfToB-0006Jl-D9
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 13:03:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:29461)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gfToB-0006JN-5z; Fri, 04 Jan 2019 13:02:59 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3794DBF9F2;
	Fri,  4 Jan 2019 18:02:58 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-119.brq.redhat.com [10.40.204.119])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C53965471D;
	Fri,  4 Jan 2019 18:02:35 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Date: Fri,  4 Jan 2019 18:58:47 +0100
Message-Id: <20190104175847.6290-17-philmd@redhat.com>
In-Reply-To: <20190104175847.6290-1-philmd@redhat.com>
References: <20190104175847.6290-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 04 Jan 2019 18:02:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 16/16] RFC hw/net/smc91c111: Convert init helper
 into an inline function
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
X-TUID: +VFQDQDmxzPE

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
As init helper in "hw/char/pl011.h"
---
 hw/net/smc91c111.c         | 17 -----------------
 include/hw/net/smc91c111.h | 25 ++++++++++++++++++++++++-
 2 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index d19ea0750d..3472852270 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -18,7 +18,6 @@
 /* Number of 2k memory pages available.  */
 #define NUM_PACKETS 4
=20
-#define TYPE_SMC91C111 "smc91c111"
 #define SMC91C111(obj) OBJECT_CHECK(smc91c111_state, (obj), TYPE_SMC91C1=
11)
=20
 typedef struct {
@@ -809,20 +808,4 @@ static void smc91c111_register_types(void)
     type_register_static(&smc91c111_info);
 }
=20
-/* Legacy helper function.  Should go away when machine config files are
-   implemented.  */
-void smc91c111_init(NICInfo *nd, uint32_t base, qemu_irq irq)
-{
-    DeviceState *dev;
-    SysBusDevice *s;
-
-    qemu_check_nic_model(nd, "smc91c111");
-    dev =3D qdev_create(NULL, TYPE_SMC91C111);
-    qdev_set_nic_properties(dev, nd);
-    qdev_init_nofail(dev);
-    s =3D SYS_BUS_DEVICE(dev);
-    sysbus_mmio_map(s, 0, base);
-    sysbus_connect_irq(s, 0, irq);
-}
-
 type_init(smc91c111_register_types)
diff --git a/include/hw/net/smc91c111.h b/include/hw/net/smc91c111.h
index 46f7d9a5d4..0a1097ddd2 100644
--- a/include/hw/net/smc91c111.h
+++ b/include/hw/net/smc91c111.h
@@ -10,9 +10,32 @@
 #ifndef HW_NET_SMC91C111_H
 #define HW_NET_SMC91C111_H
=20
+#include "hw/qdev.h"
 #include "hw/irq.h"
+#include "hw/sysbus.h"
 #include "net/net.h"
=20
-void smc91c111_init(NICInfo *, uint32_t, qemu_irq);
+#define TYPE_SMC91C111 "smc91c111"
+
+/*
+ * Legacy helper function.  Should go away when machine config files are
+ * implemented.
+ */
+static inline DeviceState *smc91c111_init(NICInfo *nd,
+                                          uint32_t base, qemu_irq irq)
+{
+    DeviceState *dev;
+    SysBusDevice *s;
+
+    qemu_check_nic_model(nd, "smc91c111");
+    dev =3D qdev_create(NULL, TYPE_SMC91C111);
+    qdev_set_nic_properties(dev, nd);
+    qdev_init_nofail(dev);
+    s =3D SYS_BUS_DEVICE(dev);
+    sysbus_mmio_map(s, 0, base);
+    sysbus_connect_irq(s, 0, irq);
+
+    return dev;
+}
=20
 #endif
--=20
2.17.2

