Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp976449njb;
        Sat, 8 Feb 2025 08:39:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW5PQo3NmAzm+QsNFPLmr5UPO61IJ+WePOPt+PSM9oWLwKZaXhY41AJRbiGHEQiQQg9PQe4U5iJjHjCdg==@linaro.org
X-Received: by 2002:a5d:5984:0:b0:38b:ef22:d8c3 with SMTP id ffacd0b85a97d-38dc934bcd9mr5248743f8f.35.1739032765980;
        Sat, 08 Feb 2025 08:39:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739032765; cv=none;
        d=google.com; s=arc-20240605;
        b=lg6EGGvQk0w4CvNVsm4dqA6YrH83A6PFy5AVWpeesQ7QLJe5EpREoqRtNgeGBsE+vK
         v0yXkltlAirhVgM0CE2+yPTz5OguRYsk5kcJX3IC+EG4KjnLvWUsoHxRu3dXilUlKLi6
         JduUrzvNYyWfPSfoLWCUfOAKuzWM/S464O9Y/7grFxHXjHXBjGwnXKW6jI824/zxPcSo
         lMk+H/SsDMZobv8XG9yHo4/mzv8YJrJFT9tgSW/7EWx5xedzR3NlRYCNTrigxFAMx30M
         IDKiJGLszmlM4qGrDnf1TV7WNfRmjQ/CodCmsWbHf0VUaDZU5wTwEpDCmDfFq29gnJXD
         fHyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=AcA7adOksZJD+UONQiU8US0WrcIGd+kxe3T2X7yAEcA=;
        fh=FDpntBa/FS6CrNV3pegNYcfefoDrUyKj+/Iroa5RRXo=;
        b=gVhQ3/P5JqQY2Yfdzt/49nKSPKyH8HgDJuyJMKWYCbGCDjdG/ku0kT+4dGJLyYvyD0
         VqAIhM/aCVFB5kor6tQjhLL7O4F5Zi9jNUp+r529KelZco3NCwKQGjfYYWCAW001y+j/
         EbvjayZ84k141pG30MQbsJkwsIecZpakMsoBjdceLLUVJTnspV9lUA5WRIJksWt5Fwgo
         ZH8PFVS6g7P5HQcFhlqlreAe1kYoqrZrVr8EI3pQQrWYy7caVqpyI224cO2pLe7ALiVj
         txTF9Oa4FcYAK1DnHIZXt6AufnVWmK09eFKuMjt4hFzTpYaHr0srCl60EDvvkS/jZBd5
         m96g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wUDw2TyP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38dbde33f9dsor1469193f8f.8.2025.02.08.08.39.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 08 Feb 2025 08:39:25 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wUDw2TyP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739032765; x=1739637565; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcA7adOksZJD+UONQiU8US0WrcIGd+kxe3T2X7yAEcA=;
        b=wUDw2TyPP5WdU2p5b2/zqNJYRrfwIeXmHNf+iMzRjdvZz80Mi8gJ0v33oWFEd9v1Xs
         2uLHzTwG8Cf9H2VcXkR+gyYysID9tQcwnfhGjYjpCnd9BYm7H3cK/0Uk3POBoI2++BuP
         1GIy6ByNMwzqJpYj8K0eS8ozZYmHLFQaQzOV30qjdhgOBbAt5Q7Y6PnLlKiOghmX4+/K
         hN5qkMLbIecrHAIpd5UKqQXlbF6q5/fw4ILiORYAkwJGwnXza3/Cg3wgh6MsWzEr372m
         Hybq/6+qSgfZl3in9Q1Jj7AZ5O/qOSAPMJn3Y5XcErivVAmAtPLO2G6+FVXjGTffC7c9
         lNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739032765; x=1739637565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcA7adOksZJD+UONQiU8US0WrcIGd+kxe3T2X7yAEcA=;
        b=qE082h+THnvIfYuAMfXhG6FgtY+vSabfyCemWCtxfeKtnSYtWmDNuKDx+xl1Pi9ts9
         DoNF/GTlyIuvfpSGXZVC9CAWfR8YOJgzNxqWQNemQVdfatqqbV3pZP5dYk5nPYpozq38
         6rXGyLCv4g4rhnZZliJ9AfY0gupB5oDAx/q0Rq3d5hCctv7jx3Pr+w6JHZQUaOA2aw8R
         efMQjQDpFkQK0qQc7bNQdD9vRXHkSqXoJiXQVMMm/O+SHLD7YT4p6nxKk6llg4eTefRL
         GWA7iIthNvlxLjLNsfOUlzja6xEA/My5cWG78dZalfa9rlT2sjXSKCEFmrSmA45Cygan
         NEuw==
