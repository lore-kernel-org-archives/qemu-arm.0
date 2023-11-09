Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp703532ejq;
        Thu, 9 Nov 2023 11:28:41 -0800 (PST)
X-Received: by 2002:a50:aa9a:0:b0:543:5a91:a8b2 with SMTP id q26-20020a50aa9a000000b005435a91a8b2mr5934826edc.19.1699558121258;
        Thu, 09 Nov 2023 11:28:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699558121; cv=none;
        d=google.com; s=arc-20160816;
        b=ykrCC1EhQrH6uQSYsOu6RQ4eDMTYtAYFbzrqMlRrrXEif3GBtK0ZtFhsawIxtNABFA
         AECJsLOX54PzpMFAlHp93/axywODPdZ7IESVqDVpL3I5emEcGd/4AQr24y+Mt50BDjU5
         iuJQYp6i7gmTvnQizwcsdhYBFjevl/pWfz5P3m+uw3KgaHEHswlXMYkCROqm2VTtq7uF
         xIlUJODbE5ugvUWMAOoDncFJZyGsY/8pOWegmp5OuLdv+5fDBfZxmeT3uwcMecUCr0Qj
         DDky4oDw5B9Jn9mmandhfh9cn6av/fd4IiHha4eVcSy35tDChrTPM/jxO3iyFejNZPub
         yxhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4RcEaeq0Z+56TpsJGBFP08HsnS3amqPkJQB4mf707C8=;
        fh=DIg4VbvV6UsIVtjymVavUODq0hsDWu0+XvIrfuGsGdI=;
        b=W7DySbdM0fVjnNmcH2vMAEyiPI5DB/J2uVfXYTMXhNuPhJFtxmnroQ/zWKKYl+Z9Qd
         SklOic7+TZMo+Yy1AwCiMIMCgyNIvNGmBJWE9QyGW9so0mja2sCsgf6WZq77n/XcBXJC
         8gRcvgsLy5Fmux10njH7SH3+twk37AEvmu7vJ3n5r04ap65YPhIPkYoikMQnnpFmOEdP
         fVdSaAi75RJBepmMQa/1zteahlCEBgUa5GKA93qh0RCDy57qNDMbobm1tVxpnVzF8Yhx
         fJPDgZjW/UiEUIbaHj9wmct/lrc0/AyEweFWeeg7RsOExr5hpvp+8b00R+d3kcEredV+
         LRMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MO6LbK+v;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z93-20020a509e66000000b0053e791015c5sor4884501ede.12.2023.11.09.11.28.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 Nov 2023 11:28:41 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MO6LbK+v;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699558121; x=1700162921; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4RcEaeq0Z+56TpsJGBFP08HsnS3amqPkJQB4mf707C8=;
        b=MO6LbK+vPp3sUNnococEFPQAxDU81Ayo/+wIiBrf9ibhTlOVnPXTqBCiLqtBQCsAHO
         SYPYLHyH13PvNGkE+n7FAasRegVK4szRz8hx3jf+4TAXTGUg2fX45QYDCE70tkKgP17N
         ET6YY0rfpGI1VvFKWR2ezGR9B2fDV7b3KaifnU540nE8jo5VFGBpnGy5c9CS+eXKtV+L
         REgtrFlIdXPToQSGRNObqs4y9SHjrHxK6aXbjjNsThTA3rdtIlJKFj2ZIux2jU9WryCm
         enpSh7Z6Klf7s+CtXC72lhJkEyTmkEXZ0P2guoSXE+iIahZseT0qdVwMmsAl5oj7ZBw2
         6sgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699558121; x=1700162921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4RcEaeq0Z+56TpsJGBFP08HsnS3amqPkJQB4mf707C8=;
        b=MVld+rYzyeuOJq1FwjB8HQiWq6LNawOcV6Atj2zGLrtSrD0sc3X+uxQu148GhEdttn
         3TjhP+uWKiig6tGYmNdU+B5umMcKKuToKnko4Phmyv0ovRh860yViMS2Q4NFaTl7W42G
         NJ+LygE7JBv4mfrREk7UibwCNNyPBiBLTZQaxj8CdHlkpp5aubNtYW8fNNkj6CmeGt8D
         dcKGZz8s45lyBav/o6glUIV5F3MhaX/JFQnDJv3HBaCR7ftOubrLjtaAQ4zn3HlWS/lG
         RymTEnzOrAyLrF4BwVNslrS1EILWPxi9d6M4Y1i4gkLX5K6aqGmAh9RYdO1flp2BWpqN
         yePA==
X-Gm-Message-State: AOJu0YxViAVYPUV4AiEBcvntXtbEKlIznfKTzHlT8jk4AqlPVjsx259h
	PXDmWaCVqAmf3dHI1E/REOpAqgLv
X-Google-Smtp-Source: AGHT+IHlHZunX7/OzM/Hq8gtZQVZaha5htzE2nm4Itn4uRqrEmWxmG+hAyGrESaQi+hKc8p2UqA6hQ==
X-Received: by 2002:a05:6402:358c:b0:545:5601:4148 with SMTP id y12-20020a056402358c00b0054556014148mr3310692edc.7.1699558120928;
        Thu, 09 Nov 2023 11:28:40 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.199.161])
        by smtp.gmail.com with ESMTPSA id n18-20020a05640204d200b0054554a7bbedsm181784edw.24.2023.11.09.11.28.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Nov 2023 11:28:40 -0800 (PST)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.2 v4 04/10] hw/char/pl011: Extract pl011_write_txdata() from pl011_write()
Date: Thu,  9 Nov 2023 20:28:08 +0100
Message-ID: <20231109192814.95977-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109192814.95977-1-philmd@linaro.org>
References: <20231109192814.95977-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lO7oRI/57IHy

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
