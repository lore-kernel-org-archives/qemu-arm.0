Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0795CFD530C
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Feb 2026 08:02:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvsn6-0006Om-S0; Fri, 27 Feb 2026 03:01:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vvsn4-0006NE-Uh
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 03:01:38 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vvsn3-0001iw-5J
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 03:01:38 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4836f363ad2so20014335e9.1
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 00:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772179296; x=1772784096; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XHV1zf0s+0F/5mphPCH44zJjAmeYKXQ8aD+6cz/7SxY=;
 b=wcJLdBSVQJ0DzQF0KiceV2aRbYN0QB80fctqg9pBSJLUW3JUypkWamQpsG2Q5s2RnI
 Bxe2gSFO+xnVoaAspcX1n+Rs8S8AqC4xGboZP23CMTTTjcFkOGgpO7uRVAo3Ed/LW7H3
 Q++xq5Loq+X3XpD53cGpt3FutQ7KJSwyJWZsF69nU0Ft6UPc3eJ1zwZAItxCsXN8OmJu
 CIDRasZqCzToKbXygi+qTSdNLvLK0V1CU7qNEFiS9x6MStJRAC1cWwezZG7PiMOkzsCU
 MN0MQeMjsy3wPfFeTdznWcuYApkwoYzh3FpehylrMbTy2ihGqLFfLNQ3nQAblutu48Kc
 GbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772179296; x=1772784096;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XHV1zf0s+0F/5mphPCH44zJjAmeYKXQ8aD+6cz/7SxY=;
 b=keNYPr3CUJg4PD5bA2GPtQcX1uRFCYgdTWHYdI82rxOY1WlVZqjNyD6lJzKhU06Ncp
 et7c2NxZ01JmwJxQZ1/ggUWzK0rczafdGteIHKKNQEZh6jhnXJQbNxKPkR2552lbykJj
 yHlZEunxXukYtrRCKLxxHu2P4Y4xi8C9spdPaIsEQNEDZ40nF8p9SXdVVbhWM3y36cy7
 8lp3SqNTxBdEfZbSkskOQZYFc/wGIjtrhkL8B4+sjl4+brGzc1rmolq6ygdQ19R4vXsL
 uqX9493P3IOyuNyHor2xPGZkj5+2bRYLEZidASbKFxIiHNsdsoVemAkJo8JDgmGTIGVb
 W6Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbIYM+eIjtXE9RD7+4W/3+Ol4woHLUxpNEfakbteP44UgPQWmDifxCIgcF7oe3BOAsEAsWb4Rqrg==@nongnu.org
X-Gm-Message-State: AOJu0YyxTLPrdDFm8YfDNtkDKcK2xhXrAd5RBInfAwWD+7XUU1sbRQTT
 b4JIgg50Au/pa+3wOwvAu2J5XiTuWLCXpsuq1qZOm8RtAve9hj4kllYDShlpghv76yk=
X-Gm-Gg: ATEYQzwyJsZNjdJEx4EM4cycX/1L9q9I0iwT/HLMCHCpWPlZ9ClgPAm4dh96ZBhA2TA
 S8+jdYXa3TtoXZVdH3RWwb8ppUBaHLy2fASFZBsWRHDRHk9P/jXiPbHYDkzJTor+tQCr2CO/INZ
 ZfTVQXFuTNjd5+pp6Q1lzm7x+Ur98tL4OxMDDPUiXj3xFD9K3Ghrm1ZLptqoRQCfL4NvGICCNjB
 sHcUy2QDRz3DLa9lgv4Ahc9/LFnNJOiGKsiJqonqDCXRMqxxzqBT4eCposxg1UBEBJ6kwWFDIwI
 8VlAvdjQ/7xNk95Yy/lz0mElv+8+YrGc5AJDdu7O69qQV3zaR0ot/pnnUcjWszhv5diAPdY2v2t
 /+hTx65GQphWRFbSRUZBGk+7JkhS1ZM/a0Zg+NCEBR0CRFKLIiMBWNIGR1uz4PfIo3zo2adTT8H
 kRxRYofuX0dM+1QqSqsShb7rJKW/a3y/7y9q1XBk9LGWaTrqFTxsuNQO0mIZlTvU+pleLb3MaiG
 VxzOUiGnR+Wq+293j39eE3Ffi+9UuDx+ybpWGJxvy7gnTUB+A==
X-Received: by 2002:a05:600c:c490:b0:480:20f1:7abd with SMTP id
 5b1f17b1804b1-483c9c204b0mr27321915e9.31.1772179295489; 
 Fri, 27 Feb 2026 00:01:35 -0800 (PST)
