Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1119949ejs;
        Wed, 10 Jan 2024 07:53:38 -0800 (PST)
X-Received: by 2002:a05:600c:1d1c:b0:40d:6d74:d549 with SMTP id l28-20020a05600c1d1c00b0040d6d74d549mr682807wms.118.1704902017892;
        Wed, 10 Jan 2024 07:53:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704902017; cv=none;
        d=google.com; s=arc-20160816;
        b=jVkuTdm+18Gs/SA5Zs3n4uO6/2ecpEuKCN/DUOjnQNS1TWJXzoNyZc5vfxfFHuL5N0
         WTQ0p13d4erpOtJ8hLjT4KLLbecffkKt3451e0TxiDbTXEIWUQnpVaL6uSReN7mLzM2R
         obTz729XS8juuhrIzQBptJcaEVEHvB6eFXohthS39Hq9M0iXXQndtOb3a0FwmIrckjhJ
         3+Yzug4dz/mo3zaNJnzxQF6PbNe3MrQIXHrjum6rMsZ+QHvrIToJqOH0diAgIW2br+7F
         3WZG3WqJtuGLjgItYkV6erckwzy0oXDb1fz1yjKyowfIWMV4i9NWqNYl/IV+dAfwFM0U
         hcrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NZRqVuenPWIeJ0HEFm/EdEMDQu8jxtzURv+23qvhkQs=;
        fh=tebFjQw8nyYXdpHWOtCSmNiXXYif6WEiSPQxtAL9eeQ=;
        b=I0dt7zPy9xciOFZf2s43my+mQq28yo1IEwJI97i+ojAJixlEDj0jdg4kbkAC10nf6x
         BONTazTyZ6M+uBaBTac5ocx06Rbab6WYMnwuYn+RDAnxsy5UHqOs+e6U4pXel7hL0Hco
         sw5ToBEM/gCNnQaVgkRGBNQqWCxuwZ7Fh2Si3VO9rrDXpRqgWUsqAzBWLS2Fkd8Asfuo
         K5HuNUDnsJ0yc1CwfVgM1Z7hfk82g3AcVhOBtjTr8VtpRnMGcRxPDA33u42e18SQI8W+
         XIrLNRx5kyiy0RXy0K+aFHRWwL8WwCNStNwIWt1Q2yaJrT9VGbu497TQi8ETEi9Tl4Cm
         3/qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZevGWe0J;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r11-20020a05600c434b00b0040d90c9135fsor318525wme.4.2024.01.10.07.53.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Jan 2024 07:53:37 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZevGWe0J;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704902017; x=1705506817; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NZRqVuenPWIeJ0HEFm/EdEMDQu8jxtzURv+23qvhkQs=;
        b=ZevGWe0JzMRqLK+QKHR62mW5LVolYhPMirMA1DXSJw3ggLIs5UOQ7OJODycM1D66iO
         XVQk2RuJmf7hheTDI9g89kANpaS707WhozkVGR33SR4RvGiZRdmiunNKSjOY5OGJLnJR
         58e00hsXwD9x8FELYwtdVbnodVY8At4i6k//t2YVfyJ5AZmL+a+ycXk6lIomVsUsUv6u
         4D7eLSahNRQ4IrIzCh4oL4nky/tZDxo8Y9mXVABpi+75nolf2UsrROfwRza/LecsrNOo
         uJTfauOEjPlneBsUD55K8NdunAUA8z0deRPevcGFEs08l+a2Cf0vZWXYHIlz+3qKq1+4
         Glbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704902017; x=1705506817;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NZRqVuenPWIeJ0HEFm/EdEMDQu8jxtzURv+23qvhkQs=;
        b=ODuXpBdRxIRCR6+v+0hGvYMoJRAGE++IKuq3ovvP6HBNwbjYVyfn7LZ1kSIgS51jjw
         OJJn42gvebPlI+SdrOjr2jLKyoNgKYOWcesc3exiPa3KihcljcalCSOuTF4Bugn+OM2p
         QqF/qsfQp8wM+GibaZD8t37L6Jr7xUok7ztXdQw7zqEhLs6nPSX/ZOTmbFMqB0kQ2WVG
         1MNZcFUNBzan2UiNDyRBLfeQsy+D5espuvq3be2Uphl8CDdtJTSxcV4zaLLz03HMUSR7
         B2iHJ5le98DcnQ8dl5JgFgKu/rlzOFa/rc51iTkICKo9n2XkdGy/1ND7fWzsgp2kb8wR
         9KPA==
