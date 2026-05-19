Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71ABCD4F5B
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 14:48:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPLjq-0003vm-SA; Tue, 19 May 2026 10:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPLjl-0003ZX-JL
 for qemu-arm@nongnu.org; Tue, 19 May 2026 10:48:01 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPLjj-0008D4-He
 for qemu-arm@nongnu.org; Tue, 19 May 2026 10:48:01 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-45e7c636e74so1640886f8f.0
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 07:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779202078; x=1779806878; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hrqG8E5vo4+DPxnoXgzD37IiU6lxoPHb9HCDmG94Di4=;
 b=OPjVAhs+DpaiFLUkHG7jegJi1YD4CLc17eHeoMtuLS7xi1Fd51Jg4WP+m7YQ+gho3+
 0SV28zAGcOoacuZE8uq272a8uJrFuLys71qrGcyGRYnJspuk5oCbbG4II4yKp4QxXRCd
 f60Udh3N3k6T1kpKfdvvYbbBpuVVj1vtrWBILaNSB/A/+LJPtMKJvvbUGXyj3zH33qOK
 MlNuwPVxiVawqkytRhHvP2kzza++n7uK/04sMgReuprSnjNqJ0IKXBtlqmaRGX+F06bh
 eKFwj+mJh2757V7NTJ8HZmKuG7zIDCF1tTMtvkMsUjN4wZFp0/3QUPSgf8vE3RKNkAsM
 1FTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779202078; x=1779806878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hrqG8E5vo4+DPxnoXgzD37IiU6lxoPHb9HCDmG94Di4=;
 b=AuHjskY4u3lLqcCn5+OW+Uv/KbncuBBTJP8jLZ7U4GbURdVDkuUNMyR9VCtdEXILxx
 T9Vxwk434dTb1GMF7o6ryii55c/Fb3vUrbZPwO2+nZZ8IEXRWt6y/c8JNqTbcJJzhMa3
 TTaQktfEIC2DaGriE0hH3zvq1D3YZS+I4rnh3MFkBkioBLyotPHnSB5bi0u/5Wo5WoPU
 xIXRSJoRNR8sQLkYHfNq3+d4bP8Od/4Q8VGcirc8GOzfi+dj1tQZQbMZ2YvWmCUQB5ST
 UTrjldb73GIipFreUCMt2twXWV8/u07Bs8HbwaaoPJQgTo6xPQp3g/sJmu1tydpq0QsG
 wDpw==
X-Gm-Message-State: AOJu0YwNf8vc6Uf1m41ENh3+tF5VYgdXTB5NT9n1brFn3csi+R2F5M6+
 eQ7eIgaq8zgMazZ8zINK+yW0u4eRDQuTd4qH1a23uW2o35PINrp409ECqMi+SMH/F6Hw+5kXAsv
 OvimGHNQ=
X-Gm-Gg: Acq92OGvKmIy7v5CD97g3Dsc1POtEeCt4yrvgmAPnKUHTUrGaGE6Zn/ahXa8AzKX/ln
 7xA/AcJStFIOeIgVrCFYocrlaPgTm1IAkwyipQXfHUR9K/HyvGfcMKKmC7yFRjZ/KN33QlbR9Xe
 QmAelpxdNayMj03Qy+1g4rz3OR3KB5GANbfE8eSiND4y9lP5ON2bsIGtQZmfkqrXKc8EcKm923W
 sGazj1NYN1pysSkvLCAu7HzcY1Fn81/enju4ToAzeYExNl/UWk4XT+cEARRgDjkgTW6++y73Yoy
 e3X2mVVaPkomt2oQDq1qE2STDGwUhIzge21qDMdbFJqfVDgIu/7Gnhd5pUPeDVq/b5zMtZIo1Id
 RrM6ajzbWcsvRzyoigG4X7FB2CQeldZG1CSi4WfkAcKsr4dEJr5yxBYr3Xyc1bGNi+mRD70g5Hn
 MXXNSCpUUEJw15n+UwFwniRygCCRJnE52ssrmTWCr0Tp9wYQF0FhGqXsQaJpwjqYE71uP95VRN
X-Received: by 2002:a05:6000:4305:b0:43c:fe66:43ec with SMTP id
 ffacd0b85a97d-45e5c5af3e1mr33745917f8f.14.1779202077754; 
 Tue, 19 May 2026 07:47:57 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe13a7sm48215448f8f.29.2026.05.19.07.47.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 May 2026 07:47:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 18/18] target/arm: Build cpu-max.c once
Date: Tue, 19 May 2026 16:45:53 +0200
Message-ID: <20260519144553.91483-19-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519144553.91483-1-philmd@linaro.org>
References: <20260519144553.91483-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

Call TargetInfo::target_aarch64() at runtime, allowing to
remove the target-specific TARGET_AARCH64 definition and
build cpu-max.c once as common object.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/arm/cpu-max.c   | 8 ++------
 target/arm/meson.build | 2 +-
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu-max.c b/target/arm/cpu-max.c
index 8cf8edc6535..d38bdfcf811 100644
--- a/target/arm/cpu-max.c
+++ b/target/arm/cpu-max.c
@@ -8,6 +8,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "qemu/target-info.h"
 #include "system/hw_accel.h"
 #include "system/kvm.h"
 #include "system/qtest.h"
@@ -190,12 +191,7 @@ void aa32_max_features(ARMCPU *cpu)
 static void cpu_max_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
-
-#ifdef TARGET_AARCH64
-    const bool aarch64_enabled = true;
-#else
-    const bool aarch64_enabled = false;
-#endif /* !TARGET_AARCH64 */
+    const bool aarch64_enabled = target_aarch64();
 
     if (hwaccel_enabled()) {
         assert(aarch64_enabled);
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 3e02941d0d5..9408131d178 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -9,7 +9,6 @@ arm_user_ss = ss.source_set()
 arm_common_system_ss.add(files('gdbstub.c'))
 arm_user_ss.add(files('gdbstub.c'))
 
-arm_ss.add(files('cpu-max.c'))
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
 ))
@@ -20,6 +19,7 @@ arm_common_ss.add(files(
 arm_common_user_system_ss.add(files(
   'cpregs-gcs.c',
   'cpregs-pmu.c',
+  'cpu-max.c',
   'debug_helper.c',
   'helper.c',
   'vfp_fpscr.c',
-- 
2.53.0


