Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1038470lfp;
        Fri, 24 Sep 2021 02:47:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEXtRomyR1tWcnb8ewS+FIEJGhJNZmCIO2Cm8kml+p3CgrCAwOJ+WRoftEY4/mu9ouVih8
X-Received: by 2002:a05:6e02:1c84:: with SMTP id w4mr7558047ill.219.1632476839210;
        Fri, 24 Sep 2021 02:47:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632476839; cv=none;
        d=google.com; s=arc-20160816;
        b=CevNFhHXHbU60TaXtN9gsgOGvFivtj9tkU8k8OtI2vSuhq3keg9DxRqF9SIStkw1By
         DJHJOix3zs0RTKtcdudSMUyK+hmKP9SldPfr31vAh+G9v3JFjx4Cu3/8/42F3J37YILI
         tpuVYGHq1D/SvLz2yxsJ4hHzbs0vKKTW/bteYdfHBMp7ZhDndcAdkl+8KE/DjzzmCSGW
         /KrqIUZ19ojLxf2sizDk62LPzW72+ULcU9RuDfIWbG5ow9Pz9lvwvssX7cv9LvQyXSp7
         9jX87mlWjNdpOfJUSIs3Ue0uiIiOqpKTWD52fUPVL2qEhqcG4kLDmb/QQF9Yq4nQqqHG
         qeNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=138lKCCsDusDobsjTqkgHXFS+q7YngmR9S6d2RdS3Vk=;
        b=IFqFjPTuiLk6D0HzIcSf7Oi/lNVk4ifRuPIStGAKO71LYYD3pqEe5iM/Wb2V81IU5C
         nBGohaeXJFSfB4rUTHo/6jDJSspfCdJqh9nIMJ6hfhr9mDnHr2Rn4r10K6/iyKwfVRlR
         B94D5tE1z2djQA1axL3vtizC3VsM+MrK1c1xv7VB3aMcXe6R9nFiwcfTPl+aA1IgWPZW
         P7e52t2yNCs5mx3EXGeiCX49du95IJg3FQrHb1+K4YPGDizyjw2pAdmtu8dy2s6cp5fF
         BnyAThhn+RNJ69LdKRqWE2+1uLfjAw2qTlFemch24DkC8bQhTCakHNzMm4P55eZ2EQUY
         1+IA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=lypblXQg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v21si10876950jat.0.2021.09.24.02.47.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Sep 2021 02:47:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=lypblXQg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mThna-0007MN-Ip
	for alex.bennee@linaro.org; Fri, 24 Sep 2021 05:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThgn-0004zv-Sh; Fri, 24 Sep 2021 05:40:17 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThgm-0006xh-9e; Fri, 24 Sep 2021 05:40:17 -0400
Received: by mail-wr1-x42d.google.com with SMTP id w17so25396090wrv.10;
 Fri, 24 Sep 2021 02:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=138lKCCsDusDobsjTqkgHXFS+q7YngmR9S6d2RdS3Vk=;
 b=lypblXQgni2MLkl05r8H44c+0FOKn+nARJAdFkzwDpwtIyvHpqTey9VZZuaOGHb5Wf
 Z7pchjExeKF/vaHiW9+23NWPiIpPcIrWeP9YV8EFz4ujtbg35rog0burb9GK3SuJSPww
 R4IXwvbpZ6eaamT8wQjtzx4x2+GbRz+oaRgfuZOZ4d/hOTut4sMgFZ2LY2q7fe+G8t/f
 OqY9Qkt1S6n6AxrLmAkXjN8DO69azDNb8JB+5aSNRQdDySV52uyepCnk9xEHX16C8CfF
 EbVtowKnr49CuvfvrIJitXWog072b3VL+Xq6Xh+5E//s6+40Ey6P7mMkc2IhhQcycriN
 L2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=138lKCCsDusDobsjTqkgHXFS+q7YngmR9S6d2RdS3Vk=;
 b=zkLplrE23ZxGyVHKvyFj/G3JwFl3TmANQUB4ac2d6/bazPhzpSUAPApwZwWwXPnt4L
 28P/BLP5leH2g9dWMCn5jY9dSTOES5xDclQGG8RXFF2BxMk/x8GNFau3WMVteVYBAgM1
 uXAbnJ5ENFHvHjH6xcMY2AoyH44SO+yCoh90MTH0rvc+nDJSSZf6vr29Q9YVU7bT5E8m
 WCO38FuWAbguH8fcMGrppgASyLO9pUpRd/SVxRnRBHAAwTvWMiISgxy3ye4q5ZP55m+B
 YRnbklARmFTwur64DfZKl9ZRqBw4HHon0TVzua5WLl/b8tzri0RYPe7xu4f/tCL63tZX
 UI7g==
