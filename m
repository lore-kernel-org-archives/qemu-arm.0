Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C519FB5180
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 02:31:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9wAs-0007gd-OK; Mon, 06 Apr 2026 22:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9wAp-0007cu-CH
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 22:28:15 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9wAm-00070s-33
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 22:28:15 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2ad9a9be502so29332275ad.0
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 19:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775528890; x=1776133690; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6gG6PBIjNyyRHRNZFFmOCXFmvndww7AFyaXSO9hngxg=;
 b=raM3jJRjhpzGNyvPZ5NBfqzxYFhy45DJ7raEUVO30L5sOBo3yOoLz38JfUXsl/ERrU
 DJs2L5kvtK0MLR/nbgnbtn/cmR+Hh4OzcWNAAP5OIkr4EVFomGIYqy/7ZlsypfI8OxKs
 sTSehp1UU8PrC3OsNWltP55h3coaZ7cJPK1yvNhRaUWAMUXinjd3i9S355Zd2KhGMVjc
 raLH7HwTgde/UQq9xDp+/OZrDup+7SnhO27J4I5ptqFoqa6DCFnXSyZXo/IAp6jwa93H
 NbKRnZIDDyZhSv52x+tXVwaqvIEWaogCURcjF8VRZZgzC2x6G14j7UgDnJTClYqyIlA8
 ULxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775528890; x=1776133690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6gG6PBIjNyyRHRNZFFmOCXFmvndww7AFyaXSO9hngxg=;
 b=S13HFDfrIO4CajfiKM03kvvwiydRaOeY+SG9iNupAA3ObqJJ3KLF7OuryVcs9xfXjr
 gjWut9iuzbvjzzhM+yYrZP3+Zig0QgiTCiv5Z/U1JhTVQyiFSJAE//sBkMSrNKj0iVbO
 WrSeacZOhZSMgxKTxxQtTzfz/W0iCo131m7JOs3q9XcWdzjT7pD5eUKJ18t2ldIemBrG
 5ln8xmMZWmo5pZKjwzaORE4pIEADoB6Ox0qll1wkqBExeXfNn+WQHu2mu+zWHRN5NvCH
 HFdaKwqxECJRsa18b+wOwe2PJRmSqBbQ4Op8nTLdO1+n40tqOu2OZNshgIxRdqqbevK4
 pqiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhGHrp4F/0HeRg0/5XzBIi3RVUNDr1v0c0su4gn1JrbFGkuG3KI0ExJfEe64RJkWA5+L9t9otCfg==@nongnu.org
X-Gm-Message-State: AOJu0YwrChgiSmYDO8QwIPgjPYAJ4mAs8iFlR+jcCO7yQPkpkorEGuhI
 zv0MxslLxPj4ZLctrpazO8lp4mVVCBfhRli+CRTR3M7dJLKS9quIdQG8tSxu+sKsu2c=
X-Gm-Gg: AeBDietabh7/pfePjCcAkHtebX33a0qZJT5i8sMN/6GrV6eEcBT+fafPCQDIFAkala2
 SBPQ6rj8oP2MbeXpzg6IUmPMqvGgaoi1S6YZ9sz+0D6z6+7ms67WimLg0zuPgdQG0rM4AtatBq9
 NPQITpNTSl7uABW5EeHwmNZALCe9a1gCYMA11eJ+hydPyl9tRLuwNn+QrAppbRB/8W0LFc9RjTU
 AmR0RdtJzPaqmiFtprabh98S9x2FS7pTVG76Lc1iTliiO+FDliEySFnuTdVEC9M531KSRp4gSHR
 7W1Sg23DmpYCAQCGXrRni2cJINVRSc+9vVlvbP/C4xhEH2DwQKJtr9ErGEK35uo/os3MSVopC3O
 uljrll9oay8OJNhP9kY4SpihXj4/A7pG0Izw+D7vWqzLiOJ/cvhANlHpMuWc99id3TbPpdzXHUH
 NneUexL/kQ0MjkoDDuH1U3hhU4ph94XrN32m8Vf0Xu0HTNZ4GLqHuaZ1Mnm/3TJg8SdBICMTaAM
 Q5T
X-Received: by 2002:a17:903:1c6:b0:2b2:6237:b0a with SMTP id
 d9443c01a7336-2b28188a924mr150022445ad.43.1775528889863; 
 Mon, 06 Apr 2026 19:28:09 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2749794e8sm161423685ad.53.2026.04.06.19.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 19:28:09 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org
Subject: [PATCH v9 16/20] target/arm/tcg/translate-a64.c: use
 translator_ldl_end instead of arm_ldl_code
Date: Mon,  6 Apr 2026 19:27:44 -0700
Message-ID: <20260407022748.57629-17-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
References: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x630.google.com
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

Allows to reduce scope of target/arm/tcg/arm_ldst.h to aarch32 only.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/translate-a64.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index f446c269dfc..567337fb40f 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -25,7 +25,6 @@
 #include "translate-a64.h"
 #include "tcg/tcg-op.h"
 #include "qemu/log.h"
-#include "arm_ldst.h"
 #include "semihosting/semihost.h"
 #include "cpregs.h"
 
@@ -10800,7 +10799,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     if (pc & 3) {
         /*
          * PC alignment fault.  This has priority over the instruction abort
-         * that we would receive from a translation fault via arm_ldl_code.
+         * that we would receive from a translation fault via translator_ldl_end.
          * This should only be possible after an indirect branch, at the
          * start of the TB.
          */
@@ -10812,7 +10811,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     }
 
     s->pc_curr = pc;
-    insn = arm_ldl_code(env, &s->base, pc, s->sctlr_b);
+    insn = translator_ldl_end(env, &s->base, pc, MO_LE);
     s->insn = insn;
     s->base.pc_next = pc + 4;
 
-- 
2.47.3


