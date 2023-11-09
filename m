Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp703491ejq;
        Thu, 9 Nov 2023 11:28:35 -0800 (PST)
X-Received: by 2002:a17:906:2bd3:b0:9e3:f79a:960e with SMTP id n19-20020a1709062bd300b009e3f79a960emr3481986ejg.32.1699558115687;
        Thu, 09 Nov 2023 11:28:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699558115; cv=none;
        d=google.com; s=arc-20160816;
        b=NEXg2D201Jf0m8XA9Raf2qzvzXtrVtSQisq7Wn2qy5y4HqUyDCvrX/d1dRISKiVH54
         8KQJDZysA0eMc/QIwTe7OCpIpwO604BmCc+Q05H0PwinDuD++UVQU//cH44jtZs2B/xb
         6tD/asmSRJYCYnIp1TYgeE3l8VagBdoXnrQ6FrZVxKbn2vh/OhCvJYHVKqrB82YaP2fx
         hlk4XW+aNTjcqC6V9IaiAU0KMfHlHw1npH/gvcYOpuPKzohUjhXnq8eCwBtvhdln5k5q
         Lbkn7xozEoktYHCvVWANHRxU5QI9vawe8hG9KR0RTReMu+pIospOJix/K44Oab4tKck4
         fObQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mP8e7F+MNf59pa1iU6FTfmv7Sb18zKeyajADdz6BZOc=;
        fh=Zi/lk1CoRxouROvt4Eod7oP2jg68ZE5jz0tOr4SBE9g=;
        b=PMlzDnF8Gf8fkkhioyOyfROja3sQ4OFxX2MZ0PUE+EVfE77lgcgGKz48AHqf51HkT9
         IU6KuRglGeosVMwpafxIb30KmOjT+2ipd9+g5+gpYICBLIzR1f4f75aN8b65RDUaU8vn
         vy+3ZjlMc0eevJmNtpbcZuR8liSyiIvE9id2hmBNC4GF/zSwhS7H/veRJH9H18kHHb6H
         pPscpvCW6jLnd0a8QC3/toT3cVcdvLM1EmAk0+A6+MUWZ7g2VTFdVqYYLymOAGJC8DxN
         rkKt6xNDqXzYix8Ggu6QtrxPqysSjXiIsq1Cu/BS3XcD6+JqZ0cvTuOmHzWvY7O43q3D
         0/HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lFwDjICo;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e13-20020a170906748d00b009b2cdcddb2dsor3218050ejl.0.2023.11.09.11.28.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 Nov 2023 11:28:35 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lFwDjICo;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699558115; x=1700162915; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mP8e7F+MNf59pa1iU6FTfmv7Sb18zKeyajADdz6BZOc=;
        b=lFwDjICosUmnGdTrpdoIqH/ZwDfbdT8ILa7GIUC9SezKbeIp3et3M7EhGy4rjoEIrI
         AjjQegzw30CMk9lytDkAgRQOwiBjDyiRLxppbZFXOwVESTW+/U2y8r5uInGulxN7wxZ9
         fm8A85cGu5D6Zc0fjXP1z4+OmaXcCu9XwpMV4/kzcLNhChkLuT4tCZwJbv/huogKkBgZ
         tpwz6CpNp0Jj6aLZWCWHP7BEfnihsZOv/eWO9SHeQSYTogeKkVhxf/aEGE8KEB2Rz2Jo
         y0NMreuEc2BQjwbHWK/+A3BYkJKHqM7qhSt57ya+r6Hl3+uVsD12f5EFQlZDlUbN4Q4+
         L+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699558115; x=1700162915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mP8e7F+MNf59pa1iU6FTfmv7Sb18zKeyajADdz6BZOc=;
        b=uE8EP8BxF04Np7ZszwySHr6jVdJBdUpEhGuEddo0xGLheRBhxj3Mn6GOIKaYOoBoJB
         tjSFWyiEblCw/TDk7eeNJyCacPzjdM8D0KRDXLOlzQvboTihfphEgekdN1dLsTiusJnL
         uztqnjRmAz3m8+T6+aSRscS4FizyDtolmY9UgpGPl5sDy3BMZtt1lRXA7deBMGlTp3vi
         I6F6ME4Ib13baQQLCf9tm24srk1U7cdMlV4z6tZ2uH8o/88+wb64KFoL5msjs5/G+TZP
         l/dkfThLE+SLvN+yvL0M4rIeccP2DR2pdOxoHfcE0LZzz6CAncfP0csKz2Wg+lga5ZvU
         URKg==
