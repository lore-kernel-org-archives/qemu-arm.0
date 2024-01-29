Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp298974ejk;
        Mon, 29 Jan 2024 08:50:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqqyKQcAWMBSMkGVVUyFIZS/G9iYeBoRRPMaGvagit+EI7GyCVZLa3/4mjaxdqfbqi1xKr
X-Received: by 2002:a05:6402:26d4:b0:55c:cdbf:b741 with SMTP id x20-20020a05640226d400b0055ccdbfb741mr5590723edd.6.1706547008007;
        Mon, 29 Jan 2024 08:50:08 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706547007; cv=pass;
        d=google.com; s=arc-20160816;
        b=00oBcbsqwiovv4EklRyWtiNN6jICaDwmiqdVdO9TYTqrR/YbBxUEPfnbDSy7UvgvTy
         P1BlNv0QeTjA0j1x/cQ4R57cEyL+52f8cd2YfNFSLo2zRrdyt97MUg98S7+wVSlW7v0o
         tQ2TRfiT6ZEKUXF6Mo+tJ3tz7kQf7ap4MHliEV5iCP4jI93fqzjzDUWUUeTlnXFH0F0c
         vb0A9leVHR+ktQqYJAZXF+Td1jegsegfg9PQtPWEW9BqVTGqUUy+VMiF93f3Klv/8hs/
         WQ+WmFLW2eELWv7IgSQ3YuOtquET0R64cgrv7ISwr8mZ1KIK72u1EJYGM4oju0Mf0L5S
         aKFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=Kk5BhQRPM94EKsRIhVMqYgmcfDsB7owy8rOzxcGC7OQ=;
        fh=/epBWcCUTWsqGs5aSzxrp78EPibek5jU0534W23ucj0=;
        b=NXWSzDtsWMJj2Sz4dMYHyRXxYSl2zsArFEsR6BkPsfpJ1CZp59PTSU5Eq86u6CA1SR
         xbjiK2pfSSpazhGjZkBDGyScR0FtUXaZK1nn1RFd0i5kZRRZ4JsinhnwxEvjGEJUmM0M
         yJW0VPh7CwkgEZMH8O5oC8sqgT+N2WXyohnUe95yGegVIYanysoatbgsVL5F2VhH9/PE
         YfkC0VImHQ9cOUpZ8A5vsW+Hvs557LgOGveYl1i6oNfEjah1qM6PiRHuvhs591XxE42V
         YilNLB4eo6HFJvVm4z6xeCYU4AZhNSzQSSZbbFBtBzRo56OiYoKDq+gDMPS1Tdu/cD1S
         ca1A==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="U/cVr4+v";
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7375-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-7375-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-7375-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id r19-20020aa7cb93000000b0055c29685f67si3777895edt.314.2024.01.29.08.50.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 08:50:07 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-7375-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="U/cVr4+v";
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7375-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-7375-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AF191F24842
	for <alex.bennee@linaro.org>; Mon, 29 Jan 2024 16:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33800157020;
	Mon, 29 Jan 2024 16:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U/cVr4+v"
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE2215444C
	for <kvm@vger.kernel.org>; Mon, 29 Jan 2024 16:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706546901; cv=none; b=egl244rBzorA5fjNL0DgwS04jaWJHoXJRXslkamRknrBTgNjzt2G0WDqZFc27VuqMoHmgsZilQtc78/bEdWMaR041lTnLPD3WSIdDhjaJf6ck0wnEkBSW//wMGjS0XKxAhcU4mZiNblGZBPBL4EwtJmnldMNe3SKqgVC2A7QYKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706546901; c=relaxed/simple;
	bh=3sq3TTLsqoGsvdIWeTk/CkIR++kaDX/1diTBVrNbPgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hZ8h6Sjh0jua9vv6Xnp0XqzU8gUxZOAgv0f5tttLK8IqYySeT0ihJB92mtQ4tPitr/Qb7bKn86459936JlQjuWLLG6cqXHLVxliXaMJuHNudsWkKTdcjkzJSnzLui69IvELz9EjGCdxRQB/IC1x1GJeS69PR8qzarY6+VUO6Enk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U/cVr4+v; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40efcd830f6so1476845e9.0
        for <kvm@vger.kernel.org>; Mon, 29 Jan 2024 08:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706546897; x=1707151697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kk5BhQRPM94EKsRIhVMqYgmcfDsB7owy8rOzxcGC7OQ=;
        b=U/cVr4+vJdXysSyVknjJs6CE0SbXDDWAcRIEVE9Gggsd3aP1XpOKGGx7wSCbGyNh0X
         AYTaieHR8avyMQ1WE+UiabPmuBFAIFpO7035BQKpVtXWtXVCvqIx0uBIyBHHVcPKrRE7
         MissQpDU8rWs0Zp1EUZEbhxEZdF81TwBTVuDNQO7BaepdO3QKHRmgNINxC+1jup8GuVt
         A8Xkd53XRRKAriFYNw7R7Pwn7UZkaxTPsvBJX5nmzp3UPFIVjIDMGzeR4XzPtitbQmrb
         proTH3EoLZVzoSMCvEn1GPab4/pKA7tWsCEoNHviih497TO+1DqGnTCFJu33JYE9Abzm
         8pnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706546897; x=1707151697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kk5BhQRPM94EKsRIhVMqYgmcfDsB7owy8rOzxcGC7OQ=;
        b=w3lbMrYiHbpzd40SddVpBGRfQx0b5FvaCrW4yx+lEFX9QfO1q6CFxpzV+QA5icLqwO
         v0hEFFl/INi0m+JFigjhuopEQeaWoFHojQ9MX6OUeWh6BG54L0Er0447/t74CnLnCFXF
         5H4cL9Ysom2E+uNHqxz7ub21Gku4IHCrftVOkhks0+SN9u5hP8pldUDzwDOMhmJxhO+q
         8NX1oF1BL8rnoENRFOfIcMCWYnY1ckdFttqoVULavI7HSXs6NoUjBkD5ijr8V7Cwz507
         HLJ1/z3/ZRyfG8PdMwJvIZKWJAI6II9kjtfCw45AcDczeHZ4sX6S1Tm80K/ValS1GP1v
         x6HA==
