Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1545925ejb;
        Fri, 2 Jun 2023 19:39:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6HyqyRC46Kkxa3j91fZ+PHU3DSU7Jt4kljYdEIRe3jy0R6RnPOmrbdvDErK0ReJL8u7gX+
X-Received: by 2002:a05:622a:174b:b0:3ef:4e85:e76f with SMTP id l11-20020a05622a174b00b003ef4e85e76fmr547149qtk.59.1685759980517;
        Fri, 02 Jun 2023 19:39:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685759980; cv=none;
        d=google.com; s=arc-20160816;
        b=BToUe6pDywlQYI+TwdtqxHSskYjyBPDJ5hpMEzfxwSLum3BXsjwTlqGT3ryO2chg3x
         x7mNVn0O6XGGC0QqBovGwsdnns59AgGmTweWb59HzLKETixe1+U0vNOqmYnvgr+gcF6J
         VHvKFgrMqBW4iuTrY4KbfWsN75h4toVM1Davx7jtrAbQXwNd6g05G7mHPxi/iXKQwY8p
         d+OT9NNqfWitiaUlP73tdrXKEuXiYJSLIQ/uWArUn1qufyUayjv4B8appBGLYManS2E9
         YXnMB0vfftqIGrF9pJdW4RDoUO7yZqnuutl2RLV8O24bbLefq1duRxVFXX8t9rsop5WG
         22lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yhUARdFwT69t+H+UUFeebMxz0PxbDKgvhvhPEqctC4I=;
        b=QMzu1UwMg92IucOfSHQJLVTbdamDTwDkfq7Vr5mYrn1Ye36PwiVlEr+njUPTZ6+Bp/
         vazCH6NCTSLl6AUFvfOItasvWfC8AswGSryRampIs9dB5tHhy/zmSCeD6WutsYotGevO
         jXmN642PX0RSnE7ny6gXO04QESuTPgBTewUKWrG6jBNbK6+D2oEz6SYZFr+lnAUZ9qaf
         Z+cfO1OypNF3mrGilPIUXV59jNxlLVRZX8w+jLIJBUJrXg3XJCNicc9DpfdlB7U+ThQB
         KDFVMx0SwPjEHnxNfKVB0kDVDQt4K/o8ykSHkhbZaqAYq2c6dVv4T/cmLa9/BmRm68qW
         nBhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Uq8hu11w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b11-20020a05622a020b00b003e4e2eaa3adsi1757570qtx.65.2023.06.02.19.39.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 19:39:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Uq8hu11w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5H7W-0001jO-1N; Fri, 02 Jun 2023 22:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6Q-0000T8-Dv
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 22:34:50 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6G-0004m1-TS
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 22:34:49 -0400
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-390723f815fso1794256b6e.3
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 19:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759678; x=1688351678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yhUARdFwT69t+H+UUFeebMxz0PxbDKgvhvhPEqctC4I=;
 b=Uq8hu11wQLayBSb3c6ieisDPShW0TcpdGSI8lMUzeA3DRB7916sc2Tm9u0Wxw+N9Mg
 +PoRseCpiH0mbuthHqiqOq1UFmJX72kVzPdUWRDXU1uzArZu4l0TQhCGECa9BhXnQNTx
 QjRwL8yb6HI1uPnbygSsYYBHSxwbdzh8vRiAMIHXQWTkVkFXP2AfxbplZ9PtcdJYPiki
 99GIy1/XUhOcMPm64hZx6rNiTfyDUW4bIBMVPbpihPB/ssWmBuVqgqSMnvR3xy5btfdZ
 MbFQSEsqfrLB1r7LizeieBfFgQIY1REQA7qdFgj5iZepxLyXPg6HjK+do85QRsM1i9J8
 EeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759678; x=1688351678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yhUARdFwT69t+H+UUFeebMxz0PxbDKgvhvhPEqctC4I=;
 b=EYw1CO9xmOcuAS2Uik981FIqDjGkZgj06Mp0/AFpUnmdUwDUQqRaHFJqC8wjo8hD/p
 tdaHVVgcHbx8LoXC/IHANgK/hq5QbTuk8Gc0NiXzdci96YZaAAZju9JREmNPobACL5VT
 nzl+2dHRepNwy6+miFOYoB1WFcE9czqGSG58j6aqDI10hhj3W+roWOlmaocgetUq8onS
 zmRFogrTfl/dsOydGF/LwAjM+CwfsvFHGxbaJQDa7IosT0pI/SINfz+S2yJ3ffMxy+F2
 oCFKyzx4fx3VzGJa5JxBBl0TxgECAyTNXJY/ktZYI9Wv76suJAhA71R9NUpC1dUy37Za
 zCiw==
