Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp468688ejc;
        Sat, 4 May 2024 06:41:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUEfwU2twCy+uqU5lDyjsLo08SgpupHOzh4JEo3VJbTUQoF46FQxXX4xiEzVYZ4F9Yaa3ZUO5gYx7fvBpk4cE9UiiDNTmTM
X-Received: by 2002:a05:6512:b18:b0:51b:fcfe:ed with SMTP id w24-20020a0565120b1800b0051bfcfe00edmr4627811lfu.25.1714830060594;
        Sat, 04 May 2024 06:41:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714830060; cv=none;
        d=google.com; s=arc-20160816;
        b=xSArAZP1CCV6ae2oPAcvzkI5ll+DlSwjhKgpxG56s4Xqosktn9UpL2pwERxjjejl0D
         YnuewkyYLZtvojGdGHjI6k7zYYKw0HQ3CKd94Ki/upVrB3WQ6SVIhK2XT20AMDHAE5Pq
         5HPBjx+wzWgI4G4WepN7P4gFx07FMqg9lsRKoX943qO+ff1Xacn7GbXMwhMo0Oc4Vr/+
         Iako4HXjnJ0WK57FFAXNQLpWVAUMQV2bQlHPim3ttJi6SOzBV6T0dbHitV4PSTIJrTNT
         QwNCYfjAH+nK0jLsxcZAEltgnIznKX/XxUHMeDB8RMjTe7U392l7AfmoVZCiStFtFLce
         Pp0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Hm/autToj4DhlFSlV5COkbhV3epwF7npYCOhv4VZBBg=;
        fh=ZdE20ywam3pox/mIu15ZjTWOWlgfB5WFCxnPNTfnqYs=;
        b=SL3hxGNRFDFi00gN/bpc71F40hxhVX5u4MkXwhWHeK7X8Q+7wxC9p31iP/X1MGvxTc
         o5IydvBjHxoXzPLWSizHdiOD/D53s166TNHN3gaw8d3OvVKyCjI7eQkAYilOHPUd2Z54
         qkJqtvYR6S9RQPnAZQBMuld9vwI8vHbhsaKM7vWvjsDOUimp+3DR6BG9NHOd7HPFkjXt
         PUkQ6cdnraVRNbQTfD9mRHf/RtuqqioNxRE2RJmcB+8MUBuJIAhqzNxK4v0Nw/td1bsS
         BA9p9fUfi21ZO9IMBW6jlBiiwuyGsq/m484AscguEWn0MbYRUFjWG7mtasiwp/myUOmP
         Lcnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iflXEYzt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r26-20020a50aada000000b0056a253a7ec5sor1300386edc.12.2024.05.04.06.41.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 04 May 2024 06:41:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iflXEYzt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714830060; x=1715434860; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hm/autToj4DhlFSlV5COkbhV3epwF7npYCOhv4VZBBg=;
        b=iflXEYztz75JyofL8kqkXPuHi7tLYSJmc+HfnekdClPCHtkwZQm/abBfn+OQv5Q5a2
         Uw+MjsbAbTvm+QBCs9OTD63eyJhU/unuLo5L14Psur4Bh9D1amcSz8/wsdAoNbIcifwN
         9CqSZjnbzlH0d2x5ZYiPFHt6Enq0O1B9FjLAhFtYaTEkHjrzB0c3ksiFdxu4Z+5US8jb
         P7lic7r8w9DD1Wy85vV1J63uXubUx8yoIFmcc2CWNofHvr9lmILPdoWDw7ifuB9ZdVlp
         K41gMq3Wrqcq1/Jbhe+iqZJROeG/HDXvjT0Ebe7x8avtusGlDZRleFLRna4Qvdq095pz
         xlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714830060; x=1715434860;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hm/autToj4DhlFSlV5COkbhV3epwF7npYCOhv4VZBBg=;
        b=DpSLKPHjFXCeTRgu/V8M7TuanI2wspXn67kstBgYF/XAtuJ82gg5qebLDgUlHBaSuB
         n1uMwtoiQOcLrpZuEv01BcNBT8w5i8MCyHOgtUeZfhisCRjrsoLytzas0Ea9PCdmQGje
         0bAhjkaMuS5Dt0oCv10EFdLrXTKSCBGRMrDEQI8alU2q0xsTnEePTBEONVMcXkzpc9iC
         ePgBdXxj8wf/YxiEFpoNdcj/U/Mn+8Jl5RlCMszIYA7Zjp5hWYguhvfOAWyREBfyqv4D
         kicPjYzjDrZB5zszrEUe+CQfY6OeaaAduOPXmXM/yRaOxUOue76cFHGsSXx3M97Fb9AI
         nnRw==
