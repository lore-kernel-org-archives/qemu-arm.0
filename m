Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp445006njb;
        Thu, 5 Dec 2024 13:47:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUajywFLioBUPUqsxuyqAPp7HFn4A11Q3pAhbOu7VWIvDWtC/6tPwgLc3p7gnsjNmFIO0/Yy9G3JoGnrQ==@linaro.org
X-Received: by 2002:a5d:64c5:0:b0:385:fabf:13ca with SMTP id ffacd0b85a97d-3862b37b4fdmr509200f8f.32.1733435236418;
        Thu, 05 Dec 2024 13:47:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733435236; cv=none;
        d=google.com; s=arc-20240605;
        b=JEKqZ4sggXdnI6EaKvwpG2N5DbhTCZvUZceyZB8oLmjx/Q8JrF5WWauQn2nGLiVEjF
         /ii2ZIT26fmK6cDGF1VmrNQRfUlXPWJfoazag9E550UXq1Z8PecOR/QIZtEIQ8h303OT
         QmVhvJ5bPkL+K0a2Ld3A0qGGc07bbRTona2TiC89hEkBgwVX2vHUpkkf7iX2Q7rIsmeU
         lzeAkmDZ+UAKdytk3oHlEbSfYutQlEi697HvKFD/ETn30G8FilFnVjxiq8vqv3z9HvWA
         hWbQoPc5Fd/mf7QWX1UFG0ooZsq1+q8+7IhT98ptAUT6Lu1BeemgJoYQxlfBZjL60lnH
         qH8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=S7oloZtdAFlggY7iYEm/VYD6hoPyI4SX55Z1OM7NXHI=;
        fh=XOfwStN4S+s/fW/1iTH2pC4KJc78y6vY9TipVQQ5iL8=;
        b=dXQOcnFUlo8iszpWbYUqH/H7fkisfd+EQlBJPVgnVk2OJg5ej5AGv5fP87/f96JXF0
         SEHnOoa2I90rVOg/Tof6l7n7qo2bqmSZEFkqwpxv7PNwvwxJq75MSK7cAiwIYyCz4WHm
         NoyyyYhD+ThFd+moOuhN0rwvACj/IrT3EtnY/61MNPnalTLNpoUSI/2MguQAsX9o5eGi
         r82xn5HQyUIRjJXSEm5RWAMpSIIZc12m75RO/DaC4tPcy23ZI+fzgdv02u/KNdy2Ocip
         dkepYugLkKfX9VoxYP6pSoizKiMa7I5dfTc3KuZdiV4zVjmTp1DfyNM3rXTfbVzscB2I
         Pk+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xANdwz1m;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3861d0ff13fsor857258f8f.0.2024.12.05.13.47.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Dec 2024 13:47:16 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xANdwz1m;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733435236; x=1734040036; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S7oloZtdAFlggY7iYEm/VYD6hoPyI4SX55Z1OM7NXHI=;
        b=xANdwz1maeNbKBgWaQhQoZvRfkSC+9ahx6Yvz/xrBWr3fhf5wEgly+dx6SDZ/Bq3Wc
         CEtJt+LTmoXtZ3U7gYULkQqeMkLWDvQy0N6BYFFpsQcgTjGOMWKr2V6uX6nOzyeABSMp
         tlCcl8m8OmWjtE/lyHenuTFLDpt6n7XnS7yuH/KqH/26gCU+EJ1rcy4ri1ny2wN3jpVF
         5R9ZIE9CIL3em2i3LEjQRZQw17YtokzoDI/7QLLVJ0TICt7cVpABXM0tmSb4HGtmcDg9
         bJ8esoXV5dMeRV4CqQnumF4qUB+yb+YjK4UcQNfVxDK0wktYw3SZU5o2ovCYejKbYVzF
         YaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733435236; x=1734040036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7oloZtdAFlggY7iYEm/VYD6hoPyI4SX55Z1OM7NXHI=;
        b=ZDPYQn2CdrhBTr2+zaPmkoGQbbCTJ/p7pQZcMGNv8IB0dK+fnWbAXtFgrEN0TiMig7
         TrtzoMabgVEkRz/YYaM/ml+FD+zvsWsELwblzucEuxiW55RxeooHDB5o7YoMlSNbAPVE
         GR38TH2wIPKinWaYdW4SaZGz5pb6HMfXOYrhRYfrhhYdnpRw9Ew46CFOqlQDRwceGXUL
         FaJEhlQIqFiTLDEqUGyD0SmHlk2sABCRvoEA5HwvjKaLt9LLfWRUCuNOngv1VhXeYVGg
         ylvxekApDtgIn2+/OBSroxL2rNn+dwD0ARPgoGodMwxk7j4KQpnPWxa+R+ZsQ8xStMFR
         DwTA==
