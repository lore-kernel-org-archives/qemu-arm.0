Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FA5F01832
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 12:46:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyUYr-0004Qo-7a; Fri, 06 Mar 2026 07:45:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vyUYn-0004PR-N1
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 07:45:41 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vyUYi-0004KW-1M
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 07:45:40 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-48374014a77so110938545e9.3
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 04:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772801134; x=1773405934; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rgJhg7qH7nVlrkZGD5+UkseCs4/YICAqtAS92mBbMqA=;
 b=vZ1u3QXONfCUSMmMV2eCBdUze9bKfTRU4VFFfnNmxB5nQ8LeWncrBaCmS3YU6nm/ra
 Pf5KdNrOtYi2BrqFQP5VCs2PBssHnKVJzdLwMFT+4Cdl9d3MI+qnUjcgr2/fipA+mihe
 3ottDkiFhENXJMzvUWdV6+RohlJs6IAMAcN/F8/VHODTg6Audj/2b0r6rVhSwcS3RIH8
 lCP7r+PPRT+jgIQDNYMbzkFFpET4Hz0ZNZzIn/830dKhYECwo7kP9pi5XIHfXU2aawjl
 cZlPJLB/hwaQMAP7X6FZDChL6Blw+oEu7za33D7xBwdqji62QhDdpT2eElP39qCKbyz6
 hiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772801134; x=1773405934;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rgJhg7qH7nVlrkZGD5+UkseCs4/YICAqtAS92mBbMqA=;
 b=eQ9aMeMOtt3KvvWMOv0Vhw/05NthnmmISBvGrpkFfgUWfBF85aXjO/pLxTIG2R2d3X
 FXXaZUJ3qPRvUIqbGTLr3N8QPtEEWW1/cCk51TfbpqCXS8pT0bSxu/rAgRtPGptOB6eU
 KuJ3JBuM73R6U5EwIX0xdlSYhe4d4QDnm0GQ2+CSRMAU2RPXqQ+N66TmSO/y0AEpt/Kc
 zK3kcMKUo3FceuGqWfkG13CJCzPFgDOqACDRMImNyHU1JcmHG6N24RbrMt9+CYG1tQmP
 ZJ294QMvjrVNgvkUdXtzZi3wKapnavuiDlUg0Jh7u/NLVBpr7Nwf2sdtUbTfn4noL/Z8
 dKFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVr9CD4ZEEu9m0i5EUwSTaVauwGsjyqahMEwVDdnhnp0ew0FO5DQZcClazqB64DmuhRrScvRRhRCQ==@nongnu.org
X-Gm-Message-State: AOJu0YzK0tHZSxREOnBLd5DNg47n4xseyv+0t/GXYSzXELyqP9ckgngs
 dYtx0mbk1OaxdpXqf2x4LO0vqJIwTkHAQTbj+ry6Nv4LPEn3hSDllbPBmsNGNytDk/k=
X-Gm-Gg: ATEYQzxMpZBVoiIsDK/dCCgRfG7JhDLgticyh9g0BVBkJThQ+5PQ4D07rBRxH1DKpEk
 Fb226o7F6/9jXQfDkicldAFFQOxqjAPzfwyzilgEm8LYm3q4wDrHpum18oaTX/0Fv3cuUtozCxI
 8ztEVtP5qyrUiwYJ6TjPV99hvU5G9G4YXXAc1k01V+x9FT24QRaFDnpAGUHO+5mHrURQNUIK8eq
 /PNaqRSSOuTfUXOKhZyZpBw6L7GEQ3Xc/a+4QL8yRJ4LCgdiix1yz0lyE07mJkOdBCGEW/57T13
 0b1i8MZJ6i8sMOgpgtCtIhjQBZJ5C8IKxXKlcnRuLVgMnVfiMbtFY1+AmrF9m/uJ0WErMr//oil
 Z25b/WbuMsb301T//tJr1+MeyxzerTCeSCYLtMfhDey2inPrLLLmvHJuFM7FxXsl+puGia5ly+0
 /SwJa+nwLyyPy65fRHan6zOrWOpZ/ju1NOeywYyC0dw3ZyWY55de8Aqyx8spFTW8qkmMW2qtHtK
 Raac4gDXT3T5rlMZLPLwZoUgMI68vpOO0CjC+c=
X-Received: by 2002:a05:600c:5303:b0:477:c478:46d7 with SMTP id
 5b1f17b1804b1-4852695aa55mr32084375e9.22.1772801134525; 
 Fri, 06 Mar 2026 04:45:34 -0800 (PST)
