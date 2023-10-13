Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1538754ejc;
        Fri, 13 Oct 2023 07:12:32 -0700 (PDT)
X-Received: by 2002:a17:907:75ce:b0:9ae:65e5:497d with SMTP id jl14-20020a17090775ce00b009ae65e5497dmr21740693ejc.59.1697206351844;
        Fri, 13 Oct 2023 07:12:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697206351; cv=none;
        d=google.com; s=arc-20160816;
        b=KV7tXHHaqamnWwezzzw8YwYYWYDNyBKXTfvb9Kr2ABcpKN4g0CBH2KPp6ZMtDJvzcB
         1pCs5Mm0rlrjaNQVBlzGLybx49IlJyUd/7nVHCjFPRi2LN0wn1wWAuzQYzCX0aHwdGa+
         8J9T0s+AMdKp5/bhDTmF8klQWiyIdRJFZM45IXmQMeBgX1A3rLLiD0hE7tFZr9tLWvl7
         yFaIHstMD0SzoJ7aBhRED7qPr+N8k1VGfFS0yGko/VWTR5nkOiTRho1f4THNpaHnxoae
         qqfS5OU0Dz6Ag3KcxagjTrIRHOg49j7oGsIa8g8oXjVSBbSDf3ezd9zMvmIDzPKAJuQC
         VTmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iLskZGD/UzWh5WAc5o6F/s/jz7ba3gS2xd/rMg/gdOg=;
        fh=MusjSs7gXCZ/MKYOlww+3pkKR+FOAC+Wy5x6PlCIutc=;
        b=Rpi+eZ66CARXQaXZUImfWOrA6YYe+gI27hn+FuaDxivih5OZ4oS48mXBXTA781Ki+N
         3tLLvMFkfjJfsoottlQ+aDHHoOMSLbDYextAFEr0v/MXAlt0NkxON8zPbiMXM51XnjbK
         pO4bO8DUty9jT4+TKOdCOcrtRcJMSkDqFoWIn45fh9iLUeC0O2LqFBtQsF4U8H9Dt1J2
         DB0Fh5/0nmRD9vmX3XYvmP6ivMvehwaduxlI1GFQarO3R81psp3pGaq8wT//m3lg6tFN
         2I2adPcWBI1WZCboHf3X99jO5RiaVzbMWOT0ETJEWB5FR/C1RQfgBGSpHG0t9cOXKQAf
         5oBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gVmnEz3k;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id hy4-20020a1709068a6400b009bd8bba4fffsor1485818ejc.13.2023.10.13.07.12.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Oct 2023 07:12:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gVmnEz3k;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697206351; x=1697811151; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLskZGD/UzWh5WAc5o6F/s/jz7ba3gS2xd/rMg/gdOg=;
        b=gVmnEz3knrwGIFPc9HU4SKNox0WpdihDUjmfXi7CVEm++2KVhOhHg8SipzAG0pXeXa
         sGws2sC7MXinoH0XuGTeZCmKGZdV27YDjzfqPTUQSHM/1nHLnuuJkaJXU5WW244rnAeT
         jbH83fu8KjncidG0SBvLLdDolayb8eZ6g40p9A/qD3vWETCuLVlyWE9gJtnef7ATsJKv
         x8eWRn7ZYOJYSesab5GxDMe7//R6A75tLBMFdjS/iZKj4EE6KJSm70dTstewNjPA0sJB
         dHwg+dWjv7VqfQ+2elveniUA/V41tMinBy66kKZH0lsKhN8LlpOUpz5Dljm+4yrQ4ag2
         IPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697206351; x=1697811151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLskZGD/UzWh5WAc5o6F/s/jz7ba3gS2xd/rMg/gdOg=;
        b=VnOW73+XBeBkJjMmHvHE4E2+rwy+HgFjyKyWULVNVgThY8FoZdt+8LcX43rxGBDj0f
         ZG/FVI+yvsnLSw/zFi5VNaX8VNfPHWXqMt+aXkerlUuRbUQD1TnGqChj9EtmLULmPJ3+
         Q1HW8e2A6Bc+S9baO619ODvNRLWLWNwS46ZGj4Ig98acBoEqfnvHYdk8PE35cwXb9Ybo
         s4LPmWJtb9T9rz7nzAa+YECnsy/YDkYt16x1ileInyxB9g8UHYdoiLJnFt6vbKZEd/DV
         s/xX66VRtrXQdAACG/57V+7Nt5CMr9HIdbKbUu1pKmm71MyGvx8BP575LH5N7BnL9AIT
         Q5jQ==
