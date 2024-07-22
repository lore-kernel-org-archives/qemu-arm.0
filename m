Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2006102njc;
        Mon, 22 Jul 2024 09:08:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXjP/Gs6lCOMXjWxA9YsrIJCmYeSWCk8n2C7tMWPPCvSs+Bs1Cv9H2wdM1oXcHocbZe2EEnPR3uIr9MxAC8p4OH+PYwFWrE
X-Received: by 2002:a05:600c:1914:b0:426:629f:154e with SMTP id 5b1f17b1804b1-427daa60cf1mr47132135e9.30.1721664480880;
        Mon, 22 Jul 2024 09:08:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721664480; cv=none;
        d=google.com; s=arc-20160816;
        b=nS5MFed7FjV9KfKpdj+6pBCDzo+IlGPeHOR/Qa7332vjQ6sG9IUis9bvsetKOGlCXN
         LayfdYEtEJlNZn/V1EdTSDRJWTKJJ5/sdoP9G99uUJJdKVCUmQeJjO+gKWvXqQ4cBLhp
         TFqpIR4pMnsyo4IyQU3Fe5MQ3G7nmRMkazfyguYqUpV5lrGDEN+TfQ7TjC8u9Oqj7lyF
         73rFr2W8KHsntWNYOvxKCSvl/Z5pLZo51mMjxEC2dk1VErFnq9abmzwHm7iArrP/XYsH
         1D9iPrHNhG96OasI3U2jMKN360O+nCQBGpdmpL0+3dZdi4xe+1iTL4+twy43MfOR7Keg
         ieag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7xJItyCJvAqsvrHU7PZNhwclTP7/Jt4LLoVoT2duvA4=;
        fh=KYKKbtQhIKowtv9a9oAAs5UtTEHnYalGiwphFN0OduU=;
        b=e0QjG7fxLxBSPMK9n+byj5J5KyGf1tVBjqrDpGXdB0zHWYCCBjvdnVsnHMp9Rqf0n5
         b2qXDR1ZMfCtmoW5RN5IYoZUsHkWWwnH9/UXSBAh+IxK5BzifZiKPTm+9H/U2vz6ck+D
         z0wtqdZMd557O+PFLTF/PzCVmSqcLsfb5/kNBehFpkU6W94uufk78+5aWIWv2QTt/9ht
         q1C/gVXGI/ndlDPe/IuwKmZ/ridkILfAsP1dqxzNdtdJ447XNslIJTgbOgyHOWKDnutn
         qlIVUolBJpw0BZkmO0CkB7MYouUY95VaaFBHQZyMyK/9ct3C4KF+aCrdohrqbJaI1jjQ
         rlsw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LbM4IvSP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-427d7003916sor20964155e9.11.2024.07.22.09.08.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Jul 2024 09:08:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LbM4IvSP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721664480; x=1722269280; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xJItyCJvAqsvrHU7PZNhwclTP7/Jt4LLoVoT2duvA4=;
        b=LbM4IvSP9YQ/ELTX+WoWmaRuZPYWh+JoZbiSQpfnIY/Gs+IKAxXurs0vCA7nQ5HgGa
         o0/x2I4cq5bMeVlNZlM1h2AHXccS0nm8rwq7Y7lX2k65vN7NX6r3bNud+7VrwVuDr5xV
         EU9zeFZdlzQ+/pHBRWiech1/PUtsEkNzfIoh0QzIQ8M4s+71CayAlL/DDljJZ4NBdNAi
         5718/Gop64f3MjlRWSkZGahyOTKV5tl/A+I10845F2fzyDdnx6CYmA93SmknpCSAQEOS
         3jkgM3lmicjQxDODhOZP334C+SB5c6rfXH4W4lOMkXr7Oig8EtBHECIDPWMja8ZeRws3
         sPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721664480; x=1722269280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xJItyCJvAqsvrHU7PZNhwclTP7/Jt4LLoVoT2duvA4=;
        b=WZydfu4T6f2UoXBBdqWtGhSyESgPInYl3QcSN/IOsfERFWT7tQLWW4nsDigJJ8uWT7
         UBWk3xDtVjWy69DD4s+xSiqKvetAhyRRu7xgj5rqYNA/5D+KfsVuvw8hR5KzGl0Svh5y
         WHNZmtKpO/J5EbcROF/taI6FsqH3wc5FoNSg8Vm2pIpTe0KNpsBllwwysnjtc5zXIfb1
         2JvjKAWx2YbTi2r9Nv7cRJT5ZcVsPjB4h1HyLJnpeWTrRPAKtHJhw8sWsJCQ8QAuwAqf
         h+FiXUOGtpDM9QG+2pDDsXYZBwqdtP5Nkh1Qjn2ebMuLx1nQeBCVDxk39RKjWeFgAh3v
         x+3A==
