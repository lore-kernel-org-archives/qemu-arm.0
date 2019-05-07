Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3833304wrh;
        Tue, 7 May 2019 09:35:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxP3vColX0E3kCwXHL2UUN8q6eE6oBYtQAjpTVNRupzhjvsKN/PQDxyhLJIgH6Sp40qQii2
X-Received: by 2002:a5d:4a81:: with SMTP id o1mr3332658wrq.183.1557246953937;
        Tue, 07 May 2019 09:35:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557246953; cv=none;
        d=google.com; s=arc-20160816;
        b=DURJYZHoLUUfhYqS8Y6oQT5UlX6miwNL8JtB0UawNo0XngNpnjIo7DUuDx2eHZmQQs
         6qCLGmSXF/xUmetuWdkQLTa9Nd6c3xzQxlYSzUxLzdelfXu2jzFUpanCQI0jJ0A18g0o
         G/D9FPlJYaGW3QNloaCqJ16gTUPBQUVXH6mNmlMHYtMWv+KUEeXlMnrp5tHWF7FsT6/x
         /xFxCKSxj5HXDVommrq7h0WisEQrNACRUNiwGCJq7sF5ryQVqwntRLOy/TqT1UHzmmxE
         QJYnz9upz/9NlhTGR97Qtd3vjgqVjU59F9JTjc7/ZtU/3bDZjy1f6oXkL0WiNa3zDnb3
         Wfkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=IQ5UdEdmE278oYNPh1nDbX7IimhKgfZ/d+So6Zt49ZU=;
        b=TGixZswUANsKV9fLJ7eRyXOcWy9t6NDPwarpOCDWd38s07NQl1B0wx9pm1jUlylvOA
         hW5TvxyJqFZOZy2m5vZX0dmVD5/19+QpgFvdloypWmDx7LvtGUp7RuxLH/ynJPH46rN1
         AIRL8qADxaM713IXOSPIQAq28lglz/cSfDnQhMxRGZsKpZTyAseaa8zegjcgrpSrTp6f
         5OQKW6MjlozuvVMDwrb1yVOUj18oHsdA5XYOXf4yyReoJFl2S0ALgjIvvAV9txZY2KG1
         tMAF2TeqM53KmSncJNDodtgmUzsoYAoUAlqcy5t2s6QyixNzvmd/H/7bdyE5KhsRcBa5
         QHFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18si4079593wrv.422.2019.05.07.09.35.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 09:35:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49776 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hO34L-00012D-05
	for alex.bennee@linaro.org; Tue, 07 May 2019 12:35:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hO340-00010O-1e
	for qemu-arm@nongnu.org; Tue, 07 May 2019 12:35:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hO33y-0001SX-4e
	for qemu-arm@nongnu.org; Tue, 07 May 2019 12:35:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48347)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hO33x-0001P1-Qn; Tue, 07 May 2019 12:35:30 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6AFC2307D854;
	Tue,  7 May 2019 16:35:27 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-58.brq.redhat.com [10.40.204.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11ABB3DA5;
	Tue,  7 May 2019 16:35:13 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Date: Tue,  7 May 2019 18:34:04 +0200
Message-Id: <20190507163416.24647-5-philmd@redhat.com>
In-Reply-To: <20190507163416.24647-1-philmd@redhat.com>
References: <20190507163416.24647-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Tue, 07 May 2019 16:35:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 04/16] hw/arm/bcm2835: Use TYPE_PL011 instead
 of hardcoded string
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Paul Burton <pburton@wavecomp.com>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Joel Stanley <joel@jms.id.au>,
	Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-ppc@nongnu.org,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yP/+j8ibpqWM

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/bcm2835_peripherals.c         | 2 +-
 include/hw/arm/bcm2835_peripherals.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 6be7660e8cb..7ffb51b6927 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -46,7 +46,7 @@ static void bcm2835_peripherals_init(Object *obj)
     qdev_set_parent_bus(DEVICE(&s->ic), sysbus_get_default());
=20
     /* UART0 */
-    s->uart0 =3D SYS_BUS_DEVICE(object_new("pl011"));
+    s->uart0 =3D SYS_BUS_DEVICE(object_new(TYPE_PL011));
     object_property_add_child(obj, "uart0", OBJECT(s->uart0), NULL);
     qdev_set_parent_bus(DEVICE(s->uart0), sysbus_get_default());
=20
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm283=
5_peripherals.h
index f5b193f6707..959508d57dd 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -13,6 +13,7 @@
=20
 #include "qemu-common.h"
 #include "hw/sysbus.h"
+#include "hw/char/pl011.h"
 #include "hw/char/bcm2835_aux.h"
 #include "hw/display/bcm2835_fb.h"
 #include "hw/dma/bcm2835_dma.h"
--=20
2.20.1

