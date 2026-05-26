Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71324CD5BB1
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 20:40:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRyYl-0003QJ-Fn; Tue, 26 May 2026 16:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wRyYi-0003Av-TH
 for qemu-arm@nongnu.org; Tue, 26 May 2026 16:39:29 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wRyYh-00083j-5e
 for qemu-arm@nongnu.org; Tue, 26 May 2026 16:39:28 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-44dd5cb0f81so7870470f8f.0
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 13:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779827964; x=1780432764; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FwX4TVNJjORfo35og2hvhoAxKst8+SezncN2NkLhWnk=;
 b=pWS7fULhh4JuX5GNL5hinZlFjcmdeRSUSv2G7tdG35Ux1YuAfAAD427cQOfdU/kOnr
 rv0jdls8cm7/0fQgboyjtCtXyCkqtkv1DuSU7Y+6aBYQ5nMwStCJL0x+DRLV7nqmnE63
 tcJ0G/+R+IB4GgG7fhrPMYibKhpjUQhMAgWsSq9kXSos9shmNnK9yn1v/Czc8RdxLwXu
 PN7zlYSwlts3McMaC68j8j/WAKkxQS+XebML6JBCrdm70FIAIMcy5d9MGPMSQukMjYzq
 cCw8clnTvaYVQO4eFAK71sw/TrIyU5mKg7MOUVpTlIM9tdvTio7AysCBqrFuC09A4nrz
 OpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779827964; x=1780432764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FwX4TVNJjORfo35og2hvhoAxKst8+SezncN2NkLhWnk=;
 b=CodENxDfNjSpfLNCgrKmQhlwIeFMbfVL5jbGYKmfyZIdhKdRP3vp3YtSxeuXY1RxTR
 PZoPS7qgYZO+NbAxYn/p/CFfZiR2hobEgan3zG4C05wi/27o2XGsdOAljcZ878REG45m
 ahaoF3Jkam7GLtnKBafvboQZjZn0JaTr67v8D/sQl1F257T4aUq76CGxQsNb/OBoV76a
 8H1O6QiQXyGLdSFyiSbTbPZai3fZIek3ItdnjAXpcAvmk53AGUChets8A29NrRuy62vr
 MfHJ7FtAB93Lf76DB/7clc43y+tfvup88L06Grebp7o1wdF1fyYSH4AN92NW1dg35un1
 Oipw==
X-Gm-Message-State: AOJu0YxpZMVI+r99ix/b5MKOartUNbqBFwAwDXQOvDvEL00X6B3B52hD
 zWkf9wub9Ks2oqeUtKgkmivQCZPeqm0aQaEF6GGq7Vfn/rEuUun00uJ96M5zaxci3Mc=
X-Gm-Gg: Acq92OFjBImYfA9d1jRLUcoNvQa9qrqxzIRdp/+5u0VBECPDW11zbZvjJ4SrLnHjptO
 cqwCBd19xKaYukXhi5+YrL+slG6VUamDnaLmcauaB2nxDa0KUpbbjCD+VVc2cDoG/LmGuI6ZKgv
 wOtn1MEJXj/Ydj4ZlWVIHAi/ZHMf11kW7UUmIPR24lPsofVOz1fUGPBAxNOnTOjSZpxTQEGDg4S
 052ahC+l/MrpsXfGKGYDGgDJcN1YrrZB+Mu4OfBRlQaVMbNdFG3GtItvnSAt/baQMTzGm54CSow
 Qpwy4OuRbQfCjd3ii33LMoty4uCXeKNvk3P639Qw53RaEuFZT7Rlqd7lTemDw7na+VvWn2tFmUV
 IELo3E13nSWGWilbv3YuIxlboc4adzs3XlEHLRhQ6bY1CAQiME33cCJCNaKpsN2doAHCWgkz8uX
 cgWwYyhgGOZahxwk7iWuV9V8QbTX5Fjac74XDdkLSFsNf6c8qUFUqZrdQ2CiIJTP7Sog==
X-Received: by 2002:a05:6000:2f89:b0:45e:7792:6e6d with SMTP id
 ffacd0b85a97d-45eb3123abbmr32460019f8f.13.1779827964252; 
 Tue, 26 May 2026 13:39:24 -0700 (PDT)
Received: from m17.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45edb558dd0sm768005f8f.16.2026.05.26.13.39.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 May 2026 13:39:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 17/17] target/arm: Build cpu-max.c once
Date: Tue, 26 May 2026 22:37:22 +0200
Message-ID: <20260526203722.79463-18-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260526203722.79463-1-philmd@linaro.org>
References: <20260526203722.79463-1-philmd@linaro.org>
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

Call TargetInfo::target_aarch64() at runtime, allowing to
remove the target-specific TARGET_AARCH64 definition and
build cpu-max.c once as common object.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
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


