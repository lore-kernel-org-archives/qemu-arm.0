Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1351321eje;
        Mon, 10 Jul 2023 10:51:29 -0700 (PDT)
X-Received: by 2002:adf:ef0e:0:b0:314:1e47:8bc2 with SMTP id e14-20020adfef0e000000b003141e478bc2mr13833478wro.0.1689011489453;
        Mon, 10 Jul 2023 10:51:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689011489; cv=none;
        d=google.com; s=arc-20160816;
        b=m0SwrlmIV0yxdPdIvkaQ8/4qmUPcraLtjHYF62YEraPB+FIVYmgLCy3npT9jmqh5ws
         eWX2HSulC1b2Zm7C6BQlyJz2z3w4WWcMkCUAbIchBimX3KrTvZb6Z6V28BObbjZ4Ewe0
         N0QmXGRwGM8M9yq4fVoB7XQ0xTxDXn2ydTI6/sNSMBhvBTH8BSIr3PY0u6mVvVMb+8ao
         E3qT3QC8GM6dGu0mgGo0oSuw8D6++dbBaWjKF1G+7P4Z95aougEqLiZI+GjG5YTdb+yO
         8FSNUYcIL0DjoYKNjBA8Ku/FTl1bm/f1z9i6hhQ34YqtXVozUKakCEmc63ZmqFTeNmWn
         rp5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5e/SO+N+RtoeTP991orha9zplbwHg+c4RLGUXXBx0k4=;
        fh=4TWVGTMFk+XB48cTX7H3L2FEUZf3X6lSQ5h15kr1III=;
        b=BAVwsG/WkGMOMbizBZxxud80bleqGzi332xgedRGWyULL0fZdMVZzK9PDy6ZQNpgmS
         8ra0mF1yYeHY4n6NilJQmGRXVKoioJaPMZmdhhJHxIKpsGAYNrsqpbZdqwoGG99T79hZ
         bNDqSEGFcWatBwKYYOFcB4a8kKaJUrw3zqkOeq9+z3Mtdtern4pHvvzjo7UWLV/Vx+dJ
         Yc7RTasvq4zcPNq1g655v06vMgkpIDxb9jSzN7KLkg7n6ctInoaTlzjRPoidNbEeGbYJ
         3I1bYRT/8pumBUQI9FEbO0F5Q2erXGk+0xwWlDGIpb3DvNqWatNsG+A3aji9anUIa18D
         K+eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l1to8dCq;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p1-20020a05600c204100b003fbe4cecc58sor57493wmg.4.2023.07.10.10.51.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Jul 2023 10:51:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l1to8dCq;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689011489; x=1691603489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5e/SO+N+RtoeTP991orha9zplbwHg+c4RLGUXXBx0k4=;
        b=l1to8dCqQMacVHqlZnoIvGbQ57CXMQdasA54stxvsEmNLwwh3akC+e078Wl7OxrXi6
         2U7oyu7bcwuXqghuoNUsE4H0+0TpEhAXbmNlL4a2SQeuACisCQOAUPo8IpErTzEL37Tg
         uAXOsWG4bnorXqmr5Dj8/DanfwTLTJoFOyTLE+mY3H/L/8IIE4epH/CCtLGKqIvSkl99
         NzUu1WR3S84/KACbsMdOfOMMCmKb4R3Qu/NJ0cKOn+KxiLH4q8BuX1JV9THt5DSMcFPI
         wdIulnYs/D/bjxlkFf2QWrLqU8DjHJ8zXeenUP8YbN0jVBu/qsxXunYGq/Jw8XPAvwmI
         U2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689011489; x=1691603489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5e/SO+N+RtoeTP991orha9zplbwHg+c4RLGUXXBx0k4=;
        b=cfXRiPF6o3W7oE69+oA0gMtCiQXh+DiyVJAW3QE1d0qDvaxwiqM2wZ0gCbMs40anVY
         S1XiWp6nIpQ7KQ6CezPIOMq4ZjNl3498lkXtpv5xINkXmQrVwvW5oDbEPAoIHmzZsOJO
         BILwLy6RmWOBOombfhP5X2cspcSihmsHMXf69YqPrZytQRQnw/I6kVNXet4pqJ0n7rD7
         nUFr3jVh/4zqA0V0dkKm9Y/D92avu+ilYvAYTvyt+20v12WD7EBbLxdovXq3/dYMsMPJ
         KA9Xu5Z+qhhDjEMZK71OZIs4N0q1L3dolZT/9SHfibRs0SwTc7jf+oRuP80hNtSZUeGq
         DpeA==
X-Gm-Message-State: ABy/qLal6gVJ4s454Lg+KD1IyXnIQDRH738d8C0XXxTcGFVpxy5xh2uN
	pt9yzHaR3bfNg9OmKrZ5qdaFbq2C3Dzuu9THuEa553QO
X-Google-Smtp-Source: APBJJlGETkW6jonw0dwOMG9CLw8/pMo4Dtvltzj593tgf7jvZGD6BUaWE0iks31FZneLuDq9t3Pb5A==
X-Received: by 2002:adf:ef0e:0:b0:314:1e47:8bc2 with SMTP id e14-20020adfef0e000000b003141e478bc2mr13833467wro.0.1689011489220;
        Mon, 10 Jul 2023 10:51:29 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (mst45-h01-176-184-47-225.dsl.sta.abo.bbox.fr. [176.184.47.225])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600000ce00b003062b2c5255sm36246wrx.40.2023.07.10.10.51.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Jul 2023 10:51:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gavin Shan <gshan@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 04/11] hw/char/pl011: Replace magic values by register field definitions
Date: Mon, 10 Jul 2023 19:50:55 +0200
Message-Id: <20230710175102.32429-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230710175102.32429-1-philmd@linaro.org>
References: <20230710175102.32429-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Y88JgWwB0RsX

0x400 is Data Register Break Error (DR_BE),
0x10 is Line Control Register Fifo Enabled (LCR_FEN)
and 0x1 is Send Break (LCR_BRK).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/char/pl011.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 96675f52cc..58edeb9ddb 100644
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
