Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B142FE81A3C
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Feb 2026 16:04:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vs14q-00028a-RO; Mon, 16 Feb 2026 11:04:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vs14l-00027W-FL
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 11:03:56 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vs14j-0005n2-SM
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 11:03:55 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48374014a77so27875215e9.3
 for <qemu-arm@nongnu.org>; Mon, 16 Feb 2026 08:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771257831; x=1771862631; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dJImaBRf1UQRC+k31lYt80mk2JUrwPwtKKmyLVRtziA=;
 b=bzBU40EZZZz7YLGYGl2psVSkoDoyfgw8qG0t9eBSEkHu/H2QLzU6jA/K2hw03DgY5n
 BT6CitBO2MrpALiDqWEhO78oYYCf72MYnaMsUMVeXtCsACJQqYx0Sn9jkeBmekA4cR3a
 zoUnrulQ0eIRUpDC7bKrg5H28oSDQsDCA5xLnHHzffntXp5T7DtS7dUF/Q4vCN2Kssmn
 Y/uD4awQ8/SI/VG/oWgcAWM1akw8GVLgZ6L9KSayRCpFFWrUmysohsziJxuN4XkLoLZU
 Rv3kWRo4+auReR1Q8BJfY4aogSiiccGxpNPuKvBj8mAgB+dutM17qiYVeqTpSuCG4wjV
 Jr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771257831; x=1771862631;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dJImaBRf1UQRC+k31lYt80mk2JUrwPwtKKmyLVRtziA=;
 b=HOplA5LTc12pkZNUQt6X0hUMa4a4poEXbmygGfr9MWJH4UvQx6yoy9Ok/RJ9OaW9Xe
 Sh+6aPfVLHCJ0qcD2OY+tbNdRDwbBXmD2sGMpbDi0E5cprZl9VrLdLaPF8JXmzcPi2J/
 srosUDAFGPliqm1QhtwJSnxNiSW36/Wnou1RyhD2JZ/Ysfwq5QK1byV0t/8vmbX3DFry
 h7voXnhcAL2/8A97vYxdk31YM+lVD+7xgsAVURK/OgM65iddcIGmEk3xh5kUmokZ7wTa
 jMmqz0o74FEEcaasxc+K1iaUbNKW0PCtwA1Ft5zc7mV7htVRyhynO8sunsqjjVqay1rp
 FQaA==
X-Gm-Message-State: AOJu0YyssLTxlmJiOfT0MZN8r9XzI713SfacEm29W4O7ShJZsoRDDBgD
 YvwdgLVFoubGmcidDkW9rzYYSCmR3yd1eFlB7WQGedGFK01ctTLAXwIn+Jw3bWghLy0Z0kTT1EF
 y8JZd
X-Gm-Gg: AZuq6aK7Lj5uWu2j05Z6fTvQe+jCUM+MYCl2zuIP3hzBPgAioYFVUoWuw9XYv/bEETT
 5NKXm+mmENl2ovY48BuS/T6Jw/BDZW5T5EOsVLPrYNpLnZFhpkAlCfvLRP0BAydiNyfXkdtudKP
 UN1jE6RYNb81PeDDwnDBhb5iVqLt8j0kets5SBGTlGpeWKuBgG3NpxhX2IGKHYSDaHeUliwQQvp
 NHozktQT4oLuCIhIcG4Ae/R0TSKV8IOadiAvYYJxpRCYHGwunCkxQEOjdkoFPWju11gxF6UxgjA
 bhUD/u7RFncil4sm+ULcfbAW1RxxLZxN8glIaDb+JNoTO5ll5c0EE6foLK46M2yar7nrcjmJsUB
 KVbQ4gKS1sQfi9aknBTinmO6OgxZLibYLfQ+HBGfgskYpaUkGAJA6qkO2JLUZXPqD8N4XiFns0b
 yLNpwx1iB6sq4PCrnXa3cAVTcDX9l35aF1b8f4u+mcsqCyz3VXXBunBgzdwOiNQAIaBjepyuTnQ
 laJ5Dvn46ECbbgRGP0LnLF4mjrQ2rw=
X-Received: by 2002:a05:600c:3e87:b0:480:32da:f338 with SMTP id
 5b1f17b1804b1-48373a0f961mr165584795e9.14.1771257831360; 
 Mon, 16 Feb 2026 08:03:51 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835d92267bsm661713185e9.0.2026.02.16.08.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:03:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 0/2] target/arm: Don't use HELPER_H in non-tcg files
Date: Mon, 16 Feb 2026 16:03:47 +0000
Message-ID: <20260216160349.3079657-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

This patchset gets rid of a couple of uses of HELPER_H to pull in the
TCG helper function prototypes in files that aren't in
target/arm/tcg:

 - debug_helper.c has a lot of TCG only code that can
   happily live in a new tcg/debug.c file instead, and only
   the CONFIG_TCG code was using the helper prototypes
 - helper.c was calling exactly one TCG helper function
   directly, and can be made to call a different function
   instead for the same effect

Pierrick: these might be helpful for you with getting the target/arm
single-binary series to compile when TCG is disabled.  I think it
might be best to avoid having a single helper.h that gives both the
helper_foo and the gen_helper_foo prototypes, though: even if it
doesn't cause compilation failures, only translate*.c need all the
inline definitions of gen_helper_foo. If you take that approach
then it would fix the compile errors without needing these patches.

(I did wonder if we could move target/arm/helper.h into the
tcg/ subdirectory, since it really is TCG-specific, but it looks
like the machinery in include/exec/helper* assumes that the target
has a helper.h in its top level directory.)

thanks
-- PMM

Peter Maydell (2):
  target/arm: Move TCG-specific code out of debug_helper.c
  target/arm: Don't require helper prototypes in helper.c

 target/arm/debug_helper.c                  | 769 ---------------------
 target/arm/helper.c                        |   5 +-
 target/arm/{debug_helper.c => tcg/debug.c} | 542 +--------------
 target/arm/tcg/meson.build                 |   2 +
 4 files changed, 4 insertions(+), 1314 deletions(-)
 copy target/arm/{debug_helper.c => tcg/debug.c} (53%)

-- 
2.43.0


