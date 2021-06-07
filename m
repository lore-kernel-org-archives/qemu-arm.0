Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3695202lfa;
        Mon, 7 Jun 2021 10:25:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7A6co/+A31iHvOnUkQ4YznGnH0KXK+ENFKndVH1WfKsIZ49DWRy60w3I2O2HiA/bfoePP
X-Received: by 2002:a05:6102:c46:: with SMTP id y6mr9893835vss.22.1623086732167;
        Mon, 07 Jun 2021 10:25:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623086732; cv=none;
        d=google.com; s=arc-20160816;
        b=Frr7ITieMO5PuTqvt/jCoeNMjKJp+71+F3Nfljkp2fECXmtN0f3jFYbeW/pXkc0Rpo
         Mt3SN0K/pzu9x5bPsGaNPjOfG6wRBKTM6e2fjv12zJ82LCdyf5E9hxYMSfGhf3ckJbHL
         dZN38J2SU3pUpL3sLO3goskXzg40yO+NjHt9FNEiLEiVqQwHZBdoSl+R/ALUW6ZQwYpC
         OHQMvpUxZRVMgbZaLSA2TiJ0GWZPVmtgIQJyBu0aCLAy0hXS4dJP90wjTSRk3+WRi9pC
         mbnWF1bccx7kVUS7t+3Lg2AVgyE41swKiRFuQ2ksVG3RuPm+Rzd+AbHG1EC9R+6oN6e5
         ybUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zIwanJ3AQdDQdQ1ALSTjRK7X+97mJn2Se8diVqTisuk=;
        b=qQz7gEIS1ZqowejXCUeyXuEqc0Jw86UuNbWgJnRSGfb+vnNYR9yhXP79DnKwIvEF2e
         dHOuM9uDYKMEzmenV4TfPwD1e2wGpA5ywYpA51P+f1N4g4Crpj7JySR0jShDwfjRINQ5
         wCpqZIG3yNEun5JZMJeJ017mNkOsOIhPNwIuoD/eIxP6D5ecHSf1C5B8FO7gcRQTIv8u
         9Sr3kGf5qcEiKOPmKXKpiMPKJC+/n/13WV4KOtjjD63ACKYp07I8JYlsZYe8gh3D7S3f
         lqEmmdcMUBaQMXGvkADJQPd/fByoAvMbo82yMaXsoMJfFCk562Vl0a5rWQC3cyZJoN66
         L4ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MrgTTp1t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z39si4362304uac.213.2021.06.07.10.25.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:25:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MrgTTp1t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqJ0F-0006SJ-Dd
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIay-0007m2-MO
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:24 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:52955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaW-00083B-VV
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:24 -0400
Received: by mail-wm1-x335.google.com with SMTP id f17so106656wmf.2
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 09:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zIwanJ3AQdDQdQ1ALSTjRK7X+97mJn2Se8diVqTisuk=;
 b=MrgTTp1t7XftpPzgJSCedOUijNGkGUPIdSOM3QVD86TLoZGFdr5qEFuTm6LB6+ZJhi
 /3p9ScWndW9BBK1lzEbYFYUnVE5+k01d6v4niKA2g7iLqGLoXCLtOhgFOkLBmEAOEF5O
 nWwbptE0ql9kvE8fBqO5FrrIuibsOT0Y6p33TMnT97TBy93bfh5fQmSJZmIbChAFSUs/
 3HyZ5cJN7s0auQit1EOaxjlkOaL2FhO93ldtL0aneBmndlEFjIteALfZsozI8fTVZIGq
 AzJK+rv9tQ93ebZP8h0wpO2C5mRcWLcYFuLiKVJ5SpEXvIdr+UTLHBZspkQT0NmiEXdW
 8C4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zIwanJ3AQdDQdQ1ALSTjRK7X+97mJn2Se8diVqTisuk=;
 b=iO54m0NMDgGAAzYAVoemKpEtMdR2ssVC8LVQcx/q9ApFIdBS3GNqthtj35J3bykW9t
 VWCvx/20Xqfj66sTD8p4RWdfV3dinGmteTas23WrcQ6LVZ+3RchBnwpXXVQm/MpuMRm3
 j0vlAZiwCNTdEZ1FKhXog11P8/i6CddVdjNH8v5WCzr+08IPyHmFmJwC8QC1rHSVxuD3
 nhNzjw6XvUsL00nMwl6Z1Xoooz+j1ckD0ZBEdMDCeUHvWcm+CDAg+XN3wCnRzRWu/y/X
 VbmR1VGMigvat7cKXJ5oVaETSRm2XurYs0h0MAM+l/VkavRlJYSdmjUogWEDog6F+buN
 zu3Q==
X-Gm-Message-State: AOAM532Uq5vP8vGwnBg7jNR5xyxyys8jVdLqNbTIR/XDkfYOru9A+F92
 Dc9n3LnwzXPFA7mUgkc+n2N0yGhD4tHLAShh
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr74397wmg.160.1623085134420;
 Mon, 07 Jun 2021 09:58:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 39/55] target/arm: Implement MVE VQDMULH and VQRDMULH (scalar)
