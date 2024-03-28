Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp1211851ejv;
        Thu, 28 Mar 2024 08:33:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXGWmcmchauJs4YiXjzroQwglQxxuShT1jjsCjpO32LrBQvHThhLW3YFszHHEiID5tenmuS991gfcSfCZM22qnAVYB3hnnL
X-Google-Smtp-Source: AGHT+IEdM0YHDIADnSbyq5+kbem/ZAN4zrq9eq2yqZgyQVcJwxKgvxs/v/5sGLhCOFIoswgjSIZt
X-Received: by 2002:a05:6102:394a:b0:478:42b7:c535 with SMTP id f10-20020a056102394a00b0047842b7c535mr3628400vsu.30.1711640037957;
        Thu, 28 Mar 2024 08:33:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711640037; cv=none;
        d=google.com; s=arc-20160816;
        b=REJfO/bv66t825w4XRi/jxC7MX3szhPhO+16kZuTb0tAaFi+N4+AIlFbhZ08Tn59ju
         Y77vLVi7LhQzNb9iALH6PCBfZ0DAlFve0NwACXto7NqXPo+iGTFf0ZsHQMMBLCEAxg4L
         yd56bh9JtpX0EyCGQYYvht2xE26fsr3sRfqJZAtBmQpDjnVvVTnqR1r5SYeA6s/bll4H
         LaHMaY7OqOTbq3sl+wp8F/mK5xpVSi2yd9yHEoYo/D89vhpcfdd86+GxsMjBj3GZ69ZF
         7b8gkhsi/cQVQH9sh1TJ/iatzrpefy0JeVryu7PNeyrL0/yyrll1+iM+M+BgaDXM48Le
         GBlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=HoXcWIswnaiYn+YGfxoqs8bfwHg7SCgsOteFXjUUrDI=;
        fh=spbD1uAOw2hCQBb83uSlqZAKTOl6wvNX+k1rxl9UBCg=;
        b=f9e6PFuRrFUzfSuSZlHPZua9ORkz1bApTxecIRkDiKRq3FcmHw+fJzBNXeaNRH/Cda
         wcTqrX5B0P24/mFO93T3w5d/2hWzVaRBB6nc+SjzqcrMpT/qxOr0jBBUKUrAq2a184Q0
         Gm3y1m6W4FeK7pRL5diPsqzQS4Ox7LOoXXiyFtgW7woaj2VEOUPlIcZn0DdMK7omea4N
         pKCHcLqLGzzIWfYJmFLNC3ktbhNvWTYrLFSkOpdEckoGV5oJWFw+fOTqgC1/GY4+hUif
         HXLJui/cj7g6hz2f2dpjA4h9XZnlfRKMh4eFUD+KV+ObkkyL88+gGkuxIOB+0R8j3mLs
         97Kg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lrPq1BXS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jf11-20020a05610217cb00b00476f09c0578si238424vsb.298.2024.03.28.08.33.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2024 08:33:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lrPq1BXS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rprl5-0008P0-Ep; Thu, 28 Mar 2024 11:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rprl4-0008Ol-Uz
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 11:33:39 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rprl2-0006IV-Jl
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 11:33:38 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-341d730bdfcso916846f8f.1
 for <qemu-arm@nongnu.org>; Thu, 28 Mar 2024 08:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711640015; x=1712244815; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HoXcWIswnaiYn+YGfxoqs8bfwHg7SCgsOteFXjUUrDI=;
 b=lrPq1BXStVueusSFfHC1HToxaenBcx4LtMGLV9TidOCdtHYBLjtDSt3tb29WngSAoC
 NeLSh7tRkAOSWCCuONOA+gByvIB/WXOkP7yPVcj61ZTLxijaCwaVfCzyjSSlkGgFHM/B
 hgZEwl1HyEQHibBhwfcQQ9qRHGaR0cGk7JGcnpSXyYB6LjIM7LMAQJ7TlC0j06MNE4hf
 uVkMNYbx0gu8pV3C+jciXZECTny49b9nY9Tr4L6P5fFXH23hYxNUkoK//zX1OOH4btFb
 4zpZZ2Bxu+BXbxkW9+AZWwgE1xyDU/eHyMjitF4Ijs/eg3ZZWolcxKb3/LZY3vKyBknv
 qrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711640015; x=1712244815;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HoXcWIswnaiYn+YGfxoqs8bfwHg7SCgsOteFXjUUrDI=;
 b=mr6946AJvxaRWXbwZyo276dJ7RFg3VbfAsPrJwma+DHMV1GEx02npKTgTDPsTnSwCD
 of8pSqyE0rEiyo1HUgkSUGYpzIbAi2Odv5TeowIn7h1zSEyzhJEVJKbxUZ849NuBicGm
 ZuYkBAJsrybH+Dg+9PTIMCdZz/GVjafRNOCZAnNN1umKRNVJ8d9q3BESS77dqcgbBR0E
 GjoRsG3uLv0oExdyKf5K/8f8gLyC9YjR5R/Bzbmr6pmURlhQHN0+gcZcMfTVv+sGLO5e
 R83/3rVgfJ8PmBlB3R6OlNKeqH7KhmPoIMHyDuHpS1a65c2uJkfeQ+QEo9gF7Uyre1d9
 1WDQ==
