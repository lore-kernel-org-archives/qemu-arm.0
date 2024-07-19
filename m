Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp617453njc;
        Fri, 19 Jul 2024 11:12:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWHwiiijPU23DCjnQqL5V8Eaie09iwVDowo61lolZfjv0L0RGnDcTBiN0mCeRGOMH4rKL4gnMSISjv4UWdoJOD/SzquARxx
X-Received: by 2002:a05:6000:184a:b0:368:7fbc:4062 with SMTP id ffacd0b85a97d-3687fbc41a8mr1774734f8f.33.1721412722143;
        Fri, 19 Jul 2024 11:12:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721412722; cv=none;
        d=google.com; s=arc-20160816;
        b=F2qWA3BEHUvDGHtm3DwHBiPnNUDFjL+rAoORe68xnM+EO2kXWZ8rYBHd6w5GnRtTYa
         Z7Y6feXzpCaHfLxLiLBidExrQiZq1lHJw2MNZgq6A+oTxkrDk4rsr9HMYLEJPSWg/mDY
         By1p9xUF6Dm9LUgXckpioeNmJXJSYxBBlgv/V8rtR9P5XwL4MOTX+jpaTsGdtLeoo8H9
         D68LhJFoWcRTYpnABArt0NWzpRbu50JU5urn8CM45aLPJEaBq3bEHr5HZn8+03o2e2Pc
         JlWV+2z2OJ2edBvLxnShUp/uon4Exe6zCyRHL6QMY/2GaAJZQI3+nIbQmxQbzhYyNioI
         Rw6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Sc6hQLwehuuiEKoTJDdG/35Ecq31WpA7x5boBSd7PGs=;
        fh=xCudBgKBaF8Cg8ksqalM79lfZPOUIWqbMqNCKiRitGg=;
        b=VXv4nz6EJ5UM24jOoWumu0Qqpg6Pouq+/eLwP5hW6xsCzKaM0YIYPVfwN2/uqycJIE
         STJ7CPEzT3ah8rtIqqZmaoNO8gU8cKLP58deR7ojWbM0JLZqp/WfL8ylbgR/UYpxMLCB
         UKmrjPuxl8UC2qE+uLtfARs+qduLGFGQ+NbNI01VWxvHjFL5TFedeNFd3QfhwOk7GlJc
         EZRE61W8ewWsx8M/+ik51IykW5bJmL6Pf8OZoznwinRUS6gKQvX+H4VPbNZUaDqSr+gJ
         CEb7c8C+TXa1EeBqfuSsvRf9LeIgSZn8kGWpkmnPmTc4BkEeJjbWYoiFVWwG6X/mTlMQ
         LkyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z11HJlTQ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-36878856687sor581239f8f.10.2024.07.19.11.12.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jul 2024 11:12:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z11HJlTQ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721412721; x=1722017521; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sc6hQLwehuuiEKoTJDdG/35Ecq31WpA7x5boBSd7PGs=;
        b=Z11HJlTQ+VIjG/Cjk8EVjIfrBJK6ekfVnTlWB+NN1H68rAyh5YZ85EeUhBA6gvJ79i
         K2Scenh2HkvktBdDFBeQRJ00rxv6Hls8BSpB0qA/XvPERkb7C8MKMK2yAOgZ/N3B/asz
         1A3iQ2o/O38Kq2NwvZNeelEieolcCLWyWdngjvI2+GY64hn2McGo8Bk0YvSotoJYx7Cp
         U7x/hGZ2ZBM6gDD5JXzT7IDdYXQI4hxC/hBAjK4Cjg1EW5M4PmQLjwWfvGUrisg2ifHs
         g4wq/8sa6kKwWidK/43SqfbiZGVbG8KuBI5dXAirqCYRwkRevDS5BTAodgzwNFfhE0vo
         0Tqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721412721; x=1722017521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sc6hQLwehuuiEKoTJDdG/35Ecq31WpA7x5boBSd7PGs=;
        b=GTdF7Z78a5DJ/x98+RAI5DlIkyYrtP69vXdB8eyRKu9Ht2/e2NH+cNeZc+aASYFwPQ
         Rep0AzTBFW22rWS68d2dN0gCp/oi6++jfJBvxTp6suaA2AV7mUXgRuH+WOke/GC2xJgm
         QL+CXi8mY5993EW/+YInn09KzsV7u9HW+v25z1OVOH8BTtqaftw05Opl3+H91VgTGD3R
         zzMq7eQ+iahdmeY1zfB10846BBUwjCZ2yWHvI6sJaOrBgv9IKASJ9Yn2o/MmTC1tqmaZ
         Qy0U8dvOLQ8d6cbOPat8B4WUgyVTy2xT18vaUzLkeBoGp3terZkH5PiWrKSza/SY1a7k
         Nr+w==
