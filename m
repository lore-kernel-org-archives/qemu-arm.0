Received: by 10.28.71.27 with SMTP id u27csp3584676wma;
        Mon, 22 Jan 2018 20:04:09 -0800 (PST)
X-Google-Smtp-Source: AH8x2253kL1A5zpZuYjoGWWJAc/zx1tNTKL6ZyvWy4YjZz5pFshYmPWoD2ujvUqDfKq0NWSzLwaK
X-Received: by 10.13.205.3 with SMTP id p3mr1031072ywd.377.1516680249672;
        Mon, 22 Jan 2018 20:04:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516680249; cv=none;
        d=google.com; s=arc-20160816;
        b=EcvJ24oTb1nZh4f3OEF3XxZaN10jJIh4hXyVJbDy/tQg6o0OcxFSQLhqKCe2MMb8fr
         rUbTQunwaJfxcPjjuVO7cTluoGLRi4pqKv01Wwk44qgejLgb+nQlIFcn7VkdcGSvVkm6
         ZtQ+uf33OFzDRYBQuT8Ks3HJJc2apWbO/JwszS7i9HTfUfnc5yyh7KZ65FfkywAIhlei
         FSgl7o6bwjLmX4je1EB4S/UNDf5Xsywu14NfUt6BLS/abT/y2fhbhBioyYEB/m09mOyL
         zTXRSUnXMETfONmtyKhU5U+qtp+oWEPykPmLfdnOsQvGIfPVT6gsOm/Ush8r3hFYDu/R
         xCWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=pN3w9spU95M89MECNlkTeliGwE5lvrRjERQUk1BdlXk=;
        b=l4R7YtQXZLOkAxRVUKcmf+l6TqgXP3ztR9Ni+pp+p+nZSqlXFXIKhQTE0OYVhWJjoD
         6Gxrk+whJfrxFzmrEWEcJa6VB5nYJkTHW0s7KkSF5EINrgzTfx8wch1IhI3VdYTyeq+A
         HbU00jMcePGgWaPgFYOGrzrIztVPlAJU5SEg1zdY/GCxwWMzSUSdGwtRrpLgPBMsAWjE
         vkjALM/FVflm4esuPFgg0ajXD5G4oioUntpSFjHhEZCs1lPqopJU75a4lZLe3UjIgN0b
         ws/e17cj67sRKrBRa5vQ7THsUio8kwkwjGVfD2H6gKtVkc7E1kROyBLVCVwM8DXPIvI2
         3BtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eL+YvTHM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w67si3913927yww.702.2018.01.22.20.04.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 20:04:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eL+YvTHM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:32822 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edpof-0001ai-3q
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 23:04:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edpjj-0006Hf-21
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 22:59:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edpjh-0002YH-Oi
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 22:59:03 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:40195)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edpjh-0002Xg-Ja; Mon, 22 Jan 2018 22:59:01 -0500
Received: by mail-qt0-x241.google.com with SMTP id s39so26601111qth.7;
	Mon, 22 Jan 2018 19:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pN3w9spU95M89MECNlkTeliGwE5lvrRjERQUk1BdlXk=;
	b=eL+YvTHMLOKsf8EVzebxDEAZSPenBuE2fpWVDM89pALMVvECGmKfwtqpByWvREh3Fb
	y9AtPZ6wgdaOi+N1nTlb9Isv8CcRjzp2+p/1ZmT4G564fZjU+wec8sEPj6LXjJf4TnWO
	jPRYx/+HXe6AgdLDcZHHqFREYC0XKtxBoRvhYS+c7EjPLNbLKodsvC3mCZ0bMxI0YCQP
	YOfwnZ8u9EoG94DXMeYuWngz+xdgsiothtkt9LbpdrEXLGhlhJtcvVMIrUkHdmk6Swgr
	NZV/So2OXFuv5wxrZ4z1P8vNOrHEl6fjR7cj0pEeR3e4I2IgssjMkZ1osswsgfxXjNSx
	/BlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=pN3w9spU95M89MECNlkTeliGwE5lvrRjERQUk1BdlXk=;
	b=T7xov0hKNUdX1Ux6uG8f/KFbbBvvELZ1MfCVz5gqB0dzUU9X0S5DVPP+nQxgekVaHL
	icuA87te/q4p7avCgnM41zPyFgfKOYQiVJE2xB2Qd2sT7yBaTuoz1yLadEgg1pDRLTZU
	i8g6DeefVHGpxl+ciT/WK+j1/Xw8NbEexJC4cfpw0tKD9zG7OOK2YUlMuFQGISOCC7DJ
	BZAimoIEmKt2GLvm7G6zAXZ591E84PJyILJIVsekR6C1gTTkpfWHIpDlGKJvQ68/RWKX
	eUAUAgAIHP5LHZ4G0d4TxK6Wh0hjdbLWoe8iIETKUZPDISJCADsAfHLH+DkHm+qAlq3m
	Q+2A==
X-Gm-Message-State: AKwxytflxGkxlYS194LASs86XKEWuXbIlOdx9D6QHDVCS5XLRkldfLoW
	xhw615p9q3bk1Qh4wePNX7I=
