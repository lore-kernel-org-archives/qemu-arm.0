Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp297897ejk;
        Mon, 29 Jan 2024 08:48:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEss1tJY0XO7M46obZ8E2gxKIx2c20KjtN3OtbqUY+TzaJpbFaA5EoDOVtATc1qGHe9jNw3
X-Received: by 2002:a17:906:41a:b0:a35:ad04:dcbc with SMTP id d26-20020a170906041a00b00a35ad04dcbcmr2213157eja.32.1706546892165;
        Mon, 29 Jan 2024 08:48:12 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706546892; cv=pass;
        d=google.com; s=arc-20160816;
        b=uTxHW9S5rwwIVo+7QtipgHrfYAFcmz5DpJAQzLin+kKAIfHlwZ589emnR0jMQjc1NM
         le92PWArsDF5cjB2J/ujEtc2jZPh1z6ukZVBlX7Cb3zAiVWhQ7hWTYbyWXO7qqvYlBTk
         eg4L4EbD7n5sPMuDHzkqpm3EJgRBkofmyIVkz9kbXG/4bIQsI/iNlJq+syMUddSTWhIH
         Hk2kOdr43G9CY0ks7MWij4mjxF/35Um63hpnIxuI93i51x7Yjb+D/DEbtJy9ZF6egjbP
         YbqzbFjr2daD10/K0dpHipiKkaXWsCEEGT4IhnPYZdSf+RPd+iGij7T1vrWrvPHi+Hn8
         W+wg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=81+lsllbL0HrT+oLcmb3UYRaeAjWMCareNwo8xEwpX8=;
        fh=9RcQkoHhly4eekpESwGAvQDpJOwyhxdHRU0k001VpW0=;
        b=dIYIKFRnhTJpxtIHabUG5v3UBwmlHfPG5IS5NIUIeSgliYmgRG99pCBNWgX2caJI7P
         JlLfqLRJyRAMZPqpdcBiySb2+COL1liTD9F3T4DvUWhe7elDqgdAgiKCirosk/Ufm+hi
         hbJhvSlTvygGDhgxQ8Bo/o5DcIVv0m+5M39ntmCBQm51CcVxpnLe54HVSyamZB8ODNlN
         XQCboqiCL0Ec73/dlDNY2ULc50e4Mw/uvOA+WAe9qiyfGcXi2gomRyYFrDFQtfF9p3im
         WwFzloKPvx+Mpin0KhVogXYyp1IUXI3w7zeriATGZ+82n+n7wfuonYyQ8yRspTYM8b1x
         710Q==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UzcqKaRY;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7366-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-7366-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-7366-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id ap5-20020a17090735c500b00a317f391ad4si3751818ejc.56.2024.01.29.08.48.12
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 08:48:12 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-7366-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UzcqKaRY;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7366-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-7366-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC11C1F22B50
	for <alex.bennee@linaro.org>; Mon, 29 Jan 2024 16:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C406156985;
	Mon, 29 Jan 2024 16:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UzcqKaRY"
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950BF155A50
	for <kvm@vger.kernel.org>; Mon, 29 Jan 2024 16:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706546845; cv=none; b=fpAKe/OzWh0U8ZjKeuhCq8v61uF2sYHgquOxBfY43RcdS49J+Sl8leg/Qzq8Jc6z2d+7SUKCQ2UCp31+/WvKfdHGehQn8cYObPwFSPHqeN7FEaMOWrsGJounh9AjAI5whHdBdJ7yuwu+up6bJEF9yY16O5QHnVZ4y0shVTABWfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706546845; c=relaxed/simple;
	bh=140Rng9id53kS0MMxeEfVWWXO1rFeuZvm0HGWxZTiSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sWIVUsjnq3i5EOQkCu684HWGxrJsMP+JuTdgmiz5Fg+qVbkRPtdON4wCDKu0Yj8tLa2RgRjrqgYIMooMgolrsd2oFqf8kYgzYrVGvX6M2d1U81/xUSvzVGHwUuZyW60Pvy+c7w88eRvsmjMW70mCoWVTbV+kdOedawuStmHZo3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UzcqKaRY; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40e5afc18f5so34957285e9.3
        for <kvm@vger.kernel.org>; Mon, 29 Jan 2024 08:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706546842; x=1707151642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81+lsllbL0HrT+oLcmb3UYRaeAjWMCareNwo8xEwpX8=;
        b=UzcqKaRY2Q/nfm9Jg1O7P1O51M23VsVQJWGjoo6VzSnXioGaJ2Kk4A8FljrEZ9I4X3
         LGfv+hddWaP44QUHqf2VcPWVxkN5T2MQxER68odLUG4ktBDVmHWa3NvNrT/Pn4G+LfQs
         XJfn+d/0qAULM4oIApSlWhgNFUYr3qzPxEmj+iCnwPly2fybRZqXyaVVXy0MwyH/BVDx
         q5CIkm2ihazssR7bbUgSuLFbvJ5PkoSLiCetlL+FSFpmZ+jQRTjCm844fz7DREmPorvG
         6HWvRvEwc2GPJCyt9VrteKeQ2foJ/WePGH1HMZYc0Sw0GUl8f+rWngAx+qjf0RNQd9VC
         i6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706546842; x=1707151642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81+lsllbL0HrT+oLcmb3UYRaeAjWMCareNwo8xEwpX8=;
        b=CWuqIADWymSjK/Xkg4jtNuHzzetJgEqLLde/FCXEGGnQOjGj/y3+8/sOyWiztaUBS8
         tExsherqEMBqkvSdxStGgSai+ABUCCKEncFB6DBPCeIcjkzSElRkdZcnJHM8C6JQrgMb
         b5Hb4MpC7QGKFiLROD39F2hFw96VERAOf5Zmd6lqd4IZexPN6tHjlPMqxjJklANhJSrW
         IqOxWNhxqSgZPuSn3mY8Lxw5lpbbvZO5V/LzTeYoSHI+AlgpWFFX+qyiU7MPjsXPTA9T
         8A7I5lFQMHXuP0zqoa0qgo5SjAv1iKLOymgPs2e4WXU6b0xiYAL45CtI1zFQbPhp1kZ7
         Cn0Q==
