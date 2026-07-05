Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDE9C43458
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Jul 2026 04:50:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgEfI-0003t9-Ny; Sun, 05 Jul 2026 00:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEfG-0003kt-5i
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:41:10 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEfD-0006Nv-47
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:41:09 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-8423f236418so1072849b3a.1
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2026 21:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226466; x=1783831266; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cta3/Q1WePeftyAZ1tIJUWYuQmdzSHeLF7F4WBnHI1o=;
 b=yWAsna9uXGyGV6S2UrZJtHq23Yrgw+vmKPhave+E/b1+A1PoorvMQV5ZwR59I56Jdg
 0npc0W3JRE3FpjmhTGAJQ+90qfhQwjuHLt6Z3ATVRSve8PCB6jB5DyvH3ij8LdQXYPlD
 8DSK9eaTEUb8L9rZY/+nyz/GJP37mf11No83KBYgd8/oco+fP1POlbHyEPIjfRJY9Dts
 Mp1uOLvwFjd1iZ/v4UUPTg8RYTjTrZ6EsYLllRCMEQ0ruBZtF9t6fGs/P90T3Vb5QUj6
 MoyEnAQy0gZld6/TqS7tU7A8MUCobMAj2uUxcCbb3mHxyP02zDG4irSYbkbrb7F0Hd0P
 cPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226466; x=1783831266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=cta3/Q1WePeftyAZ1tIJUWYuQmdzSHeLF7F4WBnHI1o=;
 b=dcMUJZrJynia3vASI+VmOB0hKoHu7FRZ7ffcrUDFR9+PFvkPqsOPM5ncUJfe/VNsfK
 JCAjFA+6nLT/WEL4XG3RXzKcuWXliz0ML10uQpMN4iw9iAtGUvuy3mYs2WVgi2uy+uaW
 kkcyMPKHGzp9BxVIAgOR88k99wTgc+6r4olim4oCpbGkA4zvqkWXF0FwFVEgk7qgI9H7
 mTtMa/Ruq5lyn3nbtHpJKOSZxabhU9EdNdgUpYeSBPF4gCFg9XoIfy1x590e6DDrsMfM
 DbynP40tn0Z8sNiMI8ZYcv8FAA/NkV5d+o2Q/AvNNmHNyudKYMLXrTjNn5t91/qzk1vx
 PwnA==
X-Gm-Message-State: AOJu0Ywhs88UaCGbZyBpfwGRR+HSyf4RRhbgc6g4U8AdGDF/9Kbgkil8
 15oMVT+MXeX/7VhrQv8bgzd83gXaTgglD3hV/At5vRUJoUrp16lMmKcm8JDUVohkNr4=
X-Gm-Gg: AfdE7cnCLo2b3EiHweqYHiFcpChzJ55EDA4kWEMAeT+cZSARKhqxAelMqZNxLfivvnx
 42W2TAn5zegMHnxrGs2ueX0AttupQOgRv4+aFFtHw+IOk9Fb2hfQ3h7Z/g6spWaJbuMTo4QRaUh
 hywN77T0cQA+IRPeJE3MrDF40PgwDAa9avmVHiwoLVppsomnHUhG5hXPkC8T6Bep+icaOuVAnj2
 W3hMjAPR6sTG9getkQnZL/BdC7jcIp2Cq59/G9bDX2ObzxIonODmm0nLqpf94h4E/1Ne1MYNn66
 dYlWspmZ17AX12XVkudUjr0hePE844/+luulKymh5e6BGfZptNihjD/BByDaIBHLtemlIG0DjJE
 J6IIMMr5X5OLjqhgC0YeYK2Nbe9X3HiqbfFxj94O2TYDG2EMqs/cbnM/ia0LfbDknMHVC3k4PZw
 c5xoRkUxTnYey97EOtFV+wtPLj7W+5ljjk6eqJPvZMXtAwAGg=
X-Received: by 2002:a05:6a00:17a3:b0:847:90a6:4fbd with SMTP id
 d2e1a72fcca58-847f6b5df90mr4957781b3a.0.1783226465612; 
 Sat, 04 Jul 2026 21:41:05 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6952a0dsm1952615b3a.0.2026.07.04.21.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:41:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 43/46] target/xtensa: Rename xtensa_breakpoint_handler
Date: Sat,  4 Jul 2026 21:37:22 -0700
Message-ID: <20260705043725.1373137-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Rename to xtensa_cpu_debug_excp_handler, since it also handles
watchpoints, and that's the name of the tcg_ops cpu hook.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/cpu.h    | 2 +-
 target/xtensa/cpu.c    | 2 +-
 target/xtensa/helper.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 119a0b8187..928d300772 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -592,7 +592,7 @@ void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                       MemTxResult response, uintptr_t retaddr);
 hwaddr xtensa_cpu_get_phys_addr_debug(CPUState *cpu, vaddr addr);
 bool xtensa_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp);
-void xtensa_breakpoint_handler(CPUState *cs, CPUBreakpoint *hit);
+void xtensa_cpu_debug_excp_handler(CPUState *cs, CPUBreakpoint *hit);
 #endif
 void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 void xtensa_count_regs(const XtensaConfig *config,
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index eb6758b694..82b7493ff4 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -330,7 +330,7 @@ static const TCGCPUOps xtensa_tcg_ops = {
     .do_transaction_failed = xtensa_cpu_do_transaction_failed,
     .do_unaligned_access = xtensa_cpu_do_unaligned_access,
     .debug_check_breakpoint = xtensa_debug_check_breakpoint,
-    .debug_excp_handler = xtensa_breakpoint_handler,
+    .debug_excp_handler = xtensa_cpu_debug_excp_handler,
 #endif /* !CONFIG_USER_ONLY */
 };
 
diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index aa012068de..7643e97b2c 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -220,7 +220,7 @@ static uint32_t check_hw_breakpoints(CPUXtensaState *env)
     return 0;
 }
 
-void xtensa_breakpoint_handler(CPUState *cs, CPUBreakpoint *hit)
+void xtensa_cpu_debug_excp_handler(CPUState *cs, CPUBreakpoint *hit)
 {
     CPUXtensaState *env = cpu_env(cs);
 
-- 
2.43.0


