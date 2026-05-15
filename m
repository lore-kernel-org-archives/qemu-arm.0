Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801D2CD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:13:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtGL-0005hV-Qz; Fri, 15 May 2026 10:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtGF-0005YT-SN
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:11:33 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtGD-00043v-8G
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:11:30 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so58236995e9.3
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778854288; x=1779459088; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ij7Lv+xOkw+dnHmI7jo5IUG/QbNAyBo1SM38AVgoOSY=;
 b=PhTNOffkbiIIcVArqfpfNu4cH812Dmbdl28ZzqpGwEMG/CB43LS4rE6KcQR8JaeKhK
 y9pGk9X2sIrp36aEIx22qpjHhIuAJj6lS0aij7bkM+TNdNS7Bnf3fge3W+tETdcQTgsq
 VlSM1/B76b3Imp2hpVpztKCkPInGuvwHHi/OQDvvP1kd43zq/an8qkqyFFMyg4VTsFct
 Ak5ghgXyAm9MVAXskCHpVuP4cafCuBZDCP1aDmaXqJgweJS0SloH0/oEIr2U2avuw3Gn
 2AMkUrEwKhxFhDxJqQ5d5S35WDb9jqG+AL6OmwsWd3X/Osk06RgqSjgCSggSzWoAdVds
 Tsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778854288; x=1779459088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ij7Lv+xOkw+dnHmI7jo5IUG/QbNAyBo1SM38AVgoOSY=;
 b=alZnP02By5MaXGJ/x/NIDDYt+UwKDfdOl7kqdSvCOTsKlXTZ/U6G3/ibfwHoM2iUac
 9OlNGhrH7yyfAs/j5Rm/v9Ce5TD4Pgvy+2RvGgRHLppjwDI4hM4l9R3dCYxcEAYcFu3G
 kDqQKj1mQGekhjYF/FUFWfWRauH/v4eMIZkZD/hCT2w/PTfs7ylSlipdaIqjt90JzQy1
 LHiHrX+sWo3PDzsKm9KQhEM/oHOcCT+VEFNGZ/doVfjErp/6xbQEs1eDsVMkBW76s5Bv
 qp2F8Grr7488gPt8ckd9e2PBltZCYG8sMyPpUYvAwT5ppzo7jokzTUsmLJuS3XE4qa1r
 L9jA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9E+Gqrr67ra1xfFOMpI2LjNMhjY8+UZuavyduGaECQZnuiuA5XlMQPxNhvuYGbST8cr8caevl4Eg==@nongnu.org
X-Gm-Message-State: AOJu0Ywfui1zQukIlT2syKWPR18nCsV8juIv+KdmQynhAibS/dks648U
 DJ5plx2MXrBQ7wgHHyRnsAOOwQgxYrTzTmYjy6bpZtfROZA4655PJLLKffDNLa3cNIw=
X-Gm-Gg: Acq92OHX5/vbRAE4LdyGZ1uxKshOu9tctC7SI2o5oAgZ5Ccna0KjtsEtdcTktXJNXFR
 58CcQcbG9EhQ12T8HYCR1YDPyZNJwX2/W7OhfKORBt+/o/ZRFWGfUIEDa4FJCs1QFGhX5xG/kaq
 Wr3slzxQP86n0oSdC19nxWV266rvWaz8ygTj5egIa8eTHRr0WXpQa91s9+2VTmN9lVzGRappO9D
 ERkQGraA7kgrpNPoqnA0J6FU/MNDESomFaN3hEgIDfBWVaGlM0M35mEeQH/M0l+UjDOsszGMso4
 s797vbUhrunnglLLEFo55BlYM3omJCAQ5y8Is8Ub9qWNu5DgIzf4lHAMIeyNu92AoTyWQs/ie2R
 0sZklkea2TptvY/N5yPSumoopBTFR7HK45z+3dBKoOSv3dh2dNAAApUvIpm5vveAVIOcJ+SYe3x
 y63Ze/8K3PLbmkdXKWVHNhKn/Uqf5E13kpVrCrId+aWzqRHjqxl6TlSIq/GIohlEqWEB4KCGFJ
X-Received: by 2002:a05:600c:1389:b0:48f:d1b8:9a9a with SMTP id
 5b1f17b1804b1-48fe60e515cmr56879045e9.5.1778854287715; 
 Fri, 15 May 2026 07:11:27 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febe661e1sm15155425e9.22.2026.05.15.07.11.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 15 May 2026 07:11:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v6 07/20] target/arm: Introduce common system/user meson
 source set
Date: Fri, 15 May 2026 16:10:18 +0200
Message-ID: <20260515141032.3271-8-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515141032.3271-1-philmd@linaro.org>
References: <20260515141032.3271-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
index 4fb2c15f7e0..9eeccb2adca 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -52,59 +52,41 @@ arm_common_system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('cpu-v7m.c'))
 arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
 
 arm_common_ss.add(zlib)
-
 arm_common_ss.add(files(
   'arith_helper.c',
   'crypto_helper.c',
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


