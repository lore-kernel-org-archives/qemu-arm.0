Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4334699lfm;
        Sun, 5 Jul 2020 13:49:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuxKEctbDZEkq3je2Jo35WTmETlYBrCg2Fe4GZGKvNOnaM2k26US1EXgSSQuvh5+AGr2DL
X-Received: by 2002:a25:61ce:: with SMTP id v197mr64841158ybb.459.1593982155950;
        Sun, 05 Jul 2020 13:49:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593982155; cv=none;
        d=google.com; s=arc-20160816;
        b=jt11tvXx1rW62bhLwMUkR3sffdUfmjsfV/7KqCxfQ99WB1SzNGZJ/HxiN2KmstIZpk
         CdMqyoH6GCuzRN+I9nWXO2Fr8Dfic4jC7BJmoTAmVSl8fuh9B+Q1pgyYDk3bHxFQ5TYn
         bEUdOl125+EXOooxZVmn68PeuIWhcDLnLYu0WUaix+tLjVOpj+DxDkoJiwChel7ZA6v+
         n4bl80+6c4FHMPMiCYbTITZrmSt4unv0C5fRE5ojceOwQxla4Td6r+BHDSKYFj2RIQxj
         Tio3i7XgigEG0gf0uZ62gFqp4IH95iTXMimXHKzHt4bf91dvIlop89RGMp6cvN+kf5Kx
         /mJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ixcXKWbf6cfHfw1IyV/7F3PpTUGdIgNQjxeIJDW6DDw=;
        b=wgRAF9IagJlmRLqFG4mYbBPwytqs9PQ+y1TjnoDTKJlGRaPTNb+auYEdtZgrWx20ea
         2m7cnZynb/mLiidVcu1ZWX9opDQgwVx5gbdvv1t2CfCWDaG71qvaN1xTq+qBR6f9hPAC
         lYygNm8jPgglQ2zZJBF0dybEktHA0p87ye9/Krqpu/17u9gTIjutf3BY8H7XQZuHpIOq
         rLOYCE95RPpPrjyVM3u+K9i0tfiPOrid9hV9OKqXaq+E4VsXqutPPI0tfCmj4uz+GkGc
         inGmnDl44TmQc7oJWHoytIx4lp3Ay8Jkz5iTX13foSMKWpgfk/m5XWuxHhNh/qHz10Qe
         fMaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dX9X87CI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12si15730703ybj.225.2020.07.05.13.49.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jul 2020 13:49:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dX9X87CI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsBZb-0008WA-9y
	for alex.bennee@linaro.org; Sun, 05 Jul 2020 16:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsBXE-0004sY-Eo; Sun, 05 Jul 2020 16:46:48 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:37439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsBXC-0000qW-No; Sun, 05 Jul 2020 16:46:48 -0400
Received: by mail-wm1-x330.google.com with SMTP id o2so39569814wmh.2;
 Sun, 05 Jul 2020 13:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ixcXKWbf6cfHfw1IyV/7F3PpTUGdIgNQjxeIJDW6DDw=;
 b=dX9X87CICh83fMLpy1imMTodQaq6w4CS+Qa/L4TVpg8B8IE3gJ7frwcEVhcIRfaVvV
 wVIMR22gHAOpnivn6uI9WT7Ngq4Nbz6X0H5s6hS15PWwErB3AXNMYoTQW9RtPQcaJGdc
 8Oyu2LP/7YkDCGJcI1siFDU3mIcsrmmuuSjk7+5v1bNVBGyrxp/mkxM2Wxftb4aWUJlr
 hXaGZnRE17OjSBfmF1v0DviKNeXSttdh8UACH5SRshLFm5OSYTnY13NsyVwUsrJgWFuZ
 2xRYWcr62P6+Cy1kaJQCqswNP5r/FulYvUd02Qu9woFqg6M8gL9GIBRnj99W/lhmwmSE
 FVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ixcXKWbf6cfHfw1IyV/7F3PpTUGdIgNQjxeIJDW6DDw=;
 b=B1LZUWG3s3mPmsw3sT+rf+J07koIsb3ejVXyNswxUrp6ux91+Ch7RBdq3OfmXOiBj2
 um0D7Hldg9mz5JiqXIrl+eNVaBlvBfczbpk6fO6e8u07ohkuM+XiFwj3PtTUYjBfqlqw
 wkcT8Ygc1v/yqrZP+9aLmcxsDu/SPJ+lfdgRJelzD9mUpgUANCn+mY3a/FU+Dx6rvkNH
 tzrJfdXgRT5BnDBMXGMjgigXjEAJkKDcqwscBP8m+X7tbQtumDiaqxQOJQhQgQFfhSGb
 HYm4i4og/xSaJTircfC7CMXs74IjOk6cgm4GzXyYafeDybMwbNdS+fPp/m59Bghimn+g
 zVoQ==
X-Gm-Message-State: AOAM531DGIvqZ44IF3jCWN5nL7xBGVx8JRJ5HdGaCCJonK7c7T79hI8n
 T/yIFPK/Uu3jNN/xB7rAcleDLBmYgLA=
X-Received: by 2002:a1c:e4d4:: with SMTP id b203mr17343330wmh.49.1593982004659; 
 Sun, 05 Jul 2020 13:46:44 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id g144sm51397817wme.2.2020.07.05.13.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 13:46:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/10] hw/sd: move sdcard legacy API to
 'hw/sd/sdcard_legacy.h'
Date: Sun,  5 Jul 2020 22:46:30 +0200
Message-Id: <20200705204630.4133-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200705204630.4133-1-f4bug@amsat.org>
References: <20200705204630.4133-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T8e2M6Dffseh

omap_mmc.c is the last device left using the legacy sdcard API.
Move the prototype declarations into a separate header, to
make it clear this is a legacy API.

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Message-Id: <20180216022933.10945-8-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/sd/sd.h            | 16 -----------
 include/hw/sd/sdcard_legacy.h | 50 +++++++++++++++++++++++++++++++++++
 hw/sd/omap_mmc.c              |  2 +-
 hw/sd/sd.c                    |  1 +
 4 files changed, 52 insertions(+), 17 deletions(-)
 create mode 100644 include/hw/sd/sdcard_legacy.h

diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index ace350e0e8..8767ab817c 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -136,22 +136,6 @@ typedef struct {
     void (*set_readonly)(DeviceState *dev, bool readonly);
 } SDBusClass;
 
-/* Legacy functions to be used only by non-qdevified callers */
-SDState *sd_init(BlockBackend *bs, bool is_spi);
-int sd_do_command(SDState *sd, SDRequest *req,
-                  uint8_t *response);
-void sd_write_data(SDState *sd, uint8_t value);
-uint8_t sd_read_data(SDState *sd);
-void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_irq insert);
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
index 0000000000..8681f8089b
--- /dev/null
+++ b/include/hw/sd/sdcard_legacy.h
@@ -0,0 +1,50 @@
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
index 4088a8a80b..7d33c59226 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -23,7 +23,7 @@
 #include "qemu/log.h"
 #include "hw/irq.h"
 #include "hw/arm/omap.h"
-#include "hw/sd/sd.h"
+#include "hw/sd/sdcard_legacy.h"
 
 struct omap_mmc_s {
     qemu_irq irq;
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 54b1414131..6bd7ed59e7 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -36,6 +36,7 @@
 #include "hw/registerfields.h"
 #include "sysemu/block-backend.h"
 #include "hw/sd/sd.h"
+#include "hw/sd/sdcard_legacy.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qemu/bitmap.h"
-- 
2.21.3

