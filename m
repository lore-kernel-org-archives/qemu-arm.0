Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1286757ejb;
        Mon, 22 May 2023 08:32:21 -0700 (PDT)
X-Received: by 2002:a1c:c911:0:b0:3f5:772:f333 with SMTP id f17-20020a1cc911000000b003f50772f333mr7020938wmb.4.1684769541395;
        Mon, 22 May 2023 08:32:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684769541; cv=none;
        d=google.com; s=arc-20160816;
        b=Cb206C8UdKRKO7xnnsrH1870TTFyJeUAztugemgXymMysSo2jAezs4ZOoSuqWa7OT1
         noBqNmv9TDOcczCW6xdPQxPjx2dZ0KpRF6Co3uVec2jDCjn3QebLDWgn0sHkMCqYyROt
         L1Gc6PJxBYHCIwbUQzUUr8+f1u5lA5eIQixOTlnseQgGjToh6nAsjeVyqn7ewwC5R8PO
         5XDgRX4wMBxSXb1Ry92saQwiwvFWj1/wkVeh60hfqLZppjX7MUUr6EImEtrc8Zlhod2/
         sjnVP3Z9Yey0j4FLAf/CK3dSRnk96fKmBaWobsZlw4jND7HN1wgApPUL6k2VJ5SJPPif
         VgLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PcPyr1Hd/Zw7pAX4B7gZfLX+zfoHJG12lzmzj0tU/xY=;
        b=drKOz898hVbMM8lNoSqqyy1BQCVro0wNTJhTDFUALgz7aLa0qcPdJ+Wc2DjFjRavO/
         nDVcPkGCSfg5DokLpwTxteJ9GwDpyKdGk1S4UYMAH8Vuug191U81P9UclNAiE6uxwMpk
         4OZ0uedJFiRrPXk78v7kkuY7m80Xw8ljwYD5UcTJNvZZiaCUlgXdlZ3cxxa88SpPSL+l
         O5JmowouFuXHP+PVTDIap24D7HqMMMRKDEa8v7l81gsN1OfCZcCDFwn6xuUPNg6cZM17
         4S3sLgemuJ21LIRX0qH3bCRIWWZsRierJwl3vUbkHKyRx7SxQcMKtF4N0uhe8bPExGvF
         xwjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hrPWDhgP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u8-20020a05600c00c800b003f603aeded1sor791159wmm.9.2023.05.22.08.32.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 May 2023 08:32:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hrPWDhgP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684769541; x=1687361541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcPyr1Hd/Zw7pAX4B7gZfLX+zfoHJG12lzmzj0tU/xY=;
        b=hrPWDhgPUFiBuAMhA5CDRbl9BVs8bETJD7pwCAZ5uhag+rdaBUug4RgowQqjaEhxuM
         +fSrM+tvfbW9e5Cr3eJIY9N0rjM0VQpSrg6QkPETPvt5EWGG5+jGeeLghnx4DzymM+Nu
         lR/BBDrel+DVWDmU2r/3TLcPzBDppUkfo/pccf/BWPWf+lxGSaDP2hBKILuouM9OuJLc
         arCCSLhFVSFQMASuCGNHxBnTBBj4ccKzOM2rCsCFMN3Pmpi5CbZh2ypz5pDkPkUlb5sb
         YLLcYqiwj28v1nUE8NpWeohdHCcnv8yOGJsNuvGG+y4Dke4tQBnRJYZF2ShR+WQBmIfr
         yN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684769541; x=1687361541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PcPyr1Hd/Zw7pAX4B7gZfLX+zfoHJG12lzmzj0tU/xY=;
        b=WwcebNOgiuTJyaCpM8fQ4l902zJ0tgW2AgqtwRgUVtyYDMsMyAPj/7zaHK5WppiHut
         qfARlnK4Evz4gwjx/YQxxX0yhpCq5Qd6duEUwLBCz7rQ1ZJaSQhsm4gq6VyFpD6auyRG
         H+2nVPXi9CAyxVuH3crWN0CObzEj9OeibBlwlgbPfLc74RC6KlXHRVx3gYlIHZ7nYarj
         kJ5yTTuw74wdh+p0hWtcty5kUksmCOWnsUddi03mbXLB2haVVugnGIDcF83sj3gboa2h
         06ThqTiQC3LEBb4W11p0Zc0oHWFqFOmqssYXFxO7eGdlZFmxVRUwAQH8OaKsQRrXtux4
         Tb1Q==
