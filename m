Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp617047njc;
        Fri, 19 Jul 2024 11:11:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQWaZQXHO2BXjXMLmmx4emLhJZYk9bFZ6MMdiyXIk6HclwlWXCZW4HrGnbDQWBKdgKaNWRdBtQKDE5n6pUSusHVV8UKBwA
X-Received: by 2002:a05:6000:4026:b0:367:8811:cab7 with SMTP id ffacd0b85a97d-36831730b15mr8768066f8f.41.1721412681109;
        Fri, 19 Jul 2024 11:11:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721412681; cv=none;
        d=google.com; s=arc-20160816;
        b=VREan+vyuowLMbES88LBU0hOhCFQcgITEkGJ5CpwYYRVdOw4bJ+bqiiZlZtuBt02MQ
         v+po4RG6+ioauD57C7Dzm1KPAf8Z4rzycp+i1A834+EPqj4SVQ+wCtEkfoSXVyUmAnG/
         5VpoigTs6FO7weTN84Cdo5GqWwZSi+oS6kBR8074s47opHla7jGjkliPQJOabJqJ/X65
         HvGipBl0zEsyiHC8KK9dkFqzuMSCu0EAyB4nC023b+YP/8tHDQYpT1YHnZARLxN85re5
         cAy0Pg6Dct9Wi4HNBNgPHrLW3JMYmlt2osW+01KsVL43mfFmzRfVR5NZL59aMHQ76+yr
         pPRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=t1KnnMz9QclH4DdZ0a7ONIaMOEDb8CpMIUXc7bRjrWI=;
        fh=RyeOvuO/Fdivg5Zr2b+U5ozSQpDOV90k33owEfLtWKs=;
        b=Vz0kE25SulqufhOp07BrNSO5ZRKnGFn+alDbwVY1GDoDA9uiDafYflfcb9U0iQ2Sag
         l6EbuBXSrkmJEh8SLxWH4HPeOlIjJxhLyI+Nesi6EjNjoFpcUwdT9cHp90eAa5rtwQax
         HRPfWtdaHf2ghOv3t0k0jD+stqpR2NvKCyj8+K6dNYJg77ji062NR11qrIKkjt6IOyGb
         FvU+Xg6edhR3B0lgCOabc70bWLqK48pxRKX8CPQrO7BWI72C4Wd5YftTp5McBWmq0Amc
         4/3X1VILXpYnM2ZpXsfLuNxajVxl3JVU5cYzV8QOea0w/DjMR4xe7JpzgxKw1MgGVK5O
         oXAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yzqqc30d;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-36878ae8d33sor760629f8f.8.2024.07.19.11.11.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jul 2024 11:11:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yzqqc30d;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721412680; x=1722017480; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1KnnMz9QclH4DdZ0a7ONIaMOEDb8CpMIUXc7bRjrWI=;
        b=Yzqqc30dE4NjOVn2KeQb8S9ivff9zGastBrg9r3Xk2F95c2zOx9Q0MgiwqQ3nmkDE3
         n1g/OEos8DXNk/s6VRDumfurge9XyTjZbuKuCsJ4M84QD2O/mdG2WxO8ziGn1dsU4vkI
         m5jCHWiSVVxTude9mf2uduKFC07FNmdCZoXJPgJmxfd9ai1xsX/F398d4ccov4gCqI0p
         5wcSmhlACYXI4cv6sIo09X59p1Foev9MDa+Nw+Q0WH5XV80tNk4bf0seLyGyVaydPZ9J
         awpJb8ifiLjl2Z6AajaIAdioQiqpBJ+YQhMiyK7JqnKw2oqAbn7uKtavKO0eS43g2nb+
         SKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721412680; x=1722017480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t1KnnMz9QclH4DdZ0a7ONIaMOEDb8CpMIUXc7bRjrWI=;
        b=nhlwK1h5C+KgG0PYSws2DZ3X2YvrliVvEvyh5uesg/pcrb6h7Cva78R4NZgdLzOHv/
         f84ZDWyjSmZ51FkyfICkui7FxZ93cfmW/x5/06N4rmALMYvAYBMp7kxM5lJR/OdLYWWE
         9P0gyxghcoVNDJK+F5gR6KRFn+X0oZNzz2nu1wQmY1SxHBB0cAV0exIkljmLcJMTj4nN
         GBmPtW5oruPiNbN2lnyc97vLVAEpQ8iTZmzAGcUBAXiebwhaf6K/fppu/OuzoblUxXis
         leP/3UXy35ZtFV6Q5l0BXKdCudmxGA57z9Rrv4zBI/RDBjcoaKGlIIZz5UU3J8lgxMfE
         6hVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnryLlbtOlYelvIedAy2ZVaUQ4gmdThpZdR7p1gzezdqQ7ntMstYEXdvU5DSf9jrNnS+k0Y5sDdQ6TklnvPLCsuPL77pq4
