Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp703432ejq;
        Thu, 9 Nov 2023 11:28:29 -0800 (PST)
X-Received: by 2002:a17:906:794a:b0:9c3:b609:7211 with SMTP id l10-20020a170906794a00b009c3b6097211mr5323411ejo.1.1699558109748;
        Thu, 09 Nov 2023 11:28:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699558109; cv=none;
        d=google.com; s=arc-20160816;
        b=PuD+OS1Woc5ySCwt83XBkptrPI4oSRsU5xF7C3Y2fL1JTTquSC6n0PNrgXPolmOBAk
         12U7rl/9dGJSC4ZE2iLO0bmTsBx2IoF3/mmS8c8OR2+WyZraKcFPM6zG6a7w/qFbdAnU
         /I5v4O8kprh8ZgAiGNm4QFS7GDDHvFjtMaC3cVgF/1RbsJhJHmBgeH/YvGoB9HpVZQBV
         cVTvc+L81Alj1HUuRCTv1Qb7cW4ZfwttnymGHEl+HaMhCkGp4jszqlZt0z8McfNCbrmy
         QTMleabmCu3EeF1i34pbD+rf9/n67frG3ezQoUyv4p7UNrgXMUxjyHcsJbjMJfX9kCcU
         YwSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BO0D2WVoS2EP+jLak3Jz2oTxKuP2p7K6nXjgv8ItBfQ=;
        fh=GQxR5x0bbpeaxpQRj0Ss2iF9lxOTaG+uCQYEI2XZ3x0=;
        b=PoZ01RrUHPOKGkJt+fDkWnCLnZOB+Z7hUtxJ5IwwgsXVnzQ/6DAOY4v7Kg0s8HEM5s
         TnQOEFeLRlcCXvQjp+NmLZhSmTx7psuB3NI0NBgEcEILUdh+L1sD7dATVKLlwUAno5Cl
         Q0b414DUlYFlzas/FFgen7zQGs4kUf//0UgHK2GvfDWD+iT9LdQ4TJ011XwOHcn1zKeZ
         BMZ7vFv59IRF31jHYrIoQNb3ryliDQRb1njog+DhP7y4ptozGBdc0+UC5wjs5XwZlbm4
         yrwcBtV0TAE91rgTRexiWtq4xJzS8s/C2FJ5mdxV2ebjOAQ1jPujRrjcNWecHA3xClV2
         XZVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sv4A3YYw;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 11-20020a170906024b00b009b927358aa2sor3155969ejl.13.2023.11.09.11.28.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 Nov 2023 11:28:29 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sv4A3YYw;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699558109; x=1700162909; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BO0D2WVoS2EP+jLak3Jz2oTxKuP2p7K6nXjgv8ItBfQ=;
        b=Sv4A3YYw86RQ6QW80qB31e4kMNAOCCZL+6LqEuhyKgfhPD6tYw00wETFAuwp8Aslog
         hbRa5f29ka0OM5NWmOp6A1DR9yughE44Gi0RSVh9psaLgxPZrO5iCo10fjLREzjVD+05
         5LGYrSD7UjjxOESqZJEtxoH0uzUbdV9IY1Ivp61fkDBEWfP+/mxsS4tSZyBUbRa92RUj
         4SKibl+mxw9vnopLrlM6AQMsqaoY1a/KmtBnKXZ6FoZv3bHgPFU9lnVjU/BlkdmglMGQ
         YZkPtbuHjDm/x+91AXLK5K96SlayYRdwWfW/7nVSkAKIB3TIHNUT0pjCd/wWl3MOb5xL
         LsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699558109; x=1700162909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BO0D2WVoS2EP+jLak3Jz2oTxKuP2p7K6nXjgv8ItBfQ=;
        b=fvtQirfHGf6CmhXApNa5rzn+LEaSoarITlDV71YiMFBory/5A6LFclMFgX58UxM6OW
         oNTQoJzYzqknmcPhAN09G4gwAcM0U7IiGD9iOrHxFicJgCo7TwuV9wZ8kadr3rxRRu1T
         CfnLeIvvfClxalb9D6oE+UFZuDFtggHdK/piIaxu6qvXdj48NPUn7DKNuADJZEl7OAgR
         DGZUDk9sGnyV1yxn/MDsUuh8yJhH0Xi+yFqUDsZGcjJ7MvRg4bdG9c/ITM8tE0QGAqW9
         GTe52FDq494xHnBITK0vIdoH7P/gga2qAFf2bCbASpnjov9WxIFjNiuUaA3EwArf/QVr
         WvyQ==
