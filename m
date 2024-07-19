Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp616949njc;
        Fri, 19 Jul 2024 11:11:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVYna8JtIm5/DeIbtuwswvyKeKSD9rDzSfwnRa/GUm2ucxIOpqU1BSeHDmLQwKBfunQBEqmGiWmiSnk8LB74+idSIPiFA37
X-Received: by 2002:a05:600c:1f07:b0:426:5b44:2be7 with SMTP id 5b1f17b1804b1-427c2cb865emr78394065e9.10.1721412669415;
        Fri, 19 Jul 2024 11:11:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721412669; cv=none;
        d=google.com; s=arc-20160816;
        b=adrsjs9tDbluCQrXyGMjOaTtqLtajqSFUH3vGGNSwSBHWTG/758x5C6jUMon/13Pk1
         +EnjAkPBpFYeFU7zIX9tqG0ex/+UZqXBfjVb0uKwoaorzD2JH8Zr0tImP8Wk2Ge0gOGx
         x/pkxU6mnEijZ6S+qKrQ1zEAMylT3iAD0Xi+flbfmAE6uziGTBTJxbkEwtB+Ac2MTKpB
         GuDiRCMXJKzRjn7VzSNvxvV6r+TBEL4kr2WvmkE3NXlMBh1JdQSZDGh0byFqRiCOiak5
         wFJYZi9OpgNxKtSz4BF2ZybsJVPcwIrUjzwaLaP9WFdlwTgJXq/yFfV/MJudve7mewMF
         0Mcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HKEyUF5vAQXhfPoZ9bEoVMEJKlfitjNK1zaxUdDv/iQ=;
        fh=Omy+7zm/isP8IBs8cFbL0yKSTmP0LLZKl1kstrp+D+c=;
        b=oPc9ZmZPdqy+/qkmNCWsZ+wZHi1PdyWWFR5fUJybA1xzVNVXnpxsbXEB/hto7Ns4do
         YiBnmm7lJKcKrX9T+9ykVt6WQ3Sg2y9PyFP4p/NzLLMMUIlBo1fhzoPJlEaGw6LCOf0y
         v8n6xYzkGCXm17tRQHWztI9+tVruzLsVBGrV5pawidMhAiea1n5G38sVVQMFEpHSLpdG
         Vv0SZj75qNf/TPf9oqdUnB7npx7BGGvXbPiRPXIeLvbl+MhblzZ2h2keTUtU55IYrLU5
         jSjXhbwB4FLq6WFpMOkrJeuIEKz4fcDpfw425wi4wf27ABPEjwM7bqluvUvj9IXgsoQp
         6m2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AtHbj3gV;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-427d6fccb2csor8481175e9.7.2024.07.19.11.11.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jul 2024 11:11:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AtHbj3gV;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721412669; x=1722017469; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKEyUF5vAQXhfPoZ9bEoVMEJKlfitjNK1zaxUdDv/iQ=;
        b=AtHbj3gVgNjrETHrL0SWc81MOvTwikxz+/KHSyJT9Yon22nj2VSckcJoHVe20OR6S1
         kllPrBrNkMlDD0skM/CjCaxEoQyIj0s/iD4abMyJEqacu2F6DMuWkG92ZqaPp2ag45iE
         EdjAikfG5DUJcxmQZwAv8ws0si1R5UNarY0WP/Q++MzpjbzCOxgkGlLCPSnnUmz/6b7c
         KtX5g35v63yOUcRusPqIMeX5oemXitAp/Mx3AZ5h/Mx5jlrNyF50BvIzvQNlVEARNnGM
         61Hg/TsARN0zbpPYuWKPV1GUhIuROu/BEqEcOcG76s6RP7IDEzt1pD/ZtScy4X0Dx7RY
         1f2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721412669; x=1722017469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKEyUF5vAQXhfPoZ9bEoVMEJKlfitjNK1zaxUdDv/iQ=;
        b=CZzz9bkVHro5NvXJiEh9yfAF3rzWHDUoQkS+khizq5hs7+GbOtcWbtdNU5fdUt1gGm
         C2A1n6UyfUJGNtP0rS950lcWus/m8P8ZsLYAs35jgrJ7j27Ab4kmOZ912Bk2diopDLLG
         V4zQv4t83/sEwVs+68Q/0oDYDzTEP8WzkzXq7FZQwozuaTRBI4nSpU+eaUiUG+J3XvUY
         TjBPxM0VKAZpKy7gETWhg16eg07QPn3zeCq3TpDdpq7iAaDU35lVDetzcb+wh7lITkA3
         wcSegNIiPLa2rHBgbSipZ7kQwK6eCuAU0hJbSG5vvva36W7p3L+dxbpwwx4uE8XkbbCo
         o7BA==
