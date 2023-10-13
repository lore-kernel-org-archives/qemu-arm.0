Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1538178ejc;
        Fri, 13 Oct 2023 07:11:48 -0700 (PDT)
X-Received: by 2002:a17:906:c5:b0:99c:b0c9:4ec0 with SMTP id 5-20020a17090600c500b0099cb0c94ec0mr22326585eji.30.1697206308301;
        Fri, 13 Oct 2023 07:11:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697206308; cv=none;
        d=google.com; s=arc-20160816;
        b=i0jCLV+rI7zb/I17ledtBChszsJlrCXJxV3BgBpqUz6DZE2ZWXpCnufVrnHj75SvJ3
         bDIGZQVGD/zLNFehkj+1NOsFiExn5y68VborI9AEqDfO6i98/mCnZtUKUDTCS2CIVa6q
         IZr9aNiAEy4nJbApsD82/2KFmbMMSrFzKcUCfTHPG8cyiNqyY+jOkl2IbT8MXPkLiBcz
         wamX1zaSHChV0mPMrag1o5r+yRt4l700kzGjSYypud/DV6GiSTm613jiS84E783BGuHi
         0MqMoxQpxD3ibRRmrXTLV7rb2slqZW3JH+5Kq/7Nhdcv9536Prr58cjUbVidi1xEya4x
         DsWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=V9tZVJmu9kzGvsLFPu4hpPnpsYV8GknZmAK3SQkWufw=;
        fh=iNlBFRzKWcUVyIm7M2O0DMt8HyVCk33Ec3Usyd6Qlks=;
        b=srWYLl6seCE4lqQs9y2sx5xIMybttN4kf+SYU+aOjVNSKLAHgyH7z1f93pbP75vDjd
         pQrS5eDR1pe55Pnot86AvIz1RyBlp+YfhDVOeria6oU0tlLPR4lwcindlKz8Bzm+mDai
         7+oRGhd6EjuxadLpXWbh+SBjzOE4GjIMFF3Civ+bnjBfycKfiQVa2ZxLdXNo/Q0dYkL4
         kmDxcFyCe1fIRexRXkmL/8Xflrv7+yVhrRiLPi1UOkVKc5P8xB13p/IDAPleiLOOPt/6
         1LYArBC7UMDeXXzNcLN7Qdjb9lBi0l2CiYETLPbZjafQajQHcOt4rVSiQXBfBpaYnN4K
         bQww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lWhEQS3t;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e1-20020a170906844100b009b2b2ad2a82sor775824ejy.17.2023.10.13.07.11.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Oct 2023 07:11:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lWhEQS3t;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697206308; x=1697811108; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9tZVJmu9kzGvsLFPu4hpPnpsYV8GknZmAK3SQkWufw=;
        b=lWhEQS3tgRBL1tfpJlMAoCRAwMU5OXXoeuZWg6xhhdyeLQaTYrGAm79JJ6+74bwwah
         hKs0HnaG91tCRxIEFZdPj0zgEYaxolsAY5KkxMi6XxfX5m33IMhEDhm9CagyAR41XShm
         SIgUvIMaLxwKAGcSPeN8VZEzy1l/UlChxoci99nujZqN69ZXPU2U77pMZBhaMOOzJ84J
         klToGVOQJWo9Q/uws7tg8xTztT1pxKCjRT8uwCz/kNmdeNB1gTL//YNVuTXS7l7rIqjb
         5YKyqlN5w2LXAqSPi9WozsUKrPiseT7ZmYGQSu2zRUwV2Qkt4oZr3NXSZFshoww9VCTs
         u3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697206308; x=1697811108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9tZVJmu9kzGvsLFPu4hpPnpsYV8GknZmAK3SQkWufw=;
        b=cHYp68GfO9B9KDpimUzmct+eo2l6uwMZi3kUovx/p5HAuXQbRFkt84wWHmPgjOJWmE
         +VHjuAQpw2cGnWc16TNAfi0xXYEkDcRITUdth2ivX18XExksKKFm9Uwe+Lyklr9hjivK
         ETm/NFvtN52jCOR/P4Ggze/kKfJZmTLkTeHcjtKGEfptJ1FK4VloXOpJc0QTt2buWKqs
         ++LV3Y9Icxsfcu0IQAH9PmyO4lP9GH52TTkPGw8AK4N0n2xUcRAFJ6+OOSa6e4M64W/y
         4aRSSv2YfVQoIwnH6XFE6JV7WD2a7bY4PpvL4rVX9E4yf3HxAQWChCOqnzvHhL86UWCp
         /bdg==
X-Gm-Message-State: AOJu0YwwOvs3NdAeFO5bXdSNhpfv+Sq7Pj5p7b3vEW250ZE6lFgd3sL0
	T/fKmkWMwJ2Tkv3yzsFAqHyFLZxE
X-Google-Smtp-Source: AGHT+IEWxZGoNekV1CrxCAV+maMmGBnOjA50M6xT9ODRIsrhs0cUOEe9/9l9tGca1COb/51yFRqMvw==
X-Received: by 2002:a17:907:2e19:b0:9b2:c2a9:357a with SMTP id ig25-20020a1709072e1900b009b2c2a9357amr23260747ejc.68.1697206308015;
        Fri, 13 Oct 2023 07:11:48 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.172.118.168])
        by smtp.gmail.com with ESMTPSA id m14-20020a1709066d0e00b00991d54db2acsm12404171ejr.44.2023.10.13.07.11.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Oct 2023 07:11:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Gavin Shan <gshan@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Francisco Iglesias <frasse.iglesias@gmail.com>
Subject: [PATCH v3 2/10] util/fifo8: Introduce fifo8_peek_buf()
Date: Fri, 13 Oct 2023 16:11:23 +0200
Message-ID: <20231013141131.1531-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013141131.1531-1-philmd@linaro.org>
References: <20231013141131.1531-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: IwqZRGb3S/sT

To be able to peek at FIFO content without popping it,
introduce the fifo8_peek_buf() method by factoring
common content from fifo8_pop_buf().

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
