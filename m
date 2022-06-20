Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp626939lft;
        Mon, 20 Jun 2022 11:51:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uFkv6P+LQeySnJW+0G5uiTP3LkeaygdfxEFxYpcHglxzuAjJFDbTeUubXaQAsvurHooomt
X-Received: by 2002:ac8:7d0b:0:b0:306:6a3f:2f39 with SMTP id g11-20020ac87d0b000000b003066a3f2f39mr21022787qtb.195.1655751116877;
        Mon, 20 Jun 2022 11:51:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655751116; cv=none;
        d=google.com; s=arc-20160816;
        b=Fr1y6xaPdiR+2jTTQkUhtGB2nIOGn6k76JTIkMYkQfN4BNwzak6OkY+7S/LHi1e97/
         DO+MVltwuV2nVYXEj92llbjsb2FD92Nrjed7vjlRxEpHSS9ZoA6RnuGoGhPRfYrfaP3D
         iS4R1+w8l+9fHwv+AOFGbEZfzBzgbX6emmTaQK4QwvpfeYvJ18fkXaGLxjhjoFYRvHJP
         SIzldLGv3E//7gXQfIsR63wSmwePGa/ad+lLyb07zVxZUPUCFvpQk1hZdYOllkYcHF5o
         ZcUbYM3jJir6ZcsMNtipLaMKSnipEVZOoWqIklWKjqyKMjlXWjGnnovV8a4UHV9lciKm
         W2cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3nuS/o5N0jY1sctqPNAwUS/VxwGp/HFm2vpuT3BHgTM=;
        b=BrW/CdGYu6+SLoQZOKmIxY5DYlA0HEi5MgOMzMeZdzoqt4TQlfy0au5sdTfK7VIfID
         ReoKX3O0rnqbTayVXGPQqCZwBcvvwtRE9wj3P8+Zu/u6MNKxMrotTuOi7IecCyxbprd1
         TSl1gXqQVgw6FdPPUYet88CZ5/KDLPGXcksFdE2+kzccv53I8qKvBsDN9JCyopIA5knH
         Kudm44URl54vY9A22dGXMoxLjrwRiQgK4rFgMvs0y7H/fhReDXk6+4Lm9mgwazIzbUmD
         62XmFi88sXn0WAl0DrmHYfDwiKyX4HELfX/M64cgDPvX7wl/hUIFaq+AF0qZak3g5WpD
         89OA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gACsrSkE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x1-20020a05620a448100b006a6b1c731ebsi9337065qkp.58.2022.06.20.11.51.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 11:51:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gACsrSkE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3MVA-0001pg-AK
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 14:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaO-0006OW-C0
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:53:18 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:40538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaI-0001Nz-0v
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:53:13 -0400
Received: by mail-pf1-x42c.google.com with SMTP id c205so4147669pfc.7
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 10:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3nuS/o5N0jY1sctqPNAwUS/VxwGp/HFm2vpuT3BHgTM=;
 b=gACsrSkEIbXBFWUJ0MTV1dinp9/Zho40qd5qjo8gEHGdmZitXiMl8l0LvRS0bU9a6R
 cJJFlA15xZ9esKRj++CcyoyVAuXpkKrZF0BoJD/6qzZM+kMNeLMZT0OdOKjP459UA4dn
 aJyl7CytzCEhlCjkNzlW4ToXqKkrtJhqJJ3NBTChm5DWpFBGyxuHf9bpBsPala9Q5Cgf
 F6Wqy17oW7JJ+CETvVbFDoro5ToWI8ZQ+ml9I783aaOcu00cq42ppZBEUp2zC4Y7tvW0
 pLoGwHg6pqqf76kMGPC9T9ab0S17Fv6okV4pbzqhI79sliOPy6G54bNV6cW/q5z7iqVy
 IYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3nuS/o5N0jY1sctqPNAwUS/VxwGp/HFm2vpuT3BHgTM=;
 b=YHPVAuocPwJ/386UTuJUI7Og1oEgrDjJ5/Q+z8csQOPz32LTvEycT6vJmzHsRAiHNB
 Sbz2PkOi0Nrfaa6wDpUZsJVacj3ElVTh7FU6RbYebcJm7V3G5M6yyVfHQsCC4pZMTRC1
 XmzFbJHVD1hkV8vpWimTlw/+etA9lVGXraX1t44nTYQe6s6Srl8y5+STjm172O2rSYgL
 wkvsYaf3r5/OGBwwelALrWX1CJOsKu71Esc+VjNyoedTCyAXX11MHIQcYoKXE4tEZ8K4
 KK1N59L7ZxQ3nBHP/sDiIMcbHfI3q/uHM872wp1S8ZrswvtZCYVOEpWIxxE5xXoXxfN8
 K4iw==