X-Gm-Message-State: AC+VfDxYsPB0acjd2/U8a8g7MMvS96O++bVd259N2BNHEKDk548nwTm7
	AxMyBOFSzkHH64dT8bPxWpzqCSF8c4kdu8nqtlLFfA==
X-Google-Smtp-Source: ACHHUZ41Lu1ostv+MOkaW5Ot1RWFYYpgCpfgOpbGq8Jr5VShUHgNitA0+MeQTErk6rAJ1JkJCxk0EQ==
X-Received: by 2002:a05:600c:220a:b0:3f0:b1c9:25d4 with SMTP id z10-20020a05600c220a00b003f0b1c925d4mr7732831wml.21.1684769541121;
        Mon, 22 May 2023 08:32:21 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.176.153.164])
        by smtp.gmail.com with ESMTPSA id f20-20020a7bcd14000000b003f17848673fsm8688467wmj.27.2023.05.22.08.32.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 May 2023 08:32:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 06/12] hw/char/pl011: Replace magic values by register field definitions
Date: Mon, 22 May 2023 17:31:38 +0200
Message-Id: <20230522153144.30610-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230522153144.30610-1-philmd@linaro.org>
References: <20230522153144.30610-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Vy6r2yymIZtr

0x400 is Data Register Break Error (DR_BE),
0x10 is Line Control Register Fifo Enabled (LCR_FEN)
and 0x1 is Send Break (LCR_BRK).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 93e19b2c40..98c5268388 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -54,6 +54,9 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
 #define PL011_FLAG_TXFF 0x20
 #define PL011_FLAG_RXFE 0x10
 
+/* Data Register, UARTDR */
+#define DR_BE   (1 << 10)
+
 /* Interrupt status bits in UARTRIS, UARTMIS, UARTIMSC */
 #define INT_OE (1 << 10)
 #define INT_BE (1 << 9)
@@ -69,6 +72,10 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
 #define INT_E (INT_OE | INT_BE | INT_PE | INT_FE)
 #define INT_MS (INT_RI | INT_DSR | INT_DCD | INT_CTS)
 
+/* Line Control Register, UARTLCR_H */
+#define LCR_FEN     (1 << 4)
+#define LCR_BRK     (1 << 0)
+
 static const unsigned char pl011_id_arm[8] =
   { 0x11, 0x10, 0x14, 0x00, 0x0d, 0xf0, 0x05, 0xb1 };
 static const unsigned char pl011_id_luminary[8] =
@@ -116,7 +123,7 @@ static void pl011_update(PL011State *s)
 
 static bool pl011_is_fifo_enabled(PL011State *s)
 {
-    return (s->lcr & 0x10) != 0;
+    return (s->lcr & LCR_FEN) != 0;
 }
 
 static inline unsigned pl011_get_fifo_depth(PL011State *s)
@@ -218,7 +225,7 @@ static void pl011_set_read_trigger(PL011State *s)
        the threshold.  However linux only reads the FIFO in response to an
        interrupt.  Triggering the interrupt when the FIFO is non-empty seems
        to make things work.  */
-    if (s->lcr & 0x10)
+    if (s->lcr & LCR_FEN)
         s->read_trigger = (s->ifl >> 1) & 0x1c;
     else
 #endif
@@ -281,11 +288,11 @@ static void pl011_write(void *opaque, hwaddr offset,
         break;
     case 11: /* UARTLCR_H */
         /* Reset the FIFO state on FIFO enable or disable */
-        if ((s->lcr ^ value) & 0x10) {
+        if ((s->lcr ^ value) & LCR_FEN) {
             pl011_reset_fifo(s);
         }
-        if ((s->lcr ^ value) & 0x1) {
-            int break_enable = value & 0x1;
+        if ((s->lcr ^ value) & LCR_BRK) {
+            int break_enable = value & LCR_BRK;
             qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_BREAK,
                               &break_enable);
         }
@@ -359,8 +366,9 @@ static void pl011_receive(void *opaque, const uint8_t *buf, int size)
 
 static void pl011_event(void *opaque, QEMUChrEvent event)
 {
-    if (event == CHR_EVENT_BREAK)
-        pl011_put_fifo(opaque, 0x400);
+    if (event == CHR_EVENT_BREAK) {
+        pl011_put_fifo(opaque, DR_BE);
+    }
 }
 
 static void pl011_clock_update(void *opaque, ClockEvent event)
-- 
2.38.1
