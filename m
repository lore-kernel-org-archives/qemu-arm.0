Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E68BCD5BAB
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 14:48:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPLid-00088A-FL; Tue, 19 May 2026 10:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPLia-0007zc-F0
 for qemu-arm@nongnu.org; Tue, 19 May 2026 10:46:49 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPLiY-0007oM-K3
 for qemu-arm@nongnu.org; Tue, 19 May 2026 10:46:48 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48a7fe4f40bso44809905e9.0
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 07:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779202003; x=1779806803; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DIYh6J4qeeRTQHfvKlvZCgBlqlTwiarImjNJm+8cQwY=;
 b=Q+SaUBKnOwInaFvqRq/hnnjrJfPaFI8PMcQgoJpy+xnhWT3AtgtaZ9J8pSp9ba35FR
 nDUkHmARP8u9lFTtAko3TLMPFynXcYATpM/iyqW5cBbEssx7KvIVw/XIm+vqcnZlYxz5
 t7U4qWf3S8GGg6zgiTHYQKV36uGEY0XqZPb2P4vySNjw3T8jE3iX8bLWU8mt6Xok91FV
 qH7E/ZPdxIyCISLCl5BJ8+Z6Qa98Efdw3zjxu5OVgHeYrzZbYuOoG/qZZQ83wkhLwJja
 7UZGbDZvGAinYsW5aPZt8goxedq021/35IFRv7hX1o9J0tVd8RNyWtcJi4vaf+MZ2knW
 LTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779202003; x=1779806803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DIYh6J4qeeRTQHfvKlvZCgBlqlTwiarImjNJm+8cQwY=;
 b=GlbYR2ziTfzjkr5dUu9FD+RK2sXdxefWdZrB7SU1D8rw4NSc4lsKgzMxVv4ewLgLpU
 Qa07HQ7lADKoFYG7nwKgQyJGo0oOsnfHwmKmMQTIxjTnoQX8hyPY1UK1LxZ+0qWn+ntR
 Snrzg9j3xD56ia2brdEc+yereMaj5gSDsyLpSP8HUZ43SVhlLJJ56dfTsclwaFA6DL4e
 0tRfmnroJjdfjen8nPWGAD3cxLFkoENHqfzfcJFDFEtNEuG/F80jGkGUCwopgVgYdZbe
 cRFHvy93a0ruKgopHrNVmSOHlvjoDlvrWLv4Q9qfGzDwXk9Ppf5wDO4xbFpypZd2UVxb
 sVNA==
X-Gm-Message-State: AOJu0YzZlI+ANFHXuD9PDYZWjTEfhPsSjSNfbr5wGUAyOe4Uiolrchxp
 7lKte6wzRuZfWZyDSaSb6hYfmk14ieyBJSQ6CPPKAlSe4Fcft9gN2U9e32kq6ie/dovdzRLfUt6
 ihGjeVHU=
X-Gm-Gg: Acq92OEfijsbSpY7q7xePQj1mcBcaclJvJVzWj8cGKr1WAkfl5oFRQfQRxFA1RHVqcC
 ipiCp9FnJufzZGhrhb7yAIjKxMmYLQrCMEb7dMMD4dv3bH/Fr1WeKEk8SifjaAcpIHeGCUa2ZV3
 17FVYQZOwbQtC5CvJHpEBay9wbnCc4Ev0WeMsLrWxCVv6Gvdx64db5t1EqxsJQGngrjPL7clBdC
 5p44IFJm3PUNBkmHsJLvC9A+mw+TeAMGpO8X+x01bFHac98HEMac4COPQ60fisjkjeZzFV1Ib3F
 tdHiV/7qkm5Gmzr8j2Yql5YWXV7QbR4dNSYPxQ21IOUcQ/KkQp9x8b3+emUTzuOvST2q8GvOrch
 2LnnfmRCbioowghT9rZL8TAMxqdQBB11dMaMJGGC6lNF8VuWfWikF9LCGphWJYsLYbI84clpkJT
 QMfjIeWCR4PfsGVR7wFabCW6jYnzrFFEBq/MjJl62WnjXZLdnLCuk3n5bwcm03wTqs5wsFDghM
X-Received: by 2002:a05:600c:48a8:b0:48f:e230:d5ab with SMTP id
 5b1f17b1804b1-48fe651e11cmr190837715e9.31.1779202003347; 
 Tue, 19 May 2026 07:46:43 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48ff2cb4ae0sm157964445e9.0.2026.05.19.07.46.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 May 2026 07:46:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 07/18] target/arm: Introduce common system/user meson
 source set
