Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09E1C5DF67
	for <qemu-arm@archiver.kernel.org>; Sat, 15 Aug 2026 20:39:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvL8q-0008Py-Ej; Sat, 15 Aug 2026 16:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8o-0008N9-Ce
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 16:38:06 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8f-0008Ss-24
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 16:38:06 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-38dd55ad76cso2133040a91.1
 for <qemu-arm@nongnu.org>; Sat, 15 Aug 2026 13:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786826276; x=1787431076; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sNSRw7T5qMfkeTeB0OeailLl5LcE+oeHtK4hx8s+Ock=;
 b=htzb+QWS8V2oJANVr3KCprmNAOB8TJow+kaI+IMqKUGYZXZrWLtK1f4jTrxgZQf2UA
 oKTwCCLi/KXET1en3Hc+uaq4DeppFsf1ci/Wd6SCL02g+iRRzKNQiisEPV03+Q7RkDqE
 U1cbWgO0H1V+bNhqSWPekLH/mZMxrknNDeHicxEpajyPEbrVMfu7D4dGzCDs/fATD7Oi
 PYC+480trzHTg6MvcgwviIeawBvLZj4wdd0iTlPig0+3NP/is8Ts8aMrk43M2Wq4/Fxh
 qhaqnp0cHHmgslL6zlcwZxZ8hYnqnL7L94HrJR97g5hWAlPNevCLMQ7VkU+SEpFKfNwc
 EiBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786826276; x=1787431076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=sNSRw7T5qMfkeTeB0OeailLl5LcE+oeHtK4hx8s+Ock=;
 b=TRlcOMILwAl1blvqfhHabjBZErhiHZofUVXf61g3K/Ft5W5FpkazwGcEkvFLlUys8B
 cTW9/TEVkrLjYm8C82xrq2RAwhLuprXKbuVcb+RUsiaa7a1buTZPPT+1ZiCTE1vnSc55
 6/mz/lLZFuQzXi6l88T98ImQi22j3rPGUK2HLMInDBshQNwMpNrbYbuaezed9y0372B7
 li6VVC7Ava3gRvif7RlmfCRhG6QuITYiVzoX+EQX9nxWSlctNUYHlFd7/pVGBmeNv9Vs
 U9pnZYaC3xxj4GtOaYfuStwNo//B+gu7bwLzPXBAdtn11oEk2tN8gA4RJpaSQb6hBR6L
 SlsQ==
X-Gm-Message-State: AOJu0Ywd+JrXVKnmdXDCV6vKFD+6qUYR23I8arv2Uct1c4iXQ8TKm2zV
 DHs6jTgbIvySwgRkEq3EW4oWCHePu4YgJUK6wTG9kgcHCJWcoSjFMbYhttZjOzI4oWDiXN4jLFv
 unAWc
X-Gm-Gg: AR+sD122/SxhaduZKles3wO0Ygrv9MmLjJ8XZD1/NjVo/EcEk8JEptSX2zO/uGCLOFq
 +S8SaRHhACXZKhzPWU+wIFW9Dc2PHhpjqDuuUy3nr9NWobQrUgvB2QB3EzPycTkwHftFK8lrOxa
 X2y0oqj2KZhGJecztI42hlvm0CLAjji48jJLEsetnWQWDy1ptFM76Chq3NcykaM3vuaf8VV737R
 LLGakZwIPF0zV+wdCv220pocKg4U5FOQ+jhQSMdzElkd+9PelERx/SPokGdQAv5aYt6jDm7Iuxq
 QGZ/9xDpAt5Gr029WqLn+wfoczC5GDNBEMPxRRfCYx2Tpig5fgUkE2qJzwMpehbOfoNS78gCn8v
 u9De/+jXBXpCPPyiPaySY4KMNIsZoU7NWEZGBFBa//92yM795WDCYHH2kDW6WYtLcgbFNj8j2ya
 6efYBi1eQapF7P2HoiXJld90EUvG+r9mJ1oUPeflWvvU2nAuqoUSWK1DoBDAqsmg7S4lt/cwtVa
 gTwDOwczqP4+XH3cfb8
