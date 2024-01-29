Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp298215ejk;
        Mon, 29 Jan 2024 08:48:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjxFAXGy9C234rosPYKOpD+t680Z8ZI+t99bPzD5NPVAnTj83aZ8WaQRhpM2hfALfAxnmp
X-Received: by 2002:a05:6402:26d4:b0:55d:2e25:52bc with SMTP id x20-20020a05640226d400b0055d2e2552bcmr5311135edd.8.1706546925538;
        Mon, 29 Jan 2024 08:48:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706546925; cv=pass;
        d=google.com; s=arc-20160816;
        b=KrbJQlRlmEVGOKLa2RnEKCpYzAKT8kqQmk8HSngYH8xddhe9qAuNgOEZmiwyTW9TEL
         uNeL2hCxfJQUMWvgd96h1ucIL/4R8aoZr+abYzsOyDvmLOAIHrcUjNo637GnMn4j8iBJ
         8FSwje+YkADfio1dmGq1AArGpvb79GTtNfJJIWlF3WMiv3WomuY10JW7QEhu++h/I6Wu
         6pRfQvRTN7sPQrhasatPCdlPCja14ywfQW9fL1pItMYUuJC/ZNM0rVgYNHq5zCoEm5dw
         HhxgmYs1kNi3DCVXemYI+r8EUODhmbtRcsE/MiXrtYNCJLRzHqGNaslDxFEmUT6LeDsU
         doKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=EK1f6yC+2+7tJRqq8zpOFY9o0Gec7K9NU3Dea7XiVcs=;
        fh=lLtufIS5JaCTKDxgV8fHPhJVpIAkrv0XCm/sFLfPF5A=;
        b=lteZ8LQikFbWe/h3rqnZxvuwLCGc7+uccceudhZ+CWxGKjlsRLrzSxFjHCATeQewgO
         C95DPZT+phnCFm71L1wfYNCSmF9IR0GZhUE+sPJlKkc0pdv9d3HU/8RSjBx4Fr8P6Flq
         M/d7ym/ByixY3M4JY1plsPtQhQ/KaJ0ZNUJ6TJZo0+00spwIckVEHHa46muhjNuSLUru
         0u8468Mil5YZeZWdRIAoJB46MbAiijDwod5LPyodN+UgRv2zNZ6EUM90woz4H/u/QQ55
         7twFD1BADB0SNrtP5ddBHhKX7qVYSLojkQcAijCaSDB/2cua7QDvllTkiuV/n8JECqIZ
         9Uzw==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I1ja0EHK;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7371-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-7371-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-7371-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id y20-20020a50e614000000b0055371b94b83si3637232edm.53.2024.01.29.08.48.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 08:48:45 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-7371-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I1ja0EHK;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7371-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-7371-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 164971F22F4C
	for <alex.bennee@linaro.org>; Mon, 29 Jan 2024 16:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570BC157038;
	Mon, 29 Jan 2024 16:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I1ja0EHK"
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B09E15697A
	for <kvm@vger.kernel.org>; Mon, 29 Jan 2024 16:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706546875; cv=none; b=iNcRn/MgwsiKWbDsgyXvdvHHCfuLOErpVSIfyAbmDhe2branGPr9/x+w1ysDSEblHrQaOSYKCaN+qXwY7zfnmE2tucn++kY1Y+Bj0ZC+Yf2nwKK3qY4rrL7+T4Tz8QSDVchj9/IojVSA7R0xHg4rq6ijX+RlJisuyAlnI3Ov0H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706546875; c=relaxed/simple;
	bh=UBkk+/BtZa69DjzToQqaRNc2CnE+1uD9qBKBMq62gtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CjNTL4rs/REuF6gGyGrCczziG5DNcqtjslrY+lz+QE8Jwe8Dq1wl88B3G/ihfarPWC4SOVbBfCmIJUrhDsZFPf/fTZbbBZonP3W1gXcclUAfRv//mNua3dxU8PNGB9iffNGopJjE8Mca0LKSXFEbl42G5xPY1xwlpnvFzcYVTOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I1ja0EHK; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40e80046264so41021205e9.0
        for <kvm@vger.kernel.org>; Mon, 29 Jan 2024 08:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706546872; x=1707151672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EK1f6yC+2+7tJRqq8zpOFY9o0Gec7K9NU3Dea7XiVcs=;
        b=I1ja0EHKB9QAdLM/vDSExFmhVudlFw7DiDa4RcrZ59pJF7NiFIbxlC5HN2ksDpCBGc
         Cpe9SOqdGvQtKr0jsA6pLO1xxmWXTR8sgdGsgewWrMHYlcp7p2Par5/6+WLIYUQ24Dzf
         BUPvGIimGgej636B32mD4q/4bZgk1Gb0Icn5cDa/8DelaDYvV9xwiIBxFYIm7qF8EIA4
         rfXfE9UM6orVpbKD8PD7O19iQtoFl9Fsk0pc6Nfbsd1Ik8yxxqi6DUILVB+y7cS6tkNu
         I4SycgyKn7xlEkGvKoRvE644w6yW63lV97srv+8AnYTBM3pXRdx+BDPkPnZvokJ8/n7T
         DNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706546872; x=1707151672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EK1f6yC+2+7tJRqq8zpOFY9o0Gec7K9NU3Dea7XiVcs=;
        b=axrZOLg0XNWCKxx1z3tPc/R5scYPEuqCbTY2T99S2KcRkbc3zH6Kh7e1vxlbTEvGDO
         UWUE5idi0d/lcr6M+PIprc8eeIb1S5SwJasXo5jcI/s5SZITX4nc2Qmpp+Eh7ai0ic9B
         sxl3+fg6H8YbxzfIglB8mRnJDmQnu15J3851zxxxYgg7AakzCKHQW0M/UUQi7K9alExg
         Xxt7VjX0YcLLf1lNFFRzbQC7vq3Q8Gl8nVVOLHKjDgBQA8Dz0yx9N9h9poUUH5/tVHPP
         dhY5um64O1AKcffkOSIDYEK7ArT0HO/FqBe7q8C/T4RmsTt2elsYY322m2P+cX4O7Six
         8uwA==
