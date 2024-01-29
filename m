Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp298083ejk;
        Mon, 29 Jan 2024 08:48:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgKtqwuXp4524P6+1gRqU/CRtYQ0xDR1nRk7aQMdizjXVqUayZ0+xjf2SPaLCZNfRxCKGh
X-Received: by 2002:a17:902:e5cd:b0:1d8:b0bf:3e4a with SMTP id u13-20020a170902e5cd00b001d8b0bf3e4amr3093266plf.47.1706546910965;
        Mon, 29 Jan 2024 08:48:30 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706546910; cv=pass;
        d=google.com; s=arc-20160816;
        b=bkHydrr+PnFs8bTd7Bw/Bu5XczFkjdHdGDxqfFevhI+xxoXJ2brsOw/KtbiWlU52zk
         Z2R9evYaTAY8Kjw+NCSEo3tpHteF5opipnqZUe9nPgyiiK69o8YXyFaTXTCFtTwXSiYl
         A6ZrgcIhTVUrTPlCJ5FpwLgBejwA5CP/0v0GY3slZfkN+0YRjV7ZvnvTiCFsvnX2u5ww
         sLnXe0KoQIYCkG23iIquv/RWR2WSqBJS458xkkGKhhFkXhMVX6SY03deGSLxzXEe5fUI
         kdafxM0tGDVntBJRUoa+CTCZZiyJis004ouURBGzWvWFB6nn/FolLpQv83DnUeuYqpTJ
         gDqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=hwuuHYCScnVvYP7kr484+mrpPVY1E/98uP6CY+N7AAI=;
        fh=lLtufIS5JaCTKDxgV8fHPhJVpIAkrv0XCm/sFLfPF5A=;
        b=XJTEOp4a0Jv+x16WJcwxdkGTOe2nctKwHLRltaccyVDTu0B3x77mvr8+VdG0BHkR62
         6uUirK+BEVcW74PkfJs6IzKu4yxltVF6hfvVQ/7YJEMzXen34YcS1aN4nqdREuQvmgTL
         0uo6d9xFiQ9Pmeg8bKgbjJ7ulRxyy0ZqhyYZa4ZU/+qMU2dsCwQ5sFuRgJgZ6ab3dLUc
         vFthF5ho45/WZUvy8CcnWJKOw1TB90+q3cpxITkkXBf4ro/m3qn+jLNXlseYMuQTfgBp
         M3fxlayw+53dHuTooZG774EcUB8Nt+DGCHD4Hu42cvTaCzbDywkVLJwXy8n7zeZQCjPa
         AtMA==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WvzfPH5U;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7369-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-7369-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-7369-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id e1-20020a17090301c100b001d8ff3342fesi270636plh.42.2024.01.29.08.48.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 08:48:30 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-7369-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WvzfPH5U;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7369-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-7369-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67549284DEF
	for <alex.bennee@linaro.org>; Mon, 29 Jan 2024 16:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7CCD157E65;
	Mon, 29 Jan 2024 16:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WvzfPH5U"
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B392C15698A
	for <kvm@vger.kernel.org>; Mon, 29 Jan 2024 16:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706546863; cv=none; b=Sj746bLBm708m/5dI9YZs5fkwjGv0IgW7NMzWSql0LAMVCUe46esjClo6pQPFgeRe+GRi8G05HUEGnwv8gGfKcE1tCCr+HKKsZKY0BBLZDlNmlKcr5HfBgUnXL9lKARm4yKJ1VDcI93YTL4nbDGjXtlEyzlOylol36xlbRF0SAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706546863; c=relaxed/simple;
	bh=QYjGjhBDCTMFWPYYpcxlFURhO+NurhznI/Men2aYSsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t7StpUve5mBNPbKozx9Nsb3BsgPQz7A4S8gruyMAx4UbAGrX8huLrRVcLk1lGHQ/Q/lckqp+bBnEUlgUl27xdimSGgiOvhvCypwSErGDwDS0AqVWIx2ThjdY4wWp9mZqwEnZ075oh2kYIfB+pB/Jl1YUziqgGlUvyIXhrBOjmkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WvzfPH5U; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33aed096cb3so979388f8f.1
        for <kvm@vger.kernel.org>; Mon, 29 Jan 2024 08:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706546860; x=1707151660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwuuHYCScnVvYP7kr484+mrpPVY1E/98uP6CY+N7AAI=;
        b=WvzfPH5UjZGL9qAkrzkUjlCEdrefdYHdIrUF2wtazRxK2qPBfcXt0LLNX7ELh7UxrD
         xEp6NyLzj0WD8pTDTi/ZGF1fU7oWC1WVP9L6eM8pjYJBiUBm0ZyQpXe+XpYQOduz4VFs
         eSieVoO/kiwjSUABx9Bqt7IVcfQgtscqth0XtHUABm0TACSPvovS0e4zXTprdR90M4VX
         ZRSNCqZBOsjhyo81Hq6E9/SE0MfNrihfyc/tywNsj26oYUYgJfJc8fY/fLEfvUuRL6G8
         FeV4OgOcB/3xMPLD6fe60qAIf5EsafMD1aYbDcbGJRSX2PR9N+6WANZuqLyyeTJ8e6Hr
         oNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706546860; x=1707151660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwuuHYCScnVvYP7kr484+mrpPVY1E/98uP6CY+N7AAI=;
        b=RpSoNQQKckXBN0Hwnja+u5mUb/0M5/hYVPgxEE8Az4045hQOCeG1YcFDeunM6i9NOr
         pT1hAgsNmR7GMD40/5uTf/+CczwnM4S4HQ/96Zfpkc6m0cOf5Jva9vHOqFFiVZc1FFB5
         C5jUyZwZ+4X4kC5nP5bzueDA6fiYk35de7aIbQ8AUGCQ7CQhqXYOLw1o8fuaVlJdRr5X
         KRLNE40DMwwqDj6Rmpo7sObvgU4qzXTsnMj30O+9fhNy5IwZK5zhBuionlHsKs8yTYhi
         7g0oAdkDzRUkX+nFVHrQjatfL5F/Zb5BxHrawm2E7gM2E6vmtQRZ1SPsc00aqVAE/fCh
         0oMQ==
