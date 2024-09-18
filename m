Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp977878njg;
        Wed, 18 Sep 2024 12:23:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJ3waUBjUQa3DH35TYDeEplXqASNExzeDtMLbyGONU/Vl4sPqjELuzMz/4uqqzq2eaAI737J14aS/JLA==@linaro.org
X-Google-Smtp-Source: AGHT+IFV8ADgE13PdDlM0BiBKzSiuUMDoKEHnrcTha7zgjZF2XIjOS1b3k18AsmBOxTunDEdbo3q
X-Received: by 2002:a05:620a:3915:b0:7a1:c40c:b1f1 with SMTP id af79cd13be357-7ab30dc6fa4mr4193866185a.58.1726687415342;
        Wed, 18 Sep 2024 12:23:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726687415; cv=none;
        d=google.com; s=arc-20240605;
        b=TgA0R94sAOvzBvqxsVbb60RP3WzjHooC2dHjdIiCW6VLc9RZauVf5cznj6EqxMIk8b
         T8nK8caebcqc1hNC/O49H4WFASeMU6JdW3qzWV+j15nFZZbgn/+PhrrTLRGVDsMflGjL
         UDvWPgGNbRq0wBPHK32ypR8n7RmJrZy4cfLCKJSLeYO5Mj0OTDPnKUQ/G0zlxiXCZxfe
         UCaZ2P7sKLYHcpxrdeOtXJgVZDHiacaqWmY68npu6F53tkSeMvY7eTiLcDh+z5DFhBO2
         1QiBZo9IdNr6mWlYg2WmHOsdgmogbeQKn/d6s5Mgmc9hs7PZC6O1JmCZMk/21Q23zJS3
         UKyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=0qhLZDHg7NiQXkA2abdR5Jwv1JYEcxWzvNhuxbCREw4=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=UXx4wtDsKCEsya9wSolxc15GzFdf7WO/dqkTCl0KWPJlBJf4fsdIJIgiceDBec3eWj
         +u21W7rlqtBEIuyT9b1U8LHv+I5t5r9LSpl4lBR64HF6WaNapPYjGxoVtzVowb8iSLPn
         m/wP0vdlx4w4svoXUm+S/8bcvw3AHSdoNhNGvm8RiYr1b0zdn4r5Fd1ARMYJovZ0E9/K
         nZl0bxWUUiddMabqWQS609FqNW+LSaiYhJDfsx3PWi+7OHKs4lc0LF19FEt+6cC99MIz
         3lEDd5Iat2b0olwyqZ+TVHdsG4/PHnbJ6arqJ5FpdfVjyVIy79FNJZNgjzq11KXwMHcp
         rXBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Zz3mhXWB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7acb08e24a6si9947585a.429.2024.09.18.12.23.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 12:23:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Zz3mhXWB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sr0Gg-0004Y2-4w; Wed, 18 Sep 2024 15:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3kSjrZgUKCMwBsD07y66y3w.u648w4C-s94565y5C.69y@flex--tavip.bounces.google.com>)
 id 1sr0GT-0004S0-Qr
 for qemu-arm@nongnu.org; Wed, 18 Sep 2024 15:23:03 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3kSjrZgUKCMwBsD07y66y3w.u648w4C-s94565y5C.69y@flex--tavip.bounces.google.com>)
 id 1sr0GR-0007Ht-Ok
 for qemu-arm@nongnu.org; Wed, 18 Sep 2024 15:23:01 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-20540baca29so2389535ad.1
 for <qemu-arm@nongnu.org>; Wed, 18 Sep 2024 12:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1726687378; x=1727292178; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=0qhLZDHg7NiQXkA2abdR5Jwv1JYEcxWzvNhuxbCREw4=;
 b=Zz3mhXWBiGRUmuzDZ5VQNFMPCwIj1IJomuMX12ZhvSTVbeeGPcjb4aQQUpEedQ55MB
 lUx4tbVxajjiZpbwtQJed/oF20/3wWyVjwE1VsCpNEXVLmJ+o87wVS/9R9QJt5iozFKa
 vl02Zp8iFz0bxDUV7mj6bw+4zw9hLoAzjlH6F0VpnDLqsXunnkZx+41aPUsFCG8HKxxD
 zB1PKeK8OXONO9+CTM67iI+OlCdYzKHc1rIhWF2Cmx04VcGrntN+KDubwAvH0wdpgsou
 TnzoQyxHcZHK/INBKvPifzjlccgC3esmu5fxkCHHIOqYdpMj9S2GrfRYWwspswDCE6bi
 LX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726687378; x=1727292178;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0qhLZDHg7NiQXkA2abdR5Jwv1JYEcxWzvNhuxbCREw4=;
 b=sc4mEBpLxqpKXQZ+YKdnPA58ZDnAcd0qOn/RFbhz4faUd/aOKMm8RNGlRaYeLmSM8x
 Hgv/GWBoE6Bx2LVIUu5penEcCqSl26XMRGzxq14TKHiRIanmRf/ZSWbt8GbJCecDd5Iv
 R0LurKa7/lOas5AiLMe8OujOIh0uKDKgNY+MV+n95LfuXIo9PZ+Egije7qbj9Xfocvdt
 RUnOq4ZaiG5CTSFc2WlvuOBu7KcagW64EUIqVKOv0uwBUEW2m2lPkYaVLveBU0tIki9A
 wFgK7VNrp8nWCpTob5tZA4B7YAMv1jGVMfN1BsBH6YzINDBkra5Cnjp9RBM8XwKdxCjG
 oC3w==
X-Gm-Message-State: AOJu0YwJ2Ea95xBt+ZI57x4MEBdLnRRglhVqOQmo/LyTLvtSyoDkV1Em
 5qdE3pV/4n4POdYByEKihQOrkUwDNlurhOvMJ9OeVkRlasn1HSwqYTqXMCrtCrgO26zY50IE8g=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a17:902:db07:b0:206:adb9:a12f
 with SMTP id
 d9443c01a7336-2076e39d640mr14692255ad.5.1726687377663; Wed, 18 Sep 2024
 12:22:57 -0700 (PDT)
Date: Wed, 18 Sep 2024 12:22:29 -0700
In-Reply-To: <20240918192254.3136903-1-tavip@google.com>
Mime-Version: 1.0
References: <20240918192254.3136903-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
Message-ID: <20240918192254.3136903-2-tavip@google.com>
Subject: [PATCH 01/25] fifo32: add peek function
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3kSjrZgUKCMwBsD07y66y3w.u648w4C-s94565y5C.69y@flex--tavip.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EX/IPCr7+wL8

Add fifo32_peek() that returns the first element from the queue
without popping it.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 include/qemu/fifo32.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/include/qemu/fifo32.h b/include/qemu/fifo32.h
index 4e9fd1b5ef..9de1807375 100644
--- a/include/qemu/fifo32.h
+++ b/include/qemu/fifo32.h
@@ -140,6 +140,34 @@ static inline uint32_t fifo32_pop(Fifo32 *fifo)
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
+
+    buf = fifo8_peek_bufptr(&fifo->fifo, 4, &num);
+    if (num != 4) {
+        return ret;
+    }
+
+    for (int i = 0; i < sizeof(uint32_t); i++) {
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
2.46.0.662.g92d0881bb0-goog

