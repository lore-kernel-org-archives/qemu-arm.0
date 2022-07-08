Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp342946lft;
        Fri, 8 Jul 2022 08:35:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uHEEyL3NyKsDd8SlJzEK6HBEzBGcTSH2aVDKH6MTHbkrGuwqQSaK/bMzqjoqFRUBvwQSJn
X-Received: by 2002:a05:620a:4015:b0:6b1:4731:f5a2 with SMTP id h21-20020a05620a401500b006b14731f5a2mr2770973qko.737.1657294544758;
        Fri, 08 Jul 2022 08:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657294544; cv=none;
        d=google.com; s=arc-20160816;
        b=aaDVOpmzG2efdTOZezEE78MsEww1MKDs1y438iQwSbIdX0v1dYU+iLWSBpcfx9RbS/
         DvvfXuD4LgeGT1BdvZmKcN6sFPWRuNtXCjOV2npeauK3ruApiorsBcXLO13F3Av+MOhp
         IaPFgIxBjwK74DXn5D+0Ezpfk0QSTpTOIbQgjwPl9qGsvQ0BnMFfLuZOjN1eWKXnXF4q
         a3znBJ1M+JBoorfUnJ/4SxEAtFWMMzrqgL/LZNgqo1AhNplu4wHK8sTh4Olv7YljFiSJ
         0IG4menZ1eQ4OAo34mwT6T5CBVAn0lO9/C4LOSp2aJYb70GG0vdpu/PuShVFdr5JENqF
         qCjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8q6UgHZNxgLAwjYyD3emx4pnHnGEMm3xg5CqdRKZ5yA=;
        b=Ar5j+HwfymVO8V7/qMRBMf8206kw8liaZq0WwlaSqswf2/lVfIppxQd3LdU6PIv0P9
         ri8/2uzM0CWl8shSXDluKFfWjTUR9g3ZeP3k0+gLezBWhILBVKM59Gsje+56K0rnN1Fz
         8aJlfZrNk9vb5D6mRRLZ2Hk7UR5ecXyv/WFrNlalXdryomWMlzexiWxpUya54bnatlrt
         WFtpadNpIVHpIgx601o30oTgG+CGgCa5QYMwhZZqKUAC38q7yAzxwTagk05fkmYicGHm
         Y1bYGep5IKkr7R9VhrjU/VoX+JadV5Vyv3S3AccH+sM7jn4hf9EIm8eeYj/D4lUQeV7c
         xzSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rlh1uGi3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq15-20020a05620a468f00b006af21a7362csi21856459qkb.710.2022.07.08.08.35.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:35:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rlh1uGi3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9q1A-0006ds-2R
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pin-0002on-3g
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:16:45 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:42563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pil-0002Ke-7D
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:16:44 -0400
Received: by mail-pl1-x633.google.com with SMTP id 5so10724552plk.9
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8q6UgHZNxgLAwjYyD3emx4pnHnGEMm3xg5CqdRKZ5yA=;
 b=Rlh1uGi31mr+nppIEi5f5Iw+0CqYnLlsV5W4Y9htIKl857meuFaODi5r42vJqjvFMa
 64UddTFV0Pck0r52ey0INwG+wvNrmZzcFJ25fA6gRSh/66FJwigzMwuAlmmQ4z2klcjX
 Jz8UbWO38MuTX0HYp18aLscwUdPNanyfiBqgSOcvHvx+rSobpm9f2Qrs8jYYR/AIdByh
 YdeK1EdS/axxGRrnQXVktLudanqfxfQ5vYf1yIkieF6XfBoN44+x2ZBb5e6v7W+6Kuk/
 X0RsYx7y3K8TDTg1yJBgwRt+3142+Xe/3FI1HPNn1yno4qD49Z/2USXyvjZL9LbQrO9i
 TnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8q6UgHZNxgLAwjYyD3emx4pnHnGEMm3xg5CqdRKZ5yA=;
 b=ogeZIEYgyugOLUqeN4bTFmDgeG/zyWLLQd7mV2Ic5LJP3zS2esftw1t9UtzvjQ1UB0
 nfBcRc6WbzenrxLNH4BVG1lqoMZYz+MOssL5rjTHO+pdSLQnpXYMaVU0sRF4kTVeEBHi
 xZ07Vsn33GuXiOC50ugWjEyjyHEIRSxKnPjkRs99ZXfPi3pApb8Agfxqv2Yma52MMUVa
 Cvtr/AhhpYFHkxd3FRWI/aKmVaOXd2+6orgkC2IsG5O3dpV9gSD9yBxp8ZUr1cdTqItP
 O6N6wo+f7wd570O0wRPKsb9x5KpJDMSOQ+pRXjurUYJ7cwbtpGROc88QKk+INjDMCPeS
 n3mw==
