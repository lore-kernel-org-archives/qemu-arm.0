Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp3492873wrq;
        Fri, 25 Oct 2019 01:54:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxNcGn71wPMJA+a+SvjEy1HP7FLFThjw0Jb/zPLpAEs37qWBeR4j3Xq/SINFTJbzWkQVJFK
X-Received: by 2002:a37:b4c:: with SMTP id 73mr1792754qkl.37.1571993649923;
        Fri, 25 Oct 2019 01:54:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571993649; cv=none;
        d=google.com; s=arc-20160816;
        b=fsq64QY8s5H//sO6QndtZbLymQxufR3xkKwzZNJCbGpHtTOT7GTJFziZoxnZDKPI2/
         TlQrStdzWlLBOOi52gdfjA9qK9gx9Ry5LR8/PtNEfma3YX4dtV3LRQtTX8v1BQJT1ets
         Rchl2JuNLbn8oz6x6uJjXb4C7YugnDkPU08oXaLcqsqnutO6lLPDsLBeRW8BuPHCuK3B
         YRzBzDDR+JPUIw5SfMXiZVAerk0s2fzsixE/ijPiVI5jc3m0PFpsRVoX3me/2y08jy7M
         U84r2SbfrXcpfdgZ0WyqUuFfEwIs/FBUsfpizncijncAhhTQ42ZwhY2HXrv46qI57duT
         2X/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=81SzHzc9PJuQANG798UUj0dUs4cDxSqUWQg0h+Rzn40=;
        b=L2YbEFE0Cf+dAHH41TIFDHlnbSqoAiG3iITrnOz9gPHZl65v2uBWsKjkakuRziftvZ
         uSomNZuKL8C/Ozw+4n8Yds/VSH/Zaww5gK055Gl6O0GzS86t9A2XbqhVyLZxBrU0NkGt
         vr+wSHGu7of1JjIrnZoAoqmkjZFX77r4oKMXhRqxhSEkZmElIeftry82RaEUhNetJTbc
         7o86zzwF4gnPt5Rpnbxq078AmBuB+wBHiQA/7ty9iiT54muK8eb035ktCMpd6KgaryrO
         jM/4j80FEXMzAUQ4TNiKFYIrEJjEfXwravieFVWoUCpEvRPB/wJ5kIiJgoDk+iG3d6rR
         cY5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4si911081qti.68.2019.10.25.01.54.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Oct 2019 01:54:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNvMG-0008Ly-Ok
	for alex.bennee@linaro.org; Fri, 25 Oct 2019 04:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50907)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iNv5e-0001qv-0b
 for qemu-arm@nongnu.org; Fri, 25 Oct 2019 04:37:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iNv5c-0008Qa-IY
 for qemu-arm@nongnu.org; Fri, 25 Oct 2019 04:36:57 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:59145)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iNv5V-0008IY-FV; Fri, 25 Oct 2019 04:36:49 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N6bPS-1hvlEj3y4k-0180Uc; Fri, 25 Oct 2019 10:35:56 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 16/19] hw: Move Aspeed RTC from hw/timer/ to hw/rtc/
 subdirectory
