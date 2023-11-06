Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2677914eja;
        Mon, 6 Nov 2023 03:07:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3xC0qVmlNOSpVy8HvQ1wncva408WqIdEVT3imiGBLTmTAZMrkQzDImEEDwgSa9b0OYNfV
X-Received: by 2002:a05:6808:f8e:b0:3a7:2690:94e0 with SMTP id o14-20020a0568080f8e00b003a7269094e0mr37518923oiw.4.1699268833447;
        Mon, 06 Nov 2023 03:07:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699268833; cv=none;
        d=google.com; s=arc-20160816;
        b=YyLryBusywQS4HMd4znb/JgaN0YgR/s5Dv2TF2/HvNC7nRdEILWvV72KIjlQycSdRq
         MyLKu6vzQdxuxNxOj4JeUtYqU5du6Ju43MLiKTpHoMIE4/dpkMf4uaovRtjbRAPm+Y+w
         pk1SUo0plLngSiooi3W5+zdls7GJtydq7eC15ai42lkmjpRS4P6UQpPSnpxVQXy1n7d5
         Bb6GNqFXN27s0OgAGTvxIV0LkE/rFNiR3ZgV/ukPrJp5yL80K+69pZhZPSqVWyiyobBd
         GrnQYkQbzP2wgvBt5sGX9+nPZEGbeas9DwDg9ICbU+I9g54/WI0VBN0AiXsJDW8ma54A
         Otpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=fVCnzhVZzYM83NLjfDBn8N7f5t+G1396ppAvAy7GW2E=;
        fh=M7LpSu7Ta78I+2rWAN95QEp5TLITKFQ2uBdD4PuAGlE=;
        b=zCvxvpbUgTVO010uBzhTeeEH7Ct8ietgg1GpYDqDECP4vyjVcvbV1vS1RuIJzDlORq
         kSpngrVnQbq1YAXT4nSYaO/mj/AE7q4qdTMvQXQubMgMUh2D9BHizTuBzYtnJlSGjyZc
         A64M4NDlg73ig16r6uLFmjv908yqS2T/kLqxKtf9zqlDa57pw5B9IQdQFM7UBHBajz8Q
         1z0zg7Fk+8Np4guIYy8YiiydoG6PXG1sBHbkoJuW8iMBxNT6ILiU3fdLqAgaBmhDMutP
         VL5AvDF7Me9Wa8UkNLvg/oD1ECnATh1yr2YOSCBxOUgHQYHRTyNvYqHfZCFVI8LE/ydf
         me9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=alp2M5ul;
       spf=pass (google.com: domain of kvm+bounces-696-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-696-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-696-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id m3-20020a656a03000000b005b95f5f8986si7968652pgu.379.2023.11.06.03.07.12
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 03:07:13 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-696-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=alp2M5ul;
       spf=pass (google.com: domain of kvm+bounces-696-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-696-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CDECB22025
	for <alex.bennee@linaro.org>; Mon,  6 Nov 2023 11:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B701A707;
	Mon,  6 Nov 2023 11:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="alp2M5ul"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D66E1A703
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 11:06:49 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1CDB0
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 03:06:47 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40839652b97so32714115e9.3
        for <kvm@vger.kernel.org>; Mon, 06 Nov 2023 03:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699268806; x=1699873606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVCnzhVZzYM83NLjfDBn8N7f5t+G1396ppAvAy7GW2E=;
        b=alp2M5uldfPav0AxpRo2zkpJuGYz4I+tNdodkzCUH0YRNdiZELVhRjxgU6RdCADz/l
         gYoffLC2uDiEa5u6ECkDt++Y6bu1wSInU4K2iSBQjIAFvXwRoixM844ObcUpi/2fqbwP
         S7YzwyoJmWQraGaRUCeaEjJUh5tJ64/jg0hCZgI9a0q8bY24uAxA+76vf203NYmvuXr5
         elvZZcF6anDpsM1Ib1uCaNVR21jjl5XPHiG3YnmuBJ4stNeG04wFyK49BXrhs9D2Z6cd
         yjG4JFQLiSungKCHktAbCcWwPsJMuh6tX7tc4Y8bpJ6GNHzJzUhrwL169x8izqzC5aOA
         bUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268806; x=1699873606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fVCnzhVZzYM83NLjfDBn8N7f5t+G1396ppAvAy7GW2E=;
        b=InkX5FfguX182+ZfeLG0HZNzF6sQ5mI9Mc2+q/yO8mRk0YMmfrJQA9kgB8TeoJjg9S
         zHWrVUx/kfx1hTRUBn3EBPNuQGndN1NFxXFsNuczBdS3ZIRJiRrDsqB2LQqkIxnscT8+
         ueggju0idbdcrI1SOmsF5xCROJSWMVsNAKWJaejouVTCVvsXDeFRIXwbhQA0AGIayXyG
         cXnK+eQPpMo5n8aFqrmHO6rv+GtuTyHrno4cP2wCefoI+d+bSW3CVlL0QdEcy1JPenRY
         pRpy8gfEVGV2nz9E8kH0+NemzEK+GF4y8Vhse4KYUD9BRM0x9CVEBhgOd156SkzdpW8D
         K3aQ==
X-Gm-Message-State: AOJu0YxweEIEcnabqEsU01KrrxBMerhftrTzpZEqBPxSUt+S7MHbjOzj
	4de+Rgg2LcJn80SRgOM3T23Uxw==
X-Received: by 2002:a05:600c:1d0e:b0:402:8896:bb7b with SMTP id l14-20020a05600c1d0e00b004028896bb7bmr22306462wms.6.1699268806095;
        Mon, 06 Nov 2023 03:06:46 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
        by smtp.gmail.com with ESMTPSA id n3-20020a05600c4f8300b004064288597bsm11904145wmq.30.2023.11.06.03.06.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Nov 2023 03:06:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Cameron Esfahani <dirty@apple.com>,
	Roman Bolshakov <rbolshakov@ddn.com>
Subject: [PULL 27/60] target/i386/hvf: Rename 'X86CPU *x86_cpu' variable as 'cpu'
Date: Mon,  6 Nov 2023 12:02:59 +0100
Message-ID: <20231106110336.358-28-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: K9AQKCcaJFfU

Follow the naming used by other files in target/i386/.

No functional changes.

Suggested-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Message-Id: <20231020111136.44401-4-philmd@linaro.org>
---
 target/i386/hvf/x86_emu.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c
index 5b82e84778..3a3f0a50d0 100644
--- a/target/i386/hvf/x86_emu.c
+++ b/target/i386/hvf/x86_emu.c
@@ -665,7 +665,7 @@ static void exec_lods(CPUX86State *env, struct x86_decode *decode)
 
 void simulate_rdmsr(CPUX86State *env)
 {
-    X86CPU *x86_cpu = env_archcpu(env);
+    X86CPU *cpu = env_archcpu(env);
     CPUState *cs = env_cpu(env);
     uint32_t msr = ECX(env);
     uint64_t val = 0;
@@ -675,10 +675,10 @@ void simulate_rdmsr(CPUX86State *env)
         val = rdtscp() + rvmcs(cs->accel->fd, VMCS_TSC_OFFSET);
         break;
     case MSR_IA32_APICBASE:
-        val = cpu_get_apic_base(x86_cpu->apic_state);
+        val = cpu_get_apic_base(cpu->apic_state);
         break;
     case MSR_IA32_UCODE_REV:
-        val = x86_cpu->ucode_rev;
+        val = cpu->ucode_rev;
         break;
     case MSR_EFER:
         val = rvmcs(cs->accel->fd, VMCS_GUEST_IA32_EFER);
@@ -766,7 +766,7 @@ static void exec_rdmsr(CPUX86State *env, struct x86_decode *decode)
 
 void simulate_wrmsr(CPUX86State *env)
 {
-    X86CPU *x86_cpu = env_archcpu(env);
+    X86CPU *cpu = env_archcpu(env);
     CPUState *cs = env_cpu(env);
     uint32_t msr = ECX(env);
     uint64_t data = ((uint64_t)EDX(env) << 32) | EAX(env);
@@ -775,7 +775,7 @@ void simulate_wrmsr(CPUX86State *env)
     case MSR_IA32_TSC:
         break;
     case MSR_IA32_APICBASE:
-        cpu_set_apic_base(x86_cpu->apic_state, data);
+        cpu_set_apic_base(cpu->apic_state, data);
         break;
     case MSR_FSBASE:
         wvmcs(cs->accel->fd, VMCS_GUEST_FS_BASE, data);
@@ -1419,8 +1419,8 @@ static void init_cmd_handler()
 
 void load_regs(CPUState *cs)
 {
-    X86CPU *x86_cpu = X86_CPU(cs);
-    CPUX86State *env = &x86_cpu->env;
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
 
     int i = 0;
     RRX(env, R_EAX) = rreg(cs->accel->fd, HV_X86_RAX);
@@ -1442,8 +1442,8 @@ void load_regs(CPUState *cs)
 
 void store_regs(CPUState *cs)
 {
-    X86CPU *x86_cpu = X86_CPU(cs);
-    CPUX86State *env = &x86_cpu->env;
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
 
     int i = 0;
     wreg(cs->accel->fd, HV_X86_RAX, RAX(env));
-- 
2.41.0

