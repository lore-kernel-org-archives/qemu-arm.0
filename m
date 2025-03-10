Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp867334njc;
        Sun, 9 Mar 2025 18:28:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVsGyIrkOJEMUHth1JPbAISwB12OsyQYI7t0P1kc687Y+u9ydjjUr+RHhME9Ml4OrcOmTzllL3aoztoXA==@linaro.org
X-Received: by 2002:a05:6000:402a:b0:391:2fe3:24ec with SMTP id ffacd0b85a97d-39132d3c1a9mr7993931f8f.14.1741570115370;
        Sun, 09 Mar 2025 18:28:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741570115; cv=none;
        d=google.com; s=arc-20240605;
        b=YcCl5UyrT40aBwlhOancYE3O+NC/GNOAGhxkkJh59PT8c8Iz6ydPFelnCRw6ZGNe9a
         4DxmQvi44AXpBevNkuKw0+lm1EwYjqK2z3Pf3qfX8hVpj8UpfZyf4pBe2vX+jQYO1ydh
         PMZ1tCKZvMT0iFeFwzn3WRTmyBM2Z/xfdHALE2AZEvM0tT/+2ouBH/vWcAAk5jRzHFKq
         lJ9renlEcjBdYbbBgjjHyVgu0zgiNl/E8QdX/D3vYo2nABeHKRE95sENgfbQAHDUtXNY
         jpr1T6milGJoyQD7dSILOOQOhLHbyGN3Fhh0HUwsSBInxARzTCTj70e6sX7P25MvamNi
         cgTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=EpcO+5mNfJW3uTvL4p/FId4A1a70cqj1/QCXsX8nNCE=;
        fh=3p2DKgwTJVvMj+/HptAB7ZW0+iqGUbhpNaecxTX/YSU=;
        b=RDLYfGSvhGnlvNsbdIj/JYO3t7gjR26xjTvhjsthoEd6jQ6j5r9BMnQ2hcrnkZmBXL
         g1r8g/YV+Lei4r9cyVev9FkV2OzFtClxv70mpJjqjicswaJoP/u7S5EgtOztmUvmHjJn
         NsPw2KOsRiiAtYLVwUtpqMkx4Cg7I8kMAAYmezSaWuzi0bvKG/VuyedS8xXyHurj6WMv
         3UHkcf5pmlVOQpiIf1dIDJX0O5RuMlBdneG9tPozYs6bFGNWQkg0GYtGpsefEMKskFvS
         OeWCaw803doReH+q6udxdIm+jmUVprUCpW+OLkiXewpGue84sB4wYPmyS1v2wa8vXLWq
         pmqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q12cp1pG;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43ccacc4d6bsor14934355e9.11.2025.03.09.18.28.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 09 Mar 2025 18:28:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q12cp1pG;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741570115; x=1742174915; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpcO+5mNfJW3uTvL4p/FId4A1a70cqj1/QCXsX8nNCE=;
        b=q12cp1pG2i7bkERX44W85iCipyoBiR6AsW+apwp1aRdZduUH6tGbioHy1DUW7VFMqR
         u2u2/tOPNcZL+vlwTKVgbJgwo6dQawIXLTQNENig/USEY/ogDOueUKlfENzYQ+nXjJZt
         NAg+vzb8GRoJPoLzgRZWR3E9SdC0+l3pzVYqyQAC4/udjBNbroLj54xsU5HSVP2YBT6R
         Dnzmy8SjPQjBJ9gShhjXFpeyrW5ChK7DMwFdDT9eXXmA7dJN7NoGB6d5kHJvyUnsnyUN
         JG0Or1Im2TzxiP+HEnt8dudKNQytui7WjuBj8DhFh4SJyRhiEer3v1ebKJQOJcoceL50
         2abA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741570115; x=1742174915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EpcO+5mNfJW3uTvL4p/FId4A1a70cqj1/QCXsX8nNCE=;
        b=V0lNfZPEIsDM5pqDFGGINhuWcTPxtmvKhJvab3XQKbf7p/AH1A8V3z+uBHgbfRuLHa
         ii+NkQB4vV5YdLrF5NTYWH8+2FX066dAg8xnlicDBR4kqB1UpljgYh/NVwekCejbg8C+
         5k+hBpN6hpxFxu7oVkKAI24ipwEZI6BZtHdR4urT3peqNd5+gh4RQq3BDutNLcswc7EY
         NCXWK6IWirAxhNVCqbo+vyZRDXjcWQ0ysUl/A5CC740REqDngfGuLBFDc0SdsdAetymX
         JdKlb8qkHZsqe3XKRI4o3V5mG+s3yynijdZuJWYkfgeup7VM9E+qtIJ+oCeygIVV5fqi
         RDGw==
