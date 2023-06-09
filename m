Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp103994ejb;
        Thu, 8 Jun 2023 19:26:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6wzEW9qqCzLgzAx0lJozd2U0LxjR6jEJdfluGg7AccV+Q4dYVKUzgZicfQjDUhxogD2VGq
X-Received: by 2002:a05:620a:472a:b0:75b:23a1:d8c5 with SMTP id bs42-20020a05620a472a00b0075b23a1d8c5mr616834qkb.9.1686277617777;
        Thu, 08 Jun 2023 19:26:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686277617; cv=none;
        d=google.com; s=arc-20160816;
        b=05dsfhWeb4vCfanZf0h1h4Uekj7hgDuzdjPDHIY3V4laUdrkrKkx3VTcikTP0ojaBW
         aDNfvhOED1cbGHOHx+pXWSLTE0xk+hbICj9xu/etFYCe9WIoJQRyCgtFpDgyt43zcL0m
         2OQ90eLvaA+lgtm2eXsNA8Nl3GTQvpM+I6/mZdXhgeCpou5DRn9MBG8SpUdWT+tQNxd/
         +u/PJhDrkcEAg0HFI8n86/+UuSjr//0qHMm6UIPm2h1Dkuf4qNWV9Yqyd+8GZz+MmYuY
         GMdK9lw15Nqj3s2eYGmXaYtV26E0EgyiL9b+Oja0k3/llsT6B1v7eSxgPlJAj9wNtPRs
         5cFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ga+hWvCBDL4QxTP+wi9pxfKvtud2l/xV0t0m4HElUJM=;
        b=EfEbYbadTuBfk2wvZ99ctLw9hqDgXTCRPxMSrbY5Tig+EkQI9XYXQZ8kc4T9aEygob
         srDLvICnWUqH0r2hAN50k7URgvhYUNvElAHztXlzgqwSQ3g2ab+nvoNsMFpx02czCzR6
         7fxgUdpNSlYk2zM1fMzFWfydMCh3c0gGBDWszZDCCLJ+7vgImd/u2VRHOnmLXqywdKTW
         t+g+eKk5HJ27yWwHMOlnElLRNSeyJbUw19DyfWExL/PSWUiC/wog8kYncAaCF6fqFqCm
         klX0iaQ/MiRz2TmrkAeixe6+6m18hJ3e7MptrxD+fiHMxrdB1+t4xXvJjz8HE+XFalcE
         okag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rKqAEY/q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j1-20020a05620a288100b0075b00b64a45si1463796qkp.753.2023.06.08.19.26.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 19:26:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rKqAEY/q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7RpD-0005e1-17; Thu, 08 Jun 2023 22:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RoC-00033J-EN
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 22:25:02 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rne-0005iy-Me
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 22:25:00 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-653bed78635so935310b3a.0
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 19:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277464; x=1688869464;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ga+hWvCBDL4QxTP+wi9pxfKvtud2l/xV0t0m4HElUJM=;
 b=rKqAEY/q4ogFzpl+mtLLaEplOYiygWXJGWsbssdM6Jadw3Lm25NwsyiwPdRb7G51o1
 dBQbuys6GuruTXZlqsXHBDTDdpMOryCptNzETguaqnW1tXzpUylrmc7XFElZ3yw3SB+O
 EUKNfURAUUb1gP8QYXAFne0qlrLGCLUJboMvwJuANsRIrM4mNQvxFqZsJ/WdbJcxlaAv
 EFYpwhCmgdWjidcA3hS+kwdsSdbAkq79YauCMRSfvxU5ipOasxkhkQgZ5njHxKzhYCDM
 YUbWF34cSUns99e/Js8Zoq47kPKiGhQlsRYKNtqtSmmTi1m+2b1rDg3iwgXPEok81Ma3
 G5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277464; x=1688869464;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ga+hWvCBDL4QxTP+wi9pxfKvtud2l/xV0t0m4HElUJM=;
 b=Vs2RwMjp/3+WBSjxYRMlSlxQfcwTChxfJfOW1eBpc1SDG0GlyzE4U0zaubayev3rd8
 cW0AzaqBe5NG57TgsJZ/kUUtT9VSdP3EZdBYoBUlDUjdiK2Gq8vKbddT0mQWGvrisRC+
 uWE/1FMN9RXtZ9Fzl0Rq1IM3AzWmJOPSgSOcvM0S1Layy5fyjvh4pIY+eTRSzsB1x8+l
 DxcjA0NOtZUIR+6+Dkl9dduhQJO+seDpib0b/c8e+RmPvqwbTTj6xPonWL32uy0GsQXu
 E84BtdsmFQinSyxRMGUPn6yYseAFm4FxvcA+5ZjKLi985S3p4xbOndixRHK6MZXouRzX
 OGlA==
X-Gm-Message-State: AC+VfDxlrxrQ7dnEj4eVrvGrY5EAuZYtDwPHzSD5gOIsc3eeTzMtLRC3
 XI95eU/xvLAohlw+9sCgUN/fTg==
X-Received: by 2002:a05:6a21:9983:b0:10a:eea0:6987 with SMTP id
 ve3-20020a056a21998300b0010aeea06987mr537918pzb.26.1686277464157; 
 Thu, 08 Jun 2023 19:24:24 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 23/38] crypto: Add aesenc_SB_SR_MC_AK
Date: Thu,  8 Jun 2023 19:23:46 -0700
Message-Id: <20230609022401.684157-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
X-TUID: 2KDTTsDj7W9s

Add a primitive for SubBytes + ShiftRows + MixColumns + AddRoundKey.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/generic/host/aes-round.h |  3 ++
 include/crypto/aes-round.h            | 21 ++++++++++
 crypto/aes.c                          | 56 +++++++++++++++++++++++++++
 3 files changed, 80 insertions(+)

diff --git a/host/include/generic/host/aes-round.h b/host/include/generic/host/aes-round.h
index 34068afe40..ee64db32fa 100644
--- a/host/include/generic/host/aes-round.h
+++ b/host/include/generic/host/aes-round.h
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
index b80d4de664..9e10c3ee9e 100644
--- a/include/crypto/aes-round.h
+++ b/include/crypto/aes-round.h
@@ -77,6 +77,27 @@ static inline void aesdec_IMC(AESState *r, const AESState *st, bool be)
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
index bfd41e3fb9..0c281472aa 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -1352,6 +1352,62 @@ void aesenc_MC_genrev(AESState *r, const AESState *st)
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
 aesdec_ISB_ISR_AK_swap(AESState *ret, const AESState *st,
-- 
2.34.1

