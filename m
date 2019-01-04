Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp868560wrt;
        Fri, 4 Jan 2019 10:08:28 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7avmCIcEqM+pu3aAH7QCkHIgwqDBJmpra+RjgtxGgrRxQlbXyrY0UNN7iAzORHeeNppezY
X-Received: by 2002:aed:21d2:: with SMTP id m18mr51780145qtc.121.1546625308696;
        Fri, 04 Jan 2019 10:08:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546625308; cv=none;
        d=google.com; s=arc-20160816;
        b=tmwpn07I7JiWoRZb1KWM6vYfNd/EwT3kc7B6E0jQInvf53EVsCUBNIRThxXVVCJbYW
         YBfgvD+yZ0T0xPMKmOaKnl6nebkDunih4neAu7J8Iz9ckeBmMD/AVGpfBZfO+Rwo90Vq
         XlOxJPfUKBZn8qZXiRHwLq8I1rlTOsYcD688ApQgjRwQl0ue2SmrmZmF8d3FYJ2z2/wo
         1/cCdmAa96yIi/gUB3Y1a4jlysUtUPezv6eTPEEtBgBoyNknE4hXy/CVXvMYRS67vsz9
         b6WtMw4Mv50s3hOjhkuFSbvZYhbLV4OFBfGwI279rPYEIql8cASZyb9JGmkR3DNOIWFg
         1Drw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=NDWL/LYZXHNkzvTMGywcf74q8AbLzvNMSDy1Ak90ya0=;
        b=bKHyfzwBYQIxSdrZdRWy1toz5pyrFS+a7VqefiWa2FmbABVSEA88suQceI/AKNHlzs
         tA0ejcETpd5KFTaZsJh0T6zF5Zpy6voPRftplCDshp9yhU8mrPef2+QXJbRKRfz74DSu
         QmSWYuQc1ubnaCtR3YH9v4sHWs8MzRrW5H6r/Iw7Ss5ePx8XbD8WKQobUb3HZG0LEB53
         FAjj6Na/+wY7pl8dusDN06scyaN2/RZMwOZURVwFB3FUK+EPHmJx08gldOs/geZ+ejQ4
         ww0+cItN/MnQKHnu8xaIzcepcePBam8mj1ZP6ga7wFn5tKPEw22nDuK3gninIIdYyVIJ
         GyOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id x2si57020qvp.94.2019.01.04.10.08.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 10:08:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37791 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfTtU-000413-46
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 13:08:28 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTnp-0006JR-Kr
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 13:02:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTnm-000668-Eg
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 13:02:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53798)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gfTnP-0005xZ-UX; Fri, 04 Jan 2019 13:02:16 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 955E6C057F36;
	Fri,  4 Jan 2019 18:02:10 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-119.brq.redhat.com [10.40.204.119])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0C2D5D6A9;
	Fri,  4 Jan 2019 18:01:53 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Date: Fri,  4 Jan 2019 18:58:45 +0100
Message-Id: <20190104175847.6290-15-philmd@redhat.com>
In-Reply-To: <20190104175847.6290-1-philmd@redhat.com>
References: <20190104175847.6290-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 04 Jan 2019 18:02:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 14/16] hw/net/lan9118: Export TYPE_LAN9118 and
 use it instead of hardcoded string
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
X-TUID: 5gYi3PkvF6E9

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/exynos4_boards.c  | 3 ++-
 hw/arm/mps2-tz.c         | 3 ++-
 hw/net/lan9118.c         | 1 -
 include/hw/net/lan9118.h | 2 ++
 4 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
index 750162cc95..ea8100f65a 100644
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
index 1232d6ff95..b6a8693d7c 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -49,6 +49,7 @@
 #include "hw/arm/iotkit.h"
 #include "hw/dma/pl080.h"
 #include "hw/ssi/pl022.h"
+#include "hw/net/lan9118.h"
 #include "net/net.h"
 #include "hw/core/split-irq.h"
=20
@@ -219,7 +220,7 @@ static MemoryRegion *make_eth_dev(MPS2TZMachineState =
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
index a428b16eda..b29e3fee49 100644
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
index 340d6681b7..2a3e2b0dea 100644
--- a/include/hw/net/lan9118.h
+++ b/include/hw/net/lan9118.h
@@ -16,6 +16,8 @@
 #include "hw/irq.h"
 #include "net/net.h"
=20
+#define TYPE_LAN9118 "lan9118"
+
 void lan9118_init(NICInfo *, uint32_t, qemu_irq);
=20
 #endif
--=20
2.17.2

