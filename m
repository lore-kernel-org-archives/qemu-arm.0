Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C86CCA0EDC
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:26:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXXp-0001Xn-Ly; Thu, 14 Aug 2025 08:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXXn-0001WK-K5
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:58:59 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXXd-0004Gb-RL
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:58:56 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-244581caca6so6427475ad.2
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 05:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176326; x=1755781126; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Utmv5egIEVGewAwFQzpT1Xl8BddTKGqUYuRm1k9B5kE=;
 b=x0lHaTzt6TZBSikpARdGQT8ac7FUiTgLOPWVeWRkQ7J8ACpt1eYWUpeLnZXxyGD9Hr
 kPHq733EWgW9ZnVCZSl93RCF7o9/zuw6/Q0m5jzwZzRWlB3kLsHPU9Ik2fR9cgKVnr74
 rbhXdGpQO8mHJqblHf1y81hW5maDKSLfteXO8PzOjHEY3v3y66PddyX0TR+KJv9osg0e
 1RJ0c3fo3qTG+8QMFnKFIvWNIcTeTN+oKT7IQujlX1SOMLla8QGybG/V0X+49z/fHir/
 RUdLJjyIGknmAShip2IzYcq2TDiiTBh9cK+w937yuSiSeSRqL1txz1wvOn/zZBUXI+PN
 7Gew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176326; x=1755781126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Utmv5egIEVGewAwFQzpT1Xl8BddTKGqUYuRm1k9B5kE=;
 b=lq6HcdjtJONJMXLeJWMtkGJR3+8yboHogLjlHmfFw4kGpTJudUkP14a+IgLsacHyvg
 N7tvyjMV0V6eYARCnHJoNJoA/3SokXYP7mQuqgUBSiPGZ4EdzSW9HqZEduXckZkR36nf
 o5XpcKLOTM9R8HadXh3vPhVDrg/rSp7wD4RIGzOHryTo0xbna+z0yD46k9RJy1WorQI5
 poQFJuGg+nz++NXTXZBejziHppsCRHFa4MXL/Od/+DnxBhlzabqiaNT1JhyTVm7lqXP6
 fk5bJ2J4gZvMQTs5uuvNk9rjb8Tx22IlKNh0i04R/cR2Oon8r1uMakqR5hdE+wU04G+n
 4neg==
X-Gm-Message-State: AOJu0Yz29cjTgIO6m6FBuiPl+oG7fVADR9C0ZVzNh1wettoVaqKrYvuX
 URBrKXAjKDRPJD6Glvi18GZXtW7UKqxvEfG5CCGoHnpXC+JXEvzui+mp9LrzxRmbyr4=
X-Gm-Gg: ASbGnctDtiRez7awTTSLwjifVOuIOulUnsrwjPCBkvj+2On1N00b7xe7E4BGs3CmNjl
 OMCzvSfM0SSfLKaXN2AmsrsnwGU6KD0+w35f2g6yflGgEA2Y1ILT5FDr2Xv/ficcLbcMasCNbDD
 5l4qS4iN669FZ66LVdW2Sz3cFGhKQZawHpmUGV6hfQq/FDUOhVL7acT24PRSu3FRQ+JoEYYB8Q4
 +aziBGlQk/ETzJ8NeqexEfPlVQ+c7kGdkvGX+PFyNE/PDsc1+fVzNwNSsAvoJy4g2bQyRXwmcPu
 MVHpvZfHjHCjYMXVhcDAxSmHzD/smspiVlkZrPyLt5Ua8jjE/KiPA6M0gI4pQjUWiT+K1XpdbqK
 +z7mcgCZkrtyp+e0JVl4gs+eoE2/3oUYK00oCFHbm9lEp2p0=
X-Google-Smtp-Source: AGHT+IHMMM9NEorIRv+IGI1ALhTbjr3AfaKaZt/UFSpCJYushYCGd2T7IrT0USdKYOoehAskaxosDQ==
X-Received: by 2002:a17:902:d509:b0:240:7c39:9e25 with SMTP id
 d9443c01a7336-244586c4d96mr38699325ad.27.1755176326196; 
 Thu, 14 Aug 2025 05:58:46 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3233100c994sm1766256a91.21.2025.08.14.05.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 05:58:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 14/85] target/arm: Enable TCR2_ELx.PIE
Date: Thu, 14 Aug 2025 22:56:41 +1000
Message-ID: <20250814125752.164107-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index dc6c82b7e2..61ba9ba5b2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6202,8 +6202,12 @@ static CPAccessResult tcr2_el1_access(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tcr2_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
                            uint64_t value)
 {
+    ARMCPU *cpu = env_archcpu(env);
     uint64_t valid_mask = 0;
 
+    if (cpu_isar_feature(aa64_s1pie, cpu)) {
+        valid_mask |= TCR2_PIE;
+    }
     value &= valid_mask;
     raw_write(env, ri, value);
 }
@@ -6211,11 +6215,15 @@ static void tcr2_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tcr2_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
                            uint64_t value)
 {
+    ARMCPU *cpu = env_archcpu(env);
     uint64_t valid_mask = 0;
 
-    if (cpu_isar_feature(aa64_mec, env_archcpu(env))) {
+    if (cpu_isar_feature(aa64_mec, cpu)) {
         valid_mask |= TCR2_AMEC0 | TCR2_AMEC1;
     }
+    if (cpu_isar_feature(aa64_s1pie, cpu)) {
+        valid_mask |= TCR2_PIE;
+    }
     value &= valid_mask;
     raw_write(env, ri, value);
 }
-- 
2.43.0