X-Gm-Message-State: AOJu0Yw5cMuOMXUKW+woEjDoc+t4P+fJAN7ghzCDfpGrkTusHnN4cTvY
	ygbWWHHFiCVN0RbkGkKewi9DGB+g
X-Google-Smtp-Source: AGHT+IGGos6RV93WgveC47MImoD//dBkcUR/VbX7MCdBOWuHJ/5fD+3r55VEGS5yvqHl0EYy1uU3kQ==
X-Received: by 2002:a17:906:d9dd:b0:9e5:21d9:3ba6 with SMTP id qk29-20020a170906d9dd00b009e521d93ba6mr712372ejb.9.1699558115130;
        Thu, 09 Nov 2023 11:28:35 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.199.161])
        by smtp.gmail.com with ESMTPSA id bw25-20020a170906c1d900b009bd9ac83a9fsm2946023ejb.152.2023.11.09.11.28.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Nov 2023 11:28:34 -0800 (PST)
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
Subject: [PATCH-for-8.2 v4 03/10] hw/char/pl011: Split RX/TX path of pl011_reset_fifo()
Date: Thu,  9 Nov 2023 20:28:07 +0100
Message-ID: <20231109192814.95977-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109192814.95977-1-philmd@linaro.org>
References: <20231109192814.95977-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: TEn9qsmcivZB

To be able to reset the RX or TX FIFO separately,
split pl011_reset_fifo() in two.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/char/pl011.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 58edeb9ddb..1f07c7b021 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -132,14 +132,21 @@ static inline unsigned pl011_get_fifo_depth(PL011State *s)
     return pl011_is_fifo_enabled(s) ? PL011_FIFO_DEPTH : 1;
 }
 
-static inline void pl011_reset_fifo(PL011State *s)
+static inline void pl011_reset_rx_fifo(PL011State *s)
 {
     s->read_count = 0;
     s->read_pos = 0;
 
     /* Reset FIFO flags */
-    s->flags &= ~(PL011_FLAG_RXFF | PL011_FLAG_TXFF);
-    s->flags |= PL011_FLAG_RXFE | PL011_FLAG_TXFE;
+    s->flags &= ~PL011_FLAG_RXFF;
+    s->flags |= PL011_FLAG_RXFE;
+}
+
+static inline void pl011_reset_tx_fifo(PL011State *s)
+{
+    /* Reset FIFO flags */
+    s->flags &= ~PL011_FLAG_TXFF;
+    s->flags |= PL011_FLAG_TXFE;
 }
 
 static uint64_t pl011_read(void *opaque, hwaddr offset,
@@ -289,7 +296,8 @@ static void pl011_write(void *opaque, hwaddr offset,
     case 11: /* UARTLCR_H */
         /* Reset the FIFO state on FIFO enable or disable */
         if ((s->lcr ^ value) & LCR_FEN) {
-            pl011_reset_fifo(s);
+            pl011_reset_rx_fifo(s);
+            pl011_reset_tx_fifo(s);
         }
         if ((s->lcr ^ value) & LCR_BRK) {
             int break_enable = value & LCR_BRK;
@@ -506,7 +514,8 @@ static void pl011_reset(DeviceState *dev)
     s->ifl = 0x12;
     s->cr = 0x300;
     s->flags = 0;
-    pl011_reset_fifo(s);
+    pl011_reset_rx_fifo(s);
+    pl011_reset_tx_fifo(s);
 }
 
 static void pl011_class_init(ObjectClass *oc, void *data)
-- 
2.41.0
