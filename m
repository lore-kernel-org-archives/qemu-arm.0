Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp986320njb;
        Mon, 5 Aug 2024 13:17:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUDQS9dUp2OH2DC6bDDSJK6t6wJYOfAXB5QqoMLb+tmJ11dtt2o3t5w52NRBW1oScXbPTZ5QRLPpX/3Kfrn8pAWUR5jiY/T
X-Received: by 2002:a17:90b:4b05:b0:2c9:69cc:3a6f with SMTP id 98e67ed59e1d1-2cff952d009mr11610253a91.31.1722889042559;
        Mon, 05 Aug 2024 13:17:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722889042; cv=none;
        d=google.com; s=arc-20160816;
        b=Vgyb/g7am9kb2x/CYFVLhZRqw3coK4O6HQc+ZeNwfPJBMMupDJmpTtRn/138kHw1nx
         NzC0JBIIKBpeg/H5x7aPD2afYu5yAeLhOaPgOWauGuzJA6YlAYIiiX4yaLajLmPfA+Wi
         aBvAiefX+Jk8GQ4fROEk4x34gE/hIy4q7i+dRZMcv68EkAr1eFZHosZyUD2HU5STMUAn
         /tGC15HVg6B4TMuWj8O/1j/R540zhYcjmFMt2M6nHyrWBbWdCvcrV1Ynkm6v/LMNSpiG
         SR3LV3Mh12ffjNKurubqx0yZMO00X97UqenGqeu8xuXf12gpCFwmzhBwx5Ovt7RmjizO
         rHAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=v+XZ2Rl5k5if0oOWfRcW5SGcn2wm2BUtZIoAAUrM80c=;
        fh=cq5khj4SjeAdae0OYw6UW4YhEDVHBepmzNZalWLMKHw=;
        b=jjDJXAwfbs0dH9FLQ/8FJFoFqKJzey0Ho3ii1U+yfDIXYQrAb78Hk+Vq09gm0EyhUV
         NEKzrXwwlRmQNO3k3O7Rjstn3oIbNM4nnszpilJ7aR3sqKkbSyywpxLGMPxOmJ/Q4be/
         UyZFqolYbTCO6VVRLWwtYzDfvS7PYNaAuI8yzHdQRcb+ThS+NCHsXWuARiZ1OL3uzMt0
         t1UEZTgaXb1Mqe+z49EJHY4QYwsF/uY7w/BI/L6Xqszeq9vHh8VhLYZIjYBPSQhEhHPr
         xD6O0xAwQdqeuFtHXXTAWIr36hOofMMTx/+W6b5pXm5HX1F2RwcABeRBbvXVAS+OAGhe
         ovaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=4ju0HLeL;
       spf=pass (google.com: domain of 3ujoxzgukc7kszuhofnnfkd.bnlzkdw.admmddkhmzqn.nqf@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3UjOxZgUKC7ksZuhofnnfkd.bnlZkdw.admmddkhmZqn.nqf@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <3UjOxZgUKC7ksZuhofnnfkd.bnlZkdw.admmddkhmZqn.nqf@flex--tavip.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2cffbee5e8bsor6168513a91.8.2024.08.05.13.17.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2024 13:17:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3ujoxzgukc7kszuhofnnfkd.bnlzkdw.admmddkhmzqn.nqf@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=4ju0HLeL;
       spf=pass (google.com: domain of 3ujoxzgukc7kszuhofnnfkd.bnlzkdw.admmddkhmzqn.nqf@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3UjOxZgUKC7ksZuhofnnfkd.bnlZkdw.admmddkhmZqn.nqf@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722889042; x=1723493842; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v+XZ2Rl5k5if0oOWfRcW5SGcn2wm2BUtZIoAAUrM80c=;
        b=4ju0HLeLQN1kdqDCDBacaPH/Xh5hQeeXnkNGhhP9fWVAeo34ibDZYB2xbpMsD5p6nB
         t6kF7MBxS3p/IJ7FiZQ5iEbmPyTTH0IXuSEC3Q5oa9eZgw8JXbl59+MFqAvohSTrVK8B
         PdwEDKSJMAY+9r9qp/Ew8TWAEQ/yKIFxA2+G4Cgkz5T7ZJxlIVh6hSlX/LG+fcX+W1kx
         yX/ulJCbYv2rMtcgYVy1V2R4Fgrt8vojk5tSLXCGjRymQLFV00rYNnAKuLYTMLCRYm35
         lMaJIUl1sPS0cAuKp0pvNRDZEbcIONlPZqlKA9+aCaRYupJP/HzIUaxfOwV79qHtq1Al
         +c9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722889042; x=1723493842;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v+XZ2Rl5k5if0oOWfRcW5SGcn2wm2BUtZIoAAUrM80c=;
        b=Lt+nDQtZa+4X30UhscmjUiusX91yA7aysX+m2pglu+8atqfi+jWqhjusRpzvUN8btk
         VruHjU2O+ZvsnS4jbbsypP2+S3eD+8JWo2gnaWDQKx6dKDIcmRleClfX4DXW1+m+7vIM
         spsYmaTUfDjM9BMM/X4XwTogRHXBANF/vwpVbhmZGn5WTU2B2bCIgASgvg8vvZXtKwPu
         rKTYsMFRhqMsOTn1rBY/1qI48T6ilaMLrqDX2Ax+/vhMMwLpbpRpp7RMncdI9Mwubuec
         WD07CCytKhs676ODc6/Vf0tUU8pPiOeROj2hMZBRU793UM6rGBh7mOdwRDUJ0WjpX/L0
         B+eg==
X-Forwarded-Encrypted: i=1; AJvYcCUiGdcHCG8dPKPQ77wUywHSZggJ+a9NcAcS8Vs+LZm6ZmqBWSFMTviGt1c1tvn0c285fCmYr5VzT/0NDJsTh8Uy5dM/UgL+
X-Gm-Message-State: AOJu0Yz1JPoCX4CaTyL3AlHccOMrBQd+Kk2utltazPEhKDNRk4wlX0r/
	jb/mF3HVaBOws2h80IC8ykVQo6KbFwn5NaPD9dHkanFQ/stFKdT4/uVOm9QaU5faZWpSGrkyrA=
	=
X-Google-Smtp-Source: AGHT+IGSw77EguaF6TzFUl9hSn+D85XT29tsuj2jEdezd7+A3i+GB6qt6WaOoxbln6W2tkN/LgpP3KwjKQ==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a17:90b:3cc7:b0:2c9:81c6:b0ee with SMTP id
 98e67ed59e1d1-2cff9520a11mr181407a91.4.1722889042082; Mon, 05 Aug 2024
 13:17:22 -0700 (PDT)
Date: Mon,  5 Aug 2024 13:16:56 -0700
In-Reply-To: <20240805201719.2345596-1-tavip@google.com>
Mime-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240805201719.2345596-2-tavip@google.com>
Subject: [RFC PATCH 01/23] fifo32: add peek function
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
	alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: ErfSfdXAfO6g

Add fifo32_peek() that returns the first element from the queue
without popping it.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 include/qemu/fifo32.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/qemu/fifo32.h b/include/qemu/fifo32.h
index 4e9fd1b5ef..c9befc47c8 100644
--- a/include/qemu/fifo32.h
+++ b/include/qemu/fifo32.h
@@ -140,6 +140,35 @@ static inline uint32_t fifo32_pop(Fifo32 *fifo)
     return ret;
 }
 
+/**
+ * fifo32_peek:
+ * @fifo: fifo to peek at
+ *
+ * Returns the value from the FIFO's head without poping it. Behaviour
+ * is undefined if the FIFO is empty. Clients are responsible for
+ * checking for emptiness using fifo32_is_empty().
+ *
+ * Returns: the value from the FIFO's head
+ */
+
+static inline uint32_t fifo32_peek(Fifo32 *fifo)
+{
+    uint32_t ret = 0, num;
+    const uint8_t *buf;
+    int i;
+
+    buf = fifo8_peek_buf(&fifo->fifo, 4, &num);
+    if (num != 4) {
+        return ret;
+    }
+
+    for (i = 0; i < sizeof(uint32_t); i++) {
+        ret |= buf[i] << (i * 8);
+    }
+
+    return ret;
+}
+
 /**
  * There is no fifo32_pop_buf() because the data is not stored in the buffer
  * as a set of native-order words.
-- 
2.46.0.rc2.264.g509ed76dc8-goog