X-Gm-Message-State: AOJu0YwNpH/BK4SHh9lXiE3Ef/BcW4u6wbGLLh/o8mjE0S4aDgWna2Y7
	3uCUgL9Jgm8HnjbBWlEsJr1Br3s7vD486k2w
X-Google-Smtp-Source: AGHT+IGFuT7224gSV3NRAuDK9vMsaQlN4qgzNy+xdyE9QiKhn6tSOLLiKkQ6MFisG1W9c5g80JcBtw==
X-Received: by 2002:a05:600c:3484:b0:40e:3f83:fc34 with SMTP id a4-20020a05600c348400b0040e3f83fc34mr684764wmq.0.1704902017496;
        Wed, 10 Jan 2024 07:53:37 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (vau06-h02-176-184-43-236.dsl.sta.abo.bbox.fr. [176.184.43.236])
        by smtp.gmail.com with ESMTPSA id fl13-20020a05600c0b8d00b0040d8cd116e4sm2632002wmb.37.2024.01.10.07.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 07:53:37 -0800 (PST)
Message-ID: <a6b05997-cc3f-453c-93a6-66dce2cd9a2e@linaro.org>
Date: Wed, 10 Jan 2024 16:53:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC/PATCH v1 09/11] gunyah: CPU execution loop
Content-Language: en-US
To: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>, peter.maydell@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: quic_tsoni@quicinc.com, quic_pheragu@quicinc.com,
 quic_eberman@quicinc.com, quic_yvasi@quicinc.com, quic_cvanscha@quicinc.com,
 quic_mnalajal@quicinc.com
References: <20240109090039.1636383-1-quic_svaddagi@quicinc.com>
 <20240109090039.1636383-10-quic_svaddagi@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240109090039.1636383-10-quic_svaddagi@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: XdgldVsFwTwl

Hi Srivatsa,

On 9/1/24 10:00, Srivatsa Vaddagiri wrote:
> Complete the cpu execution loop. At this time, we recognize exits
> associated with only MMIO access. Future patches will add support for
> recognizing other exit reasons, such as PSCI calls made by guest.
> 
> Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
> ---
>   accel/gunyah/gunyah-accel-ops.c |   7 ++
>   accel/gunyah/gunyah-all.c       | 201 +++++++++++++++++++++++++++++++-
>   include/hw/core/cpu.h           |   1 +
>   include/sysemu/gunyah_int.h     |   9 ++
>   target/arm/gunyah.c             |  13 +++
>   5 files changed, 230 insertions(+), 1 deletion(-)


> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 238c02c05e..ef248a658b 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -371,6 +371,7 @@ struct CPUWatchpoint {
>   
>   struct KVMState;
>   struct kvm_run;
> +struct gh_vcpu_run;

Please do not forward-declare this structure here, it is not required.

>   
>   /* work queue */
>   
> diff --git a/include/sysemu/gunyah_int.h b/include/sysemu/gunyah_int.h
> index dc5b4847a9..72b3027e4e 100644
> --- a/include/sysemu/gunyah_int.h
> +++ b/include/sysemu/gunyah_int.h
> @@ -46,12 +46,21 @@ struct GUNYAHState {
>       bool preshmem_reserved;
>       uint32_t preshmem_size;
>       uint32_t nr_irqs;
> +    uint32_t vm_started;
> +};
> +
> +struct AccelCPUState {
> +    int fd;
> +    struct gh_vcpu_run *run;
>   };
>   
>   int gunyah_create_vm(void);
> +void gunyah_start_vm(void);
>   int gunyah_vm_ioctl(int type, ...);
>   void *gunyah_cpu_thread_fn(void *arg);
>   int gunyah_add_irqfd(int irqfd, int label, Error **errp);
>   GUNYAHState *get_gunyah_state(void);
> +int gunyah_arch_put_registers(CPUState *cs, int level);
> +void gunyah_cpu_synchronize_post_reset(CPUState *cpu);
>   
>   #endif    /* GUNYAH_INT_H */
