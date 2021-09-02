Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp380190lfb;
        Thu, 2 Sep 2021 08:34:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLh4mjnWcTqCFsraUs57Yl9KETCJfBuekQk0GTElkUL7Is4p9oOYZ5jOokobmxJENFTPer
X-Received: by 2002:a05:600c:3b15:: with SMTP id m21mr3834386wms.162.1630596842549;
        Thu, 02 Sep 2021 08:34:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630596842; cv=none;
        d=google.com; s=arc-20160816;
        b=XPpIz5gMrVRPCM3K/sGbgX5roDkP9+1XLzyYqOzujUgZn8dkgxTF1PvdKRzoeeaDqO
         +a2lqBudAd5JqF2nOQYZHDtLo02d+YTvx8uVwWL2NOTi3/2FDLjBWyqqjPIprnN9zXZV
         wxKeLbIl6s5b2lFxwDESFAOnIcO4RKBb698JGd8uhnWajuPEcKU+NOtS7HvVQNNxn6Zg
         WFKk1RNffZT3/zdz5P9mLh6YeDO1UNecUm6Kf3rXZIj6b8KzZ8lNeCwNuGPXNGzhbe4P
         SjHcJzA/knE+sOd5jgNeBEVm8g4lz7sIuwTWF4SBsiNxZjEHzGKh06bslZsnZRjoUDBX
         u+Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mrF5SukyHScHMGv9yUoXnGkzs9h7YkYdd91g+an7xcY=;
        b=hcC0PNXAKjN5NOV+o1XzJjDQhFUG9Ds641n7SHcQWB2+GuSFr07stKtwoImz5hUeUa
         lo3jPw1L2SOLjcGUFPVpSMOpj0MSKrEF5Px/Szy9c9P7aNjUOiCd+Cbh97GdMh4GWZy3
         EJBQjrHLH+pMeSNYiU+UFVQq0dPmeaHP4W9Cbwi/7OWCl3/1usoavdYcerPRJ729ta8/
         h+y5gH5iB8YNNR2sfPSDqsieCfLEG+53l+kL1vmORy6mkZh6iPKPHJxybwCeV2yRMUry
         tKxj9MH4nweioUVILYFQANqCtF8kMcEEc18YK+SqnN0V0WRfyHUaApdv2unraG9K8xp2
         Cl4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="euQk/R7V";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9si2239727wmr.168.2021.09.02.08.34.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 08:34:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="euQk/R7V";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLoj3-00055H-Hi
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 11:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoUq-0005YJ-Lh; Thu, 02 Sep 2021 11:19:21 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoUp-0003KS-3s; Thu, 02 Sep 2021 11:19:20 -0400
Received: by mail-wr1-x435.google.com with SMTP id b6so3532230wrh.10;
 Thu, 02 Sep 2021 08:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mrF5SukyHScHMGv9yUoXnGkzs9h7YkYdd91g+an7xcY=;
 b=euQk/R7VP0BnZrN9o6zV1gs7ds6m9N1lH2AjKEeoccv6ueHciNiN3Y2RszeqbO2FiQ
 L+5eAFzGlhfxt12PRiCu5tgKLil2Ch8ykV6xs5paIcuijNlZf+68kePK/JwIhJ5ak/X2
 hDPC4IiBGzyusQNl6zVnOFHkPbCzgHvRRxfl6bAzdEg+yX6ryPrR+vDQMrE1aQawplPg
 Xcg2tFkELFvXSciz/SUz8DhJEWPX5UhUhylBtwVu9beyR/zKOTxFIH6ud/EwxXeQxcFd
 HDKbRulLLTMoxn/j3j54iyAcc/V+DW9gSJgVpzhSzX7eLEwWjx9u6TcROinYWsmhWSQ2
 iOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mrF5SukyHScHMGv9yUoXnGkzs9h7YkYdd91g+an7xcY=;
 b=F5Kobo9GBNwjyWlPhm2siAIw5aPASXfSN+6pk0TcWZ5MoQN70HmA3gqMEC4qYKV/6z
 3h2b6ZYHdB/Ed3LXkbzw+FGqr78EzRZAtUYvg1xyUpP99UQ7b8oGZXmxfku6WsBf2IxS
 OXTi03WMU5xoV1G/9kOjtdO8IaK7oyAUoUhUpE8H5ocJKbiBPAUhDGAKEz53Zq8e7maK
 7Ib/UZPmWdqNhZmu61To3KxkMy6cS5b3LefLrsWSfbypsLy0nWnslGZ/rD9rWleoHvcD
 nanjUAZftvRHGzsQPXMxsqDZnCP555YKsjNoZiekLH+CWHQjCRcqLA/pZ7Jd+JGFvgNR
 p+Lw==
