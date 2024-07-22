Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2006397njc;
        Mon, 22 Jul 2024 09:08:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXDVj4KtriUOxnSKGhiJSPur3NgfcnTwfDFAgUxdmwj+6O/Y8XIju/eA7JbAzTcS5LlOcFr98vEw5xP1SMl8Gxbj6DYoLb2
X-Received: by 2002:a05:600c:4f50:b0:426:616e:db8d with SMTP id 5b1f17b1804b1-427dc52128fmr45259085e9.15.1721664508621;
        Mon, 22 Jul 2024 09:08:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721664508; cv=none;
        d=google.com; s=arc-20160816;
        b=cbY3eOkOfsSNz9PplX0oKr843J7jvl6A4X7zszX8ByEPdKliwAeTIDLy5PmsMSkH+t
         Asy2qiVPbrGLULMj2Yh3hJux+Vh+cGCnNtVTyTeu4sJijOLqhPpm5QF/b0dnnEqKiQV+
         QysXA4u/8yJ25Y93uWiWk9Hx4hrTCTgCyH0RqgHjEotfhDS89nMbjcjzJqUnkhfaD/hC
         9EDdt6NundLOSTkBq1Jra3uBHhiluD+tkHK+JwdF3OiM4fP7l7+V2pmG8ii1BIeMetc+
         gWQEAe8f/GKpsyZk30nGTHngTcEEGJnQfxmXqkWTZ11aS4Lo8lLmldsbEMSEB8zMcnOK
         vlMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=D13SsLbTdb+rPn3f2Roi8BU4ul1b5GgWpSQvaH/PkW0=;
        fh=fUw1m0M9ixVL7b1XdPZOOxc50UGHWyUF+lh7CXBoSSc=;
        b=0wolDtesl1ARwOYgtB3z2KoPzol9D1P2RqblxFdVfMFVdL8WwYJT3dxceNyU5vuo2G
         Ln8fuWuuCqicQAxvQN54P4XO41PFmvvKu+EhDTXRq7iAYLL7rYE37nbbKl2vPsjByHuL
         SIBsMHJG2XibDnsDv8kTx+9ey1KJPzDKqokai46ltNV5OIXLMuCuSoqh6KwtQQY7z8Mm
         yLY3m4GZKrwHtj5n5O1wD7gh02gpvJahQ7jq5bgPEjxiAogDNJqChPCEOeFTV+/UHCKK
         0zqu5PPZWbIr5uUj760DzYZaS1AwR40ksnwH8ILWqHntuHsjHNCBL+4MLbqa3HjCgQDx
         nn7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eQ9uu9AQ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-427d6fedf56sor20160425e9.13.2024.07.22.09.08.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Jul 2024 09:08:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eQ9uu9AQ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721664508; x=1722269308; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D13SsLbTdb+rPn3f2Roi8BU4ul1b5GgWpSQvaH/PkW0=;
        b=eQ9uu9AQ7jHmRNnofFsRoLDbdxEpGbHUkQ6ZrW7wCtJYDsT6CJTrrTeQuBj6Es5fwK
         DhMcFinX2avlXEGFtMbciEGGc0y57QJewxHmpHs/1MysevVnBc98mZGD/02pr3BIQWvV
         sks8lxPWsl50FN2vxr+aV0d8ZnYK/JvGuJjaDkqBtMVixTvqy+9soGVvzus8a1oW8hfP
         QYxedQJoN0zBX+muPWeTynxmSCiBXRmDZ71etblsvwK1NNCBOl6ifmvd2oiM0/Thuk6v
         Et2RRSaG+eg4m8nYbEDM58/5WVz3dx8cA8MBAZS4e9pSkjWFjbMnWXhfRyPoAJCDxltY
         besQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721664508; x=1722269308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D13SsLbTdb+rPn3f2Roi8BU4ul1b5GgWpSQvaH/PkW0=;
        b=X+ystW4BbB9IDym06LrZjtSDT9xsp899FeUzQ+8pNdi+PqDDZUlUncZXG7ZRH81OH2
         Jz4d0Q/P+FvUZTv1Dwifeira6Q0WS5S7Nz3n6lLLmbPQhLx3WSo9EVxrflF4PAv9dVcH
         0zlzt1Mq0lVbcVWMrdfvXQqijmx7lBwTBGgif3pZH7dm8WfC4labOdxgqr+S0YhzplW3
         Ni0fEaOc0yfWoyGNaoTdKKaF7bFtWVY8SgcQ7e2FZUQNx0fJb4eZ0gB2mn4ldcwRdLMf
         O5xDTT1sVIUvavyw5wukwkkCngomRXW+VHDcyT3vpf+MOYSOYojYtK+Esw0ffbXk3/fh
         GMnw==
