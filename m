Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2006326njc;
        Mon, 22 Jul 2024 09:08:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWbNEj9wXBEVMgHu7qQ4Ow+MPmmoTnnvPF4sJ8KuswzZVRj/P5f0TdYv1EyIFGpecH4eK8bRjBE0wUSh+UrDCA9KnB7qfwa
X-Received: by 2002:a05:600c:1c9e:b0:423:791:f446 with SMTP id 5b1f17b1804b1-427dc51a01emr45871665e9.7.1721664502503;
        Mon, 22 Jul 2024 09:08:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721664502; cv=none;
        d=google.com; s=arc-20160816;
        b=wnRv2m5JWdLb3KmAZNdULbPhGFfjc5RZ8xNzo9T2tr1V3HTK3OHI2fOVcYF5ZGBMgJ
         JXXgSZWrsFTeAbqxfT8SpoBSZItf2UmQzqplSFWXFbCqSc0XqrmRaasHPyerq669YW4z
         KiZHKPjl4E8Q8VU2EijTc99woXkyT5LF2Yc9dvU2wCSGI6xReHYWOZ6ufRuumEAY9/iT
         l+p1+I3McThGn1zskQNOnpzFz/lo3m2tO50ziEU5TjF6NoYac/RCp+A5Jl7cFEKIAqJ/
         SLb5G6Fb2/iyHByePF2STpPLs13lXnPPw0wuAtZO32amhUyZ4XNs9ECKuKAuEAH7FBD7
         qa5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=g5IVJQKs0mRewT92ekkS2OE3V+7eufImd7ZnhLfAtiw=;
        fh=bgC3MEJekt4UG4CDObmaM+kjCJ4txe8OFykgujEnCKg=;
        b=qhPsTj+RxkYJwVe+JBtB2Lt6bign5FSDnsgvBmXU61phGbYP5zel1tO2t2mVyyhGIm
         b3Gd4989W+vraYYnW0lC6Io0cnK4ePsFU97h5Lu0vjv4BrD0rcbJBPVlhWKowRPtW6zT
         J/h/b2pXH+gXLAre4NZ8uHvQTcubg/5K8fJoj1kfCYooRD07eFOKEAMHCPkeLjKPI1Q0
         2g7kotT+CIVrxqu86vWbGQoqEYev3ASZYNa/KWfJH8EdUQohzd6uCErFzXaSuBjsE6UY
         jMXJMMe6cS/EbiqpkK4vbtNwvgaBL7Ati3sTivI1tj248mrXOnHvXuI9tRGxwOVs5nSp
         IMOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jj4jDej4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-427d6fffd20sor20629775e9.12.2024.07.22.09.08.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Jul 2024 09:08:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jj4jDej4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721664502; x=1722269302; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5IVJQKs0mRewT92ekkS2OE3V+7eufImd7ZnhLfAtiw=;
        b=Jj4jDej4bDI0VBawJs4WbCBAEXOvVRVqDz6kk4N+UbPsAvud98vAv5UxELOool086B
         2y/3lEWI8UQeLEz1UdrNtCrwFRZGRafXSlCLHrcMwNdjLeNFqjU0ye4lnBL9Hxb+lrnl
         JTwuVgFcduX24gaLp1iXJNuWqSGjnAn6hlk5rRIvNicYrU9o8K6Nz1ID59j9wuW3Ml6o
         LjcPv7DEyOV0s7QR8ffsiF6xmcYQnWsGhlN78wVt0utZ4xRrvEaQfM9RsOrThXBAIMmV
         jw4++Ky6MsYj5BtD0lQQX92nJeAOlsdpcblQ8WcY8LVPwhTdOCJW/FGJzaU4mTGXiUm2
         7nFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721664502; x=1722269302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5IVJQKs0mRewT92ekkS2OE3V+7eufImd7ZnhLfAtiw=;
        b=DPoNpcFkVUNLki6gZ3yJPCR+ryKmGiCbAwcpjH7p8RP4jet45oR3RT5sp1TkBKQSRb
         u0IIa7C+LGPjG+prtTsG7+wktMpC3PcF5gzeog54zSV6HsoZYfWWdv0T/qHSPnxDfc6G
         17APIXTprzc/mTxCTlXZ/Mm5cMA3Q/w1sleS+nSYJGapZcvqhZZ+hCm3lYbBjP+ZQn+j
         316vAICa2T7abNybgiNhcAwS/9cxtm9g5nDEC/EJrIznlJfT1Ipb4spk6IMjBnWGfwMI
         43Gxz8dubnap0HEePcvdF/fJXtp8FpZ5bUZCmUYoQhR5s7b8ksVzagPOs7h+VdumD7XS
         c0vA==
