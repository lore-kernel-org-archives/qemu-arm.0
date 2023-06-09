Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp105026ejb;
        Thu, 8 Jun 2023 19:30:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5MTtzwN9f+/UJVuYatN4qWn2NQ1fLwG95GKF+G49tc+P9SX0SgefJO44zhxYc/dna4HEa0
X-Received: by 2002:a05:6214:500b:b0:626:2668:8b9f with SMTP id jo11-20020a056214500b00b0062626688b9fmr400318qvb.41.1686277829097;
        Thu, 08 Jun 2023 19:30:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686277829; cv=none;
        d=google.com; s=arc-20160816;
        b=O9qHN8NLr1/ppRbvorI8MYV71YmaQAYiTXffNw3u/W5qfHBXcERlrHAJyG9MtbWM91
         PwzzVJKsIlS43HMyPs1puiCjFcra/719Y3O61OKx1fV+p+HBM5ZpcKDjmudAitEi9gqf
         JvcMnMv7YxMdym3t/Tl/3F2/KSNWcknFdv0nBVD4fgnZgfwzYvyNVkNPTQtESQTzspAh
         HZhYbeda5JxtXqMJnIp4Cagai/XKVqBfJHse7pVtuVfRXyDTnYplqxKTfCAgs3mouv6O
         qRiz+8yp1d+py3VmT8pgS5bpUh54GrvOTm+H3FSbv0H3IyKMBxSVrjobgAPW4Skx3Vz2
         PK9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pS9H3nW1oUdrmNzz27iCH6iSm9j7i3Aiq4G8rnUmTu4=;
        b=jKZuWFGErwwl2YQnAN7qWp7wlbi29cx7EMUMRHHTEopLo/YDhEbWWgwtQXKg7sDkRr
         r/jeWakgix6kpsHMW+rUmH36xyBhaaD0F1J6spjpT+iYtS7jqmst2StxQV7FnGscXRN2
         Y2cgQJFI3rfYb1q8rIICTCHQFjiSNuNvWIKocDRt1wptwjBDT8Pa8oDzAvKhfnqYBnyi
         UYOiKz7zMo+wMA48TlitR2NfgdEM+HaQcuQfHAlOrFWf+jkVBWSOpDsSBBDikGoVykxY
         63+BWK3ynmTGihfYtESg3V6zFvGOhiWOOD4Sz752QKgKdoytMjV9ZV1fuiCyMemOKKr9
         2aLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y2RepjWe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gm5-20020a056214268500b0061b602f5cf8si1627384qvb.231.2023.06.08.19.30.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 19:30:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y2RepjWe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7Rp6-0004it-J7; Thu, 08 Jun 2023 22:25:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rnz-0002wR-9G
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 22:24:50 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RnY-0005gG-Iu
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 22:24:45 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6b2a875b1bfso285046a34.0
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 19:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277459; x=1688869459;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pS9H3nW1oUdrmNzz27iCH6iSm9j7i3Aiq4G8rnUmTu4=;
 b=Y2RepjWegCsrpeqXzgnR+0DHfg1Vwts6vMSgpOaS5z3sRO83kA8RoJMtEPXOqtZwwk
 CiM9GswB2SlNmWk/ykQ0lcN5tXiKthcobDKzJYuCM8z/xAZRhwmCp7Sg5OG2KQK7tN4q
 njCMxA0/qnvZNQyKq2bwvreOUJd1JEJ6Fp26/btDwFUpq6Ng+Tv+huXlVA5v7sxQ0N0G
 1+znq7Hj56DBZoO3A0gQf0eBqtpLlpi7mleaBOLKSyEozw+kanKnjXMjRlwRTT3ztE0n
 rxlFfidSPcIRDUsUH95Ht6MD8OEfDzjKkNW0D76dXOTxmnAK5tWoPb3EplaRgD78bQzH
 qu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277459; x=1688869459;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pS9H3nW1oUdrmNzz27iCH6iSm9j7i3Aiq4G8rnUmTu4=;
 b=F1FJGsPpLs+6xDEST32WKbdupEt+opJRo/fpEdWyKKeD7skTOKbYfftd8ZDYLSttDQ
 Tw6DkgyccE97sbk7oci4QdBGPQShvpxRXPpNIFpR7bIq/VGeweFFSTbcgx7qEJDejUgJ
 yIAJp+X+CJ75js++eob1mEmQij4Kq3NzinPigWRfR3m+QSKB7R78QbmI9dDE3FIL6raB
 4FgUhxgyVAyLcq0RPw2cFM8SQ5f4SHcUbnhlCi5/fPE/ZESGXNEtWo/6/PswAxwMX4Sl
 oJ1WtXn7EWgR1u2x8uXMabxEbvw3Agmje1nIOaDv6HkJW3Wepek/9yxEraEc338d6BFR
 +qoA==
X-Gm-Message-State: AC+VfDxFPbz7NRLgQ1gfKG0f0TT4MP8pbCMGaHtwSRWIvbXHQcgk9xP4
 M3NPjGjqTclSxE5SMwwbU/jK6Q==
X-Received: by 2002:a05:6830:1483:b0:6b1:5e8f:e508 with SMTP id
 s3-20020a056830148300b006b15e8fe508mr148822otq.33.1686277458977; 
 Thu, 08 Jun 2023 19:24:18 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 17/38] crypto: Add aesenc_MC
