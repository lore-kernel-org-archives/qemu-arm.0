Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp380632lfb;
        Thu, 2 Sep 2021 08:34:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy64AuwjU1DhfQkU3tEp5iMvitDOQMXQSk1pGvwVVIklBrwZuM37Mava4qP2vgqJcVcGdnm
X-Received: by 2002:a5d:5452:: with SMTP id w18mr4451207wrv.221.1630596875448;
        Thu, 02 Sep 2021 08:34:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630596875; cv=none;
        d=google.com; s=arc-20160816;
        b=Wc7wNupbK1s5UNl/WluAiTbSr2fkI4H/gLLxmDWCxH/zDnB14pKpXMI+B5wPxpAT3x
         tuWhTlTBBqVURJJxTa8cShwCmonIvP5DJ4KbVCbhEmTX98nAhzWQ1N85gjVrU9+qkvhH
         6xvXlJ5ZdVS8Uv3Dxjj5khdvU1vcsCnJocxA36Gco2zJP9uELsPZSot6zkWb3LxeLslN
         9H76zDC2qInoZCVuPFpVkCv4Ncl6IBSnCPFmHO+tj8lRBpVlT/77Nqpb3juMYMc5/0On
         DQPNvq411X/ET0lAm2SjNcVmvP60Sg+1JtxeOCE5W6FXa2weyawGgU+VGtvYrm8Hyg1Y
         KtoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sS3i2uWlhC6Th2tekPb4X1SgXpgkBQycKSoBAZ7tQRs=;
        b=ZlhcnCiSJaDL9FChYcLZXpD2yVhE3zn4XZvj4ac87xyTF93YWQMPntrtYJ2Gcyod7D
         Y2ar6Za/86BTTRW1h2HafrJEMg+Yw2EoQwTTVn9/tZSv3TmJxIa1KBTzMqhr7LApdRR7
         ra4xx0UyyKCD8+yTVSH7futr0sAO2c34s6WStUVsJG8TQXbcPAhk4oOLg9eYuuQCoLSb
         eEeVvRj8p00UW/KOdAGs8yPBbezpuS9UL4Z0gYPz+3RhWKY5ArSU2FsDuuyvggADDvAA
         5A2tSWaMAFnxTYws5KL3Ii1QEbx6evpF8jmwdMQpRKxsCwmNG3OiYLprAQOKh+0RpxqX
         bIIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=I0cbESj9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11si2330288wmb.180.2021.09.02.08.34.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 08:34:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=I0cbESj9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLoja-0006Fc-Dy
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 11:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoTj-000439-3s; Thu, 02 Sep 2021 11:18:12 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoTg-0002KW-OF; Thu, 02 Sep 2021 11:18:10 -0400
Received: by mail-wr1-x435.google.com with SMTP id n5so3500403wro.12;
 Thu, 02 Sep 2021 08:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sS3i2uWlhC6Th2tekPb4X1SgXpgkBQycKSoBAZ7tQRs=;
 b=I0cbESj9MYfyAom2FvW1CF5AEhM1SW84X3lw3qtfipSZ5fPsIZv+smVyU9GoN5CLH/
 KFHhUhGgNcosASgg2d0J4AdV8UXNCvxTNWjk8PeGuYtMiNyN6AJrrsZLXmABwG5dZ6lB
 8bRALf1eTZfjstnXdJCKwssHXy6wXTM76v608XnZk9x6BIwOtk3PO6obcKrJH0ufiTcc
 W2x056SigVvWsY9uBzEPVdONxKCIoYgTNGOJNBUyoPX4Xva2AAAuMoQc267eb1xsMKYI
 MOjHbNVBLRFk1LA7ArYb3vM/2HQtFULqEESZGgc/xgjtrsvqz1SnRFmOnCq/FvVIT+Mv
 FfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sS3i2uWlhC6Th2tekPb4X1SgXpgkBQycKSoBAZ7tQRs=;
 b=gN+VhsZsSo4e50T5JXiicNt63U+cy6T9vC2UD97sf97K3thtmDg75M3S7kmMpNOl9b
 B+GrsEKqx+wwi9lQCLrvf+6S1zmTUnxPQTxQxZ5IGPzVhiqiqSCJ2IZ73saCdhpIFWxC
 +pQ2tnYXQX+0pys25M2UratU28InbaPxY6cxhGZwnZ5IzWt/YTL+FNn4yh1C5thrAxde
 dRdfOTlCPGjTEaoQCADByRav9rUmibJKmP23DkJUWxqdsBUayFAEG/LPbbCRslJNziu0
 fWfQaBhnb4AzEcSCm2Nj37xi2Q/mPlFwwGcIf0wWT+LsUs6MzlG3vRjA8SFdJPc2fH1g
 9jHA==