Received: from [127.0.1.1] (ppp-2-86-215-248.home.otenet.gr. [2.86.215.248])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bffc17dasm98554765e9.2.2026.02.27.00.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 00:01:34 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 27 Feb 2026 10:01:28 +0200
Subject: [PATCH v4 2/2] hvf/arm: expose FEAT_SME2 to guest if available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-sme2-hvf-v4-2-3dae31a1876d@linaro.org>
References: <20260227-sme2-hvf-v4-0-3dae31a1876d@linaro.org>
In-Reply-To: <20260227-sme2-hvf-v4-0-3dae31a1876d@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 =?utf-8?q?Phil_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Mohamed Mediouni <mohamed@unpredictable.fr>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3015;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=e/vsNryygBBM3ClV3NdyZUVw3FsFJZH7OZZmrgohHKc=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQnBvVTliMnJnNG55RjJMZHRDYUhsMjNHUzdVMk0zCjZqNUMzQTJIK0d4QmN3Smc5
 ZENKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYWFGUFd3QUt
 DUkIzS2Nkd2YzNEowQ3BvRC8wY25iQ014NElEdGF1dSthZldmVlJ1ZkMrOE8wZDQ4RTR2Rk4xbg
 p4bjNhL3A1Z0huUi92MjhBQmlKSkxTajdxYm9SZERZdnRlZjBWVnpXdk1halBaWVROZjlKOFRsU
 2FrL2tiNzA3ClVsTE5hZGgwWmhvbHptMEJNV3lCdERRaFFHV05CeStHdUc4ZVNFZVFaTithei9V
 T24yQ1c5eHpnOXI2U3ZQcTEKMHV4ZDYycHBaOWIyeHpXbUpONjVuUTlidTVSZWtWcS9FcGRjT0x
 Ub3FrN1dJdzJVMThiWGlsNHkrUUJVdTY2VAowZFpFdU9mN2J0NThRSVRIVWN6SE12YS9Ld1N1Tn
 NqZnh4c3VUYjZpMy8vTW1JclU3b2VTWlExUGVtNW1pQnVxCm1kOWluTEs0Zytvd1V3M1gvajJMY
 2VpT25yeWhXa016QjNDd0MwZ2RtVDFRYlNPeHRvQXQ2M2VWbmQzWlZscFUKUTZmZW54NHhDRTJ5
 RDdtdkdHV0V0UW9lUnRQZGJ1V1JXdGpBZUtIQlpYOVVxcWFzMDR6OWNBM0MvTGlxekpCRgpuTWs
 2anJmOVVqcDdYcFovMno0eVp5ZXlVbzNkMHlkUmFxOGFzRkEwcXlBbnROYjNtK0ZjV2xqbFpvMk
 pkTGZuCnJlTHVhaEVXTDFHZ2JIUHk1RFBKN0psK0ExQ1o1bW1zNTdqNWhFSWVoMVl3MisvSkgwc
 1AzcEpGM0xtSkswL1UKTURUdkd3U2sxalU5VnZ3cVg5Vk5ZRC9sczZXbmgyanhEd0hlbzF6ekVl
 S3A2clNGNXJPKy9YQ1dCMVVFYnkwagpMMWx3Z24vYlpUem0vVE9XZ0sxYmVWUWx1M2R0eGdXOUk
 zZG1DL1RXdTBnQU5Xa3Z6b2dlRHd0RW1NUjZidVlBCjZKSjlFdz09Cj1sMzBJCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x334.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Starting from M4 cores and MacOS 15.2 SDK, HVF can virtualise FEAT_SME2.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 target/arm/hvf/hvf.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index ce62f8c97876e3fd948fad96df631f1b53db5e67..23e6de223e2ca63dc952e24889a9326d3bba3985 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -315,6 +315,7 @@ typedef struct ARMHostCPUFeatures {
     uint64_t features;
     uint64_t midr;
     uint32_t reset_sctlr;
+    uint32_t sme_vq_supported;
     const char *dtb_compatible;
 } ARMHostCPUFeatures;
 
@@ -1117,18 +1118,18 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 
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
+    if (hvf_arm_sme2_supported()) {
+        t = GET_IDREG(&host_isar, ID_AA64PFR1);
+        t = FIELD_DP64(t, ID_AA64PFR1, SME, 2);       /* FEAT_SME2 */
+        SET_IDREG(&host_isar, ID_AA64PFR1, t);
+
+        t = GET_IDREG(&host_isar, ID_AA64SMFR0);
+        t = FIELD_DP64(t, ID_AA64SMFR0, SMEVER, 1);   /* FEAT_SME2 */
+        SET_IDREG(&host_isar, ID_AA64SMFR0, t);
+    } else {
+        SET_IDREG(&host_isar, ID_AA64PFR1,
+                GET_IDREG(&host_isar, ID_AA64PFR1) & ~R_ID_AA64PFR1_SME_MASK);
+    }
 
     ahcf->isar = host_isar;
 
@@ -1144,6 +1145,8 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
      */
     ahcf->reset_sctlr |= 0x00800000;
 
+    ahcf->sme_vq_supported = hvf_arm_sme2_supported() ? hvf_arm_sme2_get_svl() : 0;
+
     /* Make sure we don't advertise AArch32 support for EL0/EL1 */
     if ((GET_IDREG(&host_isar, ID_AA64PFR0) & 0xff) != 0x11) {
         return false;
@@ -1195,6 +1198,7 @@ void hvf_arm_set_cpu_features_from_host(ARMCPU *cpu)
     cpu->env.features = arm_host_cpu_features.features;
     cpu->midr = arm_host_cpu_features.midr;
     cpu->reset_sctlr = arm_host_cpu_features.reset_sctlr;
+    cpu->sme_vq.supported = arm_host_cpu_features.sme_vq_supported;
 }
 
 void hvf_arch_vcpu_destroy(CPUState *cpu)
@@ -1335,6 +1339,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
                               arm_cpu->isar.idregs[ID_AA64MMFR0_EL1_IDX]);
     assert_hvf_ok(ret);
 
+    aarch64_add_sme_properties(OBJECT(cpu));
     return 0;
 }
 

-- 
2.47.3


