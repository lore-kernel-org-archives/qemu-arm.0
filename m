Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2173301ejy;
        Mon, 3 Jul 2023 03:11:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4sVGVkcq7CoAJdZQVAcmk742nw7YN3ksqH3XX08D7BmkbzzRajIHSLlkZOpbW7lRVZ1jxj
X-Received: by 2002:a05:622a:94:b0:3ff:2567:246f with SMTP id o20-20020a05622a009400b003ff2567246fmr11283398qtw.19.1688379114506;
        Mon, 03 Jul 2023 03:11:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688379114; cv=none;
        d=google.com; s=arc-20160816;
        b=rxiTFF+Mv6B8jL7vquus/9976eI3zczHvb6ZmBmJdstOH4GuJ8tewzFKi53zQl0mJm
         GULWLVYCYXkAF4edO8PIhCoY0Z2ID0iGSGVIe9fEKFo8NueQHqoAFLrxBw/7tKck4pRP
         unoOl6PIAQ20emMDgSjsHtzauH2FQIfQXPKNmbOSRt56Se3oULc/q6U7vdMyEsa6V1qC
         x55VVrd1nY6nR2MmZz6bz0nbgE6rIituzCdSCvUqG8dU9PF6dSvQhCtUXmXn8NhEtRXT
         3RkZ+rKQdJW6Zz+nNG9dtdKsPMuiyJTMIV1eWCLcNedMH1C5xkTp3HRnUh0HQa83RXu5
         lb1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ne/prNzqsLfpjp4V0V8cndvcCHzJQtvFp1sqS4i2NnA=;
        fh=yGBgCIAdw0xhdK58ttTTG5yX3hLvrsJsvO63zqD4x2E=;
        b=ERmeRzeBZ+LFhDFjSktwgmUGxMcvaGMlF4xScw6NVXpV5g8zVYcGQMIqKCWEr69jEh
         abvcRLdAMgKR3u3GASEiG3Lkr2XLCz6RNDbIK5S+6DN4kbNkCzgR4eVAescqDscacjl0
         Ou6vC759H8NfNdug81GRWl51DsjYchtxxvprw3P4nZpFFZlEShXtJgsTI+jPKCV7LXOf
         XU4aw8ohiOCnPnRVyYz9sj6chSCj2tJNiAEeFs9hXwTT0MtqIeSr9RyvE6iL8y2vQy0C
         fHfzxjY3Q8haLz0pCE8OFZtHzO6DQwjm7Ub2xZykb7TyY7UAx0rdHFzslBdLp2o+s4VQ
         eKEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c+HEn9aj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z13-20020a05622a028d00b004007b328549si5507980qtw.614.2023.07.03.03.11.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jul 2023 03:11:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c+HEn9aj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGGRY-0002wD-KV; Mon, 03 Jul 2023 06:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRO-0002mM-84
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:05:54 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRG-0005m5-2K
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:05:53 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-313e714342cso4951350f8f.0
 for <qemu-arm@nongnu.org>; Mon, 03 Jul 2023 03:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378732; x=1690970732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ne/prNzqsLfpjp4V0V8cndvcCHzJQtvFp1sqS4i2NnA=;
 b=c+HEn9ajz+YeahAHgWi3CWQxH9BbdU9DrOiVpzU0iu6gIiKzRoiwHRYoQ8ubofwh7j
 gNm6Bh8TtfwTmm1G2WErLTiGWB5gnvxADwC31jYzCAIN6ynColExZID2k7xWM1W71Be4
 ajQonhwTIVuBYlzGGBO8xl4mF066l9SlQLProAkZhedrW9ljD+tueQIRgKHZxhDjNSY7
 2U4J64L0LywNsCDPanm/8qNa9RWr6mh5mPsPv5BcsFSKi+2tobnmyMVVgLKlcZtLomMm
 05H4/4EnKcgtBdo67hnkhJ31f0UvKTtFzy+0zylR4J7OcuyeJdUsZaHv4QxkPOJ/Y8nj
 JEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378732; x=1690970732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ne/prNzqsLfpjp4V0V8cndvcCHzJQtvFp1sqS4i2NnA=;
 b=WAHu9YE4TQMnLwNOdmXVHgjxg2NBH2FXsglcQ935wNI66DC5CFC10YvP7oMjVnvaw7
 dHdfZeRA4UtnLkuX33MyUOIQRRMsuyf8SfBFKbYip7b8TVtmWIbiLE/1p782XCehzIWU
 EeCW/y10903slDJpjWsx8mUoRkkrjvYR3P4dElcJXg6CfphaSfT8PWhIFtQq4ZAAKVPG
 gFKmYL0dL7eacli9eQAX2l3lmBe5jHR7KFcKMkBYJtfSyH7gXG8DRjn18dHSzQJwjEYV
 T7k4WzlDN99LfLjTL/ymf+5CL7c/YwDmMM3VGnPSiiTLqSxV+1ZwSkBI1A7H08yqky9G
 fZQw==
