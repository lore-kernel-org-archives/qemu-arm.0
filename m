Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1403553lfp;
        Thu, 6 Feb 2020 04:56:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqwJxNdDwtDQBmgZjpuUZDIPeBPxvAfRQPEvkvpVkBy8Vmz9d5pQfiJvqUKNhC9NYG0N9eQk
X-Received: by 2002:a37:454d:: with SMTP id s74mr2393765qka.104.1580993806754;
        Thu, 06 Feb 2020 04:56:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580993806; cv=none;
        d=google.com; s=arc-20160816;
        b=ZX3IOc3kEku/1PJLeQspSjjWHm7kXV3DLelaR+8R/IWheHtftjcil5o9Gw9JI6W8J0
         5Pxb4Zz6UyR5YI8qdPU1etifTUTZ4T1yGGWvV+JOypqsejwnByj+TGm0o8dScefh/WuF
         4X9ciqsFCMkVZYHZFFtbErpu3h2Br9ixGswEnMutwQuJy2pP2RYjJiO5MZk/EMxeVxCL
         ouAcejtcy0WH0N6WI9tK3h8tI4FElnyp5/PxGFP98pYgiapGd217uy/vp9k18sUbylk/
         vxVJppY6PvBREK1PKnxahuhCg+hRc0SVLvLEk2Xk33Hh8bUHbicARy+A/JRY870DFJga
         h8JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=QHq46/ldakPUvnnV4QPkkm2FbAbco7XmQYEFpCeWOeE=;
        b=pCsLcseLjVbzYyf5T6nxAaAzlqQMLh3nJUVHc7+Flfnv9zzuHew+1nLZHR2qSuqmri
         dDOmDgpOgojzqxlDFPIEqNoNOx3d3LPgq7N/iit5OY1Looz6rpi3Jch1s1NPLLASKmXR
         wjhAfwvXjY4pYRH9TkfzxfuzjYdWLQe9Ja/qxtWaxm7DLa2go0rWTXI2wMZ0FuxnaOWu
         CJiqKw+y/7Tpd3w78MipjohRVUWvmmIb9pdVqBrPKY+5/hZKt1uhq81bzU7aoKEaroU+
         3ECGZbd54DKJNYW4Bt/kblnZr08NNTwqoZUsxWw1VOOqXy2dq7uQsdAxs/bMozSXbucN
         8+ig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r12si1474916qtp.73.2020.02.06.04.56.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 04:56:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izgi6-0005Ic-4Y
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 07:56:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56635)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1izgch-0001MZ-85
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 07:51:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1izgcd-0006MJ-VW
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 07:51:11 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:59267)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1izgca-00069v-Ju; Thu, 06 Feb 2020 07:51:05 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MFbBO-1ijmZl2BLC-00H6yf; Thu, 06 Feb 2020 13:50:39 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 04/12] hw/timer/m48t59: Convert debug printf()s to trace events
Date: Thu,  6 Feb 2020 13:50:19 +0100
Message-Id: <20200206125027.1926263-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200206125027.1926263-1-laurent@vivier.eu>
References: <20200206125027.1926263-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:T8c6Xi4Oh+lSDqXyVGgojm/O13ryMV6fZe0mJQxr7lgwYwLNDL2
 OPTrCUs1HrLJZXsg8f55CFv8TVazxhfgqjs4k40byvJbQAwisPkRO1CrjyMzDXu+lCX6XU9
 JWWaOBO/h7ATGwQGxxdP3w3+C5hMKQ8gIZj6NFyZDS30A22B3UMJxYYvVc+iaza7O6In5LC
 umB7pmXDBD+pIe7t2J1+A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ttucs+vMU28=:aj4RgeUwy8Pl2AoIl83l1R
 o+w4GX+B0ADG5h1GjCpT9XWjLHuB5kuO36Sa5QNV4LdD0DpZ0L3mm3JxSiZWFBps91aV+xnC4
 YdsAQotUdSuwS8iUauvhn0mAg0+Mhfe6lt9h4/7/vtocLF5twX3fKwOP8S91M7wb5YIFOKpG4
 56bEjouLuG3WS3ba3Kz0QH1KdGp1fQIw99Y568CWp7+crG4shypkasoUbT9Es1ue9oRB/NXuo
 XVhhQiWdBZpUmoDIWvkBOPWo/dSGijIy6wkjrz58gSSj+tjjVBLFTkT/4/mukWOQ30LkTlg04
 lJKSTCEI9DOq5sdTPp6HgEWP7Op01nltJWCWxCdRPOwj+8yuBj9rpkw2wgkwFoozR913HHPG4
 ESsEpFUW+AQv8HVOdZWKmtF2eB5IexrQeKaQgy4NI9f7l9Q8G81Iw62A2kd4O7SrcVIqS6hAK
 kG/eg+3c0HUiKy2knnFoxpTIDunBIXbTEPNwk1CKKTeit5ZUA+m4P2T3BKKTTRH03XGA4r7dm
 lkE9PksLUkbYvLKuBU5pr2KH/LwQKtggkcHVvGl9sAMPvWPkCJ7+E70VjNWAZyTKuWsRU4dEg
 YlcZVvj3uN8vyR2bKe0LAsnGco0jo9lbg5ljloLB5sEt6/0QZ+7l5EPPkqeoONmL5iSLl89S8
 Cv+laRz3odlHlv9aboCOi1r+axOUfguz8sP/fuGUI5IL9WWXlR96uFX0sXOIt850vp4nA2SBk
 EmNUJhnBQ+ZGx5ho3A/DrA65LeMvbJ9TcpLAlEYQVXY2aYeC34xaEPPriGNwO68Sp+TulRQ47
 3v9k+HgTpUKqZbEB6tFVDvmt9c+KGnhyVWZPxM8j8UdqzIDdvZBiUemDBTPHoG5J+BhI7+O
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-trivial@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: amQPRqJwuRen

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>
Message-Id: <20200117165809.31067-3-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/rtc/m48t59-internal.h |  5 -----
 hw/rtc/m48t59.c          | 11 +++++------
 hw/rtc/trace-events      |  6 ++++++
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/rtc/m48t59-internal.h b/hw/rtc/m48t59-internal.h
index 4d4f2a6fed94..cd648241e989 100644
--- a/hw/rtc/m48t59-internal.h
+++ b/hw/rtc/m48t59-internal.h
@@ -26,11 +26,6 @@
 #ifndef HW_M48T59_INTERNAL_H
 #define HW_M48T59_INTERNAL_H
 
