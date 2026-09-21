Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E86C982FE
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 21:52:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8lsV-0007FZ-7o; Mon, 21 Sep 2026 17:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lsJ-0006ug-HZ
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:35 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lsH-0000Rt-Kc
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:35 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49ccf3ca626so17606365e9.0
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790027302; x=1790632102; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GAXbRVqUmx1rSnFIBT9IwC9WlpBeKbkq+IT0XKOhuBI=;
 b=l3y6WhOQeyjzyTIh+4gmGB5PVx+MWIvlQJrc+02XEKIP4kbhkmIyTTPeEliTQA9d5m
 dl6amp17zMmiNxh/rdd0ButG/ZQtw4sHBM5L57DD2CGxLKN2iae+C1gsHN2GU4eNAWa5
 8IXn8c5urYSHsCXHV3FyDXegFO5548XEP2vpJu4DfZK6XmlN4NGqPVjSZhvIl+kkCg1N
 xVddJNDwBS4peCMV0QAEIjQvKGPAgLHqhmKbsikky7JkG8Sxu8RInilwZhMl9stJyZAZ
 u7PQiWmjaFpTpPYF7KDh9MBGhxfDFOGX/hTnA4Ca/9X4TUfgZGAWBhZ4jbaSPstemgAG
 2XVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790027302; x=1790632102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GAXbRVqUmx1rSnFIBT9IwC9WlpBeKbkq+IT0XKOhuBI=;
 b=1YQIfJYBMUiX9Js1LiMjqIRhZYxo+TBF4asDccXwjZzvIbNCsJ21V2hDmbcmRNPdJB
 GsUEuusLdcMekXGG60u1G6YvgzmATolDiGa3U+5JfzgWeMHkK4VT+PUTyA4QHjyz3Ctg
 zzFu+R6Vf0CpvTyBVzGBUNsBWk7jNZlsUvy4KG/56sZXH+2oN8cRfA9NFVeDdT0hzjWE
 LeAxAD746V5SUa8NMNfmOe6HndEIrMzTOEvY1dbgWD+5RXXaEFB5LvU8HoPqde5BQ4mL
 NgEhSFc+lZn3wwj+sU4R5whyX47lgp8uMtlxz4kQ0XsLIzD4nWfm8bcnU20st8o6UVZZ
 7oYw==
X-Forwarded-Encrypted: i=1;
 AKwUvByB39HG2jYaK/Dkr/OX3GmI39aAi2M9alhq73VG18DGo92m/qKuULRZYjGRT/UXQpNTCy42rQss6w==@nongnu.org
X-Gm-Message-State: AFuF++micQ2bjbWwQAhRBCmt6NfWVWS1aZstVLhjT7ALaGDkC0Fp+gCk
 yJcfVcT40pTpiSUbucI+VjVCQPIsMc9j6kIa6HzXP+5kkYvkL8I/2cnq
X-Gm-Gg: AYBFou1v3D9bcFKCc4GWCItO8p5dAP+rDjCkBTZPEj8mWaklCFeqHDmx5QrM7dz2Kip
 O3SzTYEjC5LxxvNThCtcm0ZvABSsGPBasI8q1CFTQhCFHhT65G0OPJZhhK6tc0Z0YiCmcEnVnjQ
 u7Mk9U8Dw2FMU2QEjFfkhcGylBnRkxnH66JTUeb+lm0sZUzum8HN20dT4ZB6lIfFoR1skqdyRIv
 aLoAOn2PuPd88WJ3bNjYIBz9gw8TPrCnn8Ds42Rg6JzI5hPuQebBtyEmbD0T7hsuyoqGQ1HUEYR
 X1MThCr6qWyIALyaXfGUK5BA9KqJrhoZBuJAxRc9tLA6uMeSdwTcrKLwOl9tk49AEKyC2OIgO6N
 TG6s8lS637jyXbakHL8ttzfdL9IfxScnFf8S9OpFAYUb04dnd3erkK0pjVEpPFrBzynvWdocMwp
 VYjPeGh4cs2nUBU3c9eysL5dG7flcuAFSyIVKhZOCNZuIUrQXYRnzYl3p86WJGKthPu74dhUzK/
 6//8h+wHMRE3hdJIkxXa0y1UHWcOWd1tQeWcnikIsnGZZl368wm3zQDa8w7fBPzfqz3urCZjTtl
 pbg6