X-Gm-Message-State: AOJu0YxNB9Tw9owD8NoE5gV2KxCFSEZ9MrnR2QHWDmov3H6EWfR3kvxF
	IXLTKWwFhIYAa0jKC0EybtkCkcK8rwcuNhBvKHRNbQhrOqMsgtRHTAHVJn81JxE=
X-Received: by 2002:adf:db11:0:b0:337:c91d:e816 with SMTP id s17-20020adfdb11000000b00337c91de816mr4734391wri.1.1706546897611;
        Mon, 29 Jan 2024 08:48:17 -0800 (PST)
Received: from m1x-phil.lan ([176.187.219.39])
        by smtp.gmail.com with ESMTPSA id ck8-20020a5d5e88000000b003392986585esm8609742wrb.41.2024.01.29.08.48.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Jan 2024 08:48:17 -0800 (PST)
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
	Warner Losh <imp@bsdimp.com>,
	Kyle Evans <kevans@freebsd.org>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v3 29/29] user: Prefer fast cpu_env() over slower CPU QOM cast macro
Date: Mon, 29 Jan 2024 17:45:11 +0100
Message-ID: <20240129164514.73104-30-philmd@linaro.org>
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
X-TUID: d3a4Ox6y0kd+

Mechanical patch produced running the command documented
in scripts/coccinelle/cpu_env.cocci_template header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 bsd-user/signal.c   | 3 +--
 linux-user/signal.c | 6 ++----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index ca31470772..c6f0b1be38 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -463,14 +463,13 @@ static int fatal_signal(int sig)
 void force_sig_fault(int sig, int code, abi_ulong addr)
 {
     CPUState *cpu = thread_cpu;
-    CPUArchState *env = cpu_env(cpu);
     target_siginfo_t info = {};
 
     info.si_signo = sig;
     info.si_errno = 0;
     info.si_code = code;
     info.si_addr = addr;
-    queue_signal(env, sig, QEMU_SI_FAULT, &info);
+    queue_signal(cpu_env(cpu), sig, QEMU_SI_FAULT, &info);
 }
 
 static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
diff --git a/linux-user/signal.c b/linux-user/signal.c
index c9527adfa3..f78f7fc476 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -623,7 +623,6 @@ void signal_init(void)
 void force_sig(int sig)
 {
     CPUState *cpu = thread_cpu;
-    CPUArchState *env = cpu_env(cpu);
     target_siginfo_t info = {};
 
     info.si_signo = sig;
@@ -631,7 +630,7 @@ void force_sig(int sig)
     info.si_code = TARGET_SI_KERNEL;
     info._sifields._kill._pid = 0;
     info._sifields._kill._uid = 0;
-    queue_signal(env, info.si_signo, QEMU_SI_KILL, &info);
+    queue_signal(cpu_env(cpu), info.si_signo, QEMU_SI_KILL, &info);
 }
 
 /*
@@ -641,14 +640,13 @@ void force_sig(int sig)
 void force_sig_fault(int sig, int code, abi_ulong addr)
 {
     CPUState *cpu = thread_cpu;
-    CPUArchState *env = cpu_env(cpu);
     target_siginfo_t info = {};
 
     info.si_signo = sig;
     info.si_errno = 0;
     info.si_code = code;
     info._sifields._sigfault._addr = addr;
-    queue_signal(env, sig, QEMU_SI_FAULT, &info);
+    queue_signal(cpu_env(cpu), sig, QEMU_SI_FAULT, &info);
 }
 
 /* Force a SIGSEGV if we couldn't write to memory trying to set
-- 
2.41.0