X-Forwarded-Encrypted: i=1; AJvYcCV5seUan4SAtrE7jcM+2y7Q1/AYc3hXW2GtBiFcy83B52y93QVSHtINRNTU085SYe6qvOVCwBoMQ6TB4w==@linaro.org
X-Gm-Message-State: AOJu0YwDP7hq83w+zmfLLzztwXAiVdiXmssXP7+J5Oo2NtdPF2RMNcDW
	F2sEHPFr+xK8g085BkbDpeFiovCetEc36BiAs/nsQH4js6d+/giNOTgj3wWuj60GqA==
X-Gm-Gg: ASbGncsqMan88VkxCpp5ku3M0vYAGxNkEpgNG8oomBBYgbhmOHMP1QXqk2djNGnt41C
	WmcIv7hvpVld/aBXjauhSIIbaztlecyBtvWkbjOs58ckOukUaeqAgfW3zl3wAP/rDmq4MJy37JH
	HQf0/6jCuw/isXKtcKiZwtY+esWXgjDlhCMNRHjbcoeY+csncmOaq4cpPd4XNdqsAkI3L7X9Bix
	D335dyxzLqqlFopZqcDCvAoBdj/g3QdXTHEG2mC7Bn+GzvM8N48VRlWMCDZqGj0Ci436nX0eudH
	A4Gp5qS3KCgm0x4kSA==
X-Google-Smtp-Source: AGHT+IGUeXcPeKrzv7fW+qiEz+ipxnFA9sLwlFUbe5YhNXkWiTHGefXmGoK1mP+xoNEQrkoa6rBGqw==
X-Received: by 2002:a5d:6d84:0:b0:385:fb53:c67 with SMTP id ffacd0b85a97d-3862b33e4a1mr480936f8f.3.1733435235933;
        Thu, 05 Dec 2024 13:47:15 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.223] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861fd46cb2sm2958327f8f.62.2024.12.05.13.47.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 13:47:15 -0800 (PST)
Message-ID: <d130d7d2-acff-4dfe-97f7-346174fa079f@linaro.org>
Date: Thu, 5 Dec 2024 22:47:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/26] target/arm/kvm: Return immediately on error in
 kvm_arch_init()
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 alex.bennee@linaro.org
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-5-jean-philippe@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241125195626.856992-5-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Ctxzaxu+4wXJ

Hi Jean-Philippe,

On 25/11/24 20:56, Jean-Philippe Brucker wrote:
> Returning an error to kvm_init() is fatal anyway, no need to continue
> the initialization.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>   target/arm/kvm.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 8bdf4abeb6..95bcecf804 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -563,7 +563,7 @@ int kvm_arch_get_default_type(MachineState *ms)
>   
>   int kvm_arch_init(MachineState *ms, KVMState *s)
>   {
> -    int ret = 0;
> +    int ret;

With your change we can reduce this variable scope ...

>       /* For ARM interrupt delivery is always asynchronous,
>        * whether we are using an in-kernel VGIC or not.
>        */
> @@ -585,7 +585,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>           !kvm_check_extension(s, KVM_CAP_ARM_IRQ_LINE_LAYOUT_2)) {
>           error_report("Using more than 256 vcpus requires a host kernel "
>                        "with KVM_CAP_ARM_IRQ_LINE_LAYOUT_2");
> -        ret = -EINVAL;
> +        return -EINVAL;
>       }
>   
>       if (kvm_check_extension(s, KVM_CAP_ARM_NISV_TO_USER)) {
> @@ -607,13 +607,14 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>               warn_report("Eager Page Split support not available");
>           } else if (!(s->kvm_eager_split_size & sizes)) {
>               error_report("Eager Page Split requested chunk size not valid");
> -            ret = -EINVAL;
> +            return -EINVAL;
>           } else {
>               ret = kvm_vm_enable_cap(s, KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE, 0,
>                                       s->kvm_eager_split_size);

... by declaring it here.

Otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>               if (ret < 0) {
>                   error_report("Enabling of Eager Page Split failed: %s",
>                                strerror(-ret));
> +                return ret;
>               }
>           }
>       }
> @@ -626,7 +627,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>       hw_breakpoints = g_array_sized_new(true, true,
>                                          sizeof(HWBreakpoint), max_hw_bps);
>   
> -    return ret;
> +    return 0;
>   }
>   
>   unsigned long kvm_arch_vcpu_id(CPUState *cpu)
