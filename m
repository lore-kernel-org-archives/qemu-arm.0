Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6E7F46C47
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 15:05:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9lVm-000382-1j; Mon, 06 Apr 2026 11:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9lVk-000369-Fp
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 11:05:08 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9lVi-00045J-Qk
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 11:05:08 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2ab232cc803so17097595ad.3
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 08:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775487905; x=1776092705; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jvjSLIEXvBvChupp9bEDs+PcKLfymPb67QO+8GQ5aqk=;
 b=EsZXNnpbQpvwM0X+DcUtg9YfPnW3WSx47Ay0FSdhUp3+B0BGN46bnbk4hHnMA6ETg1
 TIuJq+Wovr9JhjonC/XXg43i2MN6gjSsJslciLRWjijBq7+i6JxLXd/lw840voRM7zBH
 nUQZD/pDom3xdh+X1rjkFv854ZcTIRkaTeU6r/t06MBPz5Sszm87PElUbxmftH14xnTK
 3qx0lYWtTzCheJmf7x8xcaqOE4j2uhQ2L9T/G6XzXVMiZde9vPL4M/57FRz0d6iaieKq
 Te1UyqZy93RBVX4m8/w5fzoyyrBYSxKbwWkvGJpaa0iSXt0cTbEVTO23aNpELu36Sp5y
 OLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775487905; x=1776092705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jvjSLIEXvBvChupp9bEDs+PcKLfymPb67QO+8GQ5aqk=;
 b=cdd+C1yuZP19ABbR00mIx5bdoCufZgDdfUcbIJeznnFtNAeYqhNifDXslZ9kEx7eO4
 tv8a4kI5TZqsfzWRKQq8h1ppJN7vvxtSgSQaMdFJAUeYCVKQolbB0IgCGAuv600YDMSq
 iBIDou8KNdNpIuIkKgptX8sEL7hD8nkWdDDP1wVX6X44prInyGl3dQWvA45ns0lADDHe
 ptAeUe9+jjXWjMf2X55c2WnzDMv5YoaO2Hl7TGCAAXBJDA4hq4UltnMq1bOrfFg4jfzM
 D73YorLCBEdN5duvpV/UCYsMF/3kuuZfC9WXy7drhvcYFvHHSCzK+iE1qZ8f/YsNrO8g
 iK6g==
X-Gm-Message-State: AOJu0YwqOkotLeD43hZjv4lBnRKK1359lmkyzFghv8j+jPJlNxgVonuh
 /cTnF3vQL/WY5M3zQO1hzGCdWUx7I+j9SLAqba7TSQDUaGTLErx1E1TAdgEe8tg5YY4=
X-Gm-Gg: AeBDieuLEe981WZSJZ7RkCq9B6xx6gFEL4kUpgLGHDZlqYGBdhHkEPQyg4sf1rO7oUO
 zZu8efgOlLhthrx/i47Uh6ejyNu3H4koYzBh4cZm2NdsaxmsTu1ov/thFqKM6ailff1lJLRfyQB
 Nwub4CuKt5ARTj/0gU9hJWZy+LcA1v4B5CCvs92NbosWXCxSn8NM8Gox0K3MXLiwAReXJpMX2E/
 Pvdtr68TZ8C1aDvKPTpXHZt4Td64/5NhLrjHda4lZoXUX8np/lIiBkgnqdAQjPjQppEHHxsgniG
 FjXcE+pXKWwo06Hh2sRNaBI9p7o8s2U7U5w+LAqbhpKG78PGN2PyskeUuQ0/RkNZP5YFhP6XTxO
 0SulZLcXptNJIVVVbTjTnc3M9jYslrOasEqBtwjgvslpiE12A+QmuyucU8k4q87Nw67lHavfqvP
 Diiatzvs7dhYLYhtB86Jcwg5Tf8pzUW5VrCJQZaGlJdySyLCMcXq3rHMqdPCe2VTfVtYiPV2P56
 8X7
X-Received: by 2002:a17:902:ef08:b0:2ae:450c:951e with SMTP id
 d9443c01a7336-2b281818ac9mr142415495ad.17.1775487905256; 
 Mon, 06 Apr 2026 08:05:05 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d72sm137770075ad.51.2026.04.06.08.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 08:05:04 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 jim.macarthur@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v7 12/14] target/arm/tcg/translate.c: replace target_ulong
 with uint32_t
Date: Mon,  6 Apr 2026 08:04:32 -0700
Message-ID: <20260406150434.407201-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406150434.407201-1-pierrick.bouvier@linaro.org>
References: <20260406150434.407201-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x636.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


