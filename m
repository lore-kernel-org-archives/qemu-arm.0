Received: by 2002:a17:906:ca92:b0:a35:2c0b:b7b4 with SMTP id js18csp117540ejb;
        Fri, 26 Jan 2024 14:09:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESs02lcPrIgw1RQa6M9cQ9C6FSiXfyP+I8gs1pAqq8j4F7GixD7JWtQyNwrGEE0qXvDraE
X-Received: by 2002:a05:622a:94:b0:42a:31d1:edfc with SMTP id o20-20020a05622a009400b0042a31d1edfcmr472016qtw.34.1706306962903;
        Fri, 26 Jan 2024 14:09:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706306962; cv=pass;
        d=google.com; s=arc-20160816;
        b=eCfx0PkTAcFlxIPw7Uy3q+TBdTXgTzpYBmmIAkE7eVgzqD0cXtSBNEjpIIE1bpOx/K
         kdHqepDPlb4Yu4ZlqgLiIsSLb97W50KZ1DvuAc+kCqa1zhs8W3Ml8Lg1W4QG4gwfbszs
         aSVqWAYsyNqoEx3rVlmlLqdTE+hTBUOWwqDUWnuAHreF5MKzRFNls8fFdXafWULJQ8Yo
         R0wQHiGlzhPm6MHVPniIUeEkBO01wpzvDIotcUSp/Q4hV8ZQCEH3qfMqpRescyr5IM66
         3ODc0CuD5DKZh8TF+1x9s2Tkvyw4n0ArFBCmBXVYu30j1WGoJ1ZWbTL/Ab+CmQ6fEL14
         RKjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=2gDIWjU9eQG9A3OK765d3tfkinBgpjsJUVS32LoH/b8=;
        fh=FRPeMZSaBWnEZQXZBEWBHmzGn4kNniu1hjzclURjYnY=;
        b=hLuWt46wusg27Mf8ypwsCgC6khpviVOt3zilxEXeuFx8BIY4XPtK34dqm2UZ5c77Hf
         rKA8nK8NkMsNnLfVeKBNctJJK71FcHTOHM9EdLBM5d1dlGlrUrZLJWi4k1D1m5q7hc1+
         ifMheh8VbhFScA844VLFrOhQ/mPulCpf+0Icy51I4ArDNUgZ9iQamuJ2r/lQpiynj9M6
         rXqTrYg4XQ8PPkCaLG+JmneWjgxWJTG+1A4RMgm/d1xfxogmjuew2Qn83e4ONskSFaY8
         6YMDQOPNS04Vw61RVo2Ua4QrFCknSmVBdmQreMazF79ZzRLhLliiKMFs7hON5W8IrTBw
         Khyg==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NhtaDH7C;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7236-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-7236-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-7236-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id x24-20020ac87ed8000000b0042a7cead6c1si1963008qtj.382.2024.01.26.14.09.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 14:09:22 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-7236-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NhtaDH7C;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7236-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-7236-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E5241C2336F
	for <alex.bennee@linaro.org>; Fri, 26 Jan 2024 22:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D3945961;
	Fri, 26 Jan 2024 22:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NhtaDH7C"
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22132555E
	for <kvm@vger.kernel.org>; Fri, 26 Jan 2024 22:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706306791; cv=none; b=hHH9RyL9gREOnfP3XxNXOaAfzTR5cnSuPM8l2rHibdHKq5UoyMjq7AJV9EbqOtGqnv+57h6baZBmfIa6FJlvgQok7zYEJsQog+GsAs+Z4tWPJ+dvoaSztTROs47Pg0oScSqv0gG26DPazC9qC0Nu6bMigURAiRyYLOFKCNdSMgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706306791; c=relaxed/simple;
	bh=bILqwqDnGGukYClNzxVSrSnM9B/eHA/jwegysgZl8YQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bxlhj1ol5k+3VSKTircN4zxiBI5ucG8xf9ypR+fw4WN4ZgMAoaq7Pd/TrMT1H4sQRtX+GKxI9Ynet/8lOsLrDgUcB8WdxBfI7TOSGttEbLjJxMif2teZANg+eL7SRFXpPg0CkoBzOf638t7XIaubCrZnjtfZi11v5wT9Mg/9Mt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NhtaDH7C; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-339261a6ec2so1069515f8f.0
        for <kvm@vger.kernel.org>; Fri, 26 Jan 2024 14:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706306788; x=1706911588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gDIWjU9eQG9A3OK765d3tfkinBgpjsJUVS32LoH/b8=;
        b=NhtaDH7CJbskKVV+ilbCBmSq2NpeSJDCsnXWGRWSos11Zvnv0CWnO/ZBharzvltG62
         RhkM0+GRGA/4p3SZ4+HqM0fKSp7O5hRTjq6rb3dDP2N7PqhaAeZUKaBVR9LMkMV+TCFw
         KbLBO/wJ7kRwoyJnKl+5oHNUuURD3398MJpDbvqp8dCfCJhzNhHmvGS95+l7mcsJLcyx
         gucjYtA963mxPBB5Eb5QxDcx0iSbQBG1a5P+3AZJ5sFQ8z3a7zYmuIFqpmf4ByaiOhsC
         n1D/9NLw35wBCthVa6Mp2sMISWxgPzuDBt6ptVojKsnxm6E3r6rExvb+p9uVm55/BrPW
         ojzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706306788; x=1706911588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gDIWjU9eQG9A3OK765d3tfkinBgpjsJUVS32LoH/b8=;
        b=nJpVV77IXErEXMvhaH0o13aT2Tzgj0xmH/BB0rHSAfjFRpHe2lUZnC1p+BdU+oXbmh
         cY5ZPwkeJNiRxSpmzete0eripakiuB4mJuwIwmE+84EjEWnkWHDbQNq2/6M2p4Mfdv3K
         6lgjrsravi1oSYzCxFJnzbF8vVIyZtiwya2PArwKKSWusXaCqw4Wc4G5K6SXZHPpGNnz
         bk8mgztDyOAY5N9m8wu8Pdv3w8TKawZX62Pf+qppLM1OKYyYueYyY4J02XmGgBcWmCO6
         UdmDZZuocoCZpdsUWJqV8LVcmRc+eoik9oZGgT0IciJe83tsb2okUBqkDXX27rUOM3zZ
         CCeg==
