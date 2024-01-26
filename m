Received: by 2002:a17:906:ca92:b0:a35:2c0b:b7b4 with SMTP id js18csp117211ejb;
        Fri, 26 Jan 2024 14:08:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEOz04mT+utFwJQRiMduGPXS6IYlrZiyxHzGfB2b96ZvIi30QnUiSoQ6sws74ZrrG5DRZX
X-Received: by 2002:ac8:5e0c:0:b0:42a:2ec3:e8d2 with SMTP id h12-20020ac85e0c000000b0042a2ec3e8d2mr643052qtx.50.1706306913192;
        Fri, 26 Jan 2024 14:08:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706306913; cv=none;
        d=google.com; s=arc-20160816;
        b=kZt1BHy0ncKiBwbL0ONx7Vt9rAhgCRbzZo32rb7Gb6JEGHE8wpDulWWgGvvNw+6ZRT
         rTw4w0Xa0GhnDvyIdEFLmX5MPmEZ+yXhZ2xoo0BS7qeywI+Fg8a9NgXLFnZjrfpzzK25
         YGkvuvo9HT9dZJJYRLDR6++s71IMXxtEnkiX7Gy0AmDJlv48gsk/kox5I7EXvKtr0zr8
         OassbieZRfyiepxB/hVdwxRN4P7i8mqrkwZTPSVrNcd6FSmHitc0TM/Wq95fcXGC7Fed
         S1cNfk8XiBYgfL9M9g7NJcArbsNw/qARiO/5rzeUPhCBKYiyYMCNf+GVBxpW+HGArrT6
         p+NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zizmHElFAIvWicITNbOdvMqLrgaV6VK2Xkw5hMOGCk4=;
        fh=RNOgpSlp5ZOB9sTVZ6jYOqp9uF9PNrrPqTHe/Ih7Dxw=;
        b=C65OjgAmwAM4KKSckD2iW+ZldqqIKRpVaMln0GHKYzTLONEbMcQpSs9ZBOO/Hx5J8h
         8ddA9IZaagZ+B9afndL0nWpO9O1W20jW0wG5MbLFkqAAT+hsXLldzPSO9PkeoLOgjQ+F
         7T30YtYqu8cPpRnd0F6CizpnFEGOm2oFcixLF00rr9ksrEtQxUg9LQJZv/Yqq/tPR2ks
         pBKyfhvWX9m8yEB3rGZA6VUUOD6Teqvp3arb4RpOhQiXa92mCIvfJ5NH8wHzcW5fHHCw
         TODQ886GIHsAD2/gggN2L6NCfMwAzV27K9Ftb09IYDsKYDrGtan5wPQLdnZywb5LnevX
         FsGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nFQXn2wn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p15-20020a05620a056f00b00783dea48185si1072201qkp.765.2024.01.26.14.08.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 14:08:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nFQXn2wn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rTULT-0003m9-7H; Fri, 26 Jan 2024 17:06:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rTUL1-0002Fj-9e
 for qemu-devel@nongnu.org; Fri, 26 Jan 2024 17:06:20 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rTUKw-0004V1-Lm
 for qemu-devel@nongnu.org; Fri, 26 Jan 2024 17:06:12 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40ea5653f6bso15444235e9.3
 for <qemu-devel@nongnu.org>; Fri, 26 Jan 2024 14:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706306768; x=1706911568; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zizmHElFAIvWicITNbOdvMqLrgaV6VK2Xkw5hMOGCk4=;
 b=nFQXn2wn0su/2fhfH36G5CywlddMX3O2r6a3CmIWy4b3QVYIfaX7N3FdpIvlU7XQVr
 QRlxGwmtqQLcCHcUUn5UpInwaaELgX72V5N0hfHS7E6824mn103VxaMrTcL/UNqhvbny
 LL5ZEN3tejjoilawlIwmuGCZbJ6Opy/TojRMxsrlYzgNtsPdDnC4qjPsgmskl1VhIW+G
 bLRR9TTL8x2KN2GKOytQ57kC3ugUJFQBY4kmrzGZZOYyhTBzKvuVxnIIZt32fTu7OVcB
 ZZHAoY9/3IcFNORUQC+4Xju50iNpy5Cma2Jz/kfioUAYMO1VbXerxsH/exJ9kUGVLB2I
 tS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706306768; x=1706911568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zizmHElFAIvWicITNbOdvMqLrgaV6VK2Xkw5hMOGCk4=;
 b=UYN8Sc0ZjPT6nHYYZ7Q/ij1Q6Hd8THo4YHyft0CLehMU7DEmJh5+Gd1fmm4AT6Qu/n
 pOrf8I/6L1HxGX/CTuS1jYf4yLshclvs4OQFldpVN09l9tMZ1getkzmtLnGu6Zs2Nn+d
 YMMw0Xc1HlwKkx0B9s0W54DsHSxtF83OINtQUkUO+JTPwYfGb0aiMTvcKI+FwPtwSDZ+
 wccEPApNh81fgSzgT/BoJ32P4G1n9Xg0p+CjS2mTRG9Wk1TGbqwloVdlAVF3Xi8Webz9
 nVkURJfAjoY3/FQhx+b4y+lRNEZu9abayzAPKlu5A86g5cVWQBh3cIm+v9l27CZGgo+H
 HqTA==
X-Gm-Message-State: AOJu0Yw8weDlCoQquRy3bTMkSRHFLJW2yYVaUep3KXoDRxEPa1RX/zvq
 1gcPg0ck6vghU4xQ5wPngLaIzhYmU3ZcNnRT2ba8Xq+6ZwOOYJFWmEJa+uIcLQ3XnAjWLqypPS2
 s
X-Received: by 2002:a05:600c:a082:b0:40e:e703:b1ec with SMTP id
 jh2-20020a05600ca08200b0040ee703b1ecmr307070wmb.24.1706306768281; 
 Fri, 26 Jan 2024 14:06:08 -0800 (PST)
Received: from m1x-phil.lan ([176.176.142.39])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c19d000b0040e4733aecbsm2912892wmq.15.2024.01.26.14.06.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Jan 2024 14:06:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: [PATCH v2 19/23] target/s390x: Prefer fast cpu_env() over slower CPU
 QOM cast macro
Date: Fri, 26 Jan 2024 23:04:01 +0100
Message-ID: <20240126220407.95022-20-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240126220407.95022-1-philmd@linaro.org>
References: <20240126220407.95022-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: udey+164QJ45

Mechanical patch produced running the command documented
in scripts/coccinelle/cpu_env.cocci_template header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/s390x/cpu-dump.c        |  3 +--
 target/s390x/gdbstub.c         |  6 ++----
 target/s390x/helper.c          |  3 +--
 target/s390x/kvm/kvm.c         |  6 ++----
 target/s390x/tcg/excp_helper.c | 11 +++--------
 target/s390x/tcg/translate.c   |  3 +--
 6 files changed, 10 insertions(+), 22 deletions(-)

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

