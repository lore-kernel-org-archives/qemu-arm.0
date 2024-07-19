Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp617001njc;
        Fri, 19 Jul 2024 11:11:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUsV/KF1yK+WAQTnwrs2D4PRK2H8GwPCyedqZkbDbRb8hfmRpmFnefTVaa2v+aIef6/7yUkejDU++TQ97ebxeCLGY7bDMfM
X-Received: by 2002:a5d:5f8b:0:b0:368:665a:4c64 with SMTP id ffacd0b85a97d-368665a4e27mr3347409f8f.5.1721412675459;
        Fri, 19 Jul 2024 11:11:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721412675; cv=none;
        d=google.com; s=arc-20160816;
        b=qBPWE7I9hM9g/zP0x4cMiQfkPesCQ+87r0XBUMRmO7vAZPRE4BnMlo45LoyPaIfEcf
         rZIorZxxLoHnCfyscyzn05/N5lv53IGX1/F60vB4eG7TEAZweh6V8FWec824DPGx9chF
         KB/NipCUBFeZdEIvXDACsGuJAKaJqGvi1dru5Ai8R+GvyIwzoaRUemh/hCs9qDmvSIgu
         dDzkOjedoXXudvxgfOy6TRb2s8GcNZV8ZaqbMPRKSXv2xAhJpeo0bW1tZmmnqwGGK2Hu
         aS8yECYz7ABFEif5XFfXQ2zBPKYDdV2SRWue0lg0KvOUf+X5KJbT4Kf3j8+Vvr0K5ZHp
         oTUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WBQBL5W8xgFprC/jppYzPypv2gfWoCKhxuevh4igzXc=;
        fh=oNWUrGeC+VAEhv0PSehrlp9R0OSDLLBXBfCFkKoukC8=;
        b=tVX/mXdKSNck8CKmLKJKp9r+822FZwsQMRrgQVEbKzM3wGmwmUUdxkTn8RG0sVlcV1
         wUl9m57IAOqByu1NMui2MdkjKeDlKqUltYAMhwCh7GiT9cYKS+5tBufKEZAehZD0OV4R
         HimqOQWhko+TuCyqIRWDYG2r3vaSFwyQN/RW0djtGJ6Puw5j1VsYvNZbdkytJfxmKIgb
         6KkZa/psyAu315meNePhektYk3lJfX9PzTMMe0g2WXPhsvRWSbjx9IsZ88DhvqqjHv8b
         rcu51f6P52l5YI86SIyvY3Z4yFZiGnwaJmLOxc2M0S6XsnhwTkU6YQTkcBCtSvoEr3uW
         NZZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=go4LxJk7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-36878ae4647sor524769f8f.10.2024.07.19.11.11.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jul 2024 11:11:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=go4LxJk7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721412675; x=1722017475; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBQBL5W8xgFprC/jppYzPypv2gfWoCKhxuevh4igzXc=;
        b=go4LxJk7WtIsXXu9xEFsTu/NwJBp6kvashE9jbA71Ky+5W01tCHHthJsBmwxLQzrlo
         FkCUpakB084rj669Gf8QKfSSYVpPCPAxKfcjjUtYTrSj+lY5b7BEvZgeagFRwu0gV4Pq
         GZu9IbqyMkdMo6THvYDVsmBZLryt3xfa/k1BgvNhLt/phSVaIw3J+fHpoLV6F+0Qy2Np
         wr182PnWZbUcQk7F6UKJC9y+R+iGTUkWUYNHzHODkYq4VTH8jxeKQvFvKzTFvm+l6AMr
         Z384vs1pL44rVHnFF1mrJ6/CRWwXV2mLHOHLhT4SHM6FeYFUGvGO55yfvV/Rmgs7Kcr8
         UmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721412675; x=1722017475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WBQBL5W8xgFprC/jppYzPypv2gfWoCKhxuevh4igzXc=;
        b=VDBReAM/X1MFZP78bTvgiz3TQfzu1sVqpOVE2bQHw7uYyOv9vdBQ2r3KdtX6bO2Z6R
         ZKIst5ew1bUqqr/lIr3tcAQ3iihVHYClGIWOx4KQMNqigTdZL5fdBvObtJTIrMSZqGuB
         ts93EdtVtquuUySYARiNlt4Tyf+/AxwjLkxqDi6MG6+awGzubJ+i84gox5YyrL+SYWlH
         6RcXEM4FZnwS9tJ6/UJRoHBsxdS61nUEvoqn3Rr2iLoqcUwJR501WJ9BgRILJVUGlXWz
         14hs8vpfFp4lFXDHOD/RMg6KRv5xeaFdpvoTpfNF6SKUewrJX9br3c5448KvecIo7a7N
         pRUA==
X-Forwarded-Encrypted: i=1; AJvYcCUMGa0WN75jjIBiPN/n4G7ZiJg6l/DbTdY4zfvhIFyTLzsSpGMCuFX4iSYknTkH+TCVgJV+fj8U2bjOmYef8QSR0aWHrwPI
X-Gm-Message-State: AOJu0YyzTlo/CrtrZJcjcESsyz/IX2GYOPurOmnj/OPu/3KNvtoUDwIO
	fZCCeixO+yt4CjB25YmMQMS1IpQ1/qEkYqPUCIZrXgk/+P05R8nJlqJUmIYKFx3aIw==
X-Google-Smtp-Source: AGHT+IEysGjoyWG5B0bnxVXXcnsANlfCGJXyjeCLaHK/FKL5YC0n2UXZrK+Ipy734mbaFpWO48MaKg==
X-Received: by 2002:a5d:58da:0:b0:368:65a0:a423 with SMTP id ffacd0b85a97d-36865a0a82amr3024174f8f.27.1721412674957;
        Fri, 19 Jul 2024 11:11:14 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (52.170.88.92.rev.sfr.net. [92.88.170.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a94c0dsm59991275e9.46.2024.07.19.11.11.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jul 2024 11:11:14 -0700 (PDT)
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
Subject: [PATCH v5 05/16] hw/char/pl011: Split RX/TX path of pl011_reset_fifo()
Date: Fri, 19 Jul 2024 20:10:30 +0200
Message-ID: <20240719181041.49545-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240719181041.49545-1-philmd@linaro.org>
References: <20240719181041.49545-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fOrUDaOBafA9

To be able to reset the RX or TX FIFO separately,
split pl011_reset_fifo() in two.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/char/pl011.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 22195ead7b..3d294c3b52 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -154,14 +154,21 @@ static inline unsigned pl011_get_fifo_depth(PL011State *s)
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
 
 static void pl011_put_fifo(void *opaque, uint32_t value)
@@ -410,7 +417,8 @@ static void pl011_write(void *opaque, hwaddr offset,
     case 11: /* UARTLCR_H */
         /* Reset the FIFO state on FIFO enable or disable */
         if ((s->lcr ^ value) & LCR_FEN) {
-            pl011_reset_fifo(s);
+            pl011_reset_rx_fifo(s);
+            pl011_reset_tx_fifo(s);
         }
         if ((s->lcr ^ value) & LCR_BRK) {
             int break_enable = value & LCR_BRK;
@@ -619,7 +627,8 @@ static void pl011_reset(DeviceState *dev)
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
