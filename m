Received: by 10.223.159.74 with SMTP id f10csp5487943wrg;
        Wed, 13 Dec 2017 11:59:45 -0800 (PST)
X-Google-Smtp-Source: ACJfBouhC1neMjfNZSqdzJzniKRnZMyFJUBaveigO7R859s+j6RzmbGyzqRatPdhtW6IrHmRdAwU
X-Received: by 10.37.31.132 with SMTP id f126mr2808776ybf.236.1513195185425;
        Wed, 13 Dec 2017 11:59:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513195185; cv=none;
        d=google.com; s=arc-20160816;
        b=a+L+If1vTlOeb5QM4boiswNwPT3sWfoznaqVXBtRPKSG9mFDdXcXpOQKubhNzypXyu
         Ij2K+Mq0xkmQo0eXGPnRC8KcJZjP5m5XbEHK4LYeoPi7r2cS0Rm5dI9XxDvm/e+7sFUO
         kHY5/fRl6O0QPmHSyEwu6AhjvXPuJEDNp86A4X/DsrYG6X4I6SvXvXAsX3R5B6iHCtll
         xSo/M8gOAtEr7ZtsattsKcUfwFHTqIGufE87uIQErS8t0g1ixGSn0430//mAJ7WsL3UI
         K0DJXG6oF7WFFUNguVZFAi2anwEzknnGxUYagvDs8klhpGqAE4aPIwE949bC6962EV9i
         rIAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=pjZU0hpzM3Q4zJcKiDNGvfV9gTiE59nDO+yAb8XhSXA=;
        b=mEwt5xR14YTeHF3gwyKk0gNC8CnUcHLLIDLwMfLMgZeeY2UpPLardJF1ht5aoffubC
         hAg3uycwwbiMh9kE4f7+dsdKBirZC5lKJVCkfMGBNP8xf4aCg4XOAeNOXzTrBIbFbbr6
         La+GB9472YsSgMV4l5io37jGK8dK1fM4Go/i/BFoDp6I34bwpPBNUx/wS4eKkzglg4Tu
         2aMaJftceFR4SAGhhEHP+KGjIXv05McvkichBUfn+9k45uaWoQGmWYY2m0wbk7H77EUi
         6QpZmg37ixULOKba9xhbiQkm0q6PDBlQDi1X8GGrI4DDFWkYtOVcGz5DEBxC+4sCPlwQ
         h7oQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tv9ppByw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a14si488554ybl.788.2017.12.13.11.59.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Dec 2017 11:59:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tv9ppByw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37339 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePDBw-0002mp-OX
	for alex.bennee@linaro.org; Wed, 13 Dec 2017 14:59:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDBa-0002df-5w
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 14:59:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDBY-0005Pz-8b
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 14:59:22 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:39070)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDBU-0005NJ-2v; Wed, 13 Dec 2017 14:59:16 -0500
Received: by mail-qt0-x241.google.com with SMTP id k19so5214745qtj.6;
	Wed, 13 Dec 2017 11:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pjZU0hpzM3Q4zJcKiDNGvfV9gTiE59nDO+yAb8XhSXA=;
	b=tv9ppByw4Ud6ruMtvZ7KYQvht8QVMP1EKEo1l3Wp1nC3wX5sLY/SoV4Dybf9AFa9FF
	mjuOZ4vS8Qc3mPj2242yQoZDZELIVSsrgPWJ9Uv3mUcAdZEL8PwjltiyRYF2XclQuqiF
	0c5iNyKbAMRdgp8Lx/uaYPMqVNix/neq+slkIgDB0XHg9xt7H3ii8lNWx3v6LcdWwYhc
	LgJAug50kMxhk6AAzOS3vUI83ihukO3kmpvF7skaMEsP5HGu8dplyyGrBDHjIwZsz+Dx
	jfCExDSJ+SM1N6YQtDAba274w+WTmalllp/sT/w8DViHX3/abZAMEemXIFz+UVYJ8izo
	PXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=pjZU0hpzM3Q4zJcKiDNGvfV9gTiE59nDO+yAb8XhSXA=;
	b=qpVLkA9wNzJyLpm3SMmcquWI2TcOxm7nW6lTZVJkbkOilNyHcxuUANsH3JzmcEoAzp
	CTUbb0wqUFxBsbl4Pz0EL/pCMvINZhIOJ9GPK4gYZkAKE3kGBf6L8u21+w2mKJQMeWJj
	OpXj/PVnkDs9an/gmTtvcFE7+kxWbd0Qj+b3qL3nQlzKLWwY9JbJ8EpjUNkvxcg81s6M
	1U04FMowO4BbSS8WVuwQySTePJKc7AS8OmpK48+ajdvGMIX0Exo8rxBRImK+iPiGDFfF
	2ZI0/hzFWHyhvQlMk7V8V9VvIKJzRbEoQ1wBG0/w4rGbxEZsMRya3Ru1WRzQT2HZz4yq
	m+Yg==