X-Gm-Message-State: ABy/qLYaU8ViWbHNIWjJ0RwBCPx1RfiI7L7mpNHOZEjIj4nNP/udEnE6
 uMPCi0gJ0c7Zit9vieFA4pkwfg==
X-Received: by 2002:a5d:43cd:0:b0:314:182c:19e1 with SMTP id
 v13-20020a5d43cd000000b00314182c19e1mr8090106wrr.17.1688378731767; 
 Mon, 03 Jul 2023 03:05:31 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v4 09/37] crypto: Add aesenc_SB_SR_MC_AK
Date: Mon,  3 Jul 2023 12:04:52 +0200
Message-Id: <20230703100520.68224-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 8t/PJmoqql9P

Add a primitive for SubBytes + ShiftRows + MixColumns + AddRoundKey.

Acked-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/generic/host/crypto/aes-round.h |  3 +
 include/crypto/aes-round.h                   | 21 +++++++
 crypto/aes.c                                 | 58 ++++++++++++++++++++
 3 files changed, 82 insertions(+)

diff --git a/host/include/generic/host/crypto/aes-round.h b/host/include/generic/host/crypto/aes-round.h
index 335ec3f11e..9886e81e50 100644
--- a/host/include/generic/host/crypto/aes-round.h
+++ b/host/include/generic/host/crypto/aes-round.h
@@ -14,6 +14,9 @@ void aesenc_MC_accel(AESState *, const AESState *, bool)
 void aesenc_SB_SR_AK_accel(AESState *, const AESState *,
                            const AESState *, bool)
     QEMU_ERROR("unsupported accel");
+void aesenc_SB_SR_MC_AK_accel(AESState *, const AESState *,
+                              const AESState *, bool)
+    QEMU_ERROR("unsupported accel");
 
 void aesdec_IMC_accel(AESState *, const AESState *, bool)
     QEMU_ERROR("unsupported accel");
diff --git a/include/crypto/aes-round.h b/include/crypto/aes-round.h
index 7be2cc0d8e..03688c8640 100644
--- a/include/crypto/aes-round.h
+++ b/include/crypto/aes-round.h
@@ -59,6 +59,27 @@ static inline void aesenc_SB_SR_AK(AESState *r, const AESState *st,
     }
 }
 
+/*
+ * Perform SubBytes + ShiftRows + MixColumns + AddRoundKey.
+ */
+
+void aesenc_SB_SR_MC_AK_gen(AESState *ret, const AESState *st,
+                            const AESState *rk);
+void aesenc_SB_SR_MC_AK_genrev(AESState *ret, const AESState *st,
+                               const AESState *rk);
+
+static inline void aesenc_SB_SR_MC_AK(AESState *r, const AESState *st,
+                                      const AESState *rk, bool be)
+{
+    if (HAVE_AES_ACCEL) {
+        aesenc_SB_SR_MC_AK_accel(r, st, rk, be);
+    } else if (HOST_BIG_ENDIAN == be) {
+        aesenc_SB_SR_MC_AK_gen(r, st, rk);
+    } else {
+        aesenc_SB_SR_MC_AK_genrev(r, st, rk);
+    }
+}
+
 /*
  * Perform InvMixColumns.
  */
