Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3804357dye;
        Wed, 2 Jul 2025 06:15:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUGZLRsGnre8Fl80W9Oc1YyLTrLmYftkqBxnLMXDWMA+jxNwY/YV4WHbrtMsqb+1305eVSr9Z11gcjSpQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHd9uK1SIkFNJrkeBmfSaGqPaEQFVP64XC6jU+YGzq7tQhLu7o0bWGBJq7Ndox5Tv89i3rM
X-Received: by 2002:a05:6402:318a:b0:5e6:e842:f9d2 with SMTP id 4fb4d7f45d1cf-60e536199d3mr1525537a12.29.1751462152757;
        Wed, 02 Jul 2025 06:15:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751462152; cv=none;
        d=google.com; s=arc-20240605;
        b=jMuUeHQKRV1t2hj7LJtnc096hlRNuPKigeJFCj5NGROiVxwXGw42jYH/pv38c5OvSZ
         GWNVYax85yOTQmqn2LJZp1QZgOOCBwdn6PkZ8yIY/KFK4ZSxMFbY4qwUf/3JGkJAn8RV
         Zln9Ch6jBhBhPuv5rLpR0DoVvM/60FHeXffIULKM3ioWt35B6dSqfU1UJyIWLdzqK9vM
         Pj+rCFr7r075Li4IvwrQo/8yzaeGLFpK6bikKZ2vjZZ4a/kKj2AYVFjPa+Qz1m7jm/lL
         MCwEd7GHLRm6RW67o51yQbj1QEPYR10lmPMTVN5QuoJ0ob6eMKdNQN6HgLNuU7Vw+GbJ
         2tGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xbpKY4w+Y2nS3xulbi2ps1vjI+IV1lSD7HJlNH9G7dI=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=L65j8mRHb4Jwkt7z4qFQT9H3+hUjY3kjLs7muHNsyhDfY2v7XqPcsh0zYao6TNf5Xn
         STRV2ev7w0Kb99bAx+TERobbEPZdC3WxqbPzyIQ+sB2cU/mCVbV8FvzkO9JJ71BkhWtw
         Xv20zo798UoAA18lTcRdinPfZ9xBdsVD6njRTGsgYvCP6H8iFPxnc6XhwE5F9UhRH4H9
         s3TqmYm/+KQ8brYKd93aUnK5z2qKHhUzBJJjcoz8BvAdrsT45kWSGuEe4+vLmGD76nwF
         yg5e1xmL5ZLbNsbVLJY4/qf4yrzq+PnGx++Ljcwh8vRWdkufaF9wKPyrisgBvVuvu6+u
         JXBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KG7WPiBY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-60c8325becasi9559657a12.566.2025.07.02.06.15.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 06:15:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KG7WPiBY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwnV-0000or-0w; Wed, 02 Jul 2025 08:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwjX-0004Pc-Od
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:45 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwjR-00029g-Bp
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:39 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-2eaad5eb1easo3611276fac.3
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459910; x=1752064710; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xbpKY4w+Y2nS3xulbi2ps1vjI+IV1lSD7HJlNH9G7dI=;
 b=KG7WPiBYJRrZ1k+WCIt5ENQi4QolrULPyX0AyT39fAA1x5VpJveHauxUfw+ESFP/Fe
 qnGwbd3CYtx9cUefy0DOU+hNogm224VQ3qwKwenYPCbqFpo7DSrXZ/Tr66VCJVK/iFOT
 Hwi92PSLpUelpVGHA0AgY4GoN4NJz5k2GTCPECZY8NVvakK0UwfOr0btx2zbi0RESY9n
 53qCV79lb55hVblf8p/lrcmeMgSfh8ET6ytKTZMm49JrpRgepCu8mYW/mBEpq8GRmdzw
 9uoRSCu5ReP2/v2JWY+BmU+irZSfTk2X6Ra7dS5bYBWcXuXH9ldY6xNvVX9yBKoO56bX
 u8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459910; x=1752064710;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xbpKY4w+Y2nS3xulbi2ps1vjI+IV1lSD7HJlNH9G7dI=;
 b=NYxzWEL9Nv6KPnjsmoTa2nni/MPQG1wdNTEBRinGGjdartcPZSkSHfWbph1dnWF1uh
 kcooQ7oP6JlJze21iFL7bwoG9WzZYgXB7UQmSl0+i0DdACtN+y+eZVIgqUoPix/2xkwi
 6zqtwIjNH/YShk6mDprR8cFiKc9kjGTva1X2zITSPlsK6gKUcmkOwFD3D2PTqLruER6y
 L9jKJ50t6rVjwJH/mKll//O/vL0CIOE0rn2RUnfWNgKCp2rFTR5nC2lMuhTbcI0Ybphl
 G0gK5xN8g40a6WLktcCmP6e5S+7ylqChxU01KvijjH8jiy1TwEXIxYCnK6UXLf9EoZwU
 4jAA==
X-Gm-Message-State: AOJu0YyuRwXlMwg+SyaPv2dfkSFN+boc4KUgtTx2gdLsoHPAdS0P/zIY
 7vUaaBUL4sfocgUoNPRVPnDHPei6g9Ff83bbKUwc94I48oD67bOH7RXUMUXQ6G6+h/s=
