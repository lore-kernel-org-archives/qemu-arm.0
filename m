Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1544864ejb;
        Fri, 2 Jun 2023 19:36:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7XiZgaL/LnE5pTChriqUP2MSmMCWRMYVpwi5EWZgkZICj6SW8KqJHh8GSM78WIMtNsaBf+
X-Received: by 2002:ac8:4e95:0:b0:3f6:bbca:f235 with SMTP id 21-20020ac84e95000000b003f6bbcaf235mr343853qtp.40.1685759798855;
        Fri, 02 Jun 2023 19:36:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685759798; cv=none;
        d=google.com; s=arc-20160816;
        b=UdGJQCx9X8FdOFbAtWjUUXGPhaxAtnLTQdfORR06wsklWymW/poIuQSi5YPmm4BBgL
         P+XHP+mxKPmkBUvabLANygKLGy8nIXgrzTKvq4MWCfoXXq8b5pb905odsPCizhSXKKbV
         mPIYV9KU/fj08JEl49kXF9yUoipD7ICSPAUcrxvO396vC8seP4CXiYsMS2adkrBk1FgT
         c6Fs4lWj3xSWI8Q5slxW3XdjgfkCb17mrtCeMkshrV2e4C9jMkkImnrwVpXbktQOQw8s
         sGswrmbB2gjgyglC19wFwzrKhhWGsYW5/tzs1syzimPCOlPrWFrNTcWxoSfBUErmRGux
         rocg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cUWhRH6bLO/8WDIHOPro6jgbCs/NIT/Ha8MzhIm17R0=;
        b=t+r2Jpf4wgH7pNzU1r/w+amkPqPoNxjxxTxIWJvXufln7UyOtwtaGokwEFzaEFArNY
         Rfz4tOE/W0LZW1C4sLTbIjBw3RjaU91NL2b+bNx2M8i0PW39CuB2L++Cvgzbph+EQXZV
         HqDkT/OyNaclN2cwpP4g70hC+838r8BaqIaJG5N1APF+mPUqpfmEdGDRKe74j41gcLrN
         kYBMySHLYcYj7m5gm6iu1yd8MQTEkQ6yLl2A3yeVg2wvHB24kcQpYLRtxGUV7Q83pvHs
         fv4AKXXVi+LUJDFqM2SxjrpLG2rFc/GEnjg4L8NR894AVcq2eEc3o1nf9A+BpZPi6smH
         HtfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ybVZ1Ubg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s33-20020a05622a1aa100b003ef2f701245si1716781qtc.64.2023.06.02.19.36.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 19:36:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ybVZ1Ubg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q5H7g-0002nr-Gc; Fri, 02 Jun 2023 22:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6a-0000Zb-HJ
 for qemu-devel@nongnu.org; Fri, 02 Jun 2023 22:35:02 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6N-0004qu-Vd
 for qemu-devel@nongnu.org; Fri, 02 Jun 2023 22:35:00 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-5555765c6d3so2132643eaf.1
 for <qemu-devel@nongnu.org>; Fri, 02 Jun 2023 19:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759687; x=1688351687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cUWhRH6bLO/8WDIHOPro6jgbCs/NIT/Ha8MzhIm17R0=;
 b=ybVZ1UbgBANik3IeRyPOgM0DFMDX83pd4yTUwLXnfBUiYNhHh97Bcl69uNp747T+lR
 EQ125jLTT1inn5vwgaWPfEvjUF7xJNCRPrBE5sUiy9aCfwq/vUmQ0bgQ3b8hAlWT4Amm
 L6xTqWLMaIRtaHpcm1hMOSxo1BgYpy2H6C9tKp5jgYtNYWDQSuGxVj64XPHvrIT02aEO
 0RcTuvIxplgTQ2k5Gl4N+rfp9pafShC18YhQIQ+U2LSKz2+lQFR3u1cAoeKG1PTeS8q8
 Hm8a/SmNQdk4SjxP2ka//7A3q6NF93mrJcSv0RX8L8ZQlB/mADuu8YggoOrkheXr2oRz
 nusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759687; x=1688351687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cUWhRH6bLO/8WDIHOPro6jgbCs/NIT/Ha8MzhIm17R0=;
 b=H8Bh2/0XACoaRDecPOnWYwOwl+N6tj8ADN13MMxljeXlJPJYtHfIdVDSnFjW/D9utO
 vDySclEh3HuFT5p1mgB235GMY0RFOhd7wYMToFlOuJaI+cluNy74ONZ6pDq1Y60NuSJY
 Ttw9aE0KkNQcVNP/ny0ClpxfbA6YNKbVyQxaUBIGx8kmpyT+qtkWQqkPSjBtst2etNXR
 OKdCgj/i0XSWKzpUVzvV4x3UQkijhmB+oF7K62+XwuvZ8caHpUQ1IjpRUq1I0R07Je0x
 iZa1J74lE36faoT9FdPc14zehifKSQ42FcDtPBsGTWwFxNmbtEbSrBZfhZMt8T+dBZUr
 0tRQ==
