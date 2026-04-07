Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBCB10F9972
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 19:12:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAYFy-0003RU-II; Wed, 08 Apr 2026 15:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAYDV-0002Mj-1u
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 15:05:33 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAEoc-0000rs-QS
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 18:22:36 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2aae146b604so35010315ad.3
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 15:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775600553; x=1776205353; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lxr7S5ejvt661ybvSTot+9Xez0DhgnskIyrzMc+2BIE=;
 b=glAr1zBkzObO1hlm5Qwy2ZJDshZCb/luxIU3J12yDSgkBKHS+9cHdrCws8E7CEKwxF
 DRRSGb6+MTEYhRepOUYJWOisjH6J5tGGnoa+2hjgzGMB3kdKlnM5rNaWC5OOxscCwhfc
 gCuOyS2OtiltTVzDsGbl7QNmnj3tlzje9iaVZi+kW2IeIhJXResHHzkMomAM8XQPUzFK
 a8lkC3B1i8GdyM/B32kMKAG4g042nVTokT624Lx/1Y8yj3w0fBx3C/WGv7m/Hox7J/Co
 vI8s2+k7f1Y3PEjRdwqE03ALKgKhMB7l813ApEgAm7u4jylqiNCus7gbvaKNDBTXJhaB
 uBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775600553; x=1776205353;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lxr7S5ejvt661ybvSTot+9Xez0DhgnskIyrzMc+2BIE=;
 b=gnIaTnnVqRc2SEQrIDK7rK9QhFE7qDKSNG6j+8nZJF0AZ7cZCPa32qckg+EhsOGhQH
 UzGMihdUYPviLxGQVHPElSzmnNUoiR5edix8xB9oDQrx4Xk4/JJM+QjytpSYGaIt+Khh
 3KW0NErhLEwJJxrnKpD9tWhjW9a5He2HKe2aAULgx9hxa7IqMh+d/p7JfXftcsKUNV8E
 uQKVxFVWIuLPUDK7pvOsJYjERD2GdhS3VIh8dQuLbUuZTdTgmFG8EvAuDWoS6o5r1r3H
 JQWo/S/V0HXLux9gAWKgbnJ+eKFq6f9Eb0b9Kf12KxhQHQLATt1JGNsGXzwDqCknu1up
 yZEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3kqOW2BrgsGXCKfCMCDFztZQ1anFTc+5nuYBtB/rDJy7PzzDmLhM9dOgVUefR3ow36tKnxe3U7Q==@nongnu.org
X-Gm-Message-State: AOJu0Yz+ON744jS7LHwIg8Rs6xn1d2Wf58R12EkFYo/5AOZ55ghNr9HH
 qouapD13SJv0NBwwY/wmSyNLOMhjYEmuRXHN0ION+XZEwoO0e4ulFEqZX8b0/STbaCc=
X-Gm-Gg: AeBDiev5DAiNfvu57uoboXNNDWAtLus6f6LFVqovHCIF6RzWI9mx1iPkLq1IlsRFVQ3
 3MT+RR6EVADGXg/DYC2dHMGkK04bFKnILsMnVaAWHyYouPMyF3lwNYdgzeJAmdCw1BPbFmnPgpW
 w22nyoPKkKzg6qdZCByih4rwwmUpygd6KjIDWDwb2qKQ8wkeP3nNoWObqu81CvEjggFwfDU6+Mi
 roVjnC+Y7AzONo1V4o1EOTZ85FMrC+rdbXD0jKaTvds3zkSJSpA9qQToSQQcFRZNFTc/18/fPDs
 w6LL0MqA2xG+Df5jOxkHgphDQdD9A7is0KYTTDA52bx7cmhgyq3p1KC3+7Ekph3gaYG8DDNWNm0
 y3JL0mDzRGDBGbdmzs7VVup2hY5C0bpkb1Gol11UvC66R2TgQC3+Z05zFOKeAqG80uwkNvin0dg
 w0gdZDz4WWSw/GOFRvt6RXnWJJYM/uLUA7bqHw91w387TVlcQa05YXRRrXvf5OblgkpoACkQKaE
 62d
X-Received: by 2002:a17:902:e845:b0:2b2:6df1:1108 with SMTP id
 d9443c01a7336-2b281867961mr197990875ad.15.1775600552961; 
 Tue, 07 Apr 2026 15:22:32 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d5csm180412065ad.38.2026.04.07.15.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 15:22:32 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v11 16/21] target/arm/tcg/translate-a64.c: use
 translator_ldl_end instead of arm_ldl_code
Date: Tue,  7 Apr 2026 15:22:03 -0700
Message-ID: <20260407222208.271838-17-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
References: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62a.google.com
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


