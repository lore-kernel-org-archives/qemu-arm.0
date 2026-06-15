Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5675CD98C7
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 10:51:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZ4ux-0000al-Oh; Mon, 15 Jun 2026 06:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZ4tv-0000RB-Jr
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 06:50:48 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZ4tn-0001SW-5C
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 06:50:37 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-4619990ca5fso506765f8f.1
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 03:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781520633; x=1782125433; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2VrJ5ZgsRdlINMUw7+Y3JTp3T0wQXEu4pb+cZQs4R6k=;
 b=CfFLU6ATwQdxFFk2Y8yD7irFfX+B7D/hZDdsVVb6Nf61vgKf+VmSgYT04/VsTS1cvM
 RZWRmXGFWD81wzzkFBSVlaYlQP6gADCinIo2gBRUGvO6JVmc6R+7Go9+xdEHN+MDZM+k
 VBz9dIKLy63SptjGYnoT79CYpdEY73lM4byajWU4jylBbwpFtpVso3Rc92C9eKlXrQGZ
 82LCaZRtZxZ2FxkLPF20ZSQmOfb3nE6sU3IenEQpzl/BghXUism1Bz4rkljWv+RSEhCu
 bhSzRCVzAVJQhBos6YcvrWpJE7vIsKq2xacXauxm0XEZjeRyxr2VH45rWN5RCDVWjcZn
 yBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781520633; x=1782125433;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2VrJ5ZgsRdlINMUw7+Y3JTp3T0wQXEu4pb+cZQs4R6k=;
 b=dNM8NKhzpRakgk7uLe4BgFVm3w4Mv1MyPn7nCwYBhA3O3pYwn2yaQ4aM8IJbqmJ14L
 F8oVP1UNok5vWH2I4nW6TfrPG5B9pafTibna25J48HKO9qrG+sNzacxXmMuH9r4hqfra
 Z5/4Beg55qjR5IVaAxmzDaM5JDYYePH2pAl76w5sqT+46UoOf6/Wr/gLkqI/3X4TZPx7
 Y7HkpveyjrnBrEgJQZfvjosAiO6EGbdTceuCiEpaxDpOi4E0460DJ4G9teCFGbvEUho9
 hKfWWin70W6P2uAriQKI/agF1JfX8EQyoxXyBYhXlRuKqbjm1xs4zMlqK8kxYa+2FH0z
 9rUg==
X-Gm-Message-State: AOJu0Yyovpvf7DbcKjtlSyXlJq7ibaj/MvBVhlIzPkstlROtuSLlQQ/P
 B/BhM4xte2Sj6OdqmUxZ2O2oJycvrD9IAVNi17WU2v1iTagRi8Kw+F6ZG3RCLHycADYQXmIJVMj
 C3Cjj
X-Gm-Gg: Acq92OEWh+amWP5JfitNLRwdHzrsVko9C2pqn5OzJaJk2ApaAuoCrVZEdbM8B4q3crE
 YOJyuRRNvKhQ+kIB9LiDNzoxP1y2kUMj4rlx85IaY8sOxF+y4XFNhPOtfaIJQxBpTBfKIFbPdWF
 i9rt/dswAfs6r7EUhBq0NFuKTPPYgBs1sJBGSvmxc2oEHGN4Vb/3wbbbA5nFNDF3T4pX/+7adTZ
 DG5dZ8xX4QSwcQIqaNcDm8u6V4UTqeTqy2ncuJSfyyFTUghznd8jkTclH+y0jtzP36CEaTWEA21
 50SMF0ckjTj96fhhufZud9ieazup/FPM/zUi0hh8aRj0VHzD6qHOrj2nPTbMnufa0hcS1vmRe3d
 BPqTqjlYgJ1OiJXKkVdlftG4qsV3Hvl25IZ/oNxWamKj/lPM0XyA5rTDTHoYFcdgFaFcmpW50Tl
 GHAJxjzH5fXdz1Ky/1CeG0pcYbZ8n22pdMdgnXOUJsMlANvjJqwj0fApQJyqT5u6zbImR3raLmB
 IbTzCTH62ZVEsduuK5zMwMMd1/YKyh1
X-Received: by 2002:a05:6000:2210:b0:460:efd:c682 with SMTP id
 ffacd0b85a97d-46074a8a01cmr14314126f8f.24.1781520632905; 
 Mon, 15 Jun 2026 03:50:32 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f263945sm33863674f8f.8.2026.06.15.03.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 03:50:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/5] target/arm: GICv5 cpuif: Recalculate IRQ/FIQ on
 ICC_PCR_EL1 write
Date: Mon, 15 Jun 2026 11:50:26 +0100
Message-ID: <20260615105029.2898872-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615105029.2898872-1-peter.maydell@linaro.org>
References: <20260615105029.2898872-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

When the guest writes ICC_PCR_EL1 we should recheck whether we should
be signalling IRQ or FIQ, because we use this priority mask value in
determining whether the highest priority interrupt should be
signalled or not.

Fixes: 9bd90bddb79b ("target/arm: GICv5 cpuif: Signal IRQ or FIQ")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/gicv5-cpuif.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 891cb2d3b7..09c3fdda61 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -565,6 +565,7 @@ static void gic_icc_pcr_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     value &= R_ICC_PCR_PRIORITY_MASK;
     env->gicv5_cpuif.icc_pcr[domain] = value;
+    gicv5_update_irq_fiq(env);
 }
 
 static void gic_icc_pcr_el1_reset(CPUARMState *env, const ARMCPRegInfo *ri)
-- 
2.43.0


