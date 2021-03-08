Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1782647lfg;
        Mon, 8 Mar 2021 04:17:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDVOJ5Q0Otkc6pKdeeQQYumRX8txxnMGFSZwiCoPHH96zKE4VzPWBK+bt8O34L1b+Wyi0B
X-Received: by 2002:a05:6602:2248:: with SMTP id o8mr18103146ioo.155.1615205854007;
        Mon, 08 Mar 2021 04:17:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615205854; cv=none;
        d=google.com; s=arc-20160816;
        b=rK05/s0g9GayoMwa10BJS62aFlEb5RCiynRHjGOGnr1hhiMjPeePXKhv8B3lIxFUqc
         5RAWIQwyQqUALJZ0qNi1gaHg2bmnQ/20LAB446bHCxbu2SClS0hm1LAIcrhds3KvXnBf
         sfd1S5iLJ3srIUBqVtua7SH/xqh3+xdE0XhCCUlxA5T/aBrh15nOKQ9ERq5tKbuxH8Wh
         6dKVww3SauN3DFXXfl+uUteJgt786h9m+p8UrPwTJ9RaleCj7qMN6c8M0byg3Wt23ytO
         syd0TOQ9l6oqMOAyveVyGBaVJElyJVrEd9ky6CuIbHBE81GsdzgFSu2mx1nvJrJVsNyO
         i5rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=rtNc3vqfZVcysIxek7eLyW/kaoKsiCPPDzIoKLdqOnQ=;
        b=RNnGlJ4y1NaYrqI5IpwaP183zomNnmCuy+kqqzemUmcdDGwz8lj5gUrAeb9UNgpU0R
         xu7bFA3ujph8mD5WQngeqHqbj2mvMMqZdgfskiubLQDieypeMK15Jnp19fD6XKhwV/V5
         A2rcEomVgbIUfIIbthAQ9wdiSoueDdfIQBz5oS57QEO5Je0CcXZRFiamVG4ZkwAK91sd
         6zrSdT/swJ9+e8/QtelFwghkttr1S39lMCNibfS/CyQhwHrGrtaZO6Fd3eZLUEuyJVNQ
         vPeum2yobvZw91l9mPs6N68WbWvgy1lBrCkdrlZZfkbmiXgOeiZmUiVZbim5p5Y6RdIX
         Clcg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13si11102797ill.105.2021.03.08.04.17.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Mar 2021 04:17:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJEpJ-0008Dh-B5
	for alex.bennee@linaro.org; Mon, 08 Mar 2021 07:17:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lJEp4-0008CR-NM; Mon, 08 Mar 2021 07:17:18 -0500
Received: from mx2.suse.de ([195.135.220.15]:49112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lJEp0-0004Gl-KD; Mon, 08 Mar 2021 07:17:18 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BF489AD57;
 Mon,  8 Mar 2021 12:17:11 +0000 (UTC)
Subject: Re: [RFC PATCH v2 6/8] cpu: Declare cpu_has_work() in 'sysemu/tcg.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210304222323.1954755-1-f4bug@amsat.org>
 <20210304222323.1954755-7-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <ddd0572a-bba2-62ac-27b8-4a7d04257695@suse.de>
Date: Mon, 8 Mar 2021 13:17:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210304222323.1954755-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-riscv@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 596V40/r7VCe

On 3/4/21 11:23 PM, Philippe Mathieu-Daudé wrote:
> We can only check if a vCPU has work with TCG.
> Move the cpu_has_work() prototype to "sysemu/tcg.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> RFC: could another accelerator do that?
>      can we rename this tcg_vcpu_has_work()?
> ---
>  include/hw/core/cpu.h | 16 ----------------
>  include/sysemu/tcg.h  | 11 +++++++++++
>  accel/tcg/cpu-exec.c  |  7 +++++++
>  softmmu/cpus.c        |  1 +
>  4 files changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 1376e496a3f..66109bcca35 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -670,22 +670,6 @@ CPUState *cpu_create(const char *typename);
>   */
>  const char *parse_cpu_option(const char *cpu_option);
>  
> -/**
> - * cpu_has_work:
> - * @cpu: The vCPU to check.
> - *
> - * Checks whether the CPU has work to do.
> - *
> - * Returns: %true if the CPU has work, %false otherwise.
> - */
> -static inline bool cpu_has_work(CPUState *cpu)
> -{
> -    CPUClass *cc = CPU_GET_CLASS(cpu);
> -
> -    g_assert(cc->has_work);
> -    return cc->has_work(cpu);
> -}
> -
>  /**
>   * qemu_cpu_is_self:
>   * @cpu: The vCPU to check against.
> diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
> index c16c13c3c69..3d46b0a7a93 100644
> --- a/include/sysemu/tcg.h
> +++ b/include/sysemu/tcg.h
> @@ -10,6 +10,7 @@
>  
>  #ifndef CONFIG_TCG
>  #define tcg_enabled() 0
> +#define cpu_has_work(cpu) false

email errors, so not sure if my previous message went off.

I am not convinced by this approach of _hiding_ the fact that cpu_has_work is TCG-only from the context where it is used.

When reading the actual code using this, how to get an immediate clue that this is TCG-only?

I think cpu_has_work should either be renamed to tcg_cpu_has_work(), thus providing the context in the name,
or it should not be visible/called for non-TCG at all, its call protected in some way (if (tcg_enabled() or ifdef or such..)

Ciao,

Claudio


>  #else
>  
>  void tcg_exec_init(unsigned long tb_size, int splitwx);
> @@ -26,6 +27,16 @@ extern bool tcg_allowed;
>  extern bool mttcg_enabled;
>  #define qemu_tcg_mttcg_enabled() (mttcg_enabled)
>  
> +/**
> + * cpu_has_work:
> + * @cpu: The vCPU to check.
> + *
> + * Checks whether the CPU has work to do.
> + *
> + * Returns: %true if the CPU has work, %false otherwise.
> + */
> +bool cpu_has_work(CPUState *cpu);
> +
>  #endif /* CONFIG_TCG */
>  
>  #endif
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 7e67ade35b9..b9ce36e59e2 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -447,6 +447,13 @@ static inline TranslationBlock *tb_find(CPUState *cpu,
>      return tb;
>  }
>  
> +bool cpu_has_work(CPUState *cpu)
> +{
> +    CPUClass *cc = CPU_GET_CLASS(cpu);
> +
> +    return cc->has_work(cpu);
> +}
> +
>  static inline bool cpu_handle_halt(CPUState *cpu)
>  {
>      if (cpu->halted) {
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index a7ee431187a..548ab9236f1 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -42,6 +42,7 @@
>  #include "sysemu/runstate.h"
>  #include "sysemu/cpu-timers.h"
>  #include "sysemu/whpx.h"
> +#include "sysemu/tcg.h"
>  #include "hw/boards.h"
>  #include "hw/hw.h"
>  
> 

