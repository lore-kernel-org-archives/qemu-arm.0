Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp471620lfg;
        Fri, 30 Apr 2021 13:33:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1jB9mWwp9aGu+HwSPzSY5u5clMvwsTPLLTGDCXRxPzg0Ulyl7Fpk/QuK+xIpegh7Ttdih
X-Received: by 2002:a6b:cdc6:: with SMTP id d189mr5131354iog.46.1619814839456;
        Fri, 30 Apr 2021 13:33:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619814839; cv=none;
        d=google.com; s=arc-20160816;
        b=pOiqF7V5bQxYENDPykSs6727GZ62TTWk9eWV3HBKxNholuLOsrtAXW4ozDi/ppDbfp
         5kbRZuHzzsg00QMFoSLmGtFOPw31MsWlTCW70S7gfXepgDD0fXxxvqRERx8CKMxx5NYT
         Ouua/G7qRet7/3H+oYaLYy3iKBRBXoxiyt2JLOo0pzBgNeGHR3yppZ0V0eXo7WjL41lv
         Mw4Csew7UAf7/f8HA0I2+YSUvYW/FBEv2DDorJFSq89ijBqPRJMbC625ZdDtptGh+4SL
         gVjyoWPBWLkgl/h+Au6DI8BKfZ1uY+O3u/tZcBMDHwxpw5szw/rhKjdhpZdhksCFEcyg
         dRlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/Nra4WlEPuo4eXKLzm+7jMvvLTFMwTtBD/ofu/WPZv8=;
        b=HPYVvgETMS++o1lnqDY7oGz+VgLBro5otd+Vz6/BaivIuJVX/wh+0dnOkzh7lciHp3
         Ge77lfUYyZrwDhqECCMoPvXjPu+/UCFX0tgqOpLW+E1P32oMWTBhyu267tbodyaIcQxT
         adpf3Chq+R5XskPwbtYgZAHMAbI/lVtqwgWv3NkQzgolJZEZ6kdYXz185S8I5ayW45kr
         i4Y3a5R21fhCP9w1vUPWaTUzNNqFCTxXP8gRz42wqEy28PTmGbbuZw2lQptSdxfZYiKp
         2RjOLl0XAlcEGDTtcP/4lNROEd4+2SYV3WyUxOWEYKHmitc8qxsqubgVFs2x1MXecHPe
         9eUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kAOKpz7I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d18si3004595ilo.12.2021.04.30.13.33.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 13:33:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kAOKpz7I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcZpl-0006yO-4d
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 16:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiR-0008IU-Pn
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:26:23 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:46665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiL-0005xW-Ng
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:26:23 -0400
Received: by mail-pl1-x62d.google.com with SMTP id s20so21390646plr.13
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Nra4WlEPuo4eXKLzm+7jMvvLTFMwTtBD/ofu/WPZv8=;
 b=kAOKpz7IqZYgLuYBNmsAKQv0O34OmDTL40kRlsMmQ7Fa1geIWJwKkDO68udOFD7VW4
 +G0H7h8xAHzfM2Uw8gZMx9VnGFxqbvFSWMFYbz8cnPniiOoHrP8ZStdm4mu/vDipBdPr
 7wqHgxREuoSJPMb3sxvdQg5DFDnznrXX9x/OHnYrqtx0ot3SmXH8h2fL3nBP8x5k3Qp4
 eGJAzhnaFLslJfG4a2kb1gXA9qbhA9bPLhHrxFbhc65jQpJYd/uK512kyINWTugY7qQL
 ms7obOxyMhNKrwSlzF8Wssw5AUygQ+rJyTQK1AdQTPPkTWK6gXiOO3DgwRtbqOrxIWbV
 TqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Nra4WlEPuo4eXKLzm+7jMvvLTFMwTtBD/ofu/WPZv8=;
 b=Sg2KXJU2ocwl6VQ/IF3Q+mvPURrqTV5YIZZSVv4uzfY3lkMP8ivI3gW32oRpMhZAWq
 ichpxlTIt/0gF56n73w3MyGoP0f3H2ZhxzJpJRA18fZJpcbih7efXlzsXzOueYGC0D1T
 kw/YGV/Ns59jAajAQvT3nuijPaGr4xHBEAe18eqbTfgvY72GJ8s9lTWLzwV64I+CG0ZG
 OFnA7BO8wtcNTVbYYBSLqC8LKZIH7mjcDgDWQBAV7OopN2RiJxQjhDQf9/4oc+RXuUGU
 Vj+1GxywszbQ0UgcW/c9D4fY2i0TDGkG9NFp00206SNZ7DahrSvzxGExzKLQchU5MzaD
 oN/Q==
