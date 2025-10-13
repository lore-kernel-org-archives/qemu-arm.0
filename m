Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC093CCD183
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Oct 2025 16:11:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8L8b-0007ke-Gq; Mon, 13 Oct 2025 12:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v8L8O-0007j8-29
 for qemu-arm@nongnu.org; Mon, 13 Oct 2025 12:10:52 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v8L8I-0002mG-1A
 for qemu-arm@nongnu.org; Mon, 13 Oct 2025 12:10:51 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42420c7de22so2005530f8f.1
 for <qemu-arm@nongnu.org>; Mon, 13 Oct 2025 09:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760371843; x=1760976643; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/+EHTUCThtQN+m+O/VxTEtMg257BUkao1q2OCXKIy5s=;
 b=GGc7akSGlpTmecqyOPlS80I57cENM88zsjVyUphierSd5UR0VbNxobM0I1Nul7+UiM
 p+7yV8tRN83CgaNzrFVckHiQUd8rTwT++hmQX8IlIsjv1lTnxJgzlCItMdrQprZuS56f
 xrZCd8hXYxIunRabWvDxjWc1tSNNf2j+jzI9ZAUK97A8fp89AX684hM6JM3fxtVj+KPW
 jqYI6WKS1RtqDOKMVFSO1OmzEhZGUttm1t7S93srmqLprme/tbOYNR1P13lGFOVXR0e4
 dMVWD+b3Ww55tCp7DCRhpWignktVgcS7C+LdAYR/aSarZ2OqcOoVmhhPNQQz+mFeCqr3
 8E7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760371843; x=1760976643;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/+EHTUCThtQN+m+O/VxTEtMg257BUkao1q2OCXKIy5s=;
 b=lEoTMj+jMJ63GaoIo/XJT3ZnbcmN7a9qRuh033E1wf0St12cV/18j3PNpiu5jdM83P
 Hs3hG0BOoc1G+M4ozjmdCsc72et1/xVZTzqu0ZEWS48tyzHDAvys+AMrmhmX1EYXMIJN
 F3SNWfP86mXDhJAFcH04MAVWrLEGdYjAQEyGLaShrhhbvhYf672FAtVTESSozfTIlTzz
 kLXKUSSRB6jW0ZhD8C11M0V04PDd8G7krXynYCFuV12DcSwtyXSUfdpeJwCSNLsCEYVu
 fFw4JsBSHewtfTxtMqUddkZ/m8Nzja4Lnhjb1HMDgQ9BVAzOdjD/0VU425HiYTPy38VB
 BG6g==
X-Gm-Message-State: AOJu0Yytc0hXM5DX/jVxs6vVyFW7mznl17h9QDrUzzyVMuCNQCq1FqKT
 2fA41AiTAGjLqe/OOx2heb51Du4sslnv/f1TFNWhzChqwX1q8FUl9HjM0MwUstYY+qNeDc2DjYh
 DtTzn
X-Gm-Gg: ASbGncuyW1H8Vx1NRAhgNqHHiOhaJnutjnUEOx4lTkJqIV67hAtUmlse4h4k1kAJuVV
 vglTodL9jZ48y2VcOogpp9AdmBeg1H3oSbY0O7EFLw5T+2ZheVtqihOfLm8J8Q+bsQyOxsEJZ0P
 uBPVnEk72cVnmlr4uWa+mrIPLViiHsnrcVlyeyS4+hIjRE7exYhL8KNu517yMwEGubrZfvXwUBU
 PVygHFcCHi0AAvTaAB1tTWYzuid1/ObI2L3nrEZnicaniP4Lgiq76lGhkk06BBCeF/lEoITQ+KN
 /JP+TbQRK3gNba6UnPKhwDh00lIVNCzUbKqze72rgHcFlRzKFPZUdPqNsViXkZ1ytyUnPe0EaHW
 3IVut27kpS8JCeTInyhAejeUW6Ik/hvsVmYiCLONmJOZ8LYVEXJw=
X-Google-Smtp-Source: AGHT+IH15Y3LAVReqswQHCmpDmwNjSoUGzwUL4IxWBNZ0aeEklCJKIneRlba+0QMfAyk5+PhmMdfhg==
X-Received: by 2002:a05:6000:4202:b0:3f9:e348:f5c with SMTP id
 ffacd0b85a97d-4266e8e9026mr14215622f8f.60.1760371842814; 
 Mon, 13 Oct 2025 09:10:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb497af18sm192750255e9.3.2025.10.13.09.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 09:10:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH] target/arm: Fix reads of CNTFRQ_EL0 in linux-user mode
Date: Mon, 13 Oct 2025 17:10:40 +0100
Message-ID: <20251013161040.216819-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

In commit bd8e9ddf6f6 ("target/arm: Refactor default generic timer
frequency handling") we changed how we initialized the generic timer
frequency as reported in the CNTFRQ_EL0 register.  As part of that,
we chanegd the linux-user version of the CNTFRQ_EL0 sysreg from
having a constant value set at compile time through the .resetvalue
field to having a reset value which we compute in a .resetfn.

This accidentally broke the reading of CNTFRQ_EL0 in linux-user mode,
because the cpreg is marked as ARM_CP_CONST, which means we translate
it as a read of the compile-time constant value in the .resetvalue
field.  This is now zero, so userspace sees a 0 frequency value.

Fix the bug by dropping the ARM_CP_CONST marking.  This will cause us
to translate the read as a load of the value from the CPU state
struct cp15.c14_cntfrq field, which is where the real frequency value
now lives.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3159
Fixes: bd8e9ddf6f6 ("target/arm: Refactor default generic timer frequency handling")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 167f2909b3f..1e1c0e41415 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2306,7 +2306,7 @@ static uint64_t gt_virt_cnt_read(CPUARMState *env, const ARMCPRegInfo *ri)
 static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     { .name = "CNTFRQ_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 0, .opc2 = 0,
-      .type = ARM_CP_CONST, .access = PL0_R /* no PL1_RW in linux-user */,
+      .access = PL0_R /* no PL1_RW in linux-user */,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_cntfrq),
       .resetfn = arm_gt_cntfrq_reset,
     },
-- 
2.43.0


