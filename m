Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp298812ejk;
        Mon, 29 Jan 2024 08:49:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAer0k01JvSHJlUNHV6X29Enk77fCVTw8tr6CuvlzmPX6FGO8M3TboXprXYXIig6fKTNQ5
X-Received: by 2002:a17:906:dfd3:b0:a35:99fa:5980 with SMTP id jt19-20020a170906dfd300b00a3599fa5980mr3255336ejc.58.1706546988974;
        Mon, 29 Jan 2024 08:49:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706546988; cv=pass;
        d=google.com; s=arc-20160816;
        b=sr+0U98BFu+hTNfxV4IDgXc1ehtJklirCJJMFndSvhXKswt6EWEY6o92uaRZ0HrwOv
         sXLAHTfjXsRpCKi4Q932xZFjn9q0UnaB3m02Xd2yK0/PD9egBOUUcjcVQLjhzc9aq1O1
         Ev1yaWblk+Gcx9FMqNOiFFtpjhY/vYlOoiQ8wQPUuHzEMqGvDmDMIqOAbemrAseD5yAj
         EpAf4i/rWlmWLjxA7abnLiBhTR5WYT7wa5HKBq2tpz4UFURc0QWhxp/Rt3bQgMpLzJvc
         5OwIPx8Kw+yqK7Mo3s7k5iyf5jIZogPiJ63hxOaDJ2FUa2CUN1xOHikuJUUZwM427BqK
         bFEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=+rt9340Neq6sQRGPVea3EhCde05ocdRyA3moNLb2tSg=;
        fh=OOi/XhSEeYfANGXa6OK1tDhAQHrC+MMEzTLCLmVDcj0=;
        b=cW1EkKDe0Y+xWKCJbsQLH4v3Ow54D5U/59Qwt53WboFVZmm1gF6hub/gegr4iB1DwB
         +weajhJN1KRFkxgW8UvsaIq/+TQPw6cU5XK3q1xGQLrymO62e8bhW3YnP11gnnyN4BMR
         ZR7hpEAoZYd6Tr+G8uSt1cC5Cuw8ypyHqexxzr3l70Zf3JM2fE5u47Eoefns7IJqav9t
         Os6hudytXjXCQHw/rj2Av8SRcO/9HDE4IcRWuhQeswDyD7ix632t7tl1HpQIRcKAzicu
         Ka22jlE8YeUeNMrockUzs4fj7h+Uft1rg1sCp1FVWRuPZNFVWvrdCO0AcAR5581EG+Vl
         cTeA==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GL2TrhID;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7373-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-7373-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-7373-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id s3-20020a170906a18300b00a35ffc9013dsi158414ejy.213.2024.01.29.08.49.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 08:49:48 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-7373-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GL2TrhID;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7373-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-7373-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 803D41F244B3
	for <alex.bennee@linaro.org>; Mon, 29 Jan 2024 16:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59DAC15A489;
	Mon, 29 Jan 2024 16:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GL2TrhID"
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF63159579
	for <kvm@vger.kernel.org>; Mon, 29 Jan 2024 16:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706546887; cv=none; b=HSKmAiKJ8p3WZ0gPgcFOpTpbcAEim2RG/wFbRldZfSLkw2226QV8evzIHEuzlEhHESxiYHMzdbGCu88+8KqcLk/hXFuZ/1/4NDOeaFjpv2/N2pMZCUzTJFYvQ40b8A5Ctwf2GWwOubf0GAKAH+yr1ySAU55BslWke/RZITofVGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706546887; c=relaxed/simple;
	bh=/giGeSNQ051t0osD9OGq6OXrEl4LMgnNv5v2RuQWwX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ghS/hj6hJjLa3vheR7t4J0uKP3i3cdShl9Clm5D2Ct9zBwv4elbIc11QbDdXFdKyAZJGgdh3e955lq9+fzOHD0ohjpZSA2LFX+kzcxEAD7jI6DSuwMDgSrR5pRBEoATyLHjXDTLV6xaEmcObuGaoiD+YotNcXke7rc6Q22gW5F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GL2TrhID; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33af3c7ef60so588502f8f.0
        for <kvm@vger.kernel.org>; Mon, 29 Jan 2024 08:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706546883; x=1707151683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rt9340Neq6sQRGPVea3EhCde05ocdRyA3moNLb2tSg=;
        b=GL2TrhID6fzDtJT8ygxBcmOycEs+ue/40l/YIA9gZ/2V7wnsDubK45f0KgzmMulf0d
         8w7+5LUALlwIaFPA3BtUS6PV/pVzjra8aSi7igPm1CT/G+V3dUK4yq4WSSHtOTGLMBrD
         xWehL22GzfHeGpr6DwGxxllLLXCkvJ0Mftk9ygExXQFehtUNCm6bD01XUbJPus8Scu38
         Gb7I5okbHmJTpFxCiMV7rTsw9qi2+AL3IVp758qErgHuwShvxkbOMbxz5QeaX5xmXPDk
         fx5HPZyTVKjapJiRgb5sOEDYEyiSfyaJsUp0lPo6OUXNsy3ZA6pQ8floyUwuZaYy2j4Q
         Z0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706546883; x=1707151683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+rt9340Neq6sQRGPVea3EhCde05ocdRyA3moNLb2tSg=;
        b=dNOy6wi9zXK+gMSh0aLvdjX8IFkx2g2mk0M1NdMUVBuSkfepceGDra53/tFukxgsy/
         89uScKQbqVMX9u3aPPZt3ueAQSlwNX1P4QmZn2oQh0eaETwhK+9iRvpOA85+XbUpL42S
         BjHaEc6Ufb4zxu2AUV2VJJ2lsoWsZviZp9RPCXe4Pa2TIHKdQcqcn3x8SfU8M8z9mXbM
         qVameWC/6ikUyQC5ORyV4x9tlwyHvEuerSueIn2IhkDCRG1mj/QGPuwctNj2W8Ii8Dm+
         NfLTScjQD+Al1J1WQeHRd4jsy2KCHUh0nFrGq8k6vR4HrWTxdy+M3yI5OKosVF10z0ut
         05cg==
