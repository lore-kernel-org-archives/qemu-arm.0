Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp703368ejq;
        Thu, 9 Nov 2023 11:28:23 -0800 (PST)
X-Received: by 2002:a17:907:3f26:b0:9ae:4878:1172 with SMTP id hq38-20020a1709073f2600b009ae48781172mr5924568ejc.7.1699558103712;
        Thu, 09 Nov 2023 11:28:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699558103; cv=none;
        d=google.com; s=arc-20160816;
        b=tCyjp95sOeFen2t5jUMAVZAZCFh4wRq4vaQppaNG5hfVAPyqTCVPsL3NUdZthkDwXz
         +bDVVZ4nJEIjQzgIHNU/w2c0qTHUeZEyD4wLieQmIzMIHXww6NWpmE6/xhDTUKIjg6al
         /WCU4VQ998nVZLNVK9lDnMD43MCvDIy/n75w97xla2dyipBDcd/wTVWgZu9boilhGkHm
         lgFMkKsL9zAmxQIVamFrSwQtYfehN0Ii2/ZCawcqFmbRQtV/t3WmQ6KbGQGotWc0B18k
         a0GwEuYt/vKOtPRIWx+lQfrYEDGdiVywghDzZlg7U9qT2z9EmHJ/La/iNTPNtFVnTgFR
         z2SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tAZvf0/lxzzRafQirPbdSKogeoxVhHxgjxTZIWfzoxQ=;
        fh=GQxR5x0bbpeaxpQRj0Ss2iF9lxOTaG+uCQYEI2XZ3x0=;
        b=Ueel0wvBfD2hHtpj1ViyQeHgmUq0Ru6s44GmLiKG5EyVdI75vxC4Ifv2l+ja9O5v6L
         Z+6Uup/w+oiQQsIxUamPHqOuoJJAc+yITgvJL1XgpXIh9Ow2kNdKeVs8qRGGfAEvWS5E
         nXpg1ECDAvOUBp6/3vXxLrHXIIsmKosronWSTtkXD1IgXGIS2Fivvqx14fXYsbbRUoQ+
         xRU76PB21Yb4KRb2RcJpx5ehDxQFVUGadd453LxayeAEYmEnD1IpxRIIg9NZyKwdpSyq
         Qidcm9kUsPdSfsMdlvUUr1eFy1r+wYz2W404GSDU1wpxhPUXAl3OR+GFu9O7fEKtgcd9
         up/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tmEA1vYB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 11-20020a170906024b00b009b927358aa2sor3155767ejl.13.2023.11.09.11.28.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 Nov 2023 11:28:23 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tmEA1vYB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699558103; x=1700162903; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAZvf0/lxzzRafQirPbdSKogeoxVhHxgjxTZIWfzoxQ=;
        b=tmEA1vYBQvqhrUZ7VxMTmIFSRFZNiMZew64Q3hHR0mgomKI/L7k6HmnasiWXIVyyWm
         xV/O4T/EgEA8GG/ElPESS09zldXUaYTQRH1T3+q2gAYWXPj+CkTLqOP8m8QyA7Ky5p4/
         w45+YVC2AhSPtiHgMulsKVi87f8BhbVBNcLvimhg8mdZCnfNd6cujSJPvERfn67G/FlN
         H/Q7Tt9W8HIUiP6RBEdt3lfirx8QVlurqYpwSH62ZgUOrz3Iwe4qA6GB343Bkz7OuC2m
         Li5lUCCTbMCIci4X6eEdxEOtcR34lvO9h5G9IdFlK0Z5K4inh3F6vu0kP9zPAB62QAw2
         0fIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699558103; x=1700162903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tAZvf0/lxzzRafQirPbdSKogeoxVhHxgjxTZIWfzoxQ=;
        b=GycmUyzknkfHIjfCtEFET6bHe1PpQfQqF9EqQ1bn+ZFV9nIwc3OBU7mAOyP6YpifFG
         VvsgvUCShwsZ2Y6ve63vXd6a6rrU44hXkvN6SOsbuLl3NZvO6FDh7qBFTrgBUgOAWnNJ
         AJQjw7VVXV1dauO63AscusqDK7zgRcb0k9iXnH17YM0b5whYZgHeRiii1N+X3Pc3Opf6
         QMKlFGbG7UJKNXuOwrncP0DM1EuiaYTzFSLuSTNmYnkF4teMx3bD0ZMRKMa1joYEzqd2
         LqoMrpDLgoS7BVwFYcx134XN6V7s89hk9XahiLFJgR7kgHMg8wTyXfLR57QNuEyZd8MB
         KcCA==
X-Gm-Message-State: AOJu0YwQguCiSYPIbdJdbJc2cF6p5uHZgRbMa//En99a4gNl885JiXIb
	heSUdMv2TAreDkGWe1SAZSvAK+B1A54M6hUZzjkNWkuI
X-Google-Smtp-Source: AGHT+IGpPcJ3Xf7zLqTm3djhkxKHFhbHSxJ+qioykBUXmykUoXU8maRNfXen/gfl7USeEY2cT3/uDA==
X-Received: by 2002:a50:8d0b:0:b0:53e:37d1:a31f with SMTP id s11-20020a508d0b000000b0053e37d1a31fmr5226900eds.28.1699558103375;
        Thu, 09 Nov 2023 11:28:23 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.199.161])
        by smtp.gmail.com with ESMTPSA id z3-20020a5096c3000000b00544f8271b5fsm189937eda.8.2023.11.09.11.28.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Nov 2023 11:28:23 -0800 (PST)
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
Subject: [PATCH-for-8.2 v4 01/10] util/fifo8: Allow fifo8_pop_buf() to not populate popped length
Date: Thu,  9 Nov 2023 20:28:05 +0100
Message-ID: <20231109192814.95977-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109192814.95977-1-philmd@linaro.org>
References: <20231109192814.95977-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: nOV8AwNnMjHS

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
