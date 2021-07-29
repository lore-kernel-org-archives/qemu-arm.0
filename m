Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5550485lfc;
        Thu, 29 Jul 2021 04:34:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdE/4xx4+389a+kY8m1e5EKLJv6+qvnenbMU+07hXlXeSfMU1yYpOONa4nA/wAmOf/7EuW
X-Received: by 2002:a25:9942:: with SMTP id n2mr6173898ybo.230.1627558465653;
        Thu, 29 Jul 2021 04:34:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627558465; cv=none;
        d=google.com; s=arc-20160816;
        b=cx7e9FNztHo4kl9Sv9Cd+cchxjPT9lc5ixcyJB/ZEXH/9BDJ0Ge7K+hxjhV5jU/5/y
         N9sudTMiypx3zoi1VK7P6CrShvl5b1xjPTP1VoTP1QtpAalXnd0gZZeARZBiWhkBWbX1
         c5bVA/TpcBX5CvnQRaamAKnYWgB1yrqpi0ff45SQtpUebOCE+3ljk776+UnOFsmDPBoG
         Xsyhlqu7l9jXazoakiEAAghRz9MDqa98FIPbC1FQerAqeJlQtxDYvVAjo6iX7dGX4JY1
         z9v9G4WpuQKuEIuUCpgpTyD+4FUGkoUPgyrCnH8cUqt3gbjl9VC9oIMKRW1Iy4zdpit4
         tX9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZsgiYwh7qNLAcSkC7LxnVfqa/pmBeTfF8iAebdcRKSo=;
        b=y0cyXth60RIPyICpCh8pdwnb6KrfVyBMyjXzjYX6QQ5X7trTEbrOeiwYYoCx1R3c4X
         kZPyDljRiQa9rzb8mZ5QCUTHOPis/hqTwbnN/rHUxV8FH2OGHsK84/nw9G8/gSnJ7CaA
         JISrqtoV9iOcdv08y+If3FvUSfFh+qZDUThEQYNueuX4ZnaYZzQwkgfLyzPIBZjmRtvt
         DLb6sFf3RIrbRBbqp/6NSmXoNg7JVOFZrUzzQ0ScFrnC9ofaIeEPwgqj6H1sqtst4y7c
         QA8hcz25oiZA95pYSMXeddTe45Fcbl/RUM6l1GMMRbjqJPIROQgGg4rLl41AmfYLzZ22
         OSWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SOZtKpR6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r17si2608575ybd.123.2021.07.29.04.34.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 04:34:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SOZtKpR6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m94Iy-00066t-UY
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 07:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941G-00018y-0r
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:16:06 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:34768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940s-0001Iu-VQ
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:16:05 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l4-20020a05600c1d04b02902506f89ad2dso5539503wms.1
 for <qemu-arm@nongnu.org>; Thu, 29 Jul 2021 04:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZsgiYwh7qNLAcSkC7LxnVfqa/pmBeTfF8iAebdcRKSo=;
 b=SOZtKpR6e95OuMwwg5Vj4v3FwmrUCpQVqO8qaGID1yX7o7SYO9cVmMhoa/Dc4rS5Eh
 PKxOOg46CuNQvjyoZ5WNsC1TmKxuao3hPYdHtNSdgxjjNh7zQAe9bH5XvmjBH5JzXexX
 WoCbBD6ZKfh0Rn147v3pj8F+m6O7IVtEIK80kGYmzW5a9t1c+ImG2wOE81OhIZvHY5E2
 N9WmJqKE++EViMSydP8sJBPkZ5yryXQQCcZPC77xdh4cyFQDTkjPA9mXckCF4KRQEU1U
 GSRW0N3sUVa2rJeviUpF8Oroxd2Bhvp7aoFvpszgF5LMrCMKFXQKuMe3QTvaBYpdsAPB
 pxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZsgiYwh7qNLAcSkC7LxnVfqa/pmBeTfF8iAebdcRKSo=;
 b=ugP288qc45ofw/zcQpb/I0i+JaSTtdjTkUC2WcdpotylX68SzHciaGMcCfuzJ8fzdo
 QbmSNKn+Pyhvn82QAA5tSNptyxZppHdA1RaoVqHZQuG0bHhX4TSuMfPl2fKjygggVJzo
 1ZzyjFgdHSnYbqQt2P7Lrue4TkCDAiRknqe5yPpf4SKjtzlPFdhOYQ7rqD9crWjYsb3D
 1d2tIIr3/5jl4M69qaXaqolzP/2hH3Ni4+A5zLMqoiFrnzcQKVwf2uWThrMg+qyXDQ+2
 Jfq21kS5YLSKaJ/OoekRUCrAoo+LmdPB2AznrQWbGSqjXiqi2EF/rhLczmEuANdrtAKO
 xERA==
