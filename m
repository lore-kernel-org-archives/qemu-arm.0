Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp248614lfb;
        Thu, 3 Dec 2020 02:39:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/pycUXgNMtAJ0EBMd9jedFrA5+VJozwr4PuJwcW90zjHGTOhiTT+2iTOlzaYshqWiQfeu
X-Received: by 2002:a5b:48a:: with SMTP id n10mr3515289ybp.455.1606991987474;
        Thu, 03 Dec 2020 02:39:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606991987; cv=none;
        d=google.com; s=arc-20160816;
        b=SUepBXfr3Jo1Yzr/Klgq4Yas7gkH+/xs3eTtYXk8xtbsJPtSkLiO3B8R1t0XQu1eyu
         gVmsVXB/ZX4z9HSxiAM7r+Ug72Ch5Jz9tr4Zx+LNbgANcMpJ0a4pU/XY6HfHWYHG40Vq
         ER68hnsta2RyeAuGMaXm1u7py4IIbOCkB+2kEXVNHViyG6raahvXjd8l3rcUv/w00LoS
         vwEN52HvLWvjne0yIGPNWHpKs1pGVyd+VXEM7LaVOuaQWUS/uJYIrfghyDOPXmav2tDq
         lDltpGZtgNpSz1kGjYD9Gs1OxF232S/vrNUnFYVgpGm/Mdir3QJ+awU0he2v/HBjsnmP
         Rqsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=BUjgo1qkfa3S+Sfjcxcwk2Ax460gihm/QmpA7rCamGw=;
        b=EECpeWWYgAf9IwKj+gLDmTHNX1lmDIDRRXjLLiUcmnOXOXkE5HiSmU2aoNOEHpysuF
         iwlASXWntcBeooGjaVr7UDVRmqO9d3jzbZ+rIZnu5iHR7CGj0NI9GSJhdV31o6Amavuw
         VMwBOS8MRDzDUbS7CbnPzDDr3L8eHuyXnnkAoqmsM4fo7vmTZAQEG7HO/0ZBJBE2nORg
         MmfaipXGCO4hr0Qg/tFKHwYsc3ygu1WyvBW3t01l3vRFx05o6uu5crHD3Rat4YXzrFUz
         hCB8MnYVfgNyGJGCelzv1ldMU5/XXi79YDQaqufDeDyhqaUcE6I5v+ppzF2TImcTgLHX
         tLtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=vguxJSy5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d77si2048346ybc.153.2020.12.03.02.39.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 02:39:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=vguxJSy5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Received: from localhost ([::1]:33244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkm1a-0004PM-Rq
	for alex.bennee@linaro.org; Thu, 03 Dec 2020 05:39:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kkm1Q-0004M1-U0; Thu, 03 Dec 2020 05:39:36 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:56574 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kkm1N-0004sC-V4; Thu, 03 Dec 2020 05:39:36 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id A1998413BD;
 Thu,  3 Dec 2020 10:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1606991970;
 x=1608806371; bh=wj36yIT+3pZgY4sK+JJ1LI/dPb0oMQFzuk91x5L/pko=; b=
 vguxJSy5QCHK7HDS/KDBTJMRi1czsVkc1F/o1fQpFcNoytt+Rn70KLo0NQGcnx75
 k0ogb9UyCfUl3LGrGDQamHVJYQtekKbtYsMSfYqR6y+cWEMgPt6JiN7+Hlfkz3Y8
 ChUJVX76RKEQvdr4uEFLywA/PNBSKLQfKOckBfsODyw=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r-RIGAwabQAK; Thu,  3 Dec 2020 13:39:30 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id BAF014131C;
 Thu,  3 Dec 2020 13:39:29 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 3 Dec
 2020 13:39:29 +0300
Date: Thu, 3 Dec 2020 13:39:49 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v3 08/10] arm/hvf: Add a WFI handler
Message-ID: <20201203103949.GC7201@SPB-NB-133.local>
References: <20201202190408.2041-1-agraf@csgraf.de>
 <20201202190408.2041-9-agraf@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201202190408.2041-9-agraf@csgraf.de>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l+n6VpKqZzfa

