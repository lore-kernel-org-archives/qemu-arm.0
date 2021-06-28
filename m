Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4036408lfg;
        Mon, 28 Jun 2021 07:08:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcnO6QLcwv2WNKMceEJ7IVj1jyWcyJ1fb3L5wliknEHaAoF18TY2zKjoY28JlrGFlWJ6fj
X-Received: by 2002:aa7:d801:: with SMTP id v1mr33408833edq.349.1624889325954;
        Mon, 28 Jun 2021 07:08:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624889325; cv=none;
        d=google.com; s=arc-20160816;
        b=IbPtnLitCdX8MhSU/xYvEu2C2AFwLuNjbWq2hWCEp3KuA+mt+L6FsqD0AsCK8uJjJq
         fk3ayw5ZcXVKnF1j5/i4Fjn3UPa2zjW09q+ZT4nA12LfzESmGl6ZDuykAjn/PtNuSyIK
         oIAvkemSS5OWO/pBC2aIWKDUrRoOfbgZGrpiFOeLVdFpp34KCY2kZH2Haet5B6ltJm9T
         vCO02NrzxSyvQZN3P7F36i64lG527sdRRZyMHxpLhpGLoUyDubGkNNnNmpaTyNdRkzzh
         bx3gg70AnHUgc7XQexu61WI16/y0DPRUMpecopIUrO7pUYwWaJVqYx3mW5mmr44NKz+K
         y31g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pPq5eB58a5EWRFVOrfeuahU03Jta2nUnTL0KzfUKX5I=;
        b=srudJas7N19988R7pbT9ZnVQYO1FdSL5J442lb/yyW/usBpoqgRRlrvUTeI3rR1sWH
         C3UlE8aIUAXYaCSdv3ukn8Dmu7TQDTEsMx09mM9hfSHnzo0JlC0irzwghF0qUARszYEa
         XAlWH0og7sZu82Hxnd4uUvuQf3PKGFjGdaAqnEg0XEL+MtuC94AGgEdXuYRzOaspkwXe
         pWppcFheeoULsRF3bOED0jNTjUZO8e3KaOBotD7k1d7FzQ6UOGDUgpNCWodhg5G1NJv9
         zQ0p9tT7OQX/in0Yuu8jAVF/iLl3rUhqSXoSrtD8T9BmnYOCxlxv8cjhoqVqpzHQqKvX
         hyZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ea9qgGwj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b18si8335959edd.151.2021.06.28.07.08.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 07:08:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ea9qgGwj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxrwK-0004Ao-PA
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 10:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmu-0003Gt-KD
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 09:59:00 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmk-00065m-NK
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 09:59:00 -0400
Received: by mail-wr1-x42a.google.com with SMTP id i94so21441663wri.4
 for <qemu-arm@nongnu.org>; Mon, 28 Jun 2021 06:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pPq5eB58a5EWRFVOrfeuahU03Jta2nUnTL0KzfUKX5I=;
 b=Ea9qgGwjOFY0ptg5UfPtQPGGkE0HwqcMepe9W3ALIJtJ8m2CCH6XEo2kivGVLjFedp
 le4jtzonyuEFMsQ4SlGqiF6k1h2JNdFuhHazXjAWNYp3KtMt4ORgV17Yif+4i7zuZQ7I
 rt1wxL9m5cJ5V3VStCR0KRSk/MEOw9jwmrfQcHKwnZcUqurwQeDYYA7A7MQaGSSqFQEn
 GVFQRd24jACRkRCHDgfO1etDdYJTWH0d/UsaI5jHcSk04Vw88OqcX9/Un0+/GEKg+NLh
 0SGzW2yI29zRkfdRK4OWelhwFX8wSGKv6QVbCvEMCgCEncKLrQvjPc3aH5BSqi/yXnrD
 IYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pPq5eB58a5EWRFVOrfeuahU03Jta2nUnTL0KzfUKX5I=;
 b=JgC+s2FIL1EaQw0kCheoFKN1R4g4cr5leyD0SLcqXBzh6onIMWdemxcqKfF2IpBn2N
 cFGLqLVyA7gy+EuGS+f7dgq03gCjrx/u/zQvYa22+kCh1Gu9j2m3N5VVtR2PLNt6SsoD
 6Ht8fGuXc0mG3Bi3kqXyjxyl1Lfzjaik2zDR7zxz4ulorFD/TrAhSjXbYl2F+VcZ+r6w
 /8XLDczk+3APJvaqDDSsZznPtazDkiNCTss/m2C0nzvwkPNSmCCJH0x8PpzKnsnMbRaj
 wHbkI3weZaNuUOwVPldCVpW22QKAVBs9gPMlkRUUHoKY9+yMCgMDhZ54jrHty4ZorvzA
 DKcQ==
