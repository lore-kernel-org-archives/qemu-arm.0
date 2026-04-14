Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BF6F531DE
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Apr 2026 00:55:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCS31-0000sv-9k; Mon, 13 Apr 2026 20:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCS2z-0000ll-43
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 20:54:33 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCS2x-0000Mf-1Z
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 20:54:32 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso53537655e9.1
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2026 17:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776128070; x=1776732870; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F79bcmNqJ6yqiKlKQkLmTaYUIpS0CTWwYfLuBfn6U+s=;
 b=DEykiC/AANMUaUHUEm6+ZprLZsLlojcv0y58sRULq0KTglJTKRh84uVz1UHgsCDtCh
 fxDyZ+Kv2XWjb5Nrn5m6fsmbVAzZinxRauXPgxEYC0OxYn9BcTf3Ez0o9J5xmE/jBHeW
 Ru0zm4Gtdn1jas+Yg7JKIYx8fHOJ2N4IJioKVCaPZE/Dc63zToN8l6qYIwBYjFMMjrm7
 GxdtBuQLWWvU1hYG7adJ2zTkbsnnrjBIIKN/QRpH+etcIRC4geudapQfCEZxr4mIXMMy
 lMIzLGUfzfmsbOQay6Hb+IfaTru1n0FZkOLnRcMI644X7rpSHxV3xSGTAeLfI3DMonAS
 tUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776128070; x=1776732870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=F79bcmNqJ6yqiKlKQkLmTaYUIpS0CTWwYfLuBfn6U+s=;
 b=OC8cRwL8NCMjf6cOkr6ur1l/b5NdiMiIz2FPCaBbgIN/REYF4R9R+zGuaxBipyDxZ7
 2Bl1Wnf6yNncvT9xtoOkanLXxcrM769hO5ZQPt66Wiha3oz1D41vpc8amp2Hweufs8J4
 akIcUPHB31RN1V7hM6J75ErJd/O11INGSwnNYQHn/A0WMHGVDyhzdxhJFdbcAHX5YvSr
 93n00HZwOH1Zr0WlsIWhKKpfmQ8hZcFoeXp7NiB/0Uq1EUQZ21vttWeYXL2y4bnJYY5u
 SlSTvldFEbtx2soXAvx4qsbRXdZQMCAbPTcWeiIbFgyX2fGuDsIJGxDp5Am6oYYuwrrH
 n20g==
X-Forwarded-Encrypted: i=1;
 AFNElJ80nVnJtMcPbFs2ZABBzpx6oJZQZdXY95L5ME/OLuHkO8CqeSwlQeUkh3on99wwkrSOqSTr7axbXA==@nongnu.org
X-Gm-Message-State: AOJu0Yy4j56pRoR/Co/gsGNL5FdyYUBBgvLwie0ZqZYdOXBxdG+Q7cuP
 yHJa4DPDVUyX1SrJramg4e64rsDhKN6ocoeY4uzAJYfk4Jlx+h3k0wje1BBsM5Ba/Pwg3nVKoEo
 d2fUfeoM=
X-Gm-Gg: AeBDiesvia4+Z/tDxEJvshNoqvyUxBCNtpA4OgRmU7FZ51B81vgemFvKGlYGUxDUOct
 MYxAA3yYBipz0M/wi1m656mMYzbBnB/gZbGbgPsBVQ+PqvB4h7mF0pDVt0NJanUoqDHGUpu8z3h
 YKE+/NWKe6M4HkI6I2h8R3yaSjBF0GIt6bGa5u69IC1zJqLfWNqfSKEXOZXIdZC7Y5Y02zUFkYC
 Fu2qOXZnlK2NtNuB3cuI3PrZA9+w9fouV7UB59cWV8LJJugwu4alndkAvAmuA9vdxwKFK7Jo6Sv
 1Sz9hba16xvsARuRnJUCeWzIa6JC+GOCl9Yiimr+mpYwyLidLnC9CHCzoZXfYyOe957jjETFh12
 LI0lTmM2YWBMbmrU4T/zBTrCnerfJPoThgZKtuw55j0ifjNRIh0agfAN49baJuZVwiS+F0D/Cov
 FqvFQAZCQk8l2PqoaCRb2U+JI+etvy9eBiEG1SMLpATnZg+Fwh+1hEExbGskg6Ab/g1yITUnNY
X-Received: by 2002:a05:600c:a413:b0:488:a639:b787 with SMTP id
 5b1f17b1804b1-488d67f39admr153474105e9.11.1776128069624; 
 Mon, 13 Apr 2026 17:54:29 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d681edd2sm112070635e9.18.2026.04.13.17.54.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Apr 2026 17:54:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 5/9] target/arm: Introduce mo_endian() helper
Date: Tue, 14 Apr 2026 02:53:44 +0200
Message-ID: <20260414005348.4767-6-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414005348.4767-1-philmd@linaro.org>
References: <20260414005348.4767-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/internals.h      | 6 ++++++
 target/arm/tcg/mve_helper.c | 3 ++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index e92a967f575..e65014af1a7 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -28,6 +28,7 @@
 #include "exec/hwaddr.h"
 #include "exec/vaddr.h"
 #include "exec/breakpoint.h"
+#include "exec/memop.h"
 #include "accel/tcg/tb-cpu-state.h"
 #include "hw/core/registerfields.h"
 #include "tcg/tcg-gvec-desc.h"
@@ -46,6 +47,11 @@
 #define BANK_HYP    6
 #define BANK_MON    7
 
+static inline MemOp mo_endian(CPUARMState *env)
+{
+    return EX_TBFLAG_ANY(env->hflags, BE_DATA) ? MO_BE : MO_LE;
+}
+
 static inline int arm_env_mmu_index(CPUARMState *env)
 {
     return EX_TBFLAG_ANY(env->hflags, MMUIDX);
diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
index 4bea0991de9..a5a23c97056 100644
--- a/target/arm/tcg/mve_helper.c
+++ b/target/arm/tcg/mve_helper.c
@@ -299,7 +299,8 @@ DO_VSTR(vstrh_w, MO_UW, 2, stw, 4, int32_t)
         unsigned e;                                                     \
         uint32_t addr;                                                  \
         int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
-        MemOpIdx oi = make_memop_idx(MO_TE | MO_UL | MO_ALIGN, mmu_idx);\
+        MemOpIdx oi = make_memop_idx(mo_endian(env) | MO_UL | MO_ALIGN, \
+                                     mmu_idx);                          \
         for (e = 0; e < 16 / 4; e++, mask >>= 4, eci_mask >>= 4) {      \
             if (!(eci_mask & 1)) {                                      \
                 continue;                                               \
-- 
2.53.0