X-Forwarded-Encrypted: i=1; AJvYcCWp7uB+SQQSYxKuTkrRviWDal8ioVhyh9frnS0LDMWNtuXErkUCQD1pEfqVOXxQla+qNqOBbxoxe8L9nZFw8bxxDgu29t5O
X-Gm-Message-State: AOJu0YwETlqsY44zuL5/cqKK5/pfBVuIf3ZYKy59y4QDhWpWoqCH3r2C
	CfMJV+lRdNlbzbHXiJfQwzYbehZ341WGDduxC7Tb4gsK1jS2qrloSAvUO3PA5jp8L+sQQny4MwL
	e0VE=
X-Google-Smtp-Source: AGHT+IFqArkBzzba1fN0z7xyB/r40W2L6JmFpYslhqOtrFoHGSCCadHo/zv77pYzxAPvfGOTsoCTqg==
X-Received: by 2002:a05:600c:3c9d:b0:426:6099:6eaa with SMTP id 5b1f17b1804b1-427daa61cddmr54009415e9.26.1721664480241;
        Mon, 22 Jul 2024 09:08:00 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (gen92-h02-176-184-20-254.dsl.sta.abo.bbox.fr. [176.184.20.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d68fa394sm132786425e9.3.2024.07.22.09.07.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jul 2024 09:07:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/7] util/fifo8: Fix style
Date: Mon, 22 Jul 2024 18:07:40 +0200
Message-ID: <20240722160745.67904-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240722160745.67904-1-philmd@linaro.org>
References: <20240722160745.67904-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Z8FEgGOy1Z6H

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/fifo8.h | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/include/qemu/fifo8.h b/include/qemu/fifo8.h
index c6295c6ff0..2692d6bfda 100644
--- a/include/qemu/fifo8.h
+++ b/include/qemu/fifo8.h
@@ -15,10 +15,9 @@ typedef struct {
  * @fifo: struct Fifo8 to initialise with new FIFO
  * @capacity: capacity of the newly created FIFO
  *
- * Create a FIFO of the specified size. Clients should call fifo8_destroy()
+ * Create a FIFO of the specified capacity. Clients should call fifo8_destroy()
  * when finished using the fifo. The FIFO is initially empty.
  */
-
 void fifo8_create(Fifo8 *fifo, uint32_t capacity);
 
 /**
@@ -26,9 +25,8 @@ void fifo8_create(Fifo8 *fifo, uint32_t capacity);
  * @fifo: FIFO to cleanup
  *
  * Cleanup a FIFO created with fifo8_create(). Frees memory created for FIFO
-  *storage. The FIFO is no longer usable after this has been called.
+ * storage. The FIFO is no longer usable after this has been called.
  */
-
 void fifo8_destroy(Fifo8 *fifo);
 
 /**
@@ -39,7 +37,6 @@ void fifo8_destroy(Fifo8 *fifo);
  * Push a data byte to the FIFO. Behaviour is undefined if the FIFO is full.
  * Clients are responsible for checking for fullness using fifo8_is_full().
  */
-
 void fifo8_push(Fifo8 *fifo, uint8_t data);
 
 /**
@@ -52,7 +49,6 @@ void fifo8_push(Fifo8 *fifo, uint8_t data);
  * Clients are responsible for checking the space left in the FIFO using
  * fifo8_num_free().
  */
-
 void fifo8_push_all(Fifo8 *fifo, const uint8_t *data, uint32_t num);
 
 /**
@@ -64,7 +60,6 @@ void fifo8_push_all(Fifo8 *fifo, const uint8_t *data, uint32_t num);
  *
  * Returns: The popped data byte.
  */
-
 uint8_t fifo8_pop(Fifo8 *fifo);
 
 /**
@@ -73,7 +68,7 @@ uint8_t fifo8_pop(Fifo8 *fifo);
  * @max: maximum number of bytes to pop
  * @numptr: pointer filled with number of bytes returned (can be NULL)
  *
- * Pop a number of elements from the FIFO up to a maximum of max. The buffer
+ * Pop a number of elements from the FIFO up to a maximum of @max. The buffer
  * containing the popped data is returned. This buffer points directly into
  * the FIFO backing store and data is invalidated once any of the fifo8_* APIs
  * are called on the FIFO.
@@ -82,7 +77,7 @@ uint8_t fifo8_pop(Fifo8 *fifo);
  * around in the ring buffer; in this case only a contiguous part of the data
  * is returned.
  *
- * The number of valid bytes returned is populated in *numptr; will always
+ * The number of valid bytes returned is populated in *@numptr; will always
  * return at least 1 byte. max must not be 0 or greater than the number of
  * bytes in the FIFO.
  *
@@ -99,7 +94,7 @@ const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
  * @max: maximum number of bytes to peek
  * @numptr: pointer filled with number of bytes returned (can be NULL)
  *
- * Peek into a number of elements from the FIFO up to a maximum of max.
+ * Peek into a number of elements from the FIFO up to a maximum of @max.
  * The buffer containing the data peeked into is returned. This buffer points
  * directly into the FIFO backing store. Since data is invalidated once any
  * of the fifo8_* APIs are called on the FIFO, it is the caller responsibility
@@ -109,7 +104,7 @@ const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
  * around in the ring buffer; in this case only a contiguous part of the data
  * is returned.
  *
- * The number of valid bytes returned is populated in *numptr; will always
+ * The number of valid bytes returned is populated in *@numptr; will always
  * return at least 1 byte. max must not be 0 or greater than the number of
  * bytes in the FIFO.
  *
@@ -126,7 +121,6 @@ const uint8_t *fifo8_peek_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
  *
  * Reset a FIFO. All data is discarded and the FIFO is emptied.
  */
-
 void fifo8_reset(Fifo8 *fifo);
 
 /**
@@ -137,7 +131,6 @@ void fifo8_reset(Fifo8 *fifo);
  *
  * Returns: True if the fifo is empty, false otherwise.
  */
-
 bool fifo8_is_empty(Fifo8 *fifo);
 
 /**
@@ -148,7 +141,6 @@ bool fifo8_is_empty(Fifo8 *fifo);
  *
  * Returns: True if the fifo is full, false otherwise.
  */
-
 bool fifo8_is_full(Fifo8 *fifo);
 
 /**
@@ -159,7 +151,6 @@ bool fifo8_is_full(Fifo8 *fifo);
  *
  * Returns: Number of free bytes.
  */
-
 uint32_t fifo8_num_free(Fifo8 *fifo);
 
 /**
@@ -170,7 +161,6 @@ uint32_t fifo8_num_free(Fifo8 *fifo);
  *
  * Returns: Number of used bytes.
  */
-
 uint32_t fifo8_num_used(Fifo8 *fifo);
 
 extern const VMStateDescription vmstate_fifo8;
-- 
2.41.0
