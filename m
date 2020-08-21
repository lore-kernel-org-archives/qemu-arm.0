Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp492419lfy;
        Fri, 21 Aug 2020 10:38:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxpavmn0/kHINGgwqJSpEXWd573oilt85EjPtycedJzIXkYiRfPu9t/4O8UEJBENfl89cK
X-Received: by 2002:a25:e00e:: with SMTP id x14mr5129830ybg.263.1598031496868;
        Fri, 21 Aug 2020 10:38:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598031496; cv=none;
        d=google.com; s=arc-20160816;
        b=GgbNK77jha7iaHnwdXW7aTO+bQM5VPqKN0fTT8k6glKWSLaKOUr+O5CM4hi30g8C24
         zOhibGq8X6vrtDJcTdGwFksvRkQ8JdrZgHbnirU5mxoJw0IotIxsGLIaJV6xG10tbgy/
         VayHG/sJYMBVHaN7MR8EPXUEBU5fb21H+Lih+YqpNKFQmG7BwnCmij6k3jFe+x01ozJV
         PpSp++sN58bZ2SInYRaPrI7TANSb9r4bo5VT84owh0neDgcyzIqJb6DiEFL1oLxemgyg
         JzbqeaWl4/D4Q6Yg1SUwNfiuztYaYe7YFd0UVvtLPQ1lfv10OBeoDOyjgZeQQ92QwGQH
         /eyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KQ/YEfF3Ypebl8yU3qCopOrUVOQmWJtB56JKVnwwg3E=;
        b=ndyD9tLirLNFhBtFHha1SzNiIcfH2AwvFjnV91zCcUZnIWwY/8vZiNhQLrpNjTUVCy
         OVJVQmCdVPSX1J2FONhXKN05aYVi4Nh5+Na/6k3i9tno4w7aWZbeY7XWhCSxWpU2VUoM
         LR9Om8w0WO6V+ShM6I3sTiOab9XtjOK/OPVGVes0ObrjdlAc7yKRyHc/UlwUNESqG7mZ
         FahVoCcHuitrRUxVhgdgYbyf4CR8AN8wT4404ch8DyvulOothRPYkZUlJz3EUo7aZ8DS
         IUV/lpPW+3sU+LqQw07OC+GzyQxxrHgbnO9cwrtLWrfqdq48XRmZOoNjkMyVuTbeC5LP
         Ki2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="t/umYr00";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 79si2436195ybl.479.2020.08.21.10.38.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Aug 2020 10:38:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="t/umYr00";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:52954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k9AzY-0001c0-7v
	for alex.bennee@linaro.org; Fri, 21 Aug 2020 13:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9ArI-0001dX-Ic; Fri, 21 Aug 2020 13:29:44 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9ArG-0001Dl-Kx; Fri, 21 Aug 2020 13:29:44 -0400
Received: by mail-wm1-x336.google.com with SMTP id k8so2576569wma.2;
 Fri, 21 Aug 2020 10:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KQ/YEfF3Ypebl8yU3qCopOrUVOQmWJtB56JKVnwwg3E=;
 b=t/umYr00SyZcPvvEfQ9/PS4lw/KPvOAaaDQkO6c4VVF4ah7sFI+HK5KuFC4tJV/Y/+
 bFuGPdFmu2rt63cYiKprjOkfWMwxA+dSV/8mLI2R73S97z2EfxS9Aa09VTDf9cfIMeBg
 jwNHJPysyvNGz7wLOZakFnzF/W5NqsOUzeSAk2zJTf9EeXMq7MdS/thvgTBqCHXAxqUk
 j2H2xO0aLmmoYYvy+7N7nsg/pRwQSmWmrsZl58rccz/feMYS/DRXbOgYrr5suu61FLl7
 5P9iJ7dhxFuBaD6bV1N2o6LfuXJCaNSz4XJMHV6jDQV/7zmsY1TxUzYtuD/LBd0EK4oz
 /fUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KQ/YEfF3Ypebl8yU3qCopOrUVOQmWJtB56JKVnwwg3E=;
 b=KESNqKOc92oEZ0Qc7uSPTOgdRagPLI3XmK2dGl2gwUbQV2qVjTQ4OBvR3rH2vkJWXc
 c41iH8aAVwdKDVY7LYm4jowtgdXF5E8pSTXIW6GpUHh9XekdRryGW84ReJMXW9SpGXT/
 RE2EPPB0XQO0p3B5AdaL383Keh1QfNjeA+HUt7BuLIN6Sm+Pp+e40bcpBatywhxp+zXE
 KkilafB1at1URSF+Bis6rcYkwqor2FeuNx2L3XCwd9yDDeBjoOPt5jyFqF9tVog7dWmd
 8YKMHuNc4EiGU/fdG84RYiBsLNQHq54qrBV88L2j6wuGb9vhh3LWkcrfsDc/KhiNeq/c
 NeWw==
X-Gm-Message-State: AOAM530RsNPEwhgmscYkMdyP1n29Oaevx+FfbSEmi2eNEsoeXEw/9Lzr
 KB4ptQBt0INpRyWUoUbbvrVuEIHZZHI=
X-Received: by 2002:a05:600c:21d6:: with SMTP id
 x22mr3995114wmj.112.1598030980285; 
 Fri, 21 Aug 2020 10:29:40 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id 32sm5315471wrn.86.2020.08.21.10.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 10:29:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/23] hw/sd: Move sdcard legacy API to 'hw/sd/sdcard_legacy.h'
Date: Fri, 21 Aug 2020 19:29:07 +0200
Message-Id: <20200821172916.1260954-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200821172916.1260954-1-f4bug@amsat.org>
References: <20200821172916.1260954-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Alistair Francis <alistair.francis@xilinx.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9YnW28U2iZ9P

omap_mmc.c is the last device left using the legacy sdcard API.
Move the prototype declarations into a separate header, to
make it clear this is a legacy API.

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Message-Id: <20180216022933.10945-8-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/sd/sd.h            | 16 -----------
 include/hw/sd/sdcard_legacy.h | 50 +++++++++++++++++++++++++++++++++++
 hw/sd/omap_mmc.c              |  2 +-
 hw/sd/sd.c                    |  1 +
 4 files changed, 52 insertions(+), 17 deletions(-)
 create mode 100644 include/hw/sd/sdcard_legacy.h

diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index ace350e0e83..8767ab817c1 100644
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
index 00000000000..8681f8089ba
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
index 4088a8a80bc..7d33c59226a 100644
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
index a5ae5dccbe5..5c6f5c94f3d 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -37,6 +37,7 @@
 #include "hw/registerfields.h"
 #include "sysemu/block-backend.h"
 #include "hw/sd/sd.h"
+#include "hw/sd/sdcard_legacy.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qemu/bitmap.h"
-- 
2.26.2

