Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5071766ejc;
        Thu, 31 Aug 2023 05:59:01 -0700 (PDT)
X-Received: by 2002:a25:790b:0:b0:d53:f88a:dc09 with SMTP id u11-20020a25790b000000b00d53f88adc09mr5323713ybc.2.1693486741380;
        Thu, 31 Aug 2023 05:59:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693486741; cv=none;
        d=google.com; s=arc-20160816;
        b=wY5gOj3enbcLzMG8qeKcJavZSbxHL4ATdy/DnWhF0ZaeDkwAHCa7xRj6Y1yrJth5X6
         CqsFT3ZeYcEaCN1WySxa3nTWv1LKA7VpSbUPcPNbA/s233ZeqWPbiMCK48pMUPWDcC05
         OHpr1fjW7lR26rZjiA3LX0kJA94KWMmuIO3wqJrvt4wxJjxyhwknOGX/Ho88Ea04GI5N
         Z2S8iY6WtCw0RIplxkqXfXDdoeJsbrKtRC3aO4f8HHu0W9zus8JXtCmA5I03jEEUTpEE
         7/fe9b6L1RIOXZrUMdzKdJzVW7rLJA3uEkAjsKUlNsSS1AvDdmHRWZVcVbYwl8Jo+AkK
         eR4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hQQOLonhj1lfjw6EyIeNwvldxW3rnJRehE92SZcD36E=;
        fh=C1g9WbLYbqb5ZMWGblSPCb82pDI9M8ifDDaJhEe0Xjk=;
        b=TRDAmhl16kNr2DzAGiYKdd0QFJ1FaSgFmIZB8/kEfgPjTZBeDkiRrnP13WxTq7aGeW
         GPAkTW4pBSz2xDZq8wYIMUmqf2fASKaOEYqz2I+RuA6zbYyvPZsBgZ3hOQti+DxhafTL
         3yhjlQW//UyZ7a8qySC0dunWrpZDy1jOTRCjZ5xgoE5ARFIo543KfVfKJpp4NVwe75Bx
         7Q4uhXP+bN6/6cuwLnAYf1TmmN56ulRHVzbF7IVNLUgidDYYtpMGJ5pwRr/MeCYbe5L1
         mh1IfqDh/BdQ+YB1UzeuRNB1xVUdnI783N/G5La/bKefFicoXdQ0n7pr+f28NVEjsb+i
         Smbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tPMWW1Lg;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y12-20020a25320c000000b00d7822afee90sor418994yby.14.2023.08.31.05.59.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 31 Aug 2023 05:59:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tPMWW1Lg;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693486741; x=1694091541; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQQOLonhj1lfjw6EyIeNwvldxW3rnJRehE92SZcD36E=;
        b=tPMWW1LgcI4a7tZVPu9Yacmz6ecapdAKai9FHxd5vfw4HXtOe+ZyhGEPoXsTHhCsgX
         iT15JSPE2/vdy4fpj1g8oByL0lPkK0fxSCaY/Rub15+Tx+IgwQqamZwRFhociatKoALR
         0YzklMZtK3tKzNKlo+AzuEJkR09wrttEjYX835aCBAUAuqHqfSyIcmllmjJgNU0ZxqD1
         +A7IW2kJ65XgqD8pg43UTgib8KRq8rAjuxLaRzSLkTtU5JzFCILIYIwqPquMIYaQmWxW
         8b7JUZfKugef++ddalA2dVsDHL1INJpH6BbV/HzJp/x4u0t0cpjAfqAg57EPBt6iQE/c
         mniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693486741; x=1694091541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQQOLonhj1lfjw6EyIeNwvldxW3rnJRehE92SZcD36E=;
        b=ICiFi8Sam3khSfNPRhwcl09D6l709DyS9DHa5+iPUpZtnZACLU+xnvMoEkefz8uyfo
         PSLLAdbSpYN66hwNQ8xtRnLcr1l78KMvGKDoTvkwKBNnU2sWk3zr1/quWy7rrVrxiKnn
         7uoUKRT3cO46KTVEHushe3EPpB6VyGabyqOSlYLj9v9o3x3UFiAE+SXdKwJ465Q2zEx+
         cXh/ld5HYpLQgxut/TCF847VL9KOiARmaZn0H+B9Oy1z6ogTtEy4kO6wBsfYARvm0fy1
         xWd/SKjKnTevFE44ayyXVSZZllyTSG3bciy9hJtzfHHVRQ95wf6KYz99Jnw3lnGH2vAi
         DUrA==
X-Gm-Message-State: AOJu0YzQNxc7dnXjwu1iPzjaKiiyoDSSpVdrjguGrXbePyv7w/A64VUs
	w3ecYGEh7iLn4veqMhO3p7SGl852
