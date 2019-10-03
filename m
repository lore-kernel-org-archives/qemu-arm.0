Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp86136wrp;
        Thu, 3 Oct 2019 16:19:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzkCmLINqB1FocDvbVsS40THkaRBKa8zPDHu1HjIVlg599VrEkzfuBVdOYV3W43d60Xyrq6
X-Received: by 2002:a37:dcc1:: with SMTP id v184mr7324386qki.258.1570144789058;
        Thu, 03 Oct 2019 16:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570144789; cv=none;
        d=google.com; s=arc-20160816;
        b=QCAbW6k2bxcRKHpQZbKu8cs1d92+bB7KL4hMwxbV49Dq82OX7zk/6vpOZ+G9Y7xo6V
         XlI4WzbYZlTb+apfZ4l0ocpq1NGhP+lOU0sxDYpZXzm/gZTFMcnlyAln2/YlLMVj7GcR
         RVJe3km84LqXWJ5KtdAJ/CsIRcb6cw6w/T4T0OGtPp8xC0Jc33m0Crl+PDxErH80YQ1T
         L14FIjaOVnCQxiFOm32foXbNHEuzOcRWl3I9hIl1zNZucuwSd4DACk+mUJZdV4YmM9gY
         EbyL2uzLbAemMq+NStDtw63lP9OGLWZ+EPEIDbqiUn+kilsfCmWWuUBUQ70Ql+DsoPaL
         mmAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=QConErDosGZJuz3Ze9C3TLhdwoNfgswi4ZY5TZeVSfk=;
        b=hoBH68N1CY+1Ib+KU5ScOdkGNLS3pRJtg6DGY6hYzdyJ6MOaxcx9pHKB964WkBP6a0
         ikMouewtIxWXenGEL+yevJBlVr/MA89Ksq+xzd/bDEvhDTt5zSsFSxHuz01h4/qKLRz0
         b5lEtG0MA+jvjWFYNn4EEsnfv0yn5vDthwu4oe4Rjfn8pXVDYSr+vdPVm8KkiGk+R+qf
         7KcPzHvSVl8rd36xQaAz3U5OmlkWfuP3iig0pCELki1ttCtqVug+NdAH1P8agBWfuqc2
         I8DlICySUduMOPw9BQl3Bcd/pzBPPrxZB94HC5RVjcZnu0ZO/HW+n2k4VsyRyNzep4VA
         HaxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b129si4091263qkc.151.2019.10.03.16.19.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2019 16:19:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGANv-0002nm-KM
	for alex.bennee@linaro.org; Thu, 03 Oct 2019 19:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46148)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iGAAZ-0001Mo-Su
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 19:06:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iGAAY-0006UQ-9D
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 19:05:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46402)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iGAAV-0006Qs-PG; Thu, 03 Oct 2019 19:05:56 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F0AAF20F7;
 Thu,  3 Oct 2019 23:05:52 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6050810013A7;
 Thu,  3 Oct 2019 23:05:44 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/14] hw: Move TWL92230 device from hw/timer/ to hw/rtc/
 subdirectory
Date: Fri,  4 Oct 2019 01:03:57 +0200
Message-Id: <20191003230404.19384-8-philmd@redhat.com>
In-Reply-To: <20191003230404.19384-1-philmd@redhat.com>
References: <20191003230404.19384-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Thu, 03 Oct 2019 23:05:53 +0000 (UTC)
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
X-TUID: 4RGCKC1rKSiT

The TWL92230 is an "energy management device" companion with
a RTC. Since we mostly model the RTC, move it under the hw/rtc/
subdirectory.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS                  | 2 +-
 hw/rtc/Kconfig               | 4 ++++
 hw/rtc/Makefile.objs         | 1 +
 hw/{timer =3D> rtc}/twl92230.c | 0
 hw/timer/Kconfig             | 4 ----
 hw/timer/Makefile.objs       | 1 -
 6 files changed, 6 insertions(+), 6 deletions(-)
 rename hw/{timer =3D> rtc}/twl92230.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 31e4fbf579..daa92cbff0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -663,7 +663,7 @@ F: hw/display/blizzard.c
 F: hw/input/lm832x.c
 F: hw/input/tsc2005.c
 F: hw/misc/cbus.c
-F: hw/timer/twl92230.c
+F: hw/rtc/twl92230.c
 F: include/hw/display/blizzard.h
 F: include/hw/input/tsc2xxx.h
 F: include/hw/misc/cbus.h
diff --git a/hw/rtc/Kconfig b/hw/rtc/Kconfig
index cc7fead764..dff9d60946 100644
--- a/hw/rtc/Kconfig
+++ b/hw/rtc/Kconfig
@@ -8,6 +8,10 @@ config M48T59
 config PL031
     bool
=20
+config TWL92230
+    bool
+    depends on I2C
+
 config MC146818RTC
     bool
=20
diff --git a/hw/rtc/Makefile.objs b/hw/rtc/Makefile.objs
index 4621b37bc2..810a38ee7b 100644
--- a/hw/rtc/Makefile.objs
+++ b/hw/rtc/Makefile.objs
@@ -4,5 +4,6 @@ ifeq ($(CONFIG_ISA_BUS),y)
 common-obj-$(CONFIG_M48T59) +=3D m48t59-isa.o
 endif
 common-obj-$(CONFIG_PL031) +=3D pl031.o
+common-obj-$(CONFIG_TWL92230) +=3D twl92230.o
 obj-$(CONFIG_MC146818RTC) +=3D mc146818rtc.o
 common-obj-$(CONFIG_SUN4V_RTC) +=3D sun4v-rtc.o
diff --git a/hw/timer/twl92230.c b/hw/rtc/twl92230.c
similarity index 100%
rename from hw/timer/twl92230.c
rename to hw/rtc/twl92230.c
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index b04c928136..9357875f28 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -20,10 +20,6 @@ config HPET
 config I8254
     bool
=20
-config TWL92230
-    bool
-    depends on I2C
-
 config ALTERA_TIMER
     bool
     select PTIMER
diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 034bd30255..23be70b71d 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -7,7 +7,6 @@ common-obj-$(CONFIG_DS1338) +=3D ds1338.o
 common-obj-$(CONFIG_HPET) +=3D hpet.o
 common-obj-$(CONFIG_I8254) +=3D i8254_common.o i8254.o
 common-obj-$(CONFIG_PUV3) +=3D puv3_ost.o
-common-obj-$(CONFIG_TWL92230) +=3D twl92230.o
 common-obj-$(CONFIG_XILINX) +=3D xilinx_timer.o
 common-obj-$(CONFIG_SLAVIO) +=3D slavio_timer.o
 common-obj-$(CONFIG_ETRAXFS) +=3D etraxfs_timer.o
--=20
2.20.1

