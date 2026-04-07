Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3053D10F9972
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 19:28:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAYYG-0002mT-Vn; Wed, 08 Apr 2026 15:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAY7b-0007o4-81
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 14:59:27 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAEoi-0000tr-0h
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 18:22:42 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2b299b3c739so12025605ad.3
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 15:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775600559; x=1776205359; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U5qEYDYbzP6gv3T4kUPVLqSQIA87qzuUGpDgD/WJ/SI=;
 b=ZFs0XqJX01yLHD7+OvOjiuRunId/5Ri8qMruuLAH9V2VUw8CgBkXImsrWl25TkR5nD
 r8cY1m+CQdRmFIjKFV2DDP2ea4rkQKierHvo55lYdyspLceSHgOoNHe0gpp+CuGiYIbt
 PEQ1N2mhfE3keGetcYol6GdqSQWNI3gBUHZrpU07/HaoU3kL3Y3/YK0YAzVHm8G+Dz+x
 V5Y4E22AhutlmuRuuZMJNRR9UFz1QkFUKnb713d59N2wCDiD07irPVpUO/Pu6pbkTADb
 lPi+aUiKorVLB5h/gg9BXIUHQAt88+Yla6LZddSjS5Lfjprze/Ltl6LfSjwKtcQNPL8U
 lrPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775600559; x=1776205359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U5qEYDYbzP6gv3T4kUPVLqSQIA87qzuUGpDgD/WJ/SI=;
 b=CATEKxU15cUWwRoj1J0R3Yj1BEvcbHIkm8wj4cVABtxq44GdvxixsSnV+wT1l9b/hY
 aijR6PzgwgKPLfHP1Qf9CcYoUKcJZMTRCttKSUA1F/1fvGy9jYZmg0JNuOSlC3/UetoV
 EI9+afBlfGsCsfDAnoq8+gdzIHTcSDKjOxfl/h/9Vd45/AWC4UGSL4zec+7sOkrJ59d6
 s736ODB0e8SkEPXauXvnAv3mcP0gLKflonyoUYvhdhmZ3VXeHVxQUSztRJFXEyTAPkx+
 3Q16gi59Y6OCYm8iYCbAzsuVqqD8SlFKpyRHw6lNRGOENzJa9MapU7s1NsFZn/VE7q+P
 SQYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1bxSQu/D3n9VHcEw+5Sl89T3aduOdjC1RSeEDNZcdOKC03MFwQewXRA2+62687Nlpw/u6XagIDw==@nongnu.org
X-Gm-Message-State: AOJu0YwcjQXUQwg7XoS0c7gBUTjdk/CB6zHkHB1eLDrWkc24I/krbR+h
 VbNoy1u9HmExeP1i/HwX77DEUBEJ5iPif+xs4VtWDyvMtYR3fNls3tfV3vWiZpdFLcU=
X-Gm-Gg: AeBDievWXFYk9xH9+7qlBhHzm1L7ci3ePYnHEgg1S1MK5wCKxG1RUogFpL+W+QoR969
 oN7jQb0TWTtGoDsxmPOrG6j0pLuJk/1Ngxr0KDe5CXfj90kbkn+upRYCOZ3P/1vGe5yi3VNAG8U
 VKgX3lnQTNAOYjY1GHR5mzZIHqvkelDdn58m6v0t5spgRCq1QVg8lkMBTdxHK3fIm09SHwdD08s
 ZNwcimoVkbpkzYoZbHR5tAGdeczzK/b2y5/ha3r31lF1PK+cSJGrwI0Dc9wk9LXaz6tiZeBnB1l
 N6s1E4J7k2wYGRYMHkmabuXv8bfxGXZZOYkqq6w9AiAwk5Di1+TZOlSo2kr5wP/rmr1MD11okOY
 /x3olRSVGr4wU8/EGBe9IqFB/DOU1tLvQ2vE9WmKBoSefDU3q9oT5MAWMuTcPyXgbJbjepECz3M
 Lclyp3izUshdkiaEy2J6ZEGayp+b4KckPWLSS/YWkXRiiA6D7RXcGi9tmmK1gCkp9V4Fbigr2sL
 oav
X-Received: by 2002:a17:903:b8d:b0:2ae:fc60:2650 with SMTP id
 d9443c01a7336-2b2817b24c3mr185697845ad.39.1775600558634; 
 Tue, 07 Apr 2026 15:22:38 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d5csm180412065ad.38.2026.04.07.15.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 15:22:37 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v11 21/21] target/arm/tcg/translate.c: make compilation unit
 common
Date: Tue,  7 Apr 2026 15:22:08 -0700
Message-ID: <20260407222208.271838-22-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
References: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x629.google.com
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

We removed all target specifics, and can finally compile this file only
once.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/meson.build | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 0740de92c1a..506f031f1aa 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -20,20 +20,18 @@ mve_d = decodetree.process('mve.decode', extra_args: '--decode=disas_mve')
 
 m_nocp_d = decodetree.process('m-nocp.decode', extra_args: '--decode=disas_m_nocp')
 
-gen_a32 = [
+translate32_d = [
   decodetree.process('a32.decode', extra_args: '--static-decode=disas_a32'),
   decodetree.process('a32-uncond.decode', extra_args: '--static-decode=disas_a32_uncond'),
   decodetree.process('t32.decode', extra_args: '--static-decode=disas_t32'),
   decodetree.process('t16.decode', extra_args: ['-w', '16', '--static-decode=disas_t16']),
 ]
 
-arm_ss.add(gen_a32)
 arm_ss.add(when: 'TARGET_AARCH64', if_true: gen_a64)
 arm_ss.add(when: 'TARGET_AARCH64', if_false: files('stubs32.c'))
 
 arm_ss.add(files(
   'cpu32.c',
-  'translate.c',
   'm_helper.c',
   'mve_helper.c',
 ))
@@ -66,6 +64,7 @@ arm_common_system_ss.add(
   m_nocp_d,
   mve_d,
   neon_d,
+  translate32_d,
   vfp_d,
   files(
   'cpregs-at.c',
@@ -77,6 +76,7 @@ arm_common_system_ss.add(
   'psci.c',
   'tlb_helper.c',
   'tlb-insns.c',
+  'translate.c',
   'translate-m-nocp.c',
   'translate-mve.c',
   'translate-neon.c',
@@ -88,6 +88,7 @@ arm_user_ss.add(
   m_nocp_d,
   mve_d,
   neon_d,
+  translate32_d,
   vfp_d,
   files(
   'debug.c',
@@ -96,6 +97,7 @@ arm_user_ss.add(
   'neon_helper.c',
   'op_helper.c',
   'tlb_helper.c',
+  'translate.c',
   'translate-m-nocp.c',
   'translate-mve.c',
   'translate-neon.c',
-- 
2.47.3