X-Gm-Message-State: AOJu0YwK5ifxtobxaKVPB2AqAOF5rydHlu3e3CY8s7pkd1RQgpuufkDJ
	j1cWbGR3HQxcKRxFofM9rWB8ABr4ftx+VgV/h3wSa7IaoXfGao4oMlPvnHjSPRGTtzGoXXkQDtj
	s
X-Received: by 2002:adf:f310:0:b0:33a:eae2:11a6 with SMTP id i16-20020adff310000000b0033aeae211a6mr2615980wro.37.1706546860049;
        Mon, 29 Jan 2024 08:47:40 -0800 (PST)
Received: from m1x-phil.lan ([176.187.219.39])
        by smtp.gmail.com with ESMTPSA id v9-20020adff689000000b0033af5c43155sm657193wrp.56.2024.01.29.08.47.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Jan 2024 08:47:39 -0800 (PST)
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
Subject: [PATCH v3 23/29] target/rx: Prefer fast cpu_env() over slower CPU QOM cast macro
Date: Mon, 29 Jan 2024 17:45:05 +0100
Message-ID: <20240129164514.73104-24-philmd@linaro.org>
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
X-TUID: 2YzuIi7ImZ7Q

Mechanical patch produced running the command documented
in scripts/coccinelle/cpu_env.cocci_template header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/cpu.c       | 4 ++--
 target/rx/gdbstub.c   | 6 ++----
 target/rx/helper.c    | 6 ++----
 target/rx/translate.c | 3 +--
 4 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 58ca26184d..4689587fa9 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -66,9 +66,9 @@ static bool rx_cpu_has_work(CPUState *cs)
 
 static void rx_cpu_reset_hold(Object *obj)
 {
-    RXCPU *cpu = RX_CPU(obj);
+    CPUState *cs = CPU(obj);
     RXCPUClass *rcc = RX_CPU_GET_CLASS(obj);
-    CPURXState *env = &cpu->env;
+    CPURXState *env = cpu_env(cs);
     uint32_t *resetvec;
 
     if (rcc->parent_phases.hold) {
diff --git a/target/rx/gdbstub.c b/target/rx/gdbstub.c
index d7e0e6689b..f222bf003b 100644
--- a/target/rx/gdbstub.c
+++ b/target/rx/gdbstub.c
@@ -21,8 +21,7 @@
 
 int rx_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
-    RXCPU *cpu = RX_CPU(cs);
-    CPURXState *env = &cpu->env;
+    CPURXState *env = cpu_env(cs);
 
     switch (n) {
     case 0 ... 15:
@@ -53,8 +52,7 @@ int rx_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 
 int rx_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 {
-    RXCPU *cpu = RX_CPU(cs);
-    CPURXState *env = &cpu->env;
+    CPURXState *env = cpu_env(cs);
     uint32_t psw;
     switch (n) {
     case 0 ... 15:
diff --git a/target/rx/helper.c b/target/rx/helper.c
index dad5fb4976..80912e8dcb 100644
--- a/target/rx/helper.c
+++ b/target/rx/helper.c
@@ -45,8 +45,7 @@ void rx_cpu_unpack_psw(CPURXState *env, uint32_t psw, int rte)
 #define INT_FLAGS (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIR)
 void rx_cpu_do_interrupt(CPUState *cs)
 {
-    RXCPU *cpu = RX_CPU(cs);
-    CPURXState *env = &cpu->env;
+    CPURXState *env = cpu_env(cs);
     int do_irq = cs->interrupt_request & INT_FLAGS;
     uint32_t save_psw;
 
@@ -122,8 +121,7 @@ void rx_cpu_do_interrupt(CPUState *cs)
 
 bool rx_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
-    RXCPU *cpu = RX_CPU(cs);
-    CPURXState *env = &cpu->env;
+    CPURXState *env = cpu_env(cs);
     int accept = 0;
     /* hardware interrupt (Normal) */
     if ((interrupt_request & CPU_INTERRUPT_HARD) &&
diff --git a/target/rx/translate.c b/target/rx/translate.c
index 1829a0b1cd..26aaf7a6b5 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -131,8 +131,7 @@ static int bdsp_s(DisasContext *ctx, int d)
 
 void rx_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
-    RXCPU *cpu = RX_CPU(cs);
-    CPURXState *env = &cpu->env;
+    CPURXState *env = cpu_env(cs);
     int i;
     uint32_t psw;
 
-- 
2.41.0