X-Gm-Message-State: AKGB3mKxM1uRXN3qxWjHPum9w646mNmyU1ZWsHwfQG61KCcHHxKUW6QM
	rDMN+r+vZbOCXhItv7VdapM=
X-Received: by 10.237.37.177 with SMTP id x46mr7606451qtc.76.1513195155241;
	Wed, 13 Dec 2017 11:59:15 -0800 (PST)
Received: from x1.local ([138.117.48.211])
	by smtp.gmail.com with ESMTPSA id o5sm1518876qtc.72.2017.12.13.11.59.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Dec 2017 11:59:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Date: Wed, 13 Dec 2017 16:58:39 -0300
Message-Id: <20171213195852.30439-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171213195852.30439-1-f4bug@amsat.org>
References: <20171213195852.30439-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-arm] [PATCH 01/14] sd: split "sd-internal.h" of "hw/sd/sd.h"
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
Cc: Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6I+L0a1txKS6

Now only SD 'producers' are able to use the "sd-internal.h" API,
while SD 'consumers' are restricted to the "hw/sd/sd.h" 'public' API.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd-internal.h       | 119 ++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/sd/sd.h        |  95 +++---------------------------------
 hw/sd/core.c              |   3 +-
 hw/sd/milkymist-memcard.c |   2 +-
 hw/sd/omap_mmc.c          |   1 +
 hw/sd/pl181.c             |   2 +-
 hw/sd/pxa2xx_mmci.c       |   1 +
 hw/sd/sd.c                |   6 +--
 hw/sd/sdhci.c             |   2 +-
 hw/sd/ssi-sd.c            |   2 +-
 10 files changed, 135 insertions(+), 98 deletions(-)
 create mode 100644 hw/sd/sd-internal.h