X-Forwarded-Encrypted: i=1; AJvYcCU4mL+ohOvzKN2C+pGeDpQnM+kxS2Z38Tpc6qbyD46Av+fwSGSjdLbC8FRtgYyFowpwLzYzYSb6F+DnCP6IDZn2vb1UO2Tk
X-Gm-Message-State: AOJu0YzmxP2B6mo928aXeQyzTKUz7M5VyB4JQHI/WdADq65jJCB58rRk
	Oj7z4nbcw+Ggr7SfwLm832MwftAzARQnb0Qfnocs6xuFc2yMs6T3+eHF+aNYkgsHFNie/mZwVCP
	jRYyCAJR26WBCzY7v5TavdymXQ2tl+YJ9yphS1uQd
X-Google-Smtp-Source: AGHT+IEHGRSWkb8y+Iieyd4mYdMdgxuplZd/DwodXE6USmERlIMhUYPIsmXcXyYHDWBL7zw7Ho22M4KJrjuTLVfxg4I=
X-Received: by 2002:a50:ab5a:0:b0:572:5f8c:42 with SMTP id t26-20020a50ab5a000000b005725f8c0042mr3395192edc.0.1714830059846;
 Sat, 04 May 2024 06:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240312020000.12992-1-salil.mehta@huawei.com> <20240312020000.12992-7-salil.mehta@huawei.com>
In-Reply-To: <20240312020000.12992-7-salil.mehta@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 4 May 2024 14:40:49 +0100
Message-ID: <CAFEAcA93EotG4-LXRJF034_9dWAWgZJA1VF6dB-xCsXn0T059g@mail.gmail.com>
Subject: Re: [PATCH V8 6/8] physmem: Add helper function to destroy CPU AddressSpace
To: Salil Mehta <salil.mehta@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, maz@kernel.org, 
	jean-philippe@linaro.org, jonathan.cameron@huawei.com, lpieralisi@kernel.org, 
	richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev, 
	david@redhat.com, philmd@linaro.org, eric.auger@redhat.com, 
	oliver.upton@linux.dev, pbonzini@redhat.com, mst@redhat.com, will@kernel.org, 
	gshan@redhat.com, rafael@kernel.org, alex.bennee@linaro.org, 
	linux@armlinux.org.uk, darren@os.amperecomputing.com, 
	ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com, 
	karl.heubaum@oracle.com, miguel.luis@oracle.com, salil.mehta@opnsrc.net, 
	zhukeqian1@huawei.com, wangxiongfeng2@huawei.com, wangyanan55@huawei.com, 
	jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn, 
	linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: Z4xwlhmMzS/7

On Tue, 12 Mar 2024 at 02:02, Salil Mehta <salil.mehta@huawei.com> wrote:
>
> Virtual CPU Hot-unplug leads to unrealization of a CPU object. This also
> involves destruction of the CPU AddressSpace. Add common function to help
> destroy the CPU AddressSpace.
>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Xianglai Li <lixianglai@loongson.cn>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

> diff --git a/system/physmem.c b/system/physmem.c
> index 6e9ed97597..61b32ac4f2 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -761,6 +761,7 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
>
>      if (!cpu->cpu_ases) {
>          cpu->cpu_ases = g_new0(CPUAddressSpace, cpu->num_ases);
> +        cpu->cpu_ases_count = cpu->num_ases;
>      }
>
>      newas = &cpu->cpu_ases[asidx];
> @@ -774,6 +775,34 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
>      }
>  }
>
> +void cpu_address_space_destroy(CPUState *cpu, int asidx)
> +{
> +    CPUAddressSpace *cpuas;
> +
> +    assert(cpu->cpu_ases);
> +    assert(asidx >= 0 && asidx < cpu->num_ases);
> +    /* KVM cannot currently support multiple address spaces. */
> +    assert(asidx == 0 || !kvm_enabled());
> +
> +    cpuas = &cpu->cpu_ases[asidx];
> +    if (tcg_enabled()) {
> +        memory_listener_unregister(&cpuas->tcg_as_listener);
> +    }
> +
> +    address_space_destroy(cpuas->as);
> +    g_free_rcu(cpuas->as, rcu);
> +
> +    if (asidx == 0) {
> +        /* reset the convenience alias for address space 0 */
> +        cpu->as = NULL;
> +    }
> +
> +    if (--cpu->cpu_ases_count == 0) {
> +        g_free(cpu->cpu_ases);
> +        cpu->cpu_ases = NULL;
> +    }
> +}

When do we need to destroy a single address space in this way
that means we need to keep a count of how many ASes the CPU
currently has? The commit message talks about the case when we
unrealize the whole CPU object, but in that situation you can
just throw away all the ASes at once (eg by calling some
cpu_destroy_address_spaces() function from cpu_common_unrealizefn()).

Also, if we're leaking stuff here by failing to destroy it,
is that a problem for existing CPU types like x86 that we
can already hotplug?

thanks
-- PMM