X-Forwarded-Encrypted: i=1; AJvYcCUgWweF2i0zVszXXMwCsyg8Y1p5+xsd1kelPkeMWaazFo9Obk7iQtdCP8NZHticG7wlIaBZNClcfpw9Km5LCJRI8eziPB5m
X-Gm-Message-State: AOJu0Yy5HE8ibiOViSS1rPmCAzkC7mrwHNqnPHzy17tuhVVnWXiusmSP
	2IjVUq7XgrKTWkk4PDQxk3nYKcE36EVKM2u706HABoyNr2/q6e/58Wh1QGIAa7bpMA==
X-Google-Smtp-Source: AGHT+IHRr2Hse5CaEmOALI6VDv3D1w/NDKzUvtjoPzuh1A/PDTLZOczZbBtc36qmY7CP1Trc0EdJ8g==
X-Received: by 2002:a05:600c:1d8f:b0:426:51dc:f6cd with SMTP id 5b1f17b1804b1-427dc529057mr55262845e9.18.1721664508179;
        Mon, 22 Jul 2024 09:08:28 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (gen92-h02-176-184-20-254.dsl.sta.abo.bbox.fr. [176.184.20.254])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368787ced33sm8964748f8f.86.2024.07.22.09.08.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jul 2024 09:08:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 5/7] util/fifo8: Rename fifo8_pop_buf() -> fifo8_pop_constbuf()
Date: Mon, 22 Jul 2024 18:07:43 +0200
Message-ID: <20240722160745.67904-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240722160745.67904-1-philmd@linaro.org>
References: <20240722160745.67904-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /qQfw7g7dx2O

Since fifo8_pop_buf() return a const buffer (which points
directly into the FIFO backing store), rename it using the
'constbuf' suffix. This will help differentiate with methods
*copying* the FIFO data.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/fifo8.h    | 4 ++--
 chardev/msmouse.c       | 2 +-
 hw/char/goldfish_tty.c  | 4 ++--
 hw/net/allwinner_emac.c | 2 +-
 hw/scsi/esp.c           | 4 ++--
 ui/console-vc.c         | 2 +-
 ui/gtk.c                | 2 +-
 util/fifo8.c            | 2 +-
 8 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/qemu/fifo8.h b/include/qemu/fifo8.h
index 79450f4583..686918a3a4 100644
--- a/include/qemu/fifo8.h
+++ b/include/qemu/fifo8.h
@@ -63,7 +63,7 @@ void fifo8_push_all(Fifo8 *fifo, const uint8_t *data, uint32_t num);
 uint8_t fifo8_pop(Fifo8 *fifo);
 
 /**
- * fifo8_pop_buf:
+ * fifo8_pop_constbuf:
  * @fifo: FIFO to pop from
  * @max: maximum number of bytes to pop
  * @numptr: pointer filled with number of bytes returned (can be NULL)
@@ -86,7 +86,7 @@ uint8_t fifo8_pop(Fifo8 *fifo);
  *
  * Returns: A pointer to popped data.
  */