X-Forwarded-Encrypted: i=1; AJvYcCVac/m8dB4E+Oubld++mxC/DbMB8vyyOtnrvQrhKroxKNY8Cwz65ADxe+ySNoNmE7QGMpAVZKMZu9g2xGCLw55dyXdSYxjX
X-Gm-Message-State: AOJu0YyYg5EDzF/TUVJpJhcQvrPMIZG1aGO4j7OtgSS/2+MoDV5g909Y
	EjalknuIBdbb0v7AbUmnjC7a0BUUAzJGg6GU/nPShVEDlL9eSevGhDMt8MjggTry0w==
X-Google-Smtp-Source: AGHT+IHyINAIOVHPFb5Xhz+3TG7BuvPnB2fxoM9BRSAld2ZTy5lvo3sJctcadYjTj6qh6JVt9fe1yw==
X-Received: by 2002:a05:600c:3b8f:b0:426:5520:b835 with SMTP id 5b1f17b1804b1-427c2cacf1emr61880365e9.5.1721412668901;
        Fri, 19 Jul 2024 11:11:08 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (52.170.88.92.rev.sfr.net. [92.88.170.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d7263687sm29524065e9.4.2024.07.19.11.11.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jul 2024 11:11:08 -0700 (PDT)
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
Subject: [PATCH v5 04/16] hw/char/pl011: Move pl011_loopback_enabled|tx() around
Date: Fri, 19 Jul 2024 20:10:29 +0200
Message-ID: <20240719181041.49545-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240719181041.49545-1-philmd@linaro.org>
References: <20240719181041.49545-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: r573H4UOsPQ8

We'll soon use pl011_loopback_enabled() and pl011_loopback_tx()
from functions defined before their declarations. In order to
avoid forward-declaring them, move them around.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c | 66 ++++++++++++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index edb5395fb8..22195ead7b 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -138,6 +138,11 @@ static void pl011_update(PL011State *s)
     }
 }
 
+static bool pl011_loopback_enabled(PL011State *s)
+{
+    return !!(s->cr & CR_LBE);
+}
+
 static bool pl011_is_fifo_enabled(PL011State *s)
 {
     return (s->lcr & LCR_FEN) != 0;
@@ -181,6 +186,34 @@ static void pl011_put_fifo(void *opaque, uint32_t value)
     }
 }
 
+static void pl011_loopback_tx(PL011State *s, uint32_t value)
+{
+    if (!pl011_loopback_enabled(s)) {
+        return;
+    }
+
+    /*
+     * Caveat:
+     *
+     * In real hardware, TX loopback happens at the serial-bit level
+     * and then reassembled by the RX logics back into bytes and placed
+     * into the RX fifo. That is, loopback happens after TX fifo.
+     *
+     * Because the real hardware TX fifo is time-drained at the frame
+     * rate governed by the configured serial format, some loopback
+     * bytes in TX fifo may still be able to get into the RX fifo
+     * that could be full at times while being drained at software
+     * pace.
+     *
+     * In such scenario, the RX draining pace is the major factor
+     * deciding which loopback bytes get into the RX fifo, unless
+     * hardware flow-control is enabled.
+     *
+     * For simplicity, the above described is not emulated.
+     */
+    pl011_put_fifo(s, value);
+}
+
 static uint64_t pl011_read(void *opaque, hwaddr offset,
                            unsigned size)
 {
@@ -290,11 +323,6 @@ static void pl011_trace_baudrate_change(const PL011State *s)
                                 s->ibrd, s->fbrd);
 }
 
-static bool pl011_loopback_enabled(PL011State *s)
-{
-    return !!(s->cr & CR_LBE);
-}
-
 static void pl011_loopback_mdmctrl(PL011State *s)
 {
     uint32_t cr, fr, il;
@@ -336,34 +364,6 @@ static void pl011_loopback_mdmctrl(PL011State *s)
     pl011_update(s);
 }
 
-static void pl011_loopback_tx(PL011State *s, uint32_t value)
-{
-    if (!pl011_loopback_enabled(s)) {
-        return;
-    }
-
-    /*
-     * Caveat:
-     *
-     * In real hardware, TX loopback happens at the serial-bit level
-     * and then reassembled by the RX logics back into bytes and placed
-     * into the RX fifo. That is, loopback happens after TX fifo.
-     *
-     * Because the real hardware TX fifo is time-drained at the frame
-     * rate governed by the configured serial format, some loopback
-     * bytes in TX fifo may still be able to get into the RX fifo
-     * that could be full at times while being drained at software
-     * pace.
-     *
-     * In such scenario, the RX draining pace is the major factor
-     * deciding which loopback bytes get into the RX fifo, unless
-     * hardware flow-control is enabled.
-     *
-     * For simplicity, the above described is not emulated.
-     */
-    pl011_put_fifo(s, value);
-}
-
 static void pl011_loopback_break(PL011State *s, int brk_enable)
 {
     if (brk_enable) {
-- 
2.41.0
