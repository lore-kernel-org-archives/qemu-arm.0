Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1627952njb;
        Wed, 19 Feb 2025 13:09:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUCq3hKaykIX7n6PiUYDqJy+KDD44A8tEio+PZLhr62M7HxJrm9RUicMqF5SNiWRh9omTtsIU8RdErvQw==@linaro.org
X-Received: by 2002:a05:600c:1c1a:b0:439:9274:81dd with SMTP id 5b1f17b1804b1-43999d72b69mr42418965e9.1.1739999346329;
        Wed, 19 Feb 2025 13:09:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739999346; cv=none;
        d=google.com; s=arc-20240605;
        b=gOvV+uRFccVEA3ekernz75muiTLzI1XoV2VLKvvEkNOcxnZw9qxjpSc/6dCyR+6IcS
         qOAlNJwve1fJNgMsJDaSq/ebNdNsLHqTULLyIt0MeazupK5fq4NClgfamX7yi+YJVkN+
         /rvHzn1Epzrnh4RTlPfNVHLovK1MbO8Tp8ozp2snhkzVRz8njbiOpUb2TaqsbEPkpChj
         fkg3Z0FbtDeNYo6nT2mbDs2lqTKSQ/GO0xXQZGA/SuPKAkF54gpamX0m1rokpYL+GBaG
         SkXNlXe/fq2hwmEBgLeN8FMRte0FngQDXtza58tOP53FX0WF8NIqXb4mOlYOAyyWJQRQ
         CPWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fSZGsSKza9FznsLK+BKXxumGhe4yyrC/EclHmT2ykjo=;
        fh=BLXDfBV1lQ5sKasNYCbveQOw2dU0aUHN87efaS2Rclk=;
        b=F6s0NVSifD/cD9X8G/oF9T3RPhkXSGValLXUs5g10A0J3BtZ/Ke2XvXAV05YLa5ds5
         elyDHSAWAumbC0scIN4eAMN4LM8bAZRae0mQB5X+O/+eBojOUuO7fTpMpnvDfxmLhkac
         IhyosKwBkNp6J9tyrl92Hz92hprt6yU2TMvsvu36+Tn31awr7ed8AO7ZqbIzr3NU6Sec
         aVI79ozNuWgYWueunM7G78pj9M3lDsex86RGQDVHd6mBNjeYn4R3fG+uJUIREYkt684v
         UZLmYyu1bBdgXQuNj0gGokjJU7A1UjHKhaTpXIF1jQym9werKnTHSMq501ZpWpzHlf5q
         i1LQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c1TCwydM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4399aca3775sor10969205e9.2.2025.02.19.13.09.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Feb 2025 13:09:06 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c1TCwydM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739999346; x=1740604146; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSZGsSKza9FznsLK+BKXxumGhe4yyrC/EclHmT2ykjo=;
        b=c1TCwydMEF40hVrrg32X0cmqhr93QM+wqBECGOhCgbscwGGJ/E/mpDDg9U1h8ftZkP
         qoRNmsNH7tEO7IT/gxK8liSwThCMhtificI6mXovAdV6Kmec5mD6eOR2FituQ8GbT07W
         jcRNpi2oV1/80NGyi7Bink6GggeZpafZ5m+vYpVsteQt9YvqX/fSA4wKaw76gL7/BDTk
         gaWSSA+gymh1uSVZO3YUFYfO5Bv7037Tmqniwcj9Dcu33IlgqE6kM/JeuheAmYHKtv6w
         N/6FMylyUkbsJEZjUxHQnB94EoFpbe0jMVu5lZKkcsWlB6NnUNcquB84MzIH3HOJSsY1
         BQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999346; x=1740604146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fSZGsSKza9FznsLK+BKXxumGhe4yyrC/EclHmT2ykjo=;
        b=KsvDovTBludJh6k7ZN3RNYtDEQumWXgfpDoGrlvg7L+0gcORTbkAdP7SWXnUlj8WWj
         8lU5fZyQrN3bD17eYZfA9Ch2F80DL3ww8Yf7gm6tBIp4CLPj7DhnJxRuIsmiknk2DOWv
         zGnpHp/mbFi+ymJyzypWh/wHxcu9Xt9PtJ6dtUK0kAg17nO9tmiBXVcTLwQi4AfXLCtj
         Jh5U3HqvxvA0+vzQ9OEXL7gSpCzlqyojmw4HhtkoJsZiG574WVTcG253t4Rw+AniCoqZ
         sLnhAAPfbdovYQr/3Jjc5csPmNE3234jLbfIj5qp067CaTcQE32et6m+ZmkwduzhO+bo
         Kyng==
