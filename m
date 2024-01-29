Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp298178ejk;
        Mon, 29 Jan 2024 08:48:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFM1/veYrbqARIEgmubZFe0Pv44ctR90cUMpB6zRQw49MLdG5afyWv8wMf6lZF0QQFYBYF0
X-Received: by 2002:a17:902:8f97:b0:1d7:5bde:7c2f with SMTP id z23-20020a1709028f9700b001d75bde7c2fmr2457895plo.21.1706546920781;
        Mon, 29 Jan 2024 08:48:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706546920; cv=pass;
        d=google.com; s=arc-20160816;
        b=aBV5EPLFT1TeYUG8CWZGA4rjy3zzeHaxB0RHQgBVGYMtS4tlMpDECHMy0dKuBue1Kw
         Vw9skML1AP+X+yP7QsuW4sAtXu/FdjEPGP12YpYOesFVLvPM8XaGUTeW5Hb1P/d5hyhk
         /3MfFAUy9MUzZs5ZFXSS4EIYgOugslZ3pd4AItOgkIC8dYDVMgGdG0luEm7fQTWcNqZC
         8juN/LW5ZGflo0nbZcVOi3aIxiY5qGXrdvpeyU5gVYXk7pklIiRW2js3eLrlBAqoZm6e
         ikJ79RjelJKhgJb2FNk6Hzm0Y7FLB5eirfJqQ0kjj3rD1WC3SjA7eBx4nnLj2N4vdk15
         dqoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=s/zDxvb98/B1ERutMsrHfGwo048VXZrRTuyvepC4E0w=;
        fh=eeVa7dYgnzuJS4yUXISyXDOO2tisYtFgcMq6bzbeuhk=;
        b=iTDrl3Tv7EnxicRFTEZ5w51KWzkZgbeCIn/U26kHKheMiuOvu4VqpEP1DiZ7+nuJ6k
         RwgK1iSAYsAnubT3TienmZL8XC0+HMbJ208gSEBt9W5FI9cuEZuYMvcEwcgyZPvshk7g
         bdoFIoH+fpfVMMzH+yOvxnU5wt5UKkmVdJxkDcAmy9iZvvPBR231P8r33PLVr2FZ9MQs
         roPitFznpZ3/mUej3YqowWeViRVuH0sOL/bdecn7B/xk+M9HHkCE8pgoRDn8F3L6cOLH
         GwpKSoMr7emv9sTI1WsXdBxzZrALvmu5TCziURZIVg97lE2nZvWpLsitlJMjCTiEv7Qs
         tutA==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bUrijP96;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7370-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-7370-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-7370-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id c4-20020a170903234400b001d752bc5222si5952079plh.306.2024.01.29.08.48.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 08:48:40 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-7370-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bUrijP96;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7370-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-7370-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CBDDB26BF5
	for <alex.bennee@linaro.org>; Mon, 29 Jan 2024 16:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C48157E66;
	Mon, 29 Jan 2024 16:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bUrijP96"
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9FB15697A
	for <kvm@vger.kernel.org>; Mon, 29 Jan 2024 16:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706546869; cv=none; b=pRTBq8nDoNZGX08eRHHAT2koox3R8gBc83vzG/Gw7FVoFx3XXo8DFtZpuU2Rh5G2VOAQ+RXQcYng5xnWuI/nvDVWRxB3Iqg7p+z9yh9kjNS44XdY9TbmDE5+KUIT1gFpayKQgQlSztjbGxrh/e+dUYHeOtZyozetNr3/mCAzar4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706546869; c=relaxed/simple;
	bh=zYfZau/azRmfVZaoN/B+GygnlIYsdjS/6EaQzx7MS1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a+8kugQQ90inm8JrZmtMATIzlwKN8qwvfC/HgQr9xvpz0FlZRVph+uUBnUGwgiA6IJ+94v98CQuq7ST3DGZ59sT3qwuGCvAH6rDsDpgYoXpfkB/OjZvMJ2uxVrnyjX7F89S7TeP5l9UaSwz+cNPMUhotkCa/NglDDDzNMsR4I9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bUrijP96; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40e7065b7bdso39597675e9.3
        for <kvm@vger.kernel.org>; Mon, 29 Jan 2024 08:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706546866; x=1707151666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/zDxvb98/B1ERutMsrHfGwo048VXZrRTuyvepC4E0w=;
        b=bUrijP96yXC2/xI99TeCLgaE5zwYW9EE6vms6OHtfHA/eTmeHJHp8FbbBLXV8gDhI3
         vMCiZdgYEYme2WM7kpxAW+3dq7/acJ4nHIoVpu9BpXvBdyVq25W4s2FBUVxHcl8rxSnF
         x1BPVDRQAJEsMT5/H3Ve5r54zGcMVdCWtDHD2tr+nEAtENNRsv6S/umtJ45L1Ocz07jY
         +PjylgvvkKqgQOywnksyNDJAikeCNSdWoRktRc8sSfEjUehPAYakCeFoLmmlL+xD+Xwt
         ZK9ddg8an99CvF3n4FBqH4mvGdjjR+SmzJARZimAwFTk8H9ElPQ5qFoXuqvzGGEpi9Eu
         iFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706546866; x=1707151666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/zDxvb98/B1ERutMsrHfGwo048VXZrRTuyvepC4E0w=;
        b=nSAnpqA2tOJM0rWk8RZSlIbDHcAmriFs6dn3OexkzzG4/2/eIx9TP+8dyN+4RLDQv2
         ov9Pod2EsYFwAB0VEiFMrgYS/qcXkraqo/tcxY5CP+JASlapfLLzNc/hTappA+8S/ssH
         B0LR/hn1MR8N+doFWxuuEEgwZUWhtwWsWIS0cjuiZgNSmLoGoD3mg17+TuUCNBr3O5Wi
         qomxShXDfRBhVp8xTJOxOEvSW+3CFP1EKPJyH67H2TL+hAtrHdPCFrL8V01PkDshaUWJ
         WOilQ5aWAhXBUIm9zR5zDkhi1KsJPTb77TfJDRlAs28OD/NeomJwbeLu5fmRD0mstpa6
         UDRg==
