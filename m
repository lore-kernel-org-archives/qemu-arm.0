Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp867440njc;
        Sun, 9 Mar 2025 18:28:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgicUk9CTaYoAigq+BtlXzRFS+gfQxG5PS8nfr0Fr/MUA8pG6vZwBr9pCcK1uHoPhdJWk+rAW9tizVGQ==@linaro.org
X-Received: by 2002:a05:600c:558c:b0:439:91c7:895a with SMTP id 5b1f17b1804b1-43ce4ace4abmr45375695e9.7.1741570136498;
        Sun, 09 Mar 2025 18:28:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741570136; cv=none;
        d=google.com; s=arc-20240605;
        b=SbHQbmUP0WGtuEfAjUWSi3kbtp5wwz62lzPUVaeQW9i26NQhrAEk1PU01qUNVkEWvx
         /WwwPL+o9mx6kQ2qx4vjIdezbi4l2cB2d4PY5J6WvVGsDvZ8C7QWqe7zA6A8epcvefS/
         KPnKSxjyZeyIRFeha+XSHSTn7bUw2sAmXZldCQUTFc7PfXVKBiHaC7mZwjgZ9s/Q1y7u
         +cJxyNamKhujrIm7+5yd4OmwfswhjL7RbrfXRp8LppOMP7HcggWu1OoM4gwiKRQ11XCj
         3OUoPVvzXC9+WPppN4moGp/I0NujDiEoh7OuzQjC8dTdNWMOfvzu47BO2NnSr9EGHbXW
         pM+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6mdjFtYQM1H0sW4TtB9D0TGJccy9eC3YWJZP9lSZSPQ=;
        fh=u10MhYoK6IW+f83Y5CuThvI2FaWCMqDBElIvtwJjWsc=;
        b=P7zouxz/C4hgcRZ00UOqdxxRvPP8FhBUJCJp2ZmiXTYLQI5qItBF+aHlqDDJ2DtqD+
         EV0w5iSL56aJLAy6h53HmU6w3blrLPPmQDXTmj0MjO01Hf/Plbez/vwaz19i4jQRvvjW
         o5h6em9Eio4OEE350MyvQHQE+lNtHlvRHiFfL0yxc8shS+uGnghlcXgDgLLrQ1JU16ZO
         j7xiBo1hzjcTuCfeFAzCjrPkpiq7KoJ2Kkf9JDHvK2ryEQQy88aDMae7kc3+JtFnCT45
         ToWgs8Zo1tPjc9C8+40t8t4WyJL0rANJG6FkT9RjedMYzoC6r52bsdDRRS6vwyRVRIaU
         Q1BA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xSR5gv8c;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43cfba46713sor593495e9.1.2025.03.09.18.28.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 09 Mar 2025 18:28:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xSR5gv8c;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741570136; x=1742174936; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mdjFtYQM1H0sW4TtB9D0TGJccy9eC3YWJZP9lSZSPQ=;
        b=xSR5gv8cYqzLNrrKdh8m8pwJdTDSrwXmlTH0dY0SrPAYt5IB+2S7Wc5tQAvLj0uO3g
         bsJZcLEsNI/qHufmfH8Hzh+2QNzYOhajABQ1DfnXEGIWGPCLIgJVX+Cj88LthoFR1luB
         4Mw02P6GWR15OlSQ0FuS+r6hCbmMKjJyXyrvLUVxWtb9zerGLuK6F3oICEGywmTRu4iq
         jnYeWZ/MeCZJ2IVmMJFZxsiBe5ESlEC4a9UyU9rchQyUrntq+tQ5RDy6Kkl265X98OyA
         1tpDx2cv+H5xhitmEubTOqad8IzlGJPryTSw/TKpvV006E5CDDtYJG1nCSTdgZWMCAZw
         G+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741570136; x=1742174936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mdjFtYQM1H0sW4TtB9D0TGJccy9eC3YWJZP9lSZSPQ=;
        b=vdoF6AwYIaeFXu8cFWaDzixRu6M/6/1sXJKmA6Kf/akoMTDU2MCDo5tneOenyjvFhu
         5BSC9FLbJ9bCcs/Rig+64kD7kgakt5WTTK+LnXTkgfBLIW0ilFWsAmM5Oz08qR8VQSht
         znbTXbtHezXkfoxKbI3fDdjd5QqvyIf442p9lB+C8RSJ/JKFtoFqQOukak9wERA+uI0o
         i4nbh5xDeSTtUWJxbjSEuLrO/oxyQJvZ+c8UUsC0hwaHWOI0//tmWL8cauN6wvoAWeu0
         4/6I9Ea6jhv0+mTK8inoV3mLB30oS7unspdkXhyVoE+LYKoXPO6bS0WacDJx+LzPFD51
         qwPg==
