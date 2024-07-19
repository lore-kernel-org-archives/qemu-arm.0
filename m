Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp616885njc;
        Fri, 19 Jul 2024 11:11:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVI1CtclirwLQ1KHpdG25tBn8uUcnRUg1J6R6RzYwHdqZ1Y9LTKco9WRJsMcSV9ftB+I6PMhTrLSTCV9mzSkaA5Py84y7n7
X-Received: by 2002:a5d:64a1:0:b0:368:48b1:803 with SMTP id ffacd0b85a97d-36848b10da9mr6737284f8f.12.1721412663517;
        Fri, 19 Jul 2024 11:11:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721412663; cv=none;
        d=google.com; s=arc-20160816;
        b=d44N5FnCeUF8GyfSu39YqwxGQv7PytDWFXJy1Wh94t7h97dVdkNfILXGKtrRvKgcJ6
         KYJINpfaGHWldQeFVhuHU+OQDr5QLKihkXo/gYejkm06uFQttz3b3fMiiGDOpEcGyATN
         DRM0n5DQOkklXNatgzz26saOLx9wAR8lsUcpgyIZdAEB4VZyC6WQ6rZxiKTWBEz4DHv3
         E2hF6oH9TAY0S2SIKne4wdEsKL3v82kBGs5fJfb9O0Q5zKuCKiBy06JxYbOyTVT1HulI
         aPuVFW9dZ6ymnukhwSaSggWT1qGOTAgRqcedeVfGu+XHRfVrtTnvp8OM1WE3Pl7IRNt3
         lAgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Pcbf3AvGHvD4fhRiEOLagM3LlfJ7dGGey9tdUSZ+O4Q=;
        fh=1OERTRmy4Qrw4Pxh4/PuLeaPS6e7qas1K/JhkUS4n1U=;
        b=lQ7avbiSRau0ZmeB1/Loz6HCp6Q8c1zaSox3VNuKe0+5+duZy/wygIbJfonBblqObO
         PvXHt25sRsCicQtdfNYmwYJK52O4n096QrsrVt46K+1ju0zcZvQZKmrOdZ/m9ZBsyNd2
         AlBhrDkXlkazszdxscQlCD0D6FpY+QDFv0WUYG2nXNcwXAOjre28GbAg1T0n2/Z0NXmG
         e/6TUdla+Qkv3JClolGNcj4WKwi6WRVF8IFcq48+v71x98nMSTijD+vQp85/U0GPVO6x
         rCOBsw2Sqhv7YOCHZRJ0RYF+gePhPNi99cJftwZKCRtNwaRpwbVeFyg2pGhc6bTPsWqm
         1CTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rIyupLqe;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-36878833ccdsor530949f8f.5.2024.07.19.11.11.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jul 2024 11:11:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rIyupLqe;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721412663; x=1722017463; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pcbf3AvGHvD4fhRiEOLagM3LlfJ7dGGey9tdUSZ+O4Q=;
        b=rIyupLqetGnASHTBq9jaYhG/SiqTfb59tjLwS3PHGSus3rWeOb/NW/32RSYuo5FBxw
         4GTmTYMRaRmaPpbmCKSTF0FawJgzSR0RWcj9/MHXr2c/LXiqRqaU0ygyQmiwExDPCEIB
         awkkpjbFMeADE7LQmhtRc9xBFHHk1zq/07tMgUw0hGfjec69jmXceFrRslNpqeglx915
         djVjtMAZbfX2L0OSRK/ZWC8ScOYgxpk6P/PCVgQMUh3q4sTsy5N5ERWkDhbCk8aVTK6v
         8UTNxVXl/afg19P3OdrzENYNXLuIDklIybYTfxjuqzOusTDctGHYzTIKbC7ZfRm/StP1
         Mo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721412663; x=1722017463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pcbf3AvGHvD4fhRiEOLagM3LlfJ7dGGey9tdUSZ+O4Q=;
        b=L7wwAnpedDGFx2LyNNtS+oWs5eoFyvDVcpGwE+KBY/72qKyBfw4FMngKU0dA3XFkAh
         w26R9ecrAxd1nLKB/jD0g/XievhllV4KFtQvJ2Z4nN/YeOsu309o3SVrqBQpLhAps4V5
         Pn0I7eEVsMhqfmZmVrlxuxeo62Xm9FjIaNosIi4fiU3Ozh3oYAtaa3iXdVHgOodUnzLn
         eubHC00XpOxYhtNqBscC+7JZ6tpzMKxadbhtL7aOgWJsA/japWvjp3FIApxYNab9lAYS
         Yv1qdabgZdd5cxfkxvc9NM+QRV5xIGvhqp493PbiGOWKZr3CtcO+GIoYb/3jTKipziXP
         aryw==
