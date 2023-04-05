Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp639839ejb;
        Wed, 5 Apr 2023 13:44:41 -0700 (PDT)
X-Received: by 2002:a05:6870:4587:b0:17a:a737:9f08 with SMTP id y7-20020a056870458700b0017aa7379f08mr4063394oao.39.1680727481066;
        Wed, 05 Apr 2023 13:44:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680727481; cv=none;
        d=google.com; s=arc-20160816;
        b=P83sksyT71KnbWBTZ8nzhtH2c6VDaYedO3zk7ZIPeMa0/PKpTdJNhbHnksovNoUiu7
         mtfQ+zmBkaFS777HO3av9HN0IUYIUcZx8Z/1A/nQA41YgNboW6PghE4Ed3UNu4W034S2
         MguaYrA1Wi6FZVYYGVRN6xzeGNxSbHdzMfRp5UKJyrUQCGoIaXfwlvJ7+7yORGT0tuyk
         CP+iEuEavCOFhvZqbHKvIXPSyZhcwG7OE14IOryWj5Xx3pP3866b8p5zndwUlc7qQm6K
         c2ZBqDOthva/fuQBmy0MB5g8UmwSlBZgdg/MxevpBhZic45CjXslutcXwD0J1r+FCave
         ksfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZqWfb2PPnDpc2PEqcd7YpJ7M16hWDtl2fWp2jjEorwo=;
        b=k5gP9xIIWaXJqQbM7zxXsCuzM8rPGRYRJDJ++AfKd58/vXsciVSdhDBCPHB0U9Abtf
         7S/SaSto/BRVqpfCWF4dUmTVgeNFckj1K51ScdsooYuntovKoqVzi0wTmGgADreu8Kiw
         bKSew36GkdpSjfZRH6tZSXWebt58Q/9jSvwLRiGahJ+AWCNvceEUQzrNTECfbcHKyDWE
         rSzuWeUUM2Qx/H1unAs6w0eA5Tj8z3HIOzcdd6xtr/ge9Cqnp17agBTHJHcEEi5XHDqV
         2cOlm/lEnqZUyRNJM0hMTmupasLOLz3aIyzaWdQKxhsUiQ+mS/eM4WdZ5QdoSPOHf8AT
         d0Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=TNOuzQOD;
       spf=pass (google.com: domain of dbarboza@ventanamicro.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=dbarboza@ventanamicro.com
Return-Path: <dbarboza@ventanamicro.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p6-20020a056820044600b0052019034383sor1640944oou.12.2023.04.05.13.44.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Apr 2023 13:44:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of dbarboza@ventanamicro.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=TNOuzQOD;
       spf=pass (google.com: domain of dbarboza@ventanamicro.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=dbarboza@ventanamicro.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680727480;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZqWfb2PPnDpc2PEqcd7YpJ7M16hWDtl2fWp2jjEorwo=;
        b=TNOuzQODBFw4w+EKPw8H+hz/E1aFLDuz22IVxMRnSrjb96aaHbwmAL33xIMmsa9gvT
         iQp4A+/cHZmTKQDilGfL91aI/DfMj/G4wqLu1ET9xijR7swBv3vTXJrJj8TmNGA7S2Wv
         I2JUjyx6LNQ0MuLEQqZ0rTJGi44n1a2kWz1l/eM7zNNXDxXZaolcM9jdrg2Wwwx0V3gq
         upJ4sQdYAzdREj76KzCbvrFdw4HQmzfe/DMlJEtP8AoCCIbKzxEHrOAI75X1/3Qrwetp
         UjBxAFpe4rHKutfCkfjc7G0Sil1Fd+40EFqphuSetm2R1vMJ7pYfF7Wi3XT1HhpMA8GJ
         DUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680727480;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqWfb2PPnDpc2PEqcd7YpJ7M16hWDtl2fWp2jjEorwo=;
        b=B5G5NQWielph2T0/6LnlWaoSK6BJXglJtXaEHkcXMLd4ahSVuZqJqFGwsZOm0CaoxL
         rpS9MayURcq6XSAMSXtWEg2orluce9u6Trb/b6fK5AgEZ9TYJcYh+znqS541Uqlb0TDT
         gj42T/q2fgd0/f2ARfgfTx3Woot61zE0fLLZYPXUGeueepgNP0w++LFZ45oXtPV3lYQk
         o82LLdDvQVgGLQQFKIJZo74u2tytyfAFUI/zUgYTlyzcdJrmi4Cs/y1yf6BBla6YPqi1
         cD4NLwl7G+uqY7i1YYdLUXZjr2a8nQ/3A/A/UyZ26pYsG42cD+yq8H+uID/h1ACZIyaa
         D35g==
X-Gm-Message-State: AAQBX9dbhCDxM/OFMZn5d6zWt8HDPQgAYpDkVy19SRnDrMAhB64El9w/
	f9bIR+ooxahbfUYu61n4vySyZA==
X-Google-Smtp-Source: AKy350Zpo5917s3wwJGg0D4GjQAAqZMwM4zNUds49ooFSWmxGSeohhLZSBKl2stDGqytkYYe+q1+OA==
X-Received: by 2002:a4a:5241:0:b0:537:b1ad:1c7c with SMTP id d62-20020a4a5241000000b00537b1ad1c7cmr3544290oob.0.1680727480668;
        Wed, 05 Apr 2023 13:44:40 -0700 (PDT)
Return-Path: <dbarboza@ventanamicro.com>
Received: from [192.168.68.107] ([191.255.108.232])
        by smtp.gmail.com with ESMTPSA id u1-20020a056830118100b0069fb749271bsm7192106otq.15.2023.04.05.13.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 13:44:39 -0700 (PDT)
Message-ID: <984d3eda-1efd-f39d-8930-3a8ea5226ad5@ventanamicro.com>
Date: Wed, 5 Apr 2023 17:44:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 09/10] target/riscv: Restrict KVM-specific fields from
 ArchCPU
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-10-philmd@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230405160454.97436-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: oJh6fUeN8k/i



On 4/5/23 13:04, Philippe Mathieu-Daudé wrote:
> These fields shouldn't be accessed when KVM is not available.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> RFC: The migration part is likely invalid...
> 
> kvmtimer_needed() is defined in target/riscv/machine.c as
> 
>    static bool kvmtimer_needed(void *opaque)
>    {
>        return kvm_enabled();
>    }
> 
> which depends on a host feature.


kvm_enabled() can be false even when CONFIG_KVM is true when a KVM capable host
is running a TCG guest, for example. In that case env->kvm_timer_* states exist
but aren't initialized, and shouldn't be migrated.

Thus it's not just a host feature, but a host feature + accel option. I think
this is fine.

> ---
>   target/riscv/cpu.h     | 2 ++
>   target/riscv/machine.c | 4 ++++
>   2 files changed, 6 insertions(+)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 638e47c75a..82939235ab 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -377,12 +377,14 @@ struct CPUArchState {
>       hwaddr kernel_addr;
>       hwaddr fdt_addr;
>   
> +#ifdef CONFIG_KVM
>       /* kvm timer */
>       bool kvm_timer_dirty;
>       uint64_t kvm_timer_time;
>       uint64_t kvm_timer_compare;
>       uint64_t kvm_timer_state;
>       uint64_t kvm_timer_frequency;
> +#endif /* CONFIG_KVM */
>   };
>   
>   OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 9c455931d8..e45d564ec3 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -201,10 +201,12 @@ static bool kvmtimer_needed(void *opaque)
>   
>   static int cpu_post_load(void *opaque, int version_id)
>   {
> +#ifdef CONFIG_KVM
>       RISCVCPU *cpu = opaque;
>       CPURISCVState *env = &cpu->env;
>   
>       env->kvm_timer_dirty = true;
> +#endif
>       return 0;
>   }
>   
> @@ -215,9 +217,11 @@ static const VMStateDescription vmstate_kvmtimer = {
>       .needed = kvmtimer_needed,
>       .post_load = cpu_post_load,
>       .fields = (VMStateField[]) {
> +#ifdef CONFIG_KVM
>           VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
>           VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
>           VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
> +#endif

Here you're creating an empty 'cpu/kvmtimer' vmstate that won't be migrated anyway
because kvmtimer_needed (== kvm_enabled()) will be always false if CONFIG_KVM=n.

I'd say it's better to just get rid of the whole vmstate in this case, but I don't
like the precedence of having vmstates being gated by build flags.


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>



>           VMSTATE_END_OF_LIST()
>       }
>   };