X-Gm-Message-State: AOAM533HYnE38wfh0mHtUrcKTONIh322ETyf2yBmycYDGgEGGcwQz7LQ
 R/OZLOHrJ+kOzH9aVlDjuc5Mh/RP5ayFGvTc
X-Received: by 2002:a05:6000:246:: with SMTP id
 m6mr27273567wrz.116.1624888725778; 
 Mon, 28 Jun 2021 06:58:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d12sm12047627wri.77.2021.06.28.06.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 06:58:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 12/18] target/arm: Implement MVE saturating narrowing shifts
Date: Mon, 28 Jun 2021 14:58:29 +0100
Message-Id: <20210628135835.6690-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210628135835.6690-1-peter.maydell@linaro.org>
References: <20210628135835.6690-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6b89A96xGtUl

Implement the MVE saturating shift-right-and-narrow insns
VQSHRN, VQSHRUN, VQRSHRN and VQRSHRUN.

do_srshr() is borrowed from sve_helper.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  30 +++++++++++
 target/arm/mve.decode      |  28 ++++++++++
 target/arm/mve_helper.c    | 104 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  12 +++++
 4 files changed, 174 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 323ac07fa35..96b4c0dfd34 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -414,3 +414,33 @@ DEF_HELPER_FLAGS_4(mve_vrshrnbb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vrshrnbh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vrshrntb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vrshrnth, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqshrnb_sb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqshrnb_sh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqshrnt_sb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqshrnt_sh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqshrnb_ub, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqshrnb_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqshrnt_ub, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqshrnt_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqshrunbb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqshrunbh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqshruntb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqshrunth, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqrshrnb_sb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrshrnb_sh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrshrnt_sb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrshrnt_sh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqrshrnb_ub, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrshrnb_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrshrnt_ub, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrshrnt_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqrshrunbb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrshrunbh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrshruntb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrshrunth, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index e2c177f56a2..1d11387bc07 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -391,3 +391,31 @@ VRSHRNB           111 1 1110 1 . ... ... ... 0 1111 1 1 . 0 ... 1 @2_shr_b
 VRSHRNB           111 1 1110 1 . ... ... ... 0 1111 1 1 . 0 ... 1 @2_shr_h
 VRSHRNT           111 1 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 1 @2_shr_b
 VRSHRNT           111 1 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 1 @2_shr_h
+
+VQSHRNB_S         111 0 1110 1 . ... ... ... 0 1111 0 1 . 0 ... 0 @2_shr_b
+VQSHRNB_S         111 0 1110 1 . ... ... ... 0 1111 0 1 . 0 ... 0 @2_shr_h
+VQSHRNT_S         111 0 1110 1 . ... ... ... 1 1111 0 1 . 0 ... 0 @2_shr_b
+VQSHRNT_S         111 0 1110 1 . ... ... ... 1 1111 0 1 . 0 ... 0 @2_shr_h
+VQSHRNB_U         111 1 1110 1 . ... ... ... 0 1111 0 1 . 0 ... 0 @2_shr_b
+VQSHRNB_U         111 1 1110 1 . ... ... ... 0 1111 0 1 . 0 ... 0 @2_shr_h
+VQSHRNT_U         111 1 1110 1 . ... ... ... 1 1111 0 1 . 0 ... 0 @2_shr_b
+VQSHRNT_U         111 1 1110 1 . ... ... ... 1 1111 0 1 . 0 ... 0 @2_shr_h
+
+VQSHRUNB          111 0 1110 1 . ... ... ... 0 1111 1 1 . 0 ... 0 @2_shr_b
+VQSHRUNB          111 0 1110 1 . ... ... ... 0 1111 1 1 . 0 ... 0 @2_shr_h
+VQSHRUNT          111 0 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 0 @2_shr_b
+VQSHRUNT          111 0 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 0 @2_shr_h
+
+VQRSHRNB_S        111 0 1110 1 . ... ... ... 0 1111 0 1 . 0 ... 1 @2_shr_b
+VQRSHRNB_S        111 0 1110 1 . ... ... ... 0 1111 0 1 . 0 ... 1 @2_shr_h
+VQRSHRNT_S        111 0 1110 1 . ... ... ... 1 1111 0 1 . 0 ... 1 @2_shr_b
+VQRSHRNT_S        111 0 1110 1 . ... ... ... 1 1111 0 1 . 0 ... 1 @2_shr_h
+VQRSHRNB_U        111 1 1110 1 . ... ... ... 0 1111 0 1 . 0 ... 1 @2_shr_b
+VQRSHRNB_U        111 1 1110 1 . ... ... ... 0 1111 0 1 . 0 ... 1 @2_shr_h
+VQRSHRNT_U        111 1 1110 1 . ... ... ... 1 1111 0 1 . 0 ... 1 @2_shr_b
+VQRSHRNT_U        111 1 1110 1 . ... ... ... 1 1111 0 1 . 0 ... 1 @2_shr_h
+
+VQRSHRUNB         111 1 1110 1 . ... ... ... 0 1111 1 1 . 0 ... 0 @2_shr_b
+VQRSHRUNB         111 1 1110 1 . ... ... ... 0 1111 1 1 . 0 ... 0 @2_shr_h
+VQRSHRUNT         111 1 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 0 @2_shr_b
+VQRSHRUNT         111 1 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 0 @2_shr_h
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index a97942208ba..3e736e89095 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1362,5 +1362,109 @@ static inline uint64_t do_urshr(uint64_t x, unsigned sh)
     }
 }
 
