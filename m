Received: by 10.28.91.67 with SMTP id p64csp1977730wmb;
        Sun, 18 Mar 2018 15:41:38 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuuxiZ1wKZ1++l5ZNxVlUnH10kOgOt+URsMo8IsPb2LGx7u+qjKOyNdISMPhJcwllsDMZ2g
X-Received: by 10.55.185.69 with SMTP id j66mr15024685qkf.216.1521412898550;
        Sun, 18 Mar 2018 15:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521412898; cv=none;
        d=google.com; s=arc-20160816;
        b=RNZMyzH+6DCoH9Q/Fvr79RuHvEhr/fZyFRSzqUXImPXxRWeGxfssYAyOjFeB4h0QXo
         eRolkPxXZLmmj9bZRtAVUvwV/7YmiV270hQt5RDxjbekSXgzRfPAjgC/xzEquaF8QYpf
         t2av+0GaT4daD5YrBoKbYzTvKROiQasgJOv5c8zL88qNbRNbN6tGNZtGgoRYTDOZCgRj
         6xJ12vXr3PjjTcv0auB0WXM/AfnqfWOg+x6bfp2kgHjr4wv4HD2aEAW3Gl8cgYeSelWf
         rO5cMLdC81P3oChfv7+DlQlO1tQy6oFGkGzrqBfQyjo+0hKGG6uo/dqnwCR8wK9ref8t
         W00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=bGajhwqFlATUtGlQsm6XpcLmdMXBZZu6vawiyvyALkI=;
        b=Di305CVuvHcLuf6R1WF578LCsq4sMEc9btRS+lImmzGTDogFHzxCNqAh2+6zut8w5F
         ujtUE45bLd7EtNmrG644s+lY/Cq8P3sgYl1EJBxhWdOb3Qs0l6P3YWCzlB5XMvX9/Nef
         NGc18S36NW6KCEBR2sRfUVJoDIP796+NQzoJTwV54aLmRvzAeT3wYCF+mp8XdIQniYNb
         uHP38oYwuxmw6mcWbqka1sQixKn6cWmT5wj/vDJXbI9H1q1MXQHhtCVzxB/TxrduoblT
         M/vt8eE7KwgPW4ZadlkCdNqrSpYiPZQJVu/Ymtj0yWSyAAhwbaOKAEMJFesH1XRQ04MG
         8JQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SBEVLwGn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m4si7904980qta.250.2018.03.18.15.41.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 18 Mar 2018 15:41:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SBEVLwGn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39352 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1exgzi-0004nM-3k
	for alex.bennee@linaro.org; Sun, 18 Mar 2018 18:41:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1exgzT-0004n9-GK
	for qemu-devel@nongnu.org; Sun, 18 Mar 2018 18:41:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1exgzQ-0004VP-Cy
	for qemu-devel@nongnu.org; Sun, 18 Mar 2018 18:41:23 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:38870)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1exgzQ-0004Si-3D; Sun, 18 Mar 2018 18:41:20 -0400
Received: by mail-wm0-x243.google.com with SMTP id l16so2777775wmh.3;
	Sun, 18 Mar 2018 15:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=bGajhwqFlATUtGlQsm6XpcLmdMXBZZu6vawiyvyALkI=;
	b=SBEVLwGn5dzdqce4gse62HEuHoGh8T7eGot+8BDmybYAGmmkTCjsu1eyUuLvTy7Yq5
	fcyhjRa50McdqIdubyPsWnUAJxL8JE6FCE91SLGTOhIpOvmivnbfDkto81nFiRQFTueX
	xy25UuCdIPIIRxYDmZzn0UkOrOInFgxDmimZ8FUe5pDpTRij7eetaYyBuX8ov00Ddwen
	n+cVxQ6zPhM+40JazK+1T/Ok7npTr4/pC/SNeLg82WRJuwhFUnlEH2ClbzMQYOFxVVBx
	2VMLAiKWgfXNbqOVUwOWWxrafT7F4CBt8ZhBgEldjsFwLoImNtJ9awIAS2JgW/P7h5Pp
	eUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=bGajhwqFlATUtGlQsm6XpcLmdMXBZZu6vawiyvyALkI=;
	b=Fzn7KLNERPSmOW4rGjrFiDLFbTCkCAQ6d4cPpbReW4Ig3aWdIMuQVh5FpI9jO+q2eZ
	zTDI21IPn/vT9RqZdo4xtZXecZ9+eJZPTJUn3SWxhwgB9ToxNRhTk9nWKuDO2JM9Cbf0
	mpvNpKB/3LAkHARR8vNdSP9k6IgMw6aS1lQAnjxgJK/Fc+ZXZzb9PjYlDGYCUDiXIx/E
	NYoWWTW2veSp5kGCoZH5v8AWC0rKpW4EJvL3arrD2Cc5A3Cr/Dlts3MEKtbbr1REwD3l
	GHuX542aAG5EHM458iqqrW3g96iW1y10tBUPewjV5cuNzQR0rc8d8PHD4L+7Sg8PJkMi
	Jb5w==
X-Gm-Message-State: AElRT7EAmZ/GZ0sVIZSH7xeOnIGhwbeq053bXkVrjPSeQORUk9Ox0oc0
	EGQF56m9cFlfmqChIlCmsVA=
