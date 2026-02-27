Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97D5FD530D
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Feb 2026 08:57:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvtf0-00029r-DW; Fri, 27 Feb 2026 03:57:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vvteb-00020f-FZ
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 03:56:59 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vvteX-0001sX-VC
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 03:56:56 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4833115090dso17862835e9.3
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 00:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772182612; x=1772787412; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HEm3Bv3U4Ykvq3Mj2srWruBasftn9rjxJVpIS8tmNuY=;
 b=N36eTM8bqbHaGpIT8y9xNevY+mCN5f3+DwffCEzoPbDA04aWVEzLQI4nSXoF6AZ+JX
 N++ZQdUnBLGNb1kDTcn1zssuZhlmy0AqlPhWGgNwbbDb9KRMFR0JnakicZMt2gux7EHb
 zPb8HkDR5qaJtW3KlWUlKl6gaNJep/JmHkPMCSKpHM8uOt1NUDOlBXbFj77Wh6aVT1aw
 tfFMp+l6VNrsulB5dFimxGh2zdNGVdAkqJIElgl+nQjdnW7hTQyGRfOZ3ex//9u/MP9i
 p+XPEAUiS17DB4AfILu4l6k5QUZ6kmgr/kyWyBgpCSREEItGw4ey3u28gRSbOCk7ytyp
 UR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772182612; x=1772787412;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HEm3Bv3U4Ykvq3Mj2srWruBasftn9rjxJVpIS8tmNuY=;
 b=KYmycbHPu37Pirzbc9EYFnhQU3eYhxsiDxnKyxYmspAWR127HXMOl7m/e8Qr7VL+xX
 pxk297LKtHXNPZpTlx1gKHkcALu+JfmDSjsVYtCnUxEu+f6FjJwLJDZUtI8Up8Rx9F3L
 3Q6p4QcYpsJH7w301SXiFfTZo5T/v5eqHr/G6JV1vI4UwUVZAC4x27xG+Bfm7bXI/UK4
 mlzF1hLLNaELVy9Q+raq6bsyM5zs02LANM79L7ZGPHASXMOAhSRkao2VFEyyMDbB+KY9
 186PZvb5M2vzBsiO5pVcjMbGpPSxJyJ3q2E45kXXURK4DLPD7gPi8aQp8kMug42CZkfs
 W3rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBq++JV+tx8zeioAh43CPhG1PwSA0vHutV1a5xPvc6gy+pzZi7fwyXieYx4VlyO/9/HWnxu+tmOg==@nongnu.org
X-Gm-Message-State: AOJu0Yx7pHizVCHZHGeljumMsKUin1FzkJ9D9cPc5hr/OHnQY1iPoQkC
 gVkms/fYYRu/VxTVzCHAGXZJ7kgShFABCgznDMey5R8VfL7gb9syKfHLW6jSu4NgHLo=
X-Gm-Gg: ATEYQzxdQAMXKtqMbLzJRIHKrkFbFCL7n7LrLaWXmQJ8dUjMGSRoYY0wu9yU5P7BAqH
 RVpTeEMcUwnlSua/arpc2wqk86rPf2EjynmXUFMt0Qe+ddnM/IXkV3Zvm17HmNE1jYl1VBw8yDu
 Rnrsh9q93yKbEhwPjVkSWD86GryhxDqNuIb7a2AwrtaDnYSLyJuOXkJXkhNF/DFCBsnnEN+ANFE
 movd8nqYaQAuDh4EYJEUN3RTWke2m+mQ/UO9IP8oxd16RqSlkwcfg1vzTNzxfUwnrKUfYMoERcW
 KejY1JknLJL/qg1ZPMp/DSEhHATqqhDK4RbivLZ5lgZyr2yOeuPHxG1fpWUFmBj8gHKTs0fZCub
 +r1cNoq8nXBdHIKlsQ3EgKVafl+oUk+D5ulVB4XlftxjF32oMttuq+AxBsbcXPjf+5ytqcRG0a8
 RyvmF43VEve2fMAiyNcg+DQKrKX8p46UrsiUYPyjlkenSGa0+Kkad1Deo8St9xDQVHMFyTCUIi+
 3awXCNrQE+lg0FsDmZHaYBjHIvglPuelO8Zp0M=
X-Received: by 2002:a05:600c:3486:b0:480:20f1:7aa6 with SMTP id
 5b1f17b1804b1-483c9bed9e2mr26071865e9.21.1772182612455; 
 Fri, 27 Feb 2026 00:56:52 -0800 (PST)