diff --git a/hw/sd/sd-internal.h b/hw/sd/sd-internal.h
new file mode 100644
index 0000000000..afd5dbf194
--- /dev/null
+++ b/hw/sd/sd-internal.h
@@ -0,0 +1,119 @@
+/*
+ * SD Memory Card emulation.
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
+#ifndef SD_INTERNAL_H
+#define SD_INTERNAL_H
+
+#include "hw/qdev.h"
+#include "sysemu/block-backend.h"
+
+#define OUT_OF_RANGE        (1 << 31)
+#define ADDRESS_ERROR       (1 << 30)
+#define BLOCK_LEN_ERROR     (1 << 29)
+#define ERASE_SEQ_ERROR     (1 << 28)
+#define ERASE_PARAM         (1 << 27)
+#define WP_VIOLATION        (1 << 26)
+#define CARD_IS_LOCKED      (1 << 25)
+#define LOCK_UNLOCK_FAILED  (1 << 24)
+#define COM_CRC_ERROR       (1 << 23)
+#define ILLEGAL_COMMAND     (1 << 22)
+#define CARD_ECC_FAILED     (1 << 21)
+#define CC_ERROR            (1 << 20)
+#define SD_ERROR            (1 << 19)
+#define CID_CSD_OVERWRITE   (1 << 16)
+#define WP_ERASE_SKIP       (1 << 15)
+#define CARD_ECC_DISABLED   (1 << 14)
+#define ERASE_RESET         (1 << 13)
+#define CURRENT_STATE       (7 << 9)
+#define READY_FOR_DATA      (1 << 8)
+#define APP_CMD             (1 << 5)
+#define AKE_SEQ_ERROR       (1 << 3)
+
+#define OCR_CCS_BITN        30
+
+typedef enum {
+    sd_none = -1,
+    sd_bc = 0,      /* broadcast -- no response */
+    sd_bcr,         /* broadcast with response */
+    sd_ac,          /* addressed -- no data transfer */
+    sd_adtc,        /* addressed with data transfer */
+} sd_cmd_type_t;
+
+typedef struct SDState SDState;
+
+#define SD_CARD_CLASS(klass) \
+    OBJECT_CLASS_CHECK(SDCardClass, (klass), TYPE_SD_CARD)
+#define SD_CARD_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(SDCardClass, (obj), TYPE_SD_CARD)
+
+typedef struct {
+    /*< private >*/
+    DeviceClass parent_class;
+    /*< public >*/
+
+    int (*do_command)(SDState *sd, SDRequest *req, uint8_t *response);
+    void (*write_data)(SDState *sd, uint8_t value);
+    uint8_t (*read_data)(SDState *sd);
+    bool (*data_ready)(SDState *sd);
+    void (*enable)(SDState *sd, bool enable);
+    bool (*get_inserted)(SDState *sd);
+    bool (*get_readonly)(SDState *sd);
+} SDCardClass;
+
+#define SD_BUS_CLASS(klass) OBJECT_CLASS_CHECK(SDBusClass, (klass), TYPE_SD_BUS)
+#define SD_BUS_GET_CLASS(obj) OBJECT_GET_CLASS(SDBusClass, (obj), TYPE_SD_BUS)
+
+typedef struct {
+    /*< private >*/
+    BusClass parent_class;
+    /*< public >*/
+
+    /* These methods are called by the SD device to notify the controller
+     * when the card insertion or readonly status changes
+     */
+    void (*set_inserted)(DeviceState *dev, bool inserted);
+    void (*set_readonly)(DeviceState *dev, bool readonly);
+} SDBusClass;
+
+/* Legacy functions to be used only by non-qdevified callers */
+SDState *sd_init(BlockBackend *bs, bool is_spi);
+int sd_do_command(SDState *sd, SDRequest *req, uint8_t *response);
+void sd_write_data(SDState *sd, uint8_t value);
+uint8_t sd_read_data(SDState *sd);
+void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_irq insert);
+bool sd_data_ready(SDState *sd);
+/* sd_enable should not be used -- it is only used on the nseries boards,
+ * where it is part of a broken implementation of the MMC card slot switch
+ * (there should be two card slots which are multiplexed to a single MMC
+ * controller, but instead we model it with one card and controller and
+ * disable the card when the second slot is selected, so it looks like the
+ * second slot is always empty).
+ */
+void sd_enable(SDState *sd, bool enable);
+
+#endif
diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 96caefe373..f6994e61f2 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -32,108 +32,25 @@
 
 #include "hw/qdev.h"
 
