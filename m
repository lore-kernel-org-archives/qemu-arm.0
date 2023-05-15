Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6579320ejq;
        Mon, 15 May 2023 08:09:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ45hae24KT5i6MSKQG96jCo/NGr6TINno6W3Nr5WxFUc4hpk/pnna1g8Dw55ohJDRbRd3I1
X-Received: by 2002:a7b:ce98:0:b0:3f4:e3ed:98e9 with SMTP id q24-20020a7bce98000000b003f4e3ed98e9mr12486567wmj.0.1684163360288;
        Mon, 15 May 2023 08:09:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684163360; cv=none;
        d=google.com; s=arc-20160816;
        b=yypDxKIJgal5Jql+uqTfx+KuDWlSr8nfVqzN+++P850UW4gUFkhgkzZ9wCT/y9vDhq
         /FsXaVxBse1Lt6jcnJgwaqq0C29QEfv78FPkDbuOVTNLg3iX8a9dB3yqjYK6pQO4deOz
         0xBSuB+D6azdHkY7JH8VfrgBz+71V3ydBU1nYhRkngUVeyajEZ2dKrISBPUtojv/WMdr
         MnkY5MmSSnyjrEztLoZOX2FCRUw6fxJ+2da/cUFKgiG/qpkwIPA7gHPYfjBR2XsgcJS3
         GFWwDgNAvm8UKJKJuYwkTEB7LRrCampAaxo7ZciC+uTQaCEb7s6SWbSGCXWnsc80pUcn
         FXOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vwB32Lu8jReXcA/wvC/qx9nAhkYXsChfxxD2grqRfag=;
        b=iH77e3NJEcYcdmhGVxy2uvrAy5Fp1YyfQO6h6mBvyd0gL62uZHIwTOcEaw+hGwbm/6
         BC/mYHTigLG+FvofLZ9jn40p7yLqKqtrECIk2VKY+uTG7CZhT7UrK+2/Qg/9vrQpgCFk
         jB0w8mI9S1g1VzHJT67XewZmqJhma4wGgrY7R+z4uQNLhjaadFzKf/PoOqti3hmdeIAt
         WqLNx133Hmrrg3NUTyKJxLSLqrVyN0y5vUC5nVgXAT0IzWJqjvIvU+yTDpCvcZW5cvA1
         wSVHCsu6MAMbHk6BlUu+J9Du+zAVEogeXiZyLaYVANgWyON5vtPW9pbo7rMMIJM/3dVq
         LfCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BvisT1N3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p8-20020adfcc88000000b003078488a8fcsi31968wrj.169.2023.05.15.08.09.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 08:09:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BvisT1N3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyZIi-0000mu-5p; Mon, 15 May 2023 10:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHK-0006vl-U3
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:34:28 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGR-0004u3-3s
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:33:37 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1aae5c2423dso124339525ad.3
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 07:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161205; x=1686753205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vwB32Lu8jReXcA/wvC/qx9nAhkYXsChfxxD2grqRfag=;
 b=BvisT1N3QcyJn+HIcURGy7vgTVeVGmWfGpUbBahF7IYPxhfkg2FVuq5+hi3EsMLJB2
 Lswr1bhQT90XOdsuO9YtoEwXnES88HJW547919/UvgVKKrGn7MK8uzsgDz/wH7o6EQo9
 k1HuIS0v9dHuktoHpkVC9Ba+mXlO/2sX7aYzuC3aGjYLmMg2pMf/KNj1cdQhZrwoMu6Y
 w2Ft0Dxf6WZ57SxpjAA3snn+YD8UBU3gOYxsBRyMt8gdM2GpxyCTgIE2Xo8tlFfoPsBm
 J1IPEYypC+Gdi72T+fBqBB4IHdb2ISLA1FrbxH55fOLdY7wldvFy9c2D9WnYoGL5yWMD
 SuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161205; x=1686753205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vwB32Lu8jReXcA/wvC/qx9nAhkYXsChfxxD2grqRfag=;
 b=YuTV3GHRpXTjcpB0ALiLbwsbOSzpCqunGf/Y1lpYSJ1rzGDafOitKeTD0z7j/F4g5q
 bIedAkBRzPDGCRkuRUCqOGTANqgnccVhiojxKlX1tsQQYC/RVdNHagSuJxyTZNkD8bgU
 1jrwcUJgmnj+Zo748bTsujcSPNZ1I1tAxxJxDyXh5ngbUH7Ytvft7O6s3KVC0bmVaAtM
 5Q5AwzKY1wjnyzgXsSm/TmIlyzFR8Rldgpcn4ssvJANwEpDTCugaWKhpY3ylRjVsu10+
 7nZJW3KO+RbrDC42wFxOVtKI0mYAov2OT6UjY4aidk1rfsJ2kpNZTsCa3Owyzc+MplBQ
 c6nQ==