Received: from [127.0.1.1] (ppp-2-86-215-248.home.otenet.gr. [2.86.215.248])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483c3b7713csm83859605e9.11.2026.02.27.00.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 00:56:52 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 27 Feb 2026 10:56:47 +0200
Subject: [PATCH v5 2/2] hvf/arm: expose FEAT_SME2 to guest if available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-sme2-hvf-v5-2-1c60a92910c8@linaro.org>
References: <20260227-sme2-hvf-v5-0-1c60a92910c8@linaro.org>
In-Reply-To: <20260227-sme2-hvf-v5-0-1c60a92910c8@linaro.org>
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
 bh=DSE/MXyaOS7n6x2sc6v69f4/nWX+OmFzPuV6RjDvJgs=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQnBvVnhRRzd0ZWNyY0EvTm9tWmJBbm9UUFZvcmt5CjlnK2Q2a040dm9ZZ3RaUG9h
 MytKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYWFGY1VBQUt
 DUkIzS2Nkd2YzNEowSEc4RC80amJuaXJ4bWdGM3ppYXRkWXE4aHo3cktIUkkxT3I0dmgvcU1raw
 owWWlWQWh1ait3K1RWSDJObVNaOWEzaitFSEFDeUdUY0VkMWJERHFzYjJpMUlRK1VpcW00b0ROV
 2syeU5raG9WCjE0RkpJU2tXVE45YTVPaGtrZHBlUG00M0lmM25BSVJ5TlB2WC8wTXFydFFTV2Rq
 YzVnZDBWaUh3TTFpbitaOHMKYm1FdTV0cytmVE1xZC9IMzE2aVo3UUp1UVhuOCtTcTd5aVJnUWZ
 4VURpVk1FbjJTZkRxdklyWC81TVZWSjdEMgoxMUx6Wi9iYXFYVDk2djdaSVBFSERqeEdsTHBwRG
 9qM21LSjEzUFh5dXFaaFpVMjM1aW9PZjNBaURnTXRYSHN1CkQrRngxekduVnBHSVhIZ2pyT2poa
 XBXdlhrQXVldnpUN3llNUlmNDZKaCtvSG5zWCs4Qm1PZWgzc0JLZDRvVTAKU3dWSmZFMVk4MDRZ
 QjR2VTh5VDBUbzBZMytsQ2VCMm9LT0ZsWnpDdzBWaGcrTWxydE93TjdiSWxJWlY3VXVhRAoycXJ
 ld09aLzBDeUNEdnF0aDZxU0hNMXpzSXJNU2RvZHN5dFdpczEwY1kyanB2Y0VTNVNOYVhReFZ4ZG
 ZvSFNGClg2R3BDTDJLa0pLTWc1QlpSdTh4WXkzcWpBQWRMSTlMU3JZaGRaZGdyVkdqV3hXZTBNW
 WpOUUV6TlVENm5ndm8KWEFzTzVnTjlkelJ5TEF4RWlIT3VLcVRKVlJIanlkbTZaTzhpZG92WDE3
 dVpqMFVtZUtiTWdhV3Z6cXNhMy9odwo4Q1g0S014NlFGVkZGdnUvRzBRcnE1NUh2N1pIbG96UDd
 kbnZIbUdtdVhTejBWeWR0YUhnK1pQZWRic2pzVVl5CnlhbnhQdz09Cj1GKzFZCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x336.google.com
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
 target/arm/hvf/hvf.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 3d194680cc87e78835098df2e0e7987ed544c553..bc650c682ea6b0f1b6a144a2ccdbb3e8aaec29b4 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -315,6 +315,7 @@ typedef struct ARMHostCPUFeatures {
     uint64_t features;
     uint64_t midr;
     uint32_t reset_sctlr;
+    uint32_t sme_vq_supported;
     const char *dtb_compatible;
 } ARMHostCPUFeatures;
 
@@ -1121,18 +1122,18 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 
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
 
@@ -1148,6 +1149,8 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
      */
     ahcf->reset_sctlr |= 0x00800000;
 
+    ahcf->sme_vq_supported = hvf_arm_sme2_supported() ? hvf_arm_sme2_get_svl() : 0;
+
     /* Make sure we don't advertise AArch32 support for EL0/EL1 */
     if ((GET_IDREG(&host_isar, ID_AA64PFR0) & 0xff) != 0x11) {
         return false;
@@ -1199,6 +1202,7 @@ void hvf_arm_set_cpu_features_from_host(ARMCPU *cpu)
     cpu->env.features = arm_host_cpu_features.features;
     cpu->midr = arm_host_cpu_features.midr;
     cpu->reset_sctlr = arm_host_cpu_features.reset_sctlr;
+    cpu->sme_vq.supported = arm_host_cpu_features.sme_vq_supported;
 }
 
 void hvf_arch_vcpu_destroy(CPUState *cpu)
@@ -1339,6 +1343,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
                               arm_cpu->isar.idregs[ID_AA64MMFR0_EL1_IDX]);
     assert_hvf_ok(ret);
 
+    aarch64_add_sme_properties(OBJECT(cpu));
     return 0;
 }
 

-- 
2.47.3


