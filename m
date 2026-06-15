Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18B7CD98C7
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 10:52:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZ4uj-0000XB-K4; Mon, 15 Jun 2026 06:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZ4tz-0000RJ-AF
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 06:50:50 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZ4tr-0001Ss-PU
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 06:50:44 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-46019b190b6so2682742f8f.3
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 03:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781520635; x=1782125435; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=34QQgWxmqNmOcMc6dpEoeumYGJN8pWfi/blQdAPFyZI=;
 b=sThEwBPYOyUAd0kFI5dErVJFaei5O7PWTfBBlzpp2i58MVCoqobaA2MmxpIoLtVcSk
 H/+IvzyvHRcTfHeGBXY6dzhGVY3T3HhawgmNvLXD96EWMs0T4WksBRr6vUpvLYKTqC/y
 UWuUhsgWXgRTkQalQmP5BBklPfR6l3GDZlIGPDCXHicwBK7CG1EfbOd0Gqwgq303rBue
 yQGihHa0+I/6kTgmiFROc008+1qqG4CxaXiBPJfSFaY/a3sUR+4VVgKJtcHrH41CwiXD
 ryDVMp0qEso0kEGoj+kUzU+TUvnxeL0sPwWvY35lM6fA7f/Y7BxwDpcbtMcUNNvMOVug
 T1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781520635; x=1782125435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=34QQgWxmqNmOcMc6dpEoeumYGJN8pWfi/blQdAPFyZI=;
 b=mpL+LinUAVXYQfWOoPEo4F8/sqBPK6DcDX87jBBtXrhVtUgOErkdT2MYY7rCxacJHC
 WrPqremYv5uCyqRCFeFuSkTmjWto3Y1HgqsOjmk5lEGpHo6Ju47wv+/H2vErJLG7dMmb
 AkflEEyjzOJJ41FFKkmNx6Im5RXYzy9nCQ/OjiwzK8UmNChRbI/XV9cAkGHrTX03zi2I
 JdO3v9Dwb6punFgrvHU1E4A+CiICJxAMgQD5BHpR6IECRPLkE9+zzQSyq4T2w3kZH4Ov
 iaAauy4JNSknWp3AJmjCCV5en8+38KSM4DE3oxHnd21fEXBvG+mM348aqTsjZd5RDqQd
 D4+A==
X-Gm-Message-State: AOJu0YxkiHaR/tZK/fMqPD7C18WxuzNlsEmVdx6DSmfrcxNkQ/6B7nSK
 dDX+8hmJCz0TkgaJtw6m/PiXCL6V4FfGo58b5ky0PwwBKW+fs0jt/vasyG3iZoYmCR1X2XwDOxJ
 5oJWH
X-Gm-Gg: Acq92OFWhbJLyU/1EiMXGM6UyCQCWL7cQQy/SpkJEcI67T71QowfZ3K7tCfdxO0ZfJX
 IQvbWbI8PHypgPlnURSZ3O2DShQ175mas3X4MOiMTLt4RbkKK1ir9gqip1Kq8XF226Lfa1v0SFL
 czdE0rOQlrmhQ/weCOtoJsFPCKZWa77ZTY7lDqL8npXpE8IeYLMN6uiBf/Rs55J64UItgyRButx
 +YJlbqbt57HTeVQj2uGCYxoP++Y5cZwqXbi2pUpEHjLBd2+DSLKziWDloYq4Y6F0ntvNIUyP/jU
 7Fnzb/kr1U7QFAnbmu36dyycO8IZ4qRJJC9y6PoSJGS7N5o9lRBnHEG9bLGYxm8M2G4cfhotiL2
 LH8UuYWWh8Q+dTULBdlp1/MuJJBVaZ99jYNsgwfCb1rLD/uKk7JIpoobVv+h1iWPMv1NkQk1BNa
 PSvcf/gTxaP7GGeWyXSGssTpqyUf8fBGwt5fxgvYjNKXGWmFnjS9XecnRSkONdswoDnJtDNWny9
 D5GwEVev/U65fFTb224+8HYGWlZXS1B
X-Received: by 2002:a5d:59aa:0:b0:45e:f2e1:9a20 with SMTP id
 ffacd0b85a97d-46077f2b060mr13330685f8f.27.1781520634775; 
 Mon, 15 Jun 2026 03:50:34 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f263945sm33863674f8f.8.2026.06.15.03.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 03:50:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/5] target/arm: GICv5 cpuif: Remove ICC_HAPR_EL1
Date: Mon, 15 Jun 2026 11:50:28 +0100
Message-ID: <20260615105029.2898872-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615105029.2898872-1-peter.maydell@linaro.org>
References: <20260615105029.2898872-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

The ICC_HAPR_EL1 register reported the current running priority of
the CPU. However this can be easily calculated by reading the
APR register, so it has been removed in the newly released A.a
version of the GICv5 spec (IHI 111701).

Remove QEMU's implementation of this register. (This is OK for
us to do without warning because our GICv5 support is listed
as "experimental"; we anticipated that this kind of spec change
might happen.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/gicv5-cpuif.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 1aa4bde799..a868adca66 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -511,15 +511,6 @@ static void gic_icc_apr_el1_reset(CPUARMState *env, const ARMCPRegInfo *ri)
     }
 }
 
-static uint64_t gic_icc_hapr_el1_read(CPUARMState *env, const ARMCPRegInfo *ri)
-{
-    /*
-     * ICC_HAPR_EL1 reports the current running priority, which can be
-     * calculated from the APR register.
-     */
-    return gic_running_prio(env, gicv5_current_phys_domain(env));
-}
-
 /* ICC_CR0_EL1 is also banked */
 static uint64_t gic_icc_cr0_el1_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
@@ -928,11 +919,6 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .writefn = gic_icc_pcr_el1_write,
         .resetfn = gic_icc_pcr_el1_reset,
     },
-    {   .name = "ICC_HAPR_EL1", .state = ARM_CP_STATE_AA64,
-        .opc0 = 3, .opc1 = 1, .crn = 12, .crm = 0, .opc2 = 3,
-        .access = PL1_R, .type = ARM_CP_IO | ARM_CP_NO_RAW,
-        .readfn = gic_icc_hapr_el1_read, .raw_writefn = arm_cp_write_ignore,
-    },
 };
 
 void define_gicv5_cpuif_regs(ARMCPU *cpu)
-- 
2.43.0