-const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
+const uint8_t *fifo8_pop_constbuf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
 
 /**
  * fifo8_peek_constbuf: read upto max bytes from the fifo
diff --git a/chardev/msmouse.c b/chardev/msmouse.c
index a774c397b4..08836d92e8 100644
--- a/chardev/msmouse.c
+++ b/chardev/msmouse.c
@@ -81,7 +81,7 @@ static void msmouse_chr_accept_input(Chardev *chr)
         const uint8_t *buf;
         uint32_t size;
 
-        buf = fifo8_pop_buf(&mouse->outbuf, MIN(len, avail), &size);
+        buf = fifo8_pop_constbuf(&mouse->outbuf, MIN(len, avail), &size);
         qemu_chr_be_write(chr, buf, size);
         len = qemu_chr_be_can_write(chr);
         avail -= size;
diff --git a/hw/char/goldfish_tty.c b/hw/char/goldfish_tty.c
index f8ff043c39..2c5004851d 100644
--- a/hw/char/goldfish_tty.c
+++ b/hw/char/goldfish_tty.c
@@ -69,7 +69,7 @@ static uint64_t goldfish_tty_read(void *opaque, hwaddr addr,
 static void goldfish_tty_cmd(GoldfishTTYState *s, uint32_t cmd)
 {
     uint32_t to_copy;
-    uint8_t *buf;
+    const uint8_t *buf;
     uint8_t data_out[GOLFISH_TTY_BUFFER_SIZE];
     int len;
     uint64_t ptr;
@@ -109,7 +109,7 @@ static void goldfish_tty_cmd(GoldfishTTYState *s, uint32_t cmd)
         len = s->data_len;
         ptr = s->data_ptr;
         while (len && !fifo8_is_empty(&s->rx_fifo)) {
-            buf = (uint8_t *)fifo8_pop_buf(&s->rx_fifo, len, &to_copy);
+            buf = fifo8_pop_constbuf(&s->rx_fifo, len, &to_copy);
             address_space_rw(&address_space_memory, ptr,
                             MEMTXATTRS_UNSPECIFIED, buf, to_copy, 1);
 
diff --git a/hw/net/allwinner_emac.c b/hw/net/allwinner_emac.c
index 989839784a..3b0a2ee07e 100644
--- a/hw/net/allwinner_emac.c
+++ b/hw/net/allwinner_emac.c
@@ -349,7 +349,7 @@ static void aw_emac_write(void *opaque, hwaddr offset, uint64_t value,
                               "allwinner_emac: TX length > fifo data length\n");
             }
             if (len > 0) {
-                data = fifo8_pop_buf(fifo, len, &ret);
+                data = fifo8_pop_constbuf(fifo, len, &ret);
                 qemu_send_packet(nc, data, ret);
                 aw_emac_tx_reset(s, chan);
                 /* Raise TX interrupt */
diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 526ed91bef..64384f9b0e 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -208,7 +208,7 @@ static uint32_t esp_fifo8_pop_buf(Fifo8 *fifo, uint8_t *dest, int maxlen)
     }
 
     len = maxlen;
-    buf = fifo8_pop_buf(fifo, len, &n);
+    buf = fifo8_pop_constbuf(fifo, len, &n);
     if (dest) {
         memcpy(dest, buf, n);
     }
@@ -217,7 +217,7 @@ static uint32_t esp_fifo8_pop_buf(Fifo8 *fifo, uint8_t *dest, int maxlen)
     len -= n;
     len = MIN(len, fifo8_num_used(fifo));
     if (len) {
-        buf = fifo8_pop_buf(fifo, len, &n2);
+        buf = fifo8_pop_constbuf(fifo, len, &n2);
         if (dest) {
             memcpy(&dest[n], buf, n2);
         }
diff --git a/ui/console-vc.c b/ui/console-vc.c
index 899fa11c94..e9906aae59 100644
--- a/ui/console-vc.c
+++ b/ui/console-vc.c
@@ -287,7 +287,7 @@ static void kbd_send_chars(QemuTextConsole *s)
         const uint8_t *buf;
         uint32_t size;
 
-        buf = fifo8_pop_buf(&s->out_fifo, MIN(len, avail), &size);
+        buf = fifo8_pop_constbuf(&s->out_fifo, MIN(len, avail), &size);
         qemu_chr_be_write(s->chr, buf, size);
         len = qemu_chr_be_can_write(s->chr);
         avail -= size;
diff --git a/ui/gtk.c b/ui/gtk.c
index bc29f7a1b4..a4db90e8cb 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1820,7 +1820,7 @@ static void gd_vc_send_chars(VirtualConsole *vc)
         const uint8_t *buf;
         uint32_t size;
 
-        buf = fifo8_pop_buf(&vc->vte.out_fifo, MIN(len, avail), &size);
+        buf = fifo8_pop_constbuf(&vc->vte.out_fifo, MIN(len, avail), &size);
         qemu_chr_be_write(vc->vte.chr, buf, size);
         len = qemu_chr_be_can_write(vc->vte.chr);
         avail -= size;
diff --git a/util/fifo8.c b/util/fifo8.c
index 21943c6032..31f0d34c0c 100644
--- a/util/fifo8.c
+++ b/util/fifo8.c
@@ -97,7 +97,7 @@ const uint8_t *fifo8_peek_constbuf(Fifo8 *fifo, uint32_t max, uint32_t *numptr)
     return fifo8_peekpop_buf(fifo, max, numptr, false);
 }
 
-const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr)
+const uint8_t *fifo8_pop_constbuf(Fifo8 *fifo, uint32_t max, uint32_t *numptr)
 {
     return fifo8_peekpop_buf(fifo, max, numptr, true);
 }
-- 
2.41.0
