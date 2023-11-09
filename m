Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp703592ejq;
        Thu, 9 Nov 2023 11:28:47 -0800 (PST)
X-Received: by 2002:a17:907:a0b:b0:9e2:8206:2ea9 with SMTP id bb11-20020a1709070a0b00b009e282062ea9mr4528685ejc.60.1699558127061;
        Thu, 09 Nov 2023 11:28:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699558127; cv=none;
        d=google.com; s=arc-20160816;
        b=j+FFlf6FVZEb3NT96IVxQYXrA/5LPrf5jQZoQ4TjoBOtFT4VGAbV6PENn8ZAedA8N2
         z0WSn4brKX8DwRNobFgUOEkFGip1K0Pr/DBO3x74SfsS1F4LkC7xt/mYUYcN9DqWET7X
         W81eQrDgpnUFCM2xtTnwf1UlNHjwwXGUMxQ8jjQ1YcHWR/VgoueN3AHqZeVVIMjw2Ik0
         zGkZUIipNEuoZowsUhzKXHVwNcots0AsCwkVH0ZryL0tw+l5ZJg4AUEQOZGqUwhksY3O
         le7XeCoCgJJXR+2ZRyl30eyjvecyP/7qc4OvRyWeq7WRS5mHuEqazlFtX/PPwgUXFN4/
         Qgow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5g0UHLmrzpBXUAHJbDdjYHH8dsW06tpS080WDx/2FO0=;
        fh=Zi/lk1CoRxouROvt4Eod7oP2jg68ZE5jz0tOr4SBE9g=;
        b=yt8/BIZqLkJXuNdXi7W08hUnz7nwGNKgCS6VsDeI1n1IrAsbchFQT8YIGymjd820Qr
         A7T9nlh+naG6TetKkKn6QJPopdHN5gwF0dmctpASRPbjCn0QlXJnX/2wM3a17SFjlpij
         YQq4wdRHIN+X1K2jiZA4yIwTkg6YVDSZMGi82gBsu/6jrE2lIhEMcdRYZalagueUDyQB
         oyuvVagDYPE1mGfWmlbWdH69Df9V0zjYzHfm6kKve7DEVljNgm7Ski5p89sOw+O1f5hP
         UJcCzUhDKZNUXJ4QV+NWYI8AWgJ4RerN4MN3/4WxQFeTMeQ/qF1Rdc4pNQrEtgnuGnHe
         lChg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=obM43wGj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z26-20020a17090674da00b009b2cc662802sor3221809ejl.15.2023.11.09.11.28.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 Nov 2023 11:28:47 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=obM43wGj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699558127; x=1700162927; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5g0UHLmrzpBXUAHJbDdjYHH8dsW06tpS080WDx/2FO0=;
        b=obM43wGjZiFd2QCUjN7uR39Pk/pC9U70LsXmIWMNomc66PD3qTP2U/Co6SRaey60c5
         1ghqe4cW2XJjeH09TMH/dbmtVqS93Iwohj+jnwwMeBCMmRC1sAy9PDFLafzNBHDycj24
         Pwdozz40qsoCoj7ZmX9+wXDv8r2HLrbzmA086L3M58me8ASDSQuR2tmvD1egGbtudlap
         B1PJu2+PLdCc8FMT6XFyFsMOamb6tXnI6Zrsir+tTP8vcGwD9JQo42r5qRutXqSjgKzY
         FOmdDbef98eubpUu9yAuCOXbPTKySeunhZSjQ+32SE3SUDTJTSdrcjAYwKnINa6mB43f
         /UpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699558127; x=1700162927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5g0UHLmrzpBXUAHJbDdjYHH8dsW06tpS080WDx/2FO0=;
        b=nCVwZS999lLJJQ/cogPn+Z1ytKqphOGnj1XV17x0K6iprK67EGqLiFTZrBdwBXqaBh
         wVRxO67TugY0cjXgUs1CVxFPipTNr0T6xxyKH4WVu0cSwzIiq6JaWPpRyoKlY7yXaoNB
         Knpikwn4PP1p7He5JgUsPs+Vv9GbiNlUFu6RFe0zRHR6YPmUxIdxXfGWBY8JZgMfvXzI
         lAN/BlNfWP1ibH8y2wLhDsWDnCNe0Nb0Cd0EHN7urbzsXGYzlShgBQECYCKO/+Ivd8tg
         yyFRlvyLMXrUzQaEWfT/duFvjp/WajHlrrLTtXmhL4cocaHOEJXvNZWlU+sZIF+fSrIm
         hFEQ==
X-Gm-Message-State: AOJu0YynLUfIHF3X0k3G3GqP2cXBNjkyDtDGaXM/KRMqSpXSnDKXb9kt
	HsunkaiBvtf54j+2dhaSe/ErZ58c9LpivH8jmYSrMhG/
X-Google-Smtp-Source: AGHT+IG1mIB1epOkXgJaPMduGKGeTPr6W+PS0WSWibBTbSNphDMXSkK+WfnOF/yBf0DY9R9lsFpDqg==
X-Received: by 2002:a17:907:26c9:b0:9d2:ab03:a22d with SMTP id bp9-20020a17090726c900b009d2ab03a22dmr4450766ejc.73.1699558126739;
        Thu, 09 Nov 2023 11:28:46 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.199.161])
        by smtp.gmail.com with ESMTPSA id qx11-20020a170906fccb00b009b2f2451381sm2930998ejb.182.2023.11.09.11.28.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Nov 2023 11:28:46 -0800 (PST)
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
Subject: [PATCH-for-8.2 v4 05/10] hw/char/pl011: Extract pl011_read_rxdata() from pl011_read()
Date: Thu,  9 Nov 2023 20:28:09 +0100
Message-ID: <20231109192814.95977-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109192814.95977-1-philmd@linaro.org>
References: <20231109192814.95977-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: M7WZFXZbcqlK

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