Date: Fri, 25 Oct 2019 10:35:08 +0200
Message-Id: <20191025083511.11463-17-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025083511.11463-1-laurent@vivier.eu>
References: <20191025083511.11463-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FD7oPnPLZhZc1tfLUvguP2u15R++7O+LcoF30+tScyz09W6XQtU
 qFXwUNfxBQzuHeSNlTNwDz04CTSC1QmpAGQxt+nNnCfmTj7V4TtCKwUEFR9K4OLKIm8s5Oz
 e1qz9rQ4QLkc9tBOBf+NrGDRzPcEDZbKpNAc8yFCl+ARpQNOSvhtF5+e/7gD2ZmF4A47fEr
 UvVleoDSGGmElI8yNmgdw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dcIUn0Jg9sA=:meOzGgMDZU67P+Fzp0AqEx
 L5pE8FE4WEkE9KS6GQ2W3z4Ih6922mEfve/81AR2GPPH9ZrLamFQpUfb7DdFLJMpE92D6xlQE
 0qFpOYm/cC/tpUIQyuLlBk01ssggOpabQ8Ywa2Yu18FfxXcPmVIbyqoqbKLOTp32/QL81KRU1
 CldbtTMGhn3X9id3tKbNUQrsWwQOK7thY4f1ppPWaWVzgT3JRd7x+GeaiUqUuLHXBAHmAcYh6
 6v1eIYbe7XJTJRKd3QzTzw6CSfSCBxvOTeZiDBMUy3hYJ3amQk+6aIj6xwDK8mD2TDaVFvuHt
 qE68odBVr2Jrvx2e2BV7bOdsQgxJyVV9yxP6lBvoCf3C/bEWTgUv4VR2rLgHiPIbDSbcTOy0U
 fw793pEKYxH7WesujAou9VYFwtuYaoR8w4wdFTL+lGpRcRQrytfL1xWepkzQycNmbBK4vz/NI
 itPzVi8YbjNoJ0V0RVMLjejz7fz4f0Ip3oObtIAQtO2tcDDEAaOOwN1sBFLqcO7n+AKCtNdXS
 L0eZlTcdnW6xuD7U9ZzqjqyAlE4oROM55J79TuODL8Vi4iY5m3t4CBqUJrP4JAistbji66BSN
 7nE+coHltXd6gQVIKkCk2esMUvq1k23rlNQI85J/DIBqg+V4B10Lec8Bv6zBtf83k7jn+ycBz
 dw/EEbM7apouDFRMNLCMZKzPjanQibiGvf5D2SVSX6URRnS7aZFyeq1tUqFQQ/lFg9n8C4Qw6
 uLealnaoJaeQqn9T1oMq8SqE5xN2DAQ4pRJDA9DmvjDVvJO3eoOe12Pv6gxx7xRVXYwTXEhpo
 XtKCQhslYN38VBXzRvNWQf6qat2Cz8nGYguXh69dbn6xN51wbobc488ZwQD5Xyj+hUH3NzVE4
 05IRwrdmHWkfnPjBV+zycRXUhJYfbXS42rjwjBbHE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.133
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
 Laurent Vivier <laurent@vivier.eu>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qEmFfTcCstEh

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Move RTC devices under the hw/rtc/ subdirectory.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20191003230404.19384-12-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/rtc/Makefile.objs                   | 1 +
 hw/{timer => rtc}/aspeed_rtc.c         | 2 +-
 hw/rtc/trace-events                    | 4 ++++
 hw/timer/Makefile.objs                 | 2 +-
 hw/timer/trace-events                  | 4 ----
 include/hw/arm/aspeed_soc.h            | 2 +-
 include/hw/{timer => rtc}/aspeed_rtc.h | 6 +++---
 7 files changed, 11 insertions(+), 10 deletions(-)
 rename hw/{timer => rtc}/aspeed_rtc.c (99%)
 rename include/hw/{timer => rtc}/aspeed_rtc.h (84%)

diff --git a/hw/rtc/Makefile.objs b/hw/rtc/Makefile.objs
index 3d4763fc269e..8dc9fcd3a983 100644
--- a/hw/rtc/Makefile.objs
+++ b/hw/rtc/Makefile.objs
@@ -10,3 +10,4 @@ common-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp-rtc.o
 common-obj-$(CONFIG_EXYNOS4) += exynos4210_rtc.o
 obj-$(CONFIG_MC146818RTC) += mc146818rtc.o
 common-obj-$(CONFIG_SUN4V_RTC) += sun4v-rtc.o
+common-obj-$(CONFIG_ASPEED_SOC) += aspeed_rtc.o
diff --git a/hw/timer/aspeed_rtc.c b/hw/rtc/aspeed_rtc.c
similarity index 99%
rename from hw/timer/aspeed_rtc.c
rename to hw/rtc/aspeed_rtc.c
index 531301735334..3ca1183558b7 100644
--- a/hw/timer/aspeed_rtc.c
+++ b/hw/rtc/aspeed_rtc.c
@@ -8,7 +8,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
-#include "hw/timer/aspeed_rtc.h"
+#include "hw/rtc/aspeed_rtc.h"
 #include "migration/vmstate.h"
 #include "qemu/log.h"
 #include "qemu/timer.h"
