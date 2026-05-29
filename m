Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C23CD6E45
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 08:31:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSsbZ-0001YA-Os; Fri, 29 May 2026 04:30:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wSsbM-0001PO-7k
 for qemu-arm@nongnu.org; Fri, 29 May 2026 04:29:57 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wSsbJ-0005R0-OT
 for qemu-arm@nongnu.org; Fri, 29 May 2026 04:29:55 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-45ef189aa1cso334120f8f.0
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 01:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780043392; x=1780648192; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+hbeufYVzoMG/wzzAjSBDrNtpV9A32DdB20M94ZA85Y=;
 b=Ml7FFs7eoro+n6MWGRJhk8UjfOAa/iDIOr7A0ZJ9aifFJNBSUBKfnpKKuC9tC1LdPH
 mRU9QWl1VJU+846pmx9R3NbOz+ttApC8AKFSkSxpCuV27bsc0b/HlVGnkv+g/jmPHcJr
 QdGzmzXODpIDd5Prw3B1h/KkGTh6Yvtuocqhc8zqmuaXiq8ZvddO/NjBh8vKloNEe4EP
 alH6FAsGeFLJ5d5olvc54l4NLyqmr2ORkQoUVLzqJk8X0DAvkDcRQQ02iDey4MLkV0ll
 BKKPIPA1G9gU4GC6E1StVWBOqxggHdJtRrB96gJ5IqY98tPTcP6KIRRvBONtSonWkDZz
 QG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043392; x=1780648192;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+hbeufYVzoMG/wzzAjSBDrNtpV9A32DdB20M94ZA85Y=;
 b=ZqFFN6usd5qV3xZa8s24g9a9lcGAtuboRFwrYLwulbsSiWOjNyKtvUIVTUwD1qTkm+
 bvj/mZM2uRhb7C/9xsTjv8cQIdjX6VNDjW8xj9lbs8QjGhVM1OYliT/rQOoaSsMNZDVw
 OXgbCAAu2e4kPS1R7Dwv3lfhBb0Q8DYTN/YBkARuqDZv6rrZpnpvPeesVygyMXBFjQYi
 CyMFlEHZqsgjQOCsp9zE/+0Sbm1vaKShLO2CxDr0r4WwvGBewX0go+a/W7xsbU2O5rA6
 qzY8/BZAAsxTPCA3CxDp9hnuK3JsFXahAkbAgeN3Qx3yWu+l0Z7yf9ismyAJyJ4iZQN0
 irIg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9u12BT2hlDj2NV5keYQfqaBmZUZ6jkkAkUKtsEvhK/IUZfxZ+NWmkHtFIfjA2FxLPLwr9dX098Tw==@nongnu.org
X-Gm-Message-State: AOJu0YzArInRncwCwWPJQeTpuDkw9Wq1gyXlGBjfgjoMhhKvTtJbBoIP
 covEqOZ2XfpR1qgl+jCVq7txn9Za444TJRqMWzpjSeWj4aYyqyLRUArQlKkvfyQtKKo=
X-Gm-Gg: Acq92OFAJv2uYwLXCZSS6tAVdhKpOdjOPEB4yINqcgoFv6PSWDIk71RJ0yrXL76NHPn
 MTWhj9NyeCW5qoBudkl0TzCCSrGlRXlx+66rLihVJW6JuLoM0VeAIVsPhSOx/NsESAd15YWVO4m
 k6L+JZeXhMP4G40MB7NTzpfCfU189F3pYfKWfFhctuqNcDLyDz57ijdbGvW5KSEsy49si8g1GqB
 wwoqraytRnbYmeDcAZVJ6aV1qiiqxiM04wbecx1GMYNH1UX9f+s26hKZ1u1dVJ9gr+jObiuHA3V
 GhI4RbHbBZbUWtvrKUZA7Fv3oktD41XrfpJxijbqUHnhWd9eOU0VsTf576L4PW/JWhLIGENPwxU
 2QSfWHjvtet5l6vkA8W0hfAzsSzsCSyLEEA7lPhdyWdPtyJwjmLYkkIRhUWpuhHRq5p8c7mPjJd
 Db4arhjV5iGXs63Q0zjOihXAfPaLvNtFoelA==
X-Received: by 2002:a05:600d:864a:20b0:490:6869:7d8b with SMTP id
 5b1f17b1804b1-4909c089d9dmr24637905e9.15.1780043392032; 
 Fri, 29 May 2026 01:29:52 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c6319ddsm31623155e9.0.2026.05.29.01.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:50 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8A48060335;
 Fri, 29 May 2026 09:29:48 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v7 4/8] target/arm: ensure aarch64 DISAS_WFE will exit
Date: Fri, 29 May 2026 09:29:43 +0100
Message-ID: <20260529082948.363931-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260529082948.363931-1-alex.bennee@linaro.org>
References: <20260529082948.363931-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

This mirrors the logic for DISAS_WFE in 32 bit world. As the WFE/WFI
have similar behaviours shuffle the case statements around a little
and update the commentary to cover both.

Fixes: 252ec405768 (target-arm: implement WFE/YIELD as a yield for AArch64)
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v4
  - shuffle case statements, unify the comments.
---
 target/arm/tcg/translate-a64.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 15b40090c0f..c20269b1501 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10939,25 +10939,25 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         case DISAS_NORETURN:
         case DISAS_SWI:
             break;
-        case DISAS_WFE:
-            gen_a64_update_pc(dc, 4);
-            gen_helper_wfe(tcg_env);
-            break;
         case DISAS_YIELD:
             gen_a64_update_pc(dc, 4);
             gen_helper_yield(tcg_env);
             break;
+        /*
+         * Both WFE/WFI can cause exceptions or exit the loop to
+         * halt so we have to make sure we have rectified the PC.
+         * However they can also return directly if they don't
+         * enter a wait state so we must add an exit block so we exit
+         * the loop and check for interrupts.
+         */
+        case DISAS_WFE:
+            gen_a64_update_pc(dc, 4);
+            gen_helper_wfe(tcg_env);
+            tcg_gen_exit_tb(NULL, 0);
+            break;
         case DISAS_WFI:
-            /*
-             * This is a special case because we don't want to just halt
-             * the CPU if trying to debug across a WFI.
-             */
             gen_a64_update_pc(dc, 4);
             gen_helper_wfi(tcg_env, tcg_constant_i32(4));
-            /*
-             * The helper doesn't necessarily throw an exception, but we
-             * must go back to the main loop to check for interrupts anyway.
-             */
             tcg_gen_exit_tb(NULL, 0);
             break;
         }
-- 
2.47.3


