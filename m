Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp617554njc;
        Fri, 19 Jul 2024 11:12:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV65N+aR2mLniAroywehI+mnbnyxUIqK/wS1Z+Pc8SQciOK8jhiCC/bh/5zKaAUx6c+iT5JQPsyWWzdcsR0Id+tnPv15c13
X-Received: by 2002:adf:a38b:0:b0:368:4ed7:2acb with SMTP id ffacd0b85a97d-3684ed72b93mr3507602f8f.5.1721412734344;
        Fri, 19 Jul 2024 11:12:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721412734; cv=none;
        d=google.com; s=arc-20160816;
        b=dkxqY4NlhnawyFm6MSF6baq+n7x5o2qxmRlLIy4SypTYEOKu19346UU558kM7OIUtX
         dHTsPhqf5qJDMBwiIxX74jDkIOQ3cf/fUGy29Cqxqnfpv446k8CPtLCHJ5svtblqbdTn
         qLJN8A3UXTZU+rg+VsL5PPal9z36K57pyXgF4RW/qXzYsSsTz9SOytZjnS8EWEhwAzyA
         Qftg9sB10o1JG2ElXjGT1ldYYr3/rHHooB7uJ9x6ajr8Ce0Li9GlKPLs6AF8hyFAhsLQ
         3D9+Am+efLYzT7RED+6+DLLD2wRKeNHgDShaCNcdXpMSJ82WYydq6qSe+KnR5fsIQgU6
         bsiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Kzt7MO4LraScd40R9aNwzx12/7fqeBF/DeM0jkgAnc4=;
        fh=t7OmL4GaDw8NLZkESMhJ4QVvsYpHVozvAJSQAhsoWyk=;
        b=ayLF/x1YaKBZqwk++hgyr30uhOTNV6Mh89IMji+jc3CG2l9AUdM85GCHyalSZLMQWX
         LYlQEagr5n8aRjzIlxzr22tJzO44Qu/g0mGYWIreaDQmUJijG9VJpys3kZJdQWGwDq/5
         /sB13Pj9Ya1W8zvOqef95QqYVZSgmLad5D0dNX7YZZvnUyT8LW79E8+ypYuAfvyqz1BX
         WqepdBiBOixXrEvKKJrd3TS1yXJOeWjwlIOjNVaGuXuandbLsyM5FtI7cbwL4jg40pnr
         mZkEyLmAP2Az84FV/X6VIkSl+v8qDvIhqt2axd4Ci7Z+wOxyu0GC4nRaHpVLuOs1s7+4
         hbrA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E1CcZ7+c;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-427d6ff5b2csor6309375e9.11.2024.07.19.11.12.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jul 2024 11:12:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E1CcZ7+c;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721412734; x=1722017534; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kzt7MO4LraScd40R9aNwzx12/7fqeBF/DeM0jkgAnc4=;
        b=E1CcZ7+cecNCAKKVshR3zr489JkeWzU5Rtwr1fQVihggPT1fldIsKw9tIxLGn2RMEK
         rU75krQBLsnxmzzKsKL/DE0Y7UXeKV6EYsJK5EhZoQke3GSFaLuFT/LQaBQMKSEB4yjG
         Dj1zp8eFPShIgRgZBYsTlucCK4zD59YcnVIGOy2aSuH46rF1rlTbIOaNeInhRwK1IWWZ
         stX7e7lNYv4oar4QDI1xX4EjKSJQ4BGHYMhoxZqodslCDCegVxVk3CUNE+uCDeUP5uyt
         V2CPRNHaLip4whvYutHS3Bkbw0r9R8yceXo2Am5+DfSF1HWUQHWf66H57lDcxZ3VNUEk
         zFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721412734; x=1722017534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kzt7MO4LraScd40R9aNwzx12/7fqeBF/DeM0jkgAnc4=;
        b=Z2wQTIJbFmVb7r28ncRSW85lNfPEU+Nsfpc5L2GIUwOrl3dHYHpg6tDj11SlDVloXm
         q43NAOD/Q91XdcoVsCsO2klA060/LD0BrwrDx9F/negJww/kXLW+31TlsUPEftNVl5xZ
         VMcC7Pqc/kfM4vOSIKZ88NuBawLqiBu92ARtsEtNO7leT0PfUk4fQ4o7Nqe4WBx9H60H
         OojjaZBRNRglqgH3HFg4DdOofURi0eumPzO1wlPOLzi0I3FBJziCQxoe3+JruiuwhxOY
         PpIZYjWrEEVJcEpPTPNtXCY7lr5LbVAl98wpa0CxfiDVCTuyKBcABGfwRys+MCI/NGRe
         GdqA==
