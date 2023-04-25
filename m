Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3720258ejm;
        Tue, 25 Apr 2023 12:42:11 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zr9NUmSZI+B8CCEZLRoApwn2mqudnBCDLoLVFU0LVuq/5U+GBqvfPkK3UtoHh6SXFVlgWx
X-Received: by 2002:a05:622a:40d:b0:3d2:7f3b:c691 with SMTP id n13-20020a05622a040d00b003d27f3bc691mr33969264qtx.47.1682451731493;
        Tue, 25 Apr 2023 12:42:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682451731; cv=none;
        d=google.com; s=arc-20160816;
        b=DblyVG5ZLJeTuoEIEfpQakAGPuuG5ujL2Zk5RxY5+vYzc/Aow4ZKCDiwEKC2BHjbAz
         7yv697r91ShjGkW6n2gkJ2Ap6A4XDEFOMbT2CaC65kduzTHYVamMHCI7DLZ1FC+hOXbW
         qw88drWaYhq/Nu15IIbh5CeNf2KZgb42vfqsD1HJp9T91CLe3dkDaqeBEl+hRO+Tu/Yv
         K32WBK7RUEx2KigYArPtPIfpolMtfJ6yDONRTI08UeIuViV/Eqw/YVMpImi4YmgD90xL
         rXrhsrkOhv0oCcnJr7cjV48gAJfYLmIZh6kve+IyqIArY0yNw+mDlSFwpJT+Vrm4Bs7U
         85/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nOmbSp7hBydjLoN7MiEgB21hH67bcjILkQNA+Q9UF3g=;
        b=xX6nWJGBZ88wpdYmAOtO1z/qZY9Vzj604obIhlvAsZNJGC5hb8UhiDVrwxmtfKDvPq
         ITtjBtr4Fmw++1OPMXrEDwOzsjXgFDmh0xhWPepkFYM2bg5ZBMTfD2TQAS0843tTzKAD
         dRVeFzSYAZSSQ+GnwE4V1WgdVazL8mTvIUTdoaZYvb6QFTfNHS3K5mqs7e6CAdGDZII3
         RjmmzTAGqxDhwiyeRfWCxxsroa/+FADIPjmT8RXGYI4GPed1EUdwHcNEHIp21GFEB3sq
         0YII6BEHYbdf4p8rQ6U5nH56XUvaPFYGDkGCvjmFg7SEQGzIYLvD7RInCubzfU947EHm
         rWXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="caSHb/VR";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d20-20020a05622a15d400b003bfc37f6c5asi9348382qty.189.2023.04.25.12.42.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 12:42:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="caSHb/VR";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prOQo-0003lE-DQ; Tue, 25 Apr 2023 15:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQj-0003Yw-J7
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:34:25 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQW-0004lJ-KV
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:34:25 -0400
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2a7b02615f1so61479821fa.0
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 12:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451251; x=1685043251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nOmbSp7hBydjLoN7MiEgB21hH67bcjILkQNA+Q9UF3g=;
 b=caSHb/VRtHNv1oSEGjjimxXApRFD+9t42CO5NfLoqxjnra7/Gg9fWA5IXD4c1DXFzG
 zvp56NU+N877FbfQ/ZqYE+jpixC0Ko0qXy9VSNIgAUYhnS1cIXr928znPKA1/G0utwkk
 z60Kq5qr7xhrZUKHY5T7GcAv3jTgRRWCbo8VnGrJy+CJEP00H4fE1G/FaBnngvyGML0i
 ZyFckwKsUOHDNzQPEpyvUZvtfxI4k2uCIzJC1YFqAYHCcsHna8MG4LLsffOOj+CAxmtA
 vxnR55kznfjVvd9HzrZIeTdHjv3M38blx6ffm+EzpOQwkjFdJLzXjdY0wuY0J4qXqIAm
 oijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451251; x=1685043251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nOmbSp7hBydjLoN7MiEgB21hH67bcjILkQNA+Q9UF3g=;
 b=M007mVDgVkK8JDCLmiXr81LqDqPwM4UWd5cPsffG7yEKsdYPGfmrremi72YnFKheM4
 9AyoYVpN3F+BDAOG4buTL9q24qaNrJhZL2J6s8gd1wnAOtm9YprDY0FTl/8/PLEq+gab
 8QwNDAhdfx/SEOJ6VjxtcYJ5PQAi/mZKHKv4i3RnF7Fz2hlMxabcXAqI0w+txWLN/XmJ
 ncIafEZdgAaIUgc39strAEyX4J+m90aZbAXJAfD4G3e9670hp9QLZb0GWmI11SUsmX+v
 +ipecJQQ4KU9Ibhp7Edu7Ex1ddv3LVpuxKNlT75HnKPVALywA7nBhGvtuXxeL6hJPi3R
 5Q1g==
X-Gm-Message-State: AAQBX9fKpLpyLFN0Bz7MEEdghk5VxQVlF6a+3n1ty50UQwhBFNy1hcdG
 da8hRXeqY1dDn/pD8aQRE2oZ5g==
X-Received: by 2002:a2e:3213:0:b0:2a8:e642:8cdb with SMTP id
 y19-20020a2e3213000000b002a8e6428cdbmr3582700ljy.49.1682451250716; 
 Tue, 25 Apr 2023 12:34:10 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 19/57] accel/tcg: Add have_lse2 support in ldst_atomicity
Date: Tue, 25 Apr 2023 20:31:08 +0100
Message-Id: <20230425193146.2106111-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x231.google.com
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
X-TUID: dBEW+P0B/HKc

Add fast paths for FEAT_LSE2, using the detection in tcg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/ldst_atomicity.c.inc | 37 ++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
index cf4a0e4a6e..4c4287c8c9 100644
--- a/accel/tcg/ldst_atomicity.c.inc
+++ b/accel/tcg/ldst_atomicity.c.inc
@@ -41,6 +41,8 @@
  * but we're using tcg/tci/ instead.
  */
 # define HAVE_al16_fast    false
+#elif defined(__aarch64__)
+# define HAVE_al16_fast    likely(have_lse2)
 #elif defined(__x86_64__)
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
 #elif defined(__x86_64__)
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
 #elif defined(__x86_64__)
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

