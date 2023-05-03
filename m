Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2658234ejm;
        Wed, 3 May 2023 00:21:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ei5mG2CTz1WxqOHUBflX9EExkMGIpbl2uWwCxDmUGlngY4pqMdrx1xXYrHjnaMCyb9HBT
X-Received: by 2002:ac8:5c90:0:b0:3f2:25e6:47b1 with SMTP id r16-20020ac85c90000000b003f225e647b1mr10453738qta.45.1683098480052;
        Wed, 03 May 2023 00:21:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683098480; cv=none;
        d=google.com; s=arc-20160816;
        b=xNNxmCYKA6ap9ST29dneR6XpL/MVraDfN4Mpwdzn7iZiNOAcI7DqniIENRZKd7WsWx
         7CQiv41Rf0nSJ973IM9UhfNdsRs5zvvDAgc/lb/9gkTLh6DP0NF1hXe7PZNwws0hgA1q
         AuhB+MuUTh88u4i5Io1R3FsIbWyp36yhnxwazhWHeH1nLPfBMCkclDTWs9HFEi20JHzx
         Yb7MFvKlPEjjkoTc396vB0WXdiKwQPsx6zANBE1nVGczYIY69l2SRBD9qOC5hDDyIRyh
         qMEicR7voMJeb2ENZGI45G492qTi5kLfEyhiwKdIFe3iMHH/wqIj4NjxTxLKN4XJmQrM
         XJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sA2aOIeGNBWRjeeou5Y4ut1mvsbxM8pXHUcMzyX3UOg=;
        b=BD3Bf8WbogzdOC1mRIJdMbxBy2aMakGfjy1Y97w/ty3fSnxKyKMgVAJeWik1Kkctzl
         auWmmwEFpDA6IRbrf+X79eXgcEsLlU5smRssNIGXn/eqYcYQNOYxNPlMFZQHUjWXpXun
         x8WAS03iOme16yRhrghfTCKDQ6Bt2K21G1WjF+YrUpIVrYZuML+jJJtHFJ5WtLHG3srK
         5qW5zfBMxxkmtqHzg0x9P6n55Ewo1Wq682iBlZHrw/WZEtz7bQSIttHI2Ucwr1NdSz0W
         weXi58vEd5a4zBbaUHY0L/TKt1OZWymUzUOM3FHlZ32oSONZttnbGTk0uSAm8AuhLB35
         O2TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FukclqHg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17-20020ac85e11000000b003eca9c6d28csi1549037qtx.650.2023.05.03.00.21.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:21:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FukclqHg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6b4-0000Xx-1W; Wed, 03 May 2023 03:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aR-0006cg-DC
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:07:39 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6a1-0005ZY-0d
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:07:39 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f20215fa70so31025495e9.0
 for <qemu-arm@nongnu.org>; Wed, 03 May 2023 00:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097632; x=1685689632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sA2aOIeGNBWRjeeou5Y4ut1mvsbxM8pXHUcMzyX3UOg=;
 b=FukclqHgBMT9J/gxByhlAW2U8thk+ABrtRkcfnxFr9R/QrINexGHP7u2veZidVDaYC
 U9ucU0LxbW/v1JjS58bUGmMN8IOgphTKlmCT9lfQ6zGCJqjfkFvFICB6I6golAny07kW
 0qMwNy8sJGenc5qG7FNhiVDEN64XQNx6/q5fnMZiJCrF2tERMSPxo8EQx91m2S3QO5+U
 pCZfCUTmEzZ9m8eanYAHFaHiq6hl9Di1RUBWlY9p3i+3LUv4cQShawg7p2rRBSZ6ToEq
 sIYQKIL8NUZEA4nn5e25h3pZ0LsH6btSash9rwni0DafQ1x9rQPmnsbee3Ydaj1ee0qh
 x5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097632; x=1685689632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sA2aOIeGNBWRjeeou5Y4ut1mvsbxM8pXHUcMzyX3UOg=;
 b=bUqGEwXYJNwOkuIpwQPscWlfbV9Qishxe2kwtwZEwgIzDH7B8v6T32B/KYjJ4fz2uD
 MNApOesdCP5rgS9g+Ss4VwXN/kxeWhGMPIKZc7fHMn6F3o4XF6qd0U71NgjYJBYSWgKg
 8b5gNaF3/JHQvjCPnhhiINj5wQkHBWBaeBrv2aNinQSPHvnc9cK9euvrmIy1UanrfZDy
 ZbbTm6ho/rhxQp4FQRIhYtEFnGlDzi2Ry5YINKHQf+6GMeBrJMOebTSAyyKtg9oP7fOh
 ecvdfpf9VOeimPMLBb/tPSG52a9TJqzvrXqgBI3dGIlsyrNeQL6NFbAVxJctr1H2Uh9E
 6RDg==