X-Gm-Message-State: AOJu0Yy3AUlttYcWj2zF38atdyKMae4bVnWYmyNmoQgzZ3x8+BP17lBF
 sgJF/HvQXzhUblVpnW0Q6IshWmRP9ZPPMpjaokGsKXSp1j7nXWdy7PRl841ohKXuuop6csDK+w2
 6
X-Received: by 2002:a5d:6586:0:b0:33e:34aa:d78a with SMTP id
 q6-20020a5d6586000000b0033e34aad78amr3033455wru.8.1711640014748; 
 Thu, 28 Mar 2024 08:33:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bt30-20020a056000081e00b00341b9e11b11sm2067039wrb.24.2024.03.28.08.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 08:33:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH] hw/intc/arm_gicv3: ICC_HPPIR* return SPURIOUS if int group is
 disabled
Date: Thu, 28 Mar 2024 15:33:33 +0000
Message-Id: <20240328153333.2522667-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Hz5nXoWbGbSp

If the group of the highest priority pending interrupt is disabled
via ICC_IGRPEN*, the ICC_HPPIR* registers should return
INTID_SPURIOUS, not the interrupt ID.  (See the GIC architecture
specification pseudocode functions ICC_HPPIR1_EL1[] and
HighestPriorityPendingInterrupt().)

Make HPPIR reads honour the group disable, the way we already do
when determining whether to preempt in icc_hppi_can_preempt().

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Pre-existing bug which I happened to notice while working
on review of the FEAT_NMI patches. I don't suppose real world
code disables interrupt groups which it's actually using, which
is why nobody's noticed it. Still, it's a safe bugfix so might
as well go to stable too.
---
 hw/intc/arm_gicv3_cpuif.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index e1a60d8c15b..67d8fd07b7f 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -1067,7 +1067,7 @@ static uint64_t icc_hppir0_value(GICv3CPUState *cs, CPUARMState *env)
      */
     bool irq_is_secure;
 
-    if (cs->hppi.prio == 0xff) {
+    if (icc_no_enabled_hppi(cs)) {
         return INTID_SPURIOUS;
     }
 
@@ -1104,7 +1104,7 @@ static uint64_t icc_hppir1_value(GICv3CPUState *cs, CPUARMState *env)
      */
     bool irq_is_secure;
 
-    if (cs->hppi.prio == 0xff) {
+    if (icc_no_enabled_hppi(cs)) {
         return INTID_SPURIOUS;
     }
 
-- 
2.34.1

