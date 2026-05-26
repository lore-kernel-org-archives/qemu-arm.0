Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D69CD5BC8
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 20:40:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRyXg-00017C-7M; Tue, 26 May 2026 16:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wRyXT-0000tX-Mw
 for qemu-arm@nongnu.org; Tue, 26 May 2026 16:38:12 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wRyXR-0007GS-OW
 for qemu-arm@nongnu.org; Tue, 26 May 2026 16:38:11 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-49040362e4aso54176735e9.0
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 13:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779827888; x=1780432688; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+BmrS6PfjgNRH4hAg0Ule6cUXehh+gM7pH213WKG5vs=;
 b=ZmWwKhgoNolNGfss6UgmBPp+z1sFrH6CXfWrl2PlYOzBWr/JghQDXTOFSIfwpWBkP7
 +VB/caI1KARGfVxedcGA+5JeDRu4yZpaTck4/Iku4ELcIPnVWPQfa/s9s1iUTtgmsrIF
 g4W9nF7/a8UPSKcYkqd6FSixtoHMqpYGw/w+++/PVgvkkl+Y2FzxSbnZN1ChLMkanr/w
 dlJBVCF2/hkHAPJH0qc0Y6Q2l0XW9zTiARD17XsFYckt3IOFZJ/CaAGh0GEjdotC9Dl0
 IKtcXOzs794ES/LSCHMjrZrva8JwkPpNRozgA3b1gxo66d4+9wd7u1pm5Q7dO158knuk
 8rcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779827888; x=1780432688;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+BmrS6PfjgNRH4hAg0Ule6cUXehh+gM7pH213WKG5vs=;
 b=dgzWzAboxNjn4TDSCKg+z0IfTccvAUCRoJ3kmTw7jG9CLAuSJ4TcFoYmYbxiofLHeT
 +NBjBXbkbgJ9rXfY02Gg/tRh+jpww3y9PyyOlofMJV5CAyAZrFMt7tYse3SvQPXth08E
 TceVUW/mUgP2R9S3KHkdjrfDNR75KaeN31C3lsCTWNA92iHSbAbVtJtipqPXl8KgpiMz
 nKFs754NP6pELSNqnOXO8yhFTfST2SrY4zJjv1nn/pPYFZ1jDu0iaJJzvNFuX+rr8fmh
 TD7rF0sQh9rr68cCE0bbDRUeTnZ3jXe2ScMiAEcIoRPWwLIKBJQGSIjAHoujm8Gt+n/1
 /+Fw==
X-Gm-Message-State: AOJu0YzEDmOxId2ZTXzOcWgS5ieN1hzBc4vWlYrMjwJIWGzBg5IC4c/U
 w1vvUaBNTOODToNB5NMcMSSU5w9JMnHeJv9e26JKpF/cHpONylKzlkujJAqU1ccaSCE48A2V3jD
 IjLKNcmavlw==
X-Gm-Gg: Acq92OGwqMCq1Re8QDmuDq0Q/8j8OUehF3hhFWDx3c2ezfOU32eIB019PZYyMvAnxqx
 AfCw8PJauc215KNyALxsfjrGco2fR3YE0Gnzv1i+kjCAtG5qhIVSaCreqRFq/DZA/LuAvoP6b+y
 Aec2wftg0cffoUgzGG0A8thg8t2yPi/HnsiY9JpMXFmfJzoBCoSHgdbOZnotGZRhE2+hnqnNwLn
 NC5Xa4YwmGdpccdbRD4JlyxBZjZAQb7bGuuzvuGZSRKF7wyWJKJEl2bqLYsjVrhvo2DqZARoMR6
 nCJyKLHh4G2c73ayln71iMhz6sYuslnKHif8aKlSSI1UrT/VU4jZZZ0Q22Wzf2y74c1Y3GfGKTv
 ViWlnsBoYc4WHrGSBEeSvtQuQavhxOO86KUYrKSmaPSBi8C524PVH1yIoSJ2iwcSvVY4au2iU2N
 Ms53KZzGDfRKfl0gbbOgQvWJeOeHwBMTESKHe6FAOxovNj/rzVLZAfBxA=
X-Received: by 2002:a05:600c:46cb:b0:489:1c1f:35f1 with SMTP id
 5b1f17b1804b1-49042482762mr345711305e9.4.1779827888066; 
 Tue, 26 May 2026 13:38:08 -0700 (PDT)
Received: from m17.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490809d84fasm1213755e9.36.2026.05.26.13.38.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 May 2026 13:38:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 06/17] target/arm: Introduce common system/user meson
 source set
Date: Tue, 26 May 2026 22:37:11 +0200
Message-ID: <20260526203722.79463-7-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260526203722.79463-1-philmd@linaro.org>
References: <20260526203722.79463-1-philmd@linaro.org>
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

Introduce a source set common to system / user.
No logical change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
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


