Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1700250lfc;
        Fri, 28 Aug 2020 11:54:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDZxlTpbtxP/P0KbwOwxURYkF1AoPOur7hHbnBgCdNhfUMgJfNJqqe2Key1+qbQaNtd7nO
X-Received: by 2002:a25:260c:: with SMTP id m12mr4121550ybm.431.1598640858224;
        Fri, 28 Aug 2020 11:54:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598640858; cv=none;
        d=google.com; s=arc-20160816;
        b=QQ4b4Ittg0SSVpQ6VgJ21jjdXJUgWDLcWYngF4vBFKyJUaHHZPvRawKziCfvvRBDdX
         L+mGXmEsdV1FvdxLU6SmKMz0DngkoEIgUNP7vUZoBrbDXZSc9bCSwO7O6cLgMeSEnlrG
         P7EgiaLod9mQF9SdSBPosbRlBuvAFhQ6CmfIFuijGkYeEQ0XU7cnZeFOW86Lgzqi9saD
         ymMTyGBoqr2S6iM9lvdKY1j2sHZ/3XifE5GIabG0mZS/xy37Qi4ecLfbVOW3evfG3k4f
         PVIYpuiaX8kFJg/XuGhZAjGsvZRqgx2AC8V6trCwjXa4B9xU2Bjg20h40JIcrGNP4GVJ
         NsdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=d1v3KyQ1t1fIhlpZMIXH6cnFh1IA/Ig80NyUtW4n5r8=;
        b=Rvc3Wd4N8UKxCWeSqmOJ290ih3WRtd/deh+ahDhBzfyGVtrvAhZsnvuHAaWQtRndDC
         FG6uoDtrbJasIw4jbCNr9eFB6U/lL20LuJxctmQ1PoBqemi8aWwJ7kYrUNj31uG+kMs2
         X+gBy709TlRPzy7eROMOncl7nFZyCpVYp31f4+cHSGMzqBaslB4X/3Nipygk6BFcFJFx
         mQpWtwoTsWO4EXYS2dMBrfjOffv+YCt9Epq3w5wHdlNbWKpI4WBrU6JlxFVuvgD+ggdq
         /P2wCWJaR9aWSl8bsvw5fUUQcMdbIRDMZw9/kjD1Be3264fI5TCnR2UEjhqKLfzjII1m
         lRrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=obNgwWI5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m74si130907ybm.81.2020.08.28.11.54.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 11:54:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=obNgwWI5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBjVx-00008B-Iw
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 14:54:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCs-0002uw-81
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:34 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCp-00062l-DP
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:33 -0400
Received: by mail-wm1-x341.google.com with SMTP id t14so114941wmi.3
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 11:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=d1v3KyQ1t1fIhlpZMIXH6cnFh1IA/Ig80NyUtW4n5r8=;
 b=obNgwWI5dHGJSTicvHpLkHO13EPcjlc8dE8Jqc/nXTND9ixkJmOX/Vjo+USXjz8YFb
 wQLH0TUER2s85o6nTbTca0NnGkJIiDPjyDBzkAWzh8wast+KgnJ0N1KW8utix0SuwKRh
 UHcfnf9EzG7w1K8mTuMQ1SKkuEXITj9xecDxcpflWBRb6zAqgxv3T8ljtkrbWdP6gQSV
 +iy4cStds9N905RzX3dz1VRX/+vQl1Sc+aquYG2G71iFFUIfIIBm9J3CkyfRJHufaFbu
 JCeOoqUViy7RjbYgTBCfJb06tg1sC9XuGf38RNuSVbyRTuIYf3qJcSuHM6vQtNtOkHBs
 NbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d1v3KyQ1t1fIhlpZMIXH6cnFh1IA/Ig80NyUtW4n5r8=;
 b=qVFNY5phrep+DosiHpgHavem5u0IYiuMUq73iIT7BlJ+wR7eqEa3IA44hgzeOtYyKF
 tqJ8JbSlc/YV/yH03xEd9YD2q1ezLry0W6zCxNRerTlE26Xa7cuVL9bgMo81nNQI4Hn0
 oE7h2jEdyy6hOtcmAQOoDn8OgY9m2RtTQfgQb0Wu9yCCM00r4fLDX56xGOEqkqLp4nC5
 a5d0JiXr6Yp9A07XnhVLUd0oIjQfmVBaXdMAHv/dnHcSDJrxpvsY8qB0egrMQqoe1IxO
 46x8zZfUsIg3jSU7tiqH/3HDppeXpmtd4oq7OsGzetg9QEfNLfMrB2z3aQ1A8PG1sLxf
 EkQw==
