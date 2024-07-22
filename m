Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2006474njc;
        Mon, 22 Jul 2024 09:08:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUoXWi71LT5z8mGr/Yof17IKt13DZH5vHrXwQ1rYPtCLrkt6t4zqPIYVsJhk6o7mcQ5crgSmH6TXp9f8OdVzqhdGTomJ+1m
X-Received: by 2002:adf:fb8f:0:b0:368:7ea2:51c2 with SMTP id ffacd0b85a97d-369dec15d03mr269618f8f.16.1721664514555;
        Mon, 22 Jul 2024 09:08:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721664514; cv=none;
        d=google.com; s=arc-20160816;
        b=iX6c+A/RkXldobOE9/7VE3UNM0Rs3Jb2cO1L8LF2u8TMRoduIikPdOGQtwpKnqTigc
         KHstcncwjx2R63H8/0l0+Ls+s1RW4UYTE/dV8Gxz/9SESSLXa7JfYvUk4wvAXLM9Mj46
         mZS3w/xPTi1FHNFh2tcI3PyOPcL0KjdnxN90UoivUezhjlbGPoiqp3CPIC2MP9P3p74D
         l+RMqkxSxy4mmnaAvDoiMbDF3KU7XaKjTrZBkLkDohL7xxclGhH34guv/VeoFCrY2h87
         k874+/96kNq6G9PZARrbOucSzzEiGa49+rYlG6tcunlWdmTG4TPFt3G59+LR7MdyXeIN
         zNNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PGm6Mz1jj/9Q+YEDysgdokwei7I83wY7MgFeQkOcKf0=;
        fh=n8UbCQuG8D78SR88iLadv33aSx/m+uD5TpnpoFsal7U=;
        b=qCuoeUAMYYkaE5sEUxojfQYtf2wpMlpQdXSjLn4cfrn2g5vU0K2Lm4rEyzWTV1NJop
         7RkQ1JpjmRmDKbK5JR+FkQ9hxO7/ZsCoRq2Axxl+w8zOdnZ1JZ+VZYZis905UanixHYE
         iTsGYs8JFAtT9vGabnJv5p8gVC5/Nc/RMtNUp22ntwNerLZb3sjal4Orien5tMRxT5+h
         A9fmQJRyZyprYRTtGnTZBfHiJp4gvwQMRxivCIm2Lk7bCJHe8Xih/WIHzNqB2/e6Onu7
         +QPTVvhupEarrRULR4wiqo7v6EaUMJhf/+9npqGdbHcs9/EjQ/FJkB6XoEKwdNgNTF4L
         LKEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AC5jKAds;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-368786b2c4asor1796355f8f.2.2024.07.22.09.08.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Jul 2024 09:08:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AC5jKAds;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721664514; x=1722269314; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGm6Mz1jj/9Q+YEDysgdokwei7I83wY7MgFeQkOcKf0=;
        b=AC5jKAdspDinSq1YzhFkYefXRfZR5L3zn5HZ7f5QtgpSE1P/ZepkqigX+8adnYLX6R
         1d638cXz1T2vw0/jDUVxFEaYuvDOV1UQprz6b3wFPgr3SXGq0WQN4QM74dDVskMDMluD
         2GRQq73EtGhNKL+gWHoho+bv/oeUphC8b29cmulGgP9Cz1IkfPppkxn6gQ0FB3QwjVTs
         8KWH4AR8SvPApIQ/qwW76TVNQ4kjfRwyAAIqwJVR0Pv+3wZPVH2vov+YprC9aCSYO5rE
         OWXFfHG5dL72WpZ6HgPXXb4Nthg18fiK9sOa6r695XgCFkmOMQ8tKsmIqblBOkuXFoXQ
         bBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721664514; x=1722269314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PGm6Mz1jj/9Q+YEDysgdokwei7I83wY7MgFeQkOcKf0=;
        b=toBhMrs08sMKbUiO09aKZQDfuOeXCxXMmwAKzaNJ8/c9JbhcNL22QnWdyx+57m5oYk
         Pi7fX3cxEB4bKv/hkHcOVxmvllzF24S6NtcmN01n8NOrbPdJEUDEEI9PAth87xKfkll0
         aaEJhf88Ym8L1+HZX1tH2ZazJSc0dfQO8daPYnwriAKXLZpvNjs4tuKn6ww9Um5coH3+
         8ANd5efyitgYTNl1P9R6RJsmryrAjS08Fvw5TNufaKfdKl6rMVPXNvN7VZYNYYuhY/nL
         CLl3uYzQIGZ0Yj4oc/PTtvv0mPPUBmt1YL6n7Y0zQa3Y0mZJWB11ywnUpd8NToN7lJn8
         RyIg==
X-Forwarded-Encrypted: i=1; AJvYcCUpovnlW/mB+WrA6psoo26XOI5hhx+FtDZz+Kue+jF3lv82OBsr+rMYJSssLG+IHspz2T7cbtCq+U0wqyFYrXS/8Gno1gnb
X-Gm-Message-State: AOJu0YwB6XNBE6cGuQLAYDSUfLZqXzczmtLm0nFhlui2xSH9uHZnNNhx
	VoD6C2seOCk0pMYs6ePENMrpcPl5q6AtsQ+CXwwG358BXZNHRf+npD3xf5IY/iQtvg==
X-Google-Smtp-Source: AGHT+IHcH+R92EgVUUK7+rC/5DXJUPRBaCYhT4ZqdHKasDuq1aj6JEc4vlAP87+dMEui+yHCllfbhw==
X-Received: by 2002:a05:6000:4e6:b0:368:5a32:f5bc with SMTP id ffacd0b85a97d-369dee4fa8dmr206590f8f.38.1721664513985;
        Mon, 22 Jul 2024 09:08:33 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (gen92-h02-176-184-20-254.dsl.sta.abo.bbox.fr. [176.184.20.254])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3687868b5fdsm8860554f8f.38.2024.07.22.09.08.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jul 2024 09:08:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 6/7] util/fifo8: Expose fifo8_pop_buf()