X-Gm-Message-State: AOJu0YwYdrTKVcwDa8LhZwDR05YoRXGlBLhpwVW+0O39wWvpUG42Gf4v
	L0hxi1jF3Lbr6rs+Ycx26K6C2d2V
X-Google-Smtp-Source: AGHT+IErozPHp4wXVfvM31ctOVenAXpEfiALK8Ch0iN8zfmFu4saFlT+Vx/fZ+gXY7mkQxuDuPS/fQ==
X-Received: by 2002:a17:907:7faa:b0:9e0:5f68:143c with SMTP id qk42-20020a1709077faa00b009e05f68143cmr5572161ejc.35.1699558109337;
        Thu, 09 Nov 2023 11:28:29 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.199.161])
        by smtp.gmail.com with ESMTPSA id qh23-20020a170906ecb700b009a19701e7b5sm2954549ejb.96.2023.11.09.11.28.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Nov 2023 11:28:28 -0800 (PST)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Francisco Iglesias <frasse.iglesias@gmail.com>
Subject: [PATCH-for-8.2 v4 02/10] util/fifo8: Introduce fifo8_peek_buf()
Date: Thu,  9 Nov 2023 20:28:06 +0100
Message-ID: <20231109192814.95977-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109192814.95977-1-philmd@linaro.org>
References: <20231109192814.95977-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fN8331GAxrjL

To be able to peek at FIFO content without popping it,
introduce the fifo8_peek_buf() method by factoring
common content from fifo8_pop_buf().

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/fifo8.h | 27 +++++++++++++++++++++++++++
 util/fifo8.c         | 22 ++++++++++++++++++----
 2 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/include/qemu/fifo8.h b/include/qemu/fifo8.h
index d0d02bc73d..c6295c6ff0 100644
--- a/include/qemu/fifo8.h
+++ b/include/qemu/fifo8.h
@@ -93,6 +93,33 @@ uint8_t fifo8_pop(Fifo8 *fifo);
  */
 const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
 
+/**
+ * fifo8_peek_buf: read upto max bytes from the fifo
+ * @fifo: FIFO to read from
+ * @max: maximum number of bytes to peek
+ * @numptr: pointer filled with number of bytes returned (can be NULL)
+ *
+ * Peek into a number of elements from the FIFO up to a maximum of max.
+ * The buffer containing the data peeked into is returned. This buffer points
+ * directly into the FIFO backing store. Since data is invalidated once any
+ * of the fifo8_* APIs are called on the FIFO, it is the caller responsibility
+ * to access it before doing further API calls.
+ *
+ * The function may return fewer bytes than requested when the data wraps
+ * around in the ring buffer; in this case only a contiguous part of the data
+ * is returned.
+ *
+ * The number of valid bytes returned is populated in *numptr; will always
+ * return at least 1 byte. max must not be 0 or greater than the number of
+ * bytes in the FIFO.
+ *
+ * Clients are responsible for checking the availability of requested data
+ * using fifo8_num_used().
+ *
+ * Returns: A pointer to peekable data.
+ */
+const uint8_t *fifo8_peek_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
+
 /**
  * fifo8_reset:
  * @fifo: FIFO to reset
diff --git a/util/fifo8.c b/util/fifo8.c
index 032e985440..e12477843e 100644
--- a/util/fifo8.c
+++ b/util/fifo8.c
@@ -66,7 +66,8 @@ uint8_t fifo8_pop(Fifo8 *fifo)
     return ret;
 }
 
-const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr)
+static const uint8_t *fifo8_peekpop_buf(Fifo8 *fifo, uint32_t max,
+                                        uint32_t *numptr, bool do_pop)
 {
     uint8_t *ret;
     uint32_t num;
@@ -74,15 +75,28 @@ const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr)
     assert(max > 0 && max <= fifo->num);
     num = MIN(fifo->capacity - fifo->head, max);
     ret = &fifo->data[fifo->head];
-    fifo->head += num;
-    fifo->head %= fifo->capacity;
-    fifo->num -= num;
+
+    if (do_pop) {
+        fifo->head += num;
+        fifo->head %= fifo->capacity;
+        fifo->num -= num;
+    }
     if (numptr) {
         *numptr = num;
     }
     return ret;
 }
 
+const uint8_t *fifo8_peek_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr)
+{
+    return fifo8_peekpop_buf(fifo, max, numptr, false);
+}
+
+const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr)
+{
+    return fifo8_peekpop_buf(fifo, max, numptr, true);
+}
+
 void fifo8_reset(Fifo8 *fifo)
 {
     fifo->num = 0;
-- 
2.41.0