X-Gm-Message-State: AC+VfDyM7Iry8TjsHjpNQQwe1N7hJMYEi8mSNTkYb9HAo/fMFGfDqCIY
 umyB+QH5tUSqeMUg3KlwqBRe/o7JP/xga/lthX8=
X-Received: by 2002:a05:6358:7188:b0:123:390b:178f with SMTP id
 t8-20020a056358718800b00123390b178fmr13315118rwt.5.1685759686747; 
 Fri, 02 Jun 2023 19:34:46 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 21/35] crypto: Add aesenc_SB_SR_MC_AK
Date: Fri,  2 Jun 2023 19:34:12 -0700
Message-Id: <20230603023426.1064431-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: E2K356epc1nz

Add a primitive for SubBytes + ShiftRows + MixColumns + AddRoundKey.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/generic/host/aes-round.h |  4 ++
 include/crypto/aes-round.h            | 21 ++++++++++
 crypto/aes.c                          | 56 +++++++++++++++++++++++++++
 3 files changed, 81 insertions(+)

diff --git a/host/include/generic/host/aes-round.h b/host/include/generic/host/aes-round.h
index 1e9b97d274..dc2c751ac3 100644
--- a/host/include/generic/host/aes-round.h
+++ b/host/include/generic/host/aes-round.h
@@ -15,6 +15,10 @@ void aesenc_MC_accel(AESState *, const AESState *, bool)
 void aesenc_SB_SR_accel(AESState *, const AESState *, bool)
     QEMU_ERROR("unsupported accel");
 
+void aesenc_SB_SR_MC_AK_accel(AESState *, const AESState *,
+                              const AESState *, bool)
+    QEMU_ERROR("unsupported accel");
+
 void aesdec_IMC_accel(AESState *, const AESState *, bool)
     QEMU_ERROR("unsupported accel");
 
diff --git a/include/crypto/aes-round.h b/include/crypto/aes-round.h
index 2d962ede0b..aefa17fcc3 100644
--- a/include/crypto/aes-round.h
+++ b/include/crypto/aes-round.h
@@ -56,6 +56,27 @@ static inline void aesenc_MC(AESState *r, const AESState *st, bool be)
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
  * Perform InvSubBytes + InvShiftRows.
  */
diff --git a/crypto/aes.c b/crypto/aes.c
index 4e654e5404..6172495b46 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -1356,6 +1356,62 @@ void aesenc_MC_genrev(AESState *r, const AESState *st)
     aesenc_MC_swap(r, st, true);
 }
 
+/* Perform SubBytes + ShiftRows + MixColumns + AddRoundKey. */
+static inline void
+aesenc_SB_SR_MC_AK_swap(AESState *r, const AESState *st,
+                        const AESState *rk, bool swap)
+{
+    int swap_b = swap * 0xf;
+    int swap_w = swap * 0x3;
+    bool be = HOST_BIG_ENDIAN ^ swap;
+    uint32_t w0, w1, w2, w3;
+
+    w0 = (AES_Te0[st->b[swap_b ^ AES_SH_0]] ^
+          AES_Te1[st->b[swap_b ^ AES_SH_1]] ^
+          AES_Te2[st->b[swap_b ^ AES_SH_2]] ^
+          AES_Te3[st->b[swap_b ^ AES_SH_3]]);
+
+    w1 = (AES_Te0[st->b[swap_b ^ AES_SH_4]] ^
+          AES_Te1[st->b[swap_b ^ AES_SH_5]] ^
+          AES_Te2[st->b[swap_b ^ AES_SH_6]] ^
+          AES_Te3[st->b[swap_b ^ AES_SH_7]]);
+
+    w2 = (AES_Te0[st->b[swap_b ^ AES_SH_8]] ^
+          AES_Te1[st->b[swap_b ^ AES_SH_9]] ^
+          AES_Te2[st->b[swap_b ^ AES_SH_A]] ^
+          AES_Te3[st->b[swap_b ^ AES_SH_B]]);
+
+    w3 = (AES_Te0[st->b[swap_b ^ AES_SH_C]] ^
+          AES_Te1[st->b[swap_b ^ AES_SH_D]] ^
+          AES_Te2[st->b[swap_b ^ AES_SH_E]] ^
+          AES_Te3[st->b[swap_b ^ AES_SH_F]]);
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
 /* Perform InvSubBytes + InvShiftRows. */
 static inline void
 aesdec_ISB_ISR_swap(AESState *r, const AESState *st, bool swap)
-- 
2.34.1

