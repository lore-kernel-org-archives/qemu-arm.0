Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2826590ejt;
        Mon, 19 Jun 2023 07:02:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4CjFKqUd91OGEkb84/6m7ex4tU/pHuV1PAzqDx3JjRE+UL0YUCwhLl1LVfTy0NEEcwagov
X-Received: by 2002:a05:6214:c4b:b0:61b:75e0:6a19 with SMTP id r11-20020a0562140c4b00b0061b75e06a19mr10998653qvj.14.1687183354559;
        Mon, 19 Jun 2023 07:02:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687183354; cv=none;
        d=google.com; s=arc-20160816;
        b=rVOsVkZJQrUkgn5/WE4pkdrMEBryM+7juuanYrF4mbW8CJBqbZodLD422nj74kekOd
         MLJPwl5NT87xRmasWK8KWtsxMEcLpbSwrw0zu8e2JZ0evikIO+KDtrXfngMFvTt26f/P
         wstWVKxh5qEMLKE4YNPrDgd0nkff9trIV7R5e+ydNg0ipviKiIq3LRRSzbJtUj/ILQuy
         oM5EtmrSsc+anUs/Qrt31E81ruiPpYvzBC2nCS5aRBBJvBRwqRgchSukHJBjrEpeLJEw
         vAzgv6skHS5UEEybORo10qyQVrDGvlas17fpmXpYst2u/7JXKhf7xyEU46dY5WJCnYOV
         m+/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ic2ReGah2UVp+gcQLs0X9D8a6Pz1giA0UurYzsdrHBE=;
        b=qycXpI8lEsBlp9GcVqjgiTyGBBdvOm5b7uZUqhRwy67kTHrhRsz3eJVgPsi2MOB1WQ
         OzkAGMxHxvyxsQBJGzveJuStrNBzbqI8rml3gM2uPOFuZAMhOCEC0QV5XEJVdlNwzjAV
         /tiJJ8meQwi/FbLiry72aHrxTnB42T5f5yPTO/cDYpi/0328gr2fwY/jlxHVIL3sDoX/
         WAGuBN6ozbpy0bhxz3of3aeyFNXq92vWgoE/Ju4fA9sgYPhbPxlCDuzqoj92XlrKXRrD
         EnhAWZaZGqBkB59cT4UWcflYnLsNB77c2UnpObQicNouV4trOee8utV/eRvB5tyc6/Gk
         7Jfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LtpvvRO4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z20-20020a056214041400b006259adfabbcsi9735570qvx.283.2023.06.19.07.02.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 07:02:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LtpvvRO4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBFSc-0000Zp-Ta; Mon, 19 Jun 2023 10:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBFSb-0000ZS-Hz
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 10:02:25 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBFSZ-0003BK-Rg
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 10:02:25 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f9b4a71623so2851555e9.1
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 07:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687183339; x=1689775339;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ic2ReGah2UVp+gcQLs0X9D8a6Pz1giA0UurYzsdrHBE=;
 b=LtpvvRO4zt4quL1dEy5DnKcLc86AMrp+4xk5crZUGSCvXrabcjLTICz768Iwqs2eob
 FoP1BQLZQ4Jmk6JoDNilQD1rKybgnBn1JJt9ZHGUhFnWXYqrqfy5WC1bma1VArIlv5/A
 4h5+BA3tblWo9Wjg0zaLyDjbOP1iwUDZ5um/uqfTfx/w+XXeVjSE/sDvNk54OpS4kViF
 EAjEaagevZZWOyKPdU3naaYqS4SN8YFlIJzUKU0ftaurxzhQmzzN4pmbgEuOkQMcO01A
 G6z9egEMpw9K5paaOZHqrn3DhAt2yYGCXYLkLu2/PeJwFLFd8IAwvp03IPPh6ZMbMKg8
 HaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687183339; x=1689775339;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ic2ReGah2UVp+gcQLs0X9D8a6Pz1giA0UurYzsdrHBE=;
 b=BxJMmfRF3AJQG7E4f0wl9y5871h9jpjlFV1owmuDLcZ4Rm4PZAOJyZIjs359c4y4DO
 s5N/c2In2hW8ncGxc3VOILjL3S9svPv+cm14KaOHE52QWxaqk4BBfJOLDioCGOcu6iF/
 ZuWEuQQsXNJP5lwMsfS7CO7NugCPfsgE7NiAxNFpJ6EVM10/tIBa/69bTxI4btrXt+Wr
 WPZy5C79cyBb5yaOI/A3vDWZviwdY49TECqrTIBPZFxzzI79BSUaNI3db5D9ad9ddcmF
 WD/105FPXNlXmyV5u5qH9xNkSTprJNQai8gYamZH+Hy0pvWqggpmm5wGlctOgta08y/C
 hijQ==
