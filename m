Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2080391lff;
        Mon, 14 Jun 2021 08:36:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMa4bOwfISY+Gyy2OTTdzsBCJe8F8WRB9vRlFkowCOsJoDTtkGNV7A6QBeKakMYIheJzs1
X-Received: by 2002:a05:600c:2194:: with SMTP id e20mr32530929wme.138.1623684998639;
        Mon, 14 Jun 2021 08:36:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623684998; cv=none;
        d=google.com; s=arc-20160816;
        b=z/5nYVvkyQyChPCFmjFBt3pjCMC08VoQ1oodog/OSti44kuhiWAEyPlF90eJlYTSwF
         SAlFOKjNkm7vB5mzvgpPk4+g0Nw7WlbtFrDqE+zQe8bTAcyyophBS0Ia0U6QLK4qJ7+t
         mGU7HlSoZ86IFzZSO9NkNMfJ0U0BaRVyR23XBd1Wh4erPz7XA4SIpA/dF4PuPCxfj5Hh
         O9ktaDI7gBp7bqDif/14zo6YOP7aIt9QuBYT6L1xBiui1ANqsH/SqslXRJh6xGbHBx6Z
         KrG5dBvQfVVuFFkXk0H3sEwecyU+veGkoDmRmu0tyl58SlzZ42EAjx+MKZzVNt4XTbjC
         6mXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sxk9aEcWsrkNaGzTWHfq+3pzeya3j328tVIrNxPC43g=;
        b=pFYa1VAPl0MoC97aybWqn5zZK6RDL7canZ2YSsAG0uow/NgEl9NwW972IjHEWGZ4HN
         MHl26fF27gFQLecXu5bzrBJGXV6FhX2HgMpNzmm2Re8S6idT5ffudGu9jZgc9AgEH/3u
         GIJ46rOmj7wza469LImdw2WznPGWIVZHJ3fGRRjsRS+QAGZxjsWkX5hKtPvLu0HwbfBB
         DA41Ej4Uiy9AdEO7VJMYb8w3vwwNuSGgBD7JJt4usRkfzs5SJ79/yHjhtvoyQmSw0rV7
         PqQQyXg3i8rT5deXrNzl2B/zctY3lWWyfxnT/Pzj5gXk6/dA306OFQPTZZmRWUK/H1QH
         D/Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NmqR7fll;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4si367455wmq.1.2021.06.14.08.36.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:36:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NmqR7fll;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsodh-00031z-Hb
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEp-0001ld-Cv
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:55 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:56100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEZ-0000Tj-QI
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:55 -0400
Received: by mail-wm1-x336.google.com with SMTP id g204so12320865wmf.5
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 08:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sxk9aEcWsrkNaGzTWHfq+3pzeya3j328tVIrNxPC43g=;
 b=NmqR7fll9yhgUXTjUhwP902uLMFP7UsGMU8tsItG+355f/GB28uGx7PmwRpRPBDeQ7
 X01xQEnV7oyN5w0uJNN5J4CCC63YkGGEUBFBvl6rVXRajvjfUqHqTkWAkWcalYuqi4kF
 Nnn8ftRxJMkaGTumZmot9xFjan34o9hbvb53Xok3YF6mQhfFTfKirAfYpHZ058/yJcZ1
 CSHD1Osf1tC+2SDuUK9rcLPnAV44J86YVGgjAhNixFry4juSOqFPKOMbqdsuSNeDkRB6
 YBFn4DeTQXqbm0bFIcc8OdlH9rb173B4yfs70eUItrKhLfvc335xrOY/9u9BQMWyUZyX
 5S5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sxk9aEcWsrkNaGzTWHfq+3pzeya3j328tVIrNxPC43g=;
 b=Q69nyqw+YM8FV5JWzO4WOIAhn/vNrUZz02dRYe8d767l/TMrWfzDpsX09DxCxs81jd
 cbk+4Xl1tFm4JEm1G8Zaeg8iJMyeyZNEVGrN8OO+1HMHu6TPpK7q4qdH2D786i3mKhZ+
 +9v8j2fA6gZ3fIV8KuRIoCgaRFWcv1zGKmHil3ybn23wxv8nVLF4q5fHRPZInfptmR0Z
 ss3D/8EtUpFGuXJ5TliyADy3urTN/zdPO3vF+mpxDTPLkeXGHn8vUlI1otyaJxVdi3it
 r/9rdOOJfIUrGW/6btWHfRMEiQOMN+fetXZwuF38UE43ogwMavFE2ET/2wcqE57ZBDuS
 fJFA==
X-Gm-Message-State: AOAM530iwd6gvH4BwL6G41jy6/Mvsgg/w0H45nv6+4Bjssk/lts+Iw6P
 9O7TJYcN93fg0F1nwyu9+ft69GgFImSgUw==
X-Received: by 2002:a7b:c002:: with SMTP id c2mr17055536wmb.118.1623683438415; 
 Mon, 14 Jun 2021 08:10:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 34/57] target/arm: Implement MVE VRMLALDAVH, VRMLSLDAVH
Date: Mon, 14 Jun 2021 16:09:44 +0100
Message-Id: <20210614151007.4545-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XYWJ2nuj+QjE