X-Gm-Message-State: AOJu0Yx7Uz0/xs10EC25STUyR7bRdV8bT0EeCe7VOskqpOuyTkdvC/JS
	kQCLKcpnYayDNA8jUgeWe78hTtqKYyJCUjz26ObrT2TsSjOuu7+3DB5SnQvEsW4=
X-Received: by 2002:a05:600c:3547:b0:40e:f681:b7b6 with SMTP id i7-20020a05600c354700b0040ef681b7b6mr2655551wmq.37.1706546865930;
        Mon, 29 Jan 2024 08:47:45 -0800 (PST)
Received: from m1x-phil.lan ([176.187.219.39])
        by smtp.gmail.com with ESMTPSA id ay12-20020a5d6f0c000000b0033ad47d7b86sm8556726wrb.27.2024.01.29.08.47.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Jan 2024 08:47:45 -0800 (PST)
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
	Thomas Huth <thuth@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: [PATCH v3 24/29] target/s390x: Prefer fast cpu_env() over slower CPU QOM cast macro
Date: Mon, 29 Jan 2024 17:45:06 +0100
Message-ID: <20240129164514.73104-25-philmd@linaro.org>
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
X-TUID: qO6yWy3b47pa

Mechanical patch produced running the command documented
in scripts/coccinelle/cpu_env.cocci_template header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/cpu-dump.c        |  3 +--
 target/s390x/gdbstub.c         |  6 ++----
 target/s390x/helper.c          |  3 +--
 target/s390x/kvm/kvm.c         |  6 ++----
 target/s390x/tcg/excp_helper.c | 11 +++--------
 target/s390x/tcg/misc_helper.c |  4 +---
 target/s390x/tcg/translate.c   |  3 +--
 7 files changed, 11 insertions(+), 25 deletions(-)

diff --git a/target/s390x/cpu-dump.c b/target/s390x/cpu-dump.c
index ffa9e94d84..69cc9f7746 100644
--- a/target/s390x/cpu-dump.c
+++ b/target/s390x/cpu-dump.c
@@ -27,8 +27,7 @@
 
 void s390_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
