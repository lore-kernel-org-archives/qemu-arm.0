Received: by 2002:a17:906:ca92:b0:a35:2c0b:b7b4 with SMTP id js18csp115905ejb;
        Fri, 26 Jan 2024 14:05:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVZuMXlZOkdcnv0AZlWlLW3jFDEqM83Jb41qrtsN7agarb0h85W2yLZz04xYYmhrNI/uIq
X-Received: by 2002:a05:6808:3089:b0:3bd:cc74:d6d with SMTP id bl9-20020a056808308900b003bdcc740d6dmr837655oib.8.1706306742488;
        Fri, 26 Jan 2024 14:05:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706306742; cv=none;
        d=google.com; s=arc-20160816;
        b=xGKSTKUuJYEOoj0SxAMTm6ZcMQOcaeHUOKjac4xfgMNzMpHu1zy2iqXo+XNDc9/o19
         Hpz9oQk2KBQRYbfVbZcftPkeN3oSBG/oVLBVTLRkCXaNMbfn1OSWUxYunn1EptjcVJWy
         OlHvtUfAv+X1lyLDfVvs5DpWG/4Tvx+rdUz0ISGvEX+FkyAZdmwNevFxIvWrM1QVi3XC
         RVInOMOKV0pbqIPC91qRosQnipsf/I0AEDCy3C7iNxm+gdZyxR9Qk9IOLgmGIRTt80Mh
         ANeYG4BIVGuLvSH81Tp3KnU58ixB9+3KohTJBkYDhKjAJOrZ5lik0KBSikmSK/8NLsQl
         sPqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cPu55INOwoo+R5I4TkxjPDT1q0XH169I9oVKNyLzarM=;
        fh=vjIQCdGIiQvlMQV4M7vu+NKSTn5p9Q4HADr8u1W/+iI=;
        b=JR/BhQSBkXOF2nqn94BYoaIkSAzliL8n+CjxoZbM16KwSRsQWEUqLjk6ehoYF61h7Y
         ltlzaayGDsLPpFi8GhJpa1MnQXa9mI/KYZA4tXHzLFvKotnW5yDanEOTFeM832b8OKBa
         99k2mSiyrdvb//OwPeNiOYVA8JXPi/K+gOpnYVmz7YkfJj77f8z37jj8Lks1KvBD8cKK
         k+Axb7VCpoFA9JdPAOkOefCKyVCSWjqw9mp4/26TaLRHr5f/deuIC9xjA3HUfC2Tome5
         9ZWdaWj3ntHFqgJQBEP/LGRmzsm6OVvNSX7AYEwjyUsArvYpqWeY9bs8ZM7keMr2EiEs
         v/ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oaEmwjqq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13-20020a05620a13ed00b0078314d62c12si2217956qkl.676.2024.01.26.14.05.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 14:05:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oaEmwjqq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTUKE-00086O-D9; Fri, 26 Jan 2024 17:05:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rTUJt-0007j9-6l
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 17:05:07 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rTUJn-0003gz-Um
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 17:05:03 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40eb033c1b0so13732135e9.2
 for <qemu-arm@nongnu.org>; Fri, 26 Jan 2024 14:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706306698; x=1706911498; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cPu55INOwoo+R5I4TkxjPDT1q0XH169I9oVKNyLzarM=;
 b=oaEmwjqqryulukgyuMsVx7oBIBceLgoF9Dy4vyFT3YN3HjnKJH+3ORTu4kB8UAPGEb
 70IF4CkptYf8o0qKG8XOXwqmt02YUQP6taFycl9yJ5yeEJ6t3BBcsE+QJwpDLIn/xnNN
 Uc0CtccIlWy7RquzXip6RgyiTZSVF7zqEKhyEYGF92/cZnoNNtA3TP7zmunYeTE7fFWG
 vW38+Y/frt7KC/HnsOVr8VJ6lsMno071c4khHvw5AW9XnCAQ/NSBK0s7nLkW8h7+t6Ve
 j0AzCLg0dAcPjJGhCMya9l/kviMlGCIVW2sEqogJf+Pd3zoyD7nGLhGPoZ772qn5V5o8
 1aSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706306698; x=1706911498;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cPu55INOwoo+R5I4TkxjPDT1q0XH169I9oVKNyLzarM=;
 b=JEss/k9xCXTXfvKiMcK0QSl3pWtUApInW84EJlC0NPVX+kJ3+1bfJBD0GmfYaE6Gfq
 Sk63ig2Iv5u+GyeXYxHRxyRb2VQZRN57go9T5skRm5bImEG9obc0eLvho0FXaZ7blV5E
 WbJQ5ihMD2NHbd8Kw07NKloTtXsLPOrenlbbl7kjFHaiiU7ZKzo2rxsonmOY5yoL0hBq
 c2/U/tD9pZ8Oeu32qJfaRCfFfcCqEr7Bt4IjHe8CA0/EJGJ0NDXdDjNBZrVyRZNwmTaB
 mXHsf6BlKrs0AvrR57/0lB7mIJSWQfKZg4ohOXVryMJilxfxCQ2eJFVqhMbkSQXG2k9W
 Xm5A==
