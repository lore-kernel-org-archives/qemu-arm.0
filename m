Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2079021lff;
        Mon, 14 Jun 2021 08:34:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz975LXRWHkUcYeCK/jFbFwDLbaTDGhvODIggNSEI7f70kcGaWv9ekMulA1v6jjKDU2iiUA
X-Received: by 2002:a1c:e91a:: with SMTP id q26mr33676033wmc.170.1623684895273;
        Mon, 14 Jun 2021 08:34:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623684895; cv=none;
        d=google.com; s=arc-20160816;
        b=CD+M6iK3nVvcTGny24wV+arD1i1MYw422xlYlvNG97ujCNhVpHrryKx2FMmAVw0pQw
         96McLv3wcx+vqNt67IagFt/nbwjVbTE5DbDzctpvmCVcCzbsDs2LSlhYkgJXQEc5JAzr
         zz7crNWHxYQoJHiHlcabD/HLoo7OMW6P0I1JowavSbcxMiqgbRACVFRKCIBoOCbN/IcX
         ekGSX6TEA+QnWvqoR7YPCdPZe3cseCFiRqoab7OrPmrYDRxY+h82BpBZvo+0yEH5LEqt
         Tz42sw3WAnvihcYVbF2rsteW9eHOw1q5xt0d/YDk1YNSm8aBJXndFx7RTAPkgSiCtDvY
         r/1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=A8A5e9TAwX7Ww7xFF+2R1JpDhZ4NPHBT6eDUin3bq2U=;
        b=BU4/JuHa1HwSftZZK0LBlnRBUaXC4QkreKkd1k6xO2W/0Fe2QrO1REBGPC3wlilkNr
         nos01fiM+BrBU6bjlWaqaXo0w1+q9BR88VEUP48LdmCiAUvLYIIKErhujT/fGAZS4a30
         2lTcyvpNP0dqWvmPmTadO08DG2xFBHt6tU790sNUnmtWjFJboKrYGgXkTVkg4YE3eyij
         oAxm2dFoixuDvowfNJfqem1EOX91+nY37WnzC8qMrMcEpKzMghssH0s9i6yBjSFv5yTF
         7U0sYF92ORMh7q24uK78AFZECA8HRaP9Exv+aLVXBzKwTdpVANi5gjYKfzl1NgcE/hhq
         6hmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vAbNt4FH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p4si16204234wrr.308.2021.06.14.08.34.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:34:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vAbNt4FH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsoc2-0005w5-9B
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEx-000271-B6
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:03 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:47049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEe-0000Xb-Ns
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:03 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 h22-20020a05600c3516b02901a826f84095so179328wmq.5
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A8A5e9TAwX7Ww7xFF+2R1JpDhZ4NPHBT6eDUin3bq2U=;
 b=vAbNt4FHX6IkWwU6AURlp+jjUlbY6uKrDaacsjDrLTk7rjsct5FYVTuTLpHYEYhF4k
 b+HYsUPzIhJbHIXsYMiqnEk5aj1KFmWpfHj03hxOAtiY5oyXwWQES1NmL1OHaQkvOnmi
 n0YGbopVcrXjyrLH8oWwRixjnUa7Zk6tGuTvqnOuVh8RFVS3D6NiWC1zXTwAMoNFZrOI
 IMpsIPBxGrtHKwIWycIv2d7t4r95XLumXtJ/W7NFI4cMp7+z2PM4W/vBvuMvJ/xbNeUC
 3QLsN5cljmjiTaJuhBYtIBu6i36DPq9ZLbgSo++hyz/6d98DeLiYmvZcTDOPOqGxkUrT
 IHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A8A5e9TAwX7Ww7xFF+2R1JpDhZ4NPHBT6eDUin3bq2U=;
 b=Z1gIbvkEemzUW2UZNcoe4YWfFw+b3Eodu3umvI62BhtplQZ2pNrTzuchD6/dzg5cwt
 4Ex8vctoLQdx17Q0Bj4qAc1W0Xdwuw26knFPsGdvgSW9kyagjNwyzignlluSzohiGlnL
 i10mRTYH+j4ZN1Z9YnYvivG/j/PO+cvg4Maj9UUiB6AqWTBuZxfeSc9fe2shswQXAVVQ
 9yP35PXykavK9pwzqlZ9RswZNNDHvsBv7UggwIXWdPB8HDqXCw3BvJuPX33+la2lTx3E
 3N6rEBwR7jdzIQaNyDuKX5nN6S1m6lXM7Cdq4j3xTLJ+VBRFnSXUmac2sCkJYUTr/fHb
 p5GA==
