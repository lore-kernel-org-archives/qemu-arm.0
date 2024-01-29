Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp298304ejk;
        Mon, 29 Jan 2024 08:48:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7pl7S54yUu2LLPF2wbTqrUK62bs+cftv/XN3srjAe0pZWqmm4CEM41Fq3iYNTTx2KfpMd
X-Received: by 2002:ac8:5bcb:0:b0:42a:a84e:4a6f with SMTP id b11-20020ac85bcb000000b0042aa84e4a6fmr1859131qtb.113.1706546931038;
        Mon, 29 Jan 2024 08:48:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706546931; cv=pass;
        d=google.com; s=arc-20160816;
        b=GgKFh7mIX1P8mbjs7KmSwbjXNe+4eMr3DT5L15R5m3OvnzSVmOYByZrgogdeFikHcW
         mzNRj2NfvsqQIPYY71Yxr44RmHl3rxArISUjjez4XfNj7EJ0/vb1u3+0ilektxN/opoP
         MdFEOXxkes8/yrI6oWRW0gdw3ztrhFZCbzfJfIN2UbalLf0CSOGXZkxLQGAeKduUC7DP
         rLFsuHLKpWodlEh3iL2zrrs0HLFRbGgO/7TEb8ssbIrZcZjPzdQWwBafK9m4yF9esYXO
         rjPVshhm27keoWAztUxa5yqmdXLHciacO+66FJ+8JukV9IcYwmNN6KFIH/yyawvRIuY3
         S/QQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=nDyOJncTz/gz39l44d2jGwByTaW/KG4k2gJ/GNswNnI=;
        fh=44amzVr7vzxczb4UUQI9qEGeFaWXCXisC37jDW8iwZM=;
        b=EX6jQecn0kQ7MqGPM3e1JIv9rsnas5hCQRUpgtF35WwtqTOeeLO3NJG0F9B9JhYUZW
         LCHV/V2xqZqsIPuA6vFueGOUnr30ij69J3F3uF34XqMk3sIbwgS5PKj61LWUArqvc1vS
         14wQoRjEHgLC5awPah17WIVmTiZIFe1KwTTt6yyq/LOhiLsXGohk1a6I5M0g5UrVlWhP
         2+DQgxsOo7fSBnqS9X7wb1fi40pIjlltJKA/SLeHHAs8ufem6fEF16Jbm/brEiPtWBGc
         IoWzgK0LgNY8iRuOw+dOPNopJYUBwsOCQddqxTveSxtrAcuqC8rZzYLn0pGAw8udcinJ
         dNXw==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xKaQxpdv;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7372-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-7372-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-7372-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id i19-20020ac85e53000000b00429a50c4264si7990765qtx.619.2024.01.29.08.48.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 08:48:51 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-7372-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xKaQxpdv;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7372-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-7372-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1BE11C21CD4
	for <alex.bennee@linaro.org>; Mon, 29 Jan 2024 16:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8462815699D;
	Mon, 29 Jan 2024 16:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xKaQxpdv"
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50556664D2
	for <kvm@vger.kernel.org>; Mon, 29 Jan 2024 16:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706546881; cv=none; b=O6svx5P1YIfRL7cfuWqmaQ6B8Q99wwAcy+HiJ6w8sLf7LG4wUK9JrP0R4bWTqHS2rUZM0eZTHMRzzFzyp/JZyXWPFmT49RcQuZ1W2VGn7xBn+kxuc2pzIaHJDx5jZVaH4OaKN4RCS4VwWBTUXeBiXX0j0pM9Zh0Hmcn7Z5iogkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706546881; c=relaxed/simple;
	bh=xkVFL2XKpJDgGuvyXwALPhj/xdn8aOuHeD7OeGTn3cQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hS1XGTs08TAEvtkPWAbIZ6j5C7q248WZcWK/AgzcIkOLuhDlIlIBZQIDtkCUD1HzwleVHgH5Ro/RYv0XzLUA5Hy8MSJ7VjGRwXw7GFVpSKv09Q+Zjz+qhVCKov2Q+yw2Hfm5RCM4sWh7FyUe+ZtkJ84/nUQKOASVJhJVlRSOR0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xKaQxpdv; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3394ca0c874so2642919f8f.2
        for <kvm@vger.kernel.org>; Mon, 29 Jan 2024 08:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706546877; x=1707151677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDyOJncTz/gz39l44d2jGwByTaW/KG4k2gJ/GNswNnI=;
        b=xKaQxpdvY6imj4kGRv3CAXA3bStHQUr0P7ni7O+LZX3ba3HBGIgG7prcR5Eu+FAdLe
         hJ2N5YfjmsOU5lJggqSEuIfolPzvcFwBN2eWbD9iyw9MIBtwGWtAvWyeL3gdZEBz+0zF
         w4umA8QDidNDk34BzpgwN6ffYZH225gMaAsN+s/giEG9IaQP1cenBCTMbaMsfQTHJXeR
         ynMfZL34TxVo91OQ0Px1aPulRbxbhsIdmUGuZQpdizKWjwfRnHRShw9SYSYdlBZJcdSU
         zq4JJQDExfkmEZyUCHwAiSch4Bj2SNIE0WwyqcTmES0uzCExuScKTYKz0+5N07eVHIbi
         HCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706546877; x=1707151677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDyOJncTz/gz39l44d2jGwByTaW/KG4k2gJ/GNswNnI=;
        b=CIUkrbFt853BTHJHwm9CTpHEtZzI1D+3Q2GeZi1p4He67Q44jem7Wokj83U706Gj41
         Z2NVugJCZkdjuDUAhCzlHwJlW/fs9IXN7QfFTB2hGEg8lsS38+Xy4Y/mz1O5y7EzJJb1
         8RM+wPTFv2QzOANHF39VVNdWgUCnUhh4bqa78k0ItD6T3i7XW3BkTWgjofPreogSGWzV
         Fba2i1KDaF1lxF0P4MYe8RncUY+vEZZtR8FRoNiYu6wpo2XOsqbhOXMB5/Syjo/QnXnR
         7zquI1c+CIbs1N3ONlIyEYNgIqcHoaTqzHAvTPvDjdGfflCBAUDCuoINtuHYT5m5byZL
         olQA==