Received: from [127.0.1.1] (ppp-2-86-215-248.home.otenet.gr. [2.86.215.248])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485276b7571sm32301335e9.13.2026.03.06.04.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 04:45:34 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 06 Mar 2026 14:45:25 +0200
Subject: [PATCH v7 2/2] hvf/arm: expose FEAT_SME2 to guest if available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-sme2-hvf-v7-2-e72eeda41ed3@linaro.org>
References: <20260306-sme2-hvf-v7-0-e72eeda41ed3@linaro.org>
In-Reply-To: <20260306-sme2-hvf-v7-0-e72eeda41ed3@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 =?utf-8?q?Phil_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Mohamed Mediouni <mohamed@unpredictable.fr>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3452;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=x4PKX4z2dqcNBF29jWpK40RoN6KTiGbQR3rlp9t7i6w=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQnBxc3hyRGNndjlvSE40cHQzUmZ3Ujh4bVJldkhlCnZwZlRBcHNGK0hTYjdsUUtC
 M3VKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYWFyTWF3QUt
 DUkIzS2Nkd2YzNEowS3plRC85azhoTitmTWswRDVvRXZCM3lrRnB1M3o0RjRPVHVnZldLM0w3cQ
 pvTGZ2UjUySXh4b1Y4WkdlMlA3RDhiZjgveHhNdWhrQkl6aTdTTWZSUE45d3R0QWJSSmVFR1lRN
 21jVWpJaS9YCmM5UjdIS2ZmOEhYTklXVFdIWFBBVE1rZ1BxbFcwM05uZWpNekkrZnJoaFhTSUhi
 K24zYWFGOHhlMXAyN01HNWYKZnV4c0UzM3ZWVXlRTUV4VGQ1WHdLb2Yvd3MvUGpCRTdwRVpHbzV
 pTEU0U0tTTHNkV1Y4TFBBK0RhZHJPT3NsYwppcmc5L3FobGZvSXo5WUVjZEZZUmhKVTV1UnJhSW
 9YZVcxVlB1NGl5ODNBaFhaZlFrV21JaHBzK3RsTXdmcDV6CjFabkhrWlJKcW5tdUdyOWpYQmEwb
 Wt6bzlhVElrbnh1cDBSVDRPWERpdnlDZ05iekxpRHlWMWJEYkYwYjF2L2IKMzFOU2I4cE1QUE5L
 TTR3MlpHdXIxVS85dkg4cDBidVlxeHppTFBKTU1zcU03aHNXekdhTGZyQVNXNDZFRmRxSwovRkx
 rNCsrRzZoRE52ZmdyU242SlRZNWRtUkRPd2hCZ3VCeHZEZmNSb1BhNnZFd2c4cHZxMXlSN3FIVF
 g3RkFrClJOb3crUjJiYUx3d1h5YXVKNS96VjM3T0JJU2VzbGpzSDdNNzFKeHo4QWhabENnanhoO
 ElveHFlZkVMUTdSRDMKSUYwRkMvL0t1eWRvTFhucDNMWGtvWXZ6V2lPdXRlZGdWYWhkNTJiaENQ
 enRBWDlFWHdCZlpCa0VucmxwRlhUcgpkRVFNc0w0bnB4TElwdDl2TGFyWWFvanFiMmsvazNhZEp
 tOGRFdFJibWZyQXo4YXlrVEZYd1k2MGdPbmExWGFGClJjbU1Bdz09Cj1PaVJzCi0tLS0tRU5EIF
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
 target/arm/hvf/hvf.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 21b16dfe429762c66714a4f04af0833033614c63..5fc8f6bbbd987535f907f3cee8c170600c130832 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -315,6 +315,7 @@ typedef struct ARMHostCPUFeatures {
     uint64_t features;
     uint64_t midr;
     uint32_t reset_sctlr;
+    uint32_t sme_vq_supported;
     const char *dtb_compatible;
 } ARMHostCPUFeatures;
 
@@ -1106,6 +1107,24 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         r |= hv_vcpu_config_get_feature_reg(config, regs[i].reg,
                                             &host_isar.idregs[regs[i].index]);
     }
+
+    if (__builtin_available(macOS 15.2, *)) {
+        static const struct sme_isar_regs {
+            hv_feature_reg_t reg;
+            ARMIDRegisterIdx index;
+        } sme_regs[] = {
+            { HV_FEATURE_REG_ID_AA64SMFR0_EL1, ID_AA64SMFR0_EL1_IDX },
+            { HV_FEATURE_REG_ID_AA64ZFR0_EL1, ID_AA64ZFR0_EL1_IDX },
+        };
+
+        if (hvf_arm_sme2_supported()) {
+            for (i = 0; i < ARRAY_SIZE(sme_regs); i++) {
+                r |= hv_vcpu_config_get_feature_reg(config, sme_regs[i].reg,
+                                                    &host_isar.idregs[sme_regs[i].index]);
+            }
+        }
+    }
+
     os_release(config);
 
     /*
@@ -1121,19 +1140,6 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 
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
@@ -1148,6 +1154,8 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
      */
     ahcf->reset_sctlr |= 0x00800000;
 
+    ahcf->sme_vq_supported = hvf_arm_sme2_supported() ? hvf_arm_sme2_get_svl() : 0;
+
     /* Make sure we don't advertise AArch32 support for EL0/EL1 */
     if ((GET_IDREG(&host_isar, ID_AA64PFR0) & 0xff) != 0x11) {
         return false;
@@ -1199,6 +1207,7 @@ void hvf_arm_set_cpu_features_from_host(ARMCPU *cpu)
     cpu->env.features = arm_host_cpu_features.features;
     cpu->midr = arm_host_cpu_features.midr;
     cpu->reset_sctlr = arm_host_cpu_features.reset_sctlr;
+    cpu->sme_vq.supported = arm_host_cpu_features.sme_vq_supported;
 }
 
 void hvf_arch_vcpu_destroy(CPUState *cpu)
@@ -1343,6 +1352,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
                               arm_cpu->isar.idregs[ID_AA64MMFR0_EL1_IDX]);
     assert_hvf_ok(ret);
 
+    aarch64_add_sme_properties(OBJECT(cpu));
     return 0;
 }
 

-- 
2.47.3


