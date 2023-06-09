Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp104697ejb;
        Thu, 8 Jun 2023 19:29:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4eH3arCeZXWZK/z/koZTxSzRMj3nzx6pwv3fWYyrD9CBU5qPmG/M9Dj4cNW6dTCS4m/Cf0
X-Received: by 2002:a05:622a:1009:b0:3f6:bd82:c020 with SMTP id d9-20020a05622a100900b003f6bd82c020mr182281qte.61.1686277768965;
        Thu, 08 Jun 2023 19:29:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686277768; cv=none;
        d=google.com; s=arc-20160816;
        b=tRXKWNqP+ocvBTYmJncyY7zgX6Mwl1eKT3u4xsrqNy10UkGQHvi0L37YPkZ6jOIN6a
         ygVMbQtgiJxSb9trwbgaQetAAJbNIM+8Z4wH7ARGrjG33t/Zoe8vrMDJSCQjAfRN12Iv
         G7QLGsOmh3OOUVsWiYFB/Ml5oJFS7fH6CscZKEnxn332JAixDGxYslrT0/mQFFGbGSAg
         weUZ3QFDJv4BGf2DaDP35vlZd/I3xjE6G6RNmNaCNvObtYCeCPjPmEC8zDKhhpkKOoxI
         4gRtyz58dqDI56bGZex4r9q7XkpQRBP9c27qOYHwyq/mAm86ZU95SYPmpHdrlNRqIWjg
         knew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OLFFYuouFCwCamulVOLZsWjyEyGPIaWGGn4/nOjW+MQ=;
        b=E32RspHqqhn5pmfmXrUlkW6Q11cV4x+lHUjU4qB5Im7wWf+YVoiJYgKat+ZQeTiKzd
         1GW7o+eEdv8DnAwzDGjqejvK+3yvA+hxRltS9ySuSTqTgVNr+6xm+7f7AvXXtrk9iv2u
         REsDeC2X6/bjwuHAyJFlKS+QTNDx2ZG8CxkeJ2Imo/mipUTZCNVBa5rqExsoopIOzB3/
         /izcCM1kYdwdwzDJ7YCVBGmAtnXqC1eqKY9OexfqsGecy9cMqWwaNjVG7i6RIcdpb4oL
         shFoxa2o0vzAh7c4YQDQBZH+obOvCgW39+Qg60sK4eHXZffamAqE70fN6uncGH3MGzRp
         88Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PxzwrRJr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8-20020ad45c88000000b006261a580d92si1647662qvh.79.2023.06.08.19.29.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 19:29:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PxzwrRJr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7Rnp-0002oM-D5; Thu, 08 Jun 2023 22:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rnl-0002jx-QP
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 22:24:33 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RnT-0005bx-My
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 22:24:33 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-654f8b56807so1293658b3a.1
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 19:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277454; x=1688869454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OLFFYuouFCwCamulVOLZsWjyEyGPIaWGGn4/nOjW+MQ=;
 b=PxzwrRJr8LCPlDpM3n83k2c2C+GIpsT+zRjbo7kNvDyEw/52rzqo/mlvJrwtyFXlkG
 7MZLCprZM4fjDefcRb+ZSEXJPS1Tz7+qk3UhrbpD7P/m7tozMpzF+ilUZbKCXtJNoczu
 oU8F7Fmnn6lgJpLU1CLgMn7da6BN5CXPlyoDu0M4fs/Ltm+PoKE7NeoSUcyI7ZWWq+t4
 FY6hoc9mqUaCQhdcczpEJt27MCslUoeXvhgKMNjql9fTMdnzCnNzDijwz2Uf9ebs3ECa
 OOGCubbLpElJVQc0OhBvqn4KxdkQGXHNsEU/jbJU+impQ1xQhcICUNCoJamFuXhsbCmk
 t8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277454; x=1688869454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OLFFYuouFCwCamulVOLZsWjyEyGPIaWGGn4/nOjW+MQ=;
 b=WrJssjO2diXe0TpaOwrPNU9i5TqMNAoJaASV2UkHECyh7AQ4x1WEyv5lmGh4PGqDI5
 vHfkxCWeHYou6m5hXZ8ofiF6z0S0hIhbkhIvWiRPF6weS1osKv1gJifhReiFlPgomV6C
 NTtqRfQedMJtp0Oi6MtdSMgF3cVI06FjlkTmcRhaKO7tD8GL2ThsQwbkZRSOToDlvDau
 EzqFl3xAOg6cbPeOZ3Vi9+Pz9kX0MTQuRvpOhJvURakj6dwUBESb1ZIIZIkx8zibxyvv
 ljmYo+quSCUAPLxScBM0oj1yPQ0znpMgACcYdS7iXb/4DiDDbE/oFAqbRruWMjyFYPxu
 k2fQ==
X-Gm-Message-State: AC+VfDx9xc2pa1OrriNdDUSBiz/rn+1P9tkersLapKmVWZ+xVc4bBWok
 iZgYkI4ya2EkaRCWOr6hFtv6cw==
X-Received: by 2002:a05:6a00:194d:b0:656:e7a2:5322 with SMTP id
 s13-20020a056a00194d00b00656e7a25322mr12901890pfk.26.1686277454456; 
 Thu, 08 Jun 2023 19:24:14 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 12/38] crypto: Add aesdec_ISB_ISR_AK
Date: Thu,  8 Jun 2023 19:23:35 -0700
Message-Id: <20230609022401.684157-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: UOLrbxl2EXZR

