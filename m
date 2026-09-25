Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FFCC9832A
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Sep 2026 21:52:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xADoy-0008Qr-Am; Fri, 25 Sep 2026 17:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xADoE-0007le-AT
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 17:50:27 -0400
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xADo8-0007mJ-VD
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 17:50:19 -0400
Received: by mail-pz2-x0e.google.com with SMTP id
 41be03b00d2f7-cc4cdc0d663so583150a12.3
 for <qemu-arm@nongnu.org>; Fri, 25 Sep 2026 14:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790373014; x=1790977814; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HjvMgLvn6RxvJ1HkJmkAi10BB8HJCknUmwx4RHgl8vg=;
 b=W+kBjCCui7sxmrFsowntgW4KC7C8DkhLEQTx6RNoYoazqS1OMuqBmzUD5FRdE2/enI
 HreAtaxgNdGPlrpH7PM20SAR7bebuksDnCm44cJqTogfasAwkcv1876hnStjgWa4EDEl
 ugjiLK4WlFncmsNCsPxsnB+YheUDjUPt4jqqVAHxnyoQPbSca5gRq/SnWbfRx/swpRaj
 swdL5TyiShphOz1oklHt03dVZGU3i5H4NBeQfEaVSbuQdilG387lES8X9olyyjXWYfc6
 nh4mRwi2EKkE2CjzgyTFvVVFUReJVwk3od8j9HegwHVnjc5XuFuiJzg0dPCtLoy2f6QW
 u7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790373014; x=1790977814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=HjvMgLvn6RxvJ1HkJmkAi10BB8HJCknUmwx4RHgl8vg=;
 b=qZVA9Qts0XxuRJgKRkoWG+0oZG+e+sH2IOTpzLdtG8XS/xEbQrJG9yhrnTPkh12A6p
 mUfQN5NoNmSd9v4kJnKKnX1H9UUXyGVzpluX27rfeOHfSajVeorOFoxnsV91hFkWOPvE
 nwAv0c5xyO4E/1s3iJjZWqdPGi7Tp1DDkZJkBLAzTatxqn6f0+j2dkj59/bcanrNkZf/
 /QcrCjTLo17pxdeibbWzg+FuJLbizgOutlIYlRVfYilK6ArwzOyccKTa3hohxP/j49yL
 vTo4w+61jMq5OWJi8oSEA9f06yEcQhUjNBlEfyez6VHBMoLlB6Vmb40OpQz5CHM9GVEw
 oSSg==
X-Gm-Message-State: AFuF++mLsxXn56xp8nDgw7j2X58iJ4oPy28a+kqIYl7QWBwGeiFWD6U/
 y2e0aycAb55WGAoLQLDuyFffLI+vFG1TBoctyTJmRguGlLbSG06b0FxgXgnDrrP1WEjwGRX2grG
 Pzw0Y
X-Gm-Gg: AYBFou1J/e+h/USJtkNK6H5sEiTuv6X8b3XFRk0I9118HhQ95FvF0NxGKyT2FpwkP1z
 80lwD1miXOi/w463VWtZIzP/Js59C6l4CPN8jocLfeWiIw2fDZS1rx1QzP43OUJlHhzBUAlZ7nG
 sqZMuiXWSUh7hh7Jloag8BJ+7L71mVxy+LY05zpW5W0U9CpOYBDkUD5ZawBHU9IWDpejQGzDlbV
 21DIrCTGIhM9GkzikeUqJ2/Qkn2PKFfHVEkt5kaPNUEza0eOSLrHxm90UggSZs75IizymLdYAlE
 KcoVhAOM0jpVKtXKm6l3V7vdbqXiN3s/0BwKAkKKU3+GVL1ADYt/+kHNQ7iZOFNISzB0jQVQxc6
 6Jr1Kkn6J61y4ZmOjHKK4IfP+2VJK4Ny1WXWkYHFT4C7TPNiz0yjRYjGF09ZrZbTCDTj8FTswNG
 Dm69IjiGNktTnNk5cNm1qEPT+VuNK5D3caXSY42bimPGWNOn2OTdXA7b97oXYf4LYOOcrtMYFjy
 mQgVMMZmArA2Hmrd/YPm3Cy/XYH9w==
X-Received: by 2002:a05:6300:8053:b0:3de:1b92:a4dd with SMTP id
 adf61e73a8af0-3de1b92c673mr4038503637.18.1790373013703; 
 Fri, 25 Sep 2026 14:50:13 -0700 (PDT)
Received: from stoup (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-87fea1940ecsm1725256b3a.13.2026.09.25.14.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 14:50:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 08/14] target/arm: Clear PSTATE.UINJ when taking exceptions
Date: Fri, 25 Sep 2026 14:49:58 -0700
Message-ID: <20260925215004.456336-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925215004.456336-1-richard.henderson@linaro.org>
References: <20260925215004.456336-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pz2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Clear UINJ when taking an exception.
Clear UINJ when exception return is invalid.

In both cases, perform the clear without feature check,
since the bit is otherwise RES0.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h            | 1 +
 target/arm/helper.c         | 9 +++++++++
 target/arm/tcg/helper-a64.c | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d36611e04a5..735e777d103 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1579,6 +1579,7 @@ void pmu_init(ARMCPU *cpu);
 #define PSTATE_Z (1 << 30)
 #define PSTATE_N (1ULL << 31)
 #define PSTATE_EXLOCK (1ULL << 34)
+#define PSTATE_UINJ (1ULL << 36)
 #define PSTATE_NZCV (PSTATE_N | PSTATE_Z | PSTATE_C | PSTATE_V)
 #define PSTATE_DAIF (PSTATE_D | PSTATE_A | PSTATE_I | PSTATE_F)
 #define CACHED_PSTATE_BITS (PSTATE_NZCV | PSTATE_DAIF | PSTATE_BTYPE)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c3f607e6d6b..0111cbeac03 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9606,6 +9606,15 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
 
         env->condexec_bits = 0;
     }
+
+    /*
+     * R_XKSNJ: If FEAT_UINJ, PSTATE.UINJ is set to 0 *and* the resulting
+     * value stored in SPSR_ELx is 0.  The new PSTATE is automatically
+     * handled by construction of a new value from 0; clear it from the
+     * old state and as UINJ is RES0 otherwise, skip the feature check.
+     */
+    old_mode &= ~PSTATE_UINJ;
+
     env->banked_spsr[aarch64_banked_spsr_index(new_el)] = old_mode;
 
     qemu_log_mask(CPU_LOG_INT, "...with SPSR 0x%" PRIx64 "\n", old_mode);
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 9d805231a08..f76d89990c3 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -764,10 +764,12 @@ illegal_return:
      * mandated behaviour:
      * restore NZCV and DAIF from SPSR_ELx
      * set PSTATE.IL
+     * reset PSTATE.UINJ
      * restore PC from ELR_ELx
      * no change to exception level, execution state or stack pointer
      */
     env->pstate |= PSTATE_IL;
+    env->pstate &= ~PSTATE_UINJ;
     env->pc = new_pc;
     spsr &= PSTATE_NZCV | PSTATE_DAIF | PSTATE_ALLINT;
     spsr |= pstate_read(env) & ~(PSTATE_NZCV | PSTATE_DAIF | PSTATE_ALLINT);
-- 
2.53.0