X-Forwarded-Encrypted: i=1; AJvYcCWpQ6TNs7+AVT3+x7/KUFAiee9277fgDeybmm45OlMlcwXE6JLqIV97ryzfH/12ohvhgBZrcUZ5C56YbQ==@linaro.org
X-Gm-Message-State: AOJu0Yxuf+jShF5tc0q/Z4oBWhpWABHBh1wVokgU4w7VJODIZz238ZUk
	Xa7AiOP3ot0sS0pxfOIqO6m8rfKymBlF8ddp+gpvBO4RhxpSwlDcbJyLHsMzO37DyA==
X-Gm-Gg: ASbGncsQyNv+p8MJJxEULEZ1fZmQt3rFNSLdw98wvbgo/zoJ3shJXNKNmbWMycdYHtj
	Rp/6kypY/dB+wpb+0HAgkxI/65+e9RwSbdNjBR8RWXgHl/GGzwAyoFCtn8LBbCFUXcUANkShS6m
	RiIzx00v/KYBXJqpATaYfxe01KBr0c/7WBJfoeVUENN+m4T63sU5EZjRw3s4GVooWOVkqTzJ+nl
	KP6U77/NkmlDCCfbYzSJ8M32PUO0/WtC5yD1NdvmQMuUD1cVMIeMqEY8Imj1OGzMn/y7QFRFvIe
	psSXY8h0iiOT9uyoYknKxDHTJFB2oMYsG8Wzeskilbw7CcqVlqBDCom9BWJuIf/EOo4FkvSQZQ7
	Ox5L2WJkJF3HrOyg5zTY=
X-Google-Smtp-Source: AGHT+IGphJAcD0hHs9UVKSzIESU0UZmz+rBU6+wpQxVMMaLI67PcRhQxTFZwaPkKhax6w6i6hAIsrA==
X-Received: by 2002:a05:600c:1c95:b0:439:98fd:a4b6 with SMTP id 5b1f17b1804b1-43ce4dd7f59mr42259595e9.15.1741570135956;
        Sun, 09 Mar 2025 18:28:55 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb799fsm13221355f8f.2.2025.03.09.18.28.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 09 Mar 2025 18:28:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 5/7] hw/char/pl011: Consider TX FIFO overrun error
Date: Mon, 10 Mar 2025 02:28:23 +0100
Message-ID: <20250310012825.79614-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250310012825.79614-1-philmd@linaro.org>
References: <20250310012825.79614-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: wQ4wFwu8TBui

When transmission is disabled, characters are still queued
to the FIFO which eventually overruns. Report that error
condition in the status register.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/pl011.c      | 22 ++++++++++++++++++++++
 hw/char/trace-events |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 34a5cb3af5d..f67ce951ac9 100644
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
@@ -157,6 +160,18 @@ static inline unsigned pl011_get_fifo_depth(PL011State *s)
     return pl011_is_fifo_enabled(s) ? PL011_FIFO_DEPTH : 1;
 }
 
+static bool pl011_is_tx_fifo_full(PL011State *s)
+{
+    bool fifo_enabled = pl011_is_fifo_enabled(s);
+    bool tx_fifo_full = fifo_enabled
+                        ? fifo8_is_full(&s->xmit_fifo)
+                        : !fifo8_is_empty(&s->xmit_fifo);
+
+    trace_pl011_fifo_tx_is_full(fifo_enabled ? "FIFO" : "CHAR", tx_fifo_full);
+
+    return tx_fifo_full;
+}
+
 static inline void pl011_reset_rx_fifo(PL011State *s)
 {
     s->read_count = 0;
@@ -275,6 +290,13 @@ static void pl011_write_txdata(PL011State *s, uint8_t data)
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
index c857f4c4b38..d52f511a1e2 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -66,9 +66,11 @@ pl011_can_receive(uint32_t lcr, unsigned rx_fifo_used, size_t rx_fifo_depth, uns
 pl011_fifo_enable(bool enable) "enable:%u"
 pl011_fifo_rx_put(uint32_t c, unsigned read_count, size_t rx_fifo_depth) "RX FIFO push char [0x%02x] %d/%zu depth used"
 pl011_fifo_rx_full(void) "RX FIFO now full, RXFF set"
+pl011_fifo_tx_is_full(const char *desc, bool full) "mode:%s full:%u"
 pl011_fifo_tx_put(uint8_t byte) "TX FIFO push char [0x%02x]"
 pl011_fifo_tx_xmit_used(unsigned sent) "TX FIFO used %u chars"
 pl011_fifo_tx_xmit_consumed(unsigned sent) "TX FIFO consumed %u chars"
+pl011_fifo_tx_overrun(void) "TX FIFO overrun"
 pl011_baudrate_change(unsigned int baudrate, uint64_t clock, uint32_t ibrd, uint32_t fbrd) "new baudrate %u (clk: %" PRIu64 "hz, ibrd: %" PRIu32 ", fbrd: %" PRIu32 ")"
 pl011_receive(int size) "recv %d chars"
 
-- 
2.47.1
