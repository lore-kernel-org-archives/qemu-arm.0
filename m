Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81465CD4F3C
	for <qemu-arm@archiver.kernel.org>; Sat, 16 May 2026 17:18:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOIeQ-0008GG-3j; Sat, 16 May 2026 13:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIeK-000875-05
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:18:04 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIeI-0008W8-8D
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:18:03 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488b150559bso6540355e9.1
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 10:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778951881; x=1779556681; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hrqG8E5vo4+DPxnoXgzD37IiU6lxoPHb9HCDmG94Di4=;
 b=A4rZQ0YuJlf5RIRB2Gk6ovsDdGBDzJcV4OVVZkHitGSxDUt54SuDR27ueWulnB6uoY
 DOfcmH2s0RC7b7wYvdVD3vTczaQYBiJ6dgwhyuzjIdvWQY7ioaNDnI1LgWr0IMYvYFa1
 1HxnpfNw/lEcgLZUTjuSf1I3ge+7vMIabcq329vvFu8DGk38kfFKNu5sq3/eJ0QoJW58
 t1nErDi2wdGdGDLik5pWuzfV+N2hJVIn5ZU9I/bIr8xu5UEASpDq8xQPetoaYnqxtWNP
 s/2/talisK7Dpvtubi9JkuhjEnW7ktI/xZyHVv75PQPTKCw3iEg/L/KD/c7M2BM+M24O
 lh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778951881; x=1779556681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hrqG8E5vo4+DPxnoXgzD37IiU6lxoPHb9HCDmG94Di4=;
 b=rGY7dCKp7/fvRvOiF+FcUKy4vf1vMi8Xy+gJfzo6dsSEYq+TmyOtzFkGHA6Ayf9bTT
 reGBuTgnjxBnpQvQyzuWU6VX/ChHayfWNS8qAqV/6HnW0p7VHFaL5yEUojXYPP13pB+A
 DPzMA/KF0D5eZs6Bg/8cdm8p1QONGKaSLWzRE+2JC4sa03qx/Xu0DuanfyOCpL4yb312
 UW+mhlNWrKi15gF2Ex+NuoyH9laRA0puNHfsceB3thx7TYe5YJCY+lprTGbq4jUuyvVm
 UlFnVz0mNaLwPI4dIPP0p5lxuN5k3wwrhh6HK2a9adtgBJaUcFAKn+NsE+lK9obrEl1W
 0UgA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+pxnLYyevndXU9egGh9TWLumAI9F96CuhypiSeKV5SmGPtfAYhAVN4zCjHGED5SrRg7KvZjkUnpw==@nongnu.org
X-Gm-Message-State: AOJu0YwkiTbbplfQwK6m+dJpNUtFUOrS2J3GzEEXHUaE1cKEbuSCjW/I
 QKbB9TQeLrh5qiYhxbzOSh5dci4CQuk1tQIquhfQAIjxBBrxdW8kS86pKpeUAG6bQrc=
X-Gm-Gg: Acq92OHcc8D5J1qVTm7WnV7R8oEnYgk/Ut750BEs7ZSUt12VaUUOTkvmtMdTI0sZA3g
 NsHKsvqhdbpqlu4EB0AiQ+F3EYjV26XO6w50YE11lc7HoeO0//iFEaI9dU8ydhe4BRx94jgQoCo
 1ebRuzoDbqGNUI8EP/AeRAU8S5p8ABzksHNIFJtjKCO1yGz6baaZMZSgOfEZIn7MGgiVOSNrbKB
 WHRSPxvgU3v96OVwGxFbDxsJhLUpsvFd8EKCa5NrmKrIv+NzOng+KN43Rtyaq3UlwkQcDo5Zgub
 Gdm46NE0bybR+QosHly5wVoDDPutXV3JxyKp8DCi7mrV2yBFDw7q4lkMQzUqXSQdE/H+wOg5ckj
 Y2PxA19aTA1giO1rNFrIRFCHBaCT0d1Ya09CKJBjvyxML47B133wla11EkYUu6W2LGWq7GD8DUb
 QWuS4PYKSsZP7v/pOteB+2RmgUftzeaRDnPwC27h/pN1hCdHx8sUaJYrJickclEk+ztNxt9XJL
X-Received: by 2002:a05:600c:46cf:b0:48e:8974:c377 with SMTP id
 5b1f17b1804b1-48fe6626ba1mr119634925e9.29.1778951880657; 
 Sat, 16 May 2026 10:18:00 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe13a7sm24578791f8f.29.2026.05.16.10.17.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 16 May 2026 10:18:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Joel Stanley <joel@jms.id.au>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Troy Lee <leetroy@gmail.com>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v7 21/21] target/arm: Build cpu-max.c once
Date: Sat, 16 May 2026 19:15:23 +0200
Message-ID: <20260516171524.19184-22-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260516171524.19184-1-philmd@linaro.org>
References: <20260516171524.19184-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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