X-Gm-Message-State: AOAM530A71ob/LB/0fOCQgXPwg8cKdyUQhgRWghoxeLqt9odDvn/Irmq
 HtMlwTYcllPHigxSpC8qTQRCUCkqPZk=
X-Received: by 2002:a5d:554e:: with SMTP id g14mr4407181wrw.48.1630595886267; 
 Thu, 02 Sep 2021 08:18:06 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 n5sm1870776wmd.29.2021.09.02.08.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:18:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/24] target/cris: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Thu,  2 Sep 2021 17:17:00 +0200
Message-Id: <20210902151715.383678-10-f4bug@amsat.org>
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
X-TUID: hYu5sxCmb6t3

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/cris/cpu.h    |  2 +-
 target/cris/cpu.c    |  4 ++--
 target/cris/helper.c | 17 ++---------------
 3 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index d3b64929096..be021899ae8 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -185,11 +185,11 @@ struct CRISCPU {
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_cris_cpu;
-#endif
 
 void cris_cpu_do_interrupt(CPUState *cpu);
 void crisv10_cpu_do_interrupt(CPUState *cpu);
 bool cris_cpu_exec_interrupt(CPUState *cpu, int int_req);
+#endif
 
 void cris_cpu_dump_state(CPUState *cs, FILE *f, int flags);
 
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index 70932b1f8c7..c2e7483f5bd 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -205,20 +205,20 @@ static const struct SysemuCPUOps cris_sysemu_ops = {
 
 static const struct TCGCPUOps crisv10_tcg_ops = {
     .initialize = cris_initialize_crisv10_tcg,
-    .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .tlb_fill = cris_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .do_interrupt = crisv10_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
 };
 
 static const struct TCGCPUOps crisv32_tcg_ops = {
     .initialize = cris_initialize_tcg,
-    .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .tlb_fill = cris_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .do_interrupt = cris_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
 };
diff --git a/target/cris/helper.c b/target/cris/helper.c
index 911867f3b48..36926faf323 100644
--- a/target/cris/helper.c
+++ b/target/cris/helper.c
@@ -41,20 +41,6 @@
 
 #if defined(CONFIG_USER_ONLY)
 
-void cris_cpu_do_interrupt(CPUState *cs)
-{
-    CRISCPU *cpu = CRIS_CPU(cs);
-    CPUCRISState *env = &cpu->env;
-
-    cs->exception_index = -1;
-    env->pregs[PR_ERP] = env->pc;
-}
-
-void crisv10_cpu_do_interrupt(CPUState *cs)
-{
-    cris_cpu_do_interrupt(cs);
-}
-
 bool cris_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr)
@@ -287,7 +273,6 @@ hwaddr cris_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     D(fprintf(stderr, "%s %x -> %x\n", __func__, addr, phy));
     return phy;
 }
-#endif
 
 bool cris_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
@@ -319,3 +304,5 @@ bool cris_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 
     return ret;
 }
+
+#endif /* !CONFIG_USER_ONLY */
-- 
2.31.1

