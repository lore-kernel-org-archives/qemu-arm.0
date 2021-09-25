Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2225850lfp;
        Sat, 25 Sep 2021 08:02:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5Gl5IxVP3r8dnQOXxvKXn//+Mh//mK7lsS+tdKGjvmMAn455gLTociPfEBRRDK9HXQe6e
X-Received: by 2002:a17:906:6d55:: with SMTP id a21mr17288273ejt.509.1632582164386;
        Sat, 25 Sep 2021 08:02:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632582164; cv=none;
        d=google.com; s=arc-20160816;
        b=SGN3FSG6MFN5fF1AGZ8fjR0OXV/3xmRc7IOLyg2bQoBmujQFvQI3nwCxtm0+DwSch5
         7mXwH6cMBxOYBwXcdvn3FOx1tuLuDcKGNGlg96S8RsHz+TSHH2rmDOKPe4UyJOcd7ZpR
         qC4eymSDoOcxAuKL2CmM/OQ8/4HVcpNrWXjsoauSYBtxBT77haVzG26TmySmjEvVrBer
         MxgyCK45DW8ESfzaTk8mDlhyS/vuqC096hu6791Z8P1U8M8UXUyu+Ez9AxtwkqIC/DRh
         POpx8F1IIJFE6LWdEBBDBA3tRCYzEkTE78FQOldYfB/UaeR0gqn40bwGiPjetFtR6zoc
         0xpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=r6ZxEtcTtXMZRq7+nFZf7Av8uL6lok+sSg0IbMh7PU4=;
        b=DOfBdKVZ6QwiSIZx93RIOgfKm18vlOjwQPcapDnaJMJQv9cJfko4cRDwgIDVnOEK5y
         KGN3L5SpON3GmCkgmN8f/9xgnU5mZcXuVA1FdF9AGiPcJl5/jF7G9dIzVfm3/Wzod9jt
         ivq7+0yGSwWqUovEA4UxwtaWymSgQcxql5OvGiwtcWHqX/RD+cszvUoXuC8qoy9Da7YS
         JTCgRlrf2VHpnpekBqkwJatau/2CrjIjYtlN3Z4XAqyb5dyomaSsKokPNesxzZae1MkD
         bWZlpaHzAZlIYgiojJ4xsRcEwHUsrHjoEuZR4tjumeqG7RTCIuuojFkOQunWhpvsPJqu
         Rf2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=eRQPfiwW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9si2874279edq.150.2021.09.25.08.02.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Sep 2021 08:02:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=eRQPfiwW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mU9CM-0000Ee-OX
	for alex.bennee@linaro.org; Sat, 25 Sep 2021 11:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU92h-00017I-Lx; Sat, 25 Sep 2021 10:52:45 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU92g-00061N-5T; Sat, 25 Sep 2021 10:52:43 -0400
Received: by mail-wr1-x430.google.com with SMTP id w29so36388250wra.8;
 Sat, 25 Sep 2021 07:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r6ZxEtcTtXMZRq7+nFZf7Av8uL6lok+sSg0IbMh7PU4=;
 b=eRQPfiwWBh8RHz/e2lyK8HgBHPIhG4W7iyEyn99sxIUf3zjaVHQWh12xeOHwYv36d3
 RSSBrR2plnhJOJ9Zhzfan4tmSoIB2r5E1GXOEiAmbzGkjKcZILjxPG+lW5Zilns/hUWd
 W4JuO6KRmNqMqPc7R3zegPEMNXXWuqP0FZNWo9VNJiC8iSRJOMd4sxhLdU7ixcgOBVU6
 UqZY5igpdYzrFTK727RTisOiisK6bBPKBfy2NGxX/nOIUa92636UY868tnoaXztnJHLa
 fALFfGs/bTDDgXg3g8k7/BfEA6XXtE2TWTvNHttNBIrs6HnfYV3Yp7HHTh5/XQawtlDf
 ln/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=r6ZxEtcTtXMZRq7+nFZf7Av8uL6lok+sSg0IbMh7PU4=;
 b=E88TLhuibt+qjbI5Szze/+bdjZHAa0+jnNDLRrHG+1btir8N231xF24UFBX4y5QJJl
 Muzm6j4woHKaBDOMJ/KnFjhY/ldzjleVy+f515n28jZYnt5HZ8DMxjw7slCWronlDV2T
 oDvIi2h8FhhSczj9gN5JFJOb6OcC3KfIhUQlMk55ZuaY2us+GLhbxAqVG5HwLzE0hKKF
 08PsKKXaWJUU0s1rtzwNGJdu8COk9YWDTSWCF/IknDlywEUPosZBnx/1ZGPrBSqY5LF0
 x0bhuiQ+P+z2E+6M7bNYvJ/jshMRlP+vfNPs6gBpHaVNyCAFktEXeraAp+z2h6Mh49GU
 LGIw==
X-Gm-Message-State: AOAM530yRz1l0uX7sczEX6TE040HBJ9LwCK4y1vXSSEq+amE+XNqQv1F
 6kWfw2fxeznqOtmMxUu/N93NdBoCL/0=
X-Received: by 2002:a7b:c442:: with SMTP id l2mr7593370wmi.131.1632581560483; 
 Sat, 25 Sep 2021 07:52:40 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 n14sm9892246wmc.38.2021.09.25.07.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:52:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 17/40] target/arm: Restrict has_work() handler to sysemu
 and TCG
Date: Sat, 25 Sep 2021 16:50:55 +0200
Message-Id: <20210925145118.1361230-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
X-TUID: nCHoZDUX4W57

Restrict arm_cpu_has_work() and has_work() handler to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/internals.h | 4 +++-
 target/arm/cpu.c       | 7 +++++--
 target/arm/cpu_tcg.c   | 2 +-
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index f20aeb97fa0..18b3c2bf1ea 100644
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