X-Forwarded-Encrypted: i=1; AJvYcCWhuOe+mCVj6DsADksJZBVd7qewsmE/CZbeXc8uMO9O7dhIeI403B8GgV60ejhmtb2msvzhVofvZW3fcA==@linaro.org
X-Gm-Message-State: AOJu0YziyUYN1HuUZnlHCm9pODT2jkN4wPOID99+SwfLUByQ2WwwDSYa
	l2EsOPxSz2Kt59GWn4V3GEld8tRaKcuOKq6+imQRLaalEdpi7rhDw5eaQ0x2MQR22A==
X-Gm-Gg: ASbGncsOBhgnSXbU/B5I4JgT+nKWK+o/9YfgccYVW1ZaKbnnsk6iOBvN/T8xSN7X5ja
	iF0nM3OWU6TGf4zCPndtoT93ccGEGjFEF/HHgg9b4BuH0oS/Lciepbe6KK6JKVHFHDvOaojIRhe
	m6+jej79q5ITdJVaN1EfxftzTeFwQoeTcKXo+gRugOI52W2Dct/NnPIrf10sOzdUXG4bX8BvnN+
	Ueb71lRFmJec6vO+qJhTDyuGEfrqZ/jrLjHVvcKzb7nZbw/Qy3RILjMTXxZGY9fFdJHL2jglbEZ
	MWdUArsXfsoq5YikgXlUq1CJ8xEIUcrAEB/iAeJUoA3v4ro5EB9AtP1pOzdGZv3FjA==
X-Google-Smtp-Source: AGHT+IH8vWve1zzP4GhRmEIzBXAdPoQ6GxQ483+xddSgCnCPWr2rFU7i87czS1ardmTIRDJw8prvFA==
X-Received: by 2002:a05:6000:196b:b0:38a:8ec6:f46f with SMTP id ffacd0b85a97d-38f587f184cmr4267743f8f.53.1739999345774;
        Wed, 19 Feb 2025 13:09:05 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43992ad82cfsm64238765e9.37.2025.02.19.13.09.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Feb 2025 13:09:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	Rayhan Faizel <rayhan.faizel@gmail.com>,
	Luc Michel <luc.michel@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <huth@tuxfamily.org>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH 4/9] hw/char/pl011: Really use RX FIFO depth
Date: Wed, 19 Feb 2025 22:08:36 +0100
Message-ID: <20250219210841.94797-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250219210841.94797-1-philmd@linaro.org>
References: <20250219210841.94797-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: sMakeRRafDhm