X-Gm-Message-State: AJIora+7jBq5ZdG6KjXzYFlm5o3sBrRSIqHPZlQaM8S+VVo0vR1wtUjO
 CD3jKq7EB+nyVZRV/W6ay5WXdBIS+l6JdA==
X-Received: by 2002:a05:6a00:21c8:b0:4c4:4bd:dc17 with SMTP id
 t8-20020a056a0021c800b004c404bddc17mr25931294pfj.57.1655747589237; 
 Mon, 20 Jun 2022 10:53:09 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:53:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 38/51] target/arm: Enable SME for -cpu max
Date: Mon, 20 Jun 2022 10:52:22 -0700
Message-Id: <20220620175235.60881-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
X-TUID: M8h7OLwJEoSM

Note that SME remains effectively disabled for user-only,
because we do not yet set CPACR_EL1.SMEN.  This needs to
wait until the kernel ABI is implemented.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst |  4 ++++
 target/arm/cpu64.c            | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 83b4410065..8e494c8bea 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -65,6 +65,10 @@ the following architecture extensions:
 - FEAT_SHA512 (Advanced SIMD SHA512 instructions)
 - FEAT_SM3 (Advanced SIMD SM3 instructions)
 - FEAT_SM4 (Advanced SIMD SM4 instructions)
+- FEAT_SME (Scalable Matrix Extension)
+- FEAT_SME_FA64 (Full A64 instruction set in Streaming SVE mode)
+- FEAT_SME_F64F64 (Double-precision floating-point outer product instructions)
+- FEAT_SME_I16I64 (16-bit to 64-bit integer widening outer product instructions)
 - FEAT_SPECRES (Speculation restriction instructions)
 - FEAT_SSBS (Speculative Store Bypass Safe)
 - FEAT_TLBIOS (TLB invalidate instructions in Outer Shareable domain)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 19188d6cc2..40a0f043d0 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1018,6 +1018,7 @@ static void aarch64_max_initfn(Object *obj)
      */
     t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);       /* FEAT_MTE3 */
     t = FIELD_DP64(t, ID_AA64PFR1, RAS_FRAC, 0);  /* FEAT_RASv1p1 + FEAT_DoubleFault */
+    t = FIELD_DP64(t, ID_AA64PFR1, SME, 1);       /* FEAT_SME */
     t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_2 */
     cpu->isar.id_aa64pfr1 = t;
 
@@ -1068,6 +1069,16 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
     cpu->isar.id_aa64dfr0 = t;
 
+    t = cpu->isar.id_aa64smfr0;
+    t = FIELD_DP64(t, ID_AA64SMFR0, F32F32, 1);   /* FEAT_SME */
+    t = FIELD_DP64(t, ID_AA64SMFR0, B16F32, 1);   /* FEAT_SME */
+    t = FIELD_DP64(t, ID_AA64SMFR0, F16F32, 1);   /* FEAT_SME */
+    t = FIELD_DP64(t, ID_AA64SMFR0, I8I32, 0xf);  /* FEAT_SME */
+    t = FIELD_DP64(t, ID_AA64SMFR0, F64F64, 1);   /* FEAT_SME_F64F64 */
+    t = FIELD_DP64(t, ID_AA64SMFR0, I16I64, 0xf); /* FEAT_SME_I16I64 */
+    t = FIELD_DP64(t, ID_AA64SMFR0, FA64, 1);     /* FEAT_SME_FA64 */
+    cpu->isar.id_aa64smfr0 = t;
+
     /* Replicate the same data to the 32-bit id registers.  */
     aa32_max_features(cpu);
 
-- 
2.34.1