X-Gm-Message-State: AOAM533w5Zf+yS0DO86tMjmEYNsi92TlvLytfnLXhIUXFM1rWEKX2FNu
 aGUhDI4TCDwgI6GDOZCBfLkAiMCTsOqyWzBX
X-Received: by 2002:a1c:ab06:: with SMTP id u6mr31228wme.172.1598639669482;
 Fri, 28 Aug 2020 11:34:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s20sm356251wmh.21.2020.08.28.11.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 11:34:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 27/45] target/arm: Implement fp16 for VACGE, VACGT
Date: Fri, 28 Aug 2020 19:33:36 +0100
Message-Id: <20200828183354.27913-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200828183354.27913-1-peter.maydell@linaro.org>
References: <20200828183354.27913-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-TUID: tUwc3U/UXK+T

Convert the neon floating-point vector absolute comparison ops
VACGE and VACGT over to using a gvec hepler and use this to
implement the fp16 case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h             |  6 ++++++
 target/arm/vec_helper.c         | 26 ++++++++++++++++++++++++++
 target/arm/translate-neon.c.inc |  4 ++--
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index a05a0d1a427..b2d24050e27 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -641,6 +641,12 @@ DEF_HELPER_FLAGS_5(gvec_fcge_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_fcgt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_fcgt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(gvec_facge_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_facge_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(gvec_facgt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_facgt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(gvec_ftsmul_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_ftsmul_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index f60968f4997..4ac16ed102c 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -691,6 +691,26 @@ static uint32_t float32_cgt(float32 op1, float32 op2, float_status *stat)
     return -float32_lt(op2, op1, stat);
 }
 
+static uint16_t float16_acge(float16 op1, float16 op2, float_status *stat)
+{
+    return -float16_le(float16_abs(op2), float16_abs(op1), stat);
+}
+
+static uint32_t float32_acge(float32 op1, float32 op2, float_status *stat)
+{
+    return -float32_le(float32_abs(op2), float32_abs(op1), stat);
+}
+
+static uint16_t float16_acgt(float16 op1, float16 op2, float_status *stat)
+{
+    return -float16_lt(float16_abs(op2), float16_abs(op1), stat);
+}
+
+static uint32_t float32_acgt(float32 op1, float32 op2, float_status *stat)
+{
+    return -float32_lt(float32_abs(op2), float32_abs(op1), stat);
+}
+
 #define DO_2OP(NAME, FUNC, TYPE) \
 void HELPER(NAME)(void *vd, void *vn, void *stat, uint32_t desc)  \
 {                                                                 \
@@ -791,6 +811,12 @@ DO_3OP(gvec_fcge_s, float32_cge, float32)
 DO_3OP(gvec_fcgt_h, float16_cgt, float16)
 DO_3OP(gvec_fcgt_s, float32_cgt, float32)
 
+DO_3OP(gvec_facge_h, float16_acge, float16)
+DO_3OP(gvec_facge_s, float32_acge, float32)
+
+DO_3OP(gvec_facgt_h, float16_acgt, float16)
+DO_3OP(gvec_facgt_s, float32_acgt, float32)
+
 #ifdef TARGET_AARCH64
 
 DO_3OP(gvec_recps_h, helper_recpsf_f16, float16)
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 94871f8597d..645a099518d 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -1115,6 +1115,8 @@ DO_3S_FP_GVEC(VMUL, gen_helper_gvec_fmul_s, gen_helper_gvec_fmul_h)
 DO_3S_FP_GVEC(VCEQ, gen_helper_gvec_fceq_s, gen_helper_gvec_fceq_h)
 DO_3S_FP_GVEC(VCGE, gen_helper_gvec_fcge_s, gen_helper_gvec_fcge_h)
 DO_3S_FP_GVEC(VCGT, gen_helper_gvec_fcgt_s, gen_helper_gvec_fcgt_h)
+DO_3S_FP_GVEC(VACGE, gen_helper_gvec_facge_s, gen_helper_gvec_facge_h)
+DO_3S_FP_GVEC(VACGT, gen_helper_gvec_facgt_s, gen_helper_gvec_facgt_h)
 
 /*
  * For all the functions using this macro, size == 1 means fp16,
@@ -1130,8 +1132,6 @@ DO_3S_FP_GVEC(VCGT, gen_helper_gvec_fcgt_s, gen_helper_gvec_fcgt_h)
         return do_3same_fp(s, a, FUNC, READS_VD);                   \
     }
 
-DO_3S_FP(VACGE, gen_helper_neon_acge_f32, false)
-DO_3S_FP(VACGT, gen_helper_neon_acgt_f32, false)
 DO_3S_FP(VMAX, gen_helper_vfp_maxs, false)
 DO_3S_FP(VMIN, gen_helper_vfp_mins, false)
 
-- 
2.20.1