X-Received: by 2002:a17:90b:37c3:b0:390:84db:888e with SMTP id
 98e67ed59e1d1-3933afb4ba2mr11985428a91.7.1786826275580; 
 Sat, 15 Aug 2026 13:37:55 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-394ea97207fsm7066853a91.1.2026.08.15.13.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 13:37:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH 18/18] target/riscv: Pass first/last to pmp_hart_has_privs
Date: Sat, 15 Aug 2026 13:37:30 -0700
Message-ID: <20260815203730.1468365-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815203730.1468365-1-richard.henderson@linaro.org>
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

This eliminates an ambiguity with size == 0 and also
aligns with the underlying hw representation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/tcg/pmp.h        |  5 ++---
 target/riscv/tcg/cpu_helper.c |  2 +-
 target/riscv/tcg/pmp.c        | 24 ++++--------------------
 3 files changed, 7 insertions(+), 24 deletions(-)

diff --git a/target/riscv/tcg/pmp.h b/target/riscv/tcg/pmp.h
index 4c95c2767a..eacb5b5349 100644
--- a/target/riscv/tcg/pmp.h
+++ b/target/riscv/tcg/pmp.h
@@ -70,9 +70,8 @@ typedef struct {
 
 typedef struct CPUArchState CPURISCVState;
 
-bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
-                        int size, pmp_priv_t privs,
-                        pmp_priv_t *allowed_privs,
+bool pmp_hart_has_privs(CPURISCVState *env, hwaddr first, hwaddr last,
+                        pmp_priv_t privs, pmp_priv_t *allowed_privs,
                         privilege_mode_t mode);
 uint64_t pmp_get_tlb_size(CPURISCVState *env, hwaddr addr);
 void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index fb1250a4b8..7ef5ab5277 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -916,7 +916,7 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
         return TRANSLATE_SUCCESS;
     }
 
-    pmp_has_privs = pmp_hart_has_privs(env, first, last - first + 1,
+    pmp_has_privs = pmp_hart_has_privs(env, first, last,
                                        1 << access_type, &pmp_priv, mode);
     if (!pmp_has_privs) {
         *prot = 0;
diff --git a/target/riscv/tcg/pmp.c b/target/riscv/tcg/pmp.c
index fc035c95cf..d3cbb2cb2e 100644
--- a/target/riscv/tcg/pmp.c
+++ b/target/riscv/tcg/pmp.c
@@ -372,12 +372,10 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, pmp_priv_t privs,
  * pmpcfg but is not acted upon during access checks. Cache attributes
  * have no functional impact in QEMU emulation.
  */
-bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
-                        int size, pmp_priv_t privs,
-                        pmp_priv_t *allowed_privs,
+bool pmp_hart_has_privs(CPURISCVState *env, hwaddr first, hwaddr last,
+                        pmp_priv_t privs, pmp_priv_t *allowed_privs,
                         privilege_mode_t mode)
 {
-    int pmp_size = 0;
     uint8_t pmp_regions = riscv_cpu_cfg(env)->pmp_regions;
 
     /* Short cut if no rules */
@@ -385,20 +383,6 @@ bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
         return pmp_hart_has_privs_default(env, privs, allowed_privs, mode);
     }
 
-    if (size == 0) {
-        if (riscv_cpu_cfg(env)->mmu) {
-            /*
-             * If size is unknown (0), assume that all bytes
-             * from addr to the end of the page will be accessed.
-             */
-            pmp_size = -(addr | TARGET_PAGE_MASK);
-        } else {
-            pmp_size = 2 << riscv_cpu_mxl(env);
-        }
-    } else {
-        pmp_size = size;
-    }
-
     /*
      * 1.10 draft priv spec states there is an implicit order
      * from low to high
@@ -410,8 +394,8 @@ bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
             continue;
         }
 
-        s = pmp_is_in_range(env, i, addr);
-        e = pmp_is_in_range(env, i, addr + pmp_size - 1);
+        s = pmp_is_in_range(env, i, first);
+        e = pmp_is_in_range(env, i, last);
 
         /* fully inside */
         if (s && e) {
-- 
2.43.0