Add a primitive for InvSubBytes + InvShiftRows + AddRoundKey.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/generic/host/aes-round.h |  4 +++
 include/crypto/aes-round.h            | 21 +++++++++++++
 crypto/aes.c                          | 43 +++++++++++++++++++++++++++
 3 files changed, 68 insertions(+)

diff --git a/host/include/generic/host/aes-round.h b/host/include/generic/host/aes-round.h
index 19c8505e2b..e8f6bb0b99 100644
--- a/host/include/generic/host/aes-round.h
+++ b/host/include/generic/host/aes-round.h
@@ -13,4 +13,8 @@ void aesenc_SB_SR_AK_accel(AESState *, const AESState *,
                            const AESState *, bool)
     QEMU_ERROR("unsupported accel");
 
+void aesdec_ISB_ISR_AK_accel(AESState *, const AESState *,
+                             const AESState *, bool)
+    QEMU_ERROR("unsupported accel");
+
 #endif
diff --git a/include/crypto/aes-round.h b/include/crypto/aes-round.h
index 15ea1f42bc..56376cc83b 100644
--- a/include/crypto/aes-round.h
+++ b/include/crypto/aes-round.h
@@ -41,4 +41,25 @@ static inline void aesenc_SB_SR_AK(AESState *r, const AESState *st,
     }
 }
 
+/*
+ * Perform InvSubBytes + InvShiftRows.
+ */
+
+void aesdec_ISB_ISR_AK_gen(AESState *ret, const AESState *st,
+                           const AESState *rk);
+void aesdec_ISB_ISR_AK_genrev(AESState *ret, const AESState *st,
+                              const AESState *rk);
+
+static inline void aesdec_ISB_ISR_AK(AESState *r, const AESState *st,
+                                     const AESState *rk, bool be)
+{
+    if (HAVE_AES_ACCEL) {
+        aesdec_ISB_ISR_AK_accel(r, st, rk, be);
+    } else if (HOST_BIG_ENDIAN == be) {
+        aesdec_ISB_ISR_AK_gen(r, st, rk);
+    } else {
+        aesdec_ISB_ISR_AK_genrev(r, st, rk);
+    }
+}
+
 #endif /* CRYPTO_AES_ROUND_H */
diff --git a/crypto/aes.c b/crypto/aes.c
index 896f6f44f1..767930223c 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -1293,6 +1293,49 @@ void aesenc_SB_SR_AK_genrev(AESState *r, const AESState *s, const AESState *k)
     aesenc_SB_SR_AK_swap(r, s, k, true);
 }
 
+/* Perform InvSubBytes + InvShiftRows. */
+static inline void
+aesdec_ISB_ISR_AK_swap(AESState *ret, const AESState *st,
+                       const AESState *rk, bool swap)
+{
+    const int swap_b = swap ? 15 : 0;
+    AESState t;
+
+    t.b[swap_b ^ 0x0] = AES_isbox[st->b[swap_b ^ AES_ISH_0]];
+    t.b[swap_b ^ 0x1] = AES_isbox[st->b[swap_b ^ AES_ISH_1]];
+    t.b[swap_b ^ 0x2] = AES_isbox[st->b[swap_b ^ AES_ISH_2]];
+    t.b[swap_b ^ 0x3] = AES_isbox[st->b[swap_b ^ AES_ISH_3]];
+    t.b[swap_b ^ 0x4] = AES_isbox[st->b[swap_b ^ AES_ISH_4]];
+    t.b[swap_b ^ 0x5] = AES_isbox[st->b[swap_b ^ AES_ISH_5]];
+    t.b[swap_b ^ 0x6] = AES_isbox[st->b[swap_b ^ AES_ISH_6]];
+    t.b[swap_b ^ 0x7] = AES_isbox[st->b[swap_b ^ AES_ISH_7]];
+    t.b[swap_b ^ 0x8] = AES_isbox[st->b[swap_b ^ AES_ISH_8]];
+    t.b[swap_b ^ 0x9] = AES_isbox[st->b[swap_b ^ AES_ISH_9]];
+    t.b[swap_b ^ 0xa] = AES_isbox[st->b[swap_b ^ AES_ISH_A]];
+    t.b[swap_b ^ 0xb] = AES_isbox[st->b[swap_b ^ AES_ISH_B]];
+    t.b[swap_b ^ 0xc] = AES_isbox[st->b[swap_b ^ AES_ISH_C]];
+    t.b[swap_b ^ 0xd] = AES_isbox[st->b[swap_b ^ AES_ISH_D]];
+    t.b[swap_b ^ 0xe] = AES_isbox[st->b[swap_b ^ AES_ISH_E]];
+    t.b[swap_b ^ 0xf] = AES_isbox[st->b[swap_b ^ AES_ISH_F]];
+
+    /*
+     * Perform the AddRoundKey with generic vectors.
+     * This may be expanded to either host integer or host vector code.
+     * The key and output endianness match, so no bswap required.
+     */
+    ret->v = t.v ^ rk->v;
+}
+
+void aesdec_ISB_ISR_AK_gen(AESState *r, const AESState *s, const AESState *k)
+{
+    aesdec_ISB_ISR_AK_swap(r, s, k, false);
+}
+
+void aesdec_ISB_ISR_AK_genrev(AESState *r, const AESState *s, const AESState *k)
+{
+    aesdec_ISB_ISR_AK_swap(r, s, k, true);
+}
+
 /**
  * Expand the cipher key into the encryption key schedule.
  */
-- 
2.34.1

