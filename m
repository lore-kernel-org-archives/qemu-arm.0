Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2438236lft;
        Sun, 3 Jul 2022 01:39:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ub3/CnERVqiqzyjikh5lL/JqsqbkTyrkiUrR7xBe8Ew9gFbZkxCZ1+gPlTiyXW+xUph8b9
X-Received: by 2002:a25:9a48:0:b0:669:b51a:5b8d with SMTP id r8-20020a259a48000000b00669b51a5b8dmr24387677ybo.404.1656837545126;
        Sun, 03 Jul 2022 01:39:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656837545; cv=none;
        d=google.com; s=arc-20160816;
        b=Bpn8kaJSDP3bTtSMXlTixW1t3i4rU9iPh5HeAejxHsixCZCWeYBrQG2ejyIlWxfeIH
         TXHksC3I3KV8gH/8Fpz4wvwNrpTqlbadCoLPYUCnWx2Sj9cTqeJ0tAFXM3cq02uWax+z
         hBsgdXOgXqkUtlgpwZx2pVpbX4bkIp4S9zZRu1zfTh/rTNSOvp1ljOkBJSMkX2KHFmZv
         7yxhTVUVj9J0bjhrHosBdQ5LQRC1Ixh38FLXaHklO4PjDCiyWS6mq8+62wdMEEwKtTuN
         cxiue70aCGxjlwOGLJNvqZuzQQavInL1IIgMMORPSUZW2rhICT5G3zDPFTsTj9GONaHR
         lruA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PdgMMDPY/PA7ZASda7ITPHb+8tgdBcmBCdmhnbT+eGk=;
        b=fZhu/IaPcd4u2HMzbKdlAvGBwsU9+G68LDQP8Cd6dXxU2V64D6d7DgNN9BKErRfTyn
         8FTQexPtk7W1d8HOyNg5CNePkZNW7l0U42dg/27bdDNqu7oSmjNzZqEAYd6Fnw362zH3
         kPc3ccwkOih/7G/oqmhOsQzmUvxu1nHUoSZBBY1YanqLDhfZWP200d2zbVhBTT4a3VMR
         HWy4wHbT6TzPxLS3Wwh/yGRnvTggdmeKs30RHGXsI/1afMMpTWRe8PCvdSHDnfyYMrbL
         zzLMuFC1G44t5Sb9org/+cpb1CUe2GI3hDQxIiz7gqA8y9AFgdBeZr54U2VaFgXtGSFJ
         rH9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VFf5P75p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 69-20020a810e48000000b0031c8bef508esi1231346ywo.527.2022.07.03.01.39.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 01:39:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VFf5P75p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7v8B-0005k7-Vq
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 04:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuW-0006lO-Pa
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:24:57 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:36493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuU-0005ro-D9
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:24:56 -0400
Received: by mail-pf1-x42c.google.com with SMTP id f85so2519787pfa.3
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PdgMMDPY/PA7ZASda7ITPHb+8tgdBcmBCdmhnbT+eGk=;
 b=VFf5P75pROgYjJ6zLa7zRk5IyQXBkg4lWB7eeDPU0ChEseqAs4xyUFg3hbA9EPYW00
 iJ0Vvpx3w/7B7EAQolZuI31I7lzCNohV0EIHFBnNQN4UzxKAsAuHJXu3UpC1I+8+1mmC
 mCIsm+/vPOvkky92zXAhEwT3dpV7UsCDYWQYhLVcv5yZEIqpyMJ0ezDtyQETo8ffEfFy
 /sCpGHtIyqOyH17XsmL7raB8Pr4fCjaVHgQNtq6nnSlk/DOGunqhBpy0upBE/Lw5ggcX
 ah+3WLyKCZ0yAAd2vHKA3ufPkpnT0W/9VGvMCtqBfCL4cZysJ4dQInczMv89/6UH18iS
 6aNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PdgMMDPY/PA7ZASda7ITPHb+8tgdBcmBCdmhnbT+eGk=;
 b=pEa1J9nEc0ZDNUwUycXxLhTLsGNrweRrhc3AvOOsTgC7kV919i69xkNUFrcQ8cB4yQ
 IxKqK5lUILboHpEHdGi8pOulzEAeijv6WPnt8u3lnpfHaAP090y/UFX41P1wOiS7VoDh
 VOxQHhGxTnUpHdUn1FLhyBtcv934LMMPSEIp2vYJtuQ2pQufIrKlgW4sHpjuymAEomRY
 rpZvhl4hkGTyGVij9GevfV5kL6PxKHWrXGs9AYLuRPQifuxcC8IQ7CFVsv3yGaZXwvaU
 kCc4lCddabR9d+E/qSrprOYcAl8iVkhFNjXJCt0EgtwekAaJ4nScG57VBWizYDijpY1h
 dcTg==
