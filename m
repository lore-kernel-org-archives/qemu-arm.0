Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB79FF5138
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 20:03:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wACaX-0004Iy-8S; Tue, 07 Apr 2026 15:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wACaT-0004CO-GL
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:59:49 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wACaQ-0007Ot-Vi
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:59:49 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-35d9f68d011so3584251a91.2
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 12:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775591986; x=1776196786; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lxr7S5ejvt661ybvSTot+9Xez0DhgnskIyrzMc+2BIE=;
 b=avSdpgUKxx36sYPyRuFTfwOquYkgSeNi4r32xwCl+WszeH7jGDRK6PGBtWrYH3EW01
 HxpNE4YejEuaOxnjX5rjWIZuEyQDDBF8V3fvN6KercmxPhBUyCsHD0OAoUjHMOcMG1TP
 7Vk0kt801ohO+E7vps5rYHxdv6x6GuOMsuwCqTObGhdJgO1K344uy+zATjAapV7MzyZG
 FXBV+ngosHTU55nroEyquh1B32mwMKUKYsAxe7eEIlBNgFQUAP//k1xPIY3xD/GOf2k/
 KO6wb9OEsddbSBkkvsBN4wWnq8EClCZjWO54TqPsqxngzC4X752eqdtAXSivg8MLNKmS
 J9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775591986; x=1776196786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lxr7S5ejvt661ybvSTot+9Xez0DhgnskIyrzMc+2BIE=;
 b=jTJTXTLofFLeynpfcW2yem9/06ztcaxWe+Y7v0ds081O30rWGFrTSJrPbhGqulnkb4
 sH/72h+xSvCBmpOAfs+iMjBmkdqEHuCQCBO0bFcyhwNV5Jk5xlqhC/7duV+aCVsbm+OD
 6NtD5gqTuK0kxvYGqpS+/twM69DjbG0Rq9VEWvTLYaJhxu9K5j4X/7v3XFeupFzU20rN
 0SO5ObpYy5xaZP/rIXg9jbqFwcpTZInn3WBPo6QGY9jMwN1o0Jv/+Tvu0BnX1OZAA/wZ
 c5LwLKXdOby66bMrQfP6OkldoLmmw4/t5MoO1tNbs8uCqqqrsNnZmkaVB4XFJ01XA/pO
 irxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkpUtfv9pPQp+tynKev7aFPbLDacsDqxEGf7fMfW98TKzpmhexWlRhrjmZWfpN/BQ0Unb0mxALrg==@nongnu.org
X-Gm-Message-State: AOJu0YzhDuuvIWla06HvZcdGNQ3LAFudtadvfR371oKcBozJJlLBVde1
 aDc6Cm77lzXHcBMPhVnQH1nINvCa2amCEqOSBACBiPz+THlwKm96cxaDfaOK0LHC3eLV+TBTbd7
 ZZPl8GJ0=
X-Gm-Gg: AeBDies1QCh+fHK1dhxYM4Gnij2anpRTneLJOntVJ29VJaGyF+Z7TpJnIvkTSLDx/bv
 b+M9FFSHhcg2M2J/8CLHBunvDLjQRZXv3cfig3UMemTo7UUUVXe5wIVWs8CjIKiIgpEUOF2Ptun
 HQ4KLF1IXub7T63kV5ahvjoNsoG+Cqflie+LhTy4okOzXVMyJTndH0hmB/4aomH3LubLiJSDBR2
 eowmv2QPKRd1lyd3upOPSN2l0WDV87FZWh4K/JhjIsjk8/YJc2+RvxQsrPbxDFhX0tw56voZzcy
 Ok0QdsRU3cyVt5WJWs+jru2b3VwSQRKu8G29XPlfnbwv6zVS4VV1+Z69aXGOBVoIYdfZYEz5GBH
 V9pq8QM94I+mR0qLKbBuRVNwJf+vlxzQeM6dtzR1Y+l2sh+gIkjDIjKyHfLCzkGZNN8kqRPkGnW
 67DwOumuZ/K0iCRw2iQxc/cv0iUA49f3AKGnMtFVpXao341Ehs1rHNIqhGn6vEJi+nEGdjFncLe
 gcm
X-Received: by 2002:a17:90b:3d8b:b0:359:f2e1:5906 with SMTP id
 98e67ed59e1d1-35de678f026mr17426127a91.4.1775591985551; 
 Tue, 07 Apr 2026 12:59:45 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35e27c9855csm126911a91.3.2026.04.07.12.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 12:59:45 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, philmd@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v10 16/21] target/arm/tcg/translate-a64.c: use
 translator_ldl_end instead of arm_ldl_code
Date: Tue,  7 Apr 2026 12:59:17 -0700
Message-ID: <20260407195922.196410-17-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
References: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102c.google.com
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

Allows to reduce scope of target/arm/tcg/arm_ldst.h to aarch32 only.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/translate-a64.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index df2cbd66b38..48b5c572555 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -26,7 +26,6 @@
 #include "translate-a64.h"
 #include "tcg/tcg-op.h"
 #include "qemu/log.h"
-#include "arm_ldst.h"
 #include "semihosting/semihost.h"
 #include "cpregs.h"
 
@@ -10801,7 +10800,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     if (pc & 3) {
         /*
          * PC alignment fault.  This has priority over the instruction abort
-         * that we would receive from a translation fault via arm_ldl_code.
+         * that we would receive from a translation fault via translator_ldl_end.
          * This should only be possible after an indirect branch, at the
          * start of the TB.
          */
@@ -10813,7 +10812,8 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     }
 
     s->pc_curr = pc;
-    insn = arm_ldl_code(env, &s->base, pc, s->sctlr_b);
+    /* Code is always little-endian on Aarch64 */
+    insn = translator_ldl_end(env, &s->base, pc, MO_LE);
     s->insn = insn;
     s->base.pc_next = pc + 4;
 
-- 
2.47.3


