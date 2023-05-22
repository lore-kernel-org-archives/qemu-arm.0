Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1287121ejb;
        Mon, 22 May 2023 08:32:49 -0700 (PDT)
X-Received: by 2002:a1c:f611:0:b0:3f4:2e13:ccdc with SMTP id w17-20020a1cf611000000b003f42e13ccdcmr7744000wmc.0.1684769569152;
        Mon, 22 May 2023 08:32:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684769569; cv=none;
        d=google.com; s=arc-20160816;
        b=SUawaSIWp1S2+Cjg5JqYBItyoFS1ycDfGORdWt4xKPNB6fw8PiBo0VWnITt7iiupzs
         bf2jxcooYc9BISrhzCe54DAO+wf/Rd4gRXGC6QdMz8hh85uSF0HECQBxJnL/Jlwy4A5N
         J0cnUyAb0ulwZmgqCs+5NFDomeVRsZzkfzB+aYF/MrAZbLcb6z4AqrA4HMz2L6+FDxTu
         8Fe7ErrH0RS/EOG5xa3yJloNXn56GRs82XaSYKAtCCSiSypMKutExMt3q9M+2TsPMmy9
         RA7Tk6y9f4vcdsKtGgtYpMUoI/oDvR5eWMzmbawU/1E1n6ggJSsZV8Dd2DpXXx6rYEvg
         SMAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=A4NEdvvVpuVzw0Qn5uC2iypDr0fWHEDLqqeZGtVwP7o=;
        b=TrSt8BjNBWyLyKnWrSOpm8DNtTrjQMfxy5MsWSLvVBGJGS3u2ize8mG1+1ZqUVDMvS
         Q8bTBTFfdIKrmgEwgOfQvIzO1J9C5YEj177Ol3zHT4EGaOTfz6Yv4d4y2HGnU1JQysoO
         vqKog6WV9Zh70ZW+u+Ba6UxsTG6RXUPnoJx4+DuYmB1MUu/uiXxUhncAiXvp49deqhW9
         czywZmawsOA90nuaiR/8a7MH+cNhLsFcWY38J8pH+L7ti0+MDR6cIlvkz4OAfPAs4HqV
         buTJUzSsLzjZVwygV97Tq3Yk5szOebeIlhM6WKxIcJPQ7z4hd6IWvBWyt+bB0rUz1Y+/
         3FQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bb/CPJDl";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bn19-20020a056000061300b0030628396b47sor1978198wrb.8.2023.05.22.08.32.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 May 2023 08:32:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bb/CPJDl";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684769569; x=1687361569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4NEdvvVpuVzw0Qn5uC2iypDr0fWHEDLqqeZGtVwP7o=;
        b=bb/CPJDlZE3O8+Gr6hYx0FTiPCVvThuj/wbwKpHTQ6taKkcCafnD0RUUdXqgOQdTfP
         vZCL5mKUV0TGhagPeetazHKAhjwh94/TFmOWrB8v4jzILm0YXtNmfob0TPTIXiuoGWWE
         7n77wj/R4gFxkF0YA9mygsxMHho1a6ZQYDJjiKJmktaGifNR2O8yKOxE28imuCglHntg
         xmm0obzCX/wASoYmjRYiDAY2IicsVSfmsI13NXleKZ2tWDi0O2+Mq12rk7xK3Gbplm2M
         zK5ykPaLQZzpoH++aPOQ5vr4TmnuqgYpmAwQBGmy3e12PRbVB6yakD7jCmm11a3suFbr
         mWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684769569; x=1687361569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4NEdvvVpuVzw0Qn5uC2iypDr0fWHEDLqqeZGtVwP7o=;
        b=JOn6hasYvJhFHmxYMBOZNpwBNy0nJhNkL99vS25kR1cwwGJfn3P7D9q0w1+e0W9od+
         ykl5QsaDxBA/w6cMTJ+xQ7615F/FKDFns/W5nNf9+3y5BtVk0KzByXP8IsNsWj9gZwGk
         as4DhnjxKXpHY1VAsgvB3LVA1mvBx7JWD/VRbAK5T4vKhiiLW3rLI7JJR2ezKARb7U0N
         gy39lL1qxCPifapYmCZlojoa9RbtlQJYisl2KEqQHYhqsECem7P0x3NiXphbIhu13Sd9
         R1BAq51V8P7yoK8+aYPLqI3qAY5jH1e6LZ+dLToKwGAVnulgPcjLp+WtzaoxzLth/xQm
         No2Q==
X-Gm-Message-State: AC+VfDxbNAerU6nCdjhZI6Uqp19ju1ILnp91/NohywaGnLBOMaljE/WY
	qpYk2rWLTP3GLD90koHQNLQBcdWW
X-Google-Smtp-Source: ACHHUZ5kQAl8ogeBWflbUQH7VYByjmF9Lr4XrWPrssj6qCYYRRwUqy0QOvlSEPJGjxuaXYR2Jt+F6w==
X-Received: by 2002:adf:cf11:0:b0:306:36b5:8ada with SMTP id o17-20020adfcf11000000b0030636b58adamr7958771wrj.29.1684769568907;
        Mon, 22 May 2023 08:32:48 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.176.153.164])
        by smtp.gmail.com with ESMTPSA id y11-20020adff6cb000000b003063a1cdaf2sm8046868wrp.48.2023.05.22.08.32.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 May 2023 08:32:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 11/12] hw/char/pl011: Rename RX FIFO methods
Date: Mon, 22 May 2023 17:31:43 +0200
Message-Id: <20230522153144.30610-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230522153144.30610-1-philmd@linaro.org>
References: <20230522153144.30610-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BPMf0h6l9j9q

In preparation of having a TX FIFO, rename the RX FIFO methods.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c      | 10 +++++-----
 hw/char/trace-events |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 1ec102d8de..03c006199e 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -358,7 +358,7 @@ static int pl011_can_receive(void *opaque)
     return r;
 }
 
-static void pl011_put_fifo(void *opaque, uint32_t value)
+static void pl011_fifo_rx_put(void *opaque, uint32_t value)
 {
     PL011State *s = (PL011State *)opaque;
     int slot;
@@ -369,9 +369,9 @@ static void pl011_put_fifo(void *opaque, uint32_t value)
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
@@ -382,13 +382,13 @@ static void pl011_put_fifo(void *opaque, uint32_t value)
 
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
2.38.1