X-Gm-Message-State: AC+VfDzDaN//4G5jFtwPjkbvX4L/7Awak6Cn5d5nsjGQsIQ1r6Tm8Jbw
 3YTu4GCC4Bl1bxjpU8cVZl1ldw==
X-Received: by 2002:a17:902:ee8a:b0:1ac:6c26:c32f with SMTP id
 a10-20020a170902ee8a00b001ac6c26c32fmr29497439pld.46.1684161204522; 
 Mon, 15 May 2023 07:33:24 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v5 11/54] accel/tcg: Add aarch64 specific support in
 ldst_atomicity
Date: Mon, 15 May 2023 07:32:30 -0700
Message-Id: <20230515143313.734053-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-TUID: Z1zmttYBoAPE

We have code in atomic128.h noting that through GCC 8, there
was no support for atomic operations on __uint128.  This has
been fixed in GCC 10.  But we can still improve over any
basic compare-and-swap loop using the ldxp/stxp instructions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/ldst_atomicity.c.inc | 60 ++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
index 69c1c61997..c3b2b35823 100644
--- a/accel/tcg/ldst_atomicity.c.inc
+++ b/accel/tcg/ldst_atomicity.c.inc
@@ -263,7 +263,22 @@ static Int128 load_atomic16_or_exit(CPUArchState *env, uintptr_t ra, void *pv)
      * In system mode all guest pages are writable, and for user-only
      * we have just checked writability.  Try cmpxchg.
      */
-#if defined(CONFIG_CMPXCHG128)
+#if defined(__aarch64__)
+    /* We can do better than cmpxchg for AArch64.  */
+    {
+        uint64_t l, h;
+        uint32_t fail;
+
+        /* The load must be paired with the store to guarantee not tearing. */
+        asm("0: ldxp %0, %1, %3\n\t"
+            "stxp %w2, %0, %1, %3\n\t"
+            "cbnz %w2, 0b"
+            : "=&r"(l), "=&r"(h), "=&r"(fail) : "Q"(*p));
+
+        qemu_build_assert(!HOST_BIG_ENDIAN);
+        return int128_make128(l, h);
+    }
+#elif defined(CONFIG_CMPXCHG128)
     /* Swap 0 with 0, with the side-effect of returning the old value. */
     {
         Int128Alias r;
@@ -759,7 +774,22 @@ store_atomic16(void *pv, Int128Alias val)
         return;
     }
 #endif
-#if defined(CONFIG_CMPXCHG128)
+#if defined(__aarch64__)
+    /* We can do better than cmpxchg for AArch64.  */
+    {
+        uint64_t l, h, t;
+
+        qemu_build_assert(!HOST_BIG_ENDIAN);
+        l = int128_getlo(val.s);
+        h = int128_gethi(val.s);
+
+        asm("0: ldxp %0, xzr, %1\n\t"
+            "stxp %w0, %2, %3, %1\n\t"
+            "cbnz %w0, 0b"
+            : "=&r"(t), "=Q"(*(__uint128_t *)pv) : "r"(l), "r"(h));
+        return;
+    }
+#elif defined(CONFIG_CMPXCHG128)
     {
         __uint128_t *pu = __builtin_assume_aligned(pv, 16);
         __uint128_t o;
@@ -857,7 +887,31 @@ static void store_atom_insert_al8(uint64_t *p, uint64_t val, uint64_t msk)
 static void ATTRIBUTE_ATOMIC128_OPT
 store_atom_insert_al16(Int128 *ps, Int128Alias val, Int128Alias msk)
 {
-#if defined(CONFIG_ATOMIC128)
+#if defined(__aarch64__)
+    /*
+     * GCC only implements __sync* primitives for int128 on aarch64.
+     * We can do better without the barriers, and integrating the
+     * arithmetic into the load-exclusive/store-conditional pair.
+     */
+    uint64_t tl, th, vl, vh, ml, mh;
+    uint32_t fail;
+
+    qemu_build_assert(!HOST_BIG_ENDIAN);
+    vl = int128_getlo(val.s);
+    vh = int128_gethi(val.s);
+    ml = int128_getlo(msk.s);
+    mh = int128_gethi(msk.s);
+
+    asm("0: ldxp %[l], %[h], %[mem]\n\t"
+        "bic %[l], %[l], %[ml]\n\t"
+        "bic %[h], %[h], %[mh]\n\t"
+        "orr %[l], %[l], %[vl]\n\t"
+        "orr %[h], %[h], %[vh]\n\t"
+        "stxp %w[f], %[l], %[h], %[mem]\n\t"
+        "cbnz %w[f], 0b\n"
+        : [mem] "+Q"(*ps), [f] "=&r"(fail), [l] "=&r"(tl), [h] "=&r"(th)
+        : [vl] "r"(vl), [vh] "r"(vh), [ml] "r"(ml), [mh] "r"(mh));
+#elif defined(CONFIG_ATOMIC128)
     __uint128_t *pu, old, new;
 
     /* With CONFIG_ATOMIC128, we can avoid the memory barriers. */
-- 
2.34.1

