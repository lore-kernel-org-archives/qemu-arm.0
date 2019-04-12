Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp794313wrx;
        Fri, 12 Apr 2019 10:06:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxRLFRQZkcgbvuI7zN0d8IcdX35cn5Mp0wWl9xmvyrRuq6BEa2YZyQ62ehNuMHsiEQM7QuT
X-Received: by 2002:a1c:544f:: with SMTP id p15mr11538818wmi.65.1555088794838;
        Fri, 12 Apr 2019 10:06:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555088794; cv=none;
        d=google.com; s=arc-20160816;
        b=OWVsvNwNOLqvHUBQO+fxIbEI816u7Ohcxt1VmHP/dbtyAsRWM6Q7Q7xUwd7zZvUZJ/
         9Mj9tXsLUv1KXRy0hIPBNEwIHhAUaS2VyE83QI3D4oTLrJ0u3UaYiqshBglDpDJUIcB5
         R+uGy6fHosPbPvMs7MriW7LEWoLJFDyQNdBq0KeRXcJAKHzsw1589J8AlQC+VmGIlqNR
         6YTV1VtU7kXN5FjanGDSIoCQDVazvDq6TipzpLTI/Nlmk8eGRhb3iRUHr6/dDdLgmb8M
         ZKfwLOLTkuiDYMb8/5fWkGotfBIaJlZQ+O+AR2S2TuZWprAxPBUW3gG17wC5IcatUliP
         VZkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=g5PZ6rJ8m8euILU4WpLAFSWhhcozp64wD0auYaAc2zI=;
        b=TuQUDlXk2pBI/VURG++n4n9sjKg1nZddr34NRBzr5r4atfNACaMXSTpqIRFIq3xDiD
         80xUUqsAc0qJv5RFdtxHpqHEYZK/yBdiqjc9xlYYzAHrYlLsLyh2VJzAFnViU2iBx4aF
         xTEw5rMVagZxkscNDB8QzTHYBzLowbGj290+uG7KmZHk1nP/MUWlEBRWfnOqWwcW5yHP
         blZ+ueUPn0WsBuQ0308BQjYhLirfNcHBKhwC12ve1xdjcDVTUl4qlUXVVDqRlkozrm7s
         WaiTEzHb20sAV0ANkflEr3qxAQub99Q0NblDrZzgi98olF1MRZPAOJwP8eh2cSkYjx38
         YWug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10si5422001wmj.145.2019.04.12.10.06.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 10:06:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40236 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEzdJ-0003H8-QK
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 13:06:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEzSJ-0001O4-Go
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 12:55:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEzSH-0007yz-JN
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 12:55:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45774)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hEzSD-0007na-WF; Fri, 12 Apr 2019 12:55:07 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 442ED3099FD3;
	Fri, 12 Apr 2019 16:55:03 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-66.brq.redhat.com [10.40.204.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8726D60BEC;
	Fri, 12 Apr 2019 16:54:56 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Date: Fri, 12 Apr 2019 18:54:15 +0200
Message-Id: <20190412165416.7977-12-philmd@redhat.com>
In-Reply-To: <20190412165416.7977-1-philmd@redhat.com>
References: <20190412165416.7977-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Fri, 12 Apr 2019 16:55:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 11/12] hw/net/lan9118: Export TYPE_LAN9118 and
 use it instead of hardcoded string
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
	Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7BApiM8/x5k3

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/exynos4_boards.c  | 3 ++-
 hw/arm/mps2-tz.c         | 3 ++-
 hw/net/lan9118.c         | 1 -
 include/hw/net/lan9118.h | 2 ++
 4 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
index 750162cc95a..ea8100f65a8 100644
--- a/hw/arm/exynos4_boards.c
+++ b/hw/arm/exynos4_boards.c
@@ -32,6 +32,7 @@
 #include "hw/arm/arm.h"
 #include "exec/address-spaces.h"
 #include "hw/arm/exynos4210.h"
+#include "hw/net/lan9118.h"
 #include "hw/boards.h"
=20
 #undef DEBUG
@@ -92,7 +93,7 @@ static void lan9215_init(uint32_t base, qemu_irq irq)
     /* This should be a 9215 but the 9118 is close enough */
     if (nd_table[0].used) {
         qemu_check_nic_model(&nd_table[0], "lan9118");
-        dev =3D qdev_create(NULL, "lan9118");
+        dev =3D qdev_create(NULL, TYPE_LAN9118);
         qdev_set_nic_properties(dev, &nd_table[0]);
         qdev_prop_set_uint32(dev, "mode_16bit", 1);
         qdev_init_nofail(dev);
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index f79f090a4ac..7832408bb70 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -56,6 +56,7 @@
 #include "hw/arm/armsse.h"
 #include "hw/dma/pl080.h"
 #include "hw/ssi/pl022.h"
+#include "hw/net/lan9118.h"
 #include "net/net.h"
 #include "hw/core/split-irq.h"
=20
@@ -244,7 +245,7 @@ static MemoryRegion *make_eth_dev(MPS2TZMachineState =
*mms, void *opaque,
      * except that it doesn't support the checksum-offload feature.
      */
     qemu_check_nic_model(nd, "lan9118");
-    mms->lan9118 =3D qdev_create(NULL, "lan9118");
+    mms->lan9118 =3D qdev_create(NULL, TYPE_LAN9118);
     qdev_set_nic_properties(mms->lan9118, nd);
     qdev_init_nofail(mms->lan9118);
=20
diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index a428b16eda5..b29e3fee49f 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -175,7 +175,6 @@ static const VMStateDescription vmstate_lan9118_packe=
t =3D {
     }
 };
=20
-#define TYPE_LAN9118 "lan9118"
 #define LAN9118(obj) OBJECT_CHECK(lan9118_state, (obj), TYPE_LAN9118)
=20
 typedef struct {
diff --git a/include/hw/net/lan9118.h b/include/hw/net/lan9118.h
index d13d8cd3d22..500acb4c143 100644
--- a/include/hw/net/lan9118.h
+++ b/include/hw/net/lan9118.h
@@ -14,6 +14,8 @@
 #include "hw/irq.h"
 #include "net/net.h"
=20
+#define TYPE_LAN9118 "lan9118"
+
 void lan9118_init(NICInfo *, uint32_t, qemu_irq);
=20
 #endif
--=20
2.20.1

