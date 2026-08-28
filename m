Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34045C61DD7
	for <qemu-arm@archiver.kernel.org>; Fri, 28 Aug 2026 22:28:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x052G-0002p1-Bi; Fri, 28 Aug 2026 18:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x052F-0002oH-Bx
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 18:26:55 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x0528-0002JZ-UT
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 18:26:50 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2d71e253c90so14395505ad.0
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2026 15:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787956007; x=1788560807; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2MZbjMDE841td0JwucZyy0AxkAYMDGPNezkz1NHmtAY=;
 b=unaHY14J30ejDmKJINX6w5PZlnDCbo/04uFtFZqPjJzINfMiyyWKGUvP6yktuEiZ9W
 ox+j1nSz3/vQwDWcjLyN5zFQO5GXkH9yWz4iYkD48jtRvEnrlf5+RwlJYBrDemHJJyrs
 rtktJNVgmFjVjx1sJ2A8zBX7qI1x+meOnZ26ukQRQMJzDzIbwzYX7ORLkOePUlhRlgxR
 5Pq1iGqRNI1rTCto5xh7x41tIOj40pT1l0lhAqDs/KxX/CiFGJf3XTi4vBq47g8RRnV6
 UqpKfVeUrLvj9HXd+dtubNYilaDxwNlV7LhFK9jLdDe3EjyEwg+VQoY/LglsPX/PaBe1
 q/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787956007; x=1788560807;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2MZbjMDE841td0JwucZyy0AxkAYMDGPNezkz1NHmtAY=;
 b=CDBFmBIjJWLoC+UM7GZBO80PzYkgndKZUZY/eKvdbgp98+ImQpPzL0fqiNsv3qVd05
 QX520wt82P9Dqd3ZmUlySehp2FiAtAkXn3g6xcAbhZ9lx5GMhiRVvD1bJX16F0jVz8ug
 aiga15PSXUmnYEsTxJdK5UQ0vkDP/5MnxNItwxQA0iV63YqSYMAobtPMAWOAY/d4wfKj
 LKMaPv+yHHpnFt2fT+mkRvJEI7y4HqIyfSrxnI6AzXymu9USVq3+DXPcHXpjJKaBd1aV
 0kjkJYhYGuvQhUTN6uiMGkz814TX8qQjsSPF39BO0/V19h1OIPGY8RVCuM8u5fsmoL7H
 ZdHw==
X-Gm-Message-State: AFuF++nkCq2JknzGkMBC4ylXBatfCTo9BvBcK/cFzyUiql5s6tfU2kdL
 zVid0IsReOUoEBuHc6kA/uJnh4cmDztXkG7stDcDWQjrv2Dd4K/WtzX3/TSnHBRsWkeODXZKBeF
 8F15mw0w=
X-Gm-Gg: AYBFou3DbqXT6TgaZ7vHlQz8ay8uQMnnUkS7kakrUMUV57F5HsUYXAqAb6JGmyY8jqc
 1tXtrDy+4XCYi5VUvaakc0dPG22Tdjeae3ZBsuKb7U0Ayr9nB8TEwyjYeycZYYtvV+R02vhgBpb
 0TYUIr/q04ErnHf9iVHkwBRweFgV5XRttda70/j8JpIKAEYVr2ZGorfwWANETjcfWLMv0Kz2w7k
 J9EOHeUG4gZcbfh5vu0Ogjv2GCE2lfsCfZaFI+sju30N1zr+sF20dMXu2OSsBtpyRVCnbL2xMOi
 0o3hu4QKnvgmyQtF+TaNZLLfXwZkY79v5d2t6Kreu3qRFBHHQyrUM3+OQzhdhLZM7AIv8nu+3+T
 oCxjDhZzC07A4kcH60LM/ufIciybcu58WSWR1PfcdPZatLhFYST0eWddWj/jpu6y/K9y5mMQKAC
 ztw4sZkcbXH8Jko/5mNHjzXKAeTs5j1wzfXUQ204dUfnFrQ82ctk29ka6zErT6ABNYMHGupSRPC
 ccQSFwAb9KSN/RkWC6A
X-Received: by 2002:a17:903:144f:b0:2d8:d4cd:dc8e with SMTP id
 d9443c01a7336-2d8d4cddf75mr43132365ad.17.1787956007247; 
 Fri, 28 Aug 2026 15:26:47 -0700 (PDT)
Received: from stoup (71-212-39-143.tukw.qwest.net. [71.212.39.143])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d759640270sm9178355ad.34.2026.08.28.15.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 15:26:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 08/13] target/arm: Clear PSTATE.UINJ when taking exceptions
Date: Fri, 28 Aug 2026 15:26:34 -0700
Message-ID: <20260828222639.1432046-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828222639.1432046-1-richard.henderson@linaro.org>
References: <20260828222639.1432046-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Clear UINJ when taking an exception.
Clear UINJ when exception return is invalid.

In both cases, perform the clear without feature check,
since the bit is otherwise RES0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h            | 1 +
 target/arm/helper.c         | 9 +++++++++
 target/arm/tcg/helper-a64.c | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9e258fa005e..b7ee215257f 100644
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
index 4f30a94ecd3..ed6b4d985e1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9583,6 +9583,15 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
 
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


