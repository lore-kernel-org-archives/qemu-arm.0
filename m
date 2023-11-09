Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp703830ejq;
        Thu, 9 Nov 2023 11:29:11 -0800 (PST)
X-Received: by 2002:a17:906:f9c5:b0:9a1:b528:d0f6 with SMTP id lj5-20020a170906f9c500b009a1b528d0f6mr197937ejb.27.1699558151003;
        Thu, 09 Nov 2023 11:29:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699558150; cv=none;
        d=google.com; s=arc-20160816;
        b=E0crOvoHy4obl4FobgDro9KuK/j5JI4v3hSuy2bRBh+UZ1Ew1q5dUmajANEvmlVrd2
         bzYcaDuGBZBicc2HDlZ+//rAHZvxYGVelxE8NERXpzYsRp+8pcl/Ox4kJnjiCWjdQX+X
         mgIzZqVKc4SDXCmFNzAe8aFGW9Vlxtx1RDwNbAMO4UbcA+Zj5Pq2589OlyNL9eWNut37
         vj/L15+hT7daTlge48hKygkbh7GhG0JfknrYfzmHzzXWC62EDRv6xHBoNXp/yu/1wV6s
         p+d61gpBP/tMneAbHjRt/5WwWw/BypeGGls5IpAI51MgE7G8cTSrnNGyuOPr5dm6EfNN
         dNxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VbCASInnNu6Q9uFgn8bNgw0dLduM6GSUn61bZ+goPO8=;
        fh=DIg4VbvV6UsIVtjymVavUODq0hsDWu0+XvIrfuGsGdI=;
        b=WD8D7QO41Uc89a7cgcyX4ElLYMnOOt6l3c2EwW0HlFnWFCUtxi4KHCWYPJedNAf0Ku
         1eMkoqFGxbQC2LkNzlvLVaWFGx13O/6VaqkNHZoXQOZ7e2mgn80D/DeJYQ2wo9uB0tKh
         w5aT6I+GVbAy+nKlAKTZCt+CP0+ukhf1I51C/8ar7Gyh+VC40CGtpGDPIXrZ1fq10dot
         LpkELdh1o2D2WNVp2sa+drYhhgAHCQxq3j0binfplEuM9Z2Dh7EARax1aZfjlR9FLzpv
         rzrqUxOtAogx0QyJ2x8bRWTSzFUXELiaW+mNKzBxvZ7NusnDsDHXc9rKBExjFfUmqvSu
         DDAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rJUEQ29N;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t26-20020a1709064f1a00b009db5b5de60bsor598450eju.7.2023.11.09.11.29.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 Nov 2023 11:29:10 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rJUEQ29N;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699558150; x=1700162950; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbCASInnNu6Q9uFgn8bNgw0dLduM6GSUn61bZ+goPO8=;
        b=rJUEQ29NtFiQ12bjIV9qwDGe5dlOCynMmhLThjuQrkZIi9AcOgaUnBCv/rD9NbA39T
         LnSTAzlvXIdiy653/3o3EdJSbwaYYTmfcty7dxFV548jf7LwUOdZEtm0x8jAGXeGZkvv
         LbDW8SWjG+qebdbFTn3T2McqMLiXFZe+y6NRTc3BpuI45sgL/hLG5ObyLFB+pbEgSORj
         a9UGrTIFOkqqEzTgdI7FOvh87pUidMqGo25hsejDM+x7NGhzFVmpy4W8Vjx/Opt5pYed
         Nl8ZkduYmv7IXW009iA1pMrdzeuvyMuN5D+OWTJ32dyCmR75AkmifMO75g0iXy9Mp3gy
         uACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699558150; x=1700162950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbCASInnNu6Q9uFgn8bNgw0dLduM6GSUn61bZ+goPO8=;
        b=jtfgZyz3+5ZtpkjeUWoplLy/OPSqD1IOVd7pcYTujU9sIDVUq7ud9KUWDJzxSvcfns
         KtXKy9Xr3q1legnTpuHB680A2lcgcuibLKtwS06zU9iP0o8bl2zIt9uhSnNGXAPS0dBF
         XU69a7wFOZvrFFHJw7lcVEbYD4DQ6ZZXGLFpXcPJRT/BZX3tsrgFH/R7b8SRqcdJPBMI
         1wpmn6E826r4GlJ3S/uKA5F2p4W8Q9LEB5udwezyCCp5yLM3cEEd9MhiUJgsSr0SinZV
         rO5eIyxew9IkI6TUjiB04qnw+rlM+FYScobbQPFuO8NldEEiA0drVTa4z7pTDBfQ+mJM
         Z0LA==
X-Gm-Message-State: AOJu0YyXJEYvOt9NZl5RZop8hT7BpBdpXJE4HFpdux761//03lO5Ve7p
	cw3KIma2Si93RwCrUb2hO4mrUkoO
X-Google-Smtp-Source: AGHT+IFZ9OQdhANq1bPsek6/gcE7FIRaEr3Po/5bXioUHPDEhyNKFqMYWYTc+1BMRXX3iJGYg1lXtg==
X-Received: by 2002:a17:906:bc85:b0:9b2:bdbb:f145 with SMTP id lv5-20020a170906bc8500b009b2bdbbf145mr190299ejb.34.1699558150739;
        Thu, 09 Nov 2023 11:29:10 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.199.161])
        by smtp.gmail.com with ESMTPSA id dv16-20020a170906b81000b009a1c05bd672sm2902807ejb.127.2023.11.09.11.29.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Nov 2023 11:29:10 -0800 (PST)
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
Subject: [PATCH-for-8.2 v4 09/10] hw/char/pl011: Add transmit FIFO to PL011State
Date: Thu,  9 Nov 2023 20:28:13 +0100
Message-ID: <20231109192814.95977-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109192814.95977-1-philmd@linaro.org>
References: <20231109192814.95977-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ilYN6bnCd08f

In order to make the next commit easier to review,
introduce the transmit FIFO, but do not yet use it.

When migrating from new to old VM:
- if the fifo is empty, migration will still work because
   of the subsection.
- if the fifo is not empty, the subsection will be ignored,
  with the only consequence being that some characters will
  be dropped.

Uninline pl011_reset_tx_fifo().

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/char/pl011.h |  2 ++
 hw/char/pl011.c         | 37 +++++++++++++++++++++++++++++++++++--
 2 files changed, 37 insertions(+), 2 deletions(-)

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
index 727decd428..f474f56780 100644
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
@@ -436,6 +438,24 @@ static const VMStateDescription vmstate_pl011_clock = {
     }
 };
 
+static bool pl011_xmit_fifo_state_needed(void *opaque)
+{
+    PL011State* s = opaque;
+
+    return !fifo8_is_empty(&s->xmit_fifo);
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
@@ -487,7 +507,11 @@ static const VMStateDescription vmstate_pl011 = {
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
@@ -502,6 +526,7 @@ static void pl011_init(Object *obj)
     PL011State *s = PL011(obj);
     int i;
 
+    fifo8_create(&s->xmit_fifo, PL011_FIFO_DEPTH);
     memory_region_init_io(&s->iomem, OBJECT(s), &pl011_ops, s, "pl011", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     for (i = 0; i < ARRAY_SIZE(s->irq); i++) {
@@ -514,6 +539,13 @@ static void pl011_init(Object *obj)
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
@@ -557,6 +589,7 @@ static const TypeInfo pl011_arm_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(PL011State),
     .instance_init = pl011_init,
+    .instance_finalize = pl011_finalize,
     .class_init    = pl011_class_init,
 };
 
-- 
2.41.0
