Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp617619njc;
        Fri, 19 Jul 2024 11:12:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXw0i2z68xTXIERh4kQhBAiWUk6hCNQD+Y5UYKBbNE4gRjeUMMLxt1FCwt2HUIHGFSodpdt+ERcPBh1bs4oLFCBQ4A70A7R
X-Received: by 2002:a05:6000:1884:b0:367:940c:6a3c with SMTP id ffacd0b85a97d-36831737b58mr6572066f8f.41.1721412740318;
        Fri, 19 Jul 2024 11:12:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721412740; cv=none;
        d=google.com; s=arc-20160816;
        b=rdAx+u8J5hykvvGOJKqTdujFPxNjoHwKDDyFidcYY5jZCgIj3An0S5ywlKirC3zVle
         FqZ8Mz9tV7R/vacvw8EsRWoKYp5VNgp0E6gpEKX/tiARGQCEZIWUxmTqZu3JXoz/GXBJ
         rX5XPPrK0IEdy0eCwiVc4E0Jloxd5tTsa8Opm/5upo8gm7rFETZYhgX3MBHFNHUwkyPQ
         +m0dCk/duWoD3NBpWd/ljEZQlz0eAIjyP/EOZ1LDdS1XEe7FBg5ftTyydmjHbHSWg28W
         r1OVlJAsiKp7N2o8Nti3CUnzwHmB3k6AjFDNcitWXpBtXuSpzrNB2zePeU4I74hKXkWN
         Zmjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/3cF/tU//YplS5nRyz5oLLMVLav+V+FPLOKof/J5MTo=;
        fh=cNddtXo4Fb4uBCp1K8S9VH+79smqCs31Xt2rrr8tiYw=;
        b=i0VGRSNIc1LtDuVmxOVZAqg0A4u4GPCEwfNCWNqjcGUXk/UVuCpB0bvcudXqX5PTH4
         4Xo6rgOs/mxCXIhHUs3mVHxXEP5VD66x9Piwg6D/cm++AlbxMTTrBLCWjoJtiWK0ClSu
         v0pDgp8qpCuSoJ5dyekrqmVnfrksra3g0O5VBSED83O9KSheK6swBNC04nQI7NS85G36
         llUR6HDSsZW40csJ6Q1NHG1TkUgPRSloH1qzymaX35Rmvwn/HC98JKFn6z8Jh4LtHyvs
         Dtt3+zYkxTpqWZVIKDomyGCyMVZxl2YBNTYjLaxla4dtGnJElDWxF1PYmiWBzAdJ1Irt
         yGGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GxW+hGOT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-427d6ecf38csor6143265e9.5.2024.07.19.11.12.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jul 2024 11:12:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GxW+hGOT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721412740; x=1722017540; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3cF/tU//YplS5nRyz5oLLMVLav+V+FPLOKof/J5MTo=;
        b=GxW+hGOT2KuOnPTzgLUuQqTX77tUcssjwszTz06G+dAYWZ4CcdeOvpZ25cG2hCWIWu
         qZdGevVe5aB8zxExVrXd5v4c8miDMBCfWutkAoqzPQB4kq/CGByRLL8LWOSR3Er4UzJd
         R92ra3AXiFQmfd5IbstOGpw+puq0IlykChYegDUR4Ya7laQtzKpCQjOOWWJbjocnLLn/
         ByV50XuYs92k44LHd86r5twsDziemA/s5m37CTHDBG7ZQX8ad7CHDtoHa8YJkpU0uT+1
         SRcZuVnIxV9XOCJwDb1Sl3qjYUybNm4T0rzdAK7ZZ+Ze9A3Doywp3UOhnSxsJQ6tdnjv
         Ei+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721412740; x=1722017540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3cF/tU//YplS5nRyz5oLLMVLav+V+FPLOKof/J5MTo=;
        b=QfvHYoWTkEsIIsPS+Fo2EPcshid3o5xR5mIxMPpTIcgXBQ5B2ARVPUw53UgtDW7A2v
         VS1g4Kpif7PTqUbBh2JcUZzPFnZS4sfr0HXL1Y7VM4mTv91i7FVarGVutYOFNQcKkaLp
         RQKr+m2QiW/8mRoLpIFb7B6TrqFHbpTmdjTCdcT8/TVx/knqQi2DuyMrsCHYHJSldbD7
         41Ts88HyGJSEOrBSiPuPw+wD2oIxp+Df2cZ33A4NNyiRBQrrEa4rFOcVQ6qdPGYCvlyK
         1Xyqm3kFw3PItfLjFCT/XaGWRM7Gn9ViC8D5sV5rY4YptHst8+01OWkU9YnKorUAeqL1
         KWLg==
