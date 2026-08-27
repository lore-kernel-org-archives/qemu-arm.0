Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F5AC61DB9
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 04:18:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzRXH-000782-EW; Thu, 27 Aug 2026 00:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzRXE-00075o-17
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 00:16:16 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzRXC-0006RZ-9E
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 00:16:15 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-38e58034d05so274989a91.2
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 21:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787804172; x=1788408972; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Mqdk3c9HbzgZWSmcwYY8mMSQqF5s5IhpPUD59+J81rc=;
 b=euGqAjUFXHVeb+oA6rjj27zS3bNC4GP0OYkRQ6DZnB/aVQMog6VVNEFwWKFfx9a1zU
 68O3lsC3q/PLsRvwc119dN6kBjUVFfIQulGpuf6uiUSoOnxokhGottlL407GXpGnS+Er
 tVzjyP3RTyy5d5vaXb7vMp+kYHvO13E3GMHqJKCWQTX/OwOerO8OS5SO8UIoeaLU66X1
 pmnYWRZkIjlUOGQJFE8+UWNMgmBfdNef9M6yER04NyJpsYFoDx/+Sio47kh1m4wqaYu8
 d/MeSzqSZKGTD95qJExhLloSxeiBLR7mZJ/LytvDSBrMK6HHUZoF+RghbD3uugr5uS4r
 oLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787804172; x=1788408972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Mqdk3c9HbzgZWSmcwYY8mMSQqF5s5IhpPUD59+J81rc=;
 b=FXWLt3zWr554crOFMdiD5g3OK7mWhKXJ3j3yieZO5C/zff8Ey2kh24qC1MUuWsNhgJ
 P+T5SqoeNDPH+bSu9fdLjbMVM8eQRpTAdltpaAqV21Koavu9Eg5AZ9yDn9OFmNHIknqL
 rL0fMgXI1lxF6mAx5VtfGhi/DWKKhO7I5ZN3PjBqYAqat74ZphGm4HFuud+lt2FLTTOu
 EzNPgMPgevgGMke8yfRdAsyZq4HoYwMfHZS3Us3ito/i0goEHhh4cBdROy2gbag5ipiB
 1iGqKb4CdEHlWkaFHKRiNEWB6O5ok2yStXSBvmIuDPRMxyuiLGvjCYnd6sllr890Rqiw
 ssQg==
X-Gm-Message-State: AFuF++mrYwOKkQ3RgDif8VIkzbm9hwuPaXtj2HZRpRMIGs95FawgZ/5P
 bqmZZUv1cu4mTnLbSVxOnImVQ/fC2k0MTc9L5wD7y/uJwbJxi24rL+cok4dvkxdEyH+dmwMmVU5
 N//1Hbo4=
X-Gm-Gg: AR+sD10BEEhngdf4fZOCTfopujq7N/85iBLHU6reSE91aYFXQ2TCxr3lA2Cvwj1/frJ
 aKcZjFXasCHdVzJ9y4EvcOWH+Kb6nTjWJ1iY7Vn2R/JG7A5bxnSEL+/LBSEbMI+dm6MY4LE/QD/
 cPI3gTrEAgQtIp/1FmURoYptZB06c9DnjXJpEzLh6eDgWhn0R9nM2d30IZfO1e0Hr8b7ZYnksfL
 Zlr8qnMpZ46TXEW49PWjqTaihyhAI6SIMlAlqmMkVYFG7EeKD9S/6FoHtgBQr68VoVJNw98WLlW
 q+AE9v2qlDVaQ9TVmdi6HHwh8YcxxvQWpOEKSRqEQN9R4+KaJAaMw1UPKkRTegGhOysHKFtQDES
 cm0FhztIuDpep/kwJfGJK+ilPTqTVDAExRHK4ogxsLOYkXKcXV5E466poqBKEQqDzB02wuuU0nW
 wIDYjue5iPvfyQulaTrs26vbJw0bx1i4YwhT+61r1Cyw6u8GoVoFJfseyYH/p/jCGy0jbKTr0NI
 B6i0/MkbAcCdAGDvA==
X-Received: by 2002:a17:90b:5107:b0:37f:fb1d:63fa with SMTP id
 98e67ed59e1d1-3966d9e5ecfmr25513431a91.15.1787804171995; 
 Wed, 26 Aug 2026 21:16:11 -0700 (PDT)
Received: from stoup (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-396b0d81682sm969597a91.7.2026.08.26.21.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 21:16:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, pierrick.bouvier@oss.qualcomm.com,
 philmd@oss.qualcomm.com
Subject: [PATCH v4 2/6] target/arm: Build cpu32.c once in system mode
Date: Wed, 26 Aug 2026 21:15:53 -0700
Message-ID: <20260827041557.775080-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827041557.775080-1-richard.henderson@linaro.org>
References: <20260827041557.775080-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

"Move" the ifdef to meson.build rules.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu32.c     |  5 -----
 target/arm/tcg/meson.build | 10 +++++-----
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index 34436ad6ec4..2d642ef8787 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -19,9 +19,6 @@
 #include "cpregs.h"
 
 
-/* CPU models. These are not needed for the AArch64 linux-user build. */
-#if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
-
 static void arm926_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -756,5 +753,3 @@ static void arm_tcg_cpu_register_types(void)
 }
 
 type_init(arm_tcg_cpu_register_types)
-
-#endif /* !CONFIG_USER_ONLY || !TARGET_AARCH64 */
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 35e70b004d9..a3e9d55e853 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -30,10 +30,6 @@ translate32_d = [
 arm_ss.add(when: 'TARGET_AARCH64', if_true: gen_a64)
 arm_stubs_ss.add(files('stubs32.c'))
 
-arm_ss.add(files(
-  'cpu32.c',
-))
-
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'gengvec64.c',
   'translate-a64.c',
@@ -49,7 +45,10 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
 ))
 
 arm_common_system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('cpu-v7m.c'))
-arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
+arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files(
+  'cpu-v7m.c',
+  'cpu32.c',
+))
 
 arm_common_ss.add(zlib)
 arm_common_ss.add(files(
@@ -86,6 +85,7 @@ arm_common_user_system_ss.add(when: 'TARGET_AARCH64', if_true: files(
 ))
 
 arm_common_system_ss.add(files(
+  'cpu32.c',
   'cpregs-at.c',
   'gicv5-cpuif.c',
   'psci.c',
-- 
2.53.0


