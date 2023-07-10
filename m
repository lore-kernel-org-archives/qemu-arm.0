Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1351402eje;
        Mon, 10 Jul 2023 10:51:40 -0700 (PDT)
X-Received: by 2002:adf:fa51:0:b0:314:16d3:d1ee with SMTP id y17-20020adffa51000000b0031416d3d1eemr11276360wrr.68.1689011500687;
        Mon, 10 Jul 2023 10:51:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689011500; cv=none;
        d=google.com; s=arc-20160816;
        b=XIWNQVY5uhcdUGK2+hzrxxSEojJ6obANlftxTWMjstiJjo3hJVYgUIpYojHwFabsmN
         J9+CD045cOFgt7xLtantrf/a/6EXpdajmyoxTEGCv0KuaMiTm22P7cBSOccLK8Ats/Ac
         sWeJDDeTAOe3OmkA4U+uXuxHoPZKKhNCBCtR8zS0F36LG4vt0nVp96pFim4m1YjJ+gqh
         UQsMcJ3nNboakMmOnPfmmyPjPhgQetrJeuGJZtXyQMmQmVl2IIYLb/8qo86aiwuuTkgz
         FK1BTaJ7wBCpA9zH5Z+pTngq3Xh31Ier0hRZv/B8tRfw/COhpdWJfOS7/CVFsgu2QpmB
         mbHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HV7jdQi4bEVcp54eyyf8vkcdig+8iB+0mpkWJfR4/DM=;
        fh=4TWVGTMFk+XB48cTX7H3L2FEUZf3X6lSQ5h15kr1III=;
        b=u2G3b2gGhkWbUFZJAX6nlJZ2ct63W5fJYNLkDPrTckI9PrDO+7cFfE0+zhcTx7DIm+
         WKaay3J5ZSHzD+ztNOQaYFZyEvEAyE/LHlFubOV8wnFIwzbUuxPE12jo5Pfo0yhzNtPI
         xIYRtHf7DvDCAfLU9fS2WzMwDiysC4TzkTECFrE+rTXNLzkrJj4Lrrs5vsVyhIFtG16J
         Sw1PXn2C4h5MhWT4DnCeX3HvLwIGXFyX53oKuIt/F85NVuarbwcXWXlOp91MzwtHOo4U
         55UF7hkElAmlq1l6cO5Y64Z8ZsbMZ6YFwaWUpZJxRszI21jwhLMuY7gxH77xz3asDZgw
         vjRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fY5N0dtv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j17-20020adfa551000000b003159b3b5124sor11578wrb.9.2023.07.10.10.51.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Jul 2023 10:51:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fY5N0dtv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689011500; x=1691603500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HV7jdQi4bEVcp54eyyf8vkcdig+8iB+0mpkWJfR4/DM=;
        b=fY5N0dtvRGCbZtWbx9sN0hPUOOyTjaaazesQVpbBowQuAMYOIiHwvVLID+MPWwLTdl
         bEJqJmUKCi/5rfiEJpw7zmtrtPAN0YsthmWKS0EdUuLqbyxCRofrj8yrWPj2YE4xKVVq
         wUfzDUgqczbSUPDBiG2nX7KXZxwuIYl6anyqUHAOdxlSQpTDjpb+CL2wP67ENCqvJtYO
         akpSSlAJCQvKYeko9CD8N6ZIi8R/GKEWDpJcP0c6bDZ0yxEYVKRAV1yy36aKojkHh+sW
         9GMq6ESc+hn43rCQ3aP4Zwyalh+hc1whfMEnf4Lw6Z77JsmYOlHqQ0L0iR+eWpHHIrTG
         NpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689011500; x=1691603500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HV7jdQi4bEVcp54eyyf8vkcdig+8iB+0mpkWJfR4/DM=;
        b=CmV9vKTBYj2otyQoK0HhQNB/vpi6jkAB6hb15Xz9otBR+Lu5NFxgOXkJfXyA8fzAyC
         ASIHHarEUzisRsfsB4o/fw8oNfkQeekkXPl+rTJqUv3o7urbFFDI3Ls+xlKJ/JKOPX7i
         tGaziYrK8BcefAtMqWVRn0IOUBZUuZN0TmGIyM6R3QBMYqWRJeLKLFUiEa6A3AqkWVDt
         2DxwAWmDfeC+ITC855Gt9rLAs6xJvZVzzyeoxfTeb9L8V5NwDfsL5kT1Tr7W/afyReQk
         EpMHbeyaZkuAxsAxlNqKTzl6XVKaa71bXV4oka2Y3dkO6d74/Jnk6BnrW7qdyOpHq4xr
         oHcw==
X-Gm-Message-State: ABy/qLYG2nng9moKZ/Dd11sv3hG45dr1aFSiDUHJz8OIbdoTfbDOOGyT
	UBNiBYt2zMpOVuk0/yk08ZFET8mLuhSy8wHmIDO+eJSg
X-Google-Smtp-Source: APBJJlHDBaazICpyGhOY995Ivwofx9KroCWeobCu6JYe6jaUfJhR2XcBDZcPHcv5ddzbMHLn6etZFw==
X-Received: by 2002:a5d:510d:0:b0:314:114e:6e0 with SMTP id s13-20020a5d510d000000b00314114e06e0mr12298007wrt.3.1689011500455;
        Mon, 10 Jul 2023 10:51:40 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (mst45-h01-176-184-47-225.dsl.sta.abo.bbox.fr. [176.184.47.225])
        by smtp.gmail.com with ESMTPSA id cr13-20020a05600004ed00b003143ba62cf4sm15384wrb.86.2023.07.10.10.51.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Jul 2023 10:51:40 -0700 (PDT)
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
Subject: [PATCH v2 06/11] hw/char/pl011: Extract pl011_write_txdata() from pl011_write()
Date: Mon, 10 Jul 2023 19:50:57 +0200
Message-Id: <20230710175102.32429-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230710175102.32429-1-philmd@linaro.org>
References: <20230710175102.32429-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZnpatXii+CmU

When implementing FIFO, this code will become more complex.
Start by factoring it out to a new pl011_write_txdata() function.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/char/pl011.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 1f07c7b021..7bc7819d8b 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -149,6 +149,17 @@ static inline void pl011_reset_tx_fifo(PL011State *s)
     s->flags |= PL011_FLAG_TXFE;
 }
 
+static void pl011_write_txdata(PL011State *s, const uint8_t *buf, int length)
+{
+    /* ??? Check if transmitter is enabled.  */
+
+    /* XXX this blocks entire thread. Rewrite to use
+     * qemu_chr_fe_write and background I/O callbacks */
+    qemu_chr_fe_write_all(&s->chr, buf, 1);
+    s->int_level |= INT_TX;
+    pl011_update(s);
+}
+
 static uint64_t pl011_read(void *opaque, hwaddr offset,
                            unsigned size)
 {
@@ -262,19 +273,12 @@ static void pl011_write(void *opaque, hwaddr offset,
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
+        pl011_write_txdata(s, (uint8_t *) &value, 1);
         break;
     case 1: /* UARTRSR/UARTECR */
         s->rsr = 0;
-- 
2.38.1