Implement the MVE VRMLALDAVH and VRMLSLDAVH insns, which accumulate
the results of a rounded multiply of pairs of elements into a 72-bit
accumulator, returning the top 64 bits in a pair of general purpose
registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      |  7 +++++++
 target/arm/mve_helper.c    | 37 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 24 ++++++++++++++++++++++++
 4 files changed, 76 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 7356385d60c..f9d4b242beb 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -157,3 +157,11 @@ DEF_HELPER_FLAGS_4(mve_vmlsldavsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlsldavsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlsldavxsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlsldavxsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+
+DEF_HELPER_FLAGS_4(mve_vrmlaldavhsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+DEF_HELPER_FLAGS_4(mve_vrmlaldavhxsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+
+DEF_HELPER_FLAGS_4(mve_vrmlaldavhuw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+
+DEF_HELPER_FLAGS_4(mve_vrmlsldavhsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+DEF_HELPER_FLAGS_4(mve_vrmlsldavhxsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 1be2d6b270f..ac68f072bbe 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -143,7 +143,14 @@ VDUP             1110 1110 1 0 10 ... 0 .... 1011 . 0 0 1 0000 @vdup size=2
 
 @vmlaldav        .... .... . ... ... . ... . .... .... qm:3 . \
                  qn=%qn rdahi=%rdahi rdalo=%rdalo size=%size_16 &vmlaldav
+@vmlaldav_nosz   .... .... . ... ... . ... . .... .... qm:3 . \
+                 qn=%qn rdahi=%rdahi rdalo=%rdalo size=0 &vmlaldav
 VMLALDAV_S       1110 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 0 @vmlaldav
 VMLALDAV_U       1111 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 0 @vmlaldav
 
 VMLSLDAV         1110 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 1 @vmlaldav
+
+VRMLALDAVH_S     1110 1110 1 ... ... 0 ... x:1 1111 . 0 a:1 0 ... 0 @vmlaldav_nosz
+VRMLALDAVH_U     1111 1110 1 ... ... 0 ... x:1 1111 . 0 a:1 0 ... 0 @vmlaldav_nosz
+
+VRMLSLDAVH       1111 1110 1 ... ... 0 ... x:1 1110 . 0 a:1 0 ... 1 @vmlaldav_nosz
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index bc9f053219f..c7e7500e877 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/int128.h"
 #include "cpu.h"
 #include "internals.h"
 #include "vec_internal.h"
@@ -542,3 +543,39 @@ DO_LDAV(vmlsldavsh, 2, int16_t, false, +=, -=)
 DO_LDAV(vmlsldavxsh, 2, int16_t, true, +=, -=)
 DO_LDAV(vmlsldavsw, 4, int32_t, false, +=, -=)
 DO_LDAV(vmlsldavxsw, 4, int32_t, true, +=, -=)
+
+/*
+ * Rounding multiply add long dual accumulate high: we must keep
+ * a 72-bit internal accumulator value and return the top 64 bits.
+ */
+#define DO_LDAVH(OP, ESIZE, TYPE, XCHG, EVENACC, ODDACC, TO128)         \
+    uint64_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vn,         \
+                                    void *vm, uint64_t a)               \
+    {                                                                   \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        TYPE *n = vn, *m = vm;                                          \
+        Int128 acc = int128_lshift(TO128(a), 8);                        \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            if (mask & 1) {                                             \
+                if (e & 1) {                                            \
+                    acc = ODDACC(acc, TO128(n[H##ESIZE(e - 1 * XCHG)] * \
+                                            m[H##ESIZE(e)]));           \
+                } else {                                                \
+                    acc = EVENACC(acc, TO128(n[H##ESIZE(e + 1 * XCHG)] * \
+                                             m[H##ESIZE(e)]));          \
+                }                                                       \
+                acc = int128_add(acc, 1 << 7);                          \
+            }                                                           \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+        return int128_getlo(int128_rshift(acc, 8));                     \
+    }
+
+DO_LDAVH(vrmlaldavhsw, 4, int32_t, false, int128_add, int128_add, int128_makes64)
+DO_LDAVH(vrmlaldavhxsw, 4, int32_t, true, int128_add, int128_add, int128_makes64)
+
+DO_LDAVH(vrmlaldavhuw, 4, uint32_t, false, int128_add, int128_add, int128_make64)
+
+DO_LDAVH(vrmlsldavhsw, 4, int32_t, false, int128_add, int128_sub, int128_makes64)
+DO_LDAVH(vrmlsldavhxsw, 4, int32_t, true, int128_add, int128_sub, int128_makes64)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 150e4d0235f..9767a2306f3 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -472,3 +472,27 @@ static bool trans_VMLSLDAV(DisasContext *s, arg_vmlaldav *a)
     };
     return do_long_dual_acc(s, a, fns[a->size][a->x]);
 }
+
+static bool trans_VRMLALDAVH_S(DisasContext *s, arg_vmlaldav *a)
+{
+    static MVEGenDualAccOpFn * const fns[] = {
+        gen_helper_mve_vrmlaldavhsw, gen_helper_mve_vrmlaldavhxsw,
+    };
+    return do_long_dual_acc(s, a, fns[a->x]);
+}
+
+static bool trans_VRMLALDAVH_U(DisasContext *s, arg_vmlaldav *a)
+{
+    static MVEGenDualAccOpFn * const fns[] = {
+        gen_helper_mve_vrmlaldavhuw, NULL,
+    };
+    return do_long_dual_acc(s, a, fns[a->x]);
+}
+
+static bool trans_VRMLSLDAVH(DisasContext *s, arg_vmlaldav *a)
+{
+    static MVEGenDualAccOpFn * const fns[] = {
+        gen_helper_mve_vrmlsldavhsw, gen_helper_mve_vrmlsldavhxsw,
+    };
+    return do_long_dual_acc(s, a, fns[a->x]);
+}
-- 
2.20.1

