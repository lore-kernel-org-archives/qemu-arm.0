Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp338195lft;
        Fri, 8 Jul 2022 08:28:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tfsZcjqIGnNtvhCA0K0HDAxcGwXBFqhVKk963eH2OsxbL6HOpO59PyFJ5Sfe7Z2rMHtR7J
X-Received: by 2002:ad4:5b81:0:b0:473:4a0f:6f17 with SMTP id 1-20020ad45b81000000b004734a0f6f17mr832403qvp.64.1657294125535;
        Fri, 08 Jul 2022 08:28:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657294125; cv=none;
        d=google.com; s=arc-20160816;
        b=h/gJjrLr/rk3rvjVmAKcFlcMMfbWGaiB/9jOOWRpSQwuOQsKpt5vgMMVQvUrDEh4cA
         HnKn4cWX2+4p+y5q2h5AyIjbYW+FajGfEyBRMndImuSmAt3GnaRfuaoAQWt8unaHns2v
         pcdDzqwK+zFGzvQfHemyaMo/29MEErnW7VYm1MArqxz0IUnhXmCmIuwdAGVADKhl1x3n
         ZouRyhg80jwL6HMxVkzXgZjzim+p8rBe2aS/Ih0SBQshocla795voHo7sJi31H4YEVVZ
         swL/cApQ4YaulcKZDLh/lb1w2EiYGPXEKgeUMYo3QDRcpyzMOBrwE+fw840u6QdQ15aX
         qAqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7Tjb6G7GkMTZZUt4ovJR0VSSVW2JTCjNpncEMG03Rtw=;
        b=gNwY6cEnBEUIs+NKucpYO1MvKR8c+ZZxC5IOdTqWQ36D6xya0xDM4sTqNlzFy+rgPi
         TcPJw8MWNuwm9JojarLOdXPQ30xe6i969g5qL97LQYTuXd3+sfxwBLThblRh7FFZTkTO
         e3vQnWo824gaTSxeUIzK/hP59ZF7COqJ1+U0ql4J4ojSP/iiZULOCgDWt5kdQVB1Dgfh
         aizA8Q0zyZqrJ4mpKm0DVlP9KvjuK66qHSJNqaQ5wDkkGWc5wl7uqDIO51X/d5WFOnfJ
         GALyPyXZpeXEzYJr+5Xyh7Q8ejtldSClQawXx7sOovuILvLqQHAanvfvQlUb3dmubibn
         omOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cqFqUYu+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e5-20020ac84145000000b002e1fbf3c018si26083643qtm.521.2022.07.08.08.28.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:28:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cqFqUYu+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9puO-0002sx-V1
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjD-0003wF-0e
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:17:11 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:43645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pj8-0002Os-Rt
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:17:09 -0400
Received: by mail-pg1-x530.google.com with SMTP id 73so7198699pgb.10
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Tjb6G7GkMTZZUt4ovJR0VSSVW2JTCjNpncEMG03Rtw=;
 b=cqFqUYu+HWdWXKqPRz6P26S+cmH7vGsoz6RpchOMee/By1Z6+RzVG5NlzBpycmk2dv
 PY0i6bs/Xx/CDLDL+DbB37sdwjwiUXw3rrEYjDPvXDPNVIP6kBG+1VIK3Yhs/BhVjapk
 kIZRrGxeWKFir+5kf1k+m5BU6UoPkA/irsQxbcKULVcndv1Pm2dZIh0SxaVAGrrIxpDQ
 v72sTQ4dqqPZcIPJ/mfbc1aAi0d81Ot56knH1fyCIIG7ouz3qunta/ERc7GRfD9uVsx6
 WbbJACrl2cFfGfhc3BkkiKPm/ZZ59aJWZwF7Ztah7hk874X0wBbbXpnctgoyNOlIp9ri
 zG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Tjb6G7GkMTZZUt4ovJR0VSSVW2JTCjNpncEMG03Rtw=;
 b=LO2LyM0ZOS5zvRXXtWt6z4mAJWpn0sOImE2uj8ZgI3gI9pRx4sXQMt4ds5F/tSVzDc
 oWfZ1x4wRoj/sXvw+zDVFf7IrJa3LrrPYqTl0yFT/INYga9e78KYFAFnGezOXm/sLWty
 xoqFZgyJLuB1tb+sS+H//cIgqJ3xoSRAKQhekrkY5RSAKMrsmPkMOmzSj/zPrALHUe33
 gFH5zjYMfuk6pbjjHBajbyzfckyTi57H2o8o97NOefyGmAZBE69Jrp+Vlxlz8jwNTYx6
 uDrT+EPD21yfVICUbziHTSWiCupyS91577SaRt/TchYQwoemJB1TeFL3DEfuB7trDLXf
 X4rg==
X-Gm-Message-State: AJIora+fsVkeVSqfZsUDWaTZINFLY2VEkIuspqkyZIy2wbkV2w+PQwIh
 6rjarfo0/DFaGSppTHCUhtoa1g==
X-Received: by 2002:a05:6a00:21c8:b0:4fd:f89f:ec0e with SMTP id
 t8-20020a056a0021c800b004fdf89fec0emr4275233pfj.83.1657293425510; 
 Fri, 08 Jul 2022 08:17:05 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:17:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 26/45] target/arm: Implement FMOPA, FMOPS (widening)