X-Gm-Gg: ASbGnctkBLHSXx8tgcZRW0L2QHYONkImjAnS1eK0P4cPbU2Roo/3c8+1xrFvgaz9do4
 SflNYt/c/8RnNY339Uh6loilR89D/VwR3fqBE/hU8HHLG1gtSO0xmFDO2uJ1qCL8n1WNQFvXxzx
 QZUUlelxqdr60BFO+nuaSuNR5g3pI6EwjU/N6bYa5OS6+uhqUJrudunfvl5jrYRhzu9vbGfggKe
 pHhJ/6hm6siQu9b9mzi0tCgKRu69s6Am/d5YXyuhMNaI6vlP01M9cGcJeC0l6ts3xMcmxNeco9Y
 SNeaF3qLqhfq2Gvpz10tZdkqjBCK46UVAshyUxWrCcAyU4HRVcEb8p3LuAdf1eeQ+Q7mpA==
X-Received: by 2002:a05:6870:d0ce:b0:2ea:1e55:a596 with SMTP id
 586e51a60fabf-2f5c7b59d7fmr2207278fac.30.1751459909780; 
 Wed, 02 Jul 2025 05:38:29 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd4ea5d9fsm3843451fac.10.2025.07.02.05.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:38:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 60/97] target/arm: Introduce pred_count_test
Date: Wed,  2 Jul 2025 06:33:33 -0600
Message-ID: <20250702123410.761208-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: shu8IxyRwSlE

For WHILE, we have the count of enabled predicates, so we don't
need to search to compute the PredTest result.  Reuse the logic
that will shortly be required for counted predicates.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sve_helper.c | 47 ++++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 0e59ad2262..8fb9d0241d 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4102,20 +4102,35 @@ uint64_t HELPER(sve_cntp)(void *vn, void *vg, uint32_t pred_desc)
     return sum;
 }
 
+/* C.f. Arm pseudocode PredCountTest */
+static uint32_t pred_count_test(uint32_t elements, uint32_t count, bool invert)
+{
+    uint32_t flags;
+
+    if (count == 0) {
+        flags = 1;                              /* !N, Z, C */
+    } else if (!invert) {
+        flags = (1u << 31) | 2;                 /* N, !Z */
+        flags |= count != elements;             /* C */
+    } else {
+        flags = 2;                              /* !Z, !C */
+        flags |= (count == elements) << 31;     /* N */
+    }
+    return flags;
+}
+
 uint32_t HELPER(sve_whilel)(void *vd, uint32_t count, uint32_t pred_desc)
 {
     intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     intptr_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
     uint64_t esz_mask = pred_esz_masks[esz];
     ARMPredicateReg *d = vd;
-    uint32_t flags;
-    intptr_t i;
+    intptr_t i, oprbits = oprsz * 8;
+
+    tcg_debug_assert(count <= oprbits);
 
     /* Begin with a zero predicate register.  */
-    flags = do_zero(d, oprsz);
-    if (count == 0) {
-        return flags;
-    }
+    do_zero(d, oprsz);
 
     /* Set all of the requested bits.  */
     for (i = 0; i < count / 64; ++i) {
@@ -4125,7 +4140,7 @@ uint32_t HELPER(sve_whilel)(void *vd, uint32_t count, uint32_t pred_desc)
         d->p[i] = MAKE_64BIT_MASK(0, count & 63) & esz_mask;
     }
 
-    return predtest_ones(d, oprsz, esz_mask);
+    return pred_count_test(oprbits, count, false);
 }
 
 uint32_t HELPER(sve_whileg)(void *vd, uint32_t count, uint32_t pred_desc)
@@ -4134,16 +4149,15 @@ uint32_t HELPER(sve_whileg)(void *vd, uint32_t count, uint32_t pred_desc)
     intptr_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
     uint64_t esz_mask = pred_esz_masks[esz];
     ARMPredicateReg *d = vd;
-    intptr_t i, invcount, oprbits;
+    intptr_t i, invcount, oprbits = oprsz * 8;
     uint64_t bits;
 
-    if (count == 0) {
-        return do_zero(d, oprsz);
-    }
-
-    oprbits = oprsz * 8;
     tcg_debug_assert(count <= oprbits);
 
+    /* Begin with a zero predicate register.  */
+    do_zero(d, oprsz);
+
+    /* Set all of the requested bits.  */
     bits = esz_mask;
     if (oprbits & 63) {
         bits &= MAKE_64BIT_MASK(0, oprbits & 63);
@@ -4154,14 +4168,9 @@ uint32_t HELPER(sve_whileg)(void *vd, uint32_t count, uint32_t pred_desc)
         d->p[i] = bits;
         bits = esz_mask;
     }
-
     d->p[i] = bits & MAKE_64BIT_MASK(invcount & 63, 64);
 
-    while (--i >= 0) {
-        d->p[i] = 0;
-    }
-
-    return predtest_ones(d, oprsz, esz_mask);
+    return pred_count_test(oprbits, count, true);
 }
 
 /* Recursive reduction on a function;
-- 
2.43.0

