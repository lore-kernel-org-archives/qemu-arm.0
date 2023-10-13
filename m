Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1538480ejc;
        Fri, 13 Oct 2023 07:12:11 -0700 (PDT)
X-Received: by 2002:a17:906:220f:b0:9a4:88af:b82 with SMTP id s15-20020a170906220f00b009a488af0b82mr21290035ejs.77.1697206331616;
        Fri, 13 Oct 2023 07:12:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697206331; cv=none;
        d=google.com; s=arc-20160816;
        b=rGQWuYPMSkU7KtLQ5ryV10DMloeMCiThVrToPEeWHLvHOKCJDF0Yi4cMsEhJk2ALjY
         A9ITlxEKd66JcGwitWlNdXt9CSEubyVd3B1gJZGqC+IHUsvj8Sn5wOhq5YhEfV+h2qmi
         I+7X7g26Gw/MWquRV83Xbx6svS7SZ6ein+MUhmdpUYLmz2IXWLMhby9nRmMsN6UjCrhC
         au8zUyuoGwnjyrBiiDBI0MS9tKIl9ENlRt7pMwNjUbv8PSjhyi5XLwXOoXMgAMoXGa2I
         BSNlJEAbnAWOngDVwyEghFC9lEnMxbvG6EoCxBce1AzqF5/BVsPJk1E7Nt4DixcCwfWj
         NCcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5g0UHLmrzpBXUAHJbDdjYHH8dsW06tpS080WDx/2FO0=;
        fh=MusjSs7gXCZ/MKYOlww+3pkKR+FOAC+Wy5x6PlCIutc=;
        b=RY1OlmlzSzB5d7t05u9CpQqE/WU2lzY46Wjceb+TRJe4tI/zypOxzKy3gS/akhPNb7
         +TEaZu3qZROgOgFqck+VTGZhrZ2fd+FC/lW3iuXNm6T+eejojCarR8rQpKe2JNA2UbAd
         MBT/5992X4plcLATY86DqENnMc64oITlqjgluMv+vhh8wCCB91Gjtw2B1OB7HAUfZXtp
         Ygrgd7qGF8JhVTz7hGGjplqBJBxzDCQ3qQLcdev72nUvVhRtLa7HBG3l7KWxDJBa7mAG
         7nulqeRRYhrHR+KT8EXsCixHRSRslGPKcdK9u66SoX63X58HzegzmpP9P3Nsx/0vqVVZ
         ZSHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Skj3/NQw";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id og51-20020a1709071df300b009bd915885a2sor1421592ejc.21.2023.10.13.07.12.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Oct 2023 07:12:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Skj3/NQw";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697206331; x=1697811131; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5g0UHLmrzpBXUAHJbDdjYHH8dsW06tpS080WDx/2FO0=;
        b=Skj3/NQwtE9Kzt+yi7y9Mj04AT0HtZCxzEB93o2uzmp77ZkrNUfTc4LMG/Y8pxdW5j
         3xtdnNrLXa2CagyLap7fGM7zNop5r4AgKw7+fuUPI4uRRJsj4/63faSjklKnuAg+3rdH
         XZPzRsgNJlKXTVpbJUWbMY+ajTvva5UeoPmijzwaRnxgAK1f6/7+NLNIy2WK1RR6gkxd
         pMw6SwpbX+lM4IwMG78mk2zM5iNvc5sJZNAmC0AFIimS5MI2IrRvJZQZbkC2qm+5mlb4
         g6UXNocxScL05Gzhg5AgceCa3QkYFW56+x3BIcAXLfbWTAO0+pjiXOcD3dWni0fnKrfV
         omTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697206331; x=1697811131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5g0UHLmrzpBXUAHJbDdjYHH8dsW06tpS080WDx/2FO0=;
        b=pSrjK42Me6mUhypvMETxY1/6x3OeE+aEXs+yzSR1VAAVpMasrs8ssrAPVCewz0Cx6h
         T+S4RB7mjM0xCxkVrn2rLUIgEuNDxuEYae14uW/eHA8ay9IG0e6YtZFinKeFT/TqgyAl
         NMd30WCTTAd9BR12Bcb0JblJneNyuBNU+vvT0u97/8bQ9VZJokuqAKwXwAWinrFSNkRA
         UMTcdJPyOG4lmv/XUpbvGm80t/uONGfEyajevTrkX6Q7rme9i/NDjAy1Lea1LhoRUdme
         c1flcTd9HhqvO7mdTWjNgKMzl5AsTj/IE7Cc1y9zbwErK1bkUIdq29SOo1KIuVJf+IeL
         PsTA==
X-Gm-Message-State: AOJu0YzYhp6O607WiA+WqIHS3yMHd8hnscrGE9Z/1w1zbUByR4kgwLAy
	vzX8hTD5ejwGBou74Zqmio1aM3vt
X-Google-Smtp-Source: AGHT+IEU0+VaJj644Dxa8lEx1bgYoJG65nDixpQ3I5LhB91q96hBCxy+8t0gQFmYrSDIts+JZpp4YQ==
X-Received: by 2002:a17:907:a0c7:b0:9ba:33ef:fe51 with SMTP id hw7-20020a170907a0c700b009ba33effe51mr9836619ejc.11.1697206331196;
        Fri, 13 Oct 2023 07:12:11 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.172.118.168])
        by smtp.gmail.com with ESMTPSA id jw5-20020a170906e94500b009ae6a6451fdsm12419392ejb.35.2023.10.13.07.12.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Oct 2023 07:12:10 -0700 (PDT)
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
Subject: [PATCH v3 5/10] hw/char/pl011: Extract pl011_read_rxdata() from pl011_read()
Date: Fri, 13 Oct 2023 16:11:26 +0200
Message-ID: <20231013141131.1531-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013141131.1531-1-philmd@linaro.org>
References: <20231013141131.1531-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4sHx/z7y0F2v

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
index 1cb9015ea2..30309337b1 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -160,31 +160,38 @@ static void pl011_write_txdata(PL011State *s, uint8_t data)
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
