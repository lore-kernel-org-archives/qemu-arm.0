Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B11410F284E
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 16:47:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w6AKL-0007UV-52; Fri, 27 Mar 2026 12:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AJ1-0006eP-HZ
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:45:09 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AIw-00039V-VS
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:45:06 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2b062069f80so14021425ad.0
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 09:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774629900; x=1775234700; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9hNSssL71icxnCVZy3/O+/Sz6YGQHHE5H5XHwyq5DTo=;
 b=C1BKg5DH32E0JY4mPKpgv40U42GxmiSfIlZxbkWUFgqWnaakQG/ZrvRzsKT3poR9ox
 YCwvw6tGzYX7O3LFhxzr79WyDhvZ0JqshHOOUHgIWWlIjptIS5szOTUz6HcrQQXMwfy2
 rpN4HPTqmMYV3CYFtsw092mr8OOlNkteOdsrBWlA8H+10B79IoyhddH+vS0c0txtmx8r
 XLVHCZiznwlRMSSmRX5W0OvcFGx90n1Z5XMb3Q9yDUhlgxm/fx46o4mnpWsnVFldWMdT
 XpL3rnMk3IaP7So4scdW96hzdkH35ge1Z4jZOwFLVx1TDZPiqZ4X7HSr8YqkUlX7cbHZ
 Tnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774629900; x=1775234700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9hNSssL71icxnCVZy3/O+/Sz6YGQHHE5H5XHwyq5DTo=;
 b=f4FkFyGHzAfGWkBP2LdX6I1tG/AmQnR03wNJYcVG1TKRY+MGMo1QG1B7zY8e7J9G+u
 s6hquLbr3q1iHJhpMIUvL7Sp71DhacCIplk7lV3DCEQef4hw3LEfoJx1vUojGLh8jg9N
 2F/knWvDo909948GaexZL/gLpHA1R+mrrxSunyyl03QtSjhikTqrznXcjsT/1XHMek1p
 vsoa/xRBpwPC8GPO4dEktj6Q8dTW8CvqtOjyX9iLjfn4rG6IfLquupKuH0Iuy5dQCNES
 nX0r7eMmXzjxL6e0dkmRYzd653u+aqJiHelSBM3OuXxVepVxuDGkD/sn5recoBtN9wfE
 SQnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfPnyJgoxy8492Z9wNnF9sMRpUIHMLDpWI/tOOKisy+MgfBVakbQXjsPfmKm8UDvJtqA13C+GSfg==@nongnu.org
X-Gm-Message-State: AOJu0Yz9jLnUjvN7D3JKsDdQ92lHM9HJjT2oSJ7lY0KOsi174Rv7VgNt
 ZFUn4Z1y+St9UfYYuyYpEclGDvESR/5iQBqFrzEOTKUFxx3mO+/pQ+bQWuP8zzxfoZI=
X-Gm-Gg: ATEYQzyVfPmCwoZcA5PcLVHh5AfVwbAjUrPPxGvbqw4ki42HuTaW1vetX+ve7ZNsKV2
 gNXgFeAvxm4ohEVe2L9NXD33cKjm0KH+DHuYKL4QQ4N5Dmrgdaha0LEM5c1gfSva3vocwWwaXC/
 Eq8i1wiw0N98MEsfKy9eu0N4cyTCjnEDrWnOfS9Jss69E/fwytzBUKYPed+eiZbQZqT1ZCh9rmi
 r5gOC7hI13TLzFjWuooNBd+i/4BmUX0Cd2ZCj1WI4XswJUA9fYNjkj6xNqarziZ9FvvOp0H5dSh
 T1jU2ti6VsT9Gz5cINkpCCG8be8hPm+PcC0/FRNjBV7yunvU3qZ8z03OCQ8mHnE3/tRN8uaqKq3
 9qKovbg2866FeoA2UC7B8PXEBVipK3d/Mx27zWL5wnn+j3vMzdU2vQQuzDwWVYebugcPP73Mz+d
 PneWkPD/rRkFfZP2e6jlwA595K1LELfOa1rBcGCpE7mfKATaxj+t+jXfnAPhDbriKHMI3bNFeON
 I+V
X-Received: by 2002:a17:903:1a2f:b0:2b0:6a3d:36e9 with SMTP id
 d9443c01a7336-2b0cdcb73d7mr33260445ad.33.1774629899859; 
 Fri, 27 Mar 2026 09:44:59 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b0bc882339sm63890655ad.43.2026.03.27.09.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 09:44:59 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org, philmd@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 05/12] target/arm/tcg/translate-vfp.c: make compilation unit
 common
Date: Fri, 27 Mar 2026 09:44:42 -0700
Message-ID: <20260327164449.596767-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327164449.596767-1-pierrick.bouvier@linaro.org>
References: <20260327164449.596767-1-pierrick.bouvier@linaro.org>
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

Generated decode files must be duplicated between user and system, as
they are generated in private folders per libs, and can't be included
otherwise, as meson does not give control on output folder.
Indeed, meson generator is a different approach than custom_target, and
this is a limitation by design.

They were already duplicated between arch variants anyway, so nothing
new here.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/meson.build | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 3e96c77df73..46bf4a6d76b 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -30,7 +30,6 @@ arm_ss.add(files(
   'translate-m-nocp.c',
   'translate-mve.c',
   'translate-neon.c',
-  'translate-vfp.c',
   'm_helper.c',
   'mve_helper.c',
   'op_helper.c',
@@ -60,7 +59,10 @@ arm_common_ss.add(files(
   'crypto_helper.c',
 ))
 
-arm_common_system_ss.add(files(
+arm_common_system_ss.add(
+  decodetree.process('vfp.decode', extra_args: '--decode=disas_vfp'),
+  decodetree.process('vfp-uncond.decode', extra_args: '--decode=disas_vfp_uncond'),
+  files(
   'cpregs-at.c',
   'debug.c',
   'hflags.c',
@@ -68,6 +70,7 @@ arm_common_system_ss.add(files(
   'psci.c',
   'tlb_helper.c',
   'tlb-insns.c',
+  'translate-vfp.c',
   'vec_helper.c',
   'vfp_helper.c',
 ))
@@ -76,6 +79,7 @@ arm_user_ss.add(files(
   'hflags.c',
   'neon_helper.c',
   'tlb_helper.c',
+  'translate-vfp.c',
   'vec_helper.c',
   'vfp_helper.c',
 ))
-- 
2.47.3


