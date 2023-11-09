Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp703769ejq;
        Thu, 9 Nov 2023 11:29:05 -0800 (PST)
X-Received: by 2002:a17:906:c149:b0:994:555a:e49f with SMTP id dp9-20020a170906c14900b00994555ae49fmr5025361ejc.31.1699558145074;
        Thu, 09 Nov 2023 11:29:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699558145; cv=none;
        d=google.com; s=arc-20160816;
        b=oIu9vgQj2cZfkstF0B+RVIVDS8anYdl3wMb808oabi1tK8nXoA3aRELyRX7ImMxdk3
         z6O+qoumHfSEUulbBwcihxoPZJaTSoGFjNTOA1QJdTlpAsWPinP994bhc3qiT62khc4e
         Ehq0YuHUJKN8AWR9QtQIP4o8HnjdZLBnqBmS5Ab7a4RI2I5ywwAaRFLJaBSUDahr0UYO
         ZRcuy+jDKFuhQ6hIuJPBAkRB7Amth5guVNAo7admzpUlVzKBfGIcSIvttR8gj2/ITrCm
         RsyFHnj6ENWZXHGAqaiWYmNJTbZrZNcvR50oB5DWOywUTwlF3o3T8aOXrK2/adDNhLJb
         3v0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RHS4Z4THTDrdonuMomFxK3JmiClhr4y8badmiGx38uU=;
        fh=Zi/lk1CoRxouROvt4Eod7oP2jg68ZE5jz0tOr4SBE9g=;
        b=HZTeyCJ5iBYD/BhOKLlLmxa85JOQl2JzZp+oLREsN8BufBKElLWqvn4Wzo5VpkO1ms
         Ccvkk4WcuWfjUwVxV0UEAUger2ZCETUqQxFYkFe4TGk7C+UmLrpFwW2jbU1spNghyVVl
         kM2usg2SZ50FIkliUwBzXr8B9nIlvYs3JUjwjy92MhqBBt4cmzTWzdfOMBKOpnxNI3Ls
         tw+BFckLeNjEz6yVHyrjvo5wWLclIDHj/LC3i5u5p3zBIhqqVI/6U2A7IsE0FGPcPEEN
         piXUrq1E60ZUHczZ6j54Ntfd3yfpjRY9yTqg5ZrKOi+crpsUI6vNDcIAo1ePxl2Rhy9y
         PIGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O/Ii4DSM";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 21-20020a170906015500b009c64bc3e0fcsor3200497ejh.3.2023.11.09.11.29.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 Nov 2023 11:29:05 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O/Ii4DSM";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699558145; x=1700162945; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHS4Z4THTDrdonuMomFxK3JmiClhr4y8badmiGx38uU=;
        b=O/Ii4DSM451heGxkrH56e04r0nAFlxv8uTHiIIS2jpFLZpm/tFekmiTbAQziu8b72W
         tufQdWzs+YVlkVnyIKDZpv/a1HGzdRtx4F5BMvdgaMSWPh0xCxh/j1aXgphzNi7jSuSu
         upZ/Upn/94kz7gSY3v0v+f7O0h+rQXLpvca+VcOrjM2wFMqgZFqJkCBFVi5BS323euP6
         iYvbHzHuwcYq5mzgwFqL4W268OM14mrpHOq85u2vllqHimP9E+qDH225O4rp+51xnhHR
         DDrz9OqnXSQBjy79mIceRNHGK7f/ikVT2egYT14Y83M6qlfyv37CJUAXrV2bMi1DUwVo
         sNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699558145; x=1700162945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RHS4Z4THTDrdonuMomFxK3JmiClhr4y8badmiGx38uU=;
        b=fhyYz8TuV74YNia5XdhOU1JAGcXBUhRPY2ApRpbtFRXi3GqhDMNxJzr7RZO9GGhuwx
         UR9xw07CI2Vu2hxmi87uxgZE/Nas0Mh+N1cr4WdLyq+3pqBxZVMB8zilj65Uv7oxAvNG
         LMN162uMAYs/BuK55lbLUijJe8CQyvea5ht/SZqxPkkUzQdx6v3ondmgQScTZZXOWDKF
         B6nr3oEx4FWm91AIvfsWG3zSwJ3b4NMMDH/1nwMpL1r1n9qqnbUQ46NYSshuvmepbzVt
         HZpxJNmvUxremSUUJRUj85hO6XVSiMUGVCalZr1bMiWpVyACot04IYvMGpbpshXmnY+q
         rJTQ==
X-Gm-Message-State: AOJu0YxTQL2IoDQBNg3E5LvGHQnO0LLvpsZScPFmExmYSIuDofwziHX8
	0kNL3Kfeko26B7geH8Q+tJnpipID
X-Google-Smtp-Source: AGHT+IHXkY9UsEk1pUD7sRTwEoyz3cZAuo+O1RcB0EcPzc4SAAb7hsOUbik4GhbKjbYbhKz1aDV7YQ==
X-Received: by 2002:a17:907:9304:b0:9c7:5186:de1a with SMTP id bu4-20020a170907930400b009c75186de1amr5108548ejc.8.1699558144629;
        Thu, 09 Nov 2023 11:29:04 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.199.161])
        by smtp.gmail.com with ESMTPSA id l22-20020a17090612d600b009c3828fec06sm2914829ejb.81.2023.11.09.11.29.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Nov 2023 11:29:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gavin Shan <gshan@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Peter Maydell <peter.maydell@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH-for-8.2 v4 08/10] hw/char/pl011: Rename RX FIFO methods
Date: Thu,  9 Nov 2023 20:28:12 +0100
Message-ID: <20231109192814.95977-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109192814.95977-1-philmd@linaro.org>
References: <20231109192814.95977-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yu7pQg0khB4p

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
index 7a398c82a5..bc9e84261f 100644
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
