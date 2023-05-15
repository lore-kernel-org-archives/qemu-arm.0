Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6571306ejq;
        Mon, 15 May 2023 07:59:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7W44AhpPXc4fBiKZ+Y3I6zR0h/4iEfGz50lbQUl3jG0NeGC4ClqQnjZxIGX9sLqqDHtrq/
X-Received: by 2002:a05:6214:2aac:b0:621:2687:d202 with SMTP id js12-20020a0562142aac00b006212687d202mr37091336qvb.15.1684162789500;
        Mon, 15 May 2023 07:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684162789; cv=none;
        d=google.com; s=arc-20160816;
        b=NofrUlmhQ1+votJWFKsL90uId0NFvaDdaNI2ccVPot/UqQxK8sausgm+0gETmc4TZj
         00afGYYNp62aHFXSBKS2TxpwXCgY3XN8lbNZ/HhJjhOG2iyEH4VgTmwjlYQYc85m6Am1
         ABUH+zVIVJOebHoXRjdrrpjfhfj+jpuAKA1yX40IQDIFunJOij0a+KeitmgFxH8c++Ni
         MU4prFGEmbDqAUAUKUDcsOUBrjyxdWEvZQQkGoLZqFwrTlXVDhIeN3AqpauROBzqpYm3
         9l3iCTt2A0KRSC5VdcWm2InN3fNxAi/UyYCSPjNjN3zy/XyD62dHV9gE3BZNx9HYfLAq
         8vLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DMoWoQ65Io3QGIn4AARUwI/lV3SXmcaQgibucuZllj0=;
        b=CJkIaTB73B8iTrF8uuoTKqECBmuM+LAqw8XP8lwe4md/CDbVQV1eIhiSDqEcjJi15G
         Xxx7G6Uv2sDMi2sqolMqlntl1I4TPaQjmmvWDMor86PuD51Bk2WSAZLqvVagw9qV+Due
         tI7JvO/30QcEfvO0KuqP7TxyMVZ4r4QWzgq21AVPfXKCM4ky3woo0pCCGrmLmd3+57Cp
         SoYZpcn1LypjU9eHWQd5NOB5QhcaGWSnuuEuYqB7k4FA0B3huLE+N16Tq1Hzz1mLdVfk
         3aIWDcRKx2TplL4Pe2KfJ3W6yCNjgN3huSJcQ3t4Opy8AqfQFcZDAIOsHC+0YS4wNrCU
         Cgvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iFPd+TIF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p23-20020a05620a133700b00759139c6d89si24291qkj.100.2023.05.15.07.59.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 07:59:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iFPd+TIF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyZIc-0000Rh-E9; Mon, 15 May 2023 10:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHS-0006xc-Ga
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:34:36 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGT-0004ph-4t
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:33:40 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1aaf21bb427so91449135ad.1
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 07:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161207; x=1686753207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DMoWoQ65Io3QGIn4AARUwI/lV3SXmcaQgibucuZllj0=;
 b=iFPd+TIF2ky4pI0KR/xAtEw8XBlXrQnDOhq7Rpm2BD88C6AnIOBLbMOconYCQ5s9f9
 OYUt2UxfEGWceiTNmOhFe80Ql/Ws7Mo5uONbYVyz6cRYOUXCPCoIYZayCtz5mbl8KqJs
 YSwQQXKuW9YLIgw0Pf/YRBDhAXpDOI9bky8Q6m3icKjGhRPYoToxEEtT7/wWoJRR6NEJ
 MwftKv/dzEU0o0/jxqekloG+9zkPWjpxwVVFkpgTUTDpv8/sdxOwoWFeSE9MQ60ExIYR
 1wt/jHvPJoQDfal8AryeOOIr9kQYTHIk81AEUf5SWDO8OKzYj6Ra6LrcllYv1w4/Dxlz
 3mXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161207; x=1686753207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DMoWoQ65Io3QGIn4AARUwI/lV3SXmcaQgibucuZllj0=;
 b=a2Jg2Jl+Z8lPcOVxIwtEJNl5/M8LJtI5Err5HhHz1SgoQd/li7YN/L1/o6/1AER4mk
 jVGBRSLfWrmEE7ITLh8xA7/3H5miAA+o3C/lNNr4sj+4SPQUVmXWv+N1IOmhMvuQcgj0
 m1lJyXhh4oQJnPX3a3ngykS0HZRoFAA1bcMRfszztFf91bl3rHOEmCJcfxBEA2m+Dm6k
 hXhnjFkzNXFVtbn9W7QkmG2TRHjSkcL7Ng16IOwMK+RDTGhLankMlLs2/429iMTfWu5E
 mnYL/29iY4jg4obV8q4SnmMhd3KW3QZpmYBTAis+XKIYM6dPGEaxGs39xrxsXf0j5z7r
 35jQ==
X-Gm-Message-State: AC+VfDzzGymAQJqQcdXsO+NWOGNTkfSzwP5GOYcgF3ps0/YTPk2iXykp
 U8eQr4Wb5yIWdsv7G4a+u2uZ5g==
X-Received: by 2002:a17:903:22cd:b0:1a2:19c1:a974 with SMTP id
 y13-20020a17090322cd00b001a219c1a974mr41100139plg.68.1684161206843; 
 Mon, 15 May 2023 07:33:26 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v5 14/54] accel/tcg: Add have_lse2 support in ldst_atomicity
Date: Mon, 15 May 2023 07:32:33 -0700
Message-Id: <20230515143313.734053-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
X-TUID: 0pKxcSLbDw8u

Add fast paths for FEAT_LSE2, using the detection in tcg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/ldst_atomicity.c.inc | 37 ++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
index c3b2b35823..baa935ab8b 100644
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
@@ -186,6 +190,14 @@ load_atomic16(void *pv)
 
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
 
@@ -428,6 +440,18 @@ load_atom_extract_al16_or_al8(void *pv, int s)
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
@@ -783,10 +807,15 @@ store_atomic16(void *pv, Int128Alias val)
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