X-Gm-Message-State: AC+VfDyd1t1XoGTEYU9mWz5WsSONcKXYUtNWBLp+0HcXJNKR0sM4qTFx
 n5CVAnFo9buhIJ6rotHxU/jSWQ==
X-Received: by 2002:adf:e484:0:b0:306:320b:5dbd with SMTP id
 i4-20020adfe484000000b00306320b5dbdmr5508212wrm.71.1683097632016; 
 Wed, 03 May 2023 00:07:12 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 19/57] accel/tcg: Add have_lse2 support in ldst_atomicity
Date: Wed,  3 May 2023 08:06:18 +0100
Message-Id: <20230503070656.1746170-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: Y6GSFa9PxzkE

Add fast paths for FEAT_LSE2, using the detection in tcg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/ldst_atomicity.c.inc | 37 ++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
index 2426b09aef..7ed5d4282d 100644
--- a/accel/tcg/ldst_atomicity.c.inc
+++ b/accel/tcg/ldst_atomicity.c.inc
@@ -41,6 +41,8 @@
  * but we're using tcg/tci/ instead.
  */
 # define HAVE_al16_fast    false
+#elif defined(__aarch64__)
+# define HAVE_al16_fast    likely(have_lse2)
 #elif defined(__x86_64__) && defined(CONFIG_INT128)
 # define HAVE_al16_fast    likely(have_atomic16)
 #else
@@ -48,6 +50,8 @@
 #endif
 #if defined(CONFIG_ATOMIC128) || defined(CONFIG_CMPXCHG128)
 # define HAVE_al16         true
+#elif defined(__aarch64__)
+# define HAVE_al16         true
 #else
 # define HAVE_al16         false
 #endif
@@ -170,6 +174,14 @@ load_atomic16(void *pv)
 
     r.u = qatomic_read__nocheck(p);
     return r.s;
+#elif defined(__aarch64__)
+    uint64_t l, h;
+
+    /* Via HAVE_al16_fast, FEAT_LSE2 is present: LDP becomes atomic. */
+    asm("ldp %0, %1, %2" : "=r"(l), "=r"(h) : "m"(*(__uint128_t *)pv));
+
+    qemu_build_assert(!HOST_BIG_ENDIAN);
+    return int128_make128(l, h);
 #elif defined(__x86_64__) && defined(CONFIG_INT128)
     Int128Alias r;
 
@@ -412,6 +424,18 @@ load_atom_extract_al16_or_al8(void *pv, int s)
         r = qatomic_read__nocheck(p16);
     }
     return r >> shr;
+#elif defined(__aarch64__)
+    /*
+     * Via HAVE_al16_fast, FEAT_LSE2 is present.
+     * LDP becomes single-copy atomic if 16-byte aligned, and
+     * single-copy atomic on the parts if 8-byte aligned.
+     */
+    uintptr_t pi = (uintptr_t)pv;
+    int shr = (pi & 7) * 8;
+    uint64_t l, h;
+
+    asm("ldp %0, %1, %2" : "=r"(l), "=r"(h) : "m"(*(__uint128_t *)(pi & ~7)));
+    return (l >> shr) | (h << (-shr & 63));
 #elif defined(__x86_64__) && defined(CONFIG_INT128)
     uintptr_t pi = (uintptr_t)pv;
     int shr = (pi & 7) * 8;
@@ -767,10 +791,15 @@ store_atomic16(void *pv, Int128Alias val)
         l = int128_getlo(val.s);
         h = int128_gethi(val.s);
 
-        asm("0: ldxp %0, xzr, %1\n\t"
-            "stxp %w0, %2, %3, %1\n\t"
-            "cbnz %w0, 0b"
-            : "=&r"(t), "=Q"(*(__uint128_t *)pv) : "r"(l), "r"(h));
+        if (HAVE_al16_fast) {
+            /* Via HAVE_al16_fast, FEAT_LSE2 is present: STP becomes atomic. */
+            asm("stp %1, %2, %0" : "=Q"(*(__uint128_t *)pv) : "r"(l), "r"(h));
+        } else {
+            asm("0: ldxp %0, xzr, %1\n\t"
+                "stxp %w0, %2, %3, %1\n\t"
+                "cbnz %w0, 0b"
+                : "=&r"(t), "=Q"(*(__uint128_t *)pv) : "r"(l), "r"(h));
+        }
         return;
     }
 #elif defined(CONFIG_CMPXCHG128)
-- 
2.34.1

