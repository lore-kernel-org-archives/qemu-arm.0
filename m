Received: by 2002:a17:906:3554:b0:a35:2c0b:b7b4 with SMTP id s20csp226228eja;
        Sat, 27 Jan 2024 04:08:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjtr5QGDv9XPRpslBSBXG70aZIz0HmUrf6NwVYsOXknZEplbZXH/PixO+xDpO6agVCub5Y
X-Received: by 2002:a05:6a20:9e4b:b0:19c:9c76:e9b2 with SMTP id mt11-20020a056a209e4b00b0019c9c76e9b2mr750421pzb.13.1706357316961;
        Sat, 27 Jan 2024 04:08:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706357316; cv=pass;
        d=google.com; s=arc-20160816;
        b=HSUghICWRHQ4+YBdgUXyn9tvAM+s1+gLJPSL5BUbpXnzqTGVKshlCvBRYDXJzgE8pG
         SSJX2+E6ntF0dVOzt7MKiegR5pAP6eG1J3JRoVhiCLhC698CcCCXfBYbm5IxWCjqVDCl
         o6SWBdEtaYXJmzv3fgGkFPv9C5AlalXPYWD3WxFkSe7GFpFYbxf+d5CaNA08LASaqF/G
         2scSAmjsLU7PzfvHdXufplZt77u+3Z9ozVYLW8pdDwAR6+j1JMoDqpHdXRx9o15MksGN
         jaFnvZ2EkFrKDXxbi780MyllAi3ML8sTeTHxBiIXmL2w37zV7cPd5wz8GA6pzax3Ugvf
         LAPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=bBz6wMMLx51HkUq/PrlmGRMLg2zyMVPhszCdGPauSQA=;
        fh=5ClNWEQxQnJV/6iPLDNyJvfr6JAsfag7ft6BP75WaIA=;
        b=TFVFpCbSwuLnNbg33BR3KWPUebUN7PJ58EluNutpnf5Ob6++o4TtBd5ITGjN8fPdGt
         wnaOAOdnfoplgywbABvwBz+iVHP/GkBUhLvaMV287gvKFX0Dbqi4hmYBlfxfhFcTxZD+
         Xgx2NzIaCzTd5uqYxlhsQl9iG7lg2ldfDGYdbNl6zock4iP0+cDHtPLQ42d9VOHS1b7l
         g1xzq2yXL0rIDUkBdAC6jx5EaOoTdTDgJYKyWfzzW713SlPe/jl9gShlehXDds+yOTsw
         oNrQbms2/PEde6qOjHONg0508jjtlL6yqqNCkl5bY5x8AIiORaE0rhhasZXs24as1NEM
         YpUg==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=CEVTLowA;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-7279-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-7279-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <kvm+bounces-7279-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id n4-20020aa78a44000000b006dd86ec1467si2717238pfa.281.2024.01.27.04.08.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 04:08:36 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-7279-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=CEVTLowA;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-7279-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-7279-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2203E2835B5
	for <alex.bennee@linaro.org>; Sat, 27 Jan 2024 12:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0D7200D6;
	Sat, 27 Jan 2024 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CEVTLowA"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9496D51B
	for <kvm@vger.kernel.org>; Sat, 27 Jan 2024 12:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706357311; cv=none; b=lE67L+bwgFTSy6YeP7pwvWa2w7RB9zBLsvDGO+mfaJb7Sz9IOEqxO55Xmd0eFsvhATNqeAfzPVj+jEx5uTsFboxsFQuILSFNphh06GwzB9wRlCcsJYpY5aIqbQjSTQJLL8rd3t6DUgWPoKWEipDnipRKxxZLgSLSd81NSafxTis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706357311; c=relaxed/simple;
	bh=3x780jZTGqOv7hVPrMhBFyVFEFi8QjUCScTBKCbV9CE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sikV2X7VE5Rre8dU91rQVPK2Hjm3Z36uqQNDwiTihqBW3lAnwVmGlnawURbmnzSNlv86Hlaex2e+1eujZYCQBrj28INvqI94qDtXRB04+FAk+NxO35/TqWKOH2KYlA+rwJyVWNTXHRZCB/Z059EjPRGIh+pG9e57SlNtdTrDQzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CEVTLowA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706357310; x=1737893310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3x780jZTGqOv7hVPrMhBFyVFEFi8QjUCScTBKCbV9CE=;
  b=CEVTLowAtIl/eAolZWh0Xi7Xzu/rFQVDY1UpnjlInxhx/VuTRbm/efwq
   bLWEJSSKEyXCBAITjhx5wUmCLiyFv3OkvL52HRjx8op1bWsRl7MVOglDe
   Ib3h+JfR4iQK+y8WeUAkRIjSNh/e4D5b+fVBjCWWt7nVnHGnRCF4iLC3I
   VPGPkhqU7oVC2Dgj1dc5c8celtf46QAQKWK7c3dIXGK9WD9RCCNPYyMF7
   cZKRQCthuQ9/z+gWdR6FGAefatKJ2JaP8pZ5AZl2KRiHE4yGc8St3dfkE
   zls7KEM2dltFzcijLHgnqTfOdIj4zBvzS+QOtCAYQVPtCMjMH7Xxu/Q7x
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2506037"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2506037"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 04:08:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="29342189"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jan 2024 04:08:23 -0800
Date: Sat, 27 Jan 2024 20:21:27 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
	qemu-riscv@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
	kvm@vger.kernel.org, qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, Cameron Esfahani <dirty@apple.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 10/23] target/i386: Prefer fast cpu_env() over slower
 CPU QOM cast macro
