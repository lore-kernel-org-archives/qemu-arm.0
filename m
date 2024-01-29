Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp297100ejk;
        Mon, 29 Jan 2024 08:46:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8thZ17abG2BgwSVG4rTeYAoCCiZ4iG5qYxbsEEUthbi9KIH267ZssCyccurE1m+WUHmTC
X-Received: by 2002:a05:622a:19a7:b0:42a:b256:d490 with SMTP id u39-20020a05622a19a700b0042ab256d490mr98855qtc.4.1706546805680;
        Mon, 29 Jan 2024 08:46:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706546805; cv=pass;
        d=google.com; s=arc-20160816;
        b=yTwVSvcCjW8GK70Kl2eBu5eMk44LD+WZZ50a/FA5Z8zop1+l9fXiNYg78iw6VLxHyR
         4/r9gF2m6Vxvw97NXXpiXuFe4NJ6vwayiZamZY4iUQY8qVB7JO3FY67Zyy2+3/Vpq/gz
         l9cj8RVLhtby4m4czSKBhuxmGu1n+1DZFON7eqSZLD3W4coyLSwg4IgQykG+JnUBITJG
         7sAti77c4wkYvkDCmXkYGWEtJErjuoE5IcJPvkWPfQegXTlGqSrMhhzocHF/SukNDRPt
         yJqy63H1xJAbZT4s5wKTNrvPl8Vqtw59X3OtRZdNRgFQN6x1bxQQZ5gGP9BNWbAmozZ2
         9mKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=8fRIZrJNpcnOiODb5mhhkKtvMpcISUpGajS0aMN6lEM=;
        fh=7K9i0j/AOf8D4mzk94OEUEfvrz+Iir3hBGSXXaZzHJo=;
        b=JxWJZd8GEddoe/8Ib5xjR4GYW4AUtfZT+lD/h58W468/R7QUBqEvzzisVb6yBbJFCl
         qFHjyMfiFEu6Q02Wq9BMIGV7BocVymeCO5TtJl1yxIfuiZdkxpfrl251W/X8O7xhOWRP
         /Qa+4/DmQvXb+J3e1a8TBhdUnf12IOSuY1Db16eZ5j5v7KchJf992kOq2f4oQgmDHxcS
         izCBJYHwqx1duEN1f5F3goQXxUU6CHQRe+Ou621tKz2p5DXMeC8W5MIxZSYAV+eeCQFS
         2B1jZyik40Z3EUbxtfL0NjMHLy2XUkDqcDUjVvaLvrAOdyvxhrxD1HlUpeVvJGWaxG32
         g79g==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kwg3tjCY;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7358-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-7358-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-7358-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id h8-20020ac85e08000000b0042a5058669bsi7747306qtx.11.2024.01.29.08.46.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 08:46:45 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-7358-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kwg3tjCY;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7358-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-7358-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AD541C22913
	for <alex.bennee@linaro.org>; Mon, 29 Jan 2024 16:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59957155A5F;
	Mon, 29 Jan 2024 16:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kwg3tjCY"
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F205664D2
	for <kvm@vger.kernel.org>; Mon, 29 Jan 2024 16:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706546797; cv=none; b=aGDfE+BdWRBC+rcqt78a7vmVcoW+xBAE1Bqj0K73VM3LKjer0ufvbqgCBtqOPAEfl4UMfCJc04unEDvsRtuIV/71aOlreipUJn/waQBHtKGfh+AoiYfS39adhQtowCbBDoGHaDbHM8+rHoDXcCraOYenmLKJ3DgCG+5BmcgS9Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706546797; c=relaxed/simple;
	bh=6BDsv7A070RoaUFpsIQ7WVgc6V/2s5MvqDGqPLkgY3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JM4po9oQmkGmno0+r+F+UitGjAgwGPDcAP08hkh6Sd7Z1deJPpOUBCKmMv7io0G9x7iWS3lNUJlfto3HtMcmBB3UZYtQjRvRm7h7MoUUrpm1R6z2g5sxHptUoo4ZjuPrGl4r989YGWczZoWPj/HeZikJ2uaWkMbd88SCcvxjcOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kwg3tjCY; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40ef6c471d5so10101285e9.0
        for <kvm@vger.kernel.org>; Mon, 29 Jan 2024 08:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706546793; x=1707151593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fRIZrJNpcnOiODb5mhhkKtvMpcISUpGajS0aMN6lEM=;
        b=kwg3tjCYpuP0o1VrDOdr+lDroD+pqocOu/HTQ+946gmflNoPC/pMKjq3ruIZrXFKUz
         TC9g7V49m1ZvB5ZnPl1NpAoFk/Z7E6YIGdlqw7KiNr+2ZU0eBc+UDSin4N66kLDc3bHD
         F83tFUurs5EY6J00hZ2hZAN2FoEPIRW1cXsolVnDJGoCqYTP9/mI9iMWijse42PpQxmS
         r7xejHN35FSpIilGcjLcgfZ/XetjdVAKhyg99D5IWE0ERvkPmBC17L1vg6jZ5X0QRGBh
         EjLxilYh9eo/zPTOBkbXDJvaWuylgu6ah/ApyrzfUfVsMSWsTN0o4VeqpX4RJiFECorz
         Bhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706546793; x=1707151593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8fRIZrJNpcnOiODb5mhhkKtvMpcISUpGajS0aMN6lEM=;
        b=NCiZ9MLuE1cIbeYjT2/rBAgc7ER/1OTCZaOGB6/taDKPqyQFDGCZBOuvoPi4Azu26P
         PvAFmTgRvp/fjOhpTu0KxtUYdO0AsA1q0BX0nDR5CzUiljNtSpI/N9SKMOsltrmwXSJF
         lg0jLL3E+vPMeNlpcui4ByjSwa4rDL5GeLKF3IkuVS0yKFXFH1UAH169bMvtDvRN1VFl
         vAVfmzltE4opqNRds85Uq+/FoE4bPDkAAGVzHGMT/CR5c9B4q/+Hryioy4QP3T8tPWvl
         b31yfqmhn3HzlNYQEfqnnQq/DgwWj9sYLBP4VOaJa4/UYPn2YgUckZOYhdJ/ClT95TL6
         3Y8w==
X-Gm-Message-State: AOJu0YyN4kCXMxDrKHB5qYxfoBKZIQS2exFCwzCWekEKtE2Kg9hgq+V0
	fCSMssDxOLaB2GB8/bScnbTLA1TGndxmiYP5VtZHgXgo+7UbFdimaK1JMt2Ykp0=
X-Received: by 2002:a05:600c:1986:b0:40e:e97c:e71 with SMTP id t6-20020a05600c198600b0040ee97c0e71mr6257966wmq.1.1706546793662;
        Mon, 29 Jan 2024 08:46:33 -0800 (PST)
Received: from m1x-phil.lan ([176.187.219.39])
        by smtp.gmail.com with ESMTPSA id w18-20020a05600c475200b0040e9f7308f4sm10656778wmo.10.2024.01.29.08.46.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Jan 2024 08:46:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 12/29] target/hppa: Prefer fast cpu_env() over slower CPU QOM cast macro
Date: Mon, 29 Jan 2024 17:44:54 +0100
Message-ID: <20240129164514.73104-13-philmd@linaro.org>
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
X-TUID: Ngin0AX12RGl

Mechanical patch produced running the command documented
in scripts/coccinelle/cpu_env.cocci_template header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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