diff --git a/crypto/aes.c b/crypto/aes.c
index 6c05d731f4..a193d98d54 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -1322,6 +1322,64 @@ void aesenc_SB_SR_AK_genrev(AESState *r, const AESState *s, const AESState *k)
     aesenc_SB_SR_AK_swap(r, s, k, true);
 }
 
+/*
+ * Perform SubBytes + ShiftRows + MixColumns + AddRoundKey.
+ */
+static inline void
+aesenc_SB_SR_MC_AK_swap(AESState *r, const AESState *st,
+                        const AESState *rk, bool swap)
+{
+    int swap_b = swap * 0xf;
+    int swap_w = swap * 0x3;
+    bool be = HOST_BIG_ENDIAN ^ swap;
+    uint32_t w0, w1, w2, w3;
+
+    w0 = (AES_Te0[st->b[swap_b ^ AES_SH(0x0)]] ^
+          AES_Te1[st->b[swap_b ^ AES_SH(0x1)]] ^
+          AES_Te2[st->b[swap_b ^ AES_SH(0x2)]] ^
+          AES_Te3[st->b[swap_b ^ AES_SH(0x3)]]);
+
+    w1 = (AES_Te0[st->b[swap_b ^ AES_SH(0x4)]] ^
+          AES_Te1[st->b[swap_b ^ AES_SH(0x5)]] ^
+          AES_Te2[st->b[swap_b ^ AES_SH(0x6)]] ^
+          AES_Te3[st->b[swap_b ^ AES_SH(0x7)]]);
+
+    w2 = (AES_Te0[st->b[swap_b ^ AES_SH(0x8)]] ^
+          AES_Te1[st->b[swap_b ^ AES_SH(0x9)]] ^
+          AES_Te2[st->b[swap_b ^ AES_SH(0xA)]] ^
+          AES_Te3[st->b[swap_b ^ AES_SH(0xB)]]);
+
+    w3 = (AES_Te0[st->b[swap_b ^ AES_SH(0xC)]] ^
+          AES_Te1[st->b[swap_b ^ AES_SH(0xD)]] ^
+          AES_Te2[st->b[swap_b ^ AES_SH(0xE)]] ^
+          AES_Te3[st->b[swap_b ^ AES_SH(0xF)]]);
+
+    /* Note that AES_TeX is encoded for big-endian. */
+    if (!be) {
+        w0 = bswap32(w0);
+        w1 = bswap32(w1);
+        w2 = bswap32(w2);
+        w3 = bswap32(w3);
+    }
+
+    r->w[swap_w ^ 0] = rk->w[swap_w ^ 0] ^ w0;
+    r->w[swap_w ^ 1] = rk->w[swap_w ^ 1] ^ w1;
+    r->w[swap_w ^ 2] = rk->w[swap_w ^ 2] ^ w2;
+    r->w[swap_w ^ 3] = rk->w[swap_w ^ 3] ^ w3;
+}
+
+void aesenc_SB_SR_MC_AK_gen(AESState *r, const AESState *st,
+                            const AESState *rk)
+{
+    aesenc_SB_SR_MC_AK_swap(r, st, rk, false);
+}
+
+void aesenc_SB_SR_MC_AK_genrev(AESState *r, const AESState *st,
+                               const AESState *rk)
+{
+    aesenc_SB_SR_MC_AK_swap(r, st, rk, true);
+}
+
 /*
  * Perform InvMixColumns.
  */
-- 
2.34.1