Date: Mon, 22 Jul 2024 18:07:44 +0200
Message-ID: <20240722160745.67904-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240722160745.67904-1-philmd@linaro.org>
References: <20240722160745.67904-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Q7JIFQvNFpng

Extract fifo8_pop_buf() from hw/scsi/esp.c and expose
it as part of the <qemu/fifo8.h> API. This function takes
care of non-contiguous (wrapped) FIFO buffer (which is an
implementation detail).

Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/fifo8.h | 14 ++++++++++++++
 hw/scsi/esp.c        | 36 +++---------------------------------
 util/fifo8.c         | 29 +++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+), 33 deletions(-)

diff --git a/include/qemu/fifo8.h b/include/qemu/fifo8.h
index 686918a3a4..21c7a22937 100644
--- a/include/qemu/fifo8.h
+++ b/include/qemu/fifo8.h
@@ -62,6 +62,20 @@ void fifo8_push_all(Fifo8 *fifo, const uint8_t *data, uint32_t num);
  */
 uint8_t fifo8_pop(Fifo8 *fifo);
 
+/**
+ * fifo8_pop_buf:
+ * @fifo: FIFO to pop from
+ * @dest: the buffer to write the data into (can be NULL)
+ * @destlen: size of @dest and maximum number of bytes to pop
+ *
+ * Pop a number of elements from the FIFO up to a maximum of @destlen.
+ * The popped data is copied into the @dest buffer.
+ * Care is taken when the data wraps around in the ring buffer.
+ *
+ * Returns: number of bytes popped.
+ */
+uint32_t fifo8_pop_buf(Fifo8 *fifo, uint8_t *dest, uint32_t destlen);
+
 /**
  * fifo8_pop_constbuf:
  * @fifo: FIFO to pop from
diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 64384f9b0e..cec847b54a 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -197,39 +197,9 @@ static uint8_t esp_fifo_pop(ESPState *s)
     return val;
 }
 
-static uint32_t esp_fifo8_pop_buf(Fifo8 *fifo, uint8_t *dest, int maxlen)
-{
-    const uint8_t *buf;
-    uint32_t n, n2;
-    int len;
-
-    if (maxlen == 0) {
-        return 0;
-    }
-
-    len = maxlen;
-    buf = fifo8_pop_constbuf(fifo, len, &n);
-    if (dest) {
-        memcpy(dest, buf, n);
-    }
-
-    /* Add FIFO wraparound if needed */
-    len -= n;
-    len = MIN(len, fifo8_num_used(fifo));
-    if (len) {
-        buf = fifo8_pop_constbuf(fifo, len, &n2);
-        if (dest) {
-            memcpy(&dest[n], buf, n2);
-        }
-        n += n2;
-    }
-
-    return n;
-}
-
 static uint32_t esp_fifo_pop_buf(ESPState *s, uint8_t *dest, int maxlen)
 {
-    uint32_t len = esp_fifo8_pop_buf(&s->fifo, dest, maxlen);
+    uint32_t len = fifo8_pop_buf(&s->fifo, dest, maxlen);
 
     esp_update_drq(s);
     return len;
@@ -335,7 +305,7 @@ static void do_command_phase(ESPState *s)
     if (!cmdlen || !s->current_dev) {
         return;
     }
-    esp_fifo8_pop_buf(&s->cmdfifo, buf, cmdlen);
+    fifo8_pop_buf(&s->cmdfifo, buf, cmdlen);
 
     current_lun = scsi_device_find(&s->bus, 0, s->current_dev->id, s->lun);
     if (!current_lun) {
@@ -381,7 +351,7 @@ static void do_message_phase(ESPState *s)
     /* Ignore extended messages for now */
     if (s->cmdfifo_cdb_offset) {
         int len = MIN(s->cmdfifo_cdb_offset, fifo8_num_used(&s->cmdfifo));
-        esp_fifo8_pop_buf(&s->cmdfifo, NULL, len);
+        fifo8_pop_buf(&s->cmdfifo, NULL, len);
         s->cmdfifo_cdb_offset = 0;
     }
 }
diff --git a/util/fifo8.c b/util/fifo8.c
index 31f0d34c0c..6610b79182 100644
--- a/util/fifo8.c
+++ b/util/fifo8.c
@@ -102,6 +102,35 @@ const uint8_t *fifo8_pop_constbuf(Fifo8 *fifo, uint32_t max, uint32_t *numptr)
     return fifo8_peekpop_buf(fifo, max, numptr, true);
 }
 
+uint32_t fifo8_pop_buf(Fifo8 *fifo, uint8_t *dest, uint32_t destlen)
+{
+    const uint8_t *buf;
+    uint32_t n1, n2 = 0;
+    uint32_t len;
+
+    if (destlen == 0) {
+        return 0;
+    }
+
+    len = destlen;
+    buf = fifo8_pop_constbuf(fifo, len, &n1);
+    if (dest) {
+        memcpy(dest, buf, n1);
+    }
+
+    /* Add FIFO wraparound if needed */
+    len -= n1;
+    len = MIN(len, fifo8_num_used(fifo));
+    if (len) {
+        buf = fifo8_pop_constbuf(fifo, len, &n2);
+        if (dest) {
+            memcpy(&dest[n1], buf, n2);
+        }
+    }
+
+    return n1 + n2;
+}
+
 bool fifo8_is_empty(Fifo8 *fifo)
 {
     return (fifo->num == 0);
-- 
2.41.0
