Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1286507ejb;
        Mon, 22 May 2023 08:31:58 -0700 (PDT)
X-Received: by 2002:a7b:ce15:0:b0:3f5:ff24:27de with SMTP id m21-20020a7bce15000000b003f5ff2427demr4698170wmc.32.1684769518670;
        Mon, 22 May 2023 08:31:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684769518; cv=none;
        d=google.com; s=arc-20160816;
        b=xuR6W2SH6nVMAGLburIa9N/1eWHYCBhxt+x0xW0ZDs0b+K4PdvHfXfmEzgVXnf4U5R
         g59bh2sHJ7qjS7JluJsaApK6Hfb7vfxLtuBdIZ+KvkuyyOKh8XMMIT9gtEhW6bQYrTpu
         EBfqEJLQOFDmUxjrHeEoK5DTjiLSl/4Bf6UWnUJizmJGHcJVDmY+s+2VR6VAGJ3lv/y+
         n2lKI2exTnYY0k4pGv/fvlZf4y9xP0urfhX66gPlJy3PIrlK9lYLKCEmUrIr+0yJxgXj
         mn+z50aoNQpSeYTGpQKLBbW0JJIF5Icgl7bzdCAflP6eD4FvywF3aIb7uKaHgCWiBIXm
         Q0sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/HFQ4TQ858TQsjYOnqPZRPL59qIZV5loVHcO3ItffVk=;
        b=fAum2Zw8nZzreaL5Im3DxBoRr+B6XMfD5HzL10tg6SLFLYvMgsdGEKoHsmZMDMDZ7r
         H2k5CAt2h0XnjxddiM0MR3z7lgnh9DNeY6/7o044Wc2r3aBUKZJTL7+8z5nv6p/NqfJr
         JITLbHCL6bqAJuKZAlLP4HOo+0ybf9tB3k+jdT/DJxt3/qOowtvFvRhKaae+HNNq8eDy
         nyb3TEPDElCggi46NBiVwxglRHjsa1tYXpVW7/pQGse8PGpGM+V4eAoNZHhJ8+NGvtYj
         4vgK9CZAZIzaesbFEZsAlfGJwpNMPwOW0LQBtO1e1co2eDJLPfqL7rMYKjf9yUWuyowy
         J9Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JxZXjjck;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y23-20020a05600c365700b003f601b711f9sor856153wmq.3.2023.05.22.08.31.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 May 2023 08:31:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JxZXjjck;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684769518; x=1687361518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HFQ4TQ858TQsjYOnqPZRPL59qIZV5loVHcO3ItffVk=;
        b=JxZXjjckkKkgHydUr4Lviu/5YMUz8RRXJdofqyzRla9aFSCih3kMeEDlzc2dZd/rWC
         FxQ9L2UweED6uJXGa0Y81/Z4T6f6Bz9FKWyYoUC5JttfiFuZhwTETVkLqQ2tit4YqZi+
         vFmuLxNql1IRFauW+5HqdfsALBV4Fz44tHok7cwNt7ZL0yYKGBsCRSp7Vz056zNr3vDp
         ORncD5wf0HsEv+t3uB5Y2g2pFu3lDF8bmNO2c38k4VqqANiwfKywKHHHzQsXFcG+PRK/
         Eo7VTZypnqH16KVBJPLkalAdIbuBHex0TrcdF5lc4QeYq2+jB8ewG+lNUujRE3xNcQe2
         lDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684769518; x=1687361518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/HFQ4TQ858TQsjYOnqPZRPL59qIZV5loVHcO3ItffVk=;
        b=SzxeVXRwLUkeIzh5D6HeiyCM7/MnoNdy8t0VPIno/S98GYH3mpfYdxrzau8l4YPW+X
         CoVGG+NmKBYwTagbx/SHz1aIDegaAuEEv6u9rUcbKS9t49+8XFXE3MJpjzdPSPhB3rvP
         vYq9qwTQKRAxSOpAdIj2/r9wffgTZLj5DIxcHR3ASirYzfQT6HkjS2hTAd0gvE8ooktJ
         05Drcc/rsHbJEhFi/EUSDvL0wd4deXCjQvNb/DLAGQlNhTEQSbxjRqMR2tIrE6StODzW
         KE0qKSDqTuXZ3mB/3uRe5qxRtarJnUakXNrCMIJVMk3rvGHp4+Gl6RBGEGcjaQz20AS0
         KypA==