X-Forwarded-Encrypted: i=1; AJvYcCWHuJDi5ZfKUzr1htW2CeJdVfsu1CLUdf2YM1YY6m4WF+3/CtUVnFIkFs3ggHA0xv6qTN4GPJ5hakbJyPajZatGvla0+Fvt
X-Gm-Message-State: AOJu0YxfRF8fhjA5EudcxZpRzIRX5B+RASQsQGfFQ8HYiDSYvF8dc5VX
	O381b+eTxaXGnAfmER7rbM/MVjCmjezsMsYR5l65v6I7q8sQyil8S0xidRFmmKTFxg==
X-Google-Smtp-Source: AGHT+IGQkwbVcp4D8oKxdRtPoLQiC3jGXnrExIerD6OV6FKZNbP9aUTq/C3jX1Ze1T2q/jqwmQXFDQ==
X-Received: by 2002:a05:600c:c09:b0:426:640b:73d9 with SMTP id 5b1f17b1804b1-427c2ca9070mr63116805e9.10.1721412739853;
        Fri, 19 Jul 2024 11:12:19 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (52.170.88.92.rev.sfr.net. [92.88.170.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d68fa0a6sm33549825e9.9.2024.07.19.11.12.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jul 2024 11:12:19 -0700 (PDT)
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
Subject: [PATCH v5 15/16] hw/char/pl011: Drain TX FIFO when no backend connected
Date: Fri, 19 Jul 2024 20:10:40 +0200
Message-ID: <20240719181041.49545-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240719181041.49545-1-philmd@linaro.org>
References: <20240719181041.49545-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: oykfhw44Ue6C

When no character backend is connected, the PL011 frontend
just drains the FIFO.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c      | 13 +++++++++++++
 hw/char/trace-events |  1 +
 2 files changed, 14 insertions(+)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index b8cde03f98..cfa3fd3da4 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -229,6 +229,13 @@ static void pl011_loopback_tx(PL011State *s, uint32_t value)
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
@@ -242,6 +249,12 @@ static gboolean pl011_xmit(void *do_not_use, GIOCondition cond, void *opaque)
         qemu_log_mask(LOG_GUEST_ERROR, "PL011 data written to disabled TX UART\n");
     }
 
+    if (!qemu_chr_fe_backend_connected(&s->chr)) {
+        /* Instant drain the fifo when there's no back-end. */
+        pl011_drain_tx(s);
+        return G_SOURCE_REMOVE;
+    }
+
     data = fifo8_pop(&s->xmit_fifo);
     bytes_consumed = 1;
 
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 4a9c0bd271..bf586ba664 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -63,6 +63,7 @@ pl011_fifo_rx_full(void) "RX FIFO now full, RXFF set"
 pl011_fifo_tx_put(uint8_t byte) "TX FIFO push char [0x%02x]"
 pl011_fifo_tx_xmit(int count) "TX FIFO pop %d chars"
 pl011_fifo_tx_overrun(void) "TX FIFO overrun"
+pl011_fifo_tx_drain(unsigned drained) "TX FIFO draining %u chars"
 pl011_baudrate_change(unsigned int baudrate, uint64_t clock, uint32_t ibrd, uint32_t fbrd) "new baudrate %u (clk: %" PRIu64 "hz, ibrd: %" PRIu32 ", fbrd: %" PRIu32 ")"
 
 # cmsdk-apb-uart.c
-- 
2.41.0