X-Gm-Message-State: AOAM532/nle2E2z45ayoAfd6Yoc2lFl92YoBphcvFjK8EE2/XLzTH6Gp
 +OFLo8pwY1rfYwqaqeS05tBoPKy0s7w=
X-Received: by 2002:adf:f747:: with SMTP id z7mr4521974wrp.194.1630595956417; 
 Thu, 02 Sep 2021 08:19:16 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 y1sm2001968wmq.43.2021.09.02.08.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:19:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/24] target/xtensa: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Thu,  2 Sep 2021 17:17:13 +0200
Message-Id: <20210902151715.383678-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902151715.383678-1-f4bug@amsat.org>
References: <20210902151715.383678-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Warner Losh <imp@bsdimp.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dVVdHWvkSKN3

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/xtensa/cpu.h        | 4 ++--
 target/xtensa/cpu.c        | 2 +-
 target/xtensa/exc_helper.c | 7 ++-----
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 1e0cb1535ca..cbb720e7cca 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -566,14 +566,14 @@ struct XtensaCPU {
 bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          MMUAccessType access_type, int mmu_idx,
                          bool probe, uintptr_t retaddr);
+#ifndef CONFIG_USER_ONLY
 void xtensa_cpu_do_interrupt(CPUState *cpu);
 bool xtensa_cpu_exec_interrupt(CPUState *cpu, int interrupt_request);
-#ifndef CONFIG_USER_ONLY
 void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                       unsigned size, MMUAccessType access_type,
                                       int mmu_idx, MemTxAttrs attrs,
                                       MemTxResult response, uintptr_t retaddr);
-#endif /* !CONFIG_USER_ONLY */
+#endif
 void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void xtensa_count_regs(const XtensaConfig *config,
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 58ec3a08622..c1cbd03595e 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -192,11 +192,11 @@ static const struct SysemuCPUOps xtensa_sysemu_ops = {
 
 static const struct TCGCPUOps xtensa_tcg_ops = {
     .initialize = xtensa_translate_init,
-    .cpu_exec_interrupt = xtensa_cpu_exec_interrupt,
     .tlb_fill = xtensa_cpu_tlb_fill,
     .debug_excp_handler = xtensa_breakpoint_handler,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = xtensa_cpu_exec_interrupt,
     .do_interrupt = xtensa_cpu_do_interrupt,
     .do_transaction_failed = xtensa_cpu_do_transaction_failed,
     .do_unaligned_access = xtensa_cpu_do_unaligned_access,
diff --git a/target/xtensa/exc_helper.c b/target/xtensa/exc_helper.c
index 10e75ab070d..9bc7f50d355 100644
--- a/target/xtensa/exc_helper.c
+++ b/target/xtensa/exc_helper.c
@@ -255,11 +255,6 @@ void xtensa_cpu_do_interrupt(CPUState *cs)
     }
     check_interrupts(env);
 }
-#else
-void xtensa_cpu_do_interrupt(CPUState *cs)
-{
-}
-#endif
 
 bool xtensa_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
@@ -270,3 +265,5 @@ bool xtensa_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return false;
 }
+
+#endif /* !CONFIG_USER_ONLY */
-- 
2.31.1