-#define OUT_OF_RANGE		(1 << 31)
-#define ADDRESS_ERROR		(1 << 30)
-#define BLOCK_LEN_ERROR		(1 << 29)
-#define ERASE_SEQ_ERROR		(1 << 28)
-#define ERASE_PARAM		(1 << 27)
-#define WP_VIOLATION		(1 << 26)
-#define CARD_IS_LOCKED		(1 << 25)
-#define LOCK_UNLOCK_FAILED	(1 << 24)
-#define COM_CRC_ERROR		(1 << 23)
-#define ILLEGAL_COMMAND		(1 << 22)
-#define CARD_ECC_FAILED		(1 << 21)
-#define CC_ERROR		(1 << 20)
-#define SD_ERROR		(1 << 19)
-#define CID_CSD_OVERWRITE	(1 << 16)
-#define WP_ERASE_SKIP		(1 << 15)
-#define CARD_ECC_DISABLED	(1 << 14)
-#define ERASE_RESET		(1 << 13)
-#define CURRENT_STATE		(7 << 9)
-#define READY_FOR_DATA		(1 << 8)
-#define APP_CMD			(1 << 5)
-#define AKE_SEQ_ERROR		(1 << 3)
-#define OCR_CCS_BITN        30
-
-typedef enum {
-    sd_none = -1,
-    sd_bc = 0,	/* broadcast -- no response */
-    sd_bcr,	/* broadcast with response */
-    sd_ac,	/* addressed -- no data transfer */
-    sd_adtc,	/* addressed with data transfer */
-} sd_cmd_type_t;
-
 typedef struct {
-    uint8_t cmd;
-    uint32_t arg;
-    uint8_t crc;
-} SDRequest;
+    uint8_t cmd;        /*  6 bits */
+    uint32_t arg;       /* 32 bits */
+    uint8_t crc;        /*  7 bits */
+} SDRequest;     /* total: 48 bits shifted */
 
-typedef struct SDState SDState;
 typedef struct SDBus SDBus;
 
 #define TYPE_SD_CARD "sd-card"
 #define SD_CARD(obj) OBJECT_CHECK(SDState, (obj), TYPE_SD_CARD)
-#define SD_CARD_CLASS(klass) \
-    OBJECT_CLASS_CHECK(SDCardClass, (klass), TYPE_SD_CARD)
-#define SD_CARD_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(SDCardClass, (obj), TYPE_SD_CARD)
-
-typedef struct {
-    /*< private >*/
-    DeviceClass parent_class;
-    /*< public >*/
-
-    int (*do_command)(SDState *sd, SDRequest *req, uint8_t *response);
-    void (*write_data)(SDState *sd, uint8_t value);
-    uint8_t (*read_data)(SDState *sd);
-    bool (*data_ready)(SDState *sd);
-    void (*enable)(SDState *sd, bool enable);
-    bool (*get_inserted)(SDState *sd);
-    bool (*get_readonly)(SDState *sd);
-} SDCardClass;
 
 #define TYPE_SD_BUS "sd-bus"
 #define SD_BUS(obj) OBJECT_CHECK(SDBus, (obj), TYPE_SD_BUS)
-#define SD_BUS_CLASS(klass) OBJECT_CLASS_CHECK(SDBusClass, (klass), TYPE_SD_BUS)
-#define SD_BUS_GET_CLASS(obj) OBJECT_GET_CLASS(SDBusClass, (obj), TYPE_SD_BUS)
 
 struct SDBus {
     BusState qbus;
 };
 
-typedef struct {
-    /*< private >*/
-    BusClass parent_class;
-    /*< public >*/
-
-    /* These methods are called by the SD device to notify the controller
-     * when the card insertion or readonly status changes
-     */
-    void (*set_inserted)(DeviceState *dev, bool inserted);
-    void (*set_readonly)(DeviceState *dev, bool readonly);
-} SDBusClass;
-
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
-/* Functions to be used by qdevified callers (working via
- * an SDBus rather than directly with SDState)
- */
+/* Functions to be used by qdevified callers */
 int sdbus_do_command(SDBus *sd, SDRequest *req, uint8_t *response);
 void sdbus_write_data(SDBus *sd, uint8_t value);
 uint8_t sdbus_read_data(SDBus *sd);