X-Forwarded-Encrypted: i=1; AJvYcCUfJxKcgTK/OTd94JQMeuZn6mph708kHIwDBmoWb7urWyvLCSJw/eVA+4PEB9FLFUhiWUTAHCyiPNHwHA==@linaro.org
X-Gm-Message-State: AOJu0Yyqtu8BSmL/pr/VRa0vTnwhqilDyFf96Q/iiuGloLw6YYxmIu1f
	pXYeS/bkcYYb55KNZYCzYwv7QYAdNepV0hQ3TgS++6BR7dPag1LhqSURAgBrV45TJQ==
X-Gm-Gg: ASbGncvMypin8XjQblwoEaqDIoESWZjTgRm7pokiKHPOKwpUADA9O3C6JILMamAimGx
	vjQsGw7PPqqTMKNKMHzg/fxkC2NxotNMh1lusIyg43+DNy6gXVtz4w316WNJrkhhBBIOmE7b4nt
	TQSlbWZi9+KI2T2A5LmZVqYI4BGv7BXwljqY+Dx/fsqUBHoBtTyixZHfWPFM60gfXg1hVjcQSZo
	yaaKOoFZF0q2BkLT2G2Tkhu5+Xb8ucrc1JTQLcbMBmHCtsdp99yNoP+fQiYyHYa0tKpicpaiGux
	qXgC70U4Lentl8JTXb8giQoy+0hJP7L8T25RG0BCvhUzKcdh5HCR1sonSLbyPOC6WMgG5uSnfiH
	773FN7bXUfDxsJe89rInKDzxbyiLLCA==
X-Google-Smtp-Source: AGHT+IH5muMIhBM+Y6yNUoVlIeL0HObPTqaKEqPGBd/JMLnGJQrO5JihMRRlzQ98F/y0itjeTq2Zmg==
X-Received: by 2002:a5d:6d0a:0:b0:391:41fb:89ff with SMTP id ffacd0b85a97d-39141fb8c49mr2550978f8f.27.1741570114827;
        Sun, 09 Mar 2025 18:28:34 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c01ebddsm13618110f8f.60.2025.03.09.18.28.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 09 Mar 2025 18:28:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 1/7] hw/char/pl011: Add transmit FIFO to PL011State
Date: Mon, 10 Mar 2025 02:28:19 +0100
Message-ID: <20250310012825.79614-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250310012825.79614-1-philmd@linaro.org>
References: <20250310012825.79614-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: sjj4blAAS2Jt

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
index 4fcaf3d7d30..e8d95961f66 100644
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
index 23a9db8c57c..0e9ad5d5d90 100644
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
@@ -560,6 +562,24 @@ static const VMStateDescription vmstate_pl011_clock = {
     }
 };
 
+static bool pl011_xmit_fifo_state_needed(void *opaque)
+{
+    PL011State* s = opaque;
+
+    return pl011_is_fifo_enabled(s) && !fifo8_is_empty(&s->xmit_fifo);
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
@@ -614,7 +634,11 @@ static const VMStateDescription vmstate_pl011 = {
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
 
 static const Property pl011_properties[] = {
@@ -628,6 +652,7 @@ static void pl011_init(Object *obj)
     PL011State *s = PL011(obj);
     int i;
 
+    fifo8_create(&s->xmit_fifo, PL011_FIFO_DEPTH);
     memory_region_init_io(&s->iomem, OBJECT(s), &pl011_ops, s, "pl011", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     for (i = 0; i < ARRAY_SIZE(s->irq); i++) {
@@ -640,6 +665,13 @@ static void pl011_init(Object *obj)
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
@@ -683,6 +715,7 @@ static const TypeInfo pl011_arm_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(PL011State),
     .instance_init = pl011_init,
+    .instance_finalize = pl011_finalize,
     .class_init    = pl011_class_init,
 };
 
-- 
2.47.1