X-Gm-Message-State: AOJu0YxDVL32rHdhGdwdAcUQKqCZ/06mf+GL8xID+F/CWN47TRlkkWCx
 M/CZXLQEMx4aXiYjSSxlM2piDJLh8JgBG6yErAsiJQZEPn4BkNtAp1JN9bTcvek=
X-Received: by 2002:a05:600c:1f91:b0:40c:610d:c2bf with SMTP id
 je17-20020a05600c1f9100b0040c610dc2bfmr319162wmb.16.1706306698503; 
 Fri, 26 Jan 2024 14:04:58 -0800 (PST)
Received: from m1x-phil.lan ([176.176.142.39])
 by smtp.gmail.com with ESMTPSA id
 fi5-20020a056402550500b005583e670df7sm1016030edb.73.2024.01.26.14.04.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Jan 2024 14:04:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 08/23] target/hppa: Prefer fast cpu_env() over slower CPU
 QOM cast macro
Date: Fri, 26 Jan 2024 23:03:50 +0100
Message-ID: <20240126220407.95022-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240126220407.95022-1-philmd@linaro.org>
References: <20240126220407.95022-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZFm16jCxHCUh

Mechanical patch produced running the command documented
in scripts/coccinelle/cpu_env.cocci_template header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/hppa/cpu.c        | 8 ++------
 target/hppa/int_helper.c | 8 ++------
 target/hppa/mem_helper.c | 3 +--
 3 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 14e17fa9aa..3200de0998 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -106,11 +106,8 @@ void hppa_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                   MMUAccessType access_type, int mmu_idx,
                                   uintptr_t retaddr)
 {
-    HPPACPU *cpu = HPPA_CPU(cs);
-    CPUHPPAState *env = &cpu->env;
-
     cs->exception_index = EXCP_UNALIGN;
-    hppa_set_ior_and_isr(env, addr, MMU_IDX_MMU_DISABLED(mmu_idx));
+    hppa_set_ior_and_isr(cpu_env(cs), addr, MMU_IDX_MMU_DISABLED(mmu_idx));
 
     cpu_loop_exit_restore(cs, retaddr);
 }
@@ -145,8 +142,7 @@ static void hppa_cpu_realizefn(DeviceState *dev, Error **errp)
 static void hppa_cpu_initfn(Object *obj)
 {
     CPUState *cs = CPU(obj);
-    HPPACPU *cpu = HPPA_CPU(obj);
-    CPUHPPAState *env = &cpu->env;
+    CPUHPPAState *env = cpu_env(CPU(obj));
 
     cs->exception_index = -1;
     cpu_hppa_loaded_fr0(env);
diff --git a/target/hppa/int_helper.c b/target/hppa/int_helper.c
index efe638b36e..d072ad2af7 100644
--- a/target/hppa/int_helper.c
+++ b/target/hppa/int_helper.c
@@ -99,8 +99,7 @@ void HELPER(write_eiem)(CPUHPPAState *env, target_ulong val)
 
 void hppa_cpu_do_interrupt(CPUState *cs)
 {
-    HPPACPU *cpu = HPPA_CPU(cs);
-    CPUHPPAState *env = &cpu->env;
+    CPUHPPAState *env = cpu_env(cs);
     int i = cs->exception_index;
     uint64_t old_psw;
 
@@ -268,9 +267,6 @@ void hppa_cpu_do_interrupt(CPUState *cs)
 
 bool hppa_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
-    HPPACPU *cpu = HPPA_CPU(cs);
-    CPUHPPAState *env = &cpu->env;
-
     if (interrupt_request & CPU_INTERRUPT_NMI) {
         /* Raise TOC (NMI) interrupt */
         cpu_reset_interrupt(cs, CPU_INTERRUPT_NMI);
@@ -280,7 +276,7 @@ bool hppa_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
 
     /* If interrupts are requested and enabled, raise them.  */
-    if ((env->psw & PSW_I) && (interrupt_request & CPU_INTERRUPT_HARD)) {
+    if ((cpu_env(cs)->psw & PSW_I) && (interrupt_request & CPU_INTERRUPT_HARD)) {
         cs->exception_index = EXCP_EXT_INTERRUPT;
         hppa_cpu_do_interrupt(cs);
         return true;
diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
index bb85962d50..7e73b80788 100644
--- a/target/hppa/mem_helper.c
+++ b/target/hppa/mem_helper.c
@@ -357,8 +357,7 @@ bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
                        MMUAccessType type, int mmu_idx,
                        bool probe, uintptr_t retaddr)
 {
-    HPPACPU *cpu = HPPA_CPU(cs);
-    CPUHPPAState *env = &cpu->env;
+    CPUHPPAState *env = cpu_env(cs);
     HPPATLBEntry *ent;
     int prot, excp, a_prot;
     hwaddr phys;
-- 
2.41.0