+static inline int64_t do_srshr(int64_t x, unsigned sh)
+{
+    if (likely(sh < 64)) {
+        return (x >> sh) + ((x >> (sh - 1)) & 1);
+    } else {
+        /* Rounding the sign bit always produces 0. */
+        return 0;
+    }
+}
+
 DO_VSHRN_ALL(vshrn, DO_SHR)
 DO_VSHRN_ALL(vrshrn, do_urshr)
+
+static inline int32_t do_sat_bhs(int64_t val, int64_t min, int64_t max,
+                                 bool *satp)
+{
+    if (val > max) {
+        *satp = true;
+        return max;
+    } else if (val < min) {
+        *satp = true;
+        return min;
+    } else {
+        return val;
+    }
+}
+
+/* Saturating narrowing right shifts */
+#define DO_VSHRN_SAT(OP, TOP, ESIZE, TYPE, LESIZE, LTYPE, FN)   \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd,     \
+                                void *vm, uint32_t shift)       \
+    {                                                           \
+        LTYPE *m = vm;                                          \
+        TYPE *d = vd;                                           \
+        uint16_t mask = mve_element_mask(env);                  \
+        bool qc = false;                                        \
+        unsigned le;                                            \
+        for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) { \
+            bool sat = false;                                   \
+            TYPE r = FN(m[H##LESIZE(le)], shift, &sat);         \
+            mergemask(&d[H##ESIZE(le * 2 + TOP)], r, mask);     \
+            qc |= sat && (mask & 1 << (TOP * ESIZE));           \
+        }                                                       \
+        if (qc) {                                               \
+            env->vfp.qc[0] = qc;                                \
+        }                                                       \
+        mve_advance_vpt(env);                                   \
+    }
+
+#define DO_VSHRN_SAT_UB(BOP, TOP, FN)                           \
+    DO_VSHRN_SAT(BOP, false, 1, uint8_t, 2, uint16_t, FN)       \
+    DO_VSHRN_SAT(TOP, true, 1, uint8_t, 2, uint16_t, FN)
+
+#define DO_VSHRN_SAT_UH(BOP, TOP, FN)                           \
+    DO_VSHRN_SAT(BOP, false, 2, uint16_t, 4, uint32_t, FN)      \
+    DO_VSHRN_SAT(TOP, true, 2, uint16_t, 4, uint32_t, FN)
+
+#define DO_VSHRN_SAT_SB(BOP, TOP, FN)                           \
+    DO_VSHRN_SAT(BOP, false, 1, int8_t, 2, int16_t, FN)         \
+    DO_VSHRN_SAT(TOP, true, 1, int8_t, 2, int16_t, FN)
+
+#define DO_VSHRN_SAT_SH(BOP, TOP, FN)                           \
+    DO_VSHRN_SAT(BOP, false, 2, int16_t, 4, int32_t, FN)        \
+    DO_VSHRN_SAT(TOP, true, 2, int16_t, 4, int32_t, FN)
+
+#define DO_SHRN_SB(N, M, SATP)                                  \
+    do_sat_bhs((int64_t)(N) >> (M), INT8_MIN, INT8_MAX, SATP)
+#define DO_SHRN_UB(N, M, SATP)                                  \
+    do_sat_bhs((uint64_t)(N) >> (M), 0, UINT8_MAX, SATP)
+#define DO_SHRUN_B(N, M, SATP)                                  \
+    do_sat_bhs((int64_t)(N) >> (M), 0, UINT8_MAX, SATP)
+
+#define DO_SHRN_SH(N, M, SATP)                                  \
+    do_sat_bhs((int64_t)(N) >> (M), INT16_MIN, INT16_MAX, SATP)
+#define DO_SHRN_UH(N, M, SATP)                                  \
+    do_sat_bhs((uint64_t)(N) >> (M), 0, UINT16_MAX, SATP)
+#define DO_SHRUN_H(N, M, SATP)                                  \
+    do_sat_bhs((int64_t)(N) >> (M), 0, UINT16_MAX, SATP)
+
+#define DO_RSHRN_SB(N, M, SATP)                                 \
+    do_sat_bhs(do_srshr(N, M), INT8_MIN, INT8_MAX, SATP)
+#define DO_RSHRN_UB(N, M, SATP)                                 \
+    do_sat_bhs(do_urshr(N, M), 0, UINT8_MAX, SATP)
+#define DO_RSHRUN_B(N, M, SATP)                                 \
+    do_sat_bhs(do_srshr(N, M), 0, UINT8_MAX, SATP)
+
+#define DO_RSHRN_SH(N, M, SATP)                                 \
+    do_sat_bhs(do_srshr(N, M), INT16_MIN, INT16_MAX, SATP)
+#define DO_RSHRN_UH(N, M, SATP)                                 \
+    do_sat_bhs(do_urshr(N, M), 0, UINT16_MAX, SATP)
+#define DO_RSHRUN_H(N, M, SATP)                                 \
+    do_sat_bhs(do_srshr(N, M), 0, UINT16_MAX, SATP)
+
+DO_VSHRN_SAT_SB(vqshrnb_sb, vqshrnt_sb, DO_SHRN_SB)
+DO_VSHRN_SAT_SH(vqshrnb_sh, vqshrnt_sh, DO_SHRN_SH)
+DO_VSHRN_SAT_UB(vqshrnb_ub, vqshrnt_ub, DO_SHRN_UB)
+DO_VSHRN_SAT_UH(vqshrnb_uh, vqshrnt_uh, DO_SHRN_UH)
+DO_VSHRN_SAT_SB(vqshrunbb, vqshruntb, DO_SHRUN_B)
+DO_VSHRN_SAT_SH(vqshrunbh, vqshrunth, DO_SHRUN_H)
+
+DO_VSHRN_SAT_SB(vqrshrnb_sb, vqrshrnt_sb, DO_RSHRN_SB)
+DO_VSHRN_SAT_SH(vqrshrnb_sh, vqrshrnt_sh, DO_RSHRN_SH)
+DO_VSHRN_SAT_UB(vqrshrnb_ub, vqrshrnt_ub, DO_RSHRN_UB)
+DO_VSHRN_SAT_UH(vqrshrnb_uh, vqrshrnt_uh, DO_RSHRN_UH)
+DO_VSHRN_SAT_SB(vqrshrunbb, vqrshruntb, DO_RSHRUN_B)
+DO_VSHRN_SAT_SH(vqrshrunbh, vqrshrunth, DO_RSHRUN_H)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index f1a8f21b772..eef4f1f6ce3 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -926,3 +926,15 @@ DO_2SHIFT_N(VSHRNB, vshrnb)
 DO_2SHIFT_N(VSHRNT, vshrnt)
 DO_2SHIFT_N(VRSHRNB, vrshrnb)
 DO_2SHIFT_N(VRSHRNT, vrshrnt)
+DO_2SHIFT_N(VQSHRNB_S, vqshrnb_s)
+DO_2SHIFT_N(VQSHRNT_S, vqshrnt_s)
+DO_2SHIFT_N(VQSHRNB_U, vqshrnb_u)
+DO_2SHIFT_N(VQSHRNT_U, vqshrnt_u)
+DO_2SHIFT_N(VQSHRUNB, vqshrunb)
+DO_2SHIFT_N(VQSHRUNT, vqshrunt)
+DO_2SHIFT_N(VQRSHRNB_S, vqrshrnb_s)
+DO_2SHIFT_N(VQRSHRNT_S, vqrshrnt_s)
+DO_2SHIFT_N(VQRSHRNB_U, vqrshrnb_u)
+DO_2SHIFT_N(VQRSHRNT_U, vqrshrnt_u)
+DO_2SHIFT_N(VQRSHRUNB, vqrshrunb)
+DO_2SHIFT_N(VQRSHRUNT, vqrshrunt)
-- 
2.20.1