Date: Tue, 19 May 2026 16:45:42 +0200
Message-ID: <20260519144553.91483-8-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519144553.91483-1-philmd@linaro.org>
References: <20260519144553.91483-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Introduce a source set common to system / user.
No logical change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/arm/meson.build     | 21 +++++++++--------
 target/arm/tcg/meson.build | 48 ++++++++++++--------------------------
 2 files changed, 26 insertions(+), 43 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 4723f9f170a..e56fc943bdf 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,6 +1,7 @@
 arm_ss = ss.source_set()
 arm_common_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
+arm_common_user_system_ss = ss.source_set()
 arm_system_ss = ss.source_set()
 arm_stubs_ss = ss.source_set()
 arm_user_ss = ss.source_set()
@@ -16,6 +17,13 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
 arm_common_ss.add(files(
   'mmuidx.c',
 ))
+arm_common_user_system_ss.add(files(
+  'cpregs-gcs.c',
+  'cpregs-pmu.c',
+  'debug_helper.c',
+  'helper.c',
+  'vfp_fpscr.c',
+))
 
 arm_common_system_ss.add(files(
   'arm-qmp-cmds.c',
@@ -26,11 +34,6 @@ arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 arm_user_ss.add(files('cpu.c'))
 arm_stubs_ss.add(files('cpu32-stubs.c'))
 arm_user_ss.add(files(
-  'cpregs-gcs.c',
-  'cpregs-pmu.c',
-  'debug_helper.c',
-  'helper.c',
-  'vfp_fpscr.c',
   'el2-stubs.c',
   'cpregs-omap-stub.c',
 ))
@@ -45,15 +48,10 @@ arm_common_system_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
   'cortex-regs.c',
-  'cpregs-gcs.c',
   'cpregs-omap.c',
-  'cpregs-pmu.c',
   'cpu-irq.c',
-  'debug_helper.c',
-  'helper.c',
   'machine.c',
   'ptw.c',
-  'vfp_fpscr.c',
 ))
 
 subdir('hvf')
@@ -65,6 +63,9 @@ else
     arm_common_system_ss.add(files('tcg-stubs.c'))
 endif
 
+arm_user_ss.add_all(arm_common_user_system_ss)
+arm_common_system_ss.add_all(arm_common_user_system_ss)
+
 target_arch += {'arm': arm_ss}
 target_system_arch += {'arm': arm_system_ss}
 target_user_arch += {'arm': arm_user_ss}
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 1b751d59183..b0f5342245b 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -52,60 +52,42 @@ arm_common_system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('cpu-v7m.c'))
 arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
 
 arm_common_ss.add(zlib)
-
 arm_common_ss.add(files(
   'arith_helper.c',
   'crypto_helper.c',
   'idau.c',
 ))
 
-arm_common_system_ss.add(
+arm_common_user_system_ss.add(
   m_nocp_d,
   mve_d,
   neon_d,
   translate32_d,
   vfp_d,
   files(
-  'cpregs-at.c',
   'debug.c',
-  'gicv5-cpuif.c',
-  'hflags.c',
   'gengvec.c',
+  'hflags.c',
   'm_helper.c',
   'mve_helper.c',
   'neon_helper.c',
   'op_helper.c',
+  'translate.c',
+  'translate-m-nocp.c',
+  'translate-mve.c',
+  'translate-neon.c',
+  'translate-vfp.c',
+  'vec_helper.c',
+  'vfp_helper.c',
+))
+
+arm_common_system_ss.add(files(
+  'cpregs-at.c',
+  'gicv5-cpuif.c',
   'psci.c',
   'tlb_helper.c',
   'tlb-insns.c',
-  'translate.c',
-  'translate-m-nocp.c',
-  'translate-mve.c',
-  'translate-neon.c',
-  'translate-vfp.c',
-  'vec_helper.c',
-  'vfp_helper.c',
 ))
-arm_user_ss.add(
-  m_nocp_d,
-  mve_d,
-  neon_d,
-  translate32_d,
-  vfp_d,
-  files(
-  'debug.c',
-  'gengvec.c',
-  'hflags.c',
-  'm_helper.c',
-  'mve_helper.c',
-  'neon_helper.c',
-  'op_helper.c',
+arm_user_ss.add(files(
   'tlb_helper.c',
-  'translate.c',
-  'translate-m-nocp.c',
-  'translate-mve.c',
-  'translate-neon.c',
-  'translate-vfp.c',
-  'vec_helper.c',
-  'vfp_helper.c',
 ))
-- 
2.53.0


