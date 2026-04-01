Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8879F107639C
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Apr 2026 19:22:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8184-0006e6-BA; Wed, 01 Apr 2026 15:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w817x-0006VL-T3
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 15:21:21 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w817w-000321-AO
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 15:21:21 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-35dac556bb2so38420a91.1
 for <qemu-arm@nongnu.org>; Wed, 01 Apr 2026 12:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775071279; x=1775676079; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RHueK+jQ5chjrKpFFnR9MSU7a1nsMemCFdXKqJS5w6c=;
 b=ACgOMWHOPwGquOtgJzM709fInRsD68/fUgd0udxQB8dotgCdFQUnqF/E6TVP6wRq/w
 iqNRHQ64SjLa0voA0ws4kZU2l6UTEd1bZYumaF5uttXOpGtQEz70IJI2bxYhmvEk/2lw
 2X7Ru1neCAgIszYpGLJn0BDxAvST7AkpUqyfKpvya8HVWUUQQxpF9hlqDvtVlFlesEm3
 PR6YRN5pwqgcbU5iEE2R7G5Qc6IadShrmiMGD4k0zaca8qdj6+XgBlgAH51vmF8J+Tg4
 WgY5BhYu3Z5pl54XlCcgCyj9XTe5Jgo4+A0n8rCgMb4998FBB0R6LCkLIcgy6tJ6VP5L
 QNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775071279; x=1775676079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RHueK+jQ5chjrKpFFnR9MSU7a1nsMemCFdXKqJS5w6c=;
 b=AznsQUL47G32s3f7CvW9rPcbP4d/EWGoeWpjeBWUjy/9QgX8R8vT/4fCPSOBhN4FpQ
 WOmlqdGfGA32//l17jNd7v69w5UnUDBHs6sAshI+1OmikEM+trg/RQsJOg7rYBJwVNsJ
 0tZF6+9lK4Rv/wRIxfykDoObD37JHCcKZYM/UoijrgTuNRWgJBdH1bwKWEwvC67PTc2Q
 wkxKB01Vpjcwg/Of2xBGrdGnLA7/JpGrOpyObS2ABtPvG3io68B1vuP5itAn/xpE68zR
 NpdMD1JO9Z4blOZ2+6zNLriH+dPGlnT69nVT+fLz1D/UEmFRe7T4ezo9GgIz5vOfANcX
 DfZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9SqCacZ/yFI832RKJKGjdLakcrMX3FN5SH5afgbFWQ1HsCMFZ/Ml2UojnVm02gr4tnWASU8S3dw==@nongnu.org
X-Gm-Message-State: AOJu0YyOXFW66AYxOrlybz0zwVaCuSu2JFXwD25/CXKJmfIWOnWSffCQ
 g4pmGiYLOl6wCuY+reuPAk+qc5tZ+OgCPluU8PDA5/tS53lEecCyZuXb8kJneR8F5xE=
X-Gm-Gg: ATEYQzyPYL+ESoBJMTZW/bPZC5p5NrRnrRzy/YbMoKl8HhTu1FZ1xS7jwajq5D7dyYg
 HzqsGQgZDM/ho4Jx5zy6iEA930eFJGFJJbp3qO0EYUXrxAB44fYXi6Po4kUHq18faeovQE2XewJ
 wGhsddroOUlJlGRHeZ9wnkYRU8MNGOzhA2yQIy9+RtG7i5hXocWN8XYnRPHra/S0cCrSuBO1P+L
 psSCZ1oU9thJ3KcTpC8cb49QW31Wp9rIicwh9rPamO2YywoBIrf40l8fT3zsba+yXJ6bzk9uQ5c
 UZ5PMl0/jYPbsHU4jiuzt2huP7TthR2jT77EaZNbHIF4Vg1+XNi/iZzZjxHky+uqfruoe2le6ra
 hInNbdRjSsbzX4fg1fjeSRn/Z5rlz7kgPHccyb8U3JPQwZ9DcfeTWk+u3XZZz5f94TEU1B990VC
 JwF6Putp6ZeKVEx2ZQVtoGmsR5x1TiwIIRE2YEprQB3prygrioNduFvg2GaEK5ZTPFxOcxPHjKk
 KED
X-Received: by 2002:a17:90b:3f44:b0:354:a57c:65db with SMTP id
 98e67ed59e1d1-35dc6f0128amr4069105a91.20.1775071270461; 
 Wed, 01 Apr 2026 12:21:10 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35dbe41b11fsm5633113a91.0.2026.04.01.12.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2026 12:21:10 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 jim.macarthur@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 philmd@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 07/12] target/arm/tcg/translate-mve.c: make compilation
 unit common
Date: Wed,  1 Apr 2026 12:20:52 -0700
Message-ID: <20260401192057.1182724-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401192057.1182724-1-pierrick.bouvier@linaro.org>
References: <20260401192057.1182724-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1032.google.com
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

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/meson.build | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 8d9112f6da2..89c3b476822 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -16,9 +16,10 @@ neon_d = [
   decodetree.process('neon-ls.decode', extra_args: '--decode=disas_neon_ls'),
 ]
 
+mve_d = decodetree.process('mve.decode', extra_args: '--decode=disas_mve')
+
 gen_a32 = [
   decodetree.process('m-nocp.decode', extra_args: '--decode=disas_m_nocp'),
-  decodetree.process('mve.decode', extra_args: '--decode=disas_mve'),
   decodetree.process('a32.decode', extra_args: '--static-decode=disas_a32'),
   decodetree.process('a32-uncond.decode', extra_args: '--static-decode=disas_a32_uncond'),
   decodetree.process('t32.decode', extra_args: '--static-decode=disas_t32'),
@@ -34,7 +35,6 @@ arm_ss.add(files(
   'gengvec.c',
   'translate.c',
   'translate-m-nocp.c',
-  'translate-mve.c',
   'm_helper.c',
   'mve_helper.c',
   'op_helper.c',
@@ -65,6 +65,7 @@ arm_common_ss.add(files(
 ))
 
 arm_common_system_ss.add(
+  mve_d,
   neon_d,
   vfp_d,
   files(
@@ -75,12 +76,14 @@ arm_common_system_ss.add(
   'psci.c',
   'tlb_helper.c',
   'tlb-insns.c',
+  'translate-mve.c',
   'translate-neon.c',
   'translate-vfp.c',
   'vec_helper.c',
   'vfp_helper.c',
 ))
 arm_user_ss.add(
+  mve_d,
   neon_d,
   vfp_d,
   files(
@@ -88,6 +91,7 @@ arm_user_ss.add(
   'hflags.c',
   'neon_helper.c',
   'tlb_helper.c',
+  'translate-mve.c',
   'translate-neon.c',
   'translate-vfp.c',
   'vec_helper.c',
-- 
2.47.3


