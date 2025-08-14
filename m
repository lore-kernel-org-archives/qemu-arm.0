Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22F1CA0EDC
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:17:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXeA-0003bX-Fz; Thu, 14 Aug 2025 09:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXcu-0002K9-Os
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:04:17 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXcn-0005AY-Nh
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:04:16 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-76e34c4ce54so467320b3a.0
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176647; x=1755781447; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5UYaNg4HgCgaMfA5VDdSs+JLi614JTEFfBBOaKuI9nc=;
 b=dDqUQKZ+K/mwr6XRXU+m/JUx9RaDOcOu5WoVfYePn3ZafRO+k0LWNynoPtW0kybpSv
 x5f91tP6YqYrf5EWxiNpQTqyZXLBYqSuFpHcjm8d2M7n+34gcvj9DG2N9ZvS9WZOrmj0
 DfYieIvt1ir7t/ImR/qICJNuCkKwHv3SN2uZy4DkXwK67pbOy4m84Rw2G1cOjenNBO6U
 QLjI0cEB/i+tVGA+oqX3JL/DWyH99+OrYM/oYwWceKWpz5IPKNoBpARLKWUswjwE4nWe
 +DgAaUnsBzZhHodCh8amO7vpubIxOWP+Ocnx+1rnlyHsXJG651CTed+p06takgdMDC2o
 q5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176647; x=1755781447;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5UYaNg4HgCgaMfA5VDdSs+JLi614JTEFfBBOaKuI9nc=;
 b=YLnEa2U0HuUQ8S+W4W2u0rRJSLmcxLyBT/aEsI6j9mtDjAqq3MJ+TcO/dlBH3TyjJH
 wXdFl2ANOWOdPoLdbDLzymsNx+Ek1B5oywQRrpewKCggIwMuRhgBlBf/j8eViqV9Jamr
 JlxDKSS8LzanUkwj4na7kNJM+85XIyi0SEYDKTdZXfS/R3qXV5/HWYehyk6qpP2n0/5c
 iLGcNXWvxB2qUlnLiWHq97bnfFFZ5G8M2j5/UMnpJNAIMrkHAtNqYX89dGNZXb6B6V/e
 nsnTNYfIai2Wljj8kEnyFDI8HMw0acwzSc7XvHelPVOzh3PqraN6HvDsKoxD/hDyWB4Z
 Fhxg==
X-Gm-Message-State: AOJu0YwYpw8UWpp2yxwmiuvJ/5EM5OPmRqgOYzGlmkqxuqBazl82yG8w
 4G4KKDHe4qLKpiQTO281+eX44EbCFFC0n5h3WLDrkS31p9GuQlz3ww2/sdDwIqupFtU=
X-Gm-Gg: ASbGncspvj3lnVx/txNAgfL/ZcXBavXaopaKx3xwB5UkhBN5BM0p+55FtwByvbCVLP7
 Qq7HMk4lnYLEZB8+rkgfugJpAx+bjISKlkRWPUu5+jxY43spDHcphODNAie2s0WYdlIcAUQ0Nbw
 vr9LlExfAYR0EblZB6biQCfwTnXTKw9bhoW7hYYcgeDDUisykkTocD4e3gIZ0i0oqa3CEcWfSeH
 9Mb/5UsftxGr4lIgvlP2oyaBab8D2lYbjGIto+2lh/o50/n4HaqdQMJsioDC94ok8kadEK6m0cw
 JbM+m1DwCFdwN9Yk/+URM67zVTvVBAcSyEeqfegTKuQr9AVf5IelQqlgwOAjME8L0EOID++BkuY
 OI1t8npWO1NB8bWOHiaP2cZAd+crTMklYhvJU/qv/n6wGNPM=
X-Google-Smtp-Source: AGHT+IHbcL9yFtTdFvbJWhleQZlD98zUECBjX9xEHWFbaAH21wwuK1d4JHDgOj3pgY+eTw5tFboK8Q==
X-Received: by 2002:a05:6a00:91d3:b0:742:aed4:3e1 with SMTP id
 d2e1a72fcca58-76e321f1e29mr3765791b3a.2.1755176646935; 
 Thu, 14 Aug 2025 06:04:06 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f6fesm34480631b3a.26.2025.08.14.06.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:04:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 55/85] target/arm: Emit HSTR trap exception out of line
Date: Thu, 14 Aug 2025 22:57:22 +1000
Message-ID: <20250814125752.164107-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Use delay_exception_el to move the exception out of line.
Use TCG_COND_TSTNE instead of separate AND+NE.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index c4dd3a747c..f6fdfaa551 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -3033,21 +3033,11 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
 
         if (maskbit != 4 && maskbit != 14) {
             /* T4 and T14 are RES0 so never cause traps */
-            TCGv_i32 t;
-            DisasLabel over = gen_disas_label(s);
+            TCGLabel *fail = delay_exception_el(s, EXCP_UDEF, syndrome, 2);
+            TCGv_i32 t =
+                load_cpu_offset(offsetoflow32(CPUARMState, cp15.hstr_el2));
 
-            t = load_cpu_offset(offsetoflow32(CPUARMState, cp15.hstr_el2));
-            tcg_gen_andi_i32(t, t, 1u << maskbit);
-            tcg_gen_brcondi_i32(TCG_COND_EQ, t, 0, over.label);
-
-            gen_exception_insn_el(s, 0, EXCP_UDEF, syndrome, 2);
-            /*
-             * gen_exception_insn() will set is_jmp to DISAS_NORETURN,
-             * but since we're conditionally branching over it, we want
-             * to assume continue-to-next-instruction.
-             */
-            s->base.is_jmp = DISAS_NEXT;
-            set_disas_label(s, over);
+            tcg_gen_brcondi_i32(TCG_COND_TSTNE, t, 1u << maskbit, fail);
         }
     }
 
-- 
2.43.0