diff --git a/hw/rtc/trace-events b/hw/rtc/trace-events
index 7f1945ad4cc6..d6749f4616a0 100644
--- a/hw/rtc/trace-events
+++ b/hw/rtc/trace-events
@@ -13,3 +13,7 @@ pl031_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
 pl031_write(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
 pl031_alarm_raised(void) "alarm raised"
 pl031_set_alarm(uint32_t ticks) "alarm set for %u ticks"
+
+# aspeed-rtc.c
+aspeed_rtc_read(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " value 0x%08" PRIx64
+aspeed_rtc_write(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " value 0x%08" PRIx64
diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 33191d74cb98..83091770df3a 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -29,7 +29,7 @@ common-obj-$(CONFIG_MIPS_CPS) += mips_gictimer.o
 common-obj-$(CONFIG_ALLWINNER_A10_PIT) += allwinner-a10-pit.o
 
 common-obj-$(CONFIG_STM32F2XX_TIMER) += stm32f2xx_timer.o
-common-obj-$(CONFIG_ASPEED_SOC) += aspeed_timer.o aspeed_rtc.o
+common-obj-$(CONFIG_ASPEED_SOC) += aspeed_timer.o
 
 common-obj-$(CONFIG_CMSDK_APB_TIMER) += cmsdk-apb-timer.o
 common-obj-$(CONFIG_CMSDK_APB_DUALTIMER) += cmsdk-apb-dualtimer.o
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index 1459d07237b9..e18b87fc96dd 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -66,10 +66,6 @@ cmsdk_apb_dualtimer_read(uint64_t offset, uint64_t data, unsigned size) "CMSDK A
 cmsdk_apb_dualtimer_write(uint64_t offset, uint64_t data, unsigned size) "CMSDK APB dualtimer write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_dualtimer_reset(void) "CMSDK APB dualtimer: reset"
 
-# hw/timer/aspeed-rtc.c
-aspeed_rtc_read(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " value 0x%08" PRIx64
-aspeed_rtc_write(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " value 0x%08" PRIx64
-
 # nrf51_timer.c
 nrf51_timer_read(uint64_t addr, uint32_t value, unsigned size) "read addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
 nrf51_timer_write(uint64_t addr, uint32_t value, unsigned size) "write addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index cccb684a19bb..495c08be1b84 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -18,7 +18,7 @@
 #include "hw/misc/aspeed_sdmc.h"
 #include "hw/misc/aspeed_xdma.h"
 #include "hw/timer/aspeed_timer.h"
-#include "hw/timer/aspeed_rtc.h"
+#include "hw/rtc/aspeed_rtc.h"
 #include "hw/i2c/aspeed_i2c.h"
 #include "hw/ssi/aspeed_smc.h"
 #include "hw/watchdog/wdt_aspeed.h"
diff --git a/include/hw/timer/aspeed_rtc.h b/include/hw/rtc/aspeed_rtc.h
similarity index 84%
rename from include/hw/timer/aspeed_rtc.h
rename to include/hw/rtc/aspeed_rtc.h
index 15ba42912b7f..3fde854ad99c 100644
--- a/include/hw/timer/aspeed_rtc.h
+++ b/include/hw/rtc/aspeed_rtc.h
@@ -5,8 +5,8 @@
  * Copyright 2019 IBM Corp
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
-#ifndef ASPEED_RTC_H
-#define ASPEED_RTC_H
+#ifndef HW_RTC_ASPEED_RTC_H
+#define HW_RTC_ASPEED_RTC_H
 
 #include <stdint.h>
 
@@ -27,4 +27,4 @@ typedef struct AspeedRtcState {
 #define TYPE_ASPEED_RTC "aspeed.rtc"
 #define ASPEED_RTC(obj) OBJECT_CHECK(AspeedRtcState, (obj), TYPE_ASPEED_RTC)
 
-#endif /* ASPEED_RTC_H */
+#endif /* HW_RTC_ASPEED_RTC_H */
-- 
2.21.0

