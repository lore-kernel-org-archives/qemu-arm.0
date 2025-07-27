Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3370DC87FCE
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:06:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwNI-0002qb-Hw; Sun, 27 Jul 2025 04:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwM1-0006JP-FH
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:35 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLz-0004AO-UI
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:33 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-b26f7d2c1f1so4332744a12.0
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603410; x=1754208210; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TMPqhlIvVePcBqPr/zfm9nD1xzcakWTsu9w+PFYmzes=;
 b=gm4/dkNneI8Kprt38MaFBzB0bzpa0i5B366pQqhav+FMI7T1eT1R0hxyhpXe9xQGdW
 sEx/wYM8YKnMdu/JAEE3B39JhSwkHKY4BuTli9Ujca2W++EQmq41vaTR8yv/4DE/U01U
 Xr4TMEYPGLwmueNoTYS2FjeT2iiAbbsKV+HLtwktNAZ5vP3j6eTeOKVx8axQXbBvYzcM
 4ATUff53WDyTM+Hx1JNP3Y89Wjh++G4HVTaJuYOtzuJsSTpRV6Hz134Smsmfdk+XrOsJ
 G0+ZRLDoMXPKCSSyopeyWlM/nPPQ0c4pDbm4Pk3zcSDHbv9+WNeYzDr8Aox3P58duzil
 a+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603410; x=1754208210;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TMPqhlIvVePcBqPr/zfm9nD1xzcakWTsu9w+PFYmzes=;
 b=OzjROiH2Ow+N2Ft+qiCwE9WpezshqzNv7hpr3mQ5FSYW3QXzuLwp9DQWe1EQM2U526
 DZCC7UQMkSgNbYdxId4TQGssySdU+IDRpRcPj1G3ekaJhmWUrtqQcX1dWUsq+C2yZwxL
 SYxK3Tpe1mb6YA3i8qsLEGg66/xVvFhic3NOEAQ2Vu4uryCgY3sYs7JTRvqBL8LUNW1p
 eZKj+2cepNAek6+JC8IuVJhXivOClqYGEO+b1lUKIEFUw8gCASPCy9TaYP1T101HtCxs
 zK1CdPivt4RSCDStRm1qSSaa8A/qMslTASOnbelOd9lMnWcG1hXEq0866Tg24GHNuGu7
 Dm2A==
X-Gm-Message-State: AOJu0Yx6yedEoRJguylrsh7oCyijCl0BLpcc8KV0TZ/6qukF1mKMRUTF
 wTDeLcPkqARp3JVGIJHZJGnJVu7QlQkXIJeIXbqqJRRjgldn8T1eev7bYAmVSzbzYKRvyYHkKYl
 IOc+o
X-Gm-Gg: ASbGncuPvJeZRt+7rDMIGwK33rC8hQInnck1DSc5B2kFHHP2UKif+nW7Q3M1hW4Dvf6
 ybNWxM49QrRwrX6mMU9lyab4uBu+h6gZB5oqHHbwq0XvfYmikPvXufFfIEd66C/unBN8mim5Yae
 3sm0Ycm7LGc0eXG2NUm9Z1gj+gAdPamuBOrPJUzMOupWm3eTDkaNiE22hJ6ZIUfA1FA4sM/z0uy
 CaFRj02nzp0XhgvcUt39glzdyaPvoxYuQhZ7Qwf3BxN/OhVmtV6FXr0Bys4+b4ZbGOyaB+gfa/v
 n8g30JR6F80MmVAZ9zB/PvSJyJZDFVG48Qf6UB0mfsF/F7Ux/ZFWvyWZVhG2nxhH37dDX4zEaHC
 a0RhkV+QjBVnPLHoMAKBWqpgHv+b8IwQ7+YoWIIhuitgTVYl/i+uUsO+8IvSxrvCSlXlGtbI1lB
 iqR2A3Swos4g==
X-Google-Smtp-Source: AGHT+IEj3kNZcHnsQJUHZjOnzE4zvkn1AY6MPkHP+bxMldIPOTC9x6UwjNYtBvSg/cfDcMNZndzfow==
X-Received: by 2002:a17:902:ce0c:b0:234:a779:47cd with SMTP id
 d9443c01a7336-23fb2fffa92mr116055315ad.15.1753603410479; 
 Sun, 27 Jul 2025 01:03:30 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe333efesm30016415ad.65.2025.07.27.01.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:03:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 28/82] include/hw/core/cpu: Widen MMUIdxMap
Date: Sat, 26 Jul 2025 22:02:00 -1000
Message-ID: <20250727080254.83840-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 2 +-
 accel/tcg/cputlb.c    | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 85b1ab4022..a95559c538 100644
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