Date: Fri,  8 Jul 2022 20:45:21 +0530
Message-Id: <20220708151540.18136-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k7rBT69sx9XC

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sme.h    |  2 ++
 target/arm/sme.decode      |  1 +
 target/arm/sme_helper.c    | 74 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sme.c |  1 +
 4 files changed, 78 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index 1d68fb8c74..4d5d05db3a 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -121,6 +121,8 @@ DEF_HELPER_FLAGS_5(sme_addva_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sme_addha_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sme_addva_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_7(sme_fmopa_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_7(sme_fmopa_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_7(sme_fmopa_d, TCG_CALL_NO_RWG,
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index afd9c0dffd..e8d27fd8a0 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -75,3 +75,4 @@ FMOPA_s         10000000 100 ..... ... ... ..... . 00 ..        @op_32
 FMOPA_d         10000000 110 ..... ... ... ..... . 0 ...        @op_64
 
 BFMOPA          10000001 100 ..... ... ... ..... . 00 ..        @op_32
+FMOPA_h         10000001 101 ..... ... ... ..... . 00 ..        @op_32
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index 690a53eee2..302f89c30b 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -1008,6 +1008,80 @@ static inline uint32_t f16mop_adj_pair(uint32_t pair, uint32_t pg, uint32_t neg)
     return pair;
 }
 
+static float32 f16_dotadd(float32 sum, uint32_t e1, uint32_t e2,
+                          float_status *s_std, float_status *s_odd)
+{
+    float64 e1r = float16_to_float64(e1 & 0xffff, true, s_std);
+    float64 e1c = float16_to_float64(e1 >> 16, true, s_std);
+    float64 e2r = float16_to_float64(e2 & 0xffff, true, s_std);
+    float64 e2c = float16_to_float64(e2 >> 16, true, s_std);
+    float64 t64;
+    float32 t32;
+
+    /*
+     * The ARM pseudocode function FPDot performs both multiplies
+     * and the add with a single rounding operation.  Emulate this
+     * by performing the first multiply in round-to-odd, then doing
+     * the second multiply as fused multiply-add, and rounding to
+     * float32 all in one step.
+     */
+    t64 = float64_mul(e1r, e2r, s_odd);
+    t64 = float64r32_muladd(e1c, e2c, t64, 0, s_std);
+
+    /* This conversion is exact, because we've already rounded. */
+    t32 = float64_to_float32(t64, s_std);
+
+    /* The final accumulation step is not fused. */
+    return float32_add(sum, t32, s_std);
+}
+
+void HELPER(sme_fmopa_h)(void *vza, void *vzn, void *vzm, void *vpn,
+                         void *vpm, void *vst, uint32_t desc)
+{
+    intptr_t row, col, oprsz = simd_maxsz(desc);
+    uint32_t neg = simd_data(desc) * 0x80008000u;
+    uint16_t *pn = vpn, *pm = vpm;
+    float_status fpst_odd, fpst_std;
+
+    /*
+     * Make a copy of float_status because this operation does not
+     * update the cumulative fp exception status.  It also produces
+     * default nans.  Make a second copy with round-to-odd -- see above.
+     */
+    fpst_std = *(float_status *)vst;
+    set_default_nan_mode(true, &fpst_std);
+    fpst_odd = fpst_std;
+    set_float_rounding_mode(float_round_to_odd, &fpst_odd);
+
+    for (row = 0; row < oprsz; ) {
+        uint16_t prow = pn[H2(row >> 4)];
+        do {
+            void *vza_row = vza + tile_vslice_offset(row);
+            uint32_t n = *(uint32_t *)(vzn + H1_4(row));
+
+            n = f16mop_adj_pair(n, prow, neg);
+
+            for (col = 0; col < oprsz; ) {
+                uint16_t pcol = pm[H2(col >> 4)];
+                do {
+                    if (prow & pcol & 0b0101) {
+                        uint32_t *a = vza_row + H1_4(col);
+                        uint32_t m = *(uint32_t *)(vzm + H1_4(col));
+
+                        m = f16mop_adj_pair(m, pcol, 0);
+                        *a = f16_dotadd(*a, n, m, &fpst_std, &fpst_odd);
+
+                        col += 4;
+                        pcol >>= 4;
+                    }
+                } while (col & 15);
+            }
+            row += 4;
+            prow >>= 4;
+        } while (row & 15);
+    }
+}
+
 void HELPER(sme_bfmopa)(void *vza, void *vzn, void *vzm, void *vpn,
                         void *vpm, uint32_t desc)
 {
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index ecb7583c55..c2953b22ce 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -355,6 +355,7 @@ static bool do_outprod_fpst(DisasContext *s, arg_op *a, MemOp esz,
     return true;
 }
 
+TRANS_FEAT(FMOPA_h, aa64_sme, do_outprod_fpst, a, MO_32, gen_helper_sme_fmopa_h)
 TRANS_FEAT(FMOPA_s, aa64_sme, do_outprod_fpst, a, MO_32, gen_helper_sme_fmopa_s)
 TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst, a, MO_64, gen_helper_sme_fmopa_d)
 
-- 
2.34.1

