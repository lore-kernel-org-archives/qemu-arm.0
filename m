Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp617107njc;
        Fri, 19 Jul 2024 11:11:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW5k4MK4jp19dAkjzXw4wJ7vqkYSkizh05amqTMy8+RhBvldKKgyPNrbUBHOmikYcYsNk9VUFzSzK8krMlb6tdWQLOkSeGW
X-Received: by 2002:a05:600c:470e:b0:424:8dbe:817d with SMTP id 5b1f17b1804b1-427d2a95525mr40257905e9.10.1721412687386;
        Fri, 19 Jul 2024 11:11:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721412687; cv=none;
        d=google.com; s=arc-20160816;
        b=NtsOfe/PDxOHUDLd9iz2YOf4qjPJbR/L7iuWISQezfanCuyQzf6UICEPIsyUtUqUtU
         KqHPuCbtcPhT7iu/zEov6f1N03bmbMysiEn8SjONwMh46Qkc/UoEoafwvY5/eZWSkcK6
         MdZu+Iulp8+OMII/lkiPZZgQ5pdD8Q7Q7AKaqdtxL+da6urx6rgXdpsyHdFuK91RAt8V
         zaIqbIXSWXHZgRElGb++6b1t5d7jkKTfsLVB9MYNqVGyi4EMw6TEtbUxIm1NQLav/2yE
         F+dasyGhNrGNwwclOqjNU9tiLUL/LEqvAFk5dzezFafz/+ahFPhLJG9xXr70gzxoOLB8
         d4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DMaUbmKJbBglpDupXq1EpryBjAO9Dx7J7NA5WWzmpPw=;
        fh=5CA83yWCkjcvHaahwI6WXJTP40uPrMZAewM3PkKKmnY=;
        b=s2wUGZC/6rxHcWpL55EixP9JRO34c+rS7iVxb+ePhciqC0N16XDkGZBX0Y2DnsPfcu
         kYUwQRopWLtSjyHE0QleLQ615dz/25RgLlavhKa7uT7wgEdwBZF5l7UxZNFuEiZ4JTuL
         3SVnp1Eihw/Aofi+HHBSArSYmUpWaPtc0WpmrUDQJd47mPM7ioLLyxYAClZKZKBPIRtP
         ZmySZKSKLgRinxMGFrTX0eu5qarej78zMkNmj02D8Y6KS1OuioF+km7Qm2DCGzBHrBof
         O4XEVGL5vU3ysLdUbOtxbtTPmhLIBdbuS4w2uu3gu3ujDQaTX5gVMdbGU1nZclqyrQGY
         4Hgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yYc+hIM+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-36877fa935esor529229f8f.5.2024.07.19.11.11.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jul 2024 11:11:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yYc+hIM+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721412687; x=1722017487; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMaUbmKJbBglpDupXq1EpryBjAO9Dx7J7NA5WWzmpPw=;
        b=yYc+hIM+W+li9fjzVSsja+k0mRbkltCl+pCcSluuWiHg1NVoNOKp3QQolkMb0V/OsO
         G95YeLW4gM2euLl3Fp9BVRE2HQlOfuskDZZZi9SlQaZWuBGDJ8p7hxWEcNEOK5HNvwTd
         m8aY8kxFndXwM3QAiM0/OXJqdAzn88uD3/Xs+BrWa780j9K0I78787zbhlvS1hSV+o2F
         fApmgDzcAON76VXWDl8ZwahHzfu6Lnb20lTFmn4lHOYeD8GnO5/qgxQVfmN12RipSamr
         Bywii6FKN9Iw0beJm4Bczv7IYWA2QPK/FY3yOQdqBCZXMAQ+a8QTqKM27D+LjD7Yki8m
         MZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721412687; x=1722017487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DMaUbmKJbBglpDupXq1EpryBjAO9Dx7J7NA5WWzmpPw=;
        b=lq9MCsOZ9g3lmS/wTWQE5ZIu/xjCmsE+FiuTjBRi9ZAEi3Kg8DC559wLOEPxciN1oG
         n/Ztu0WPWC5Qn+zgEphIUlCsKty14Z9ZQQ+FW1jFYZ0D9XPT55MFVaTBK2dAWL7wfv6c
         c8W5c9ZBwPGikCjz4XAIbdzA1LbH4FASH066Qv+/r4+N+IcdHUWE9bMcrvhoPlJxw+/C
         1uqzRDtfm7HXbdu12+jbP8uJVqgn8Bj2WKTWXhCVw9G1NvDnHGkyNvv0LVmZbNhfVd3V
         uNt9fm9matjWioITzzGibwlDsPfautZrTseCYjpR92UDvW0k0bdEGGEPo509Cg0Y/D69
         cGBw==
