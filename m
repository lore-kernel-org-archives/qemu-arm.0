Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1286832ejb;
        Mon, 22 May 2023 08:32:27 -0700 (PDT)
X-Received: by 2002:a7b:c4ce:0:b0:3f5:b4e:944b with SMTP id g14-20020a7bc4ce000000b003f50b4e944bmr6950303wmk.18.1684769546993;
        Mon, 22 May 2023 08:32:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684769546; cv=none;
        d=google.com; s=arc-20160816;
        b=y6XAq13bB88utgCQJ4lMx42Xstxnx0bt/7lrKEPJKGjevjL2myc6VYHVcZpxrr/5HL
         1ku4263+weuk4NHI4Gg2ZfAnwOZWr3eDpd3R1+qau3ykRMtCHfNxpXIZdPtPLG+xUoXA
         KkDZf9jMZ33I3qPfduCV/uWHMkb6x5ayUvJYjJJkfqIzKvYqriHJmPbAzo+iYZx39deT
         xNADAEJqBj2lswTfamnEZOJ6q4jk9vVoO+W7odoGfhuaxqduP9apdfrPL5AZG6p9RJee
         +8QDvW+SaT3aMTcwvh12sW31WBdrDmz8JCQVWJtzHGcX4GrIhbxWR+jANSe/vDzPbk4T
         Xb5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=256qRxVoRgmn8ZQNw96BSPjzs8Oo5GL3PGwhSL7cRNw=;
        b=ql9CxCjoHuFbmsCY/oyqfOsc5y4mvsAjj1EWON8EYq0ajlTwDF43MQaBVMQSXYJGwo
         LLRO/f4I0i0ITjK21zx+19VaAsvDMuPTk0yk2t1M/6Ck/LSR5VRGgTn6ckd2RsKGpvxM
         GQlICVHkcvp/N7U/FOKQ9nOLl+2kuyHOgCMYBdrl811skAn15LKgDzWyKgnLUnwo7vLR
         b6f0TCjMtiGx+15MxJfWDvFwkH+33PPUne2XOKYa2H5/tkYoUmEdxF8bFHalkdA66CnQ
         mGx8/gYi5Hfx+Jal6g5G810FgHZat7uFYZg9Yb4qKy/kFi8y2ILzT/fdzpgFHZRj1Yli
         +lJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="C/t7JMkQ";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n2-20020a05600c294200b003eb5689e250sor1644178wmd.1.2023.05.22.08.32.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 May 2023 08:32:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="C/t7JMkQ";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684769546; x=1687361546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=256qRxVoRgmn8ZQNw96BSPjzs8Oo5GL3PGwhSL7cRNw=;
        b=C/t7JMkQsTbjpIgJ59MHwv63ucFDE2WtK1AE0dsf4JCAAsNUrp1pDlOCrmtxwNAj+C
         oceIXdKSpx4vUBXmKDLfyQ+5HS+At35HtKg2gvcngba7a/Lzav1Jvpv7XGm969IfTPKc
         lh2eTjhN3LR5TiRFc3LSSFTVtFhLGmUPEmwd7xIC+rcCrEjG46BtGVY9L3KlhU26iMxw
         JCv4Lu5Xx+PjGfWP86KsSoMROJ14gykSKxfg4Jkbvcv1xGpblT1+KdtLfCwft61nCPVX
         n/NBbkh4uHNUUC/CjtuAokQbW7UQTZu7tv9rUWGkpX3Px2K1MiFXZEzchZTE26af3RZy
         k57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684769546; x=1687361546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=256qRxVoRgmn8ZQNw96BSPjzs8Oo5GL3PGwhSL7cRNw=;
        b=QJGnR+fHgXUM0rpwUY+vy0sMfS3Ub8DUifupsf/9iLV/YJCUHTSH5vIZkoXffQ4zIL
         sTxDAgEdjwzsklS4d2G7kx4aFfD9eQ1N9I7viCcQxxUH2N3v95b/kzWNQ5LNu1D2JyEt
         0WhXolpN4gcvhr2GGwliFzjKMIQ9tlsmaQZeuvTw4Y3M/7tEuarKSIONyLZW+pRWBMIq
         n7+qZjqwcg6hoPHHswXifwoze7JOPX97Ni6VZMio0EBV0H9+Lncn/bOTcTmZVUkZAwNi
         g5qr9HDdK9Ia8EAUhEQGYedYVKzm0i6+oPrGd4JnkvThci+/Bb00nSoFI6O+fcqSqzMZ
         AUUA==
X-Gm-Message-State: AC+VfDzqGHk+c0e+VVggE+9+9tTACV0akm6q81Xqh760UkfcIqJ3+Zcm
	cdqc3Gb2HDO+ud2u429xWvfvM8yc
X-Google-Smtp-Source: ACHHUZ4nod3UtzH9pNJ6BVfmAx/Fej6Cz66sTAoSu24l4cQfeNXH5SGQcmVgRqo9cwDkeYxmt+Bklg==
X-Received: by 2002:a7b:cc8e:0:b0:3f6:89a:94c8 with SMTP id p14-20020a7bcc8e000000b003f6089a94c8mr658221wma.24.1684769546718;
        Mon, 22 May 2023 08:32:26 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.176.153.164])
        by smtp.gmail.com with ESMTPSA id 18-20020a05600c229200b003f42d8dd7d1sm12078857wmf.7.2023.05.22.08.32.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 May 2023 08:32:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/12] hw/char/pl011: Split RX/TX path of pl011_reset_fifo()
Date: Mon, 22 May 2023 17:31:39 +0200
Message-Id: <20230522153144.30610-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230522153144.30610-1-philmd@linaro.org>
References: <20230522153144.30610-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WyufM9Gb4E97

To be able to reset the RX or TX FIFO separately,
split pl011_reset_fifo() in two.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 98c5268388..f0b305e5d7 100644
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
@@ -504,7 +512,8 @@ static void pl011_reset(DeviceState *dev)
     s->ifl = 0x12;
     s->cr = 0x300;
     s->flags = 0;
-    pl011_reset_fifo(s);
+    pl011_reset_rx_fifo(s);
+    pl011_reset_tx_fifo(s);
 }
 
 static void pl011_class_init(ObjectClass *oc, void *data)
-- 
2.38.1
