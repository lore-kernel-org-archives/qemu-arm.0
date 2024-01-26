Received: by 2002:a17:906:ca92:b0:a35:2c0b:b7b4 with SMTP id js18csp115399ejb;
        Fri, 26 Jan 2024 14:04:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNM/h/SK8lUkVFoZ+uHINThdII3KPw6YBQETh3wftZ/8RJEBRSAHI9yBHHPi4mgOLABaG/
X-Received: by 2002:a17:902:eb87:b0:1d8:a56d:4e8e with SMTP id q7-20020a170902eb8700b001d8a56d4e8emr475039plg.62.1706306691952;
        Fri, 26 Jan 2024 14:04:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706306691; cv=pass;
        d=google.com; s=arc-20160816;
        b=CbJUMq7Ys157cNZdPoYMC6tU9jzO6P7kjGClsL5Z6HJO3pTyPxn9HZzmyIh3k/xWD5
         LQl00OvGwp6OFdyXY6mxPm1kNkpmvwHwF8rZCzWsNIvb5cizj22AhSvmb2LEWw4qTLWZ
         lOh7ZyZFVaN4xxNg8wFm8BfubuykHlShIJjYZwgxQtC0bxk7GE3+7e98SPf6p8DALdNf
         gU1UYS2KP8uNB3/WI7VPSjWRMGXPf2HGhoey2w4Lepmxi6yTRH9+vYqtH2Zd0Rdt9uqh
         U2ZT1IjAuFDjnGF19hnnF5fhbjCnlrlWzWYwqqzXeKIb+oB5SZmWHewVWKxtLQh8uy+6
         XSig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=vZRGd7bldk8q+PytOQG4zQL+je/AXd973w95qInnP0Y=;
        fh=vjIQCdGIiQvlMQV4M7vu+NKSTn5p9Q4HADr8u1W/+iI=;
        b=S+QJMq4nD9bOQJFh1Ty/0m3/JH3PfAe5heJ/0AM6RqvIEXZjyVjVb1v0xbur5poH/u
         51S6DydNEJKJ7KLZpRS3YFkPpnSdOTg+UDNdWsEWqrwHqrf5K3fncXoyEuuwaaeQ2+ia
         KwVrh3hPtjYFoTi8PCkuA2q6+A4pnhckIxP1aiJfKzFCwSsSsNGplRNuqsO6KG37N7X2
         M0/5PLiVYqSiDaoFFiwnUTpqmeYkiWfONz7NJiRLCm5RxhqRwEU7jVG/vTvyXU6PjgoV
         vISY1F4Mz9uOkXsxVcvsdBI9C/JM1aBK0/B7Qvb4GGkejtDh1+tq3Qj05kwWzQT1kWSy
         Uw5A==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qZrnyk6z;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7218-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-7218-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-7218-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id jc10-20020a17090325ca00b001d72da06725si1721626plb.214.2024.01.26.14.04.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 14:04:51 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-7218-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qZrnyk6z;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7218-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-7218-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2B28B22459
	for <alex.bennee@linaro.org>; Fri, 26 Jan 2024 22:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A242511A;
	Fri, 26 Jan 2024 22:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qZrnyk6z"
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1F025115
	for <kvm@vger.kernel.org>; Fri, 26 Jan 2024 22:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706306678; cv=none; b=Rl8WzKRZ+Ho4zUduiv1UxDSJ/k0/p2aP2A7aeMC7d7Raa4qKAHjaz+UbMhTSB5FXxxcHC4vXaa7HdAKQ6p/1x1Vp11sWEgcsFkiclO48f8Vvak0ksVTNj4Bmge8qHtOxyXH6tX3svRTCu4VibHxJN3E+SQs/Vy8S4YLVfvU8DkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706306678; c=relaxed/simple;
	bh=dbPDQ5qhxaUYEAtb9kO6eE7MYEQcULKhNtaXfcS0oNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MmUvtnE66uj8TlvDEnOlvYOJiO+GRYC/TW1tKr/HKDXRgjzG4jf3QexlVhCLC0uRbjDLIjokISpqtwAmyHq1z8Rxt1RnZ5bnplHk5ibv+m3L/kv4PRlUjpyIASljUXylFHcI0AcPu6G78Vp4t0O5bAq5rJ8ISu3ComS2INt5vpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qZrnyk6z; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a277339dcf4so76719766b.2
        for <kvm@vger.kernel.org>; Fri, 26 Jan 2024 14:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706306674; x=1706911474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZRGd7bldk8q+PytOQG4zQL+je/AXd973w95qInnP0Y=;
        b=qZrnyk6zenpDXzI7dfzlXD/Qhw85WhSl+j2ibqXhN9AD4QA2UY4JLFynNWN9UpWo8q
         CsSFg7GTSHlhf3qXxBbWeKu8A+FpqdyctwRT24IeRb5IcEfQ7i2VJlQ0mIC0aaPY1q0W
         D832PpAOWuhOp6Y5JzbCG/P1bFnMapxTlFn1zjjtd96r0UpRcO0CXu8tFy1GDgZ6vM19
         D8vFRiUdbwwytS0SiGNTXZC0SDxKaIMIpCZ3ItDeMkidEQlpcniDymBiMwES65J9oBvh
         BUGtJOjfuWKjfJjpKSQHW+/hzMGeQh3Xn8VSaFH5itxgClXbLUX+CuWfY+XNwkwX1oIp
         3WTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706306674; x=1706911474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZRGd7bldk8q+PytOQG4zQL+je/AXd973w95qInnP0Y=;
        b=A8ZxNoapWq0sEE0y6sDCkO5H5lMG2Y7/PK8ZRMPG5JKZXMf+Qz9LzCtbJvAnBFDRDq
         79TwdR+9b6EDKg9aUvJG1Wv4YKiTT9toim64nmFWTJM+JOds3mCHCxkGGUiBkmJd4NX6
         e8bmR+u0oEewRV5agIxZfGutv04eXHuXzrKDeamwgfj2KUic3NIPG0NG+siKvDRkMC62
         Um7TjVBDnbTbF2vti/rrmL2Ix5k0ENVDPemm//7PWUBCGeV0gl1s1Wl/BKBh8J2OvBDM
         fR/T2FqU/XyuRTwDI01x6fVgO6NKBy1NkYcpmkL+oFFoAcfQN4EAEW1JX4SfNeu/gtKs
         +hSA==