X-Received: by 10.28.16.135 with SMTP id 129mr6086410wmq.86.1521412878705;
	Sun, 18 Mar 2018 15:41:18 -0700 (PDT)
Received: from [192.168.1.37] (67.23.27.109.rev.sfr.net. [109.27.23.67])
	by smtp.gmail.com with ESMTPSA id
	142sm13669297wmq.47.2018.03.18.15.41.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 15:41:18 -0700 (PDT)
To: Aaron Lindsay <alindsay@codeaurora.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-9-git-send-email-alindsay@codeaurora.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <9c99641e-af00-e229-02a1-7d396b5132d1@amsat.org>
Date: Sun, 18 Mar 2018 23:41:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521232280-13089-9-git-send-email-alindsay@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v3 08/22] target/arm: Support
 multiple EL change hooks
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: If05jVnUDfBW

On 03/16/2018 09:31 PM, Aaron Lindsay wrote:
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/cpu.c       | 15 ++++++++++-----
>  target/arm/cpu.h       | 23 ++++++++++++-----------
>  target/arm/internals.h |  7 ++++---
>  3 files changed, 26 insertions(+), 19 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 072cbbf..5f782bf 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -55,13 +55,16 @@ static bool arm_cpu_has_work(CPUState *cs)
>           | CPU_INTERRUPT_EXITTB);
>  }
>  
> -void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHook *hook,
> +void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
>                                   void *opaque)
>  {
> -    /* We currently only support registering a single hook function */
> -    assert(!cpu->el_change_hook);
> -    cpu->el_change_hook = hook;
> -    cpu->el_change_hook_opaque = opaque;
> +    ARMELChangeHook *entry;
> +    entry = g_malloc0(sizeof (*entry));

imho g_malloc() is enough.

> +
> +    entry->hook = hook;
> +    entry->opaque = opaque;
> +
> +    QLIST_INSERT_HEAD(&cpu->el_change_hooks, entry, node);
>  }
>  
>  static void cp_reg_reset(gpointer key, gpointer value, gpointer opaque)
> @@ -744,6 +747,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> +    QLIST_INIT(&cpu->el_change_hooks);
> +

You missed to fill arm_cpu_unrealizefn() with:

    QLIST_FOREACH(...) {
        QLIST_REMOVE(...);
        g_free(...);
    }

>      /* Some features automatically imply others: */
>      if (arm_feature(env, ARM_FEATURE_V8)) {
>          set_feature(env, ARM_FEATURE_V7);
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index f17592b..3b45d3d 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -633,11 +633,17 @@ typedef struct CPUARMState {
>  
>  /**
>   * ARMELChangeHook:
> - * type of a function which can be registered via arm_register_el_change_hook()
> - * to get callbacks when the CPU changes its exception level or mode.
> + * Support registering functions with ARMELChangeHookFn's signature via
> + * arm_register_el_change_hook() to get callbacks when the CPU changes its
> + * exception level or mode.
>   */
> -typedef void ARMELChangeHook(ARMCPU *cpu, void *opaque);
> -
> +typedef void ARMELChangeHookFn(ARMCPU *cpu, void *opaque);
> +typedef struct ARMELChangeHook ARMELChangeHook;
> +struct ARMELChangeHook {
> +    ARMELChangeHookFn *hook;
> +    void *opaque;
> +    QLIST_ENTRY(ARMELChangeHook) node;
> +};
>  
>  /* These values map onto the return values for
>   * QEMU_PSCI_0_2_FN_AFFINITY_INFO */
> @@ -826,8 +832,7 @@ struct ARMCPU {
>       */
>      bool cfgend;
>  
> -    ARMELChangeHook *el_change_hook;
> -    void *el_change_hook_opaque;
> +    QLIST_HEAD(, ARMELChangeHook) el_change_hooks;
>  
>      int32_t node_id; /* NUMA node this CPU belongs to */
>  
> @@ -2895,12 +2900,8 @@ static inline AddressSpace *arm_addressspace(CPUState *cs, MemTxAttrs attrs)
>   * CPU changes exception level or mode. The hook function will be
>   * passed a pointer to the ARMCPU and the opaque data pointer passed
>   * to this function when the hook was registered.
> - *
> - * Note that we currently only support registering a single hook function,
> - * and will assert if this function is called twice.
> - * This facility is intended for the use of the GICv3 emulation.
>   */
> -void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHook *hook,
> +void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
>                                   void *opaque);
>  
>  /**
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 47cc224..7df3eda 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -727,11 +727,12 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
>                                     int mmu_idx, MemTxAttrs attrs,
>                                     MemTxResult response, uintptr_t retaddr);
>  
> -/* Call the EL change hook if one has been registered */
> +/* Call any registered EL change hooks */
>  static inline void arm_call_el_change_hook(ARMCPU *cpu)
>  {
> -    if (cpu->el_change_hook) {
> -        cpu->el_change_hook(cpu, cpu->el_change_hook_opaque);
> +    ARMELChangeHook *hook, *next;
> +    QLIST_FOREACH_SAFE(hook, &cpu->el_change_hooks, node, next) {
> +        hook->hook(cpu, hook->opaque);
>      }
>  }
>  
> 