X-Gm-Message-State: AOJu0Yzlwn6/dtEoL/Hl4L+YDAowws9y2tll/T5MRjOA95hyvqCvj6Di
	ll3NcTO7BnU1GukjylLkxnze9h6KV3gGYAcfKX5VJ36FpXr+FIiV+EYoo7DXaQw=
X-Received: by 2002:a5d:6a0b:0:b0:336:6db3:1d7a with SMTP id m11-20020a5d6a0b000000b003366db31d7amr188913wru.103.1706306787955;
        Fri, 26 Jan 2024 14:06:27 -0800 (PST)
Received: from m1x-phil.lan ([176.176.142.39])
        by smtp.gmail.com with ESMTPSA id bp19-20020a5d5a93000000b003394495566dsm2118313wrb.22.2024.01.26.14.06.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jan 2024 14:06:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-s390x@nongnu.org,
	qemu-riscv@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 22/23] target/xtensa: Prefer fast cpu_env() over slower CPU QOM cast macro
Date: Fri, 26 Jan 2024 23:04:04 +0100
Message-ID: <20240126220407.95022-23-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240126220407.95022-1-philmd@linaro.org>
References: <20240126220407.95022-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: SofrmLQSNVNd

Mechanical patch produced running the command documented
in scripts/coccinelle/cpu_env.cocci_template header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/xtensa/dbg_helper.c | 3 +--
 target/xtensa/exc_helper.c | 3 +--
 target/xtensa/gdbstub.c    | 6 ++----
 target/xtensa/helper.c     | 9 +++------
 target/xtensa/translate.c  | 3 +--
 5 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/target/xtensa/dbg_helper.c b/target/xtensa/dbg_helper.c