While we model a 16-elements RX FIFO since the PL011 model was
introduced in commit cdbdb648b7c ("ARM Versatile Platform Baseboard
emulation"), we only read 1 char at a time!

Have the IOCanReadHandler handler return how many elements are
available, and use that in the IOReadHandler handler.

Example of FIFO better used by enabling the pl011 tracing events
and running the tests/functional/test_aarch64_virt.py tests:

  pl011_can_receive LCR 0x70, RX FIFO used 0/16, can_receive 16 chars
  pl011_receive recv 5 chars
  pl011_fifo_rx_put RX FIFO push char [0x72] 1/16 depth used
  pl011_irq_state irq state 1
  pl011_fifo_rx_put RX FIFO push char [0x6f] 2/16 depth used
  pl011_fifo_rx_put RX FIFO push char [0x6f] 3/16 depth used
  pl011_fifo_rx_put RX FIFO push char [0x74] 4/16 depth used
  pl011_fifo_rx_put RX FIFO push char [0x0d] 5/16 depth used
  pl011_can_receive LCR 0x70, RX FIFO used 5/16, can_receive 11 chars
  pl011_can_receive LCR 0x70, RX FIFO used 5/16, can_receive 11 chars
  pl011_write addr 0x038 value 0x00000050 reg IMSC
  pl011_irq_state irq state 1
  pl011_can_receive LCR 0x70, RX FIFO used 5/16, can_receive 11 chars
  pl011_read addr 0x03c value 0x00000030 reg RIS
  pl011_write addr 0x044 value 0x00000000 reg ICR
  pl011_irq_state irq state 1
  pl011_read addr 0x018 value 0x00000080 reg FR
  pl011_read_fifo RX FIFO read, used 4/16
  pl011_irq_state irq state 1
  pl011_read addr 0x000 value 0x00000072 reg DR
  pl011_can_receive LCR 0x70, RX FIFO used 4/16, can_receive 12 chars
  pl011_read addr 0x018 value 0x00000080 reg FR
  pl011_read_fifo RX FIFO read, used 3/16
  pl011_irq_state irq state 1
  pl011_read addr 0x000 value 0x0000006f reg DR
  pl011_can_receive LCR 0x70, RX FIFO used 3/16, can_receive 13 chars
  pl011_read addr 0x018 value 0x00000080 reg FR
  pl011_read_fifo RX FIFO read, used 2/16
  pl011_irq_state irq state 1
  pl011_read addr 0x000 value 0x0000006f reg DR
  pl011_can_receive LCR 0x70, RX FIFO used 2/16, can_receive 14 chars
  pl011_read addr 0x018 value 0x00000080 reg FR
  pl011_read_fifo RX FIFO read, used 1/16
  pl011_irq_state irq state 1
  pl011_read addr 0x000 value 0x00000074 reg DR
  pl011_can_receive LCR 0x70, RX FIFO used 1/16, can_receive 15 chars
  pl011_read addr 0x018 value 0x00000080 reg FR
  pl011_read_fifo RX FIFO read, used 0/16
  pl011_irq_state irq state 0
  pl011_read addr 0x000 value 0x0000000d reg DR
  pl011_can_receive LCR 0x70, RX FIFO used 0/16, can_receive 16 chars
  pl011_read addr 0x018 value 0x00000090 reg FR
  pl011_read addr 0x03c value 0x00000020 reg RIS
  pl011_write addr 0x038 value 0x00000050 reg IMSC
  pl011_irq_state irq state 0
  pl011_can_receive LCR 0x70, RX FIFO used 0/16, can_receive 16 chars
  pl011_can_receive LCR 0x70, RX FIFO used 0/16, can_receive 16 chars
  pl011_read addr 0x018 value 0x00000090 reg FR
  pl011_write addr 0x000 value 0x00000072 reg DR

Inspired-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 148a7d0dc60..57d293d1e3a 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -489,7 +489,6 @@ static int pl011_can_receive(void *opaque)
     PL011State *s = (PL011State *)opaque;
     unsigned fifo_depth = pl011_get_fifo_depth(s);
     unsigned fifo_available = fifo_depth - s->read_count;
-    int r = fifo_available ? 1 : 0;
 
     if (!(s->cr & CR_UARTEN)) {
         qemu_log_mask(LOG_GUEST_ERROR, "PL011 reading data on disabled UART\n");
@@ -498,7 +497,8 @@ static int pl011_can_receive(void *opaque)
         qemu_log_mask(LOG_GUEST_ERROR, "PL011 reading data on disabled TX UART\n");
     }
     trace_pl011_can_receive(s->lcr, s->read_count, fifo_depth, fifo_available);
-    return r;
+
+    return fifo_available;
 }
 
 static void pl011_receive(void *opaque, const uint8_t *buf, int size)
@@ -513,7 +513,9 @@ static void pl011_receive(void *opaque, const uint8_t *buf, int size)
         return;
     }
 
-    pl011_fifo_rx_put(opaque, *buf);
+    for (int i = 0; i < size; i++) {
+        pl011_fifo_rx_put(opaque, buf[i]);
+    }
 }
 
 static void pl011_event(void *opaque, QEMUChrEvent event)
-- 
2.47.1