X-Forwarded-Encrypted: i=1; AJvYcCUNDKO4vIm/ffRRPtba5bLDyLPkQ5CnzZKL4vtLJRWOegxbZyLjOa04JdT1yPATXsn+WaOFyZQo/koEsorXA9Dgf0UxAQ/y
X-Gm-Message-State: AOJu0YxBXEn/7FpN0EivXY/qoAQljs5crPEu/zjKDqwM4LTaKW+QUF2d
	i2PXSDJdX2ZQIA+FHpYRUVb2yiUF6MaIl6sW4SNKjGLOIp3njsRMtpj2hQiP9nMYUg==
X-Google-Smtp-Source: AGHT+IHVhPZBltdNb5U19GKKsLFLqnLr+nLG4pavFd4q5Bf7ToAHBrItgl88M6VjcmZTDPKOzL9Caw==
X-Received: by 2002:adf:a3c8:0:b0:368:4488:66f8 with SMTP id ffacd0b85a97d-36873f18f12mr2144385f8f.23.1721412686920;
        Fri, 19 Jul 2024 11:11:26 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (52.170.88.92.rev.sfr.net. [92.88.170.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368787cedabsm2217831f8f.84.2024.07.19.11.11.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jul 2024 11:11:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Tong Ho <tong.ho@amd.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 07/16] hw/char/pl011: Extract pl011_read_rxdata() from pl011_read()
Date: Fri, 19 Jul 2024 20:10:32 +0200
Message-ID: <20240719181041.49545-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240719181041.49545-1-philmd@linaro.org>
References: <20240719181041.49545-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: S8jDgpV0P+L0

To keep MemoryRegionOps read/write handlers with similar logic,
factor pl011_read_txdata() out of pl011_read(), similar to what
the previous commit did to pl011_write().
No functional change intended.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c | 41 ++++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index c2ee9b0321..5e44837206 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -233,31 +233,38 @@ static void pl011_write_txdata(PL011State *s, uint8_t data)
     pl011_update(s);
 }
 
+static uint32_t pl011_read_rxdata(PL011State *s)
+{
+    uint32_t c;
+
+    s->flags &= ~PL011_FLAG_RXFF;
+    c = s->read_fifo[s->read_pos];
+    if (s->read_count > 0) {
+        s->read_count--;
+        s->read_pos = (s->read_pos + 1) & (pl011_get_fifo_depth(s) - 1);
+    }
+    if (s->read_count == 0) {
+        s->flags |= PL011_FLAG_RXFE;
+    }
+    if (s->read_count == s->read_trigger - 1) {
+        s->int_level &= ~ INT_RX;
+    }
+    trace_pl011_read_fifo(s->read_count);
+    s->rsr = c >> 8;
+    pl011_update(s);
+    qemu_chr_fe_accept_input(&s->chr);
+    return c;
+}
+
 static uint64_t pl011_read(void *opaque, hwaddr offset,
                            unsigned size)
 {
     PL011State *s = (PL011State *)opaque;
-    uint32_t c;
     uint64_t r;
 
     switch (offset >> 2) {
     case 0: /* UARTDR */
-        s->flags &= ~PL011_FLAG_RXFF;
-        c = s->read_fifo[s->read_pos];
-        if (s->read_count > 0) {
-            s->read_count--;
-            s->read_pos = (s->read_pos + 1) & (pl011_get_fifo_depth(s) - 1);
-        }
-        if (s->read_count == 0) {
-            s->flags |= PL011_FLAG_RXFE;
-        }
-        if (s->read_count == s->read_trigger - 1)
-            s->int_level &= ~ INT_RX;
-        trace_pl011_read_fifo(s->read_count);
-        s->rsr = c >> 8;
-        pl011_update(s);
-        qemu_chr_fe_accept_input(&s->chr);
-        r = c;
+        r = pl011_read_rxdata(s);
         break;
     case 1: /* UARTRSR */
         r = s->rsr;
-- 
2.41.0
