Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA9CC43458
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Jul 2026 18:42:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfMLI-0007DB-Gp; Thu, 02 Jul 2026 14:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfMLA-00078m-5n
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 14:40:49 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfMKp-0005MK-Pt
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 14:40:46 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4938d5f86f3so7696975e9.1
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 11:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783017626; x=1783622426; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mkoXpIbTWhp23z0tfD91aY5yZBlUpXNBZ010xFJTbHA=;
 b=uSz9G05bc32/nGTqv7CG00N9umNwy3p8EwMMv1+IhHV3XndopjZFuyAFFO392sQl+z
 /4j4rA6eNcl6J1oLWVQjIGXO5vvv3v2JBHo8pLaKJ/iKIJo2eX/F0NYUtCGKWn5vbTbp
 XSOKFe/yNlwUtFa0c12tKwBsffCigyBvABtQcbaVPJ4aQ5rBGUl6vJXX/QNf7BDjURD8
 gs4eE7JMw1yTVYjtIJn3QRrvyHAdvb2kDAcUXE8Djdsbhj8gbc/j8tMdCJKyTmjko90Z
 mr/aI/SsvnRRGwAkSJ6sBGa4vua+re6KgNU2GO8pUqkOY7CO9tH/lLgrvRXhInZc1yrh
 HCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783017626; x=1783622426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mkoXpIbTWhp23z0tfD91aY5yZBlUpXNBZ010xFJTbHA=;
 b=W9Kx15qX5WA2d9IE/Vrzd7SGAM0AkT+mQ7ASW/i5PvSuKJREy+Lu1Js+T9Cm+n2xs7
 APpyy9ZeFlu41L4tFlB1dWXKCuLnw+87B8JLiIG+nSLV9EkXog/1CB1L5TXOKiNuzB7q
 J6sAMxv44AOXKzh075KtBJhAoJyTSe/wIbwaGTqgR5m4wJ5plVcJzTk9PLRTccdsoZor
 jUCZsIa1DdA8t5x3D9NbI8scdIKrwt5G9XH5UxOy7Vtpl39f66mGS4pCI6of8V1Rjntb
 ZxLcJZGVvmWQuAgTsEoLE1DX+ocFGoSM+PIZd5kwKpmsvbUf8JB5XLzzNHSxDILDWxqx
 2goA==
X-Gm-Message-State: AOJu0Yx6MkUEq3LIUEkw9MD2P/PjaLIT5TMmX01G6AmqZDbt8u+VVg4K
 Z/A02AlgcoZKX4pTmW9SfBcQdQ/M80gOgvRDK1u1TOeL+niTJw6KH6/DsgQD5FeayHK9ihSX0CS
 M4WlD9Og+fQ==
X-Gm-Gg: AfdE7cltR5ykh8W6CsiaUquSwZ/Aa4ZEJNsPZgTZfBbRDmJ2fKSN7TBHsZaR2+4+Cfm
 aPYaoAosSmURL2MFTSrG6xtcFTthccTSELpHR5FStriV+fGxA//Swg9kHPlzvic3R/vOEyACGCs
 uGnqvcGo3ojAfQIAH0fKY9E2nRmaeP4nHv7iQEgdAmq7Vb61KgdUOHRs2/uthGfg4o1QqVRNIsS
 BCvknjZh/3eQ9MeoGJdO//vh+JAJPUZJx7ZT4NWxqyUOPcpZsMVKMfzRf7A7uQshTIljPaZc/ym
 faTsaQItobF71uOpZElAuvXG21kIcnDjFt+2sxDDVy45VVEmi24OEg8IahiR7W/Zbx18Fp1AOsz
 FnFMl9GlZM9Hd4kUDdCHRf60uzqit6QP7cFuNGJAthU1gqVVQdvzdIBROUNZXaud8+d0NKoWAP2
 rOUp1uG1nvTTDZ92sJKup4NypRDWFl8L42w5ucgfQM3bST/WxM6acmgkI2pTFy697mhPs34dBWC
 V5CdL0rRHQsSEoVg3wCNw==