X-Google-Smtp-Source: AGHT+IHRdJjheQLIpok6Yi9baSoqDy0y/6oV8Ui/S1tIDsKXPe6Z/j8aJ8l4Tu+zzQ3bF356181nzg==
X-Received: by 2002:a25:d20a:0:b0:d0f:6f1d:89ec with SMTP id j10-20020a25d20a000000b00d0f6f1d89ecmr5473933ybg.35.1693486740963;
        Thu, 31 Aug 2023 05:59:00 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.199.245])
        by smtp.gmail.com with ESMTPSA id i85-20020a25d158000000b00d74c54dea92sm298458ybg.25.2023.08.31.05.58.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 31 Aug 2023 05:59:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-block@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 22/41] hw/char/pl011: Display register name in trace events
Date: Thu, 31 Aug 2023 14:56:24 +0200
Message-ID: <20230831125646.67855-23-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zfdODWyTYMIt

To avoid knowing the register addresses by heart,
display their name along in the trace events.

Since the MMIO region is 4K wide (0x1000 bytes),
displaying the address with 3 digits is enough,
so reduce the address format.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230522153144.30610-5-philmd@linaro.org>
---
 hw/char/pl011.c      | 25 ++++++++++++++++++++++---
 hw/char/trace-events |  4 ++--
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 73f1a3aea2..c3203e5b41 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -51,6 +51,7 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
 #define PL011_INT_TX 0x20
 #define PL011_INT_RX 0x10
 
+/* Flag Register, UARTFR */
 #define PL011_FLAG_TXFE 0x80
 #define PL011_FLAG_RXFF 0x40
 #define PL011_FLAG_TXFF 0x20
@@ -76,6 +77,24 @@ static const unsigned char pl011_id_arm[8] =
 static const unsigned char pl011_id_luminary[8] =
   { 0x11, 0x00, 0x18, 0x01, 0x0d, 0xf0, 0x05, 0xb1 };
 
+static const char *pl011_regname(hwaddr offset)
+{
+    static const char *const rname[] = {
+        [0] = "DR", [1] = "RSR", [6] = "FR", [8] = "ILPR", [9] = "IBRD",
+        [10] = "FBRD", [11] = "LCRH", [12] = "CR", [13] = "IFLS", [14] = "IMSC",
+        [15] = "RIS", [16] = "MIS", [17] = "ICR", [18] = "DMACR",
+    };
+    unsigned idx = offset >> 2;
+
+    if (idx < ARRAY_SIZE(rname) && rname[idx]) {
+        return rname[idx];
+    }
+    if (idx >= 0x3f8 && idx <= 0x400) {
+        return "ID";
+    }
+    return "UNKN";
+}
+
 /* Which bits in the interrupt status matter for each outbound IRQ line ? */
 static const uint32_t irqmask[] = {
     INT_E | INT_MS | INT_RT | INT_TX | INT_RX, /* combined IRQ */
@@ -191,7 +210,7 @@ static uint64_t pl011_read(void *opaque, hwaddr offset,
         break;
     }
 
-    trace_pl011_read(offset, r);
+    trace_pl011_read(offset, r, pl011_regname(offset));
     return r;
 }
 
@@ -234,7 +253,7 @@ static void pl011_write(void *opaque, hwaddr offset,
     PL011State *s = (PL011State *)opaque;
     unsigned char ch;
 
-    trace_pl011_write(offset, value);
+    trace_pl011_write(offset, value, pl011_regname(offset));
 
     switch (offset >> 2) {
     case 0: /* UARTDR */
@@ -252,7 +271,7 @@ static void pl011_write(void *opaque, hwaddr offset,
     case 6: /* UARTFR */
         /* Writes to Flag register are ignored.  */
         break;
-    case 8: /* UARTUARTILPR */
+    case 8: /* UARTILPR */
         s->ilpr = value;
         break;
     case 9: /* UARTIBRD */
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 2ecb36232e..babf4d35ea 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -54,9 +54,9 @@ escc_sunmouse_event(int dx, int dy, int buttons_state) "dx=%d dy=%d buttons=0x%0
 
 # pl011.c
 pl011_irq_state(int level) "irq state %d"
-pl011_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
+pl011_read(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x value 0x%08x reg %s"
 pl011_read_fifo(int read_count) "FIFO read, read_count now %d"
-pl011_write(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
+pl011_write(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x value 0x%08x reg %s"
 pl011_can_receive(uint32_t lcr, int read_count, int r) "LCR 0x%08x read_count %d returning %d"
 pl011_put_fifo(uint32_t c, int read_count) "new char 0x%x read_count now %d"
 pl011_put_fifo_full(void) "FIFO now full, RXFF set"
-- 
2.41.0
