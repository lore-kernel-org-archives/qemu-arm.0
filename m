Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F311BC982FB
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 21:52:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8lrR-00067s-Oc; Mon, 21 Sep 2026 17:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lrG-000655-Vg
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:47:32 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lrF-0008Vu-3s
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:47:30 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e721b5503so34188165e9.0
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790027248; x=1790632048; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=J9CEIaPD2r/78EllzBYWRo7JKzGqzJJ/rogwaGuXtMQ=;
 b=Hq/02M40JOrmfeMScwA38zQGcnVnbvOkCK5skIQGNhkQMlen1kuKDNqIr9SB9M1RWm
 sHsJmrVXxfegUfjhlrmKeMX2ki5KEpPSds8kyjx3IrDLAg7bDKR15/hfC085FhIsHM4G
 qS7+ACko2ubuAGwPhUnOFXg/cRErdL8HMXqYGcaDgBicqpbYyU/bThg80HSFGCcwHskH
 ipwMXJZyFT1eoRXjs5oZPRBq/bGlz+fqTNxJHpdhsUbbteSN8d3jLPUCtr2vznwo5OIC
 2Z/YAHLD2sxuRBeeMd8l04iB3CtTQiCNlNsq5b/bfz7+sB8IEqZa4qE1yWG7Z1UbDYqD
 FVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790027248; x=1790632048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=J9CEIaPD2r/78EllzBYWRo7JKzGqzJJ/rogwaGuXtMQ=;
 b=TgEEvjS7r2aXWmgKiZe+Wg0hdTJ647uPlCCBC4UKeM5R3uO0pUQpX5M0zPjoeqsV8U
 oJWhOsjEXHb8mLgXMcP+EHdJ9FiL2eOJ+91M6Xw0R+Vy8eTtYYTuStdhQ5t+jSACMVis
 GhMFieL34jcoNWFvtPpsmM+RJFHFYARBdyvobZ41nQqgMke+ZJy6jHKSpGFvgpgnhqdF
 uBYAxtbIptIRA9w9EDI0x4U4GR8m3FnqTJd92DSrrTTV6NN5r1clX0dlFNe+SQD2lNYQ
 RA2vGSSmQdGqgmEwJMbKcZ+AwKcG8kFvAKBhmXsf9h5BhRGxGbE3JtQQNcgsmBvvKREo
 uNgA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxCVLWfsYLJ3BF5QpbZ+H17eyTUeICSqOc4Q4qAfuxg16CR46DSsRIFWknoCNA0kywwzurTnjhbOA==@nongnu.org
X-Gm-Message-State: AFuF++nen7DFNI8ebGJ2rWQCrqvMbi2lzjIYIlDI9+5SVWBFnr6pGIZD
 906xCicoQs26qUdCfL6/zBjV2J9tui6kCn9CwgBViPbREs8HbYq5gkwL
X-Gm-Gg: AYBFou1x84guoWmWVW8xlHVfrrwWTM8RiBM5hIg930xd6/YsinpWXEljTEp6n32Wd+D
 D6/wJn0t44pUMn9ZKSYwy+j7SspY5hg58/IAwsb30SxJL4dY6VJM3HaG/Gd/oNAGYzpnvczVfMK
 jKQWQc967F3XTUHvjLNNzxEoVw+njjiPgwmzMzBx1sDWhZ5lA+PeE6cUUilbOLYK2gxgf8zAqKE
 lX3V9XpgEN7Se2sm+mQrUB/yOb3AnB/rD2qAxt1kYE2oMjSZIdrA9b3oiodKbQxynpXM+PYoAw6
 BE/ECFVtE9QZB6mHfmGdOXdM7+Y14StcvttZG+uBA+jycFYS9H2kw69FZNqxXxGL26qeMArPY14
 TaysUTOys77Yy9kfYsbrrjScDJt8Wueyf7wVtfMPrNdwo9rSRz5HwazkAvH46kXhw2cww+pThbd
 syNRMl68hM/SqjkH+zUd+sT58sAyzIaEGImA616CmkzJlpQbCuxlLbhDmoxH/Ui9ykKrHElzBvc
 ljDYB4Dru/z7Ifk6AkzpuihCxZ8F63PNOSkJkncljQRkNf4WLzWTg9bVkt/KpDeQOxxb2U5wX7t
 wkI=
