Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1286579ejb;
        Mon, 22 May 2023 08:32:04 -0700 (PDT)
X-Received: by 2002:a7b:c3d0:0:b0:3f4:2cc7:aac5 with SMTP id t16-20020a7bc3d0000000b003f42cc7aac5mr7046716wmj.9.1684769524818;
        Mon, 22 May 2023 08:32:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684769524; cv=none;
        d=google.com; s=arc-20160816;
        b=s6TG6pMPE9IaNjj1lqNawcHzElN4sKeqW2MBi4AesqlSlHE1wpmtJI/UOx1WzMdyfz
         f0LLltjscwa9QXZtMVtG/9PhyOjTBR1UjsnNH4lqTTXYngQlVvxulwN/Kc6yvmxSy5Db
         cZocOT/Gj+oEDdQe9RhtWmFdU8Cx2DqZLpf1tWL4lDWK5sTO7jTUT3g/Cexh2DIP1rLR
         3tKUn72LuZzHAaXaKU0KsPTWpwqtldaOIAj4Jq0akanm3vwutA4ZuNFIx8YaXdij8IIz
         JKoWCc30mSuS5q9KuM1Rhq0C/as0Z7sTuTa6ibEUt2if0kxWjxnU3dsvkug8t2vCMuaa
         RmbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=D/v69wjcgQjzqhC98DKwcbYpCW+hDbd/3U2ovkdSDfw=;
        b=EOGVcDB4L+7RN3gDDxERZ1p9A4tXczDPPQ55GXZ7L9G48BX3Buq+KuYrJNcf6Poc6M
         r39RIL+Unx1UnWXLtsZuGdG2aHPM3/GHCBX0JzwHMzdlAblVKgAxcIwfnMzzjkPF9BVf
         DqrRG+hG1aEFesRNUuew8o/VTRot2/Ki7t11KNSxGFN2ajyFX//5F3UM/VKcczg6refZ
         liqKvKqjpyNMb+mTVAtwLh4iIi7Y9DHg/ogECp0swJjA27mSbkZ0qZWHwaqRV+Q93pNs
         8LN2ob+TGt26ohVRUlu/z40fC/ZEbQqsSrew9uA17XOTWHVH8sBu39XFfROC3yvsQFn9
         7SkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GcIeHWq7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s23-20020a1cf217000000b003f5d63ba7c4sor1153144wmc.9.2023.05.22.08.32.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 May 2023 08:32:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GcIeHWq7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684769524; x=1687361524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/v69wjcgQjzqhC98DKwcbYpCW+hDbd/3U2ovkdSDfw=;
        b=GcIeHWq7ho6Wb3vxdbkOS5rHBfm+Q2V7gO4V4OinnFC6S0gSjLClHkroxEPcEyBaiu
         7MN6KFbKVsg6IS2/mEYBDXvvWGb5hFPXSOYD8BTCxDIs2O3v0Z2hXbxqz/04U0D2XO81
         zfmxZ1tI2Kgjtvi4WPDOOwZx+MhlPIzOCmN//oGJgNdRbHG98G30XTWgB4dArEtQHTEs
         yPZoNvsSaATl7Vpc/dk4BOvEEwPVxp1b6X2mlxkv8eqLchb+TTC1dtkBsUF2CWhh1B0C
         AXudY0VYO+0Jz0PNoSG0gV0Y410OlUG7MEioweVbxP+FhwaiBT/CsVCVxoCnsld6T4Ej
         X1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684769524; x=1687361524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/v69wjcgQjzqhC98DKwcbYpCW+hDbd/3U2ovkdSDfw=;
        b=AEQYiZLCVxUErjCkoVQ9iKQexxhu0rj5lru2aLcvNEl7g/+22yMdYZCy3Vu0ZPqDpP
         i6c2YNUK4ufAFwM+SiPn1ERm0HSxqSStk/EVpIbbf2qUTfmSqIz3QfSJ+smYV/GOmW6b
         MxCX9sxLW2JHvf77SENNr9bqHP7xC8f3luDbJiZ5E812Fnujg8sRVsSLw+kfBei19ZVf
         y4dV0T7ifRRd6EclvM6wC2n00MdAvrwIUhWWJmKcYScv08t5p1H++sTZ+xJoEUPn27hj
         1iGTix3KCzHlrq6oSHjX3z9MHtxxMNshNV8AVsi4rSEFBvmcrR4zR016deNpC6sVOsOk
         6kGg==
X-Gm-Message-State: AC+VfDzLu/y9BcKhwPMWblmUqAgnoCxD103RCzM/fHsl/YCu2WYJ7zDn
	GUCY7n8VfSwuRZ/zGAQtmKiOd8Zn
X-Google-Smtp-Source: ACHHUZ4DB49NeA6IuP4gNB8rRn3/y8nnkvLLXF4r34C3aepgjSKB030tIOAZ6MWs9ndDwosRDKjDMA==
X-Received: by 2002:a1c:f70e:0:b0:3f4:2b1a:553b with SMTP id v14-20020a1cf70e000000b003f42b1a553bmr7727352wmh.28.1684769524506;
        Mon, 22 May 2023 08:32:04 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.176.153.164])
        by smtp.gmail.com with ESMTPSA id o3-20020a1c7503000000b003f09d7b6e20sm8747145wmc.2.2023.05.22.08.32.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 May 2023 08:32:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/12] util/fifo8: Introduce fifo8_peek_buf()
Date: Mon, 22 May 2023 17:31:35 +0200
Message-Id: <20230522153144.30610-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230522153144.30610-1-philmd@linaro.org>
References: <20230522153144.30610-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zaYl9YzbVBU5

To be able to poke at FIFO content without popping it,
introduce the fifo8_peek_buf() method by factoring
common content from fifo8_pop_buf().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/fifo8.h | 26 ++++++++++++++++++++++++++
 util/fifo8.c         | 22 ++++++++++++++++++----
 2 files changed, 44 insertions(+), 4 deletions(-)

diff --git a/include/qemu/fifo8.h b/include/qemu/fifo8.h
index d0d02bc73d..7acf6d1347 100644
--- a/include/qemu/fifo8.h
+++ b/include/qemu/fifo8.h
@@ -93,6 +93,32 @@ uint8_t fifo8_pop(Fifo8 *fifo);
  */
 const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
 
+/**
+ * fifo8_peek_buf:
+ * @fifo: FIFO to poke from
+ * @max: maximum number of bytes to pop
+ * @numptr: pointer filled with number of bytes returned (can be NULL)
+ *
+ * Pop a number of elements from the FIFO up to a maximum of max. The buffer
+ * containing the popped data is returned. This buffer points directly into
+ * the FIFO backing store and data is invalidated once any of the fifo8_* APIs
+ * are called on the FIFO.
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
2.38.1
