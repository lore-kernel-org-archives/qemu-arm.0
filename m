Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F95310F284F
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 16:54:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w6APj-0007O6-7u; Fri, 27 Mar 2026 12:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AOs-0006Hu-Vt
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:51:12 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AOo-0005IW-Rb
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:51:10 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-c74f0c3fc16so889361a12.2
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 09:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774630259; x=1775235059; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YXzIIST3xy/TAN4MvDOBAWjprHM5xgU3m+1mXtsXC14=;
 b=qtny/1ks16hMzGB841I49a/LFXti1c57RII5JoeNWSeBk/U63ivhvfKITXqWpJRYMf
 HrAmBz54j/RrGBLPbBaDrBFJoDQrCyQDGlLvVyMRZLR5vjbzmUOqXhN8giOgrDs27M4s
 yZJ5OuD+AdijmfAkISiNp/sFLviTBakRSFlOseXVBjBAl1fXtjsDBV2bmuOHUy9/rJZ2
 LMVr4vFKsHdOLL9ZoJy5Ms7xTAJU4YDKLPcr3mKKNNXup3tFyV8Zsa+imgDJeK9hOIeB
 OFpEaDqWM7aFWOmcp2pp1UVbhYwRXJ0Sk9Gj/53N8Xq1STThCg4mMlnKzwfT0Qc9UkZv
 y9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774630259; x=1775235059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YXzIIST3xy/TAN4MvDOBAWjprHM5xgU3m+1mXtsXC14=;
 b=g6frECC7AsGWxwIDNMsLJnCo/QRtzpNEHekZjszmFOP/kej3SmbNiOkotb5A0W9kbO
 7FqXHvmPYzzKQghMNApvrGWjlPCZS8h4qbupFxxd/v4kElccYWJzsZ0oQ0UpXFFh/wxJ
 Ao+G6BIG4rqkkARgvA+x56QpxZyJE8QXaWTGSAG3Z8RH/XK5OeoSNWQXYXRfhbRYbcbM
 kulPiNvn4GULmoGfrS5sv7NeVVpQ4iZZ6mw/tgTl5k/0mj5R6f6DvZbLcTMf3S0y00v4
 jYGjUnc5rND9WbPbZqovBUqchm4mhzJ8q4kriyAb5c+dfPn3Vhe4YqY73qF29uj7+7H/
 mfow==
X-Gm-Message-State: AOJu0YxQWNcH4uxRBGkXjaqlI04KA0efmAJ2DI5AzHb1IYUGoY2+c4tn
 kwTyZKkthjhSCihg2d9Yytm398dM+8jhXs9/KKwj2urNcgxtJa8+vJbaJ+P3Csnw5XA=
X-Gm-Gg: ATEYQzwlTBqL/MdQg5c5cqy50v1SJI/+VviqQmTs1caSSUtM9M4LhDUmfEyZ0DvBQ3e
 W9GsUqeUUX7JQAqA/kmw31zzGdYLHM/iSFvF2OM46baBIQ943RmpCoL6WBfptTmFwwzs5M2aI+s
 KGZvEyZuQo28eS0V8l0BBuVX4CYdagq7RR/RrOdu+6a9wiP+I8yXgxnKsj20eJWZItrmPweENp7
 c/6GIun8dNTOTmjt0+PuIAcMLToK31X7AKbge/hh163sj0NtmWNR48Nk5t+3g4mWi/1DPLrZo95
 dFNf+tyFWqcY345OcUZuAyxJt+AeNhsSrVWw/epz0gLvbpBOlSoA8vv6rGp6fckDj2zaYvTg1dx
 v6d2gy1to1wLCmcHFDgF95JKTE0ohqIPs/L9+Sx13WDdx9R8X6ri7CwQ+A+Ptnb4jPPcS7efaCQ
 TAihN1IDBYwB6LU6bY3Qjza2r298M4tqcScEAiTn/jIf7nifsYc/Ojsm2RHXpk21qqBUg5DfdLi
 daNtsF48CgxumY=
X-Received: by 2002:a05:6a21:6d98:b0:393:74ed:7de9 with SMTP id
 adf61e73a8af0-39c8780230emr3548698637.3.1774630259056; 
 Fri, 27 Mar 2026 09:50:59 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c767399e0casm5514038a12.31.2026.03.27.09.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 09:50:58 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, philmd@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 12/12] target/arm/tcg/translate.c: replace target_ulong
 with uint32_t
Date: Fri, 27 Mar 2026 09:50:42 -0700
Message-ID: <20260327165042.604105-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
References: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x531.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 4546bbeeeff..204f9657993 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -6450,7 +6450,7 @@ static void arm_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
      * fields here.
      */
     uint32_t condexec_bits;
-    target_ulong pc_arg = dc->base.pc_next;
+    uint32_t pc_arg = dc->base.pc_next;
 
     if (tb_cflags(dcbase->tb) & CF_PCREL) {
         pc_arg &= ~TARGET_PAGE_MASK;
@@ -6612,7 +6612,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     bool is_16bit;
     /* TCG op to rewind to if this turns out to be an invalid ECI state */
     TCGOp *insn_eci_rewind = NULL;
-    target_ulong insn_eci_pc_save = -1;
+    uint32_t insn_eci_pc_save = -1;
 
     /* Misaligned thumb PC is architecturally impossible. */
     assert((dc->base.pc_next & 1) == 0);
-- 
2.47.3