X-Received: by 10.200.26.163 with SMTP id x32mr1697009qtj.257.1516679941022;
	Mon, 22 Jan 2018 19:59:01 -0800 (PST)
Received: from x1.lan ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	n24sm12447530qta.26.2018.01.22.19.58.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jan 2018 19:59:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>
Date: Tue, 23 Jan 2018 00:58:37 -0300
Message-Id: <20180123035837.16578-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180123035837.16578-1-f4bug@amsat.org>
References: <20180123035837.16578-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-devel] [PATCH v2 6/6] hw/sd: move sdcard legacy API to
 "hw/sd/sdcard_legacy.h"
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org,
	"open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2T+rQsvh4ibU

roughly 2 users left.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/sd/sd.h            | 17 ---------------
 include/hw/sd/sdcard_legacy.h | 51 +++++++++++++++++++++++++++++++++++++++++++
 hw/sd/omap_mmc.c              |  2 +-
 hw/sd/pl181.c                 |  1 +
 hw/sd/sd.c                    |  1 +
 5 files changed, 54 insertions(+), 18 deletions(-)
 create mode 100644 include/hw/sd/sdcard_legacy.h

diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 9bdb3c9285..74bfab9386 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -130,23 +130,6 @@ typedef struct {
     void (*set_readonly)(DeviceState *dev, bool readonly);
 } SDBusClass;
 
-/* Legacy functions to be used only by non-qdevified callers */
-SDState *sd_init(BlockBackend *bs, bool is_spi);
-int sd_do_command(SDState *sd, SDRequest *req,
-                  uint8_t *response);
-void sd_write_data(SDState *sd, uint8_t value);
-uint8_t sd_read_data(SDState *sd);
-void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_irq insert);
-bool sd_data_ready(SDState *sd);
-/* sd_enable should not be used -- it is only used on the nseries boards,
- * where it is part of a broken implementation of the MMC card slot switch
- * (there should be two card slots which are multiplexed to a single MMC
- * controller, but instead we model it with one card and controller and
- * disable the card when the second slot is selected, so it looks like the
- * second slot is always empty).
- */
-void sd_enable(SDState *sd, bool enable);
-
 /* Functions to be used by qdevified callers (working via
  * an SDBus rather than directly with SDState)
  */
diff --git a/include/hw/sd/sdcard_legacy.h b/include/hw/sd/sdcard_legacy.h
new file mode 100644
index 0000000000..882e13a8f1
--- /dev/null
+++ b/include/hw/sd/sdcard_legacy.h
@@ -0,0 +1,51 @@
+/*
+ * SD Memory Card emulation (deprecated legacy API)
+ *
+ * Copyright (c) 2006 Andrzej Zaborowski  <balrog@zabor.org>
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in
+ *    the documentation and/or other materials provided with the
+ *    distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS''
+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
+ * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
+ * PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR
+ * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
+ * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
+ * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
+ * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
+ * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+#ifndef HW_SDCARD_LEGACY_H
+#define HW_SDCARD_LEGACY_H
+
+#include "hw/sd/sd.h"
+
+/* Legacy functions to be used only by non-qdevified callers */
+SDState *sd_init(BlockBackend *blk, bool is_spi);
+int sd_do_command(SDState *card, SDRequest *request, uint8_t *response);
+void sd_write_data(SDState *card, uint8_t value);
+uint8_t sd_read_data(SDState *card);
+void sd_set_cb(SDState *card, qemu_irq readonly, qemu_irq insert);
+bool sd_data_ready(SDState *card);
+
+/* sd_enable should not be used -- it is only used on the nseries boards,
+ * where it is part of a broken implementation of the MMC card slot switch
+ * (there should be two card slots which are multiplexed to a single MMC
+ * controller, but instead we model it with one card and controller and
+ * disable the card when the second slot is selected, so it looks like the
+ * second slot is always empty).
+ */
+void sd_enable(SDState *card, bool enable);
+
+#endif /* HW_SDCARD_LEGACY_H */
diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index 5b47cadf11..be14ac4f40 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -19,7 +19,7 @@
 #include "qemu/osdep.h"
 #include "hw/hw.h"
 #include "hw/arm/omap.h"
-#include "hw/sd/sd.h"
+#include "hw/sd/sdcard_legacy.h"
 
 struct omap_mmc_s {
     qemu_irq irq;
diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index ce696c5d7d..7591d016cd 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -12,6 +12,7 @@
 #include "sysemu/blockdev.h"
 #include "hw/sysbus.h"
 #include "hw/sd/sd.h"
+#include "hw/sd/sdcard_legacy.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
 
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 9880a5d090..6942aa4df3 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -35,6 +35,7 @@
 #include "hw/registerfields.h"
 #include "sysemu/block-backend.h"
 #include "hw/sd/sd.h"
+#include "hw/sd/sdcard_legacy.h"
 #include "qapi/error.h"
 #include "qemu/bitmap.h"
 #include "qemu/cutils.h"
-- 
2.15.1

