Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2006542njc;
        Mon, 22 Jul 2024 09:08:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWtbPKsSx266HbTe1voE10zu1LZErq/P//D5mzGkrl6ZYl6BV03QHPrT0UU0ee/rq/+tkGzSZ/qMsAifnQPLYFrC34pfBdq
X-Received: by 2002:a05:600c:458a:b0:426:6416:aa83 with SMTP id 5b1f17b1804b1-427dc515c32mr61741605e9.6.1721664520712;
        Mon, 22 Jul 2024 09:08:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721664520; cv=none;
        d=google.com; s=arc-20160816;
        b=NwrWU2obJO0lA4WZfzlauc+/6Ce8siMmkCy6LO1frA0PkPnh3wowoNBa9r0MmitAYN
         wQqtRsikPUG7+9cJnS4mPCM+mTENYO+OxV3aju2g16KD+MPcfPb29HuoUpY7i0sBpI1O
         fHsBmWoTrZqD8JxXcTUPWRZSYWd4gvwn2lMpHL8r1LjOP6EhyySKW5hXJvNEZ9PRdHPA
         IvMnFTIhU++UjoFfwH7q5v0/S56PiRHW0/QoYusvu+MRnTfR6IV6dMIdPclL1CBdGlaB
         DR/B8CQF9tRyu4F9mqq9GhTD7yBAd6/vpWbQbxMfGWApz+y6b3lb76dqUcvQ+2Hz93dy
         k5/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oLrYF0/Wx1i/Oi595G8nLiFu8j75+0aJtBHlGLk36ig=;
        fh=PT89Qwd4qA0875rrtEHdMxLT4WXv/juA0s8WGObOZGY=;
        b=P0jS1cqr24hXaD1FHy/6HUT4xW48hJ7Cat/hdfeISloi4ocnSh4nULYBFMKYOcytMj
         XoiaOsiPpnUpNN0ZMc/EV8Y+m5I2TNoSCopDow94N5OropHcoPeF7DVnzXeKNZyipDVW
         M2JaNyR1OY36LDN6iJNcO9hcRJKOOE5st9mjD66H5jO9XlN3q2g/JBdYDX3mEhZeV8Al
         9CF8eynv+SowZUImihAvUXvELvo31An7gnJrDmUVH7uD/YrUArakbzTGTEhSzqsYIJ9E
         /FJlFNNO5C0CUXeYLT7r9mMHjI3ESj3RBhzaItTfVSPFPVpR6cq/pDj/U4hMJIUDSkwq
         8nYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gKCJiwfA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-427d6ebc855sor28271465e9.1.2024.07.22.09.08.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Jul 2024 09:08:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gKCJiwfA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721664520; x=1722269320; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLrYF0/Wx1i/Oi595G8nLiFu8j75+0aJtBHlGLk36ig=;
        b=gKCJiwfA9/3XIVEvUhoACcoyRwrBLx0J0y/X1gdpmJFS3LQ8AKA8MwSplq9rvzfTXu
         xHsPWtam4dAF96hoq6kCoWYvaBolgebIxTrsTL8wyp7JeYLMPYR2i+TWmDgtxqoyj6o3
         seIMObfEixFfn1MF3lx6Y6jrPO6cO39Gwy3tbLwTjHQPdK1Kn5YdRUUKq+cAOQ/yqQI9
         JQ3yKEvBvueH6wxAgv7lUPtAZtaBSyYJs0LQllQop+6ape6rChx7UmkiI5HXkL1Lqn/+
         sWvGSxBoVMdc6lkToqqtSQl6UHfcSqkyRTohlKI5IdWQJQkBmnHRsyKkiqYU8KDmlnjV
         m8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721664520; x=1722269320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLrYF0/Wx1i/Oi595G8nLiFu8j75+0aJtBHlGLk36ig=;
        b=UMopMIGucMd8G+Vc2BIBr0QINwoTa3Hu+gcMS8Pp8JtpY/n8lL5DcWM/6K6in387Em
         eLd+gRaDosen+HGOCdBkT3mkTRbh9ov36/0kdqI0wYvifO5svc9onjMJSRJGfY4sAK8k
         BTAQytRL3NOIBr8rirSm1tL+6KF6kCeDLAC1P2/LCj5V+lxyhnsSS1IQzAH/aR/gu2Vf
         47XqlZD8bXsCQGe2JwYkh5IKEYSkGqad/tzpR7A8XMhokz4myqsdP9zickJQidaJXNzr
         My02kXvmTv97xxko+vGN6e/5KILpxwLfIoVPVCQPU5tXHOodOI45aIvntq3D+jrbMUx3
         ekWA==