-#define M48T59_DEBUG 0
-
-#define NVRAM_PRINTF(fmt, ...) do { \
-    if (M48T59_DEBUG) { printf(fmt , ## __VA_ARGS__); } } while (0)
-
 /*
  * The M48T02, M48T08 and M48T59 chips are very similar. The newer '59 has
  * alarm and a watchdog timer and related control registers. In the
diff --git a/hw/rtc/m48t59.c b/hw/rtc/m48t59.c
index 1269134bcbef..47d48054fdc1 100644
--- a/hw/rtc/m48t59.c
+++ b/hw/rtc/m48t59.c
@@ -35,6 +35,7 @@
 #include "exec/address-spaces.h"
 #include "qemu/bcd.h"
 #include "qemu/module.h"
+#include "trace.h"
 
 #include "m48t59-internal.h"
 #include "migration/vmstate.h"
@@ -192,8 +193,7 @@ void m48t59_write(M48t59State *NVRAM, uint32_t addr, uint32_t val)
     struct tm tm;
     int tmp;
 
-    if (addr > 0x1FF8 && addr < 0x2000)
-	NVRAM_PRINTF("%s: 0x%08x => 0x%08x\n", __func__, addr, val);
+    trace_m48txx_nvram_mem_write(addr, val);
 
     /* check for NVRAM access */
     if ((NVRAM->model == 2 && addr < 0x7f8) ||
@@ -450,8 +450,7 @@ uint32_t m48t59_read(M48t59State *NVRAM, uint32_t addr)
 	}
         break;
     }
-    if (addr > 0x1FF9 && addr < 0x2000)
-       NVRAM_PRINTF("%s: 0x%08x <= 0x%08x\n", __func__, addr, retval);
+    trace_m48txx_nvram_mem_read(addr, retval);
 
     return retval;
 }
@@ -462,7 +461,7 @@ static void NVRAM_writeb(void *opaque, hwaddr addr, uint64_t val,
 {
     M48t59State *NVRAM = opaque;
 
-    NVRAM_PRINTF("%s: 0x%"HWADDR_PRIx" => 0x%"PRIx64"\n", __func__, addr, val);
+    trace_m48txx_nvram_io_write(addr, val);
     switch (addr) {
     case 0:
         NVRAM->addr &= ~0x00FF;
@@ -494,7 +493,7 @@ static uint64_t NVRAM_readb(void *opaque, hwaddr addr, unsigned size)
         retval = -1;
         break;
     }
-    NVRAM_PRINTF("%s: 0x%"HWADDR_PRIx" <= 0x%08x\n", __func__, addr, retval);
+    trace_m48txx_nvram_io_read(addr, retval);
 
     return retval;
 }
diff --git a/hw/rtc/trace-events b/hw/rtc/trace-events
index d6749f4616a0..52c1566198e8 100644
--- a/hw/rtc/trace-events
+++ b/hw/rtc/trace-events
@@ -17,3 +17,9 @@ pl031_set_alarm(uint32_t ticks) "alarm set for %u ticks"
 # aspeed-rtc.c
 aspeed_rtc_read(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " value 0x%08" PRIx64
 aspeed_rtc_write(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " value 0x%08" PRIx64
+
+# m48t59.c
+m48txx_nvram_io_read(uint64_t addr, uint64_t value) "io read addr:0x%04" PRIx64 " value:0x%02" PRIx64
+m48txx_nvram_io_write(uint64_t addr, uint64_t value) "io write addr:0x%04" PRIx64 " value:0x%02" PRIx64
+m48txx_nvram_mem_read(uint32_t addr, uint32_t value) "mem read addr:0x%04x value:0x%02x"
+m48txx_nvram_mem_write(uint32_t addr, uint32_t value) "mem write addr:0x%04x value:0x%02x"
-- 
2.24.1