X-Gm-Message-State: AOJu0YzGU7Qo/XCBoAykKfONF2wEOE+lrwX9GnlRRbFZmbe53HHMtI61
	YU0xtmDOGj2ZsmKKfqa2PhpgLuHA
X-Google-Smtp-Source: AGHT+IGeF5VAYcT8Xc3J1XIFWvP8bGcK8XYmhquTubIxklvDqtFj7fXx8XYfbOrYDcQqcq5qdxbrBg==
X-Received: by 2002:a17:906:2254:b0:9b9:4509:d575 with SMTP id 20-20020a170906225400b009b94509d575mr24930528ejr.2.1697206351113;
        Fri, 13 Oct 2023 07:12:31 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.172.118.168])
        by smtp.gmail.com with ESMTPSA id lr5-20020a170906fb8500b009adcb6c0f0esm12454048ejb.193.2023.10.13.07.12.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Oct 2023 07:12:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Gavin Shan <gshan@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 8/10] hw/char/pl011: Rename RX FIFO methods
Date: Fri, 13 Oct 2023 16:11:29 +0200
Message-ID: <20231013141131.1531-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013141131.1531-1-philmd@linaro.org>
References: <20231013141131.1531-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hGiGcor66mBr

In preparation of having a TX FIFO, rename the RX FIFO methods.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/char/pl011.c      | 10 +++++-----
 hw/char/trace-events |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index ca931be139..727decd428 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -369,7 +369,7 @@ static int pl011_can_receive(void *opaque)
     return r;
 }
 
-static void pl011_put_fifo(void *opaque, uint32_t value)
+static void pl011_fifo_rx_put(void *opaque, uint32_t value)
 {
     PL011State *s = (PL011State *)opaque;
     int slot;
@@ -380,9 +380,9 @@ static void pl011_put_fifo(void *opaque, uint32_t value)
     s->read_fifo[slot] = value;
     s->read_count++;
     s->flags &= ~PL011_FLAG_RXFE;
-    trace_pl011_put_fifo(value, s->read_count);
+    trace_pl011_fifo_rx_put(value, s->read_count);
     if (s->read_count == pipe_depth) {
-        trace_pl011_put_fifo_full();
+        trace_pl011_fifo_rx_full();
         s->flags |= PL011_FLAG_RXFF;
     }
     if (s->read_count == s->read_trigger) {
@@ -393,13 +393,13 @@ static void pl011_put_fifo(void *opaque, uint32_t value)
 
 static void pl011_receive(void *opaque, const uint8_t *buf, int size)
 {
-    pl011_put_fifo(opaque, *buf);
+    pl011_fifo_rx_put(opaque, *buf);
 }
 
 static void pl011_event(void *opaque, QEMUChrEvent event)
 {
     if (event == CHR_EVENT_BREAK) {
-        pl011_put_fifo(opaque, DR_BE);
+        pl011_fifo_rx_put(opaque, DR_BE);
     }
 }
 
diff --git a/hw/char/trace-events b/hw/char/trace-events
index babf4d35ea..9fd40e3aae 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -58,8 +58,8 @@ pl011_read(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x valu
 pl011_read_fifo(int read_count) "FIFO read, read_count now %d"
 pl011_write(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x value 0x%08x reg %s"
 pl011_can_receive(uint32_t lcr, int read_count, int r) "LCR 0x%08x read_count %d returning %d"
-pl011_put_fifo(uint32_t c, int read_count) "new char 0x%x read_count now %d"
-pl011_put_fifo_full(void) "FIFO now full, RXFF set"
+pl011_fifo_rx_put(uint32_t c, int read_count) "new char 0x%02x read_count now %d"
+pl011_fifo_rx_full(void) "RX FIFO now full, RXFF set"
 pl011_baudrate_change(unsigned int baudrate, uint64_t clock, uint32_t ibrd, uint32_t fbrd) "new baudrate %u (clk: %" PRIu64 "hz, ibrd: %" PRIu32 ", fbrd: %" PRIu32 ")"
 
 # cmsdk-apb-uart.c
-- 
2.41.0
