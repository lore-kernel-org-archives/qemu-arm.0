Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp976587njb;
        Sat, 8 Feb 2025 08:39:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWNOOvrkpcJrsgFBJVcNndf4BjZrAu0IwOtH0vGP1YoVrNMXefJuXlkqULem/v6rW3sQG9O0U4xP2WEVA==@linaro.org
X-Received: by 2002:a05:600c:a16:b0:439:31e0:d9a4 with SMTP id 5b1f17b1804b1-43931e0dea6mr19559545e9.10.1739032785949;
        Sat, 08 Feb 2025 08:39:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739032785; cv=none;
        d=google.com; s=arc-20240605;
        b=CIpCZi9aSuxZ3zi+zuBolPu4OgltDsmwmT79tjHpLeMvQcsDx7bTH8c0suhLyxHZy5
         yHcELqWZSJ7kIQoExBoqoyO9lkB7mSK2ekTI1AmwHzR6mq4DR8pJyHIrZbC5Wwl4XyNb
         VRP4FX0CwjwyHszA6ZA/hXRoIiIHa9mN+gdLm/slbcG3VYTJStVWIkfIx/8F7r8JZtuv
         rr7RzpFQOG9YDA15Za+dic9mCD/+i19Ez/7bZ3UYWQ5lGgJC0SyqIsSOARHY6iOYeAV1
         7ETx7eQXy8rVxRvKi4a/hqorO3XUfTu0YoFWbygV1T/LKhAkcTKiUKNE/PXZAWt5Legi
         mjYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=81ffc0XjjE2CDrZU8HhaqibfPhqNj9LivXTF2X9Kxp8=;
        fh=wAMVY4/7+kBcN9Bx3oZPne3LS63m+PFSUrJuow68l34=;
        b=T6fY/kLTOBjNUcq22VVBkDzvOUSM/X/QQzbh4F0Hc6sUmrrArpwnzFllU1+fWekxbg
         JYXT7cDynGNqNPh7BXN4MLa7ZYdiD2azcOF76aA7LcwlJhi1MF1cvx8v4TXrGs8//wvD
         u7WLxJv3JMr2iKgZ3rBruAfAxL8F7GpdN3FdPOkQX4xr15bYzdlDHP4DO/DyztEwPoHz
         6EDqLaI1ejxH1CU54OTaCShVZJTGz90am/NI9to7c1u//70SirrDPnfyShCzx+Vgic4v
         OocgX/U2dgL4+2hckPQhlORBKLVcxora2iF8EhQ7oYphfOeRBaIal+rauERv2Qs+KN47
         PZkg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bohvXrZt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4392ef29875sor6118815e9.10.2025.02.08.08.39.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 08 Feb 2025 08:39:45 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bohvXrZt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739032785; x=1739637585; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81ffc0XjjE2CDrZU8HhaqibfPhqNj9LivXTF2X9Kxp8=;
        b=bohvXrZtc9YenBZ8ApDWFLtlj7LvdpL6uXAJcTvnD9q9wrKPRU5dVI/qsCdKcQiKTX
         Srx0mQoUHP335xTMlysqDlwgHcxg1iPaeZPBvEQmibZ1nDhwSynPGq4dR3DBoyZJ6vYZ
         h8iaHd1MuJJRVyCu2WuR/JhnMrYfIUqqiqE2q/8ADZElhiVwxgSAKMVhz8BnyePhftzr
         mR5WEIAFSrezWODOj66bPS/WrtiVdWQy3t3g8vvP1ygU5AeDG6ZyN7tMkLTnWH9tm61T
         jCuGCsSXOEjrdL2AABbmGAUEMp3bSkqiqgRAp7vNG8SSenpbFg1f180TCMOIL+/bIm/5
         qldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739032785; x=1739637585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81ffc0XjjE2CDrZU8HhaqibfPhqNj9LivXTF2X9Kxp8=;
        b=ZOBqs/ymuCPx6XX+1TGMlapRSiLCJ7JrxVMeTDPBV36uBS7hRKRQsYqoRx0l6kR35c
         /mWjPsCCEPI/ovOKYhgOwrKhdxPtxiJ43Mz754C9sVQVFaTreYbveebxnybcnM0McDpw
         97pswe3El52mbY1GjQB5mtv52Z2I4PQ6eFudLYBe6FI1TXCwWsAck2D1/pHGQiEQL9Vw
         IszYdhNfHB+gLlhUHt5SQxInrjVklZoFwjK0iM6lwzYNTiOsaYyK8CPBHE+D876LQjJG
         ABvnW3r+NHAJ55NOF9Jt503UmuIXjGXCbQxa2VjWjiOx4X4OyDJ/BBXDDQ9rQiufFGaE
         cJuw==