X-Gm-Message-State: AOAM530pusa7uyOApAKjswbNaeO5+k5s9b4/vzHchJFkxGAV07SLsgnu
 SCcgpYz8+scglS1mi7WA9jlGmZX6QHHMjQ==
X-Received: by 2002:a1c:238e:: with SMTP id j136mr4272553wmj.91.1627557340414; 
 Thu, 29 Jul 2021 04:15:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 31/53] target/arm: Implement MVE VPNOT
Date: Thu, 29 Jul 2021 12:14:50 +0100
Message-Id: <20210729111512.16541-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: LL1zu9s8yPad

Implement the MVE VPNOT insn, which inverts the bits in VPR.P0
(subject to both predication and to beatwise execution).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  1 +
 target/arm/mve.decode      |  1 +
 target/arm/mve_helper.c    | 17 +++++++++++++++++
 target/arm/translate-mve.c | 19 +++++++++++++++++++
 4 files changed, 38 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 651020aaad8..8cb941912fc 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -119,6 +119,7 @@ DEF_HELPER_FLAGS_4(mve_vorn, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_veor, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
 DEF_HELPER_FLAGS_4(mve_vpsel, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_1(mve_vpnot, TCG_CALL_NO_WG, void, env)
 
 DEF_HELPER_FLAGS_4(mve_vaddb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vaddh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 774ee2a1a5b..40bd0c04b59 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -571,6 +571,7 @@ VCMPGT            1111 1110 0 . .. ... 1 ... 1 1111 0 0 . 0 ... 1 @vcmp
 VCMPLE            1111 1110 0 . .. ... 1 ... 1 1111 1 0 . 0 ... 1 @vcmp
 
 {
+  VPNOT           1111 1110 0 0 11 000 1 000 0 1111 0100 1101
   VPST            1111 1110 0 . 11 000 1 ... 0 1111 0100 1101 mask=%mask_22_13
   VCMPEQ_scalar   1111 1110 0 . .. ... 1 ... 0 1111 0 1 0 0 .... @vcmp_scalar
 }
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index d326205cbf0..c22a00c5ed6 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -2201,6 +2201,23 @@ void HELPER(mve_vpsel)(CPUARMState *env, void *vd, void *vn, void *vm)
     mve_advance_vpt(env);
 }
 
+void HELPER(mve_vpnot)(CPUARMState *env)
+{
+    /*
+     * P0 bits for unexecuted beats (where eci_mask is 0) are unchanged.
+     * P0 bits for predicated lanes in executed bits (where mask is 0) are 0.
+     * P0 bits otherwise are inverted.
+     * (This is the same logic as VCMP.)
+     * This insn is itself subject to predication and to beat-wise execution,
+     * and after it executes VPT state advances in the usual way.
+     */
+    uint16_t mask = mve_element_mask(env);
+    uint16_t eci_mask = mve_eci_mask(env);
+    uint16_t beatpred = ~env->v7m.vpr & mask;
+    env->v7m.vpr = (env->v7m.vpr & ~(uint32_t)eci_mask) | (beatpred & eci_mask);
+    mve_advance_vpt(env);
+}
+
 #define DO_1OP_SAT(OP, ESIZE, TYPE, FN)                                 \
     void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
     {                                                                   \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 93707fdd681..cc2e58cfe2f 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -887,6 +887,25 @@ static bool trans_VPST(DisasContext *s, arg_VPST *a)
     return true;
 }
 
+static bool trans_VPNOT(DisasContext *s, arg_VPNOT *a)
+{
+    /*
+     * Invert the predicate in VPR.P0. We have call out to
+     * a helper because this insn itself is beatwise and can
+     * be predicated.
+     */
+    if (!dc_isar_feature(aa32_mve, s)) {
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    gen_helper_mve_vpnot(cpu_env);
+    mve_update_eci(s);
+    return true;
+}
+
 static bool trans_VADDV(DisasContext *s, arg_VADDV *a)
 {
     /* VADDV: vector add across vector */
-- 
2.20.1

