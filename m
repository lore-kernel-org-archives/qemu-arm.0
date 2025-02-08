Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp976552njb;
        Sat, 8 Feb 2025 08:39:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX/DZS/0tYd0WKhkMkR7tZQMmWjrXnlV9z2VnAOv047syLYAo5jzfNLkXiwwKDEe6r8l4c1Ca4NBMhxZw==@linaro.org
X-Received: by 2002:a05:600c:a085:b0:434:e2ea:fc94 with SMTP id 5b1f17b1804b1-439249843b8mr75608555e9.11.1739032781003;
        Sat, 08 Feb 2025 08:39:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739032780; cv=none;
        d=google.com; s=arc-20240605;
        b=jzLxwl49twLUttKuINLO6Y/+fUv1ZCF0pNw13b4w7S4Cv0jqzZbBzVWxCMq3tfRKuh
         L5H6cyhkWcNp2JGirvu7fSn8J0NKt8nfCUGdJwy55jZ5CX23OSyF5UxBIlfElAr2/0ys
         RXL+JQrZnue5TGP1h9+ZAQWSy2gSDtBJ5L3WmMvM5nZFncgjws+R1EfsxrmDogTisoaL
         AQrRj7G190LaU6SHJ29Ws8NHZ+QzBoWv6v4izeKVZiVQtTxYII80b34FVq9Vvm7DOPft
         K2nr87+CNNSlrgFY8nRE06XDsbnPSlpVa/QlZm/KyWZL14BUz6UmMIIV9MkFd0pkCmlS
         BJLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=k3jwnJ8U5C1FFKFcPCQMKp4F/bw0CDqtfmKmUBOfDPU=;
        fh=rNRLI7IxhZNBoc0GlJFvwusyOVrHyobHeLU2Mvog51I=;
        b=htwUu4tdoXCbegeYpoP1Myt3gSRZZno0sYitMn3g/9JY7psvz2+TFBcEEXq4U8YHom
         e8WlRQzPp9Am+n5QcRL7BKpWSM5RTe3/aM9jQFgaocMJb2UOiYuqXjrxedoWYFCqSoAU
         sPXi0bSQeSOqdKqiFIkA8q4cAiorptjBmFsHgsApU7D5y26p+Oqz2XhDr9ZQv0mQz6H1
         uo7VK0oeMMMn9qHhH58fB4oCmvn+ejSbzsCv0uGs5WFHgRukYT9RWjn7UuGdhcVwb9QD
         aYCJ3K3dbwgGuf+rbaksY7T8pmeM/Ye7LkrByzIJXB6PzR08IuNsuABaoAY3b12vhniV
         V4CQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AWSQESOF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43923ff2813sor15348485e9.9.2025.02.08.08.39.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 08 Feb 2025 08:39:40 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AWSQESOF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739032780; x=1739637580; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3jwnJ8U5C1FFKFcPCQMKp4F/bw0CDqtfmKmUBOfDPU=;
        b=AWSQESOF4szNiAPgj3/CkHNvdqvzygC+Nt/r/PZgmwuSGU81FmBuZKq+XVRO/kVElB
         k7K21n9E/jj8Ho6euV4cQmPN7n3zwV3jxMKZH4tnJ4sMNI54lAht/x4NSn6flTfQOUNn
         wkj8EkX8MvLPqZsQBsBoXvnL/bcFXY+EiNW9Rf0VsDbNQdAZKj5FOrAVwAwAgFtwpvTX
         dM0a78tz2l9A5tvaRgyvWMzbl/ibRUWK4V2+CIxv26IdackVT8J/mP72RINvyqbK53YV
         JbJQ3adb4qQXmob8xzwaoWP2XA3USisuZXoCZSUH0p4tpAQ6TQsQrZoi0+3t3+HY+A8K
         MWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739032780; x=1739637580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3jwnJ8U5C1FFKFcPCQMKp4F/bw0CDqtfmKmUBOfDPU=;
        b=sBdAyv0lnJpDCVT/L48FFKU6MyFF5y8ujJG7lGi3CKw+Uf7F1F2tlV0dHcqOXGn3OC
         Nx07S+jFNuz6joSidzwaQY7zh4Mt6XGYD67nUP5HJo7pC2FT0aoBpMY+h1Fj4iDNGTHj
         zwsrjEBLLqoRXKxOxabT2WFA1ApJ72V2j6m98DVolzYyxyUMSRjitjhJLEK/eujoCb6U
         5jogQ4ZndtigveK3wbKUsNgt+CHoROcwhEY+EGxjrpV9HKHUnp2ECe4B2bVNAnlYtbZi
         5g7jRkugjC1kFK9pl2Oh3K+Z/w+WZALywi2UjLpo1X9csRfFkyWvaNgmFjo1OvV5ovds
         AvXw==
X-Forwarded-Encrypted: i=1; AJvYcCU7bxxsdvLKXTKEYBwXxdxwkVkU3/ZhqhTYVLH+m9bCHD5aM4Ytlr9BgV8ev+Z78BzM0YCnutvJtJIZCQ==@linaro.org
X-Gm-Message-State: AOJu0YwSm+z0ItN/iEEHQOvTTizKhtI8IvJIFwTqqTtV1QFWAomlByqf
	KP6Oyk9z+slB9GwDOzTD8K9x+5YiAXey/S8KihhnjRjPLILkEe0VFTzn9fLyPTtvfOmirzNuD/T
	4solbdg==