X-Gm-Message-State: AOAM531427HWchjj013koO+x+G1tBSZ2O9hjVCzLUK1rl/62Umcwn0yB
 t9+Zdeqf4VVpZxt3iRk3D6FRfQ==
X-Received: by 2002:a17:90b:1bcd:: with SMTP id
 oa13mr15773368pjb.22.1619814376242; 
 Fri, 30 Apr 2021 13:26:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 08/82] target/arm: Implement SVE2 integer pairwise
 arithmetic
Date: Fri, 30 Apr 2021 13:24:56 -0700
Message-Id: <20210430202610.1136687-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nYposUbUmbPo

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Load all inputs before writing any output (laurent desnogues)
---
 target/arm/helper-sve.h    | 45 ++++++++++++++++++++++
 target/arm/sve.decode      |  8 ++++
 target/arm/sve_helper.c    | 76 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c |  6 +++
 4 files changed, 135 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 5fdc0d223a..09bc067dd4 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -326,6 +326,51 @@ DEF_HELPER_FLAGS_5(sve_sel_zpzz_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve_sel_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve2_addp_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_addp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_addp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_addp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_smaxp_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smaxp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smaxp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smaxp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_umaxp_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umaxp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umaxp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umaxp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sminp_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sminp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sminp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sminp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uminp_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uminp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uminp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uminp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_asr_zpzw_b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_asr_zpzw_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 58c3f7ede4..61a3321325 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1140,3 +1140,11 @@ SRHADD          01000100 .. 010 100 100 ... ..... .....  @rdn_pg_rm
 URHADD          01000100 .. 010 101 100 ... ..... .....  @rdn_pg_rm
 SHSUB           01000100 .. 010 110 100 ... ..... .....  @rdm_pg_rn # SHSUBR
 UHSUB           01000100 .. 010 111 100 ... ..... .....  @rdm_pg_rn # UHSUBR
+
+### SVE2 integer pairwise arithmetic
+
+ADDP            01000100 .. 010 001 101 ... ..... .....  @rdn_pg_rm
+SMAXP           01000100 .. 010 100 101 ... ..... .....  @rdn_pg_rm
+UMAXP           01000100 .. 010 101 101 ... ..... .....  @rdn_pg_rm
+SMINP           01000100 .. 010 110 101 ... ..... .....  @rdn_pg_rm
+UMINP           01000100 .. 010 111 101 ... ..... .....  @rdn_pg_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 3703b96eb4..7cc559d950 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -681,6 +681,82 @@ DO_ZPZZ_D(sve2_uhsub_zpzz_d, uint64_t, DO_HSUB_D)
 #undef DO_ZPZZ
 #undef DO_ZPZZ_D
 
+/*
+ * Three operand expander, operating on element pairs.
+ * If the slot I is even, the elements from from VN {I, I+1}.
+ * If the slot I is odd, the elements from from VM {I-1, I}.
+ * Load all of the input elements in each pair before overwriting output.
+ */
+#define DO_ZPZZ_PAIR(NAME, TYPE, H, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc) \
+{                                                               \
+    intptr_t i, opr_sz = simd_oprsz(desc);                      \
+    for (i = 0; i < opr_sz; ) {                                 \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));         \
+        do {                                                    \
+            TYPE n0 = *(TYPE *)(vn + H(i));                     \
+            TYPE m0 = *(TYPE *)(vm + H(i));                     \
+            TYPE n1 = *(TYPE *)(vn + H(i + sizeof(TYPE)));      \
+            TYPE m1 = *(TYPE *)(vm + H(i + sizeof(TYPE)));      \
+            if (pg & 1) {                                       \
+                *(TYPE *)(vd + H(i)) = OP(n0, n1);              \
+            }                                                   \
+            i += sizeof(TYPE), pg >>= sizeof(TYPE);             \
+            if (pg & 1) {                                       \
+                *(TYPE *)(vd + H(i)) = OP(m0, m1);              \
+            }                                                   \
+            i += sizeof(TYPE), pg >>= sizeof(TYPE);             \
+        } while (i & 15);                                       \
+    }                                                           \
+}
+
+/* Similarly, specialized for 64-bit operands.  */
+#define DO_ZPZZ_PAIR_D(NAME, TYPE, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc) \
+{                                                               \
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;                  \
+    TYPE *d = vd, *n = vn, *m = vm;                             \
+    uint8_t *pg = vg;                                           \
+    for (i = 0; i < opr_sz; i += 2) {                           \
+        TYPE n0 = n[i], n1 = n[i + 1];                          \
+        TYPE m0 = m[i], m1 = m[i + 1];                          \
+        if (pg[H1(i)] & 1) {                                    \
+            d[i] = OP(n0, n1);                                  \
+        }                                                       \
+        if (pg[H1(i + 1)] & 1) {                                \
+            d[i + 1] = OP(m0, m1);                              \
+        }                                                       \
+    }                                                           \
+}
+
+DO_ZPZZ_PAIR(sve2_addp_zpzz_b, uint8_t, H1_2, DO_ADD)
+DO_ZPZZ_PAIR(sve2_addp_zpzz_h, uint16_t, H1_2, DO_ADD)
+DO_ZPZZ_PAIR(sve2_addp_zpzz_s, uint32_t, H1_4, DO_ADD)
+DO_ZPZZ_PAIR_D(sve2_addp_zpzz_d, uint64_t, DO_ADD)
+
+DO_ZPZZ_PAIR(sve2_umaxp_zpzz_b, uint8_t, H1_2, DO_MAX)
+DO_ZPZZ_PAIR(sve2_umaxp_zpzz_h, uint16_t, H1_2, DO_MAX)
+DO_ZPZZ_PAIR(sve2_umaxp_zpzz_s, uint32_t, H1_4, DO_MAX)
+DO_ZPZZ_PAIR_D(sve2_umaxp_zpzz_d, uint64_t, DO_MAX)
+
+DO_ZPZZ_PAIR(sve2_uminp_zpzz_b, uint8_t, H1_2, DO_MIN)
+DO_ZPZZ_PAIR(sve2_uminp_zpzz_h, uint16_t, H1_2, DO_MIN)
+DO_ZPZZ_PAIR(sve2_uminp_zpzz_s, uint32_t, H1_4, DO_MIN)
+DO_ZPZZ_PAIR_D(sve2_uminp_zpzz_d, uint64_t, DO_MIN)
+
+DO_ZPZZ_PAIR(sve2_smaxp_zpzz_b, int8_t, H1_2, DO_MAX)
+DO_ZPZZ_PAIR(sve2_smaxp_zpzz_h, int16_t, H1_2, DO_MAX)
+DO_ZPZZ_PAIR(sve2_smaxp_zpzz_s, int32_t, H1_4, DO_MAX)
+DO_ZPZZ_PAIR_D(sve2_smaxp_zpzz_d, int64_t, DO_MAX)
+
+DO_ZPZZ_PAIR(sve2_sminp_zpzz_b, int8_t, H1_2, DO_MIN)
+DO_ZPZZ_PAIR(sve2_sminp_zpzz_h, int16_t, H1_2, DO_MIN)
+DO_ZPZZ_PAIR(sve2_sminp_zpzz_s, int32_t, H1_4, DO_MIN)
+DO_ZPZZ_PAIR_D(sve2_sminp_zpzz_d, int64_t, DO_MIN)
+
+#undef DO_ZPZZ_PAIR
+#undef DO_ZPZZ_PAIR_D
+
 /* Three-operand expander, controlled by a predicate, in which the
  * third operand is "wide".  That is, for D = N op M, the same 64-bit
  * value of M is used with all of the narrower values of N.
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 43690999ab..2d449c9b57 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5957,3 +5957,9 @@ DO_SVE2_ZPZZ(SHSUB, shsub)
 DO_SVE2_ZPZZ(UHADD, uhadd)
 DO_SVE2_ZPZZ(URHADD, urhadd)
 DO_SVE2_ZPZZ(UHSUB, uhsub)
+
+DO_SVE2_ZPZZ(ADDP, addp)
+DO_SVE2_ZPZZ(SMAXP, smaxp)
+DO_SVE2_ZPZZ(UMAXP, umaxp)
+DO_SVE2_ZPZZ(SMINP, sminp)
+DO_SVE2_ZPZZ(UMINP, uminp)
-- 
2.25.1

