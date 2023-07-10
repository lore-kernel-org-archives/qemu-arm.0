Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1351581eje;
        Mon, 10 Jul 2023 10:51:58 -0700 (PDT)
X-Received: by 2002:adf:f6ca:0:b0:314:1249:d5d7 with SMTP id y10-20020adff6ca000000b003141249d5d7mr14319233wrp.16.1689011517899;
        Mon, 10 Jul 2023 10:51:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689011517; cv=none;
        d=google.com; s=arc-20160816;
        b=XATQ4yumIUL8O7/y6DnGPlMRh8SuJm8wB8JMb/Tzo0nRYc0/S6ru1ljMpdHkgoZlp8
         wubxPN5W3WDIbT5ymdSiGK2rvLk6JrgO38TNDvi7tW7YVCsEcsWid5OlVuFqPPmtmlRW
         1OQK1bZjhFPFX06ZMmmXa1ASoSxAftpSF/IMDTIDFJ2eNjuzPDqva7oPDzCEqCRC03ix
         P/N/w11ixgb7m0Er3N+WKXGv7k+xjjEfG0EuR14i76PU5QV/zBakmnMag6kKinx5q/IU
         YMaJoAswN5Rmsy0+LO10sYSWSBGBK0KzXcwzTt8MaDOZ+EJVJ2NL+VbuhjhLAYWCGZO2
         l1YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ef0gwQxZ6wwALYiU0bKC0wOaAk58Ouu2v7vVPMXHDsg=;
        fh=4TWVGTMFk+XB48cTX7H3L2FEUZf3X6lSQ5h15kr1III=;
        b=vUnlVV/AapxNLGwlHpNaPiSeLBxCrMx/hTUTtgFaZB0OLyGF/K9fbr4LPJLD3Wo4Pn
         Fb8k/zK/e7hFWtd+YWAihAH6VF1ovF/rJgPSyWNqB+cAdJAI9GiHyEdnt08OlMbUPGcI
         Qlzl4uy4gUpPbOI8M5jbjequnMBJhl6Wpxtv5wu0QR5vUQBuDjjcKtjx94EOg8tpjo+S
         4tVrclfj22i9UxkZSIOjvzdNJ9sSu1sFOirZmEYl2QuYYVYwR3ouB61nVUxP4SC+gGhP
         khKbiVPxtXCZofnEiasbkiodCXG9s3Aa//BEk1+cZlPg5Rg6/WXgpZcHHujzR7WWB6HB
         Einw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eb39i6i7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u17-20020adfa191000000b003159126fccbsor12976wru.5.2023.07.10.10.51.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Jul 2023 10:51:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eb39i6i7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689011517; x=1691603517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ef0gwQxZ6wwALYiU0bKC0wOaAk58Ouu2v7vVPMXHDsg=;
        b=eb39i6i7xi4nlBgWcpkrPATAugD/ggTyTyPTcXl+fGuW6SV0vt8rj+5FHUlxaH1vnX
         iLDdCSljVhVQRZBY0YhxR0w4s0lkssx6npLSXepZhggJnSx/z535pdpgeLuYUAHlcE5A
         AtkEXWML8t6KVRp4AbuNsBCjbYq9ahdSX2dnBbryKfxmr0OMA/LZQxXYsyNQBrA00JbK
         mE8xfj8oGKbuQEbSMD49k1ZCkR9YVWOFbGdbkTjvL5+UKjwm8hV7/Bas7q80Tl/Ckb72
         6cdoWJkMxlaNMguwahRwZuIC2GcERO+FJryvCRgN02rtSQY9bJIq4EZ8vgxpcPD5JW7y
         n5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689011517; x=1691603517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ef0gwQxZ6wwALYiU0bKC0wOaAk58Ouu2v7vVPMXHDsg=;
        b=Wx1liPuBQ44N1UfWA1OWzrsBFPAET4XJy41HYG1wOO4CIE8CHtsQkOrJYzXQABbfWF
         eylZYZHAriCZVbsmhFSumFOhGToDEG0dZ8+pOz0QscFvfamqsRIAp9ofPaC588PFLiS5
         JK5lR/cc+lB8GnbT/9w3sv+Zn4kPio3yOYH1h+DEOp7f4Qp4E41AJByxk7NWhPMQaBQi
         3zQ9AZRd7VVLbbZ4VZYFRFTQsF7QEanpqjoaWpwW7yiwa7UHTCwKFw3qZlISg+FBOjex
         yCS0/O3LzMvpNlxnsTpR14zC8rAIV2D4MQSDry1LO1S3axxFvSi4x30OaJvaiyJ+mScQ
         mmMQ==
X-Gm-Message-State: ABy/qLYcXUdKAcYG5Cf8kadYJV6pREYGGjX55q8dbRC+wNb9x6jHUWHO
	CJMlyMaIZX9rAkF/O6z6+2AGeHSf
X-Google-Smtp-Source: APBJJlEw9Mu92KmORByDTBzHmJFR/rQlWsrR8POA7WWXn5RQfPn8wTX4kPsHuxuywA9ys0awNDcUvA==
X-Received: by 2002:adf:d84e:0:b0:314:2d71:1f7a with SMTP id k14-20020adfd84e000000b003142d711f7amr16256091wrl.32.1689011517665;
        Mon, 10 Jul 2023 10:51:57 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (mst45-h01-176-184-47-225.dsl.sta.abo.bbox.fr. [176.184.47.225])
        by smtp.gmail.com with ESMTPSA id p7-20020a5d6387000000b003143801f8d8sm7154wru.103.2023.07.10.10.51.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Jul 2023 10:51:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gavin Shan <gshan@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 09/11] hw/char/pl011: Check if receiver is enabled
Date: Mon, 10 Jul 2023 19:51:00 +0200
Message-Id: <20230710175102.32429-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230710175102.32429-1-philmd@linaro.org>
References: <20230710175102.32429-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rUpxLV8bR2ZS

Do not receive characters when UART or receiver are disabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 03dce0a1ec..59d239cb83 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -77,6 +77,7 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
 #define LCR_BRK     (1 << 0)
 
 /* Control Register, UARTCR */
+#define CR_RXE      (1 << 9)
 #define CR_TXE      (1 << 8)
 #define CR_UARTEN   (1 << 0)
 
@@ -357,9 +358,11 @@ static void pl011_write(void *opaque, hwaddr offset,
 static int pl011_can_receive(void *opaque)
 {
     PL011State *s = (PL011State *)opaque;
-    int r;
+    int r = 0;
 
-    r = s->read_count < pl011_get_fifo_depth(s);
+    if ((s->cr & CR_UARTEN) && (s->cr & CR_RXE)) {
+        r = s->read_count < pl011_get_fifo_depth(s);
+    }
     trace_pl011_can_receive(s->lcr, s->read_count, r);
     return r;
 }
-- 
2.38.1