X-Received: by 2002:a05:600c:34d0:b0:49c:eb16:9fd with SMTP id
 5b1f17b1804b1-49fc5671650mr169292315e9.3.1790027247683; 
 Mon, 21 Sep 2026 14:47:27 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-1c91-bf00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c91:bf00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fda0ce29fsm4986905e9.6.2026.09.21.14.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 14:47:27 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Jason Wang <jasowangio@gmail.com>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Subject: [PATCH 01/42] hw/watchdog/wdt_imx2: Fix handling of write-once WCR
 bits
Date: Mon, 21 Sep 2026 23:46:29 +0200
Message-ID: <20260921214710.29422-2-shentey@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921214710.29422-1-shentey@gmail.com>
References: <20260921214710.29422-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::11;
 envelope-from=shentey@gmail.com; helo=mail-wm2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Guests such as u-boot may experience inadvertant reboots when configuring
the WCR register. Apparently there is a typo in the WCR locked bits
handling: The locked values for s->wcr must come from itself rather than
from s->wicr. While at it remove the redundant locked attributes for the
bits which stick to one once written with one.

Note that removing the locked attributes required a migration break. Defer
that to a subsequent patch to help backporting.

Fixes: daca13d495a1 ("hw/watchdog: Implement full i.MX watchdog
support")
cc: qemu-stable
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/watchdog/wdt_imx2.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/hw/watchdog/wdt_imx2.c b/hw/watchdog/wdt_imx2.c
index c83d4107c1..aaf4695db2 100644
--- a/hw/watchdog/wdt_imx2.c
+++ b/hw/watchdog/wdt_imx2.c
@@ -59,9 +59,8 @@ static void imx2_wdt_reset(DeviceState *dev)
 
     s->wicr_locked = false;
     s->wcr_locked = false;
-    s->wcr_wde_locked = false;
 
-    s->wcr = IMX2_WDT_WCR_WDA | IMX2_WDT_WCR_SRS;
+    s->wcr = IMX2_WDT_WCR_WDA | IMX2_WDT_WCR_SRS | (s->wcr & IMX2_WDT_WCR_WDT);
     s->wsr = 0;
     s->wrsr &= ~(IMX2_WDT_WRSR_TOUT | IMX2_WDT_WRSR_SFTW);
     s->wicr = IMX2_WDT_WICR_WICT_DEF;
@@ -156,23 +155,11 @@ static void imx2_wdt_write(void *opaque, hwaddr addr,
     case IMX2_WDT_WCR:
         if (s->wcr_locked) {
             value &= ~IMX2_WDT_WCR_LOCK_MASK;
-            value |= (s->wicr & IMX2_WDT_WCR_LOCK_MASK);
+            value |= (s->wcr & IMX2_WDT_WCR_LOCK_MASK);
         }
         s->wcr_locked = true;
-        if (s->wcr_wde_locked) {
-            value &= ~IMX2_WDT_WCR_WDE;
-            value |= (s->wicr & ~IMX2_WDT_WCR_WDE);
-        } else if (value & IMX2_WDT_WCR_WDE) {
-            s->wcr_wde_locked = true;
-        }
-        if (s->wcr_wdt_locked) {
-            value &= ~IMX2_WDT_WCR_WDT;
-            value |= (s->wicr & ~IMX2_WDT_WCR_WDT);
-        } else if (value & IMX2_WDT_WCR_WDT) {
-            s->wcr_wdt_locked = true;
-        }
 
-        s->wcr = value;
+        s->wcr = value | (s->wcr & (IMX2_WDT_WCR_WDT | IMX2_WDT_WCR_WDE));
         if (!(value & IMX2_WDT_WCR_SRS)) {
             s->wrsr = IMX2_WDT_WRSR_SFTW;
         }
-- 
2.55.0