X-Forwarded-Encrypted: i=1; AJvYcCVzMMzZbhlkqd5FLj9WPxtcmMnVwMWs7bGxCUSv6+jGs4tEf3YZL4YmdIvZqweJkR/J3TnoaYwQuy88RMg5F5Y8UtOW0KpG
X-Gm-Message-State: AOJu0YyWT76uQ5sog5OXFOJ3rfIMmR03QLyBuQzV4+0GQ8ccp984K1PO
	S6jXVfqZSic8hv8Mc9h+TmHf0cK533lUvxcnsiX3RSWdQgXxB/eyYJSOHiEbUxjvWA==
X-Google-Smtp-Source: AGHT+IFAlTBZGNzmud28AaYdKNsP59hLbnRyUBwyNJoUflUjfuejIehacn9/40ePZEK8Z5xNXkj1/Q==
X-Received: by 2002:a05:600c:c08:b0:426:6f15:2e4d with SMTP id 5b1f17b1804b1-427c2cc27f0mr56979845e9.9.1721412733714;
        Fri, 19 Jul 2024 11:12:13 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (52.170.88.92.rev.sfr.net. [92.88.170.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a6efc5sm60849745e9.21.2024.07.19.11.12.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jul 2024 11:12:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Tong Ho <tong.ho@amd.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 14/16] hw/char/pl011: Consider TX FIFO overrun error
Date: Fri, 19 Jul 2024 20:10:39 +0200
Message-ID: <20240719181041.49545-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240719181041.49545-1-philmd@linaro.org>
References: <20240719181041.49545-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FOQ4xlSQfdY5

When transmission is disabled, characters are still queued
to the FIFO which eventually overruns. Report that error
condition in the status register.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c      | 17 +++++++++++++++++
 hw/char/trace-events |  1 +
 2 files changed, 18 insertions(+)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 6394d6eb36..b8cde03f98 100644
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
@@ -232,6 +235,13 @@ static gboolean pl011_xmit(void *do_not_use, GIOCondition cond, void *opaque)
     int bytes_consumed;
     uint8_t data;
 
+    if (!(s->cr & CR_UARTEN)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "PL011 data written to disabled UART\n");
+    }
+    if (!(s->cr & CR_TXE)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "PL011 data written to disabled TX UART\n");
+    }
+
     data = fifo8_pop(&s->xmit_fifo);
     bytes_consumed = 1;
 
@@ -257,6 +267,13 @@ static void pl011_write_txdata(PL011State *s, uint8_t data)
         qemu_log_mask(LOG_GUEST_ERROR, "PL011 data written to disabled TX UART\n");
     }
 
+    if (fifo8_is_full(&s->xmit_fifo)) {
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
index 30d06a2383..4a9c0bd271 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -62,6 +62,7 @@ pl011_fifo_rx_put(uint32_t c, int read_count) "new char 0x%02x read_count now %d
 pl011_fifo_rx_full(void) "RX FIFO now full, RXFF set"
 pl011_fifo_tx_put(uint8_t byte) "TX FIFO push char [0x%02x]"
 pl011_fifo_tx_xmit(int count) "TX FIFO pop %d chars"
+pl011_fifo_tx_overrun(void) "TX FIFO overrun"
 pl011_baudrate_change(unsigned int baudrate, uint64_t clock, uint32_t ibrd, uint32_t fbrd) "new baudrate %u (clk: %" PRIu64 "hz, ibrd: %" PRIu32 ", fbrd: %" PRIu32 ")"
 
 # cmsdk-apb-uart.c
-- 
2.41.0