X-Received: by 2002:a05:600c:5492:b0:49d:39:90ba with SMTP id
 5b1f17b1804b1-49fc5669330mr170297105e9.3.1790027302198; 
 Mon, 21 Sep 2026 14:48:22 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-1c91-bf00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c91:bf00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fda0ce29fsm4986905e9.6.2026.09.21.14.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 14:48:21 -0700 (PDT)
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
Subject: [PATCH 42/42] hw/watchdog/wdt_imx2: Trace with QOM path
Date: Mon, 21 Sep 2026 23:47:10 +0200
Message-ID: <20260921214710.29422-43-shentey@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921214710.29422-1-shentey@gmail.com>
References: <20260921214710.29422-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::10;
 envelope-from=shentey@gmail.com; helo=mail-wm2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

SoCs such as the i.MX8M Plus have several of these watchdog devices.
Allow to distinguish the instances when tracing.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/watchdog/wdt_imx2.c   | 8 ++++----
 hw/watchdog/trace-events | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/watchdog/wdt_imx2.c b/hw/watchdog/wdt_imx2.c
index c8ea704aa3..f5ba69ca7e 100644
--- a/hw/watchdog/wdt_imx2.c
+++ b/hw/watchdog/wdt_imx2.c
@@ -23,7 +23,7 @@ static void imx2_wdt_interrupt(void *opaque)
 {
     IMX2WdtState *s = IMX2_WDT(opaque);
 
-    trace_imx2_wdt_interrupt();
+    trace_imx2_wdt_interrupt(DEVICE(s)->canonical_path);
 
     s->wicr |= IMX2_WDT_WICR_WTIS;
     qemu_set_irq(s->irq, 1);
@@ -33,7 +33,7 @@ static void imx2_wdt_expired(void *opaque)
 {
     IMX2WdtState *s = IMX2_WDT(opaque);
 
-    trace_imx2_wdt_expired();
+    trace_imx2_wdt_expired(DEVICE(s)->canonical_path);
 
     s->wrsr = IMX2_WDT_WRSR_TOUT;
 
@@ -90,7 +90,7 @@ static uint64_t imx2_wdt_read(void *opaque, hwaddr addr, unsigned int size)
         break;
     }
 
-    trace_imx2_wdt_read(addr, value);
+    trace_imx2_wdt_read(DEVICE(s)->canonical_path, addr, value);
 
     return value;
 }
@@ -149,7 +149,7 @@ static void imx2_wdt_write(void *opaque, hwaddr addr,
 {
     IMX2WdtState *s = IMX2_WDT(opaque);
 
-    trace_imx2_wdt_write(addr, value);
+    trace_imx2_wdt_write(DEVICE(s)->canonical_path, addr, value);
 
     switch (addr) {
     case IMX2_WDT_WCR:
diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events
index b388f7b250..5963943d5d 100644
--- a/hw/watchdog/trace-events
+++ b/hw/watchdog/trace-events
@@ -18,10 +18,10 @@ aspeed_wdt_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size=%d"
 aspeed_wdt_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size=%d value=0x%"PRIx64
 
 # wdt_imx2.c
-imx2_wdt_read(uint32_t addr, uint16_t data) "[0x%" PRIx32 "] -> 0x%" PRIx16
-imx2_wdt_write(uint32_t addr, uint16_t data) "[0x%" PRIx32 "] <- 0x%" PRIx16
-imx2_wdt_interrupt(void) ""
-imx2_wdt_expired(void) ""
+imx2_wdt_read(const char *qom_path, uint32_t addr, uint16_t data) "%s: [0x%" PRIx32 "] -> 0x%" PRIx16
+imx2_wdt_write(const char *qom_path, uint32_t addr, uint16_t data) "%s: [0x%" PRIx32 "] <- 0x%" PRIx16
+imx2_wdt_interrupt(const char *qom_path) "%s"
+imx2_wdt_expired(const char *qom_path) "%s"
 
 # spapr_watchdog.c
 spapr_watchdog_start(uint64_t flags, uint64_t num, uint64_t timeout) "Flags 0x%" PRIx64 " num=%" PRId64 " %" PRIu64 "ms"
-- 
2.55.0