X-Gm-Message-State: AC+VfDzxGphCtHtWVo7ge6wjumZAhyAS2u18/3PpUKrVY9HtWeQNePj+
 YgSP7aWqb0BBaT3NNVPQDCSYj9dmSSAb6hcdfamPqm9I
X-Received: by 2002:a05:600c:246:b0:3f6:cfc7:8bc7 with SMTP id
 6-20020a05600c024600b003f6cfc78bc7mr6769919wmj.17.1687183339279; 
 Mon, 19 Jun 2023 07:02:19 -0700 (PDT)
Received: from stoup.lan (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 k24-20020a7bc318000000b003f733c1129fsm10797816wmj.33.2023.06.19.07.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 07:02:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Mads Ynddal <mads@ynddal.dk>
Subject: [PATCH] target/arm: Restructure has_vfp_d32 test
Date: Mon, 19 Jun 2023 16:02:16 +0200
Message-Id: <20230619140216.402530-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0DBRDGC+d0pM

One cannot test for feature aa32_simd_r32 without first
testing if AArch32 mode is supported at all.  This leads to

qemu-system-aarch64: ARM CPUs must have both VFP-D32 and Neon or neither

for Apple M1 cpus.

We already have a check for ARMv8-A never setting vfp-d32 true,
so restructure the code so that AArch64 avoids the test entirely.

Reported-by: Mads Ynddal <mads@ynddal.dk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 353fc48567..706dbd37b1 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1402,25 +1402,27 @@ void arm_cpu_post_init(Object *obj)
      * KVM does not currently allow us to lie to the guest about its
      * ID/feature registers, so the guest always sees what the host has.
      */
-    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)
-        ? cpu_isar_feature(aa64_fp_simd, cpu)
-        : cpu_isar_feature(aa32_vfp, cpu)) {
-        cpu->has_vfp = true;
-        if (!kvm_enabled()) {
-            qdev_property_add_static(DEVICE(obj), &arm_cpu_has_vfp_property);
+    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+        if (cpu_isar_feature(aa64_fp_simd, cpu)) {
+            cpu->has_vfp = true;
+            cpu->has_vfp_d32 = true;
+            if (tcg_enabled() || qtest_enabled()) {
+                qdev_property_add_static(DEVICE(obj),
+                                         &arm_cpu_has_vfp_property);
+            }
         }
-    }
-
-    if (cpu->has_vfp && cpu_isar_feature(aa32_simd_r32, cpu)) {
-        cpu->has_vfp_d32 = true;
-        if (!kvm_enabled()) {
+    } else if (cpu_isar_feature(aa32_vfp, cpu)) {
+        cpu->has_vfp = true;
+        if (cpu_isar_feature(aa32_simd_r32, cpu)) {
+            cpu->has_vfp_d32 = true;
             /*
              * The permitted values of the SIMDReg bits [3:0] on
              * Armv8-A are either 0b0000 and 0b0010. On such CPUs,
              * make sure that has_vfp_d32 can not be set to false.
              */
-            if (!(arm_feature(&cpu->env, ARM_FEATURE_V8) &&
-                  !arm_feature(&cpu->env, ARM_FEATURE_M))) {
+            if ((tcg_enabled() || qtest_enabled())
+                && !(arm_feature(&cpu->env, ARM_FEATURE_V8)
+                     && !arm_feature(&cpu->env, ARM_FEATURE_M))) {
                 qdev_property_add_static(DEVICE(obj),
                                          &arm_cpu_has_vfp_d32_property);
             }
-- 
2.34.1

