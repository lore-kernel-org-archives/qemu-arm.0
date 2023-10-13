Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1538842ejc;
        Fri, 13 Oct 2023 07:12:38 -0700 (PDT)
X-Received: by 2002:a50:8e50:0:b0:53e:1825:be92 with SMTP id 16-20020a508e50000000b0053e1825be92mr3573547edx.31.1697206358142;
        Fri, 13 Oct 2023 07:12:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697206358; cv=none;
        d=google.com; s=arc-20160816;
        b=U9IbvzdUECu5MKnm31ffehtk+IkQ855B75r4+DDL62/xsXEoH2QnP8DaJ+IPu4qHAd
         F0dvu1mQKUD1rHlf91npiCZj8pFMD5zbHivrrPnZ7jz+SOIp0108qC4l2ggSmfkKPPSp
         d9AVzGw5fMgJXaeL+jt8Bp7Gvcw4rYrNx0hSRTRR7rvhPDK9PhQkK+FVQFpZ/bECd362
         By5WwTOlq1CMd37e7L6z7f8mFs/2/mOEZsX5PZWw5fRCDB8s0QYoHYrirPHYiHdZaN9g
         qG30CaHSpgaBtclGrIEumvKtMVD91QZr1RfQ/xp6UlN5ECel7x3mZGLr6tOH9sPo9rLO
         ZVmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RXqOSAIoOSfKO3CZGpouGHrieUGtQ4nqVPJcnN9WYt4=;
        fh=rgPM1QcSOyRuPluCdnsNd8knie+1OCUx2q8ta7MpVFI=;
        b=Pw6LtK8mJd2J0qC0YHbOtEjlpWNwL8mZw2EMow/3QV8jFDcST3/cRFhhcWq6dsBmQc
         HF1lVqn7ER5UjyIjYkTsjl69JkvrFoz+/3H9luXZ7q2C6y7fSdego8ZT/MwsE3MUTztM
         gNQuoPkIEsPItfpGTsH1hK4abBKc9HXvGb5by+3U1voXZDQAM7KiZ8GoH6dtufBt/Gid
         g19uBZNIEX++0oM9vdxGaj3o1k5EImQPnamYVlWoD4Pkg/7aK3u66zqCQIDJlot00hw/
         2hAjd/ncdJvZ2joBoRzzZ+01bZvBaZqmOi32CidlUdl2SOHolSdmBv1NOho40ktcLAUg
         Gy9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qJs9cbUb;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id en22-20020a056402529600b0053da2345297sor2972576edb.10.2023.10.13.07.12.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Oct 2023 07:12:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qJs9cbUb;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697206358; x=1697811158; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXqOSAIoOSfKO3CZGpouGHrieUGtQ4nqVPJcnN9WYt4=;
        b=qJs9cbUbZsDSWcQN2p0Lj2nkMey0TxLiGI8W7dDN3ogWaSLunhkka0MaPVm+msbH8y
         7UVvEw8K/XIqG3AIRyDKrykSt+AKCAPivqGfVzDf3CqOECVEzHni1DXEn4bgTN9GKnHu
         xNiBdcKtJJcufcmusvqzk7xkIXoA+07K2XK95JBrHv2ajqLxZUItyyq+A1K24TlijhS5
         9WvzgXI6M/4cCpJlLAKmGzGqul4JMwBJhAhKXvHwi1/ElgMGnG6uQ3K8p9TEPdn+nKIY
         dokckI+jn3lNNUC/8zSZrpSpjjrtJ4wXWowhppLUR3F+u1BPLYRwSJBx3iyENU1UkQYk
         KMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697206358; x=1697811158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXqOSAIoOSfKO3CZGpouGHrieUGtQ4nqVPJcnN9WYt4=;
        b=sK6U6s/kH8GkjRekL+zxUDkcVp1ovzAGgdIixn5ABK0zMAHJF1d8/4ozAkhIKuRofk
         VMq1c5oDw7vXJv5g3+R/8FlN0O8/2sYtMPBBXgRylDg4w7Mp3fnym22KliJi1cskX/sy
         8aQTT85mXF+G5YN1rfYfNE4wdRLr7R6ad2A7/OlOluad37jhYWQy2gExWY2rgtXQnvvs
         TZHVGFCNQfXvZ8nL+hwxpZ3DKlE53F9vKYa8UFyo4o9ekcOhL2yJcfDZrSewdddbUKVK
         ObNcDFFbVHVw0pk4k7RfRL+vVfXz/frSKF3jeEXfR6SjQy7CT1D3e5r9aZjsFipzDydt
         hejg==
X-Gm-Message-State: AOJu0YyDqE5AqNg6GhKEo61mgHlRqIDXTlsDW2j+0QYwFc491C23kP9k
	t3mbI2f6/IDD8u0SNcqhJYEDGv/y