-    S390CPU *cpu = S390_CPU(cs);
-    CPUS390XState *env = &cpu->env;
+    CPUS390XState *env = cpu_env(cs);
     int i;
 
     qemu_fprintf(f, "PSW=mask %016" PRIx64 " addr %016" PRIx64,
diff --git a/target/s390x/gdbstub.c b/target/s390x/gdbstub.c
index 6fbfd41bc8..f02fa316e5 100644
--- a/target/s390x/gdbstub.c
+++ b/target/s390x/gdbstub.c
@@ -30,8 +30,7 @@
 
 int s390_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
-    S390CPU *cpu = S390_CPU(cs);
-    CPUS390XState *env = &cpu->env;
+    CPUS390XState *env = cpu_env(cs);
 
     switch (n) {
     case S390_PSWM_REGNUM:
@@ -46,8 +45,7 @@ int s390_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 
 int s390_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 {
-    S390CPU *cpu = S390_CPU(cs);
-    CPUS390XState *env = &cpu->env;
+    CPUS390XState *env = cpu_env(cs);
     target_ulong tmpl = ldtul_p(mem_buf);
 
     switch (n) {
diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index d76c06381b..00d5d403f3 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -139,8 +139,7 @@ void do_restart_interrupt(CPUS390XState *env)
 void s390_cpu_recompute_watchpoints(CPUState *cs)
 {
     const int wp_flags = BP_CPU | BP_MEM_WRITE | BP_STOP_BEFORE_ACCESS;
-    S390CPU *cpu = S390_CPU(cs);
-    CPUS390XState *env = &cpu->env;
+    CPUS390XState *env = cpu_env(cs);
 
     /* We are called when the watchpoints have changed. First
        remove them all.  */
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 888d6c1a1c..4ce809c5d4 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -474,8 +474,7 @@ static int can_sync_regs(CPUState *cs, int regs)
 
 int kvm_arch_put_registers(CPUState *cs, int level)
 {
-    S390CPU *cpu = S390_CPU(cs);
-    CPUS390XState *env = &cpu->env;
+    CPUS390XState *env = cpu_env(cs);
     struct kvm_fpu fpu = {};
     int r;
     int i;
@@ -601,8 +600,7 @@ int kvm_arch_put_registers(CPUState *cs, int level)
 
 int kvm_arch_get_registers(CPUState *cs)
 {
-    S390CPU *cpu = S390_CPU(cs);
-    CPUS390XState *env = &cpu->env;
+    CPUS390XState *env = cpu_env(cs);
     struct kvm_fpu fpu;
     int i, r;
 
diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
index b875bf14e5..f1c33f7967 100644
--- a/target/s390x/tcg/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -90,10 +90,7 @@ void HELPER(data_exception)(CPUS390XState *env, uint32_t dxc)
 static G_NORETURN
 void do_unaligned_access(CPUState *cs, uintptr_t retaddr)
 {
-    S390CPU *cpu = S390_CPU(cs);
-    CPUS390XState *env = &cpu->env;
-
-    tcg_s390_program_interrupt(env, PGM_SPECIFICATION, retaddr);
+    tcg_s390_program_interrupt(cpu_env(cs), PGM_SPECIFICATION, retaddr);
 }
 
 #if defined(CONFIG_USER_ONLY)
@@ -146,8 +143,7 @@ bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr)
 {
-    S390CPU *cpu = S390_CPU(cs);
-    CPUS390XState *env = &cpu->env;
+    CPUS390XState *env = cpu_env(cs);
     target_ulong vaddr, raddr;
     uint64_t asc, tec;
     int prot, excp;
@@ -600,8 +596,7 @@ bool s390_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 
 void s390x_cpu_debug_excp_handler(CPUState *cs)
 {
-    S390CPU *cpu = S390_CPU(cs);
-    CPUS390XState *env = &cpu->env;
+    CPUS390XState *env = cpu_env(cs);
     CPUWatchpoint *wp_hit = cs->watchpoint_hit;
 
     if (wp_hit && wp_hit->flags & BP_CPU) {
diff --git a/target/s390x/tcg/misc_helper.c b/target/s390x/tcg/misc_helper.c
index 89b5268fd4..8764846ce8 100644
--- a/target/s390x/tcg/misc_helper.c
+++ b/target/s390x/tcg/misc_helper.c
@@ -214,9 +214,7 @@ void HELPER(sckc)(CPUS390XState *env, uint64_t ckc)
 
 void tcg_s390_tod_updated(CPUState *cs, run_on_cpu_data opaque)
 {
-    S390CPU *cpu = S390_CPU(cs);
-
-    update_ckc_timer(&cpu->env);
+    update_ckc_timer(cpu_env(cs));
 }
 
 /* Set Clock */
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 8df00b7df9..9995689bc8 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6558,8 +6558,7 @@ void s390x_restore_state_to_opc(CPUState *cs,
                                 const TranslationBlock *tb,
                                 const uint64_t *data)
 {
-    S390CPU *cpu = S390_CPU(cs);
-    CPUS390XState *env = &cpu->env;
+    CPUS390XState *env = cpu_env(cs);
     int cc_op = data[1];
 
     env->psw.addr = data[0];
-- 
2.41.0

