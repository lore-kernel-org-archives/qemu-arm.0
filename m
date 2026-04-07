Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6D9FF5136
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 20:03:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wACaX-0004Iw-8W; Tue, 07 Apr 2026 15:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wACaV-0004Fm-Tw
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:59:51 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wACaU-0007QM-3u
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:59:51 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-35d99bae2ebso4724983a91.3
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 12:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775591989; x=1776196789; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Geed+LNcY7TFub3zSBXzpgR/5EdouLTW+yMNH7ktlc=;
 b=ycmhkGD/9CNsJJ4NaLf+rudHVdAYC+GlPbJmWHFRIYb00PTDocbVJRRiHmJEzglAx3
 UYgojlxtVVG2TxTAVMyBsMb4I4j6Ibs/L/beYAELJw1/qyNNSRit0DrjC2lCN/7R9thE
 wVia6pTsm5K7ZaUobZBVDzzx9CAvBYjK2l0Xt6F8npKKRajTG6vnctViogiTyMENQOQr
 KO4B+WXse5dAwutJVCtfrgV98+3Lbqtvpnk8BKgxAk0dnUEH0PKEZAsZtgRUiRltK0+R
 7HzLBZHoksG0S43d207ff61L0EthKtTF1eJUxXOE7T8p00evOkWZHuwsQBKaDLELwA6H
 Ui8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775591989; x=1776196789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9Geed+LNcY7TFub3zSBXzpgR/5EdouLTW+yMNH7ktlc=;
 b=RBQS6Fe9RhrA9Ny0uPlFf5COoOFS6nmujRKf1q8gXT7ATdH63FJaD9/CwySEclG7dS
 ura6snQJoiApgs5JW+zv63CJERmu+d0TrTGQ6o018yuXOR/ySgce4HWTRNkcbxbXEbYT
 jxEj2alpbCIl7x84/5PugmaFhEmsQx3l++Y1VEmTlWZu/QR94On432QC8yMdLKPgpwOC
 iKUZRJjY5CJ31Xgk0If1/ug1nasXrEm0Divw4lWRUF3Lp0DgCA4+goyp1b4KMKBoMLEj
 NpHhvTLkr2JdtmfOrbMqEh4wvoZRwvYV5VNhaFDrC58KbYB0Awli9zUwGLCS4RpqeH2f
 yaCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqRL+NYIlgOFmpDZZ3hFqw33kzqEdROR3vrUiL2bLKwkPKW+MMJf8mhWKA3PnnNRro0vq0lnmKnA==@nongnu.org
X-Gm-Message-State: AOJu0YzaEsb4kDBj8ynk4Ub7q1qc+PVuljfMV+sf8n0kaACRVjUbGWaj
 Huxlc3nmjEFyOxM6mbAXq4vCriMlmjcTQe5scRrrYd+TvY6UE0qhum+YnAKSv6eNuCM=
X-Gm-Gg: AeBDietv/FdzwJZcRiodojGA3QAkxqEZJvDQu53/8X8cn96YZ4PcujinHMR1EzW5+jH
 iA6CHoKjSNcD7F4cFdjEDip9hLk5cjz1600V3PveCKslhPuWZP6GUIDHm314s7pFunIFblCi7oL
 tP30ykwGVmy+2AnlPWgdsL0IUwS5uoJjLDjo2QKUugmVxw9Cfsy6ju1wAeldO0dyr620cUkM30g
 nc/LbU1CpwK6V9rl5ewx9pJOgCapuYYQdDKdCy+kaQz1jZJxArUIBPvnUXT9ODSq8nNH/x0XSxW
 ObK0Rc8HFauhZ4b55Z4W5G3xhCrJlLUQiHQXTOMvqvKcn8NloX5wREYCTNx8A++dW+ihgvki4sg
 4mAXbU3TqndfQFgZSaN0TcUdT/L+uBDr6EVwqT0ss62JjRB0n9ul5RMwj6iVCskcA6e/jm+3aj4
 aspZ8CxgV0CpZFSxaXZRmE8E26cIBEJupjeIA2sZQOiycAhCVPo1Gpzy8UvY/Q25bFSgTtB+zKs
 qa2
X-Received: by 2002:a17:90b:224e:b0:35b:e56e:a17e with SMTP id
 98e67ed59e1d1-35de68cf52fmr18712203a91.17.1775591988444; 
 Tue, 07 Apr 2026 12:59:48 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35e27c9855csm126911a91.3.2026.04.07.12.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 12:59:47 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, philmd@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v10 19/21] target/arm/cpu.c: simplify endianness handling in
 arm_disas_set_info
Date: Tue,  7 Apr 2026 12:59:20 -0700
Message-ID: <20260407195922.196410-20-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
References: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1029.google.com
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