X-Gm-Gg: ASbGncuAvt7x0jGpQAoxO65ItEtvm728nBZXrofEoOsfpxE2gEwC2P0HPDUDpO7Q9Sh
	dj8EkLdJnQA/QTnOef2HXTZmhv7NKuMGDczyy6anx2EjWfNfuz0t7o/rJnBI6ZL3cqF9i29JL1+
	bJh6RvD5xSUAxdyyBcjFTKzLYa54eYorKnO8SRxQOfgrEOLpJwnJMU6hd8+it6c3xZlSff5BYdr
	xO0YoZfNnEPnn/mH2gRNp5I2LuGnrMLJ4Zf1Z46ZSHoFT/Dyaep5ucTJfZTsCZ0LxiKjMntinKK
	h2EMdVExixZAsaDpfzY7BeJ/Ut9JVZ1MY4a+c75NvHswD0Jiy22gut2GzLb0ihDdAQ==
X-Google-Smtp-Source: AGHT+IGiNbPF0hpneHG2b2A0Hn0xLt9FrKz3WmDdZusUAVuNNTx1ruYM+CySYBMFZZ2UaThcWdrCkA==
X-Received: by 2002:a05:600c:4e0f:b0:436:1b7a:c0b4 with SMTP id 5b1f17b1804b1-4392497d53amr49853725e9.1.1739032780459;
        Sat, 08 Feb 2025 08:39:40 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc9ef8ac6sm4922432f8f.27.2025.02.08.08.39.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 08 Feb 2025 08:39:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 5/7] hw/char/pl011: Consider TX FIFO overrun error
Date: Sat,  8 Feb 2025 17:39:09 +0100
Message-ID: <20250208163911.54522-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250208163911.54522-1-philmd@linaro.org>
References: <20250208163911.54522-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QbqY4vIx8qO+

When transmission is disabled, characters are still queued
to the FIFO which eventually overruns. Report that error
condition in the status register.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c      | 20 ++++++++++++++++++++
 hw/char/trace-events |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 447f185e2d5..ef39ab666a2 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -61,6 +61,9 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
 /* Data Register, UARTDR */
 #define DR_BE   (1 << 10)
 
+/* Receive Status Register/Error Clear Register, UARTRSR/UARTECR */
+#define RSR_OE  (1 << 3)
+
 /* Interrupt status bits in UARTRIS, UARTMIS, UARTIMSC */
 #define INT_OE (1 << 10)
 #define INT_BE (1 << 9)
@@ -158,6 +161,16 @@ static inline unsigned pl011_get_fifo_depth(PL011State *s)
     return pl011_is_fifo_enabled(s) ? PL011_FIFO_DEPTH : 1;
 }
 
+static bool pl011_is_tx_fifo_full(PL011State *s)
+{
+    if (pl011_is_fifo_enabled(s)) {
+        trace_pl011_fifo_tx_is_full("FIFO", fifo8_is_full(&s->xmit_fifo));
+        return fifo8_is_full(&s->xmit_fifo);
+    }
+    trace_pl011_fifo_tx_is_full("CHAR", !fifo8_is_empty(&s->xmit_fifo));
+    return !fifo8_is_empty(&s->xmit_fifo);
+}
+
 static inline void pl011_reset_rx_fifo(PL011State *s)
 {
     s->read_count = 0;
@@ -264,6 +277,13 @@ static void pl011_write_txdata(PL011State *s, uint8_t data)
                       "PL011 data written to disabled TX UART\n");
     }
 
+    if (pl011_is_tx_fifo_full(s)) {
+        /* The FIFO is already full. Content remains valid. */
+        trace_pl011_fifo_tx_overrun();
+        s->rsr |= RSR_OE;
+        return;
+    }
+
     trace_pl011_fifo_tx_put(data);
     pl011_loopback_tx(s, data);
     fifo8_push(&s->xmit_fifo, data);
diff --git a/hw/char/trace-events b/hw/char/trace-events
index dd635ac6012..8234f3afa13 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -67,9 +67,11 @@ pl011_fifo_enable(bool enable) "enable:%u"
 pl011_fifo_is_enabled(bool enabled) "enabled:%u"
 pl011_fifo_rx_put(uint32_t c, int read_count) "new char 0x%02x read_count now %d"
 pl011_fifo_rx_full(void) "RX FIFO now full, RXFF set"
+pl011_fifo_tx_is_full(const char *desc, bool full) "mode:%s full:%u"
 pl011_fifo_tx_put(uint8_t byte) "TX FIFO push char [0x%02x]"
 pl011_fifo_tx_xmit_used(unsigned sent) "TX FIFO used %u chars"
 pl011_fifo_tx_xmit_consumed(unsigned sent) "TX FIFO consumed %u chars"
+pl011_fifo_tx_overrun(void) "TX FIFO overrun"
 pl011_baudrate_change(unsigned int baudrate, uint64_t clock, uint32_t ibrd, uint32_t fbrd) "new baudrate %u (clk: %" PRIu64 "hz, ibrd: %" PRIu32 ", fbrd: %" PRIu32 ")"
 
 # cmsdk-apb-uart.c
-- 
2.47.1