X-Forwarded-Encrypted: i=1; AJvYcCXVGwb4wP6NtG2KFblqjW/CNvV2bMWrw+glPGVcmAToD7qcbsU4xcPFMLfZ1CB4m/CzabpYpVSpDmvOYw==@linaro.org
X-Gm-Message-State: AOJu0YwcfkFiQosWK0m/ycn779hRpwrvld7gYPEFNxva2sdoVoC3k1I7
	q61ko5TXGDkTUw/qkpTu6qBFacA7h4oF70b7p1smf/+FZJ/oIy2zzyW7eB1lOx9/8Q==
X-Gm-Gg: ASbGnctrCBfrnvGjearkycemVqt9Rj6zH2b5tQX6xFCmZe81EKjZFGmYTbOcRgTDbbc
	teifIvZDp9jBKB55YjoxbvS3NMxKoxoaEdeppU5SwRPobIV3alqtsSR0+RmFaLsKwOtcUSxeAok
	YbBn48fyHLwIh3lE1wR2DAdaj65tRGMB8CccPeMFXBcZFw6z1bLVwrLBS4KHz95hg1dpxp9GvVe
	jzeDGlmtK+8RqAKpzQaBGmwYgJyax6PN5fZXt1C0ri7BeluBGsUrkJrxBYgvDlkN1s6g3JLAUy+
	DCdraj1TJSWkYmOS63Xw1pwtn133PZ+QWNqWnKBO6ptLDKlrYaNmHQJfMkzIkvfxNA==
X-Google-Smtp-Source: AGHT+IG/X0VyA9+eIBjlpg23/gpiC6q5rDMExQc5IPCMWapruWrwiPy2YHvflwAE1tp+5k9gGRgdgA==
X-Received: by 2002:a05:600c:3d06:b0:436:2238:97f6 with SMTP id 5b1f17b1804b1-4392f1b8e78mr17671635e9.1.1739032785361;
        Sat, 08 Feb 2025 08:39:45 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde31d9bsm7546987f8f.94.2025.02.08.08.39.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 08 Feb 2025 08:39:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 6/7] hw/char/pl011: Drain TX FIFO when no backend connected
Date: Sat,  8 Feb 2025 17:39:10 +0100
Message-ID: <20250208163911.54522-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250208163911.54522-1-philmd@linaro.org>
References: <20250208163911.54522-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xR7rPj10XLIY

When no character backend is connected, the PL011 frontend
just drains the FIFO.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c      | 13 +++++++++++++
 hw/char/trace-events |  1 +
 2 files changed, 14 insertions(+)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index ef39ab666a2..3c4264869df 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -240,6 +240,13 @@ static void pl011_loopback_tx(PL011State *s, uint32_t value)
     pl011_fifo_rx_put(s, value);
 }
 
+static void pl011_drain_tx(PL011State *s)
+{
+    trace_pl011_fifo_tx_drain(fifo8_num_used(&s->xmit_fifo));
+    pl011_reset_tx_fifo(s);
+    s->rsr &= ~RSR_OE;
+}
+
 static gboolean pl011_xmit(void *do_not_use, GIOCondition cond, void *opaque)
 {
     PL011State *s = opaque;
@@ -250,6 +257,12 @@ static gboolean pl011_xmit(void *do_not_use, GIOCondition cond, void *opaque)
     count = fifo8_num_used(&s->xmit_fifo);
     trace_pl011_fifo_tx_xmit_used(count);
 
+    if (!qemu_chr_fe_backend_connected(&s->chr)) {
+        /* Instant drain the fifo when there's no back-end. */
+        pl011_drain_tx(s);
+        return G_SOURCE_REMOVE;
+    }
+
     data = fifo8_pop(&s->xmit_fifo);
     bytes_consumed = 1;
 
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 8234f3afa13..7d1cba1b4f8 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -72,6 +72,7 @@ pl011_fifo_tx_put(uint8_t byte) "TX FIFO push char [0x%02x]"
 pl011_fifo_tx_xmit_used(unsigned sent) "TX FIFO used %u chars"
 pl011_fifo_tx_xmit_consumed(unsigned sent) "TX FIFO consumed %u chars"
 pl011_fifo_tx_overrun(void) "TX FIFO overrun"
+pl011_fifo_tx_drain(unsigned drained) "TX FIFO draining %u chars"
 pl011_baudrate_change(unsigned int baudrate, uint64_t clock, uint32_t ibrd, uint32_t fbrd) "new baudrate %u (clk: %" PRIu64 "hz, ibrd: %" PRIu32 ", fbrd: %" PRIu32 ")"
 
 # cmsdk-apb-uart.c
-- 
2.47.1