X-Forwarded-Encrypted: i=1; AJvYcCXX1oes925WVOzVynhzmZH4P7ioNnSzPMDi+5Bs89p7SOmsByvVOb6Fl7reKQXH5va9Wf4ByYhKNG3BVr70FALioAuTrlIn
X-Gm-Message-State: AOJu0YwHoB7bUR/Dj/zrrxSjTF5Ri2ZqaxN7dFdbXY5uSRnUSJ1JIB/L
	OCt2Umzmc9u+F0/FmBYnO8X2a2zBDOPjGrlvuEgyXVUotrkpHiypaUPhFN2mWwn68g==
X-Google-Smtp-Source: AGHT+IES0/0Gp6R84KpnzozIZodYH7Kb9siP7ixWABhurMCjoRnsqoUxlHz7lH8/H+pAi3dKtB6eWg==
X-Received: by 2002:a05:600c:1c9e:b0:423:791:f446 with SMTP id 5b1f17b1804b1-427dc51a01emr45867695e9.7.1721664491827;
        Mon, 22 Jul 2024 09:08:11 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (gen92-h02-176-184-20-254.dsl.sta.abo.bbox.fr. [176.184.20.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a7257esm158849065e9.28.2024.07.22.09.08.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jul 2024 09:08:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 4/7] util/fifo8: Rename fifo8_peek_buf() -> fifo8_peek_constbuf()
Date: Mon, 22 Jul 2024 18:07:42 +0200
Message-ID: <20240722160745.67904-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240722160745.67904-1-philmd@linaro.org>
References: <20240722160745.67904-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yKNHA82b2PVd

Since fifo8_peek_buf() return a const buffer (which points
directly into the FIFO backing store), rename it using the
'constbuf' suffix. This will help differentiate with methods
*copying* the FIFO data.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/fifo8.h | 4 ++--
 hw/scsi/esp.c        | 2 +-
 util/fifo8.c         | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/qemu/fifo8.h b/include/qemu/fifo8.h
index 2692d6bfda..79450f4583 100644
--- a/include/qemu/fifo8.h
+++ b/include/qemu/fifo8.h
@@ -89,7 +89,7 @@ uint8_t fifo8_pop(Fifo8 *fifo);
 const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
 
 /**
- * fifo8_peek_buf: read upto max bytes from the fifo
+ * fifo8_peek_constbuf: read upto max bytes from the fifo
  * @fifo: FIFO to read from
  * @max: maximum number of bytes to peek
  * @numptr: pointer filled with number of bytes returned (can be NULL)
@@ -113,7 +113,7 @@ const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
  *
  * Returns: A pointer to peekable data.
  */
-const uint8_t *fifo8_peek_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
+const uint8_t *fifo8_peek_constbuf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
 
 /**
  * fifo8_reset:
diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 8504dd30a0..526ed91bef 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -486,7 +486,7 @@ static bool esp_cdb_ready(ESPState *s)
         return false;
     }
 
-    pbuf = fifo8_peek_buf(&s->cmdfifo, len, &n);
+    pbuf = fifo8_peek_constbuf(&s->cmdfifo, len, &n);
     if (n < len) {
         /*
          * In normal use the cmdfifo should never wrap, but include this check
diff --git a/util/fifo8.c b/util/fifo8.c
index 2925fe5611..21943c6032 100644
--- a/util/fifo8.c
+++ b/util/fifo8.c
@@ -92,7 +92,7 @@ static const uint8_t *fifo8_peekpop_buf(Fifo8 *fifo, uint32_t max,
     return ret;
 }
 
-const uint8_t *fifo8_peek_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr)
+const uint8_t *fifo8_peek_constbuf(Fifo8 *fifo, uint32_t max, uint32_t *numptr)
 {
     return fifo8_peekpop_buf(fifo, max, numptr, false);
 }
-- 
2.41.0
