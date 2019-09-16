Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4175955wrp;
        Mon, 16 Sep 2019 08:54:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxu8e/in5Qd+xb4vA4fMCkM424nY8Otj+kk5/7jSa/mtIJ5CguLwhsCCt8iI0Jy/TURhh+N
X-Received: by 2002:a37:a550:: with SMTP id o77mr680225qke.205.1568649291868;
        Mon, 16 Sep 2019 08:54:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568649291; cv=none;
        d=google.com; s=arc-20160816;
        b=lCe/rlbO2eFA7a+C+aiM5pRkKHwG+2+wNvG1esmK8fJOKgQtiR6mzKydvvK9E0wm3/
         DYhH5hm+DsbUj/Qvt9tz1AMrD6UwY7MruR9u2xhZaL2QqkMm0/LdyRH1r9KDBqAeZ/L1
         iCevmSfsQY91k/uDyKv36qO+K6lzAUKVb+0Aedh51nsWZB3k16SDDZo5wFOBvwbBy6k5
         h9ZAfwCCbG7VAXntV8k6V0eWSbi5lQJxxm15foMxS25z3owrGf6RZ6rUP54fdStvwGLU
         OMXX0n3VVrgiRNG/vxy9TiV2wtcM/8qPZuc85ofWmMZNcy3cV+9MMhY7UboUUQvHyyI7
         hI3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=JSWOf+gqMlJtVgWGuO/vJKmFUj1FY0LFtof6Dy8bliQ=;
        b=wzX6ueh19T4GJkpU2j/cpbdf75YLsRwJ7d5Jqkeo9Ir4mKUu+x8syL72a4lzp+wQ3r
         fwHD+GAgmUAg+t89GTWDuBBsVIGiUhxS3x0Mu/N/oeMPK07TakMjH1uKmcE3iMtbT8vg
         uWLIeXMACIPCbQ+oJ4U54LcubzbBS1kE80O+JidUtarFRbB0c5NqnaCHjusnN6Gt9Fcy
         USp0iHKd5I5sYiZYXnS0LFOLHEVTPQxkVPp5+xlKxa120JxA15DNHq6DiRDbmn2S8Pkw
         mokHYIoMKlkRPwe1TbJKyjthGhZeakBC5zUHyYpVnC2Lxqifd/teqCQWw29Nzwid+dla
         rJ9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r33si28802841qvr.107.2019.09.16.08.54.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2019 08:54:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i9tL0-0005wT-OO
	for alex.bennee@linaro.org; Mon, 16 Sep 2019 11:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35643)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i9tHo-00027s-8W
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 11:51:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i9tHm-0002GX-Tg
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 11:51:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42018)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i9tHm-0002GI-Mh; Mon, 16 Sep 2019 11:51:30 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BDB5A81DEC;
 Mon, 16 Sep 2019 15:51:29 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-115.brq.redhat.com [10.40.204.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0526719C4F;
 Mon, 16 Sep 2019 15:51:15 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 Sep 2019 17:48:42 +0200
Message-Id: <20190916154847.28936-9-philmd@redhat.com>
In-Reply-To: <20190916154847.28936-1-philmd@redhat.com>
References: <20190916154847.28936-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Mon, 16 Sep 2019 15:51:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 08/13] hw: Move DS1338 device from hw/timer/ to
 hw/rtc/ subdirectory
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uqyA0RHwqtan

The DS1338 is a Real Time Clock, not a timer.
Move it under the hw/rtc/ subdirectory.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/rtc/Kconfig             | 4 ++++
 hw/rtc/Makefile.objs       | 1 +
 hw/{timer =3D> rtc}/ds1338.c | 0
 hw/timer/Kconfig           | 4 ----
 hw/timer/Makefile.objs     | 1 -
 5 files changed, 5 insertions(+), 5 deletions(-)
 rename hw/{timer =3D> rtc}/ds1338.c (100%)

diff --git a/hw/rtc/Kconfig b/hw/rtc/Kconfig
index dff9d60946..45daa8d655 100644
--- a/hw/rtc/Kconfig
+++ b/hw/rtc/Kconfig
@@ -1,3 +1,7 @@
+config DS1338
+    bool
+    depends on I2C
+
 config M41T80
     bool
     depends on I2C
diff --git a/hw/rtc/Makefile.objs b/hw/rtc/Makefile.objs
index 810a38ee7b..b195863291 100644
--- a/hw/rtc/Makefile.objs
+++ b/hw/rtc/Makefile.objs
@@ -1,3 +1,4 @@
+common-obj-$(CONFIG_DS1338) +=3D ds1338.o
 common-obj-$(CONFIG_M41T80) +=3D m41t80.o
 common-obj-$(CONFIG_M48T59) +=3D m48t59.o
 ifeq ($(CONFIG_ISA_BUS),y)
diff --git a/hw/timer/ds1338.c b/hw/rtc/ds1338.c
similarity index 100%
rename from hw/timer/ds1338.c
rename to hw/rtc/ds1338.c
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index 9357875f28..a990f9fe35 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -9,10 +9,6 @@ config ARM_MPTIMER
 config A9_GTIMER
     bool
=20
-config DS1338
-    bool
-    depends on I2C
-
 config HPET
     bool
     default y if PC
diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 23be70b71d..70b61b69c7 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -3,7 +3,6 @@ common-obj-$(CONFIG_ARM_MPTIMER) +=3D arm_mptimer.o
 common-obj-$(CONFIG_ARM_V7M) +=3D armv7m_systick.o
 common-obj-$(CONFIG_A9_GTIMER) +=3D a9gtimer.o
 common-obj-$(CONFIG_CADENCE) +=3D cadence_ttc.o
-common-obj-$(CONFIG_DS1338) +=3D ds1338.o
 common-obj-$(CONFIG_HPET) +=3D hpet.o
 common-obj-$(CONFIG_I8254) +=3D i8254_common.o i8254.o
 common-obj-$(CONFIG_PUV3) +=3D puv3_ost.o
--=20
2.20.1

