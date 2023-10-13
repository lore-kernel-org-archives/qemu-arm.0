Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1538247ejc;
        Fri, 13 Oct 2023 07:11:54 -0700 (PDT)
X-Received: by 2002:a50:8e17:0:b0:53e:10a1:21d with SMTP id 23-20020a508e17000000b0053e10a1021dmr3651617edw.35.1697206314656;
        Fri, 13 Oct 2023 07:11:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697206314; cv=none;
        d=google.com; s=arc-20160816;
        b=oYn4cIZc6YTj2vMFbFA14y1iFGNdpL0wmUlnqXR20Px/ppPI2xQdIW5PA/Xm6nhnGM
         IeIA3IFF52CWikeuSgsIQ/8rqRxfMIoAacBmd0ZgxMVT0agqtxB0bOfNytLiTNBgBxxm
         iqNlIBYVOqkD9Im8BKp4j1DD8Xw81oJGoQgefjdEqAu4fo6j67DlyvHims66vOZpRb/q
         RfPgYeZYD+P7ix2vWWqlSpjhHZ5MwnJ68Jlp+SMXZ32dlzmPPT2JkaTalxDyOEtjMxRs
         A8Vj0r+3ZlyTmk/nmI0TvZaKr1B4zmlfgea58pUJqD6By6Cxp1kNlxtJxC8/fW4Bj0NS
         PoPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mP8e7F+MNf59pa1iU6FTfmv7Sb18zKeyajADdz6BZOc=;
        fh=MusjSs7gXCZ/MKYOlww+3pkKR+FOAC+Wy5x6PlCIutc=;
        b=sEZSa4nQBlzlzgRx8m/s8H8cExFb5bKnCx+23d5zS0X5lpBL/I5WugORPu9zilui8m
         hom7ILz4Y0RmDLKJgS4Its1y3cAGOy7NFC2On6rv2OzRsc2saixZDqEZ97RxhgpaSQ5q
         9A/jrCdPPom2wKDdM19EFCbktqHwBDMZNNi8gqNCo4VVWAxekfHH/uRvSwi8xZ9Vy8Qu
         byeOpLoE4Gv7ieFaV68djE+EWdCMsUsrEU4AO36vDwLC6butNEhKrkyjb9tGWH63HnyK
         QVVLT0kiJxsa4ibT28ZHunGy2FqXinU+6cUt/IE62fR8djiZp1zhTUU6RLee+IsPdmUH
         /ixA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TGmBgQYL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j26-20020a50d01a000000b0053457cb6d97sor3805927edf.5.2023.10.13.07.11.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Oct 2023 07:11:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TGmBgQYL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697206314; x=1697811114; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mP8e7F+MNf59pa1iU6FTfmv7Sb18zKeyajADdz6BZOc=;
        b=TGmBgQYLphGCSpTCMwFKCdjOfaryBOSGaH/OQu9kgkDrSRhcm/OJZSaR7n9+/vEgj4
         RsTyXXfu2ZcLIITCBxCsrq5imuls/zRHPwMtptlcHcsWTjExwbKnazfhgMhWEQx+Vj9x
         s8Qwts36pvGHoMzq0+FOtPATyWbTphOigYSC5bpiTuC0SMScRwgCfe1jVNnYCg5entkL
         kiR0xp6rT+/QnTnosYo18pbWojI1uIHuB3ZD/y09S9HtpKWR1buie5M6SbWaQN6XVS9o
         eCBoAr/v2ThHsV5D/mDxSnhekVWN9vqwRj8+OVJ99oWAVs8fS93CM/kWQjUr09nrnJq6
         I1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697206314; x=1697811114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mP8e7F+MNf59pa1iU6FTfmv7Sb18zKeyajADdz6BZOc=;
        b=nCRmzuJCN0JC2lvFnn2nDRuUhDHIHZysGF53xxevJ9ZopCVt1rIAAe/lt8BwJ4nUx6
         5uA1S4Ss389KwwP0MV3JlAUGSUg2xT7HaGoivdA4oir5lxYSwsG7rZMRt6mvrLLe0Jmw
         eRk3x15vls9jAY/vSAGs4Qq4e17Y1b2A6mfURPJuJWPSPALTP450JkkNfg113SHOPpg9
         HbYK7msX17NXxTmiBAdyVpXoA6N9RT3sbiD52semvw0aZ79Fu7+GHowEnlml/3G4c6Kv
         QQb0SZ7ewORyoZgZQDu1IBAIQJfQZAwj6VVESkUdjN92mJPwNkjjpLq53RjRypp9YQjl
         3L5Q==
X-Gm-Message-State: AOJu0YxGN8ddrfuZ6+qc9pX6IafdohGdFupiQoFoWu/51mw627lBuNxK
	pCcM46KeGIRlsQkhxp6rD57RyrLt
X-Google-Smtp-Source: AGHT+IExARe8cmT7qMsM4N8ibsiGIRXeLVCI/BwunDKJ2ZRg0DcHHcF4d3iglFSwM5QKEdoLjFkasw==
X-Received: by 2002:a50:c047:0:b0:53e:3b8f:8ce1 with SMTP id u7-20020a50c047000000b0053e3b8f8ce1mr2139072edd.23.1697206314358;
        Fri, 13 Oct 2023 07:11:54 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.172.118.168])
        by smtp.gmail.com with ESMTPSA id c5-20020a50f605000000b0053dd798e38asm3529569edn.69.2023.10.13.07.11.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Oct 2023 07:11:53 -0700 (PDT)
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
Subject: [PATCH v3 3/10] hw/char/pl011: Split RX/TX path of pl011_reset_fifo()
Date: Fri, 13 Oct 2023 16:11:24 +0200
Message-ID: <20231013141131.1531-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013141131.1531-1-philmd@linaro.org>
References: <20231013141131.1531-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HwRpFgJkTTky

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
