Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1538120ejc;
        Fri, 13 Oct 2023 07:11:42 -0700 (PDT)
X-Received: by 2002:a17:907:7ba5:b0:9bd:e017:370e with SMTP id ne37-20020a1709077ba500b009bde017370emr980956ejc.54.1697206302249;
        Fri, 13 Oct 2023 07:11:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697206302; cv=none;
        d=google.com; s=arc-20160816;
        b=il5iW1Iv58yz/7kA4pNaJedHEYo8c1blX7u/HKiM8EIC7v4hGQvNV3a62BgA09v1j3
         8FDlFlT8tWO3duSi4ua6aTO4NbeacglFLSPMuISGIPueDZ+QgSiBFYuvJZ/7VL+vnHKn
         GsMx0URhWMGt03PWUBqtugP3Fzyz8SUIhPfkvzVUx48kAzxdYlCy6iCuxrrsKSo6w1W2
         OPxvkP1IijoiZXRqMhUdurKjwwNfNuhMDTnAuF+qz4DOPG1LBGKxntnpbu77Qpsb8RpU
         9RcB8ACfOSp2T6Uj3OmNZvDF0c1ErwTd1aLPLQqzSS1HFi7cI4jb9cFtT434QbOsMZy8
         wTkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tAZvf0/lxzzRafQirPbdSKogeoxVhHxgjxTZIWfzoxQ=;
        fh=iNlBFRzKWcUVyIm7M2O0DMt8HyVCk33Ec3Usyd6Qlks=;
        b=UC8e3/OWC4OmuIlGNr3nSb515RrfMvCBFHT7xJPurH2CHqylJnhREM7JLbYMWua071
         z+j1nW5zHzZawp24TS6gwotD5v+6VznE8UgaEHJu79jezscbOxZTJ6l31TUMQX441yI8
         ZkvwwNDG/LHLW8RmfKHpFjS5qEAprwg6uRLy33MXxY1QBPXX7PhxGfEHvPkRaRmlDcaE
         TtlHNgWYUFbhAr/PLuDDnGQhgO+Cx4xGivgILzRBTI2Aoc6HwGmSmAMVeWKyBNCDqi9Q
         OvUN5dn42wY6M7SFjZHZv1OsIzMILCf839zjB+aqUcCRybSgJshEOEfknuSxTKMKGMfh
         bhhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=olqFLjRh;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 28-20020a170906029c00b009bda70b1059sor410306ejf.4.2023.10.13.07.11.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Oct 2023 07:11:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=olqFLjRh;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697206302; x=1697811102; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAZvf0/lxzzRafQirPbdSKogeoxVhHxgjxTZIWfzoxQ=;
        b=olqFLjRhVjbf3bQD8MMdjtQ7879xqExt4Bhy4aydZc8uW/XjKK8UvzrJEAD/5wDUE7
         EB72FKLK+DEDZ/kftgf+077RFJoR96IXiSCD2c+L75nKKohhaB7CoZU1qJ1g0RWCCBV9
         w+YHnFmziCt2ER8F+JxTbCSHF8t6h8rgSOrm0gZHUefSewXJN6hl8pDMwp3IHr7N7X0z
         NxePjUFByjJLw4LheS4Vvlpei/ruD8oaLv4iXf2xiIM3j0s7kdRHYVn5NdLiMIMnXPuE
         EKGbWPo+acfhm74RZ/FtJsUgCdciTPTnia9XUm+dDmIz8MASguYDQ6FSW5vQqZ018n/P
         QT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697206302; x=1697811102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tAZvf0/lxzzRafQirPbdSKogeoxVhHxgjxTZIWfzoxQ=;
        b=whX47lq/kNv5xcbbRlKsQ+50Vih4o/uLTsaaVWSGLI8v0jtecgOulP8ZHJVPoYQHiT
         YqfWsB8N278IKaR85mqbc7o5QOePkRVzQFAIMrb6dapmjKnow8cNBfuj45/BxuLL6/+6
         9kQsg6BVcajRItb15cwuzvKtVLC6z0wbhoOFdMDXbzehcQoAacYezCzpGYuE9L6lOvuB
         UpqO22SSNxMi+Dx1RIooVj5yxSweH4GFxqXShch18CDupQSP2xW1DsVhbkz15Q+D3RyR
         oP79aN5oV9T48ucwbm5g8V3lMr+vrMjds+itNx5AZFggaZMXw4o8bmxlh8taViOH1zCE
         uC2A==
X-Gm-Message-State: AOJu0Yx6R4KefEVIFuMP8OvMehcDrn/CYqCX/LAMtAkAyGI8GmUt3m5S
	RTZ05dZVgY28rOKMhDgEXCstmh1I
X-Google-Smtp-Source: AGHT+IFJJDm1ZNMb+AWEheX7wAt+AK5/jc+bjMFaO3F+B93zZuWHRb0ctollx7sOKyh2zrSr2fEpWQ==
X-Received: by 2002:a17:906:13:b0:9ae:1de:f4fb with SMTP id 19-20020a170906001300b009ae01def4fbmr22360044eja.46.1697206301756;
        Fri, 13 Oct 2023 07:11:41 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.172.118.168])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906059100b00992f2befcbcsm12380964ejn.180.2023.10.13.07.11.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Oct 2023 07:11:41 -0700 (PDT)
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
Subject: [PATCH v3 1/10] util/fifo8: Allow fifo8_pop_buf() to not populate popped length
Date: Fri, 13 Oct 2023 16:11:22 +0200
Message-ID: <20231013141131.1531-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013141131.1531-1-philmd@linaro.org>
References: <20231013141131.1531-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: V6yfbTFmPkF2

There might be cases where we know the number of bytes we can
pop from the FIFO, or we simply don't care how many bytes is
returned. Allow fifo8_pop_buf() to take a NULL numptr.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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
2.41.0