@@ -154,6 +71,6 @@ void sdbus_reparent_card(SDBus *from, SDBus *to);
 
 /* Functions to be used by SD devices to report back to qdevified controllers */
 void sdbus_set_inserted(SDBus *sd, bool inserted);
-void sdbus_set_readonly(SDBus *sd, bool inserted);
+void sdbus_set_readonly(SDBus *sd, bool readonly);
 
 #endif /* HW_SD_H */
diff --git a/hw/sd/core.c b/hw/sd/core.c
index 295dc44ab7..bd9350d21c 100644
--- a/hw/sd/core.c
+++ b/hw/sd/core.c
@@ -20,9 +20,8 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/qdev-core.h"
-#include "sysemu/block-backend.h"
 #include "hw/sd/sd.h"
+#include "sd-internal.h"
 
 static SDState *get_card(SDBus *sdbus)
 {
diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
index 4008c81002..8c9bb27229 100644
--- a/hw/sd/milkymist-memcard.c
+++ b/hw/sd/milkymist-memcard.c
@@ -27,9 +27,9 @@
 #include "sysemu/sysemu.h"
 #include "trace.h"
 #include "qemu/error-report.h"
-#include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "hw/sd/sd.h"
+#include "sd-internal.h"
 
 enum {
     ENABLE_CMD_TX   = (1<<0),
diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index e934cd3656..f7e42b3525 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -20,6 +20,7 @@
 #include "hw/hw.h"
 #include "hw/arm/omap.h"
 #include "hw/sd/sd.h"
+#include "sd-internal.h"
 
 struct omap_mmc_s {
     qemu_irq irq;
diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index 55c8098ecd..d568b12818 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -8,10 +8,10 @@
  */
 
 #include "qemu/osdep.h"
-#include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "hw/sysbus.h"
 #include "hw/sd/sd.h"
+#include "sd-internal.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
 
diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 3deccf02c9..f34951e1d1 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -16,6 +16,7 @@
 #include "hw/sysbus.h"
 #include "hw/arm/pxa.h"
 #include "hw/sd/sd.h"
+#include "sd-internal.h"
 #include "hw/qdev.h"
 #include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 35347a5bbc..9b7dee2ec4 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -32,7 +32,6 @@
 #include "qemu/osdep.h"
 #include "hw/qdev.h"
 #include "hw/hw.h"
-#include "sysemu/block-backend.h"
 #include "hw/sd/sd.h"
 #include "qapi/error.h"
 #include "qemu/bitmap.h"
@@ -40,6 +39,7 @@
 #include "qemu/error-report.h"
 #include "qemu/timer.h"
 #include "qemu/log.h"
+#include "sd-internal.h"
 
 //#define DEBUG_SD 1
 
@@ -1466,8 +1466,8 @@ static int cmd_valid_while_locked(SDState *sd, SDRequest *req)
             || sd_cmd_class[req->cmd & 0x3F] == 7;
 }
 
-int sd_do_command(SDState *sd, SDRequest *req,
-                  uint8_t *response) {
+int sd_do_command(SDState *sd, SDRequest *req, uint8_t *response)
+{
     int last_state;
     sd_rsp_type_t rtype;
     int rsplen;
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index b064a087c9..e7cd3258a3 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -24,12 +24,12 @@
 
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/dma.h"
 #include "qemu/timer.h"
 #include "qemu/bitops.h"
 #include "sdhci-internal.h"
+#include "sd-internal.h"
 #include "qemu/log.h"
 
 /* host controller debug messages */
diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 24001dc3e6..bd0b593b6e 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -11,11 +11,11 @@
  */
 
 #include "qemu/osdep.h"
-#include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "hw/ssi/ssi.h"
 #include "hw/sd/sd.h"
 #include "qapi/error.h"
+#include "sd-internal.h"
 
 //#define DEBUG_SSI_SD 1
 
-- 
2.15.1