X-Forwarded-Encrypted: i=1; AJvYcCWpSv+uib/C8R4yneSPLH44GWIcFIK1d3riTZ44lRQbKFbmja0OqcfwVoMdXnGO4Hv3gJFfwjgtrrdYamYH1oVxHmaoZKmd
X-Gm-Message-State: AOJu0Yzk1JyzfaGk6y6ngA5ut/KS9mNAB/tvlwq4hh2hvMCZS+lynsNP
	4jpLVhiO6Imvk5Gt4No7ATwA3nA671UeIy3iffEesI1xPH0h8xJuh91q9GuGzCh5Fw==
X-Google-Smtp-Source: AGHT+IHKGAtGplxlsw04A5Xyo5rKG4NyQ6nejAtmR2e06wwDRwmeAjWCa1URvp0UhWUd79dYwqRQjQ==
X-Received: by 2002:a5d:4cc4:0:b0:367:f054:7aba with SMTP id ffacd0b85a97d-3683175ce54mr5619270f8f.41.1721412663012;
        Fri, 19 Jul 2024 11:11:03 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (52.170.88.92.rev.sfr.net. [92.88.170.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3687868420fsm2231578f8f.3.2024.07.19.11.11.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jul 2024 11:11:02 -0700 (PDT)
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
Subject: [PATCH v5 03/16] hw/char/pl011: Move pl011_put_fifo() earlier
Date: Fri, 19 Jul 2024 20:10:28 +0200
Message-ID: <20240719181041.49545-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240719181041.49545-1-philmd@linaro.org>
References: <20240719181041.49545-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Gqlrjg8HBYzR

Avoid forward-declaring pl011_put_fifo() by moving it earlier.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c | 46 ++++++++++++++++++++++------------------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 260f5fc0bc..edb5395fb8 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -159,6 +159,28 @@ static inline void pl011_reset_fifo(PL011State *s)
     s->flags |= PL011_FLAG_RXFE | PL011_FLAG_TXFE;
 }
 
+static void pl011_put_fifo(void *opaque, uint32_t value)
+{
+    PL011State *s = (PL011State *)opaque;
+    int slot;
+    unsigned pipe_depth;
+
+    pipe_depth = pl011_get_fifo_depth(s);
+    slot = (s->read_pos + s->read_count) & (pipe_depth - 1);
+    s->read_fifo[slot] = value;
+    s->read_count++;
+    s->flags &= ~PL011_FLAG_RXFE;
+    trace_pl011_put_fifo(value, s->read_count);
+    if (s->read_count == pipe_depth) {
+        trace_pl011_put_fifo_full();
+        s->flags |= PL011_FLAG_RXFF;
+    }
+    if (s->read_count == s->read_trigger) {
+        s->int_level |= INT_RX;
+        pl011_update(s);
+    }
+}
+
 static uint64_t pl011_read(void *opaque, hwaddr offset,
                            unsigned size)
 {
@@ -314,8 +336,6 @@ static void pl011_loopback_mdmctrl(PL011State *s)
     pl011_update(s);
 }
 
-static void pl011_put_fifo(void *opaque, uint32_t value);
-
 static void pl011_loopback_tx(PL011State *s, uint32_t value)
 {
     if (!pl011_loopback_enabled(s)) {
@@ -440,28 +460,6 @@ static int pl011_can_receive(void *opaque)
     return r;
 }
 
-static void pl011_put_fifo(void *opaque, uint32_t value)
-{
-    PL011State *s = (PL011State *)opaque;
-    int slot;
-    unsigned pipe_depth;
-
-    pipe_depth = pl011_get_fifo_depth(s);
-    slot = (s->read_pos + s->read_count) & (pipe_depth - 1);
-    s->read_fifo[slot] = value;
-    s->read_count++;
-    s->flags &= ~PL011_FLAG_RXFE;
-    trace_pl011_put_fifo(value, s->read_count);
-    if (s->read_count == pipe_depth) {
-        trace_pl011_put_fifo_full();
-        s->flags |= PL011_FLAG_RXFF;
-    }
-    if (s->read_count == s->read_trigger) {
-        s->int_level |= INT_RX;
-        pl011_update(s);
-    }
-}
-
 static void pl011_receive(void *opaque, const uint8_t *buf, int size)
 {
     /*
-- 
2.41.0