X-Forwarded-Encrypted: i=1; AJvYcCXpRqBregPnlkYGuRalqtiuKjxgL8s681C3BNgE7N8e2wxPA+c9mmqdXuj4+gV6Ws1XmLHoWPWeQAYAj341+7VjuEVkxHfU
X-Gm-Message-State: AOJu0YwRUipRqJ6GWwV42OFV+jgaf72XiuTyz9WNs7QKLdrMN+/j+OSX
	lgIBhH5Ucp2LQe3KFGEpHVAaPRMJGgzeiFcaMAwgWnocc+TnOs81DkN9SD8yfOOijQ==
X-Google-Smtp-Source: AGHT+IFqxR7HobyUTGqt0aMlYycIb+Cj1q8ENdx9vfgd/9viTmyN3OeId5STij24Ev6E8ABelSymvg==
X-Received: by 2002:adf:e6c2:0:b0:367:97e7:879a with SMTP id ffacd0b85a97d-368317c0425mr6182998f8f.65.1721412721673;
        Fri, 19 Jul 2024 11:12:01 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (52.170.88.92.rev.sfr.net. [92.88.170.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36878684230sm2257427f8f.17.2024.07.19.11.11.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jul 2024 11:12:01 -0700 (PDT)
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
Subject: [PATCH v5 12/16] hw/char/pl011: Add transmit FIFO to PL011State
Date: Fri, 19 Jul 2024 20:10:37 +0200
Message-ID: <20240719181041.49545-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240719181041.49545-1-philmd@linaro.org>
References: <20240719181041.49545-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: wpD/KvcsjNLF

In order to make the next commit easier to review,
introduce the transmit FIFO, but do not yet use it.

We only migrate the TX FIFO if it is in use.

When migrating from new to old VM:
- if the fifo is empty, migration will still work because
   of the subsection.
- if the fifo is not empty, the subsection will be ignored,
  with the only consequence being that some characters will
  be dropped.

Since the FIFO is created empty, we don't need a migration
pre_load() handler.

Uninline pl011_reset_tx_fifo().

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/char/pl011.h |  2 ++
 hw/char/pl011.c         | 37 +++++++++++++++++++++++++++++++++++--
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
index 4fcaf3d7d3..e8d95961f6 100644
--- a/include/hw/char/pl011.h
+++ b/include/hw/char/pl011.h
@@ -18,6 +18,7 @@
 #include "hw/sysbus.h"
 #include "chardev/char-fe.h"
 #include "qom/object.h"
+#include "qemu/fifo8.h"
 
 #define TYPE_PL011 "pl011"
 OBJECT_DECLARE_SIMPLE_TYPE(PL011State, PL011)
@@ -52,6 +53,7 @@ struct PL011State {
     Clock *clk;
     bool migrate_clk;
     const unsigned char *id;
+    Fifo8 xmit_fifo;
 };
 
 DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr);
diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index c42c6d1ac2..6519340b50 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -167,11 +167,13 @@ static inline void pl011_reset_rx_fifo(PL011State *s)
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
 
 static void pl011_fifo_rx_put(void *opaque, uint32_t value)
@@ -545,6 +547,24 @@ static const VMStateDescription vmstate_pl011_clock = {
     }
 };
 
+static bool pl011_xmit_fifo_state_needed(void *opaque)
+{
+    PL011State* s = opaque;
+
+    return (s->lcr & LCR_FEN) && !fifo8_is_empty(&s->xmit_fifo);
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
@@ -599,7 +619,11 @@ static const VMStateDescription vmstate_pl011 = {
     .subsections = (const VMStateDescription * const []) {
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
@@ -614,6 +638,7 @@ static void pl011_init(Object *obj)
     PL011State *s = PL011(obj);
     int i;
 
+    fifo8_create(&s->xmit_fifo, PL011_FIFO_DEPTH);
     memory_region_init_io(&s->iomem, OBJECT(s), &pl011_ops, s, "pl011", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     for (i = 0; i < ARRAY_SIZE(s->irq); i++) {
@@ -626,6 +651,13 @@ static void pl011_init(Object *obj)
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
@@ -669,6 +701,7 @@ static const TypeInfo pl011_arm_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(PL011State),
     .instance_init = pl011_init,
+    .instance_finalize = pl011_finalize,
     .class_init    = pl011_class_init,
 };
 
-- 
2.41.0
