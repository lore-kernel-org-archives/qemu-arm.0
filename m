Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp94485wrp;
        Thu, 3 Oct 2019 16:30:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyQl96N02rBArJ+Fsd6aXaGvaObQ5uBYsL3i/N+bfarfzkOCUdXsX5M8i9GYQ7lBXbCt9Fq
X-Received: by 2002:a17:906:6084:: with SMTP id t4mr9809169ejj.164.1570145410365;
        Thu, 03 Oct 2019 16:30:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570145410; cv=none;
        d=google.com; s=arc-20160816;
        b=FlIQaMLp3adASHPKVKjUnqZjay7qA1OV349NG+gEsbwkeLrsRd5LnhMFUvWE5oGNe9
         P3b3oUQ4uKoxqUiYpnV6VIbBtrRIQwfWCF92dTDrHGOrLZItaUCHSYvzmnFyE1AFLl9F
         /1viuUHsxkVByuNwbR4AiP6OYxPl2fFFRQFZUiSN/t0jQv1RJYd8PahVOo4YGNt4V+Bm
         /nZazzZuhvWXxia7+x5itmoHlVXFWi+rc84oHeH9g5q4mCdzjvpaJNoBxq0kI7aH5WCG
         8RJYd0cBBX35ssAr/JiwvlE5dua/KakdnJT7Y0baelbWet8noreN5e6p79asmymrJnAL
         MOaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=nvEJaXAqGlMiPQa0/XqbCG3nag9FqoFJeY9TlL+cl6w=;
        b=wmaHhfaWzKSVHq+mYeDeCy93hXTVfpKLvCFjxlErX91L4TZL0ZOjAT8cn6IegczcIp
         JtYzdO8ZqJYaYB6EhVEeQ7Jt3WT4o+UAI+WweANDN/EKQAAI967ahfL1Bqf7XBVbNsfa
         zRYSbt7d3kDjP+mAJRP/r5t377y9r6HRk9BcWGW5nXHda93nOZAJFuJTdWxHdKsFDB5g
         EIECah7xmuaXihLlew7uBJDyezrwBUBrJUGuOEX4yRPxo/Im/py1UPo798k/mXSelGc0
         blh5q45XccYsPdUOVq4c1pvwMHuoAeRTs5PcyfIfkg3yuPhmIRgOQvmy2dQkWQIcuOHZ
         jnAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a30si2554576eda.39.2019.10.03.16.30.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2019 16:30:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGAXw-0001fD-SK
	for alex.bennee@linaro.org; Thu, 03 Oct 2019 19:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46286)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iGAAm-0001Vt-8l
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 19:06:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iGAAl-0006Ze-33
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 19:06:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50590)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iGAAk-0006YW-Qh; Thu, 03 Oct 2019 19:06:11 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 692308667D;
 Thu,  3 Oct 2019 23:06:07 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 86F8910013A7;
 Thu,  3 Oct 2019 23:05:53 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/14] hw: Move DS1338 device from hw/timer/ to hw/rtc/
 subdirectory
Date: Fri,  4 Oct 2019 01:03:58 +0200
Message-Id: <20191003230404.19384-9-philmd@redhat.com>
In-Reply-To: <20191003230404.19384-1-philmd@redhat.com>
References: <20191003230404.19384-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 03 Oct 2019 23:06:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
 Alistair Francis <alistair.francis@wdc.com>,
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
 Andrew Jeffery <andrew@aj.id.au>, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PRoukX2OgzGl

The DS1338 is a Real Time Clock, not a timer.
Move it under the hw/rtc/ subdirectory.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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