X-Gm-Message-State: AOJu0YyIaujwmdAhHWpygXUgf1nUEa/QQjjmuFVwOp2BCQ5sEaI1H7GT
	2gJ6d4YiAqyjOarAo9tZf39Ke2DjqWzOOGXHUFtqDTANXdkvh6IS+1vx0Mi0pDQ=
X-Received: by 2002:a17:906:adcb:b0:a2f:15b8:cbcd with SMTP id lb11-20020a170906adcb00b00a2f15b8cbcdmr203155ejb.8.1706306674546;
        Fri, 26 Jan 2024 14:04:34 -0800 (PST)
Received: from m1x-phil.lan ([176.176.142.39])
        by smtp.gmail.com with ESMTPSA id k25-20020a17090646d900b00a316490ddbbsm1039815ejs.200.2024.01.26.14.04.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jan 2024 14:04:34 -0800 (PST)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 04/23] target/alpha: Prefer fast cpu_env() over slower CPU QOM cast macro
Date: Fri, 26 Jan 2024 23:03:46 +0100
Message-ID: <20240126220407.95022-5-philmd@linaro.org>
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
X-TUID: VwiicSgRcDcL

Mechanical patch produced running the command documented
in scripts/coccinelle/cpu_env.cocci_template header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/alpha/cpu.c        | 31 +++++++------------------------
 target/alpha/gdbstub.c    |  6 ++----
 target/alpha/helper.c     | 12 ++++--------
 target/alpha/mem_helper.c | 11 +++--------
 4 files changed, 16 insertions(+), 44 deletions(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index b8ed29e343..e21a8936c7 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -130,40 +130,27 @@ static ObjectClass *alpha_cpu_class_by_name(const char *cpu_model)
 
 static void ev4_cpu_initfn(Object *obj)
 {
-    AlphaCPU *cpu = ALPHA_CPU(obj);
-    CPUAlphaState *env = &cpu->env;
-
-    env->implver = IMPLVER_2106x;
+    cpu_env(CPU(obj))->implver = IMPLVER_2106x;
 }
 
 static void ev5_cpu_initfn(Object *obj)
 {
-    AlphaCPU *cpu = ALPHA_CPU(obj);
-    CPUAlphaState *env = &cpu->env;
-
-    env->implver = IMPLVER_21164;
+    cpu_env(CPU(obj))->implver = IMPLVER_21164;
 }
 
 static void ev56_cpu_initfn(Object *obj)
 {
-    AlphaCPU *cpu = ALPHA_CPU(obj);
-    CPUAlphaState *env = &cpu->env;
-
-    env->amask |= AMASK_BWX;
+    cpu_env(CPU(obj))->amask |= AMASK_BWX;
 }
 
 static void pca56_cpu_initfn(Object *obj)
 {
-    AlphaCPU *cpu = ALPHA_CPU(obj);
-    CPUAlphaState *env = &cpu->env;
-
-    env->amask |= AMASK_MVI;
+    cpu_env(CPU(obj))->amask |= AMASK_MVI;
 }
 
 static void ev6_cpu_initfn(Object *obj)
 {
-    AlphaCPU *cpu = ALPHA_CPU(obj);
-    CPUAlphaState *env = &cpu->env;
+    CPUAlphaState *env = cpu_env(CPU(obj));
 
     env->implver = IMPLVER_21264;
     env->amask = AMASK_BWX | AMASK_FIX | AMASK_MVI | AMASK_TRAP;
@@ -171,16 +158,12 @@ static void ev6_cpu_initfn(Object *obj)
 
 static void ev67_cpu_initfn(Object *obj)
 {
-    AlphaCPU *cpu = ALPHA_CPU(obj);
-    CPUAlphaState *env = &cpu->env;
-
-    env->amask |= AMASK_CIX | AMASK_PREFETCH;
+    cpu_env(CPU(obj))->amask |= AMASK_CIX | AMASK_PREFETCH;
 }
 
 static void alpha_cpu_initfn(Object *obj)
 {
-    AlphaCPU *cpu = ALPHA_CPU(obj);
-    CPUAlphaState *env = &cpu->env;
+    CPUAlphaState *env = cpu_env(CPU(obj));
 
     env->lock_addr = -1;
 #if defined(CONFIG_USER_ONLY)
diff --git a/target/alpha/gdbstub.c b/target/alpha/gdbstub.c
index 0f8fa150f8..13694fd321 100644
--- a/target/alpha/gdbstub.c
+++ b/target/alpha/gdbstub.c
@@ -23,8 +23,7 @@
 
 int alpha_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
-    AlphaCPU *cpu = ALPHA_CPU(cs);
-    CPUAlphaState *env = &cpu->env;
+    CPUAlphaState *env = cpu_env(cs);
     uint64_t val;
     CPU_DoubleU d;
 
@@ -59,8 +58,7 @@ int alpha_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 
 int alpha_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 {
-    AlphaCPU *cpu = ALPHA_CPU(cs);
-    CPUAlphaState *env = &cpu->env;
+    CPUAlphaState *env = cpu_env(cs);
     target_ulong tmp = ldtul_p(mem_buf);
     CPU_DoubleU d;
 
diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index 970c869771..eeed874e5a 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -298,8 +298,7 @@ bool alpha_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr)
 {
-    AlphaCPU *cpu = ALPHA_CPU(cs);
-    CPUAlphaState *env = &cpu->env;
+    CPUAlphaState *env = cpu_env(cs);
     target_ulong phys;
     int prot, fail;
 
@@ -325,8 +324,7 @@ bool alpha_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
 
 void alpha_cpu_do_interrupt(CPUState *cs)
 {
-    AlphaCPU *cpu = ALPHA_CPU(cs);
-    CPUAlphaState *env = &cpu->env;
+    CPUAlphaState *env = cpu_env(cs);
     int i = cs->exception_index;
 
     if (qemu_loglevel_mask(CPU_LOG_INT)) {
@@ -435,8 +433,7 @@ void alpha_cpu_do_interrupt(CPUState *cs)
 
 bool alpha_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
-    AlphaCPU *cpu = ALPHA_CPU(cs);
-    CPUAlphaState *env = &cpu->env;
+    CPUAlphaState *env = cpu_env(cs);
     int idx = -1;
 
     /* We never take interrupts while in PALmode.  */
@@ -487,8 +484,7 @@ void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         "a0",  "a1",  "a2", "a3",  "a4", "a5", "t8", "t9",
         "t10", "t11", "ra", "t12", "at", "gp", "sp"
     };
-    AlphaCPU *cpu = ALPHA_CPU(cs);
-    CPUAlphaState *env = &cpu->env;
+    CPUAlphaState *env = cpu_env(cs);
     int i;
 
     qemu_fprintf(f, "PC      " TARGET_FMT_lx " PS      %02x\n",
diff --git a/target/alpha/mem_helper.c b/target/alpha/mem_helper.c
index a39b52c5dd..872955f5e7 100644
--- a/target/alpha/mem_helper.c
+++ b/target/alpha/mem_helper.c
@@ -42,18 +42,14 @@ static void do_unaligned_access(CPUAlphaState *env, vaddr addr, uintptr_t retadd
 void alpha_cpu_record_sigbus(CPUState *cs, vaddr addr,
                              MMUAccessType access_type, uintptr_t retaddr)
 {
-    AlphaCPU *cpu = ALPHA_CPU(cs);
-    CPUAlphaState *env = &cpu->env;
-
-    do_unaligned_access(env, addr, retaddr);
+    do_unaligned_access(cpu_env(cs), addr, retaddr);
 }
 #else
 void alpha_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                    MMUAccessType access_type,
                                    int mmu_idx, uintptr_t retaddr)
 {
-    AlphaCPU *cpu = ALPHA_CPU(cs);
-    CPUAlphaState *env = &cpu->env;
+    CPUAlphaState *env = cpu_env(cs);
 
     do_unaligned_access(env, addr, retaddr);
     cs->exception_index = EXCP_UNALIGN;
@@ -67,8 +63,7 @@ void alpha_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                      int mmu_idx, MemTxAttrs attrs,
                                      MemTxResult response, uintptr_t retaddr)
 {
-    AlphaCPU *cpu = ALPHA_CPU(cs);
-    CPUAlphaState *env = &cpu->env;
+    CPUAlphaState *env = cpu_env(cs);
 
     env->trap_arg0 = addr;
     env->trap_arg1 = access_type == MMU_DATA_STORE ? 1 : 0;
-- 
2.41.0

