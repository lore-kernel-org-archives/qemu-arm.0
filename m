Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A751E67A8A
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 07:43:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxKP7-0005DK-Fo; Tue, 03 Mar 2026 02:42:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vxKP0-0005Av-Hf
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 02:42:48 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vxKOy-0004PR-Ql
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 02:42:46 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-48370174e18so30298285e9.2
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 23:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772523763; x=1773128563; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9ZM9mNz6zwnkWaGtHhriww3PWOpHAKltkTFhcIZOsSI=;
 b=tO9Iroeu8lMC3kxiGDEbKyGTxVMHCyPzlqzfj9TpMb0PfnaXu3RvPBvzLyZ3znwNMR
 vkj8+sXN8aK0Myhre5eVwoSX23jjpx22gV4Rp1RbnhyoPt0MSln1VxeCK3e5QEKmAO2E
 yIwBfJAKGIgUS+N+zVSSR2gaU76Xc/sTgDmK7WV5uyipdJvVt4WjzNtKCbyTZhV8Z08t
 j0EeyCeF2Mm34fB5JuoKCacQImlKnPHfFqw2RZTe2W2eJ/owNmEC4Cz4wQZgBAR/wIVR
 H17BjVN16QNYHIi5Hxs7f4Y0yS1zicFlUwtTT1YwVBYoKRrGP4Y3igz+bObKj2piqkCB
 7CfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772523763; x=1773128563;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9ZM9mNz6zwnkWaGtHhriww3PWOpHAKltkTFhcIZOsSI=;
 b=DMOyLItVlKwbRHubKU9Oqhu9kayB6yAIZBywumLKsgu3weAVjH1FtwN5JP064L7/eR
 4cCDCRBLB5j8cE/rcG+88XL8O0NaFJ2cfz7OO84HJVJb2SrunI8QgpYbv2VOxNz8fVqA
 EqCgaJ2Ia6QqC5x5921MsIwRm0O9EmelX/xyrbpjoVRxC5Up+Ler4QNMb8KRTXjVjNXa
 BP0D1/rPUOj27XD18Zqsf88OTNsSg6bX13RkaSPMFbMqubPIvMpNQrWjvxPoNnEmADvh
 ynxwW68QDHVfWMaenot2MPascd10dsesgehXtD+52Z72dvIGpLIGAAUvIUsNr/ZNKYFV
 r4Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeJjR7XdjAoJ4BrwY4HKO35m8oXFG9nkNHrffx/x6iUI2sN1Y0Y3RmDBsDOGpdgn+OlnSpsBaEHA==@nongnu.org
X-Gm-Message-State: AOJu0Yxl8Ik7nPIPxNhIfsoEZWKiVEikhPi2xnjUOIPTFOhErkjDazmi
 tLXHL9hI7XtQ6qUO6kbWWvFYuxOctukePgJkpmzLn9XBKEePBVTpvAHIa7s3IqNuU10=
X-Gm-Gg: ATEYQzwFbObJgFlhTJ6N8sWaVDPyj9CseF7Y6iCsXqkoO9y7xSjkIQ7YXcAliQIBd3t
 x/MI9TULxwo9mkvph8ETBPdmW1GZ0wxkCGslMpHX5bzNDgmQnDeLDd9KCdUxdcYKN1YFK2ZbmR2
 9csDRONJm+AnTVsNnlHcSlK9m8J+m2fScMdKWtWxvSmfuj4OoJU2WkJE06jePiWd+iqc2xMmOwB
 e5Jmnn6ODq8mOs2/gpXW+b8CLlHsmLYeIk8Vs3J9xfXlxDr7qIBta6aw8zEfW3FWUYVZNltn+7w
 mXMpzMtRI/ZRsrn90u5Rp5mGYz33aVrbV80bIYtML3cc5QjYdn0IsCjSrLTE6zQGIrqhxjTpqj+
 V5YeNiquc1Jd3Cwem8oF7082Ju/oWKNAShn7vc1xSaycd1avmlRTzJbH+ZR/rVnGc4bKnQXxdY/
 bDNHVUIyBNj+hXvwZ+xE15r/UnAzjGC8gcqvySousa8541lKAxAFpolXeXzVKKHFTz4eEGp3MwY
 UpGKoLZ1KDD07RnNwbrd7lMRzetxgDbsy4EnSI=
X-Received: by 2002:a05:600c:5289:b0:480:1c53:2085 with SMTP id
 5b1f17b1804b1-483c9bbbf1amr270065355e9.19.1772523763340; 
 Mon, 02 Mar 2026 23:42:43 -0800 (PST)
