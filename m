Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4199860wrp;
        Mon, 16 Sep 2019 09:15:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqygEBy2wdDmSKIHnQHbgI/wCaOAnNfkAERYgjZvyR83bMJKgpy+cBCzhgPlp5UwwD/hHsJb
X-Received: by 2002:ac8:1289:: with SMTP id y9mr351638qti.201.1568650516630;
        Mon, 16 Sep 2019 09:15:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568650516; cv=none;
        d=google.com; s=arc-20160816;
        b=04czafb50b/RfVQx2lapxMlDuhCn7p5hSpd7jGaNdFuEdxrs3XiFEAFGw3VZlAsUAI
         AN9gc1QhPwCJVH7tLgPby9Rrw5ionELU6ezVgOGY1mLJGmDF7/iYu4dYAuCG2HdrsAHr
         iZczcI+3hKn6QsdcV2T4z5pBPcBiIo3jyLlj+OeE2o0a6gHP2L7wMLrFdIkE8xxBi0Af
         j+DvEZHMth0D38jLhSaWAx8rvtEDPDnRt7tcfQvavrS+EPErdp3y5/cu6gRHJIrzWBP1
         sH6GFAYbvQ+NuBDdABZYlT1ps4XMpvAJzZ8bsFAgHRI/d2JJmhszicIvzPFccAffOtQr
         406g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=WthyrdkxulcZCOeQw2/WGApfDcIgEOSPbCqEp9WfU40=;
        b=PyC2+GTPYmrA2dkyt3gbt/BVvNcAmhgh5phDIKvUEdNydxfCbgY3oIrQW0kccK7jJT
         12oMnVfBtB4xqsqzp9UPLusyMRCIdtePWLvKfOFDOpbA4jHMa4t3pVpyzmhszKzvgocu
         XQheFXF6FjbIJ12DxKQMLXS5EhcFKvSVH75YdUnqzOesn/4A2iC/bA3kroa3kJziVdln
         c8tJjY95wotzbHwz0Jt9w5qPxOaI6ItS0zTHzMt8dTHU6dVPl+ELjdyCbj/VnDaTzgOB
         HlAWHM7ZgQiyU9gHq6Pjs3/Ur6Np0CFAlJuSuhhWE96mWI+A791EKeDJLzQlXvsjRGXT
         +3fw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t17si8550673qkm.154.2019.09.16.09.15.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2019 09:15:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i9tel-0000K3-9c
	for alex.bennee@linaro.org; Mon, 16 Sep 2019 12:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35558)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i9tHG-0001HH-1S
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 11:50:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i9tHE-00026u-Bu
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 11:50:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41710)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i9tHE-00026h-3N; Mon, 16 Sep 2019 11:50:56 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 27CC181DEC;
 Mon, 16 Sep 2019 15:50:55 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-115.brq.redhat.com [10.40.204.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C422D19C4F;
 Mon, 16 Sep 2019 15:50:32 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 Sep 2019 17:48:40 +0200
Message-Id: <20190916154847.28936-7-philmd@redhat.com>
In-Reply-To: <20190916154847.28936-1-philmd@redhat.com>
References: <20190916154847.28936-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Mon, 16 Sep 2019 15:50:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 06/13] hw: Move sun4v hypervisor RTC from
 hw/timer/ to hw/rtc/ subdirectory
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
X-TUID: Y8XHSBazJvg2

Move RTC devices under the hw/rtc/ subdirectory.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS                   |  4 ++--
 hw/rtc/Kconfig                |  3 +++
 hw/rtc/Makefile.objs          |  1 +
 hw/{timer =3D> rtc}/sun4v-rtc.c |  2 +-
 hw/rtc/trace-events           |  4 ++++
 hw/sparc64/niagara.c          |  2 +-
 hw/timer/Kconfig              |  3 ---
 hw/timer/Makefile.objs        |  1 -
 hw/timer/trace-events         |  4 ----
 include/hw/rtc/sun4v-rtc.h    | 19 +++++++++++++++++++
 include/hw/timer/sun4v-rtc.h  |  1 -
 11 files changed, 31 insertions(+), 13 deletions(-)
 rename hw/{timer =3D> rtc}/sun4v-rtc.c (98%)
 create mode 100644 include/hw/rtc/sun4v-rtc.h
 delete mode 100644 include/hw/timer/sun4v-rtc.h

diff --git a/MAINTAINERS b/MAINTAINERS
index fd68b2383a..fb9a1ed075 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1165,8 +1165,8 @@ Sun4v
 M: Artyom Tarasenko <atar4qemu@gmail.com>
 S: Maintained
 F: hw/sparc64/niagara.c
-F: hw/timer/sun4v-rtc.c
-F: include/hw/timer/sun4v-rtc.h
+F: hw/rtc/sun4v-rtc.c
+F: include/hw/rtc/sun4v-rtc.h
=20
 Leon3
 M: Fabien Chouteau <chouteau@adacore.com>
diff --git a/hw/rtc/Kconfig b/hw/rtc/Kconfig
index 434b20b2b1..cc7fead764 100644
--- a/hw/rtc/Kconfig
+++ b/hw/rtc/Kconfig
@@ -10,3 +10,6 @@ config PL031
=20
 config MC146818RTC
     bool