X-Forwarded-Encrypted: i=1; AJvYcCUc2NK90L6MUeYFnnFkr7jXJQnm8J9tj2k+jA0PpzSSGK1L+1mqHuqMVD4d3f3FGEmeV+l0a95MrK9F66wzBVXGtNNJlDJX
X-Gm-Message-State: AOJu0YzPeuK8INJRL9+bVhfsij5k0yjD5jQFhqzHdMPVdPJnqOlI4Ei5
	0lliCxbSiaqVsJASjuxKO3E+sLlMQoevgalkpZwOdfpUKe2xam4wHsuIliH8U8bC1g==
X-Google-Smtp-Source: AGHT+IGmGU63KNcR5lhPUTQT673NSNTIExqPMcMydnIJUtRXt0pgBbXK6AJt59/e9lh+rA71DDL5TA==
X-Received: by 2002:a05:600c:3b26:b0:426:5b44:2be7 with SMTP id 5b1f17b1804b1-427dc5204bfmr69229835e9.10.1721664520226;
        Mon, 22 Jul 2024 09:08:40 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (gen92-h02-176-184-20-254.dsl.sta.abo.bbox.fr. [176.184.20.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427e29d11d5sm66473215e9.38.2024.07.22.09.08.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jul 2024 09:08:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 7/7] util/fifo8: Introduce fifo8_discard()
Date: Mon, 22 Jul 2024 18:07:45 +0200
Message-ID: <20240722160745.67904-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240722160745.67904-1-philmd@linaro.org>
References: <20240722160745.67904-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yjRbtAfidcqn

Add the fifo8_discard() helper for clarity.
It is a simple wrapper over fifo8_pop_buf().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/fifo8.h | 8 ++++++++
 hw/scsi/esp.c        | 2 +-
 util/fifo8.c         | 6 ++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/qemu/fifo8.h b/include/qemu/fifo8.h
index 21c7a22937..53bafabd25 100644
--- a/include/qemu/fifo8.h
+++ b/include/qemu/fifo8.h
@@ -129,6 +129,14 @@ const uint8_t *fifo8_pop_constbuf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
  */
 const uint8_t *fifo8_peek_constbuf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
 
+/**
+ * fifo8_discard:
+ * @fifo: FIFO to consume bytes
+ *
+ * Discard (consume) bytes from a FIFO.
+ */
+void fifo8_discard(Fifo8 *fifo, uint32_t len);
+
 /**
  * fifo8_reset:
  * @fifo: FIFO to reset
diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index cec847b54a..c703fa7351 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -351,7 +351,7 @@ static void do_message_phase(ESPState *s)
     /* Ignore extended messages for now */
     if (s->cmdfifo_cdb_offset) {
         int len = MIN(s->cmdfifo_cdb_offset, fifo8_num_used(&s->cmdfifo));
-        fifo8_pop_buf(&s->cmdfifo, NULL, len);
+        fifo8_discard(&s->cmdfifo, len);
         s->cmdfifo_cdb_offset = 0;
     }
 }
diff --git a/util/fifo8.c b/util/fifo8.c
index 6610b79182..ea39ca2552 100644
--- a/util/fifo8.c
+++ b/util/fifo8.c
@@ -131,6 +131,12 @@ uint32_t fifo8_pop_buf(Fifo8 *fifo, uint8_t *dest, uint32_t destlen)
     return n1 + n2;
 }
 
+void fifo8_consume(Fifo8 *fifo, uint32_t len)
+{
+    len -= fifo8_pop_buf(fifo, NULL, len);
+    assert(len == 0);
+}
+
 bool fifo8_is_empty(Fifo8 *fifo)
 {
     return (fifo->num == 0);
-- 
2.41.0