X-Gm-Message-State: AC+VfDxAD6mdRch8rsmcuQxX2YGvNjTHPiqp0U1F0bb4a11rP/ZkZeDA
 U6rio1jbuvHnueSBlLZQS0KrPTFkKPEqjpc9iCE=
X-Received: by 2002:a05:6358:2486:b0:125:8739:c7b0 with SMTP id
 m6-20020a056358248600b001258739c7b0mr8098284rwc.3.1685759678321; 
 Fri, 02 Jun 2023 19:34:38 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 12/35] target/arm: Use aesdec_ISB_ISR
Date: Fri,  2 Jun 2023 19:34:03 -0700
Message-Id: <20230603023426.1064431-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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
X-TUID: w9WquCgCoM/P

This implements the AESD instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/crypto_helper.c | 37 +++++++++++++++-------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index 5cebc88f5f..d7b644851f 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -46,26 +46,6 @@ static void clear_tail_16(void *vd, uint32_t desc)
     clear_tail(vd, opr_sz, max_sz);
 }
 
-static void do_crypto_aese(uint64_t *rd, uint64_t *rn, uint64_t *rm,
-                           const uint8_t *sbox, const uint8_t *shift)
-{
-    union CRYPTO_STATE rk = { .l = { rm[0], rm[1] } };
-    union CRYPTO_STATE st = { .l = { rn[0], rn[1] } };
-    int i;
-
-    /* xor state vector with round key */
-    rk.l[0] ^= st.l[0];
-    rk.l[1] ^= st.l[1];
-
-    /* combine ShiftRows operation and sbox substitution */
-    for (i = 0; i < 16; i++) {
-        CR_ST_BYTE(st, i) = sbox[CR_ST_BYTE(rk, shift[i])];
-    }
-
-    rd[0] = st.l[0];
-    rd[1] = st.l[1];
-}
-
 void HELPER(crypto_aese)(void *vd, void *vn, void *vm, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
@@ -96,7 +76,22 @@ void HELPER(crypto_aesd)(void *vd, void *vn, void *vm, uint32_t desc)
     intptr_t i, opr_sz = simd_oprsz(desc);
 
     for (i = 0; i < opr_sz; i += 16) {
-        do_crypto_aese(vd + i, vn + i, vm + i, AES_isbox, AES_ishifts);
+        AESState *ad = (AESState *)(vd + i);
+        AESState *st = (AESState *)(vn + i);
+        AESState *rk = (AESState *)(vm + i);
+        AESState t;
+
+        /* Our uint64_t are in the wrong order for big-endian. */
+        if (HOST_BIG_ENDIAN) {
+            t.d[0] = st->d[1] ^ rk->d[1];
+            t.d[1] = st->d[0] ^ rk->d[0];
+            aesdec_ISB_ISR(&t, &t, false);
+            ad->d[0] = t.d[1];
+            ad->d[1] = t.d[0];
+        } else {
+            t.v = st->v ^ rk->v;
+            aesdec_ISB_ISR(ad, &t, false);
+        }
     }
     clear_tail(vd, opr_sz, simd_maxsz(desc));
 }
-- 
2.34.1