On Wed, Dec 02, 2020 at 08:04:06PM +0100, Alexander Graf wrote:
> From: Peter Collingbourne <pcc@google.com>
> 
> Sleep on WFI until the VTIMER is due but allow ourselves to be woken
> up on IPI.
> 
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> [agraf: Remove unused 'set' variable, always advance PC on WFX trap]
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  accel/hvf/hvf-cpus.c     |  5 ++--
>  include/sysemu/hvf_int.h |  1 +
>  target/arm/hvf/hvf.c     | 55 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 58 insertions(+), 3 deletions(-)
> 
> diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
> index e613c22ad0..a981ccde70 100644
> --- a/accel/hvf/hvf-cpus.c
> +++ b/accel/hvf/hvf-cpus.c
> @@ -337,15 +337,14 @@ static int hvf_init_vcpu(CPUState *cpu)
>      cpu->hvf = g_malloc0(sizeof(*cpu->hvf));
>  
>      /* init cpu signals */
> -    sigset_t set;
>      struct sigaction sigact;
>  
>      memset(&sigact, 0, sizeof(sigact));
>      sigact.sa_handler = dummy_signal;
>      sigaction(SIG_IPI, &sigact, NULL);
>  
> -    pthread_sigmask(SIG_BLOCK, NULL, &set);
> -    sigdelset(&set, SIG_IPI);
> +    pthread_sigmask(SIG_BLOCK, NULL, &cpu->hvf->unblock_ipi_mask);
> +    sigdelset(&cpu->hvf->unblock_ipi_mask, SIG_IPI);
>  
>  #ifdef __aarch64__
>      r = hv_vcpu_create(&cpu->hvf->fd, (hv_vcpu_exit_t **)&cpu->hvf->exit, NULL);
> diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
> index 5f15119184..13adf6ea77 100644
> --- a/include/sysemu/hvf_int.h
> +++ b/include/sysemu/hvf_int.h
> @@ -62,6 +62,7 @@ extern HVFState *hvf_state;
>  struct hvf_vcpu_state {
>      uint64_t fd;
>      void *exit;
> +    sigset_t unblock_ipi_mask;
>  };
>  
>  void assert_hvf_ok(hv_return_t ret);
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 5ecce36d4a..79aeeb237b 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -2,6 +2,7 @@
>   * QEMU Hypervisor.framework support for Apple Silicon
>  
>   * Copyright 2020 Alexander Graf <agraf@csgraf.de>
> + * Copyright 2020 Google LLC
>   *
>   * This work is licensed under the terms of the GNU GPL, version 2 or later.
>   * See the COPYING file in the top-level directory.
> @@ -18,6 +19,7 @@
>  #include "sysemu/hw_accel.h"
>  
>  #include <Hypervisor/Hypervisor.h>
> +#include <mach/mach_time.h>
>  
>  #include "exec/address-spaces.h"
>  #include "hw/irq.h"
> @@ -413,6 +415,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
>  
>  void hvf_kick_vcpu_thread(CPUState *cpu)
>  {
> +    cpus_kick_thread(cpu);
>      hv_vcpus_exit(&cpu->hvf->fd, 1);
>  }
>  
> @@ -468,6 +471,18 @@ static int hvf_inject_interrupts(CPUState *cpu)
>      return 0;
>  }
>  
> +static void hvf_wait_for_ipi(CPUState *cpu, struct timespec *ts)
> +{
> +    /*
> +     * Use pselect to sleep so that other threads can IPI us while we're
> +     * sleeping.
> +     */
> +    qatomic_mb_set(&cpu->thread_kicked, false);
> +    qemu_mutex_unlock_iothread();

I raised a concern earlier, but I don't for sure if a kick could be lost
right here. On x86 it could be lost.

> +    pselect(0, 0, 0, 0, ts, &cpu->hvf->unblock_ipi_mask);
> +    qemu_mutex_lock_iothread();
> +}
> +
>  int hvf_vcpu_exec(CPUState *cpu)
>  {
>      ARMCPU *arm_cpu = ARM_CPU(cpu);
> @@ -579,6 +594,46 @@ int hvf_vcpu_exec(CPUState *cpu)
>          }
>          case EC_WFX_TRAP:
>              advance_pc = true;
> +            if (!(syndrome & WFX_IS_WFE) && !(cpu->interrupt_request &
> +                (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
> +
> +                uint64_t ctl;
> +                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CTL_EL0,
> +                                        &ctl);
> +                assert_hvf_ok(r);
> +
> +                if (!(ctl & 1) || (ctl & 2)) {
> +                    /* Timer disabled or masked, just wait for an IPI. */
> +                    hvf_wait_for_ipi(cpu, NULL);
> +                    break;
> +                }
> +
> +                uint64_t cval;
> +                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CVAL_EL0,
> +                                        &cval);
> +                assert_hvf_ok(r);
> +
> +                int64_t ticks_to_sleep = cval - mach_absolute_time();


Apple reference recommends to use [1]:

  clock_gettime_nsec_np(CLOCK_UPTIME_RAW)

It, internally in Libc, invokes mach_absolute_time() [2].

1. https://developer.apple.com/documentation/kernel/1462446-mach_absolute_time
2. https://opensource.apple.com/source/Libc/Libc-1158.1.2/gen/clock_gettime.c.auto.html

Thanks,
Roman

> +                if (ticks_to_sleep < 0) {
> +                    break;
> +                }
> +
> +                uint64_t seconds = ticks_to_sleep / arm_cpu->gt_cntfrq_hz;
> +                uint64_t nanos =
> +                    (ticks_to_sleep - arm_cpu->gt_cntfrq_hz * seconds) *
> +                    1000000000 / arm_cpu->gt_cntfrq_hz;
> +
> +                /*
> +                 * Don't sleep for less than 2ms. This is believed to improve
> +                 * latency of message passing workloads.
> +                 */
> +                if (!seconds && nanos < 2000000) {
> +                    break;
> +                }
> +
> +                struct timespec ts = { seconds, nanos };
> +                hvf_wait_for_ipi(cpu, &ts);
> +            }
>              break;
>          case EC_AA64_HVC:
>              cpu_synchronize_state(cpu);
> -- 
> 2.24.3 (Apple Git-128)
> 
