Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp199813ejt;
        Tue, 20 Jun 2023 04:11:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ75vapQVPgXok079YMpRXmOAg+nOQi6WVOYfGyNV09aMsUMHrnu/j9Vz/bAbhHpW8qRKln4
X-Received: by 2002:ac8:5c8c:0:b0:3ff:28d9:cce5 with SMTP id r12-20020ac85c8c000000b003ff28d9cce5mr3667182qta.62.1687259489839;
        Tue, 20 Jun 2023 04:11:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687259489; cv=none;
        d=google.com; s=arc-20160816;
        b=XAvYuKu0emOmS5nZfOvVlXbXPpnNW7t+iImQD8vOKcULRI1wCs9mf7hpt4XSUm+tJC
         SjE1VVnZ5S7aC0e6iNvGDPS25v905eYMtxrLW6xvY9ha+WewZ2wmjB5pTY+JQVIbYlSh
         eh09qTfbT9k+/X31TEO78cfPPjVNNY4vi+8BmLLTbWlutvQYULqmKGsS/9Ou+f9+9wdu
         fC1mEuxfP7+uVVmBd/lH/4qKrf6bfejBRE2o/XDVfDRj13j6ihdviySegWOugnCaOGpY
         L0bS/e5E44vPreELraUZhBy1FH93RrpUt9yN5WtPs8bV8iRbdej0LIyQme4etYqUrftM
         Ixtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RF9gkbqYy40O49MNRxkszLXC6NRN9VopxJ/DiScwWiQ=;
        b=TgNWAVl0B5c5KeVIXMPA2j3/N5hm/GsBxReUViL806qKQ0m2pxtRmn7KHJfgmPMjlG
         xb8cc87gTwCx3ZqiH6h4g5SW7OeMH+Jvn+pnkrG6M0O6AxwSuTGpA6F3j7BRtj4F/I9j
         6VT4XpG4qBDlXdkQN3BH+Nlm1VcoEnjTtw9QsLq72zzCUUXizdP62r0y6mXouUcglf2j
         3It3xHemRBWA+iNQ/hAMMyGABYLbmUkprp7ypji9LHNZ5kKLoEQQbYGdmy9+cpZfyak9
         D5RgazxCqKCRqL13DklgUEpzPQeke9Ydm6J4wVUZuawix1q3uZdqozvcNvsKsG8YDkeG
         dsQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fBJADhAM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c20-20020a05622a059400b003f4eb7108c6si665434qtb.229.2023.06.20.04.11.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 04:11:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fBJADhAM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBZDk-00068H-B5; Tue, 20 Jun 2023 07:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDh-00064S-Lm
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 07:08:21 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDe-0004H0-HQ
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 07:08:21 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-988a2715b8cso399563766b.0
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 04:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259297; x=1689851297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RF9gkbqYy40O49MNRxkszLXC6NRN9VopxJ/DiScwWiQ=;
 b=fBJADhAMiP4QNUtrnVCH9NPEqIkNx70zUzrL8agrNqowYCE1t+VnCOy/RoB1vJy5MC
 GKNxChM9un0ng7T6++w9/91t2G6s0sQaT/TkjFPGkWClTgCrEoOs4xg7OkTBTQMXpXCG
 xB5C0EAWBmXzsdIzTcVYVmm+iC4WIxMXP9HH0EvIp1b9EK6CsfsZC/rTAYUV57ri+LxT
 c7t5AlBW269ic3jylj8g76k2c8FKY29ur6q3B/PWMfS6XCgjhE6t0vqyG2Yz6oVxYSxK
 alJvKlFHcSdy4SnJXIB/YbcRagbAcC+tDih90Ax07C2pxwgsEDqbRZVE8iJmQNdoHRCy
 vLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259297; x=1689851297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RF9gkbqYy40O49MNRxkszLXC6NRN9VopxJ/DiScwWiQ=;
 b=c3bLnsBA9tmoT8NIqs9SDXKEodrvubphxEu/eX/4oXre7Dfqr2101J4BTqIQV3Ua3S
 2Hd/QkqM6BAwdaZiGvBYt+DF+j/MN+G+0IxxxS+9h1YjXymxnM/NMjkoT4tBqB/y628x
 bfGduLX3PvojJKr7EFOVH/XLYXDeMUsZaujB1fRErRTk9cSwKsQT/MBupUpyydiFvBWD
 ZKDTPH10yAaNgDmoQtC1ipnsjqTmvanryTHagyiqm++YuyhZyGEt/kE0UYvYTPZvx1+q
 uK8IuaBnyp7iAGE9PuqQ3+5FqgyPPrxINveqGl8D9kCajnk77ErecZVWAVSDq//nCGHh
 W/qw==
X-Gm-Message-State: AC+VfDwJrhXXoM+eiWjPgCpQIlLPIaQ03mfCqRJwYhEdfKD4cAm7d/Wp
 IhmqkIF83G0LnajXCyWxPhqz1A==
X-Received: by 2002:a17:907:7290:b0:988:e6dc:bfae with SMTP id
 dt16-20020a170907729000b00988e6dcbfaemr3300776ejc.24.1687259297234; 
 Tue, 20 Jun 2023 04:08:17 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 11/37] crypto: Add aesdec_ISB_ISR_AK
Date: Tue, 20 Jun 2023 13:07:32 +0200
Message-Id: <20230620110758.787479-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62b.google.com
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
X-TUID: 3ZKQECF1vkjK

Add a primitive for InvSubBytes + InvShiftRows + AddRoundKey.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/generic/host/crypto/aes-round.h |  4 ++
 include/crypto/aes-round.h                   | 21 +++++++++
 crypto/aes.c                                 | 45 ++++++++++++++++++++
 3 files changed, 70 insertions(+)

diff --git a/host/include/generic/host/crypto/aes-round.h b/host/include/generic/host/crypto/aes-round.h
index c5d8066179..c9b9d732f0 100644
--- a/host/include/generic/host/crypto/aes-round.h
+++ b/host/include/generic/host/crypto/aes-round.h
@@ -13,4 +13,8 @@ void aesenc_SB_SR_AK_accel(AESState *, const AESState *,
                            const AESState *, bool)
     QEMU_ERROR("unsupported accel");
 
+void aesdec_ISB_ISR_AK_accel(AESState *, const AESState *,
+                             const AESState *, bool)
+    QEMU_ERROR("unsupported accel");
+
 #endif /* GENERIC_HOST_CRYPTO_AES_ROUND_H */
diff --git a/include/crypto/aes-round.h b/include/crypto/aes-round.h
index d675d2468f..f917339104 100644
--- a/include/crypto/aes-round.h
+++ b/include/crypto/aes-round.h
@@ -41,4 +41,25 @@ static inline void aesenc_SB_SR_AK(AESState *r, const AESState *st,
     }
 }
 
+/*
+ * Perform InvSubBytes + InvShiftRows + AddRoundKey.
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
index c00f10bad1..3d24781858 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -1295,6 +1295,51 @@ void aesenc_SB_SR_AK_genrev(AESState *r, const AESState *s, const AESState *k)
     aesenc_SB_SR_AK_swap(r, s, k, true);
 }
 
+/*
+ * Perform InvSubBytes + InvShiftRows + AddRoundKey.
+ */
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