X-Received: by 2002:a05:600c:3b2a:b0:492:6f5c:fd8c with SMTP id
 5b1f17b1804b1-493c9b62894mr14907795e9.15.1783017626304; 
 Thu, 02 Jul 2026 11:40:26 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db8a4a09sm11628213f8f.13.2026.07.02.11.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 11:40:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/11] target/arm: Handle NSACR.NSASEDIS in HCPTR accesses
Date: Thu,  2 Jul 2026 19:40:14 +0100
Message-ID: <20260702184019.3431139-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702184019.3431139-1-peter.maydell@linaro.org>
References: <20260702184019.3431139-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

In cptr_el2_read() and cptr_el2_write()  we have code that implements the
"HCPTR.{TCP10,TCP11} behave as RAO/WI from NonSecure when NSACR.cp10 is
0" behaviour.  There is a similar requirement for HCPTR.TASE: if
NSACR.NSASEDIS is 1 then CPACR.ASEDIS behaves as RAO/WI in NS.

This doesn't matter to us yet because we don't currently implement
ASEDIS or NSASEDIS. But we're about to do that, so add the handling
to cptr_el2_read() and cptr_el2_write().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 926c9ed516..f645860e4f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4094,11 +4094,18 @@ static void cptr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
     /*
      * For A-profile AArch32 EL3, if NSACR.CP10
      * is 0 then HCPTR.{TCP11,TCP10} ignore writes and read as 1.
+     * Similarly, if NSACR.NSASEDIS is 1 then HCPTR.TASE behaves as RAO/WI.
      */
     if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
-        !arm_is_secure(env) && !FIELD_EX32(env->cp15.nsacr, NSACR, CP10)) {
-        uint64_t mask = R_HCPTR_TCP11_MASK | R_HCPTR_TCP10_MASK;
-        value = (value & ~mask) | (env->cp15.cptr_el[2] & mask);
+        !arm_is_secure(env)) {
+        if (!FIELD_EX32(env->cp15.nsacr, NSACR, CP10)) {
+            uint64_t mask = R_HCPTR_TCP11_MASK | R_HCPTR_TCP10_MASK;
+            value = (value & ~mask) | (env->cp15.cptr_el[2] & mask);
+        }
+        if (FIELD_EX32(env->cp15.nsacr, NSACR, NSASEDIS)) {
+            uint64_t mask = R_HCPTR_TASE_MASK;
+            value = (value & ~mask) | (env->cp15.cptr_el[2] & mask);
+        }
     }
     env->cp15.cptr_el[2] = value;
 }
@@ -4108,12 +4115,18 @@ static uint64_t cptr_el2_read(CPUARMState *env, const ARMCPRegInfo *ri)
     /*
      * For A-profile AArch32 EL3, if NSACR.CP10
      * is 0 then HCPTR.{TCP11,TCP10} ignore writes and read as 1.
+     * Similarly, if NSACR.NSASEDIS is 1 then HCPTR.TASE behaves as RAO/WI.
      */
     uint64_t value = env->cp15.cptr_el[2];
 
     if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
-        !arm_is_secure(env) && !FIELD_EX32(env->cp15.nsacr, NSACR, CP10)) {
-        value |= R_HCPTR_TCP11_MASK | R_HCPTR_TCP10_MASK;
+        !arm_is_secure(env)) {
+        if (!FIELD_EX32(env->cp15.nsacr, NSACR, CP10)) {
+            value |= R_HCPTR_TCP11_MASK | R_HCPTR_TCP10_MASK;
+        }
+        if (!FIELD_EX32(env->cp15.nsacr, NSACR, NSASEDIS)) {
+            value |= R_HCPTR_TASE_MASK;
+        }
     }
     return value;
 }
-- 
2.43.0