Date: Thu,  8 Jun 2023 19:23:40 -0700
Message-Id: <20230609022401.684157-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: I9REGX4f8qbK

Add a primitive for MixColumns.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/generic/host/aes-round.h |  2 +
 include/crypto/aes-round.h            | 18 ++++++++
 crypto/aes.c                          | 59 +++++++++++++++++++++++++++
 3 files changed, 79 insertions(+)

diff --git a/host/include/generic/host/aes-round.h b/host/include/generic/host/aes-round.h
index e8f6bb0b99..b00e9b50b1 100644
--- a/host/include/generic/host/aes-round.h
+++ b/host/include/generic/host/aes-round.h
@@ -9,6 +9,8 @@
 #define HAVE_AES_ACCEL  false
 #define ATTR_AES_ACCEL
 
+void aesenc_MC_accel(AESState *, const AESState *, bool)
+    QEMU_ERROR("unsupported accel");
 void aesenc_SB_SR_AK_accel(AESState *, const AESState *,
                            const AESState *, bool)
     QEMU_ERROR("unsupported accel");
diff --git a/include/crypto/aes-round.h b/include/crypto/aes-round.h
index 56376cc83b..9f263ca726 100644
--- a/include/crypto/aes-round.h
+++ b/include/crypto/aes-round.h
@@ -20,6 +20,24 @@ typedef union {
 
 #include "host/aes-round.h"
 
+/*
+ * Perform MixColumns.
+ */
+
+void aesenc_MC_gen(AESState *ret, const AESState *st);
+void aesenc_MC_genrev(AESState *ret, const AESState *st);
+
+static inline void aesenc_MC(AESState *r, const AESState *st, bool be)
+{
+    if (HAVE_AES_ACCEL) {
+        aesenc_MC_accel(r, st, be);
+    } else if (HOST_BIG_ENDIAN == be) {
+        aesenc_MC_gen(r, st);
+    } else {
+        aesenc_MC_genrev(r, st);
+    }
+}
+
 /*
  * Perform SubBytes + ShiftRows.
  */
diff --git a/crypto/aes.c b/crypto/aes.c
index 767930223c..89de8e8db4 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -28,6 +28,8 @@
  * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 #include "qemu/osdep.h"
+#include "qemu/bswap.h"
+#include "qemu/bitops.h"
 #include "crypto/aes.h"
 #include "crypto/aes-round.h"
 
@@ -1293,6 +1295,63 @@ void aesenc_SB_SR_AK_genrev(AESState *r, const AESState *s, const AESState *k)
     aesenc_SB_SR_AK_swap(r, s, k, true);
 }
 
+/* Perform MixColumns. */
+static inline void
+aesenc_MC_swap(AESState *r, const AESState *st, bool swap)
+{
+    int swap_b = swap * 0xf;
+    int swap_w = swap * 0x3;
+    bool be = HOST_BIG_ENDIAN ^ swap;
+    uint32_t t;
+
+    /* Note that AES_mc_rot is encoded for little-endian. */
+    t = (      AES_mc_rot[st->b[swap_b ^ 0x0]] ^
+         rol32(AES_mc_rot[st->b[swap_b ^ 0x1]], 8) ^
+         rol32(AES_mc_rot[st->b[swap_b ^ 0x2]], 16) ^
+         rol32(AES_mc_rot[st->b[swap_b ^ 0x3]], 24));
+    if (be) {
+        t = bswap32(t);
+    }
+    r->w[swap_w ^ 0] = t;
+
+    t = (      AES_mc_rot[st->b[swap_b ^ 0x4]] ^
+         rol32(AES_mc_rot[st->b[swap_b ^ 0x5]], 8) ^
+         rol32(AES_mc_rot[st->b[swap_b ^ 0x6]], 16) ^
+         rol32(AES_mc_rot[st->b[swap_b ^ 0x7]], 24));
+    if (be) {
+        t = bswap32(t);
+    }
+    r->w[swap_w ^ 1] = t;
+
+    t = (      AES_mc_rot[st->b[swap_b ^ 0x8]] ^
+         rol32(AES_mc_rot[st->b[swap_b ^ 0x9]], 8) ^
+         rol32(AES_mc_rot[st->b[swap_b ^ 0xA]], 16) ^
+         rol32(AES_mc_rot[st->b[swap_b ^ 0xB]], 24));
+    if (be) {
+        t = bswap32(t);
+    }
+    r->w[swap_w ^ 2] = t;
+
+    t = (      AES_mc_rot[st->b[swap_b ^ 0xC]] ^
+         rol32(AES_mc_rot[st->b[swap_b ^ 0xD]], 8) ^
+         rol32(AES_mc_rot[st->b[swap_b ^ 0xE]], 16) ^
+         rol32(AES_mc_rot[st->b[swap_b ^ 0xF]], 24));
+    if (be) {
+        t = bswap32(t);
+    }
+    r->w[swap_w ^ 3] = t;
+}
+
+void aesenc_MC_gen(AESState *r, const AESState *st)
+{
+    aesenc_MC_swap(r, st, false);
+}
+
+void aesenc_MC_genrev(AESState *r, const AESState *st)
+{
+    aesenc_MC_swap(r, st, true);
+}
+
 /* Perform InvSubBytes + InvShiftRows. */
 static inline void
 aesdec_ISB_ISR_AK_swap(AESState *ret, const AESState *st,
-- 
2.34.1

