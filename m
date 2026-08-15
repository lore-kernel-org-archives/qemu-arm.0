Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33EAC5CFC1
	for <qemu-arm@archiver.kernel.org>; Sat, 15 Aug 2026 20:40:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvL8m-0008Ku-QX; Sat, 15 Aug 2026 16:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8j-0008H1-A2
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 16:38:01 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8c-0008Kw-Ih
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 16:38:01 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-38ec1402b05so1702158a91.2
 for <qemu-arm@nongnu.org>; Sat, 15 Aug 2026 13:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786826270; x=1787431070; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OtKLwewARJo/bPnddqGwtlSMmGFQ3XmZ9aODd7omBE4=;
 b=Yo7onhxHAF+IP18EOmlf7SNP0xrHd3dIyhkp/Jw5JYZlzsPs+NJzuzbE8JhXCJP4x9
 7USwkyOW7z42inOCIMNuDcAnJwd9yH4q0ioI0CIXJ5tNvfu4S8E8vitgj3LjL1fU47ub
 qHXmfJVYjpsEm7bnMrjgVXV7rr2jgNaIej4NzveZ8g4hCvrg2C7HToHNOxu12gXC4gvm
 IgB296VDvZSIVK7Bz2dnTOxbft4HmoeBv0CVCh1aTu6npzOnQHvnhSmvx/NWxHKG8nxO
 QCk7oMdrVfw78Mph5T7xqdjETHW2jHbnR02hBCaNN5/KgyMBo7TW9X23bp7S/F1kdYF2
 CwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786826270; x=1787431070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OtKLwewARJo/bPnddqGwtlSMmGFQ3XmZ9aODd7omBE4=;
 b=kojl6yuzjQcz/mNeRxRg7nE3utMm6vuuGSPMZCoXH6UyePPU3My4jf54oBiMNgx0SY
 HDenXuKuqUYcyVvlSMsCVCiZsLEQFpE2OceHvahKgpdIIx3tC0mkYMIm1x4SiKIWbotx
 JkJ4ScQ1SYwpjEMh8f6kOD9p6tO6TdfWBm4TIJKpHAW0UI89pMJrEu+4fm0Up5AtjE61
 BeTz/Iz12ttmMuZPdYJeJrH5QmPr5sNtmT7CZ+nEf+F00FG+oRVpbrNC1A40IKuW9ert
 AaN0Z4QohpyDIgLs0xgIjnz+MibEHf/g5RTHBV4NNTfHnTtW+ielKh5edsIYbt5k7HXn
 2xpg==
X-Gm-Message-State: AOJu0YzuOtqgB5XBAMHSGmP7rZsnZcZUJvVmpwF0p32lxKyf06OgeBZf
 iyhcEeA7icYUYTr+rYbRD/34dcges3hG++t8H1gSmbowI0wwfNCyhG7w1sncFQ0EfC4=
X-Gm-Gg: AR+sD11jx79Y/290liBlK7a9ROTeD2v9XuSthZqwcLRl7Z3K1Ge96zPdYA84e8uRLWZ
 v4pv2J3C8dp1VJZVzeGEKZjrBSpyW31TKyCvw+Zb+OzITuu4mnK8BU69GR2T9LToi8dVUdHAdQO
 OMZs1ULzNuzqpaRoZ/AUcMejSgc7rvk5QmVDOxNrS/hDXJ0ExdqSBig2+A5subDy68NcYSN7iUI
 C0tiP8v+GGyUxNtI54K4ye1xXhd3CmxSDvg73pa72od9XEdcrdmqgrbAnrgSdbB6wY7FsIsnY4w
 QJNf94xb8d7vF9OACz3YHyPUCbuvxlXBDgmZQruuKyys3WUlb7BtyhF3NQOYQ8lL7kILzI4v+Ba
 E4pi8YIhKej+WjeT32r5RDNJ4ntMISQTiRiC9zrSYlJoYaNuifSk1U1PhCRsACHB3jO76T5EGDj
 Ofrq6ORtvkaYUpKSes5MdVxks9BlSHanyNWRHVt/x59Kk4KyV/4Tjidgxs7W3ZitEEV+MYPaXYS
 4uikbU/+k9fiDgeqCWN
X-Received: by 2002:a17:90b:5745:b0:381:28e0:6259 with SMTP id
 98e67ed59e1d1-3933b7d1dfdmr17476813a91.9.1786826270249; 
 Sat, 15 Aug 2026 13:37:50 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-394ea97207fsm7066853a91.1.2026.08.15.13.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 13:37:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH 14/18] target/riscv: Return bool from pmp_is_in_range
Date: Sat, 15 Aug 2026 13:37:26 -0700
Message-ID: <20260815203730.1468365-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815203730.1468365-1-richard.henderson@linaro.org>
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/tcg/pmp.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/target/riscv/tcg/pmp.c b/target/riscv/tcg/pmp.c
index 5bccc60527..5ea0e5b6c3 100644
--- a/target/riscv/tcg/pmp.c
+++ b/target/riscv/tcg/pmp.c
@@ -299,18 +299,10 @@ void pmp_update_rule_nums(CPURISCVState *env)
     }
 }
 
-static int pmp_is_in_range(CPURISCVState *env, int pmp_index, hwaddr addr)
+static bool pmp_is_in_range(CPURISCVState *env, int pmp_index, hwaddr addr)
 {
-    int result = 0;
-
-    if ((addr >= env->pmp_state.addr[pmp_index].sa) &&
-        (addr <= env->pmp_state.addr[pmp_index].ea)) {
-        result = 1;
-    } else {
-        result = 0;
-    }
-
-    return result;
+    return (addr >= env->pmp_state.addr[pmp_index].sa &&
+            addr <= env->pmp_state.addr[pmp_index].ea);
 }
 
 /*
@@ -385,10 +377,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
                         pmp_priv_t *allowed_privs,
                         privilege_mode_t mode)
 {
-    int i = 0;
     int pmp_size = 0;
-    hwaddr s = 0;
-    hwaddr e = 0;
     uint8_t pmp_regions = riscv_cpu_cfg(env)->pmp_regions;
 
     /* Short cut if no rules */
@@ -414,7 +403,9 @@ bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
      * 1.10 draft priv spec states there is an implicit order
      * from low to high
      */
-    for (i = 0; i < pmp_regions; i++) {
+    for (int i = 0; i < pmp_regions; i++) {
+        bool s, e;
+
         if (pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg) == PMP_AMATCH_OFF) {
             continue;
         }
-- 
2.43.0


