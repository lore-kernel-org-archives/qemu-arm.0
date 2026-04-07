Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA49610F9972
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 19:41:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAYc1-0004Ry-4H; Wed, 08 Apr 2026 15:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAY9y-0000cG-Oe
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 15:01:54 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAEoh-0000tE-7h
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 18:22:40 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2ab46931cf1so2541565ad.0
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 15:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775600557; x=1776205357; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Geed+LNcY7TFub3zSBXzpgR/5EdouLTW+yMNH7ktlc=;
 b=PiiAoDPQpSu2CAJX/3cnSuUXhQ5aMep73nTEcwnOTfouSSRyWZrvd+K1eLA/P8Mz8y
 xx5AKlo4IvCFMnRzjuE4ZX6nIdSa+DniLB6QCmTjOBnKN8s58GCZWODrvMu0jV+NrlzN
 4Ur8/foCaMxZdeTG/CYJXKZ+D2zD7acgh4jD2A/Ct/FhK/F+CWC5GCqGEYSQ22DrslOX
 5GmvCPI0bvQsWhkad+7Xm4su211FiYUjNjf+ARm8jIt0CQVl5KNJr0Rmy+O8vL2KgztB
 ShZcsUGO/MrO58rYgYVphWDRiXEcRgrb3aw6fW0cnfCW8VUgE5/FXH1SLMH2Nx7kRuwJ
 UYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775600557; x=1776205357;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9Geed+LNcY7TFub3zSBXzpgR/5EdouLTW+yMNH7ktlc=;
 b=rt/rczuyj+a877vWtGmzrFHX86NzDmKqrVK5WPLdXfnUQirZWlAvYw6NQO7kFezV54
 JJf9bgO42iC9bx6tx7NMs53Rx0j1q2W7G5qbGgwPZrAHAaKPZgcPXpedm0waMsy6bo8o
 ko84lY1+IsgpSGfW2zNf2g75u4DBQScllXda+7e5r+Eqkn0VJRFmInpQXEn9w6TZjWIZ
 nB9X+q0dCm/t+yDFmpxLlryDN9YLsaRJXNEGmtY0HFxSvxbw8c0XRq8bvog1w5OC8kxP
 0jtuDgI2S8yZurtgzNy+LQz2jRcB3iRG4b/ogYnzOINyM6uuV228VMShJMO0gpsVzeRs
 CjxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjdAlyxI+wwcxsS3xN6ZFcyzDogiTJ8370sgTEO61GJts1DvJZ3Jt/cgBzIN68aEozHHgQki7XbA==@nongnu.org
X-Gm-Message-State: AOJu0YxFS73p5tt3BQm7jDJS6+YqeB/bz7smmMH/F+vNdnF7bo0QRTq3
 5yfDeEyKNQMOKL3MCweAKAQqJNyNcDycRbSJWWBrF+CvAA1OIa0wDkHdto/btJuneUg=
X-Gm-Gg: AeBDietg7ZuyN9GUTlVy6Aew9RFeJheHoSZxXT9ZRbqzG6w5bq6MfGMOuK78s0NQuUl
 z8UYRPa8pnCFi4PlIMr30DGrLjdjB/j9ElnjxO4goXqSAyjurvMugH9DAuUTP9V+/bDT7x29ttM
 zdegkkxx4qgJ/dLS3MHEcCcEa5N/gqIq+j2yQefNaL5p9wp/O1P2FTDx1t5BLzBeoG7BJua3hHl
 +kgZ30Z8AgBQQ7GliCYqr3DhgQ3F9ZQOzgew0SG0L5N1Fyqvz3c+PaHz0xYIfVfzvPfv1BSRTGU
 Y+1U+Vvc28X20zQWiHGKWo18mQlBcw+yE+6cQTg+ZMtol62/6JhlJEaBEWrBmBU3F8E/E/tgTOe
 9WrUq+2b5HfSRVPQdBecXbjbqS/1oKZgv6Fm7V6zlPeuUud+ggXNTJpslKtWqiC666P8YAwmnJK
 7c9t0nS6dven2PMnh/TYCMa7MB2O0vnaYkgoP3BFA1brVn0bB7gS0g5LF99ezNuf6WiN0ZRTBaM
 6MV
X-Received: by 2002:a17:903:32c3:b0:2ae:5350:3a4e with SMTP id
 d9443c01a7336-2b2821ca1e7mr161452155ad.21.1775600556639; 
 Tue, 07 Apr 2026 15:22:36 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d5csm180412065ad.38.2026.04.07.15.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 15:22:35 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v11 19/21] target/arm/cpu.c: simplify endianness handling in
 arm_disas_set_info
Date: Tue,  7 Apr 2026 15:22:06 -0700
Message-ID: <20260407222208.271838-20-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
References: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62a.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ccc47c8a9ad..b62de8addff 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -828,15 +828,11 @@ static void arm_disas_set_info(const CPUState *cpu, disassemble_info *info)
     }
 
     info->endian = BFD_ENDIAN_LITTLE;
-    if (bswap_code(sctlr_b)) {
-        info->endian = target_big_endian() ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
-    }
     info->flags &= ~INSN_ARM_BE32;
-#ifndef CONFIG_USER_ONLY
     if (sctlr_b) {
+        info->endian |= BFD_ENDIAN_BIG;
         info->flags |= INSN_ARM_BE32;
     }
-#endif
 }
 
 static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-- 
2.47.3