index 497dafca71..5546c82ecd 100644
--- a/target/xtensa/dbg_helper.c
+++ b/target/xtensa/dbg_helper.c
@@ -66,8 +66,7 @@ void HELPER(wsr_ibreaka)(CPUXtensaState *env, uint32_t i, uint32_t v)
 
 bool xtensa_debug_check_breakpoint(CPUState *cs)
 {
-    XtensaCPU *cpu = XTENSA_CPU(cs);
-    CPUXtensaState *env = &cpu->env;
+    CPUXtensaState *env = cpu_env(cs);
     unsigned int i;
 
     if (xtensa_get_cintlevel(env) >= env->config->debug_level) {
diff --git a/target/xtensa/exc_helper.c b/target/xtensa/exc_helper.c
index 168419a505..0514c2c1f3 100644
--- a/target/xtensa/exc_helper.c
+++ b/target/xtensa/exc_helper.c
@@ -205,8 +205,7 @@ static void handle_interrupt(CPUXtensaState *env)
 /* Called from cpu_handle_interrupt with BQL held */
 void xtensa_cpu_do_interrupt(CPUState *cs)
 {
-    XtensaCPU *cpu = XTENSA_CPU(cs);
-    CPUXtensaState *env = &cpu->env;
+    CPUXtensaState *env = cpu_env(cs);
 
     if (cs->exception_index == EXC_IRQ) {
         qemu_log_mask(CPU_LOG_INT,
diff --git a/target/xtensa/gdbstub.c b/target/xtensa/gdbstub.c
index 4b3bfb7e59..4748fb6532 100644
--- a/target/xtensa/gdbstub.c
+++ b/target/xtensa/gdbstub.c
@@ -65,8 +65,7 @@ void xtensa_count_regs(const XtensaConfig *config,
 
 int xtensa_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
-    XtensaCPU *cpu = XTENSA_CPU(cs);
-    CPUXtensaState *env = &cpu->env;
+    CPUXtensaState *env = cpu_env(cs);
     const XtensaGdbReg *reg = env->config->gdb_regmap.reg + n;
 #ifdef CONFIG_USER_ONLY
     int num_regs = env->config->gdb_regmap.num_core_regs;
@@ -120,8 +119,7 @@ int xtensa_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 
 int xtensa_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 {
-    XtensaCPU *cpu = XTENSA_CPU(cs);
-    CPUXtensaState *env = &cpu->env;
+    CPUXtensaState *env = cpu_env(cs);
     uint32_t tmp;
     const XtensaGdbReg *reg = env->config->gdb_regmap.reg + n;
 #ifdef CONFIG_USER_ONLY
diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index a9f8907083..ca214b948a 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -217,8 +217,7 @@ static uint32_t check_hw_breakpoints(CPUXtensaState *env)
 
 void xtensa_breakpoint_handler(CPUState *cs)
 {
-    XtensaCPU *cpu = XTENSA_CPU(cs);
-    CPUXtensaState *env = &cpu->env;
+    CPUXtensaState *env = cpu_env(cs);
 
     if (cs->watchpoint_hit) {
         if (cs->watchpoint_hit->flags & BP_CPU) {
@@ -266,8 +265,7 @@ bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          MMUAccessType access_type, int mmu_idx,
                          bool probe, uintptr_t retaddr)
 {
-    XtensaCPU *cpu = XTENSA_CPU(cs);
-    CPUXtensaState *env = &cpu->env;
+    CPUXtensaState *env = cpu_env(cs);
     uint32_t paddr;
     uint32_t page_size;
     unsigned access;
@@ -297,8 +295,7 @@ void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                       int mmu_idx, MemTxAttrs attrs,
                                       MemTxResult response, uintptr_t retaddr)
 {
-    XtensaCPU *cpu = XTENSA_CPU(cs);
-    CPUXtensaState *env = &cpu->env;
+    CPUXtensaState *env = cpu_env(cs);
 
     cpu_restore_state(cs, retaddr);
     HELPER(exception_cause_vaddr)(env, env->pc,
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 87947236ca..426dcb6169 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1248,8 +1248,7 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int *max_insns,
 
 void xtensa_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
-    XtensaCPU *cpu = XTENSA_CPU(cs);
-    CPUXtensaState *env = &cpu->env;
+    CPUXtensaState *env = cpu_env(cs);
     xtensa_isa isa = env->config->isa;
     int i, j;
 
-- 
2.41.0

