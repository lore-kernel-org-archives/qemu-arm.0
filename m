Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp730298lfr;
        Fri, 16 Apr 2021 14:10:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxV7s7oCi9d1X4vKfcq7FoCaJYm1ZTodVgK9Uu7JeqbAWWqqFaJfi3RfaYnkLWauHTQGkp
X-Received: by 2002:a05:6602:1594:: with SMTP id e20mr4937470iow.95.1618607406930;
        Fri, 16 Apr 2021 14:10:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618607406; cv=none;
        d=google.com; s=arc-20160816;
        b=miyaT0S3Qy7fG9loYqKUjVcqOegDGeClaxaSiEAloX46mV4g9yQ7h2PZuEsupNEkrU
         UWSBDzRFyUWlD0Yd1sch/j2fJ0MnfmX55g8YbouhiG3fYGAjCl+pvB6KCeDzUUvatUWM
         b6/u5qpMtAlOKfppLKAcKlIbEJakFqSbHDE8n3wVUBSM/CNOcORphTMwj4oK3bX2xHGJ
         wEPnFPQdpWqkbx1qKp5COjsMg2/sdCrLY1uDmV2FOq8n05RpWjUlWQAAQOOvNUGgKCt2
         bNtAmcIgpnk4U3IewWKuB5rEl//vOTYXApZmy4/bPZz3XbdE5gnJfdt2CS4jjPxdnD69
         W5aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/Nra4WlEPuo4eXKLzm+7jMvvLTFMwTtBD/ofu/WPZv8=;
        b=w1JfudA+MN/Zztbe5AOpPzbyw09dTqJuJaFVVNzU0JvQtxvCU32yb7PhJ8YiJvd8v1
         81QHOPDTFiPN0IdRBGuviEt5r+N5E6pX/NN3IB3nzuuidjoAZqw05+rL3eEgirD8LX1A
         BvzBBfmLzbBAGnTMAeHa4DscH9gO5xWH+4FHRWfqVOfZ1ngMAMK/k+K4C4/CfszgvIlg
         YrjvzU4j159bAla6z/GVU77ZGY0T7mUMg3/H62a03gSI1Lx/Rj/WcZLGCLHZ+zX93U8u
         GCqEN79447Dc2cGXERU9qSqF369pKWDL3GPvxDZwuSl1nXSgTa+XdHiz0eDypPqaXTP/
         uAbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vvzBfGJX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3si8234495jaj.74.2021.04.16.14.10.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:10:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vvzBfGJX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXVj4-0004xt-4r
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVc7-00045Y-I3
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:02:55 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:37775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVc4-00012v-Kn
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:02:55 -0400
Received: by mail-pl1-x632.google.com with SMTP id h20so14640064plr.4
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Nra4WlEPuo4eXKLzm+7jMvvLTFMwTtBD/ofu/WPZv8=;
 b=vvzBfGJX8y8JN+38B4ANF032uMOhiBH8HqFcqfIlvdnqOdGW3f3VEYyMfyqL8RGHFZ
 1vqUP/7UAMgG/JdZEG6LWhLcKLsICIvRlvF61ocUL0e32UuysHl4eEbDDTjy81W6yi8y
 3rNhJQd7GU+1pxJdrXrNboMC4kwuUqhmpYWHuE8PaUi6IczsB1MUZ+moush4rNoy21sI
 ti7ylGPD+cMTNUWrL4zFSssSZid6AE9gyf/vhzZTRrNNHH0VL9enTmxLR23EZtYhze72
 r8wJnoHkRn+LvZu8RcfqO2atXIMDxGg2m68wUqFURU6GbCF6/R43YxnwJeX1pIACvqVR
 7few==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Nra4WlEPuo4eXKLzm+7jMvvLTFMwTtBD/ofu/WPZv8=;
 b=Saua8QYC5OajhH5dXet9+HDd7VFfk6NxTCmIBEJC2qkXeCC8pLcplU0fRUA2JeR0hS
 XuVL18hN6BYuWsMTBtwl4StwXMdTFEnz+LgpOxPwk3CBO2BO/flxqYGCMMottA7uv1Xy
 COlv8k2OORXUD5jeVGTUEuChB70rYtqCNSkb9i/2ughifoP6jIscml37iNuxZquxBHlX
 hEj66nIgWuRAal4Zm/rVn6Vo94PIDBYKQVWqenICEUA5VmJGSCihpNXj1+hYKJ6tfp2j
 oFV8Md0md0suZNABPBLEFsYJtHc+IepLXFrR6bnNEBJMz4Qb0mACLyqwTR4TfLVu4sen
 HITg==
X-Gm-Message-State: AOAM530rSNqhXL3WZU9fP/kmUPYRSTHlu8/SvpN2JPpkEtTuMDRWFQeE
 YrlI+r/JG/xJXAFTbX0fgrEfgGN82kZE8w==
X-Received: by 2002:a17:90a:ee95:: with SMTP id
 i21mr12157907pjz.160.1618606971234; 
 Fri, 16 Apr 2021 14:02:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:02:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/81] target/arm: Implement SVE2 integer pairwise
 arithmetic
Date: Fri, 16 Apr 2021 14:01:27 -0700
Message-Id: <20210416210240.1591291-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
X-TUID: enImh9PJzcDO

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

