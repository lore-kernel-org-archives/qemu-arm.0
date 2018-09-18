Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp4872384wrd;
        Tue, 18 Sep 2018 00:12:49 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbwdEtWKfj/uFoPTf/bpyd8Lm8hlCvvMAHA13u5WOVP9h8mb1HONyS3nvQl2hmL3Orq5CC/
X-Received: by 2002:a63:ec14:: with SMTP id j20-v6mr26592930pgh.28.1537254769575;
        Tue, 18 Sep 2018 00:12:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537254769; cv=none;
        d=google.com; s=arc-20160816;
        b=Mwq4bqnYUlpiJBUoErCbfBS4rZthdYzY0bFjY4KwNkssJQJlMrq/W1NDGGXY4oCo9S
         6OvhpLi1gDY2+1zSuVLid9j2vu3x6cKUZtzvSavDBhsfaNESm/o3pql5CTbEXD4PRRzg
         GKgqXcfUGg761PGYN1fLEw7yCqKwSJvEhiEjqEqV0PowScIWvx10tiJoYcf0ZS6yy3Lb
         Dmu6TUCnxLntrnMr0MP7BzLu1d9UbegTr3bOhvpXOxp40nwJsM3963/6Yf+tOWP4VZv/
         JMAz8WBgmOKz4Dpq0cA1nw/VHiaGivsCniN6PgJJL8/BRCnSS21LZoW0iZBj5moMhPs8
         lCkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:autocrypt:openpgp:from:references:cc:to
         :subject;
        bh=EalKHvG1ZVUuKfsQchwWcgKvJwK8tVGLB/KDNQiJiQ8=;
        b=cSe2wZKlC3RKmJxyItPPfUCsQKhQh3Ky9TnR1bcYLITA2FFKdmnhEVZZf4MoY/MKb8
         S315gIqevrhJl+kXGYjq655EStKDjXhC2f3d7yrcr7AOci/V1XHFptyeV0r2wI0YOW3+
         2Gd3mxP2lqF63NUHUwUVigacwmUOPZPUdjAMpEXCxmwBeNrUij3m7vIQeyJ2QNQuatB2
         fbUDC7LYC6VxgH8gDB9FGJOAnNyD+7qpuhhgqUtfMhZsF/axv/2Z6QDMcDtJHLqtPWvR
         2NkFVj3gw5fMP41QHeMyph4jHextjYNSlHkDbcTcjEPX7mi/hfHr8lh3jIAtwPVU1Zuw
         xcKw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id y27-v6si18084194pgc.152.2018.09.18.00.12.48;
        Tue, 18 Sep 2018 00:12:49 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728883AbeIRMoC (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Tue, 18 Sep 2018 08:44:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59256 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727207AbeIRMoC (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 18 Sep 2018 08:44:02 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id D67D581DFA;
        Tue, 18 Sep 2018 07:12:45 +0000 (UTC)
Received: from [10.36.116.248] (ovpn-116-248.ams2.redhat.com [10.36.116.248])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DF0F7600C4;
        Tue, 18 Sep 2018 07:12:38 +0000 (UTC)
Subject: Re: [PATCH 34/35] exec: push BQL down to cpu->do_interrupt
To:     "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Aleksandar Markovic <amarkovic@wavecomp.com>,
        Alexander Graf <agraf@suse.de>,
        Anthony Green <green@moxielogic.com>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Chris Wulff <crwulff@gmail.com>,
        Cornelia Huck <cohuck@redhat.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Guan Xuetao <gxt@mprc.pku.edu.cn>,
        James Hogan <jhogan@kernel.org>, kvm@vger.kernel.org,
        Laurent Vivier <laurent@vivier.eu>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Marek Vasut <marex@denx.de>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Michael Walle <michael@walle.cc>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
        qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
        Richard Henderson <rth@twiddle.net>,
        Stafford Horne <shorne@gmail.com>
References: <20180917163103.6113-1-cota@braap.org>
 <20180917163103.6113-35-cota@braap.org>
From:   David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <52469f18-7acd-da63-002f-e9d4c1d516e6@redhat.com>
Date:   Tue, 18 Sep 2018 09:12:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180917163103.6113-35-cota@braap.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 18 Sep 2018 07:12:47 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: QnyIQZM/2fJ5

Am 17.09.18 um 18:31 schrieb Emilio G. Cota:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> cpu->do_interrupt can now be called with BQL held (from
> cpu->cpu_exec_interrupt) or without (from cpu_handle_exception).
> 
> Only a few targets rely on global device state in cc->do_interrupt;
> add checks to those targets to acquire the BQL if not already held.
> 
> Cc: Aleksandar Markovic <amarkovic@wavecomp.com>
> Cc: Alexander Graf <agraf@suse.de>
> Cc: Anthony Green <green@moxielogic.com>
> Cc: Artyom Tarasenko <atar4qemu@gmail.com>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Chris Wulff <crwulff@gmail.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
> Cc: James Hogan <jhogan@kernel.org>
> Cc: kvm@vger.kernel.org
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: Marcelo Tosatti <mtosatti@redhat.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-ppc@nongnu.org
> Cc: qemu-s390x@nongnu.org
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Stafford Horne <shorne@gmail.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>  accel/tcg/cpu-exec.c       |  2 --
>  target/arm/helper.c        | 28 ++++++++++++++++++++++++++--
>  target/ppc/excp_helper.c   |  8 +++++++-
>  target/s390x/excp_helper.c | 14 +++++++++++++-
>  target/sh4/helper.c        | 14 +++++++++++++-
>  target/xtensa/helper.c     | 16 ++++++++++++++--
>  6 files changed, 73 insertions(+), 9 deletions(-)
> 
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 2383763f9b..b649e3d772 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -497,9 +497,7 @@ static inline bool cpu_handle_exception(CPUState *cpu, int *ret)
>  #else
>          if (replay_exception()) {
>              CPUClass *cc = CPU_GET_CLASS(cpu);
> -            qemu_mutex_lock_iothread();
>              cc->do_interrupt(cpu);
> -            qemu_mutex_unlock_iothread();
>              cpu->exception_index = -1;
>          } else if (!replay_has_interrupt()) {
>              /* give a chance to iothread in replay mode */
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 22dbc42305..548278da14 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7644,7 +7644,8 @@ gen_invep:
>      return false;
>  }
>  
> -void arm_v7m_cpu_do_interrupt(CPUState *cs)
> +/* call with the BQL held */
> +static void arm_v7m_cpu_do_interrupt_locked(CPUState *cs)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
>      CPUARMState *env = &cpu->env;
> @@ -7828,6 +7829,17 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>      v7m_exception_taken(cpu, lr, false, ignore_stackfaults);
>  }
>  
> +void arm_v7m_cpu_do_interrupt(CPUState *cs)
> +{
> +    if (qemu_mutex_iothread_locked()) {
> +        arm_v7m_cpu_do_interrupt_locked(cs);
> +    } else {
> +        qemu_mutex_lock_iothread();
> +        arm_v7m_cpu_do_interrupt_locked(cs);
> +        qemu_mutex_unlock_iothread();
> +    }
> +}
> +
>  /* Function used to synchronize QEMU's AArch64 register set with AArch32
>   * register set.  This is necessary when switching between AArch32 and AArch64
>   * execution state.
> @@ -8482,8 +8494,9 @@ static inline bool check_for_semihosting(CPUState *cs)
>   * Do any appropriate logging, handle PSCI calls, and then hand off
>   * to the AArch64-entry or AArch32-entry function depending on the
>   * target exception level's register width.
> + * Call with the BQL held.
>   */
> -void arm_cpu_do_interrupt(CPUState *cs)
> +static void arm_cpu_do_interrupt_locked(CPUState *cs)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
>      CPUARMState *env = &cpu->env;
> @@ -8534,6 +8547,17 @@ void arm_cpu_do_interrupt(CPUState *cs)
>      }
>  }
>  
> +void arm_cpu_do_interrupt(CPUState *cs)
> +{
> +    if (qemu_mutex_iothread_locked()) {
> +        arm_cpu_do_interrupt_locked(cs);
> +    } else {
> +        qemu_mutex_lock_iothread();
> +        arm_cpu_do_interrupt_locked(cs);
> +        qemu_mutex_unlock_iothread();
> +    }
> +}
> +
>  /* Return the exception level which controls this address translation regime */
>  static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
>  {
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 70ac10e23b..8b2cc48cad 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -742,7 +742,13 @@ void ppc_cpu_do_interrupt(CPUState *cs)
>      PowerPCCPU *cpu = POWERPC_CPU(cs);
>      CPUPPCState *env = &cpu->env;
>  
> -    powerpc_excp(cpu, env->excp_model, cs->exception_index);
> +    if (qemu_mutex_iothread_locked()) {
> +        powerpc_excp(cpu, env->excp_model, cs->exception_index);
> +    } else {
> +        qemu_mutex_lock_iothread();
> +        powerpc_excp(cpu, env->excp_model, cs->exception_index);
> +        qemu_mutex_unlock_iothread();
> +    }
>  }
>  
>  static void ppc_hw_interrupt(CPUPPCState *env)
> diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
> index f2b92d7cbc..931c0103c8 100644
> --- a/target/s390x/excp_helper.c
> +++ b/target/s390x/excp_helper.c
> @@ -378,7 +378,8 @@ static void do_mchk_interrupt(CPUS390XState *env)
>      load_psw(env, mask, addr);
>  }
>  
> -void s390_cpu_do_interrupt(CPUState *cs)
> +/* call with the BQL held */
> +static void s390_cpu_do_interrupt_locked(CPUState *cs)
>  {
>      QEMUS390FLICState *flic = QEMU_S390_FLIC(s390_get_flic());
>      S390CPU *cpu = S390_CPU(cs);
> @@ -457,6 +458,17 @@ try_deliver:
>      }
>  }
>  
> +void s390_cpu_do_interrupt(CPUState *cs)
> +{
> +    if (qemu_mutex_iothread_locked()) {
> +        s390_cpu_do_interrupt_locked(cs);
> +    } else {
> +        qemu_mutex_lock_iothread();
> +        s390_cpu_do_interrupt_locked(cs);
> +        qemu_mutex_unlock_iothread();
> +    }
> +}
> +

Yes, due to floating interrupts we need the iothread lock. This change
looks sane to me from an s390x perspective:

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 

Thanks,

David / dhildenb
