Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D67CCA471
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:16:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jHR-0001nn-4t; Fri, 03 Oct 2025 13:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jHO-0001n0-F8
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:09:14 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jGW-0006Ge-3O
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:09:13 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-279e2554c8fso22900015ad.2
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511295; x=1760116095; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xZ3yHz1Z0fadc6ANEoFNUPabg2WfjYlleRkXRfBO+KY=;
 b=nybM6LvQquSlbZ8EPQSSynNAHUcqkueSxM2IqPWFgzZoiky4ZUIUBrnXvzmH7s/Lq1
 pikpZ1mwsw3uo3xwAqEHKlN6hMrHRn95DOVY6qsQOqcK8FqK4EwYXxOnij2CVb4Qx2hH
 jTCc8wYrj8X0I7IddG4JbBJFVd3NEBn+VjEOlp9+ks56pf2X8ZioVdv+NYym5KDWrmsH
 WVwScGOCJWgExBpHFqzXfuc5oSrOAko3vckaQTc6Q3aNWXCxIxMe+7GFSS/lDkVFFmBr
 8hnQ35HBbsRMzG/sSYAROh9RVD/mztt6DWqNX6z+roOUl9Udu6iQ43d2HHQWuConzULT
 FBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511295; x=1760116095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xZ3yHz1Z0fadc6ANEoFNUPabg2WfjYlleRkXRfBO+KY=;
 b=YkevgnHEjnuTH04vYt8Bai4wF2hZq6oji1c5teI7vsL4DODt3cZyV08fRf4DL2gBRk
 L9wwn4/LNiVMZ1bz6LTBywa1o4XoKXMZLDSyyRaCptgrYNqbtBM2LoLnXfR80mPFEP9I
 8j7423MQpx5oGzY6KE/p/zBdewOcCCR+SAx1D2ZL1NDY4UmaUptGQVqfZn3t7UTm5NNi
 73Qyy+MDdY0GWgDgJVm9uc62yVh8kYz4GUZK7aHGU/8F1wk/vxcvM1+EhO2BOQxDPqxi
 RD/dzV2rCAExFG47CJ6RZIAcs8ZhjPRH/ik0XVYRzqI4VdoEWiEdBAryBVewKd6Ntkww
 2wbQ==
X-Gm-Message-State: AOJu0YzL9LAQu7qfo4ZNL3JnN5SKc9lcWZC1CUX6EmOqGi1dNyaq+D4q
 E1LmzZ3oh/EOpywsZQN177e27GL10+JZzT6yW+StM86d8UBE6OmRKh6oAhljF/qf/O4qZC3Q/GU
 Safi/MqU=
X-Gm-Gg: ASbGncuTNsAe1UA+kJP8UTmjhZA/C6REcOXMCSOcxiMobXx6WLj+6pJ6ziIMiOLyUUc
 XMYP5X9qnyR5jl/Gs9DEsc7iiVprAG71RN875moIaIsHLnElEZ88pDk9/xaYMZ1fT85PTdLCdLS
 xwJzwg9bJFiNB7kV9tAvevj+AstLVm82HG5+WuEz1mz7Crs2HzZ5MhI22kUHc9NyGVwIZ/UTqzp
 PYQW5uuDQaHniOvCIRtsKIHWWN186+O2uHxCYVWffi1z1xivgWST0a3swIgbab5OU8U/APZYsXH
 YK/wnqHUpaHudNQgF2dqEgVOYkv7nCUnJ7074SJOkxSPokx+dRFV5L2uOSsubmn0UbeTs1e+GMK
 ZjRAjKJRFsoW3Lk5SswncS8XOTz0u3Lt/6nUs8bH+kbjggvfHMyF0WVpJ
X-Google-Smtp-Source: AGHT+IHMoWnaZePQFu1vWuHQgcCB4wNkJgdw46amBuoj4hRJ4rv60iXjmCnVSvQSONat680GqrqqCA==
X-Received: by 2002:a17:903:24e:b0:25b:f1f3:815f with SMTP id
 d9443c01a7336-28e9a664fe1mr43711425ad.58.1759511295093; 
 Fri, 03 Oct 2025 10:08:15 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d110d86sm55327115ad.6.2025.10.03.10.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:08:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 15/73] include/hw/core/cpu: Widen MMUIdxMap
Date: Fri,  3 Oct 2025 10:07:02 -0700
Message-ID: <20251003170800.997167-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Widen MMUIdxMap to 32 bits.  Do not yet expand NB_MMU_MODES,
but widen the map type in preparation.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 2 +-
 accel/tcg/cputlb.c    | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c9f40c2539..71c31cc6bb 100644
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


