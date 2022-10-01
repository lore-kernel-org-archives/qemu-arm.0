Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp459243ocs;
        Sat, 1 Oct 2022 09:24:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4mapuwCAKw9lC89aH3Z1PurEb0yt4TPlLiRT1LxBI487VWNL/1SZi1X3YptITPRmxkL2/N
X-Received: by 2002:ae9:e70a:0:b0:6ce:bfc0:f98b with SMTP id m10-20020ae9e70a000000b006cebfc0f98bmr9569079qka.381.1664641458618;
        Sat, 01 Oct 2022 09:24:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664641458; cv=none;
        d=google.com; s=arc-20160816;
        b=zvmeou8fYEwQ9yRRdXx/XNMDmML7uFT2mVOG2xZV1ocMo/ItdbTPGGN9Yya18GGcVS
         2vhGu3WZSBB7WgHd19X17fovjOh2JC9QW7UakbkQNog4GGQKCwN8qppTD0q4eTlqyGJR
         AA9pHN1BJMteNhCBeyNSIIkv8a2Fw2HVM9pZO9u21dRyVZkAy2DxQt3y9h9hvgn1y1jI
         ifpoWOCwTbdUjfoe/LmJEEsXCtvGHy/nweKixSKOvfpGh0JXr2YS7bkvdfu9H1Ezultv
         XcWqd0Fq6f7k5fz2lA7j9/R7tc924HissHtJPk0W49n3zYqY8tsNUEStBTxPfblCXVuv
         qUwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sUrjBJ7dwQzpr5dWkCg6Vpf21komKkvxoPfjuiTQD48=;
        b=RSoXDiTB3lcn9r6FbUC1ofJRdoiRvFOnblDF8hkb2I5UA3vPUS3zfX9aDa8iYRyeIp
         QnHxm+NCajb9GES0eGua0KDW+W1Bmu1k/mojJ5RXmpzYid3XnsrOQuOti4Ly8SepCGDP
         jqM3X+oOMRYC4bX/zOHfC1SGVAkHQodwpE1TYg1IMR2GIcRaMfmK5cU1QEeBofrIorFv
         aXBc0XptOuZQk9vtopzsCA0QG2GQ5RQcZU6cp+eqqqANOMcsngtg1K9m2tVCbxCjrlU8
         70wXBeBkYD0YmUiuwxEMava4sHUN13wAK+WrzadVQNCG6BrPduzjiZfVfng/J0Krh49v
         IfZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YqMh1wM8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7-20020a05620a268700b006ce4e75fa5csi2885272qkp.423.2022.10.01.09.24.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Oct 2022 09:24:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YqMh1wM8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oefHm-0006OM-4e
	for alex.bennee@linaro.org; Sat, 01 Oct 2022 12:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefH0-0006M0-Kz
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:23:30 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:40490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefGw-0006DP-VR
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:23:30 -0400
Received: by mail-qt1-x831.google.com with SMTP id cj27so4336354qtb.7
 for <qemu-arm@nongnu.org>; Sat, 01 Oct 2022 09:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=sUrjBJ7dwQzpr5dWkCg6Vpf21komKkvxoPfjuiTQD48=;
 b=YqMh1wM8B6us+FgC9F+Y0msBRmrQt9992KTMWlqh0DIfeCSsH2RaKRHxX4GHO1B2KP
 YBSzOpDuIl9chCQiyY0l2tysMreZRfuxE+LKR6BtRopSCN2uNgyzD65/XpYC2w2xLfq0
 FIloio4N2J7DtHgBw45C5cRWWr15dXoSCufl549CTqLNttieMHNapW609i9jCVSDJGwl
 7zS2z4NJc6RCDgkLTwqbv2ykps/8HROGUf3EIyvDXXDSqwWcT7VCZ2JzIbhpqcK9cJpG
 5f4k59riCZxkg/fMCyzMpTkHknHTm9TvUPPINpef1CUyb4g971sldbKKSHbIVT+AUPsC
 Mbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=sUrjBJ7dwQzpr5dWkCg6Vpf21komKkvxoPfjuiTQD48=;
 b=chYLcuvrfbeYpIEw/I30OkUt8q6227wbqaXxvrBMKnSaIEPBqenSPyeban8MehCFlf
 OxQMXb9nOQzSyKTspDgk6H0IdQc+6odWommixiuHSRKLFHUNMAFYpsHlGcGn5bqAK59S
 j6MM3yMmicIqpXpicntMm6Yjth+kbDIPPXaUGZ1k2gY4DvWLx+yjW3q3j/WpnCfVUvy/
 FlrTsYP4lPh/Rr9pKcIzEAo+REY+44WYbk5cnNg3IWZi+OWPD3fS1AUyBa93vjqTURoL
 CplLZYQEWH0jVzufJ9jZL4trTIMZxvI+WfSD+rdlsK8XJ4Aqmek/Wxp8AjNoKhSVGP0B
 PqFA==
X-Gm-Message-State: ACrzQf03BQg4fqYaPQ4yIpUVkhV9qEMjibve6GFRBFbXhVkTJJq/+X0i
 n2L3iXRlwtrLRAlHWI8u737CgeYHTVZhqA==
X-Received: by 2002:a05:622a:2c8:b0:35d:4b4d:57b0 with SMTP id
 a8-20020a05622a02c800b0035d4b4d57b0mr11032021qtx.307.1664641405917; 
 Sat, 01 Oct 2022 09:23:25 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:23:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 01/42] target/arm: Split s2walk_secure from ipa_secure in
 get_phys_addr
Date: Sat,  1 Oct 2022 09:22:37 -0700
Message-Id: <20221001162318.153420-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: AmItQ0FSFxf6

The starting security state comes with the translation regime,
not the current state of arm_is_secure_below_el3().

Create a new local variable, s2walk_secure, which does not need
to be written back to result->attrs.secure -- we compute that
value later, after the S2 walk is complete.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Do not modify ipa_secure, per review.
---
 target/arm/ptw.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2ddfc028ab..b8c494ad9f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2298,7 +2298,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             hwaddr ipa;
             int s1_prot;
             int ret;
-            bool ipa_secure;
+            bool ipa_secure, s2walk_secure;
             ARMCacheAttrs cacheattrs1;
             ARMMMUIdx s2_mmu_idx;
             bool is_el0;
@@ -2313,17 +2313,17 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
             ipa = result->phys;
             ipa_secure = result->attrs.secure;
-            if (arm_is_secure_below_el3(env)) {
-                if (ipa_secure) {
-                    result->attrs.secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
-                } else {
-                    result->attrs.secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
-                }
+            if (is_secure) {
+                /* Select TCR based on the NS bit from the S1 walk. */
+                s2walk_secure = !(ipa_secure
+                                  ? env->cp15.vstcr_el2 & VSTCR_SW
+                                  : env->cp15.vtcr_el2 & VTCR_NSW);
             } else {
                 assert(!ipa_secure);
+                s2walk_secure = false;
             }
 
-            s2_mmu_idx = (result->attrs.secure
+            s2_mmu_idx = (s2walk_secure
                           ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2);
             is_el0 = mmu_idx == ARMMMUIdx_E10_0 || mmu_idx == ARMMMUIdx_SE10_0;
 
@@ -2366,7 +2366,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                                     result->cacheattrs);
 
             /* Check if IPA translates to secure or non-secure PA space. */
-            if (arm_is_secure_below_el3(env)) {
+            if (is_secure) {
                 if (ipa_secure) {
                     result->attrs.secure =
                         !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW));
-- 
2.34.1

