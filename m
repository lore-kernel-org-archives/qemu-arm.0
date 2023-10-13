Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1538367ejc;
        Fri, 13 Oct 2023 07:12:04 -0700 (PDT)
X-Received: by 2002:a05:6402:11c8:b0:53e:467c:33f8 with SMTP id j8-20020a05640211c800b0053e467c33f8mr1625837edw.20.1697206323819;
        Fri, 13 Oct 2023 07:12:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697206323; cv=none;
        d=google.com; s=arc-20160816;
        b=BpMwXvkJnA6+L6CaJoKdtYCB3bnu47huoOAV3cZXncCvx20HQ4kzTEx9HLY6yO+hzT
         +5Wif1TBsUURqPsexstZWOPLmQSS2MGJ2gcZYzozu1sKT2M3ymneNA1duP4KOXBczWiS
         qKzgvIGGaoBd5nzfaP0TUWuImPFSk9ARD1QldN2MtnDyGZwM1vg7O4yORq6ev0DgRuNG
         +gZksMnTVYVDKiKCXuA8nXvY5RoO9YReFeR2d8PQnaY7c1d9mWM00FW5bBauUQZIYU/i
         hZRWMj8NBXKPCkT2XZNo6h51H7FgVfDoUzuQo91EOK52V+2IIxEtYidrhQA6Of5m9vek
         Eu9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4RcEaeq0Z+56TpsJGBFP08HsnS3amqPkJQB4mf707C8=;
        fh=rgPM1QcSOyRuPluCdnsNd8knie+1OCUx2q8ta7MpVFI=;
        b=VJLC7uhhIoskUHdFmbs8ClgJyKUT/29MQ5DQepgaWvxU2hjW+XyRDiuz5kGgmop2MI
         Q0Y4ozhVrjZwd6+4JZl0N4x35VhGqwc9H9HNHGVCXEYYbHij5IfJAjrmPm7QHWC8+rPy
         mvKh9gMag56wCeEoSHOtsCPe0rW149RYLXnOnFoJSUS1kzHB9OS9dn0/EyycPf5s21PQ
         21m8gflcv8kuH8k2Nh00qhMXkqq6J0uk1/PBMB3SExQ4MhBkVMSiazLnWVBrtyyB0JE6
         AxTJTjH75moupdDy3M9WNXDKLHWnbT066Ng/BroJmP3Iqy+92s9aK9tWuaQDMoHUNHJP
         HHvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tK8zKxy8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d24-20020a056402401800b0052f31fafd89sor2555152eda.1.2023.10.13.07.12.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Oct 2023 07:12:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tK8zKxy8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697206323; x=1697811123; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4RcEaeq0Z+56TpsJGBFP08HsnS3amqPkJQB4mf707C8=;
        b=tK8zKxy8WVVAG9tqo3ALqeZkrrHYlmAfwbei2tT7cc5Ur/7fh8To8QJmnkUnxZxuWh
         DjQUokgc99pdT3hRg96Q3NlhXoi+0pnuaVW4KOz6vgnFN/O7B13D1Yyt1sh4WmkUB6YC
         7y/2lbpBFZrj4Q9vDZ4PA/9z1sVxK3L//LOZYPOTcEZm1esYCZXpQfHMbKcBPHKGHtdS
         819KTa2if2Lu2+zSMRe1AASs5/fnzBHHt2J3MbbtEmtFoxCGIF2MLzQ0knr8Ty9ZFtpw
         Lw8b6msgFx4z3ZJ6S/xQG6MCP795brAz71xuiJaDJuwIwssL2P06F4hOf5ZDcmzl6rq6
         elUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697206323; x=1697811123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4RcEaeq0Z+56TpsJGBFP08HsnS3amqPkJQB4mf707C8=;
        b=xKNMGeFE6XwHSz/NiL4m3StxhWzjG+Qj3Z4H2uim56OAhw9RBAVk4dTh5XiGfYkRD7
         /mva5FdbZRiN6IRkJaMNGloXBE4wRNHxATQmZNdEsklKHlsPZKeE4d8FvT+LXm6oWVsn
         IzST80+uk/9xvLLUwRFgcUzD+d5bwNWjKz9p1Nliux6ow6xgmI6MuZMKo2KJt4YSSwxR
         54hgR5FhCdSBMPMLuh4erE9NwoK7JSdknGm+HO5taRmbxO/fMp7tdw3zh2X6D4es2H8Z
         k7u+glqScFVxWdaAn3eQ3IzDMVjw+JpHBlZUZWPvit+Ti/8EwRKvQPT3cwuoV7xIkAev
         799g==
X-Gm-Message-State: AOJu0YyDw1AUPQYVBiJhQrETC8ErORPRmefgyVCKq3U4S5+MIFLQ6/aE
	q1DLe4n21yyjIeZFXz2wk3GE6okr
X-Google-Smtp-Source: AGHT+IEC6z/25JTa9NFgmu1QMRsT5kSfe/PoNZFCEOChPkPJTwnx9Q3GGu/7jPYY8ZhJHlZe5Mzmdw==
X-Received: by 2002:a50:c048:0:b0:53e:4dc6:a2e8 with SMTP id u8-20020a50c048000000b0053e4dc6a2e8mr1221176edd.19.1697206323563;
        Fri, 13 Oct 2023 07:12:03 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.172.118.168])
        by smtp.gmail.com with ESMTPSA id c26-20020a056402101a00b00533e915923asm11479677edu.49.2023.10.13.07.12.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Oct 2023 07:12:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Gavin Shan <gshan@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 4/10] hw/char/pl011: Extract pl011_write_txdata() from pl011_write()
Date: Fri, 13 Oct 2023 16:11:25 +0200
Message-ID: <20231013141131.1531-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013141131.1531-1-philmd@linaro.org>
References: <20231013141131.1531-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Ui2HgPhzhdJY

When implementing FIFO, this code will become more complex.
Start by factoring it out to a new pl011_write_txdata() function.
No functional change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/char/pl011.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 1f07c7b021..1cb9015ea2 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -149,6 +149,17 @@ static inline void pl011_reset_tx_fifo(PL011State *s)
     s->flags |= PL011_FLAG_TXFE;
 }
 
+static void pl011_write_txdata(PL011State *s, uint8_t data)
+{
+    /* ??? Check if transmitter is enabled.  */
+
+    /* XXX this blocks entire thread. Rewrite to use
+     * qemu_chr_fe_write and background I/O callbacks */
+    qemu_chr_fe_write_all(&s->chr, &data, 1);
+    s->int_level |= INT_TX;
+    pl011_update(s);
+}
+
 static uint64_t pl011_read(void *opaque, hwaddr offset,
                            unsigned size)
 {
@@ -262,19 +273,13 @@ static void pl011_write(void *opaque, hwaddr offset,
                         uint64_t value, unsigned size)
 {
     PL011State *s = (PL011State *)opaque;
-    unsigned char ch;
 
     trace_pl011_write(offset, value, pl011_regname(offset));
 
     switch (offset >> 2) {
     case 0: /* UARTDR */
-        /* ??? Check if transmitter is enabled.  */
-        ch = value;
-        /* XXX this blocks entire thread. Rewrite to use
-         * qemu_chr_fe_write and background I/O callbacks */
-        qemu_chr_fe_write_all(&s->chr, &ch, 1);
-        s->int_level |= INT_TX;
-        pl011_update(s);
+        s->readbuff = value;
+        pl011_write_txdata(s, value);
         break;
     case 1: /* UARTRSR/UARTECR */
         s->rsr = 0;
-- 
2.41.0