X-Gm-Message-State: AOJu0Ywk9v9ZCDMz8KXHz9lWFTRwIVsiNNqzf/sgPua6SiboT68syCWz
	NVh/6h5B+H5uySkdIMRfL/dpriKCT1dKI5vHXoIiLnQWcihIJg8lPsI3DUUwYAc=
X-Received: by 2002:a05:600c:468f:b0:40e:cd0e:f749 with SMTP id p15-20020a05600c468f00b0040ecd0ef749mr5338733wmo.28.1706546871830;
        Mon, 29 Jan 2024 08:47:51 -0800 (PST)
Received: from m1x-phil.lan ([176.187.219.39])
        by smtp.gmail.com with ESMTPSA id k7-20020a05600c1c8700b0040ef3ae26cdsm5224770wms.37.2024.01.29.08.47.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Jan 2024 08:47:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH v3 25/29] target/sh4: Prefer fast cpu_env() over slower CPU QOM cast macro
Date: Mon, 29 Jan 2024 17:45:07 +0100
Message-ID: <20240129164514.73104-26-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240129164514.73104-1-philmd@linaro.org>
References: <20240129164514.73104-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: B+TcFzHLIQZi

Mechanical patch produced running the command documented
in scripts/coccinelle/cpu_env.cocci_template header.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/sh4/cpu.c       | 18 ++++++------------
 target/sh4/gdbstub.c   |  6 ++----
 target/sh4/helper.c    | 14 ++++----------
 target/sh4/translate.c |  6 ++----
 4 files changed, 14 insertions(+), 30 deletions(-)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 1b03c7bcb1..3308a2be07 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -71,8 +71,7 @@ static void superh_restore_state_to_opc(CPUState *cs,
 static bool superh_io_recompile_replay_branch(CPUState *cs,
                                               const TranslationBlock *tb)
 {
-    SuperHCPU *cpu = SUPERH_CPU(cs);
-    CPUSH4State *env = &cpu->env;
+    CPUSH4State *env = cpu_env(cs);
 
     if ((env->flags & (TB_FLAG_DELAY_SLOT | TB_FLAG_DELAY_SLOT_COND))
         && !(cs->tcg_cflags & CF_PCREL) && env->pc != tb->pc) {
@@ -92,9 +91,8 @@ static bool superh_cpu_has_work(CPUState *cs)
 static void superh_cpu_reset_hold(Object *obj)
 {
     CPUState *cs = CPU(obj);
-    SuperHCPU *cpu = SUPERH_CPU(cs);
     SuperHCPUClass *scc = SUPERH_CPU_GET_CLASS(obj);
-    CPUSH4State *env = &cpu->env;
+    CPUSH4State *env = cpu_env(cs);
 
     if (scc->parent_phases.hold) {
         scc->parent_phases.hold(obj);
@@ -144,8 +142,7 @@ out:
 
 static void sh7750r_cpu_initfn(Object *obj)
 {
-    SuperHCPU *cpu = SUPERH_CPU(obj);
-    CPUSH4State *env = &cpu->env;
+    CPUSH4State *env = cpu_env(CPU(obj));
 
     env->id = SH_CPU_SH7750R;
     env->features = SH_FEATURE_BCR3_AND_BCR4;
@@ -162,8 +159,7 @@ static void sh7750r_class_init(ObjectClass *oc, void *data)
 
 static void sh7751r_cpu_initfn(Object *obj)
 {
-    SuperHCPU *cpu = SUPERH_CPU(obj);
-    CPUSH4State *env = &cpu->env;
+    CPUSH4State *env = cpu_env(CPU(obj));
 
     env->id = SH_CPU_SH7751R;
     env->features = SH_FEATURE_BCR3_AND_BCR4;
@@ -180,8 +176,7 @@ static void sh7751r_class_init(ObjectClass *oc, void *data)
 
 static void sh7785_cpu_initfn(Object *obj)
 {
-    SuperHCPU *cpu = SUPERH_CPU(obj);
-    CPUSH4State *env = &cpu->env;
+    CPUSH4State *env = cpu_env(CPU(obj));
 
     env->id = SH_CPU_SH7785;
     env->features = SH_FEATURE_SH4A;
@@ -216,8 +211,7 @@ static void superh_cpu_realizefn(DeviceState *dev, Error **errp)
 
 static void superh_cpu_initfn(Object *obj)
 {
-    SuperHCPU *cpu = SUPERH_CPU(obj);
-    CPUSH4State *env = &cpu->env;
+    CPUSH4State *env = cpu_env(CPU(obj));
 
     env->movcal_backup_tail = &(env->movcal_backup);
 }
diff --git a/target/sh4/gdbstub.c b/target/sh4/gdbstub.c
index d8e199fc06..75926d4e04 100644
--- a/target/sh4/gdbstub.c
+++ b/target/sh4/gdbstub.c
@@ -26,8 +26,7 @@
 
 int superh_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
-    SuperHCPU *cpu = SUPERH_CPU(cs);
-    CPUSH4State *env = &cpu->env;
+    CPUSH4State *env = cpu_env(cs);
 
     switch (n) {
     case 0 ... 7:
@@ -76,8 +75,7 @@ int superh_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 
 int superh_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 {
-    SuperHCPU *cpu = SUPERH_CPU(cs);
-    CPUSH4State *env = &cpu->env;
+    CPUSH4State *env = cpu_env(cs);
 
     switch (n) {
     case 0 ... 7:
diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index 5a6f653c12..7c6f9d374a 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -55,8 +55,7 @@ int cpu_sh4_is_cached(CPUSH4State *env, target_ulong addr)
 
 void superh_cpu_do_interrupt(CPUState *cs)
 {
-    SuperHCPU *cpu = SUPERH_CPU(cs);
-    CPUSH4State *env = &cpu->env;
+    CPUSH4State *env = cpu_env(cs);
     int do_irq = cs->interrupt_request & CPU_INTERRUPT_HARD;
     int do_exp, irq_vector = cs->exception_index;
 
@@ -432,11 +431,10 @@ static int get_physical_address(CPUSH4State * env, target_ulong * physical,
 
 hwaddr superh_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 {
-    SuperHCPU *cpu = SUPERH_CPU(cs);
     target_ulong physical;
     int prot;
 
-    if (get_physical_address(&cpu->env, &physical, &prot, addr, MMU_DATA_LOAD)
+    if (get_physical_address(cpu_env(cs), &physical, &prot, addr, MMU_DATA_LOAD)
             == MMU_OK) {
         return physical;
     }
@@ -782,11 +780,8 @@ int cpu_sh4_is_cached(CPUSH4State * env, target_ulong addr)
 bool superh_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     if (interrupt_request & CPU_INTERRUPT_HARD) {
-        SuperHCPU *cpu = SUPERH_CPU(cs);
-        CPUSH4State *env = &cpu->env;
-
         /* Delay slots are indivisible, ignore interrupts */
-        if (env->flags & TB_FLAG_DELAY_SLOT_MASK) {
+        if (cpu_env(cs)->flags & TB_FLAG_DELAY_SLOT_MASK) {
             return false;
         } else {
             superh_cpu_do_interrupt(cs);
@@ -800,8 +795,7 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          MMUAccessType access_type, int mmu_idx,
                          bool probe, uintptr_t retaddr)
 {
-    SuperHCPU *cpu = SUPERH_CPU(cs);
-    CPUSH4State *env = &cpu->env;
+    CPUSH4State *env = cpu_env(cs);
     int ret;
 
     target_ulong physical;
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 81f825f125..d9f222bd15 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -159,8 +159,7 @@ void sh4_translate_init(void)
 
 void superh_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
-    SuperHCPU *cpu = SUPERH_CPU(cs);
-    CPUSH4State *env = &cpu->env;
+    CPUSH4State *env = cpu_env(cs);
     int i;
 
     qemu_fprintf(f, "pc=0x%08x sr=0x%08x pr=0x%08x fpscr=0x%08x\n",
@@ -2186,7 +2185,6 @@ static void decode_gusa(DisasContext *ctx, CPUSH4State *env)
 static void sh4_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
-    CPUSH4State *env = cpu_env(cs);
     uint32_t tbflags;
     int bound;
 
@@ -2196,7 +2194,7 @@ static void sh4_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     /* We don't know if the delayed pc came from a dynamic or static branch,
        so assume it is a dynamic branch.  */
     ctx->delayed_pc = -1; /* use delayed pc from env pointer */
-    ctx->features = env->features;
+    ctx->features = cpu_env(cs)->features;
     ctx->has_movcal = (tbflags & TB_FLAG_PENDING_MOVCA);
     ctx->gbank = ((tbflags & (1 << SR_MD)) &&
                   (tbflags & (1 << SR_RB))) * 0x10;
-- 
2.41.0