X-Gm-Message-State: AJIora+mJYbuWDUMgUzvsYAvE+sYURYTxY+JhJg9AElaFe0BDoIN9chd
 heNwfaSXanJ8bHO3bPiWFocwWQ==
X-Received: by 2002:a17:90b:3b4b:b0:1ef:f5b0:ce60 with SMTP id
 ot11-20020a17090b3b4b00b001eff5b0ce60mr352337pjb.71.1657293400833; 
 Fri, 08 Jul 2022 08:16:40 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 18/45] target/arm: Implement SME ZERO
Date: Fri,  8 Jul 2022 20:45:13 +0530
Message-Id: <20220708151540.18136-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: W8zevjcHwDxN

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: Fix ZA[] comment in helper_sme_zero.
---
 target/arm/helper-sme.h    |  2 ++
 target/arm/sme.decode      |  4 ++++
 target/arm/sme_helper.c    | 25 +++++++++++++++++++++++++
 target/arm/translate-sme.c | 13 +++++++++++++
 4 files changed, 44 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index 3bd48c235f..c4ee1f09e4 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -19,3 +19,5 @@
 
 DEF_HELPER_FLAGS_2(set_pstate_sm, TCG_CALL_NO_RWG, void, env, i32)
 DEF_HELPER_FLAGS_2(set_pstate_za, TCG_CALL_NO_RWG, void, env, i32)
+
+DEF_HELPER_FLAGS_3(sme_zero, TCG_CALL_NO_RWG, void, env, i32, i32)
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index c25c031a71..6e4483fdce 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -18,3 +18,7 @@
 #
 # This file is processed by scripts/decodetree.py
 #
+
+### SME Misc
+
+ZERO            11000000 00 001 00000000000 imm:8
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index b215725594..eef2df73e1 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -59,3 +59,28 @@ void helper_set_pstate_za(CPUARMState *env, uint32_t i)
         memset(env->zarray, 0, sizeof(env->zarray));
     }
 }
+
+void helper_sme_zero(CPUARMState *env, uint32_t imm, uint32_t svl)
+{
+    uint32_t i;
+
+    /*
+     * Special case clearing the entire ZA space.
+     * This falls into the CONSTRAINED UNPREDICTABLE zeroing of any
+     * parts of the ZA storage outside of SVL.
+     */
+    if (imm == 0xff) {
+        memset(env->zarray, 0, sizeof(env->zarray));
+        return;
+    }
+
+    /*
+     * Recall that ZAnH.D[m] is spread across ZA[n+8*m],
+     * so each row is discontiguous within ZA[].
+     */
+    for (i = 0; i < svl; i++) {
+        if (imm & (1 << (i % 8))) {
+            memset(&env->zarray[i], 0, svl);
+        }
+    }
+}
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 786c93fb2d..971504559b 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -33,3 +33,16 @@
  */
 
 #include "decode-sme.c.inc"
+
+
+static bool trans_ZERO(DisasContext *s, arg_ZERO *a)
+{
+    if (!dc_isar_feature(aa64_sme, s)) {
+        return false;
+    }
+    if (sme_za_enabled_check(s)) {
+        gen_helper_sme_zero(cpu_env, tcg_constant_i32(a->imm),
+                            tcg_constant_i32(streaming_vec_reg_size(s)));
+    }
+    return true;
+}
-- 
2.34.1