X-Gm-Message-State: AOJu0YwtX8aViFs0CDLPsZlJeNnvC7lQUfpKViR2DTbapMZqxpdRIqiV
	CNohxVSzyIUM5otZXphAVeLX21j4P2+N7fO3P4uCOoSCMWnm5omi4uFKTegLTAs=
X-Received: by 2002:a5d:510f:0:b0:33a:e7de:aa8b with SMTP id s15-20020a5d510f000000b0033ae7deaa8bmr2928268wrt.26.1706546883422;
        Mon, 29 Jan 2024 08:48:03 -0800 (PST)
Received: from m1x-phil.lan ([176.187.219.39])
        by smtp.gmail.com with ESMTPSA id b3-20020a05600003c300b0033ae46e0f02sm6350998wrg.75.2024.01.29.08.48.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Jan 2024 08:48:03 -0800 (PST)
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
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v3 27/29] target/tricore: Prefer fast cpu_env() over slower CPU QOM cast macro
Date: Mon, 29 Jan 2024 17:45:09 +0100
Message-ID: <20240129164514.73104-28-philmd@linaro.org>
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
X-TUID: wNkzpNPK//Y0

Mechanical patch produced running the command documented
in scripts/coccinelle/cpu_env.cocci_template header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/tricore/cpu.c       | 24 +++++-------------------
 target/tricore/gdbstub.c   |  6 ++----
 target/tricore/helper.c    |  3 +--
 target/tricore/translate.c |  3 +--
 4 files changed, 9 insertions(+), 27 deletions(-)

diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 9bdaa1593a..7c4a9b41a3 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -36,52 +36,38 @@ static const gchar *tricore_gdb_arch_name(CPUState *cs)
 
 static void tricore_cpu_set_pc(CPUState *cs, vaddr value)
 {
-    TriCoreCPU *cpu = TRICORE_CPU(cs);
-    CPUTriCoreState *env = &cpu->env;
-
-    env->PC = value & ~(target_ulong)1;
+    cpu_env(cs)->PC = value & ~(target_ulong)1;
 }
 
 static vaddr tricore_cpu_get_pc(CPUState *cs)
 {
-    TriCoreCPU *cpu = TRICORE_CPU(cs);
-    CPUTriCoreState *env = &cpu->env;
-
-    return env->PC;
+    return cpu_env(cs)->PC;
 }
 
 static void tricore_cpu_synchronize_from_tb(CPUState *cs,
                                             const TranslationBlock *tb)
 {
-    TriCoreCPU *cpu = TRICORE_CPU(cs);
-    CPUTriCoreState *env = &cpu->env;
-
     tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
-    env->PC = tb->pc;
+    cpu_env(cs)->PC = tb->pc;
 }
 
 static void tricore_restore_state_to_opc(CPUState *cs,
                                          const TranslationBlock *tb,
                                          const uint64_t *data)
 {
-    TriCoreCPU *cpu = TRICORE_CPU(cs);
-    CPUTriCoreState *env = &cpu->env;
-
-    env->PC = data[0];
+    cpu_env(cs)->PC = data[0];
 }
 
 static void tricore_cpu_reset_hold(Object *obj)
 {
     CPUState *cs = CPU(obj);
-    TriCoreCPU *cpu = TRICORE_CPU(cs);
     TriCoreCPUClass *tcc = TRICORE_CPU_GET_CLASS(obj);
-    CPUTriCoreState *env = &cpu->env;
 
     if (tcc->parent_phases.hold) {
         tcc->parent_phases.hold(obj);
     }
 
-    cpu_state_reset(env);
+    cpu_state_reset(cpu_env(cs));
 }
 
 static bool tricore_cpu_has_work(CPUState *cs)
diff --git a/target/tricore/gdbstub.c b/target/tricore/gdbstub.c
index e8f8e5e6ea..f9309c5e27 100644
--- a/target/tricore/gdbstub.c
+++ b/target/tricore/gdbstub.c
@@ -106,8 +106,7 @@ static void tricore_cpu_gdb_write_csfr(CPUTriCoreState *env, int n,
 
 int tricore_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
-    TriCoreCPU *cpu = TRICORE_CPU(cs);
-    CPUTriCoreState *env = &cpu->env;
+    CPUTriCoreState *env = cpu_env(cs);
 
     if (n < 16) { /* data registers */
         return gdb_get_reg32(mem_buf, env->gpr_d[n]);
@@ -121,8 +120,7 @@ int tricore_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 
 int tricore_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 {
-    TriCoreCPU *cpu = TRICORE_CPU(cs);
-    CPUTriCoreState *env = &cpu->env;
+    CPUTriCoreState *env = cpu_env(cs);
     uint32_t tmp;
 
     tmp = ldl_p(mem_buf);
diff --git a/target/tricore/helper.c b/target/tricore/helper.c
index 174f666e1e..d328414c99 100644
--- a/target/tricore/helper.c
+++ b/target/tricore/helper.c
@@ -67,8 +67,7 @@ bool tricore_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                           MMUAccessType rw, int mmu_idx,
                           bool probe, uintptr_t retaddr)
 {
-    TriCoreCPU *cpu = TRICORE_CPU(cs);
-    CPUTriCoreState *env = &cpu->env;
+    CPUTriCoreState *env = cpu_env(cs);
     hwaddr physical;
     int prot;
     int ret = 0;
diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 66553d1be0..ad314bdf3c 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -95,8 +95,7 @@ enum {
 
 void tricore_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
-    TriCoreCPU *cpu = TRICORE_CPU(cs);
-    CPUTriCoreState *env = &cpu->env;
+    CPUTriCoreState *env = cpu_env(cs);
     uint32_t psw;
     int i;
 
-- 
2.41.0