X-Gm-Message-State: AOJu0Yyxdf4f0b1AU+CTZV78wB8O0/YRrWchQYUjBQwo5QxLBlupdqsn
	v011EQAlBLGDryYjd5XyjYVv3XBe8RCWqHEb+3EDRqJv3RpiDC0MSMI3SyKtLLQ=
X-Received: by 2002:a5d:6812:0:b0:33a:e75e:281c with SMTP id w18-20020a5d6812000000b0033ae75e281cmr3295951wru.5.1706546877555;
        Mon, 29 Jan 2024 08:47:57 -0800 (PST)
Received: from m1x-phil.lan ([176.187.219.39])
        by smtp.gmail.com with ESMTPSA id a15-20020a056000100f00b0033aee3bfac5sm2738967wrx.16.2024.01.29.08.47.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Jan 2024 08:47:57 -0800 (PST)
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
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH v3 26/29] target/sparc: Prefer fast cpu_env() over slower CPU QOM cast macro
Date: Mon, 29 Jan 2024 17:45:08 +0100
Message-ID: <20240129164514.73104-27-philmd@linaro.org>
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
X-TUID: z4PH4KmtSR/P

Mechanical patch produced running the command documented
in scripts/coccinelle/cpu_env.cocci_template header.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/sparc/cpu.c          | 17 +++++------------
 target/sparc/gdbstub.c      |  3 +--
 target/sparc/int32_helper.c |  3 +--
 target/sparc/int64_helper.c |  3 +--
 target/sparc/ldst_helper.c  |  6 ++----
 target/sparc/mmu_helper.c   | 15 +++++----------
 target/sparc/translate.c    |  9 +++------
 7 files changed, 18 insertions(+), 38 deletions(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 152bee4f81..72a9b9a285 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -32,9 +32,8 @@
 static void sparc_cpu_reset_hold(Object *obj)
 {
     CPUState *cs = CPU(obj);
-    SPARCCPU *cpu = SPARC_CPU(cs);
     SPARCCPUClass *scc = SPARC_CPU_GET_CLASS(obj);
-    CPUSPARCState *env = &cpu->env;
+    CPUSPARCState *env = cpu_env(cs);
 
     if (scc->parent_phases.hold) {
         scc->parent_phases.hold(obj);
@@ -83,8 +82,7 @@ static void sparc_cpu_reset_hold(Object *obj)
 static bool sparc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     if (interrupt_request & CPU_INTERRUPT_HARD) {
-        SPARCCPU *cpu = SPARC_CPU(cs);
-        CPUSPARCState *env = &cpu->env;
+        CPUSPARCState *env = cpu_env(cs);
 
         if (cpu_interrupts_enabled(env) && env->interrupt_index > 0) {
             int pil = env->interrupt_index & 0xf;
@@ -613,8 +611,7 @@ static void cpu_print_cc(FILE *f, uint32_t cc)
 
 static void sparc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
-    SPARCCPU *cpu = SPARC_CPU(cs);
-    CPUSPARCState *env = &cpu->env;
+    CPUSPARCState *env = cpu_env(cs);
     int i, x;
 
     qemu_fprintf(f, "pc: " TARGET_FMT_lx "  npc: " TARGET_FMT_lx "\n", env->pc,
@@ -711,11 +708,8 @@ static void sparc_cpu_synchronize_from_tb(CPUState *cs,
 
 static bool sparc_cpu_has_work(CPUState *cs)
 {
-    SPARCCPU *cpu = SPARC_CPU(cs);
-    CPUSPARCState *env = &cpu->env;
-
     return (cs->interrupt_request & CPU_INTERRUPT_HARD) &&
-           cpu_interrupts_enabled(env);
+           cpu_interrupts_enabled(cpu_env(cs));
 }
 
 static char *sparc_cpu_type_name(const char *cpu_model)
@@ -749,8 +743,7 @@ static void sparc_cpu_realizefn(DeviceState *dev, Error **errp)
     CPUState *cs = CPU(dev);
     SPARCCPUClass *scc = SPARC_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
-    SPARCCPU *cpu = SPARC_CPU(dev);
-    CPUSPARCState *env = &cpu->env;
+    CPUSPARCState *env = cpu_env(cs);
 
 #if defined(CONFIG_USER_ONLY)
     /* We are emulating the kernel, which will trap and emulate float128. */
diff --git a/target/sparc/gdbstub.c b/target/sparc/gdbstub.c
index a1c8fdc4d5..5257c49a0d 100644
--- a/target/sparc/gdbstub.c
+++ b/target/sparc/gdbstub.c
@@ -29,8 +29,7 @@
 
 int sparc_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
-    SPARCCPU *cpu = SPARC_CPU(cs);
-    CPUSPARCState *env = &cpu->env;
+    CPUSPARCState *env = cpu_env(cs);
 
     if (n < 8) {
         /* g0..g7 */
diff --git a/target/sparc/int32_helper.c b/target/sparc/int32_helper.c
index 058dd712b5..6b7d65b031 100644
--- a/target/sparc/int32_helper.c
+++ b/target/sparc/int32_helper.c
@@ -99,8 +99,7 @@ void cpu_check_irqs(CPUSPARCState *env)
 
 void sparc_cpu_do_interrupt(CPUState *cs)
 {
-    SPARCCPU *cpu = SPARC_CPU(cs);
-    CPUSPARCState *env = &cpu->env;
+    CPUSPARCState *env = cpu_env(cs);
     int cwp, intno = cs->exception_index;
 
     if (qemu_loglevel_mask(CPU_LOG_INT)) {
diff --git a/target/sparc/int64_helper.c b/target/sparc/int64_helper.c
index 27df9dba89..bd14c7a0db 100644
--- a/target/sparc/int64_helper.c
+++ b/target/sparc/int64_helper.c
@@ -130,8 +130,7 @@ void cpu_check_irqs(CPUSPARCState *env)
 
 void sparc_cpu_do_interrupt(CPUState *cs)
 {
-    SPARCCPU *cpu = SPARC_CPU(cs);
-    CPUSPARCState *env = &cpu->env;
+    CPUSPARCState *env = cpu_env(cs);
     int intno = cs->exception_index;
     trap_state *tsptr;
 
diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index 09066d5487..203441bfb2 100644
--- a/target/sparc/ldst_helper.c
+++ b/target/sparc/ldst_helper.c
@@ -421,8 +421,7 @@ static void sparc_raise_mmu_fault(CPUState *cs, hwaddr addr,
                                   bool is_write, bool is_exec, int is_asi,
                                   unsigned size, uintptr_t retaddr)
 {
-    SPARCCPU *cpu = SPARC_CPU(cs);
-    CPUSPARCState *env = &cpu->env;
+    CPUSPARCState *env = cpu_env(cs);
     int fault_type;
 
 #ifdef DEBUG_UNASSIGNED
@@ -483,8 +482,7 @@ static void sparc_raise_mmu_fault(CPUState *cs, hwaddr addr,
                                   bool is_write, bool is_exec, int is_asi,
                                   unsigned size, uintptr_t retaddr)
 {
-    SPARCCPU *cpu = SPARC_CPU(cs);
-    CPUSPARCState *env = &cpu->env;
+    CPUSPARCState *env = cpu_env(cs);
 
 #ifdef DEBUG_UNASSIGNED
     printf("Unassigned mem access to " HWADDR_FMT_plx " from " TARGET_FMT_lx
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 453498c670..a05ee22315 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -206,8 +206,7 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr)
 {
-    SPARCCPU *cpu = SPARC_CPU(cs);
-    CPUSPARCState *env = &cpu->env;
+    CPUSPARCState *env = cpu_env(cs);
     CPUTLBEntryFull full = {};
     target_ulong vaddr;
     int error_code = 0, access_index;
@@ -391,8 +390,7 @@ void dump_mmu(CPUSPARCState *env)
 int sparc_cpu_memory_rw_debug(CPUState *cs, vaddr address,
                               uint8_t *buf, int len, bool is_write)
 {
-    SPARCCPU *cpu = SPARC_CPU(cs);
-    CPUSPARCState *env = &cpu->env;
+    CPUSPARCState *env = cpu_env(cs);
     target_ulong addr = address;
     int i;
     int len1;
@@ -759,8 +757,7 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr)
 {
-    SPARCCPU *cpu = SPARC_CPU(cs);
-    CPUSPARCState *env = &cpu->env;
+    CPUSPARCState *env = cpu_env(cs);
     CPUTLBEntryFull full = {};
     int error_code = 0, access_index;
 
@@ -898,8 +895,7 @@ hwaddr cpu_get_phys_page_nofault(CPUSPARCState *env, target_ulong addr,
 
 hwaddr sparc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 {
-    SPARCCPU *cpu = SPARC_CPU(cs);
-    CPUSPARCState *env = &cpu->env;
+    CPUSPARCState *env = cpu_env(cs);
     hwaddr phys_addr;
     int mmu_idx = cpu_mmu_index(env, false);
 
@@ -916,8 +912,7 @@ G_NORETURN void sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                               int mmu_idx,
                                               uintptr_t retaddr)
 {
-    SPARCCPU *cpu = SPARC_CPU(cs);
-    CPUSPARCState *env = &cpu->env;
+    CPUSPARCState *env = cpu_env(cs);
 
 #ifdef TARGET_SPARC64
     env->dmmu.sfsr = build_sfsr(env, mmu_idx, access_type);
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 9387299559..769418d6b0 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -5154,13 +5154,12 @@ TRANS(FCMPEq, ALL, do_fcmpq, a, true)
 static void sparc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
-    CPUSPARCState *env = cpu_env(cs);
     int bound;
 
     dc->pc = dc->base.pc_first;
     dc->npc = (target_ulong)dc->base.tb->cs_base;
     dc->mem_idx = dc->base.tb->flags & TB_FLAG_MMU_MASK;
-    dc->def = &env->def;
+    dc->def = &cpu_env(cs)->def;
     dc->fpu_enabled = tb_fpu_enabled(dc->base.tb->flags);
     dc->address_mask_32bit = tb_am_enabled(dc->base.tb->flags);
 #ifndef CONFIG_USER_ONLY
@@ -5210,10 +5209,9 @@ static void sparc_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
 static void sparc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
-    CPUSPARCState *env = cpu_env(cs);
     unsigned int insn;
 
-    insn = translator_ldl(env, &dc->base, dc->pc);
+    insn = translator_ldl(cpu_env(cs), &dc->base, dc->pc);
     dc->base.pc_next += 4;
 
     if (!decode(dc, insn)) {
@@ -5406,8 +5404,7 @@ void sparc_restore_state_to_opc(CPUState *cs,
                                 const TranslationBlock *tb,
                                 const uint64_t *data)
 {
-    SPARCCPU *cpu = SPARC_CPU(cs);
-    CPUSPARCState *env = &cpu->env;
+    CPUSPARCState *env = cpu_env(cs);
     target_ulong pc = data[0];
     target_ulong npc = data[1];
 
-- 
2.41.0

