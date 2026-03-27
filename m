Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97EB10F284F
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 16:47:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w6AKi-00086g-SN; Fri, 27 Mar 2026 12:46:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AJ2-0006eV-Rn
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:45:11 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AIz-00039l-I3
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:45:08 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2a7a9b8ed69so22884315ad.2
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 09:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774629901; x=1775234701; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GvXc5w4/HrhK32EYEuNiFYOfrNSSsMEH7KaGOeb7ixs=;
 b=UW1ZJq+dBmZXXBlWNJW75P64+aIbJgPBeZeqRU2lO3bVmvIhJzAmeMrf8BY5vbFCbW
 vWhdDBwSJbO6Lg4cfaNjwwRqSigJZWYdrPDeSlJBTzw6Xh9oiJbRDkfAWF22h7Cj0P8U
 UeNqX/W6e7lmvoAkb1Ox5IuT8MGkG6G2Nbl6w3YgbaMyV8rE2U0GxBLMUtwPLsfTURfc
 ygx+A37/2X3SAA6Ivio4FDeAZGucpTJRFRWZTGzCPRHC/pMWGwlEXVe7dxPuElCPucNr
 dWgZ9VKdy8nL6q8TCB6vWobSAK9UvlWl5dpuC4BJBVBekaNjwc2xQYJNKK8u53xHiaex
 GFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774629901; x=1775234701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GvXc5w4/HrhK32EYEuNiFYOfrNSSsMEH7KaGOeb7ixs=;
 b=J7tnjKP40k6nED4JyVSG0EvlhypM1hcHhoi7dE8v7RNJvbxZpcvuk7rWZCCVk+Og9i
 zJRgC+xiY7zL5oQuYunIg7lns0a+T82tcLhMNiTxIS2LxM0IrrXrjV8PFxWQsrCQSGFv
 er5vrZGp/3SQwEN5OFbEDtXYUm8c3X7Z/U90C+smzXQsObzNXf8ilnHnN2WOdspB1wlv
 rtRK4OFX+RtxfITLWSO8yi2kDnRx98YF+19EkrfvzVbEJDGyJQ7temCIxRdb+Zyane2x
 G0sFD/2fHwFJvxw1Vr22wOQE4pZGVjOuhlT7BqWox27aYGIuC2Zt+MixEIUROhWOLdJ+
 eL9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwpcravtcAseL19psPEDHU26NmJFgYAPQJ2Y8lz+vrTv1C6xy/CFmLqVSHoZ9Wip8kb1EVtk6AOg==@nongnu.org
X-Gm-Message-State: AOJu0YzJEZ8v2C4o2tRZYXgt7jzAL46QTf/iVqwFzmUYz3uHexhebqrq
 TRHw1GTkJjLpLqBsLwt4Sgw/xzyUJ3LJVv8VbnZg31gvIdJVOrzIy2zHEfciSzxJ+VY=
X-Gm-Gg: ATEYQzzjXoDImaB2PFGUit3Ej9DqaVfvfTvA7qDw3RjNMhnrrH7h1xqxxmUxvtspCfq
 GD8/G2RMRnrCXIgptpmKQcecnDZzx8XwXel7QW88+w0kQr9+JoyAzp9bz04Yra93+K1EI7AbcFo
 HxdpA98ht6fEXEtBoGX0atE9GoQatMv9oujJoexo959eYlmYdew257x76GeV4BY0lOzSt4Bm3RF
 a0M669X7ffW7+5LNvbaEFWEq7X+6S4dirM0FaXI3D1v1KoNVtPvkKg3ydzC+xsvkWyRZSMSgClp
 J6QV05tN5VIzs20UNKaft14LB1+zzP0oaX6lGE5uf2ZxftNvlRF6wyixVk3ujyr8mE2e1740Tnq
 VTgL1haX9Vknn8KLFJrnLSIQ7bKcySb6nNhpVcxzzOzR8wfj1Dscm44ImHOujU2W6bl1IjvyJ9k
 jlq4S5Q/aVBlLIRbbMlx2/D/7sFsdRbinQPCSsnHSDxSafFd2BbIeN9lebzcw9reTngoY2ebqwH
 ezwT1EH8I1lsZ8=
X-Received: by 2002:a17:903:46c7:b0:2b0:b325:748a with SMTP id
 d9443c01a7336-2b0cdc51c8amr36148555ad.22.1774629900611; 
 Fri, 27 Mar 2026 09:45:00 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b0bc882339sm63890655ad.43.2026.03.27.09.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 09:45:00 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org, philmd@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 06/12] target/arm/tcg/translate-neon.c: make compilation unit
 common
Date: Fri, 27 Mar 2026 09:44:43 -0700
Message-ID: <20260327164449.596767-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327164449.596767-1-pierrick.bouvier@linaro.org>
References: <20260327164449.596767-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x635.google.com
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
 target/arm/tcg/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 46bf4a6d76b..c14c9242df5 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -29,7 +29,6 @@ arm_ss.add(files(
   'translate.c',
   'translate-m-nocp.c',
   'translate-mve.c',
-  'translate-neon.c',
   'm_helper.c',
   'mve_helper.c',
   'op_helper.c',
@@ -60,6 +59,9 @@ arm_common_ss.add(files(
 ))
 
 arm_common_system_ss.add(
+  decodetree.process('neon-shared.decode', extra_args: '--decode=disas_neon_shared'),
+  decodetree.process('neon-dp.decode', extra_args: '--decode=disas_neon_dp'),
+  decodetree.process('neon-ls.decode', extra_args: '--decode=disas_neon_ls'),
   decodetree.process('vfp.decode', extra_args: '--decode=disas_vfp'),
   decodetree.process('vfp-uncond.decode', extra_args: '--decode=disas_vfp_uncond'),
   files(
@@ -70,6 +72,7 @@ arm_common_system_ss.add(
   'psci.c',
   'tlb_helper.c',
   'tlb-insns.c',
+  'translate-neon.c',
   'translate-vfp.c',
   'vec_helper.c',
   'vfp_helper.c',
@@ -79,6 +82,7 @@ arm_user_ss.add(files(
   'hflags.c',
   'neon_helper.c',
   'tlb_helper.c',
+  'translate-neon.c',
   'translate-vfp.c',
   'vec_helper.c',
   'vfp_helper.c',
-- 
2.47.3