+
+config SUN4V_RTC
+    bool
diff --git a/hw/rtc/Makefile.objs b/hw/rtc/Makefile.objs
index 89e8e48c64..4621b37bc2 100644
--- a/hw/rtc/Makefile.objs
+++ b/hw/rtc/Makefile.objs
@@ -5,3 +5,4 @@ common-obj-$(CONFIG_M48T59) +=3D m48t59-isa.o
 endif
 common-obj-$(CONFIG_PL031) +=3D pl031.o
 obj-$(CONFIG_MC146818RTC) +=3D mc146818rtc.o
+common-obj-$(CONFIG_SUN4V_RTC) +=3D sun4v-rtc.o
diff --git a/hw/timer/sun4v-rtc.c b/hw/rtc/sun4v-rtc.c
similarity index 98%
rename from hw/timer/sun4v-rtc.c
rename to hw/rtc/sun4v-rtc.c
index 54272a822f..ada01b5774 100644
--- a/hw/timer/sun4v-rtc.c
+++ b/hw/rtc/sun4v-rtc.c
@@ -13,7 +13,7 @@
 #include "hw/sysbus.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
-#include "hw/timer/sun4v-rtc.h"
+#include "hw/rtc/sun4v-rtc.h"
 #include "trace.h"
=20
=20
diff --git a/hw/rtc/trace-events b/hw/rtc/trace-events
index 54c94ac557..ac9e0e0fba 100644
--- a/hw/rtc/trace-events
+++ b/hw/rtc/trace-events
@@ -1,5 +1,9 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
+# sun4v-rtc.c
+sun4v_rtc_read(uint64_t addr, uint64_t value) "read: addr 0x%" PRIx64 " =
value 0x%" PRIx64
+sun4v_rtc_write(uint64_t addr, uint64_t value) "write: addr 0x%" PRIx64 =
" value 0x%" PRIx64
+
 # pl031.c
 pl031_irq_state(int level) "irq state %d"
 pl031_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c
index 167143bffe..dfa0817eae 100644
--- a/hw/sparc64/niagara.c
+++ b/hw/sparc64/niagara.c
@@ -30,7 +30,7 @@
 #include "hw/misc/unimp.h"
 #include "hw/loader.h"
 #include "hw/sparc/sparc64.h"
-#include "hw/timer/sun4v-rtc.h"
+#include "hw/rtc/sun4v-rtc.h"
 #include "exec/address-spaces.h"
 #include "sysemu/block-backend.h"
 #include "qemu/error-report.h"
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index a6b668b255..b04c928136 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -35,9 +35,6 @@ config ALLWINNER_A10_PIT
 config STM32F2XX_TIMER
     bool
=20
-config SUN4V_RTC
-    bool
-
 config CMSDK_APB_TIMER
     bool
     select PTIMER
diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 2fb12162a6..034bd30255 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -35,7 +35,6 @@ common-obj-$(CONFIG_ALLWINNER_A10_PIT) +=3D allwinner-a=
10-pit.o
 common-obj-$(CONFIG_STM32F2XX_TIMER) +=3D stm32f2xx_timer.o
 common-obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_timer.o aspeed_rtc.o
=20
-common-obj-$(CONFIG_SUN4V_RTC) +=3D sun4v-rtc.o
 common-obj-$(CONFIG_CMSDK_APB_TIMER) +=3D cmsdk-apb-timer.o
 common-obj-$(CONFIG_CMSDK_APB_DUALTIMER) +=3D cmsdk-apb-dualtimer.o
 common-obj-$(CONFIG_MSF2) +=3D mss-timer.o
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index 6936fe8573..ce34b967db 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -70,10 +70,6 @@ cmsdk_apb_dualtimer_reset(void) "CMSDK APB dualtimer: =
reset"
 aspeed_rtc_read(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " val=
ue 0x%08" PRIx64
 aspeed_rtc_write(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " va=
lue 0x%08" PRIx64
=20
-# sun4v-rtc.c
-sun4v_rtc_read(uint64_t addr, uint64_t value) "read: addr 0x%" PRIx64 " =
value 0x%" PRIx64
-sun4v_rtc_write(uint64_t addr, uint64_t value) "write: addr 0x%" PRIx64 =
" value 0x%" PRIx64
-
 # xlnx-zynqmp-rtc.c
 xlnx_zynqmp_rtc_gettime(int year, int month, int day, int hour, int min,=
 int sec) "Get time from host: %d-%d-%d %2d:%02d:%02d"
=20
diff --git a/include/hw/rtc/sun4v-rtc.h b/include/hw/rtc/sun4v-rtc.h
new file mode 100644
index 0000000000..fd868f6ed2
--- /dev/null
+++ b/include/hw/rtc/sun4v-rtc.h
@@ -0,0 +1,19 @@
+/*
+ * QEMU sun4v Real Time Clock device
+ *
+ * The sun4v_rtc device (sun4v tod clock)
+ *
+ * Copyright (c) 2016 Artyom Tarasenko
+ *
+ * This code is licensed under the GNU GPL v3 or (at your option) any la=
ter
+ * version.
+ */
+
+#ifndef HW_RTC_SUN4V
+#define HW_RTC_SUN4V
+
+#include "exec/hwaddr.h"
+
+void sun4v_rtc_init(hwaddr addr);
+
+#endif
diff --git a/include/hw/timer/sun4v-rtc.h b/include/hw/timer/sun4v-rtc.h
deleted file mode 100644
index 407278f918..0000000000
--- a/include/hw/timer/sun4v-rtc.h
+++ /dev/null
@@ -1 +0,0 @@
-void sun4v_rtc_init(hwaddr addr);
--=20
2.20.1