X-Gm-Message-State: AC+VfDwPi1bR23hwycSEnfphA5Hqc3lTc6duY8jiwzgbcJAtIhZUhLuJ
	F18jqi90FdBHeg76O07fjtc99pJB
X-Google-Smtp-Source: ACHHUZ7/Wq1BH2VOBPcnbW2UzMD8xKd0wdpFsluJ0Pacj+5WeRF3tY8x34tlDTeMgoIOek98Ynit0w==
X-Received: by 2002:a7b:c046:0:b0:3f6:1c0:aa7a with SMTP id u6-20020a7bc046000000b003f601c0aa7amr3844982wmc.29.1684769518388;
        Mon, 22 May 2023 08:31:58 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.176.153.164])
        by smtp.gmail.com with ESMTPSA id z20-20020a7bc7d4000000b003f4ecf1fcbcsm11862770wmk.22.2023.05.22.08.31.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 May 2023 08:31:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 02/12] util/fifo8: Allow fifo8_pop_buf() to not populate popped length
Date: Mon, 22 May 2023 17:31:34 +0200
Message-Id: <20230522153144.30610-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230522153144.30610-1-philmd@linaro.org>
References: <20230522153144.30610-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /INqW7YY2O2q

There might be cases where we know the number of bytes we can
pop from the FIFO, or we simply don't care how many bytes is
returned. Allow fifo8_pop_buf() to take a NULL numptr.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/fifo8.h | 10 +++++-----
 util/fifo8.c         | 12 ++++++++----
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/include/qemu/fifo8.h b/include/qemu/fifo8.h
index 16be02f361..d0d02bc73d 100644
--- a/include/qemu/fifo8.h
+++ b/include/qemu/fifo8.h
@@ -71,7 +71,7 @@ uint8_t fifo8_pop(Fifo8 *fifo);
  * fifo8_pop_buf:
  * @fifo: FIFO to pop from
  * @max: maximum number of bytes to pop
- * @num: actual number of returned bytes
+ * @numptr: pointer filled with number of bytes returned (can be NULL)
  *
  * Pop a number of elements from the FIFO up to a maximum of max. The buffer
  * containing the popped data is returned. This buffer points directly into
@@ -82,16 +82,16 @@ uint8_t fifo8_pop(Fifo8 *fifo);
  * around in the ring buffer; in this case only a contiguous part of the data
  * is returned.
  *
- * The number of valid bytes returned is populated in *num; will always return
- * at least 1 byte. max must not be 0 or greater than the number of bytes in
- * the FIFO.
+ * The number of valid bytes returned is populated in *numptr; will always
+ * return at least 1 byte. max must not be 0 or greater than the number of
+ * bytes in the FIFO.
  *
  * Clients are responsible for checking the availability of requested data
  * using fifo8_num_used().
  *
  * Returns: A pointer to popped data.
  */
-const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *num);
+const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
 
 /**
  * fifo8_reset:
diff --git a/util/fifo8.c b/util/fifo8.c
index d4d1c135e0..032e985440 100644
--- a/util/fifo8.c
+++ b/util/fifo8.c
@@ -66,16 +66,20 @@ uint8_t fifo8_pop(Fifo8 *fifo)
     return ret;
 }
 
-const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *num)
+const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr)
 {
     uint8_t *ret;
+    uint32_t num;
 
     assert(max > 0 && max <= fifo->num);
-    *num = MIN(fifo->capacity - fifo->head, max);
+    num = MIN(fifo->capacity - fifo->head, max);
     ret = &fifo->data[fifo->head];
-    fifo->head += *num;
+    fifo->head += num;
     fifo->head %= fifo->capacity;
-    fifo->num -= *num;
+    fifo->num -= num;
+    if (numptr) {
+        *numptr = num;
+    }
     return ret;
 }
 
-- 
2.38.1