X-Forwarded-Encrypted: i=1; AJvYcCUKEA7xoTP8YqbHbVtV9kpabDssG5jkXpwUM5wRrFtCJqlp0FBDyfwLdL4UOhI+R4jf8xSpaAKC6JtVPQ==@linaro.org
X-Gm-Message-State: AOJu0Ywfk+RV0W2EqGFswEmC+DCFTTyTEg1NV+JXBu5SHH8+CXHXzIyn
	HGR8xA0YfU2Nrl7BNzghPPO5NdWhdEVVjdo1s7n6LmGA4YiaYOSu90fm3Ke8uSZ9rA==
X-Gm-Gg: ASbGncuRAPnBaxFybLs5yKs6IG0nCMoZq5uRzASCnS0HW7IHmewvE+/KOqylnuhN3/p
	DFPJZVlCmMBsgeZbGMOVWeiBgGLfL2jstZlPTHoNqeUdDWCZ28WH2XSbi8i6f+dVNW0WWopevRZ
	fjulxx6yx3gYYZAqqQLI2XNtgHMSNhL6A8JvsPR9MNXKMZD4WUEPDOKFpzWhL/WVYva74y+GCbH
	/Z13lYrNjDcUR4K4t2z0W1RoUAFlzC2zMBKFYFg4ImwogemHEAN/Br0gA7m2Dr+K5CjKghbJYR1
	5ZUhVAvOsTpvFKfYz5QGzdcKPPxG5i0ZmCTk6W49rop/DTKx+bMLviHRJ0BpBlGqKg==
X-Google-Smtp-Source: AGHT+IEdTgs0/7BmFE/lYXZS9m5FuUhqNVoPpaW8JwjPjKIKOJi1em2pZpdtO0n7teZaA1euLiI3sw==
X-Received: by 2002:adf:efc4:0:b0:38a:4b8b:c57a with SMTP id ffacd0b85a97d-38dc93509damr5335898f8f.44.1739032765467;
        Sat, 08 Feb 2025 08:39:25 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390daf4480sm125465305e9.27.2025.02.08.08.39.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 08 Feb 2025 08:39:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 2/7] hw/char/pl011: Add transmit FIFO to PL011State
Date: Sat,  8 Feb 2025 17:39:06 +0100
Message-ID: <20250208163911.54522-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250208163911.54522-1-philmd@linaro.org>
References: <20250208163911.54522-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: PMCvGT+jux7s

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
index 60cea1d9a16..807fcdee50b 100644
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
@@ -553,6 +555,24 @@ static const VMStateDescription vmstate_pl011_clock = {
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
@@ -607,7 +627,11 @@ static const VMStateDescription vmstate_pl011 = {
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
@@ -621,6 +645,7 @@ static void pl011_init(Object *obj)
     PL011State *s = PL011(obj);
     int i;
 
+    fifo8_create(&s->xmit_fifo, PL011_FIFO_DEPTH);
     memory_region_init_io(&s->iomem, OBJECT(s), &pl011_ops, s, "pl011", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     for (i = 0; i < ARRAY_SIZE(s->irq); i++) {
@@ -633,6 +658,13 @@ static void pl011_init(Object *obj)
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
@@ -676,6 +708,7 @@ static const TypeInfo pl011_arm_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(PL011State),
     .instance_init = pl011_init,
+    .instance_finalize = pl011_finalize,
     .class_init    = pl011_class_init,
 };
 
-- 
2.47.1