Message-ID: <ZbT1R7impEw4whqP@intel.com>
References: <20240126220407.95022-1-philmd@linaro.org>
 <20240126220407.95022-11-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240126220407.95022-11-philmd@linaro.org>
X-TUID: 1ce49BVjRQy3

Hi Philippe,

On Fri, Jan 26, 2024 at 11:03:52PM +0100, Philippe Mathieu-Daudé wrote:
> Date: Fri, 26 Jan 2024 23:03:52 +0100
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v2 10/23] target/i386: Prefer fast cpu_env() over slower
>  CPU QOM cast macro
> X-Mailer: git-send-email 2.41.0
> 
> Mechanical patch produced running the command documented
> in scripts/coccinelle/cpu_env.cocci_template header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/i386/hvf/vmx.h               | 13 +++-------
>  hw/i386/vmmouse.c                   |  6 ++---
>  hw/i386/xen/xen-hvm.c               |  3 +--
>  target/i386/arch_memory_mapping.c   |  3 +--
>  target/i386/cpu-dump.c              |  3 +--
>  target/i386/cpu.c                   | 37 +++++++++------------------
>  target/i386/helper.c                | 39 ++++++++---------------------
>  target/i386/hvf/hvf.c               |  8 ++----
>  target/i386/hvf/x86.c               |  4 +--
>  target/i386/hvf/x86_emu.c           |  6 ++---
>  target/i386/hvf/x86_task.c          | 10 +++-----
>  target/i386/hvf/x86hvf.c            |  6 ++---
>  target/i386/kvm/kvm.c               |  6 ++---
>  target/i386/kvm/xen-emu.c           | 32 ++++++++---------------
>  target/i386/tcg/sysemu/bpt_helper.c |  3 +--
>  target/i386/tcg/tcg-cpu.c           | 14 +++--------
>  target/i386/tcg/user/excp_helper.c  |  3 +--
>  target/i386/tcg/user/seg_helper.c   |  3 +--
>  18 files changed, 59 insertions(+), 140 deletions(-)
> 

[snip]

> diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
> index 3b1ef5f49a..1e7fd587fe 100644
> --- a/target/i386/hvf/x86hvf.c
> +++ b/target/i386/hvf/x86hvf.c
> @@ -238,8 +238,7 @@ void hvf_get_msrs(CPUState *cs)
>  
>  int hvf_put_registers(CPUState *cs)
>  {
> -    X86CPU *x86cpu = X86_CPU(cs);
> -    CPUX86State *env = &x86cpu->env;
> +    CPUX86State *env = cpu_env(cs);
>  
>      wreg(cs->accel->fd, HV_X86_RAX, env->regs[R_EAX]);
>      wreg(cs->accel->fd, HV_X86_RBX, env->regs[R_EBX]);
> @@ -282,8 +281,7 @@ int hvf_put_registers(CPUState *cs)
>  
>  int hvf_get_registers(CPUState *cs)
>  {
> -    X86CPU *x86cpu = X86_CPU(cs);
> -    CPUX86State *env = &x86cpu->env;
> +    CPUX86State *env = cpu_env(cs);
>  
>      env->regs[R_EAX] = rreg(cs->accel->fd, HV_X86_RAX);
>      env->regs[R_EBX] = rreg(cs->accel->fd, HV_X86_RBX);

In this file, there's another corner case:

diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index 3b1ef5f49a8a..9a145aa5aa4f 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -342,8 +342,7 @@ void vmx_clear_int_window_exiting(CPUState *cs)

 bool hvf_inject_interrupts(CPUState *cs)
 {
-    X86CPU *x86cpu = X86_CPU(cs);
-    CPUX86State *env = &x86cpu->env;
+    CPUX86State *env = cpu_env(cs);

     uint8_t vector;
     uint64_t intr_type;
@@ -408,7 +407,7 @@ bool hvf_inject_interrupts(CPUState *cs)
     if (!(env->hflags & HF_INHIBIT_IRQ_MASK) &&
         (cs->interrupt_request & CPU_INTERRUPT_HARD) &&
         (env->eflags & IF_MASK) && !(info & VMCS_INTR_VALID)) {
-        int line = cpu_get_pic_interrupt(&x86cpu->env);
+        int line = cpu_get_pic_interrupt(env);
         cs->interrupt_request &= ~CPU_INTERRUPT_HARD;
         if (line >= 0) {
             wvmcs(cs->accel->fd, VMCS_ENTRY_INTR_INFO, line |


For this special case, I'm not sure if the script can cover it as well,
otherwise maybe it's OK to be cleaned up manually ;-).

> diff --git a/target/i386/tcg/user/excp_helper.c b/target/i386/tcg/user/excp_helper.c
> index b3bdb7831a..bfcae9f39e 100644
> --- a/target/i386/tcg/user/excp_helper.c
> +++ b/target/i386/tcg/user/excp_helper.c
> @@ -26,8 +26,7 @@ void x86_cpu_record_sigsegv(CPUState *cs, vaddr addr,
>                              MMUAccessType access_type,
>                              bool maperr, uintptr_t ra)
>  {
> -    X86CPU *cpu = X86_CPU(cs);
> -    CPUX86State *env = &cpu->env;
> +    CPUX86State *env = cpu_env(cs);
>  
>      /*
>       * The error_code that hw reports as part of the exception frame

In this file, there's another case:

diff --git a/target/i386/tcg/user/excp_helper.c b/target/i386/tcg/user/excp_helper.c
index b3bdb7831a7a..02fcd64fc080 100644
--- a/target/i386/tcg/user/excp_helper.c
+++ b/target/i386/tcg/user/excp_helper.c
@@ -52,6 +52,5 @@ void x86_cpu_record_sigsegv(CPUState *cs, vaddr addr,
 void x86_cpu_record_sigbus(CPUState *cs, vaddr addr,
                            MMUAccessType access_type, uintptr_t ra)
 {
-    X86CPU *cpu = X86_CPU(cs);
-    handle_unaligned_access(&cpu->env, addr, access_type, ra);
+    handle_unaligned_access(cpu_env(cs), addr, access_type, ra);
 }

[snip]

LGTM.
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>