X-Gm-Message-State: AOAM530oHOGvlknShvGJY+Q6THL6X1B4GOErkZFuExwCioSr94L6P/mv
 +mPFN4K34bLiR5WHAkNn/lMmVm0Sci8=
X-Received: by 2002:a05:600c:3209:: with SMTP id
 r9mr1041690wmp.35.1632476414383; 
 Fri, 24 Sep 2021 02:40:14 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 o17sm7541189wrj.96.2021.09.24.02.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:40:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 18/40] target/arm: Restrict has_work() handler to sysemu
 and TCG
Date: Fri, 24 Sep 2021 11:38:25 +0200
Message-Id: <20210924093847.1014331-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7k3C/xMYQ/lh

Restrict arm_cpu_has_work() and has_work() handler to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/internals.h | 4 +++-
 target/arm/cpu.c       | 7 +++++--
 target/arm/cpu_tcg.c   | 2 +-
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 864b5ad4cdf..29bb815100d 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -175,9 +175,11 @@ void arm_translate_init(void);
 
 #ifdef CONFIG_TCG
 void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
-#endif /* CONFIG_TCG */
 
+#if !defined(CONFIG_USER_ONLY)
 bool arm_cpu_has_work(CPUState *cs);
+#endif /* !CONFIG_USER_ONLY */
+#endif /* CONFIG_TCG */
 
 /**
  * aarch64_sve_zcr_get_valid_len:
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 4b08f717f64..53c478171ac 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -74,8 +74,8 @@ void arm_cpu_synchronize_from_tb(CPUState *cs,
         env->regs[15] = tb->pc;
     }
 }
-#endif /* CONFIG_TCG */
 
+#ifndef CONFIG_USER_ONLY
 bool arm_cpu_has_work(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -86,6 +86,9 @@ bool arm_cpu_has_work(CPUState *cs)
          | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ
          | CPU_INTERRUPT_EXITTB);
 }
+#endif /* !CONFIG_USER_ONLY */
+
+#endif /* CONFIG_TCG */
 
 void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
                                  void *opaque)
@@ -2035,6 +2038,7 @@ static const struct TCGCPUOps arm_tcg_ops = {
     .debug_excp_handler = arm_debug_excp_handler,
 
 #if !defined(CONFIG_USER_ONLY)
+    .has_work = arm_cpu_has_work,
     .cpu_exec_interrupt = arm_cpu_exec_interrupt,
     .do_interrupt = arm_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
@@ -2059,7 +2063,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, arm_cpu_reset, &acc->parent_reset);
 
     cc->class_by_name = arm_cpu_class_by_name;
-    cc->has_work = arm_cpu_has_work;
     cc->dump_state = arm_cpu_dump_state;
     cc->set_pc = arm_cpu_set_pc;
     cc->gdb_read_register = arm_cpu_gdb_read_register;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 9a0927ad5d0..7d0d9fcbc79 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -902,6 +902,7 @@ static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .debug_excp_handler = arm_debug_excp_handler,
 
 #if !defined(CONFIG_USER_ONLY)
+    .has_work = arm_cpu_has_work,
     .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
     .do_interrupt = arm_v7m_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
@@ -920,7 +921,6 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
 
     acc->info = data;
 #ifdef CONFIG_TCG
-    cc->has_work = arm_cpu_has_work;
     cc->tcg_ops = &arm_v7m_tcg_ops;
 #endif /* CONFIG_TCG */
 
-- 
2.31.1