X-Gm-Message-State: AJIora8h84xOeD5qSqKcxJwT2wEBmbEsmecdRPeX/VrGjj7HziYdCZIE
 5eWQjO59GxvSwxojj0i1a7nlb7L6BjHT907G
X-Received: by 2002:a63:1e59:0:b0:412:b99:2ad6 with SMTP id
 p25-20020a631e59000000b004120b992ad6mr4929664pgm.241.1656836692727; 
 Sun, 03 Jul 2022 01:24:52 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:24:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 09/62] target/arm: Fix ipa_secure in get_phys_addr
Date: Sun,  3 Jul 2022 13:53:26 +0530
Message-Id: <20220703082419.770989-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 82oW5lrJuuL7

The starting security state comes with the translation regime,
not the current state of arm_is_secure_below_el3().

More use of the local variable, ipa_secure, which does not need
to be written back to result->attrs.secure -- we compute that
value later, after the S2 walk is complete.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 1a946f3757..b78658161f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2304,6 +2304,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
+    bool is_secure = regime_is_secure(env, mmu_idx);
 
     if (mmu_idx != s1_mmu_idx) {
         /*
@@ -2328,18 +2329,16 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             }
 
             ipa = result->phys;
-            ipa_secure = result->attrs.secure;
-            if (arm_is_secure_below_el3(env)) {
-                result->attrs.secure =
-                    (ipa_secure
-                     ? !(env->cp15.vstcr_el2.raw_tcr & VSTCR_SW)
-                     : !(env->cp15.vtcr_el2.raw_tcr & VTCR_NSW));
+            if (is_secure) {
+                /* Select TCR based on the NS bit from the S1 walk. */
+                ipa_secure = !(result->attrs.secure
+                               ? env->cp15.vstcr_el2.raw_tcr & VSTCR_SW
+                               : env->cp15.vtcr_el2.raw_tcr & VTCR_NSW);
             } else {
-                assert(!ipa_secure);
+                ipa_secure = false;
             }
 
-            s2_mmu_idx = (result->attrs.secure
-                          ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2);
+            s2_mmu_idx = (ipa_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2);
             is_el0 = mmu_idx == ARMMMUIdx_E10_0 || mmu_idx == ARMMMUIdx_SE10_0;
 
             /*
@@ -2383,7 +2382,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                                     result->cacheattrs);
 
             /* Check if IPA translates to secure or non-secure PA space. */
-            if (arm_is_secure_below_el3(env)) {
+            if (is_secure) {
                 if (ipa_secure) {
                     result->attrs.secure =
                         !(env->cp15.vstcr_el2.raw_tcr & (VSTCR_SA | VSTCR_SW));
@@ -2407,7 +2406,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
      * cannot upgrade an non-secure translation regime's attributes
      * to secure.
      */
-    result->attrs.secure = regime_is_secure(env, mmu_idx);
+    result->attrs.secure = is_secure;
     result->attrs.user = regime_is_user(env, mmu_idx);
 
     /*
-- 
2.34.1