X-Google-Smtp-Source: AGHT+IF3begxtbC6WM0XHHY8KuRu6vWYNY0hHjhNVPCrhYL5xPkVdVKRELNi6FkWNsyz2mlNnDSmUw==
X-Received: by 2002:a05:6402:1bc6:b0:53d:bde4:fa15 with SMTP id ch6-20020a0564021bc600b0053dbde4fa15mr6820322edb.0.1697206357811;
        Fri, 13 Oct 2023 07:12:37 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.172.118.168])
        by smtp.gmail.com with ESMTPSA id s14-20020a056402014e00b005309eb7544fsm11447251edu.45.2023.10.13.07.12.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Oct 2023 07:12:37 -0700 (PDT)
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
Subject: [PATCH v3 9/10] hw/char/pl011: Add transmit FIFO to PL011State
Date: Fri, 13 Oct 2023 16:11:30 +0200
Message-ID: <20231013141131.1531-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013141131.1531-1-philmd@linaro.org>
References: <20231013141131.1531-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lBRDMM42gfBw

In order to make the next commit easier to review,
introduce the transmit FIFO, but do not yet use it.

Uninline pl011_reset_tx_fifo().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/char/pl011.h |  2 ++
 hw/char/pl011.c         | 35 +++++++++++++++++++++++++++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
index d853802132..20898f43a6 100644
--- a/include/hw/char/pl011.h
+++ b/include/hw/char/pl011.h
@@ -18,6 +18,7 @@
 #include "hw/sysbus.h"
 #include "chardev/char-fe.h"
 #include "qom/object.h"
+#include "qemu/fifo8.h"
 
 #define TYPE_PL011 "pl011"
 OBJECT_DECLARE_SIMPLE_TYPE(PL011State, PL011)
@@ -53,6 +54,7 @@ struct PL011State {
     Clock *clk;
     bool migrate_clk;
     const unsigned char *id;
+    Fifo8 xmit_fifo;
 };
 
 DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr);
diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 727decd428..9d98bd8f9a 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -147,11 +147,13 @@ static inline void pl011_reset_rx_fifo(PL011State *s)
     s->flags |= PL011_FLAG_RXFE;
 }
 
-static inline void pl011_reset_tx_fifo(PL011State *s)
+static void pl011_reset_tx_fifo(PL011State *s)
 {
     /* Reset FIFO flags */
     s->flags &= ~PL011_FLAG_TXFF;
     s->flags |= PL011_FLAG_TXFE;
+
+    fifo8_reset(&s->xmit_fifo);
 }
 
 static void pl011_write_txdata(PL011State *s, uint8_t data)
@@ -436,6 +438,22 @@ static const VMStateDescription vmstate_pl011_clock = {
     }
 };
 
+static bool pl011_xmit_fifo_state_needed(void *opaque)
+{
+    return false;
+}
+
+static const VMStateDescription vmstate_pl011_xmit_fifo = {
+    .name = "pl011/xmit_fifo",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = pl011_xmit_fifo_state_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_FIFO8(xmit_fifo, PL011State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static int pl011_post_load(void *opaque, int version_id)
 {
     PL011State* s = opaque;
@@ -487,7 +505,11 @@ static const VMStateDescription vmstate_pl011 = {
     .subsections = (const VMStateDescription * []) {
         &vmstate_pl011_clock,
         NULL
-    }
+    },
+    .subsections = (const VMStateDescription * []) {
+        &vmstate_pl011_xmit_fifo,
+        NULL
+    },
 };
 
 static Property pl011_properties[] = {
@@ -502,6 +524,7 @@ static void pl011_init(Object *obj)
     PL011State *s = PL011(obj);
     int i;
 
+    fifo8_create(&s->xmit_fifo, PL011_FIFO_DEPTH);
     memory_region_init_io(&s->iomem, OBJECT(s), &pl011_ops, s, "pl011", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     for (i = 0; i < ARRAY_SIZE(s->irq); i++) {
@@ -514,6 +537,13 @@ static void pl011_init(Object *obj)
     s->id = pl011_id_arm;
 }
 
+static void pl011_finalize(Object *obj)
+{
+    PL011State *s = PL011(obj);
+
+    fifo8_destroy(&s->xmit_fifo);
+}
+
 static void pl011_realize(DeviceState *dev, Error **errp)
 {
     PL011State *s = PL011(dev);
@@ -557,6 +587,7 @@ static const TypeInfo pl011_arm_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(PL011State),
     .instance_init = pl011_init,
+    .instance_finalize = pl011_finalize,
     .class_init    = pl011_class_init,
 };
 
-- 
2.41.0
