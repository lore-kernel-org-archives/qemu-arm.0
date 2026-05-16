Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF10CD4F3C
	for <qemu-arm@archiver.kernel.org>; Sat, 16 May 2026 17:16:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOIcs-0002u3-Nd; Sat, 16 May 2026 13:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIcn-0002fs-6v
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:16:30 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIcl-00088u-E1
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:16:28 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-45e6a4d0be0so186175f8f.1
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 10:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778951786; x=1779556586; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M2n9oCOj54/RZ9uOY9lkyK7EyfxiRBivNaFySHMZgJY=;
 b=e2AXJHzl0jW3xq3I84yi/7MxeiNE1BJhNyjBBFd0BePKKywlGCZdTh8OKDQx2ikPll
 kBmIC0atNpo1x4YZbhd6UYKQXx0nPIbR5v9ivqkGthtmWObmhcRIt5qxpOD0dm4JUANz
 KavSWY3E22uWphsF9wbCcRTehp2XpQc5YQG+XX/okTi+DhjfKahdY2KCIIbLZaKWIW8M
 DOywkLEzQgy0zHLutpafk6SAOtRRp4UjXHX5YBuoq0MUmR22n/9mh6UuxAciivWyK4Yd
 F/IL9ZgAzhU4ZfvyUOe9PFeoxn44sA/TvnzIyI+Ap3QHX2tO2FaXuWReLuAxItD833Ep
 myrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778951786; x=1779556586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=M2n9oCOj54/RZ9uOY9lkyK7EyfxiRBivNaFySHMZgJY=;
 b=qQteU88Jw6ptzMJ4AjBerMSPr4s/f7dsmDYrA7n5fsgL8k0JGXSJjYpWw4gyn6/0SR
 GkY9o9H5MlN/6LoXYDB7qreRstRPW9qqer9N0RKjrWDdcYAyGQEG3F8c5MQk39JteBrD
 MNEb8UERojKUxhhun3ZnTcaZo1iO0ZU1Dr4yeTYN7sm6vBcD7rMVBjWhOPGl1Uv6tinH
 vaTK9DgFfYp9WsydKcw1mEgXyRBrmNJIyTjclxFzI2QQoAijyLyIdf/3i5ftqzkHrh4o
 qrHgOLBV5juOMQpq4kICHCUe8UTeSNJkUyjc0pjZokPe341wbhX+h/YE6Hrww1RYkZMA
 JsVA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/9WWA21URkXM8Pbtej2QtTrvCVqhwo94gC6i3y2knnsbhEXWJgWlHadqWKgGp+7JS1vapEH18GRw==@nongnu.org
X-Gm-Message-State: AOJu0Yynht4O+b+IJs+cJZw8ROvQG1MI12+owRd+sGyjJVCVyBsrO15T
 1X6Tj+9O7xMxnOfvicehAipDX/J867qSNC77WmIf1yOY4aAcHFhKIYBwVWu0wptmBws=
X-Gm-Gg: Acq92OERQW38/q/Vt37unuG0NmbpqKkL39enImuoygDIANU2ZNLFDoZjkJUbdNFdCpF
 AMDD6TcIx/+4EQvMmOB2kZ2JheiSfryS4PxWbbybVhIOMeb2TJ+KLDhZBlENXhUjV12aUCRlzyi
 p9j1ZmbqiBTm5RddK+2MyXQ9wQ8FR75Mari8sta7E9ZppHlG1UbB6kanwDOlvDBZgLyVgD3COkT
 zBH0VP+CS1oxyPPywbaWq7O745ZA35gQESNHabQUMdMXSKqPqg3ZhewHqqx+3CjbbIQKaiNVUbV
 OXcTENYHZ9StqxSeuAiSdpyrVGIzTSz4Xrv3dwteL+WAV/2rLQWj8T2b12TG0Vn6bHcFbRpg6ZV
 hb5gNTWWKizbdzJiJYqc9j0TImPBt39sZBOz1SgQCOMfeEKKOyzqSo7opG7PVr60tSDFX00p+rb
 1juKK5ul5gVKPzT4EOt0XT/pbAoIur1ZiTCQXUvem12rmaHIxVOVeA+D7Mzh6UPa5HWLBT1OfU
X-Received: by 2002:a05:6000:2601:b0:456:e27d:d6aa with SMTP id
 ffacd0b85a97d-45e5c5b3975mr12006870f8f.2.1778951785612; 
 Sat, 16 May 2026 10:16:25 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe248dsm23236131f8f.30.2026.05.16.10.16.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 16 May 2026 10:16:25 -0700 (PDT)
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
Subject: [PATCH v7 08/21] target/arm: Introduce common system/user meson
 source set
Date: Sat, 16 May 2026 19:15:10 +0200
Message-ID: <20260516171524.19184-9-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260516171524.19184-1-philmd@linaro.org>
References: <20260516171524.19184-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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


