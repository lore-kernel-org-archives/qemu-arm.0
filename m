Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1117649ejs;
        Wed, 10 Jan 2024 07:49:19 -0800 (PST)
X-Received: by 2002:a5d:42c6:0:b0:337:4f06:f771 with SMTP id t6-20020a5d42c6000000b003374f06f771mr637212wrr.119.1704901759620;
        Wed, 10 Jan 2024 07:49:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704901759; cv=none;
        d=google.com; s=arc-20160816;
        b=aNAJ/+LaKhpGwFpgUkY6UdaTkuRbK03IuQ9jRMUQFTU0qxiHt6XenYBlmxIK2DYc/3
         2BkaPlxd0H4BCkf3if4xWD0Cf7X52IyQ9S9VlaUmP/5OS7N8g0BKd/njOdleFAvBaE9t
         Cl2O67/epPPFnxqFcayE40/yZd7m6J0BK459wNCibIj2h6YljWnhcKBzBNOPCF5S3wwx
         iZmiW8bX9Addb7cSfAWs6Lp6i3Xj1Cw9bvKgnNALkiIWAlfu13Y9J6VSg1gB+xStBn7v
         H0P1DRxfBcWRf/TPM6EfEcGwTITILx/r6Pjk8TtSQEbXMYo1C/KGSX6xxZRd77brQ55P
         yylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NZRqVuenPWIeJ0HEFm/EdEMDQu8jxtzURv+23qvhkQs=;
        fh=tebFjQw8nyYXdpHWOtCSmNiXXYif6WEiSPQxtAL9eeQ=;
        b=cJ0akvK1U8xJDk20ee/LxQTjctjCMWHjdBB7bzeZj89Wo4AlcK4qZ1c/GxHmjRbQgW
         9CMHsTqZc+YNahTnW6iyHys2C9I2ASWPT9+hly44YdFHYmHnSVbhkQ4B24fdf+JQkW62
         +TzD0nQsJU3CEvfDvTA7kYyfjaV1MjDmUj7Lhg4ou6uUYR2JrDc82ZqlSjDVOA8zT31d
         BH3nUZFaeqG1bl3miLQUjlJxWgnT78HEmTDFZK3dQ7cv8PcozU1V6nRKwec1LW5jtOdS
         BAOOfq7rsaGgnubooQCZsaCTmerP6W08aDblctmtykpKofY5xJdtRYB8jodQlWZqigq+
         +s5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aDSwtvMB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k22-20020adfb356000000b003375a16a4besor1497598wrd.10.2024.01.10.07.49.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Jan 2024 07:49:19 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aDSwtvMB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704901759; x=1705506559; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NZRqVuenPWIeJ0HEFm/EdEMDQu8jxtzURv+23qvhkQs=;
        b=aDSwtvMBFCV+gLQ+GlqC5UizmwDiV2BpmuwNFCCMk6CvM26gibzZbKvSDOZ/eJRrQf
         C2jcNfBQ7d4dWDOKdYdstovAmac9lrrrw0TTHnegghh/wNU12jJRfL997N/OXe+Snwfv
         AuvCQRfJJaTpbjUJ57kVq7ZgtK4hZflarg9swpNArCh9Y/iVmEzJvh9GJSHJBvau5W3D
         ZW6oJbyzV8etw9kfEbTxIgSVb0GCOE+ZFk5BJMmw9Y9zkneKEvTlnQNiC3Qk8Xcs0ZPE
         u+Rt83JCHUWY94w9Q57pRVh1dFTDLr7hGqHUrCdLgHuJgba1dVdx2FpIs5buMHIPYE/v
         N4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704901759; x=1705506559;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NZRqVuenPWIeJ0HEFm/EdEMDQu8jxtzURv+23qvhkQs=;
        b=M+QeZAYDdO9UFeKJgTtuicgNuT1BJuATxMaqj57MJRmOJEE//SPXMfq/AV1eUkjtDd
         aU1PQcC1Ux9xdfLIIatUxXx3ncfQaw/Cb2CDWNzhkTBcwV4sl0bJ+FbR4pJ4NJO6ZGz1
         cjEmy/CM6qf6V40A0ur+kxF0HN2gEyOOdd15Ca7N8OniP63HWhRKAyuks4Ca6LbouWKf
         7+v9L2y7EC+YnGe0ySvzGLSKtB0vKnxVdjp385+aXfLKEIwXdg40n1vSKd7y5LzuonjZ
         FeKeAlt8aTXtbFLP5TgN7Asw09ZP71o/HlvCAxMTZlhRXlXXLsz3d6F1VAN055rnKYL7
         zuag==
X-Gm-Message-State: AOJu0YzRmgdBhiOffj6ASlK0z1PlXU7wuRlTfIX13ZLdBVVuM5WREuwj
	rcz9pcEkffFbaBKLBVUS53gpT57EyVJErEaMl8a9zBXDuENG7A==
X-Google-Smtp-Source: AGHT+IFxNI5vhPQCV5LzUmJPobJtINCRB0tNkmx3QMkuJ1PwzLGXQC+feJmWLQLEOPpY/NDrET3CJg==
X-Received: by 2002:a5d:5309:0:b0:336:73d6:b42b with SMTP id e9-20020a5d5309000000b0033673d6b42bmr664244wrv.117.1704901759168;
        Wed, 10 Jan 2024 07:49:19 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (vau06-h02-176-184-43-236.dsl.sta.abo.bbox.fr. [176.184.43.236])
        by smtp.gmail.com with ESMTPSA id m2-20020adfa3c2000000b00336c9ad1173sm5236966wrb.26.2024.01.10.07.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 07:49:18 -0800 (PST)
Message-ID: <c6c3f9e3-c658-4f5f-b0d9-c57d83a61610@linaro.org>
Date: Wed, 10 Jan 2024 16:49:16 +0100
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
X-TUID: vlvCykaSza1G

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