X-Gm-Message-State: AOJu0YyXFDbJ0EUf3CN4G5MsutUjbbGv33Vsuq6ztX+e6MNQMRDfxVuk
	HR5aIh3eDkCFiD6JWRzDnzSwa/WzB5BofgHv364KdQ5xFG2JPw/r/gIUdvdBBCU9ug==
X-Google-Smtp-Source: AGHT+IG9hl88XdJg/Z73hgjLd2nmae6FJDicArw0XdXqkXkS5y4JzZxWDEEbwJuiyZoqf0LbZ2f/Hg==
X-Received: by 2002:a5d:4609:0:b0:368:78d0:c240 with SMTP id ffacd0b85a97d-36878d0c769mr2212400f8f.35.1721412680638;
        Fri, 19 Jul 2024 11:11:20 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (52.170.88.92.rev.sfr.net. [92.88.170.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3687868bb00sm2245597f8f.43.2024.07.19.11.11.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jul 2024 11:11:20 -0700 (PDT)
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
Subject: [PATCH v5 06/16] hw/char/pl011: Extract pl011_write_txdata() from pl011_write()
Date: Fri, 19 Jul 2024 20:10:31 +0200
Message-ID: <20240719181041.49545-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240719181041.49545-1-philmd@linaro.org>
References: <20240719181041.49545-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8XBW+HNDqrB6

When implementing FIFO, this code will become more complex.
Start by factoring it out to a new pl011_write_txdata() function.
No functional change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/char/pl011.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 3d294c3b52..c2ee9b0321 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -221,6 +221,18 @@ static void pl011_loopback_tx(PL011State *s, uint32_t value)
     pl011_put_fifo(s, value);
 }
 
+static void pl011_write_txdata(PL011State *s, uint8_t data)
+{
+    /* ??? Check if transmitter is enabled.  */
+
+    /* XXX this blocks entire thread. Rewrite to use
+     * qemu_chr_fe_write and background I/O callbacks */
+    qemu_chr_fe_write_all(&s->chr, &data, 1);
+    pl011_loopback_tx(s, data);
+    s->int_level |= INT_TX;
+    pl011_update(s);
+}
+
 static uint64_t pl011_read(void *opaque, hwaddr offset,
                            unsigned size)
 {
@@ -388,14 +400,8 @@ static void pl011_write(void *opaque, hwaddr offset,
 
     switch (offset >> 2) {
     case 0: /* UARTDR */
-        /* ??? Check if transmitter is enabled.  */
         ch = value;
-        /* XXX this blocks entire thread. Rewrite to use
-         * qemu_chr_fe_write and background I/O callbacks */
-        qemu_chr_fe_write_all(&s->chr, &ch, 1);
-        pl011_loopback_tx(s, ch);
-        s->int_level |= INT_TX;
-        pl011_update(s);
+        pl011_write_txdata(s, ch);
         break;
     case 1: /* UARTRSR/UARTECR */
         s->rsr = 0;
-- 
2.41.0