Date: Mon,  7 Jun 2021 17:58:05 +0100
Message-Id: <20210607165821.9892-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: vwq/eruuwgmX

Implement the MVE VQDMULH and VQRDMULH scalar insns, which multiply
elements by the scalar, double, possibly round, take the high half
and saturate.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 25 +++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 38 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index a1acc44e40e..9bab04305a7 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -191,6 +191,14 @@ DEF_HELPER_FLAGS_4(mve_vqsubu_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vqsubu_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vqsubu_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vqdmulh_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqdmulh_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqdmulh_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqrdmulh_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrdmulh_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrdmulh_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vbrsrb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vbrsrh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vbrsrw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index c85227c675a..47ce6ebb83b 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -174,6 +174,9 @@ VQSUB_S_scalar   1110 1110 0 . .. ... 0 ... 1 1111 . 110 .... @2scalar
 VQSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 110 .... @2scalar
 VBRSR            1111 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
 
+VQDMULH_scalar   1110 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
+VQRDMULH_scalar  1111 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
+
 # Predicate operations
 %mask_22_13      22:1 13:3
 VPST             1111 1110 0 . 11 000 1 ... 0 1111 0100 1101 mask=%mask_22_13
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 41c4f2033f6..6e2da6ac8bc 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -505,6 +505,24 @@ static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 #define DO_UQSUB_H(n, m, s) do_sat_bhw((int64_t)n - m, 0, UINT16_MAX, s)
 #define DO_UQSUB_W(n, m, s) do_sat_bhw((int64_t)n - m, 0, UINT32_MAX, s)
 
+/*
+ * For QDMULH and QRDMULH we simplify "double and shift by esize" into
+ * "shift by esize-1", adjusting the QRDMULH rounding constant to match.
+ */
+#define DO_QDMULH_B(n, m, s) do_sat_bhw(((int64_t)n * m) >> 7, \
+                                        INT8_MIN, INT8_MAX, s)
+#define DO_QDMULH_H(n, m, s) do_sat_bhw(((int64_t)n * m) >> 15, \
+                                        INT16_MIN, INT16_MAX, s)
+#define DO_QDMULH_W(n, m, s) do_sat_bhw(((int64_t)n * m) >> 31, \
+                                        INT32_MIN, INT32_MAX, s)
+
+#define DO_QRDMULH_B(n, m, s) do_sat_bhw(((int64_t)n * m + (1 << 6)) >> 7, \
+                                         INT8_MIN, INT8_MAX, s)
+#define DO_QRDMULH_H(n, m, s) do_sat_bhw(((int64_t)n * m + (1 << 14)) >> 15, \
+                                         INT16_MIN, INT16_MAX, s)
+#define DO_QRDMULH_W(n, m, s) do_sat_bhw(((int64_t)n * m + (1 << 30)) >> 31, \
+                                         INT32_MIN, INT32_MAX, s)
+
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, H, FN)                           \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
                                 uint32_t rm)                            \
@@ -575,6 +593,13 @@ DO_2OP_SAT_SCALAR(vqsubs_scalarb, 1, int8_t, H1, DO_SQSUB_B)
 DO_2OP_SAT_SCALAR(vqsubs_scalarh, 2, int16_t, H2, DO_SQSUB_H)
 DO_2OP_SAT_SCALAR(vqsubs_scalarw, 4, int32_t, H4, DO_SQSUB_W)
 
+DO_2OP_SAT_SCALAR(vqdmulh_scalarb, 1, int8_t, H1, DO_QDMULH_B)
+DO_2OP_SAT_SCALAR(vqdmulh_scalarh, 2, int16_t, H2, DO_QDMULH_H)
+DO_2OP_SAT_SCALAR(vqdmulh_scalarw, 4, int32_t, H4, DO_QDMULH_W)
+DO_2OP_SAT_SCALAR(vqrdmulh_scalarb, 1, int8_t, H1, DO_QRDMULH_B)
+DO_2OP_SAT_SCALAR(vqrdmulh_scalarh, 2, int16_t, H2, DO_QRDMULH_H)
+DO_2OP_SAT_SCALAR(vqrdmulh_scalarw, 4, int32_t, H4, DO_QRDMULH_W)
+
 static inline uint32_t do_vbrsrb(uint32_t n, uint32_t m)
 {
     m &= 0xff;
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 254ff2a01b2..4d08067c1e2 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -473,6 +473,8 @@ DO_2OP_SCALAR(VQADD_S_scalar, vqadds_scalar)
 DO_2OP_SCALAR(VQADD_U_scalar, vqaddu_scalar)
 DO_2OP_SCALAR(VQSUB_S_scalar, vqsubs_scalar)
 DO_2OP_SCALAR(VQSUB_U_scalar, vqsubu_scalar)
+DO_2OP_SCALAR(VQDMULH_scalar, vqdmulh_scalar)
+DO_2OP_SCALAR(VQRDMULH_scalar, vqrdmulh_scalar)
 DO_2OP_SCALAR(VBRSR, vbrsr)
 
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
-- 
2.20.1