X-Gm-Message-State: AOAM532xNab4cgJyZG3twU0waVa4faRW7pDqo/vZy7H2+fG+rw0RpT8b
 xU9vSwbckVFlVUM2uHX849mA1Ejavbfq/Q==
X-Received: by 2002:a05:600c:2188:: with SMTP id
 e8mr34384257wme.129.1623683443391; 
 Mon, 14 Jun 2021 08:10:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 41/57] target/arm: Implement MVE VQDMULH and VQRDMULH
 (scalar)
Date: Mon, 14 Jun 2021 16:09:51 +0100
Message-Id: <20210614151007.4545-42-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jkYjBUUD2PBA

Implement the MVE VQDMULH and VQRDMULH scalar insns, which multiply
elements by the scalar, double, possibly round, take the high half
and saturate.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 25 +++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 38 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 092efdab475..a0a01d0cc3b 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -189,6 +189,14 @@ DEF_HELPER_FLAGS_4(mve_vqsubu_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
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
index f7d564b9e9f..45f402e795c 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -533,6 +533,24 @@ static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
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
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, FN)                              \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
                                 uint32_t rm)                            \
@@ -600,6 +618,13 @@ DO_2OP_SAT_SCALAR(vqsubs_scalarb, 1, int8_t, DO_SQSUB_B)
 DO_2OP_SAT_SCALAR(vqsubs_scalarh, 2, int16_t, DO_SQSUB_H)
 DO_2OP_SAT_SCALAR(vqsubs_scalarw, 4, int32_t, DO_SQSUB_W)
 
+DO_2OP_SAT_SCALAR(vqdmulh_scalarb, 1, int8_t, DO_QDMULH_B)
+DO_2OP_SAT_SCALAR(vqdmulh_scalarh, 2, int16_t, DO_QDMULH_H)
+DO_2OP_SAT_SCALAR(vqdmulh_scalarw, 4, int32_t, DO_QDMULH_W)
+DO_2OP_SAT_SCALAR(vqrdmulh_scalarb, 1, int8_t, DO_QRDMULH_B)
+DO_2OP_SAT_SCALAR(vqrdmulh_scalarh, 2, int16_t, DO_QRDMULH_H)
+DO_2OP_SAT_SCALAR(vqrdmulh_scalarw, 4, int32_t, DO_QRDMULH_W)
+
 static inline uint32_t do_vbrsrb(uint32_t n, uint32_t m)
 {
     m &= 0xff;
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 6bc2d004908..ec0900e9f69 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -450,6 +450,8 @@ DO_2OP_SCALAR(VQADD_S_scalar, vqadds_scalar)
 DO_2OP_SCALAR(VQADD_U_scalar, vqaddu_scalar)
 DO_2OP_SCALAR(VQSUB_S_scalar, vqsubs_scalar)
 DO_2OP_SCALAR(VQSUB_U_scalar, vqsubu_scalar)
+DO_2OP_SCALAR(VQDMULH_scalar, vqdmulh_scalar)
+DO_2OP_SCALAR(VQRDMULH_scalar, vqrdmulh_scalar)
 DO_2OP_SCALAR(VBRSR, vbrsr)
 
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
-- 
2.20.1