X-Gm-Message-State: AOJu0YwGmQvvgHtJPcgWDMWCnTfhg6YqnRHWFC2Mxbn8LBVRkY1gc9au
	poMgZ9zwwYaUw2FiqxisDLl8UirVzpyogJHj7zfSWEa1pMIFCwN+iaw1SZ2ULEI=
X-Received: by 2002:adf:fc46:0:b0:33a:eadb:f4cd with SMTP id e6-20020adffc46000000b0033aeadbf4cdmr2748018wrs.58.1706546841883;
        Mon, 29 Jan 2024 08:47:21 -0800 (PST)
Received: from m1x-phil.lan ([176.187.219.39])
        by smtp.gmail.com with ESMTPSA id p7-20020a5d4587000000b0033af670213dsm259833wrq.110.2024.01.29.08.47.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Jan 2024 08:47:21 -0800 (PST)
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
	Stafford Horne <shorne@gmail.com>
Subject: [PATCH v3 20/29] target/openrisc: Prefer fast cpu_env() over slower CPU QOM cast macro
Date: Mon, 29 Jan 2024 17:45:02 +0100
Message-ID: <20240129164514.73104-21-philmd@linaro.org>
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
X-TUID: doDZs3JQgns0

Mechanical patch produced running the command documented
in scripts/coccinelle/cpu_env.cocci_template header.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/openrisc/gdbstub.c   | 6 ++----
 target/openrisc/interrupt.c | 6 ++----
 target/openrisc/translate.c | 6 ++----
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/target/openrisc/gdbstub.c b/target/openrisc/gdbstub.c
index d1074a0581..c2a77d5d4d 100644
--- a/target/openrisc/gdbstub.c
+++ b/target/openrisc/gdbstub.c
@@ -23,8 +23,7 @@
 
 int openrisc_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
-    OpenRISCCPU *cpu = OPENRISC_CPU(cs);
-    CPUOpenRISCState *env = &cpu->env;
+    CPUOpenRISCState *env = cpu_env(cs);
 
     if (n < 32) {
         return gdb_get_reg32(mem_buf, cpu_get_gpr(env, n));
@@ -48,9 +47,8 @@ int openrisc_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 
 int openrisc_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 {
-    OpenRISCCPU *cpu = OPENRISC_CPU(cs);
     CPUClass *cc = CPU_GET_CLASS(cs);
-    CPUOpenRISCState *env = &cpu->env;
+    CPUOpenRISCState *env = cpu_env(cs);
     uint32_t tmp;
 
     if (n > cc->gdb_num_core_regs) {
diff --git a/target/openrisc/interrupt.c b/target/openrisc/interrupt.c
index d4fdb8ce8e..b3b5b40577 100644
--- a/target/openrisc/interrupt.c
+++ b/target/openrisc/interrupt.c
@@ -29,8 +29,7 @@
 
 void openrisc_cpu_do_interrupt(CPUState *cs)
 {
-    OpenRISCCPU *cpu = OPENRISC_CPU(cs);
-    CPUOpenRISCState *env = &cpu->env;
+    CPUOpenRISCState *env = cpu_env(cs);
     int exception = cs->exception_index;
 
     env->epcr = env->pc;
@@ -105,8 +104,7 @@ void openrisc_cpu_do_interrupt(CPUState *cs)
 
 bool openrisc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
-    OpenRISCCPU *cpu = OPENRISC_CPU(cs);
-    CPUOpenRISCState *env = &cpu->env;
+    CPUOpenRISCState *env = cpu_env(cs);
     int idx = -1;
 
     if ((interrupt_request & CPU_INTERRUPT_HARD) && (env->sr & SR_IEE)) {
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index ecff4412b7..12899c911d 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -1564,8 +1564,7 @@ static void openrisc_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
 static void openrisc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
-    OpenRISCCPU *cpu = OPENRISC_CPU(cs);
-    uint32_t insn = translator_ldl(&cpu->env, &dc->base, dc->base.pc_next);
+    uint32_t insn = translator_ldl(cpu_env(cs), &dc->base, dc->base.pc_next);
 
     if (!decode(dc, insn)) {
         gen_illegal_exception(dc);
@@ -1668,8 +1667,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int *max_insns,
 
 void openrisc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
-    OpenRISCCPU *cpu = OPENRISC_CPU(cs);
-    CPUOpenRISCState *env = &cpu->env;
+    CPUOpenRISCState *env = cpu_env(cs);
     int i;
 
     qemu_fprintf(f, "PC=%08x\n", env->pc);
-- 
2.41.0