Received: from [127.0.1.1] (ppp-2-86-215-248.home.otenet.gr. [2.86.215.248])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd6f26d7sm475943045e9.3.2026.03.02.23.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 23:42:43 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 03 Mar 2026 09:42:31 +0200
Subject: [PATCH v6 2/2] hvf/arm: expose FEAT_SME2 to guest if available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-sme2-hvf-v6-2-b473702d8287@linaro.org>
References: <20260303-sme2-hvf-v6-0-b473702d8287@linaro.org>
In-Reply-To: <20260303-sme2-hvf-v6-0-b473702d8287@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 =?utf-8?q?Phil_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Mohamed Mediouni <mohamed@unpredictable.fr>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2477;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=WVNPRF2RCfyfgAdYpuNUj01hpIeyQUpZ+n+CKvlLQtY=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQnBwcER2bVBNQ1NKclkrdDd0UFQ3bWtIM29zYWpPCnUrSkxtL3lkZmo1NVAxdTdQ
 RHFKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYWFhUTd3QUt
 DUkIzS2Nkd2YzNEowSzBWRC85cnJEK3BqanBWemxqRGFPWWRIdHZBNmZIb3M3UGpSOVlPN3RBcw
 pzVGlQWTdrdDNBZENRMjY2LzNMSG03WEhvdm96cHJNQStNaXIwTnQwUC85QnBNbjVWbitMZSs3S
 U05c2RFWlkxCm1TVTdqRzNKWGVPczRpbGIvMTZ1VGNkZ3ZqNlY4VTdYZHhUL2twanVFbk9pT1R1
 d2hseGdHNjVtS2tGb1YxS0QKSFNEakwvbm5QRE9vZG5RdHd0ZHo5T0c0QWhaU1liTHc3TGwrUmN
 XM2tKeG5sbHUyaGQzc2RhNmlBWGFac3RWcgpBVDFaNklrd3hFSnh0ak9RUUhXMDhrRUdPN0ozZW
 lES2ViSVVQWUJFUG9KQWM2cHJyZXVnTklpWGJlaDh3YWZoCmloc2RXWEl3NkE4R2l4OHJMTHZKW
 mwyUXcxL1B4SGJ5d25nQnNEUjhMU2prb2J6NlNXekFzVldyZ3BsMEhwZUkKcldyQ1RHcWF0K2py
 RFZhSExJRVZEYjNVdm1yWmM5R05sYmlUUzVUSmp4Y1NmeUtMRDZMd3psNUtUeDlwbDRNcApkek1
 2NStRS0NRS1BncS9HWVpoVk1oNmttVTBKM0tteGEydDBzVWZSK1VJMXMwTUplT1RQMUpGTC93em
 13ejF3CkZSYmoxa21jSzZGSUVNdFpRbnhaQWF3LzJlR0E3QlJjeXg5OHhvWUduNTdtMTI0L1FXS
 VZEVG0wSFNxNSthTGgKZGtha1lYUDZhcGUxNTdkNnFndDNRZzJmakd3bkVmaG95c3RwMjF1aHAr
 b0tYTGVaUWJmV0YwdzZKQU9ubkNOYgo2YzhOQ1hhUjdJSEZCWWdvcGhqTkxqR1ZXcDViUFF1MnF
 qaS9YbGtudzgwVms2MkZzZUlhMzdmY1hmOEZGQnVzCmE0TDFVUT09Cj1RMlRVCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x333.google.com
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

Starting from M4 cores and MacOS 15.2 SDK, HVF can virtualise FEAT_SME2.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 target/arm/hvf/hvf.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 3d194680cc87e78835098df2e0e7987ed544c553..c9787b3ea170b4814415f3d7b58ff9a29674ef2f 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -315,6 +315,7 @@ typedef struct ARMHostCPUFeatures {
     uint64_t features;
     uint64_t midr;
     uint32_t reset_sctlr;
+    uint32_t sme_vq_supported;
     const char *dtb_compatible;
 } ARMHostCPUFeatures;
 
@@ -1121,19 +1122,6 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 
     clamp_id_aa64mmfr0_parange_to_ipa_size(&host_isar);
 
-    /*
-     * Disable SME, which is not properly handled by QEMU hvf yet.
-     * To allow this through we would need to:
-     * - make sure that the SME state is correctly handled in the
-     *   get_registers/put_registers functions
-     * - get the SME-specific CPU properties to work with accelerators
-     *   other than TCG
-     * - fix any assumptions we made that SME implies SVE (since
-     *   on the M4 there is SME but not SVE)
-     */
-    SET_IDREG(&host_isar, ID_AA64PFR1,
-              GET_IDREG(&host_isar, ID_AA64PFR1) & ~R_ID_AA64PFR1_SME_MASK);
-
     ahcf->isar = host_isar;
 
     /*
@@ -1148,6 +1136,8 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
      */
     ahcf->reset_sctlr |= 0x00800000;
 
+    ahcf->sme_vq_supported = hvf_arm_sme2_supported() ? hvf_arm_sme2_get_svl() : 0;
+
     /* Make sure we don't advertise AArch32 support for EL0/EL1 */
     if ((GET_IDREG(&host_isar, ID_AA64PFR0) & 0xff) != 0x11) {
         return false;
@@ -1199,6 +1189,7 @@ void hvf_arm_set_cpu_features_from_host(ARMCPU *cpu)
     cpu->env.features = arm_host_cpu_features.features;
     cpu->midr = arm_host_cpu_features.midr;
     cpu->reset_sctlr = arm_host_cpu_features.reset_sctlr;
+    cpu->sme_vq.supported = arm_host_cpu_features.sme_vq_supported;
 }
 
 void hvf_arch_vcpu_destroy(CPUState *cpu)
@@ -1339,6 +1330,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
                               arm_cpu->isar.idregs[ID_AA64MMFR0_EL1_IDX]);
     assert_hvf_ok(ret);
 
+    aarch64_add_sme_properties(OBJECT(cpu));
     return 0;
 }
 

-- 
2.47.3


