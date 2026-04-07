Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39B310F9972
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 19:37:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAYSq-0004mD-Us; Wed, 08 Apr 2026 15:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAY3i-00062A-GS
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 14:55:26 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAEoQ-0000nR-8s
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 18:22:23 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2b2429f98d0so36231485ad.2
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 15:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775600540; x=1776205340; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n0wgNLa9n9Vgc0kuCG4RsEiFVidf8BLE6jw9JT+iAmc=;
 b=GEeX1qCF2BXI/pvnwzlF0/26YiLEAMDZ/E3uCVBZK/HNcEuhyymOW8qXf+0D0OcHYV
 AhCQ8sWLkIQ26kE5sOrxXZMj4R42RVfpbtzwpMoGoskbsx3k6543dbWq0ug7WmYoF84Q
 Rx0XYwkhBkLRzOWmAY0iUKZ0ylJRt7vmwyCtZ8ldzb5rrf6obxbhyFViFAy1w8J3v67r
 BdoBLHTzYAOWyzgZZ5FpsTWyq7pQQk04nD/O4oNsOxlGtc6xDWfAg+vFA4SDtfHaH7+l
 5zfDxo3yLgI9DJjLFexUTqwZjSWFiH03Y/nsSBW8e/DW8YiXHO7Z3N9tuLnXhZX2HfgO
 YlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775600540; x=1776205340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=n0wgNLa9n9Vgc0kuCG4RsEiFVidf8BLE6jw9JT+iAmc=;
 b=BRjZgNwRLFdcIQEyGhLJv7DvEW0xudSJkObKY7v8H+rS5K2DmVPgLy842bq24GhSev
 ilpBFX9BQnQxk0B1Y8zSPp1a8gTmD2Lizi0kjQYDz7A6izGm3Fx3O0tT+FtMeJkCkOTG
 54/se6aYfIrDD9pUaicjpb8C91XYoL927dMAJurDQ7VowiYnW2j9TgCW86pEH+d9p290
 JEIoptgdiJvh/5CvYUUVPfXiL5olA8m9iIOqeXvzPoHa/2Kpv/Lwx718Yd7Zk6+CzYtn
 paNezcCC9Oq0+O32ckjNLI7djehBDISEqQB6SDH4glMVG4YRhb8g9WBqsVjkf5sQwr5I
 Ar2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy6tXrAltN+moQiRZidqvetTMKRAVRpe0UGFCXwcIke3NNK3bhfDpok5IP0OPS3hEtTLeW/wHUaQ==@nongnu.org
X-Gm-Message-State: AOJu0YzwQyxEt54nsxzrul6Cpx5Nn6ROKvQ3ssFlmo/Zhn8KTPhz7Nt9
 xIhwlBSl7x2p+sUc10m/o8KbqdDHW6d2ZJW6t1rILGFs730gTp81CpqUpRAKOv+n0Xo=
X-Gm-Gg: AeBDietgsdeSlgnKLjEldn9SaxZz2688KgpR7K7vqxdQGeevMElqolqcUCOTsXEWWDG
 pdNMlle1Jk4/exT5nMFLVxpuwrs5Z3UbF3j3NYU5yFo/K4DdlSWNVV1gOJ8VSSVi1qSO0mziSAH
 Y1qk4MnkgGLGjsjl3DDnmb+RzHETVK9eAmz87Wl3hUVPCvtUuDn5iNrRkPREvzW/ETqiAyP7Pps
 eqdFFykvA4tMD/+X8mV+67tq78EIvE2JV8n5axB7+nE6hOLUKaASfTiJGd9ygDpN8AdJpRFf1wQ
 OBm4N7kVcsMQiKBAFeuMHBuZHmsoo8gjv8Zz4V6f8BEJcEruA6UCbg3zA9GSpzyO2daBS0ZBdtK
 +zuBjXTzOkIDmQe4nSLra5SYMMz/0zowmjjxZKrBWP0s9E7uTeb6RX43Cr+Sw/lrJ8wafA7T9f5
 OD0OFM2mfnsSMH/sonLp2QUA+QDCRHxwmaIOzcxmBsuyTXk2gvGTj6OEnJcsC1jC5BWrftTpvIq
 rPF
X-Received: by 2002:a17:903:4b43:b0:2b0:775f:febf with SMTP id
 d9443c01a7336-2b2817b89e0mr240772285ad.40.1775600540482; 
 Tue, 07 Apr 2026 15:22:20 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d5csm180412065ad.38.2026.04.07.15.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 15:22:19 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v11 05/21] target/arm/tcg/translate-vfp.c: make compilation
 unit common
Date: Tue,  7 Apr 2026 15:21:52 -0700
Message-ID: <20260407222208.271838-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
References: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x632.google.com
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

Generated decode files must be duplicated between user and system, as
they are generated in private folders per libs, and can't be included
otherwise, as meson does not give control on output folder.
Indeed, meson generator is a different approach than custom_target, and
this is a limitation by design.

They were already duplicated between arch variants anyway, so nothing
new here. They will now be compiled once for system binaries, and still
per target for user binaries.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/meson.build | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 3e96c77df73..5f33ecd76e0 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -5,12 +5,15 @@ gen_a64 = [
   decodetree.process('sme-fa64.decode', extra_args: '--static-decode=disas_sme_fa64'),
 ]
 
+vfp_d = [
+  decodetree.process('vfp.decode', extra_args: '--decode=disas_vfp'),
+  decodetree.process('vfp-uncond.decode', extra_args: '--decode=disas_vfp_uncond'),
+]
+
 gen_a32 = [
   decodetree.process('neon-shared.decode', extra_args: '--decode=disas_neon_shared'),
   decodetree.process('neon-dp.decode', extra_args: '--decode=disas_neon_dp'),
   decodetree.process('neon-ls.decode', extra_args: '--decode=disas_neon_ls'),
-  decodetree.process('vfp.decode', extra_args: '--decode=disas_vfp'),
-  decodetree.process('vfp-uncond.decode', extra_args: '--decode=disas_vfp_uncond'),
   decodetree.process('m-nocp.decode', extra_args: '--decode=disas_m_nocp'),
   decodetree.process('mve.decode', extra_args: '--decode=disas_mve'),
   decodetree.process('a32.decode', extra_args: '--static-decode=disas_a32'),
@@ -30,7 +33,6 @@ arm_ss.add(files(
   'translate-m-nocp.c',
   'translate-mve.c',
   'translate-neon.c',
-  'translate-vfp.c',
   'm_helper.c',
   'mve_helper.c',
   'op_helper.c',
@@ -60,7 +62,9 @@ arm_common_ss.add(files(
   'crypto_helper.c',
 ))
 
-arm_common_system_ss.add(files(
+arm_common_system_ss.add(
+  vfp_d,
+  files(
   'cpregs-at.c',
   'debug.c',
   'hflags.c',
@@ -68,14 +72,18 @@ arm_common_system_ss.add(files(
   'psci.c',
   'tlb_helper.c',
   'tlb-insns.c',
+  'translate-vfp.c',
   'vec_helper.c',
   'vfp_helper.c',
 ))
-arm_user_ss.add(files(
+arm_user_ss.add(
+  vfp_d,
+  files(
   'debug.c',
   'hflags.c',
   'neon_helper.c',
   'tlb_helper.c',
+  'translate-vfp.c',
   'vec_helper.c',
   'vfp_helper.c',
 ))
-- 
2.47.3


