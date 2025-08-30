Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E82CA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:19:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNxL-0002n5-H3; Sat, 30 Aug 2025 11:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEMj-0006Ca-P1
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:43:10 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEMi-0004Jj-8b
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:43:05 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-772301f8a4cso1456181b3a.3
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532580; x=1757137380; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7+ER0bRwaWJSVZXuKMTaNBSXf4hbZ3aeU4lFfN33xP8=;
 b=RlotFGoVZ4cQE/edn06eiZXmRz+bmqX8PVcDueWCdLr8b6fPTFEOuSra1tKx9vK/25
 fClw8YlT5raUEAIVeN4HblZkus5xYpqcax+591Xupf3Tlza+0frVaQaXyItFmCNbzX1P
 zKrHBGeY8tkRyrRv8YOQGZkrokyW/AnMgXPpQNYJEGBrjDp7DwjjQoeWnfgk5hpwJfwq
 xYCL/JKlqNaf+elh3cLf3dxAjeW4sqYE3hhOEwBUq+XUr6SSdzsKFNUa68PsPBU9lUkO
 SL/e+QFHZLE65GoRK8RHugEqr2T62cH20Ebvrkgq7FSF+U8yASiVvlQIfBomSZmjAdCU
 APPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532581; x=1757137381;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7+ER0bRwaWJSVZXuKMTaNBSXf4hbZ3aeU4lFfN33xP8=;
 b=xHiVg+PbrEpuzwfJ8BTMfdbipNMONOvLaz2N1gX6CrA7dgF8qzJLmuq9fKVWJK4E7z
 Ann2FW/u9jV7fDyDXaItAaeNgWeJM3sstsrYalqYlJs5+gJGC8lzjRvGh/HHJqNy5kVL
 ydrtQ4BpKZfIOy8973LkGJcfN3ooHJrby/uLYg0vrG6pwi/2BsYUUe0QZaMV/lEhEx1z
 0eGt9zjb0D4OCD3OIDpOVcfim9O4twOET0/AW5gqPEljT09WQeg7gZ7ts0LB9RhTcaX4
 X+QNfYhQyRX8tF4CcYuKteMG9Nhc3ou37WWYh5ZydedHmD3Gqj4ONc+Xjd7+ERg864j5
 VVMw==
X-Gm-Message-State: AOJu0YwpMICNPl/1niAbGv3aXp82Ecph5mQfxP3p7qnqH5unb23qLsNW
 xHRfMT8jrLqArgdvKwEeEc6GD2jWkD9533N1Vt6nBZyDY7gKKzdP7ci041c06RA/DqQ=
X-Gm-Gg: ASbGncss66iSleU2isM7TKY+e9A47YOD5bEV9vYoH0YEJ8gUGbwir+IU4AEmh3nfPVE
 GN7D+uecazD990Pun764wEquqi4Z6wcH/ge6uI5e8exoECc4SPTtXcq6PDhLlS07oCr8tzYrVwg
 GAbQbGWZdyk304LhggZNRI2hIhXjLKfRUI8XjpLlDAzfoHx8QqouW5xveD1sGTfl4hte0LQNmvH
 LPMl59q1duuc6hyzyjTAMVAnMYdYqYWDDa0+39th1gB9H+nmODCVGM6tz2wjsO1yMxvdImTIzJq
 PwaIB7UQ5bUGpvrUMt4q+BVMzGtyyUbplz2rWtrprjrwUFaN/A7fnzq6xTmORcBfMMlfJ7TvRYV
 GaQqsXhkyxjIlYMwo4yYJaeqmykM7BntSmYI8kq1KqnsS+jQZwJidNaCrL3ps9F7XUKevpmI=
X-Google-Smtp-Source: AGHT+IF0GzHSibwBrIdnpkkw5gj7w65Vb5Z9XfZX58mDgZe8ftvWBcDfJ72rdoT+NbZNWyoLPVCgew==
X-Received: by 2002:a05:6a21:3287:b0:243:a705:af7a with SMTP id
 adf61e73a8af0-243d6f379a1mr1564062637.40.1756532580635; 
 Fri, 29 Aug 2025 22:43:00 -0700 (PDT)
Received: from stoup.. (122-150-204-48.dyn.ip.vocus.au. [122.150.204.48])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4d96829a66sm2435905a12.6.2025.08.29.22.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:43:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 31/84] include/hw/core/cpu: Widen MMUIdxMap
Date: Sat, 30 Aug 2025 15:40:35 +1000
Message-ID: <20250830054128.448363-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

Widen MMUIdxMap to 32 bits.  Do not yet expand NB_MMU_MODES,
but widen the map type in preparation.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 2 +-
 accel/tcg/cputlb.c    | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 23eb849a9b..fc9a2291d5 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -201,7 +201,7 @@ struct CPUClass {
  * Fix the number of mmu modes to 16.
  */
 #define NB_MMU_MODES 16
-typedef uint16_t MMUIdxMap;
+typedef uint32_t MMUIdxMap;
 
 /* Use a fully associative victim tlb of 8 entries. */
 #define CPU_VTLB_SIZE 8
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 2a6aa01c57..416aaa1040 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -89,9 +89,6 @@
  */
 QEMU_BUILD_BUG_ON(sizeof(vaddr) > sizeof(run_on_cpu_data));
 
-/* We currently can't handle more than 16 bits in the MMUIDX bitmask.
- */
-QEMU_BUILD_BUG_ON(NB_MMU_MODES > 16);
 #define ALL_MMUIDX_BITS ((1 << NB_MMU_MODES) - 1)
 
 static inline size_t tlb_n_entries(CPUTLBDescFast *fast)
-- 
2.43.0


