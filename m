Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp516853njj;
        Tue, 29 Oct 2024 13:11:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxWXWcXQfxjVJXqdDn4yqfeQ1GKF09XjDpmrPhrIHAFtmFLYsLFX1f6ZkqriZwpsoMDQy/W+/wFp+CwQ==@linaro.org
X-Received: by 2002:a05:6512:1584:b0:536:a695:9429 with SMTP id 2adb3069b0e04-53b348c16a1mr7598313e87.10.1730232668495;
        Tue, 29 Oct 2024 13:11:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730232668; cv=none;
        d=google.com; s=arc-20240605;
        b=OGVpFlgxgK6ra8MpZtYHtj+UL3Nil/9OlVq3jOAI2nL1TQgqz8arEvoWEMNwgAV4Jm
         Cj5sWtX6jFF7DMQ2bnxAFMnZOaQ4c89uVVXb2PndgsRdlvkWiIakEaOxlRYC9V5jLdkY
         gpQeH9Js37sJwFbSayAKQOHpyJSLJdO0UN4cBxairWAcoKANVzZL7qffeCqLM7ixOaXy
         urbt2WrYWPQn3Dkg3/k5OHy3lNRpKhXviQi9P6dZ/42eNCaqGm7zI0DQOLWVUWTEVKxg
         A4fNDwNg1IAjcYTMbh/5sXYAlLLD+BFUi/MlVAZveeCDiA/nXXzm5DnLUoDpzwRgTlvB
         pDrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mVffrm7ORWtwr/oTU7Spuj4YBIi+VLsXfNiPlPYNk9Q=;
        fh=QWo6zyxp0nzT/2TlMDy50fkZ5LbLX7Gk+UtIe0nl8LY=;
        b=Sy27mVivUw6SVUmgwv+sQzA5Hi4g2aEj6aOBiIvzAk8tGpdczkgbWiIiaFDrn6SLmk
         z/ABthYUMuNl9OyszvROoJ9jb7TTFIOd+ywcOEc6ntfZnNhBEXAiwUU6U7mMcPsc/h3b
         ihiuShRiFTKzvtVwS1zfiengyJYrFVRvgepm+dG3NH/EjG5UHqCxSvGAf/OgiXYlQxGB
         tju4xH0DGHzqhhW160Ns+iaBqNs51OXDPMf+YimEImftHRwCwz3jO7e6j10B/iZMS0SE
         7M99jOBXE9ZmotoMUrRWajsH64XUSgXdkui11k5RWzbpqnNqQbiiYr1GI3V5clP95RrE
         gk6g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jf7M5j0t;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-53b2e1f5811sor2832903e87.30.2024.10.29.13.11.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Oct 2024 13:11:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jf7M5j0t;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730232668; x=1730837468; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mVffrm7ORWtwr/oTU7Spuj4YBIi+VLsXfNiPlPYNk9Q=;
        b=Jf7M5j0tPs2IjWX4yz1xr53lbkUHhCvdhsRD18nCq4hRXhJ4LMjBqWxgrYC1mYZ17/
         C9txV8w5jq1GOiIvNU9SQlsEWjbaJBiWdB/0OCFHjmiFSakXYSISFII4gAnRUXRlsjSg
         cp6fVrMogCJk5jReczF9PncIm/k393d7WRB4r8P2EsaXljcMuLcRSk+9Jwo7P7wdbke8
         xE0xfd2oIdOgFUKlzQLnmOUZ43wKIsWpyaOUY8zCIDDG3vy4ikVpJMHjNifEChNgn27G
         vqt+B0hMenhf1vFRzSILQR3JTxA71HN/n+Fnj5HKAseP+CpBqHcM8EaiAbOvtL1lJraq
         zQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730232668; x=1730837468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mVffrm7ORWtwr/oTU7Spuj4YBIi+VLsXfNiPlPYNk9Q=;
        b=fXfc0UtovTx1kBlimIhFZw5ByF1/Yz3djqvoalrq3X1LoVc+SwTa3fr+8cw6tJDr8P
         jsLHk/vRyU0ltLtRWiSMriZESy1AwTzCf8to+2ZQEJ8ZX1FxQbJoRuSGQ7nSj79llH8V
         QpJHLRh/0lIiw/HMLGGN8owpXcF5IZvKYaIFSwECEW3MdAwO+02mHD3rPHpg3EekRjx/
         zh+4WFEdMqdmL7l61zgiKbqvF44fryCC5TWBujG2Ea812bLXgpi+b2tPm1F2jGUAbuam
         cYFXCDj5BUo0D6a36ynjPwLAEhNjK+4/9Hue6J7ljgL1xDuhrlWUQLJI5RqeFBzpPO5e
         Sh3g==
X-Forwarded-Encrypted: i=1; AJvYcCUX+YZLp0RYd+F+MWRHrZU/bPokHlvycZgBOUzSxK57IzI8uTWsGbIy4NXRqm4Ptm4qVBJIvk81f+fyXQ==@linaro.org
X-Gm-Message-State: AOJu0YyLnIZYeL6c+RSHCgkq8PE26ArX9gzPssXjO6J2mVHEvk9dWDAB
	Y0wJsm5u78yPI5hFjB1PzsnXkpWfmI1U3A0roTeRpLe6KBOcljwW2WZAqT/YxAOU+Q==
X-Google-Smtp-Source: AGHT+IEQm7S7HhrAefu6bB3WsI9sjvU1NibhMhK2h3mgqHzs6Ac3q/ixT/MrrVYq2nNiKqsosFqETQ==
X-Received: by 2002:a05:6512:1285:b0:539:e513:1f66 with SMTP id 2adb3069b0e04-53b3491e086mr6508337e87.37.1730232667785;
        Tue, 29 Oct 2024 13:11:07 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.156.226] ([91.223.100.133])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53bc0d5f161sm40364e87.213.2024.10.29.13.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 13:11:07 -0700 (PDT)
Message-ID: <31e8dc51-f70f-44eb-a768-61cfa50eed5b@linaro.org>
Date: Tue, 29 Oct 2024 17:10:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] hw/core: Make CPU topology enumeration
 arch-agnostic
To: Zhao Liu <zhao1.liu@intel.com>, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>
References: <20241022135151.2052198-1-zhao1.liu@intel.com>
 <20241022135151.2052198-3-zhao1.liu@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241022135151.2052198-3-zhao1.liu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: EXw6ZwPZlFta

On 22/10/24 10:51, Zhao Liu wrote:
> Cache topology needs to be defined based on CPU topology levels. Thus,
> define CPU topology enumeration in qapi/machine.json to make it generic
> for all architectures.
> 
> To match the general topology naming style, rename CPU_TOPO_LEVEL_* to
> CPU_TOPOLOGY_LEVEL_*, and rename SMT and package levels to thread and
> socket.
> 
> Also, enumerate additional topology levels for non-i386 arches, and add
> a CPU_TOPOLOGY_LEVEL_DEFAULT to help future smp-cache object to work
> with compatibility requirement of arch-specific cache topology models.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> Tested-by: Yongwei Ma <yongwei.ma@intel.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
> Changes since Patch v3:
>   * Dropped "invalid" level to avoid an unsettable option. (Daniel)
> ---
>   hw/i386/x86-common.c       |   4 +-
>   include/hw/i386/topology.h |  23 ++----
>   qapi/machine-common.json   |  44 +++++++++++-
>   target/i386/cpu.c          | 144 ++++++++++++++++++-------------------
>   target/i386/cpu.h          |   4 +-
>   5 files changed, 123 insertions(+), 96 deletions(-)
> 
> diff --git a/hw/i386/x86-common.c b/hw/i386/x86-common.c
> index b86c38212eab..bc360a9ea44b 100644
> --- a/hw/i386/x86-common.c
> +++ b/hw/i386/x86-common.c
> @@ -273,12 +273,12 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
>   
>       if (ms->smp.modules > 1) {
>           env->nr_modules = ms->smp.modules;
> -        set_bit(CPU_TOPO_LEVEL_MODULE, env->avail_cpu_topo);
> +        set_bit(CPU_TOPOLOGY_LEVEL_MODULE, env->avail_cpu_topo);
>       }
>   
>       if (ms->smp.dies > 1) {
>           env->nr_dies = ms->smp.dies;
> -        set_bit(CPU_TOPO_LEVEL_DIE, env->avail_cpu_topo);
> +        set_bit(CPU_TOPOLOGY_LEVEL_DIE, env->avail_cpu_topo);
>       }
>   
>       /*
> diff --git a/include/hw/i386/topology.h b/include/hw/i386/topology.h
> index 48b43edc5a90..b2c8bf2de158 100644
> --- a/include/hw/i386/topology.h
> +++ b/include/hw/i386/topology.h
> @@ -39,7 +39,7 @@
>    *  CPUID Fn8000_0008_ECX[ApicIdCoreIdSize[3:0]] is set to apicid_core_width().
>    */
>   
> -
> +#include "qapi/qapi-types-machine-common.h"
>   #include "qemu/bitops.h"
>   
>   /*
> @@ -62,22 +62,7 @@ typedef struct X86CPUTopoInfo {
>       unsigned threads_per_core;
>   } X86CPUTopoInfo;
>   
> -#define CPU_TOPO_LEVEL_INVALID CPU_TOPO_LEVEL_MAX
> -
> -/*
> - * CPUTopoLevel is the general i386 topology hierarchical representation,
> - * ordered by increasing hierarchical relationship.
> - * Its enumeration value is not bound to the type value of Intel (CPUID[0x1F])
> - * or AMD (CPUID[0x80000026]).
> - */
> -enum CPUTopoLevel {
> -    CPU_TOPO_LEVEL_SMT,
> -    CPU_TOPO_LEVEL_CORE,
> -    CPU_TOPO_LEVEL_MODULE,
> -    CPU_TOPO_LEVEL_DIE,
> -    CPU_TOPO_LEVEL_PACKAGE,
> -    CPU_TOPO_LEVEL_MAX,
> -};
> +#define CPU_TOPOLOGY_LEVEL_INVALID CPU_TOPOLOGY_LEVEL__MAX


> @@ -341,18 +341,18 @@ static uint32_t apicid_offset_by_topo_level(X86CPUTopoInfo *topo_info,
>       return 0;
>   }
>   
> -static uint32_t cpuid1f_topo_type(enum CPUTopoLevel topo_level)
> +static uint32_t cpuid1f_topo_type(enum CpuTopologyLevel topo_level)
>   {
>       switch (topo_level) {
> -    case CPU_TOPO_LEVEL_INVALID:
> +    case CPU_TOPOLOGY_LEVEL_INVALID:

Since we use an enum, I'd rather directly use CPU_TOPOLOGY_LEVEL__MAX.

Or maybe in this case ...

>           return CPUID_1F_ECX_TOPO_LEVEL_INVALID;
> -    case CPU_TOPO_LEVEL_SMT:
> +    case CPU_TOPOLOGY_LEVEL_THREAD:
>           return CPUID_1F_ECX_TOPO_LEVEL_SMT;
> -    case CPU_TOPO_LEVEL_CORE:
> +    case CPU_TOPOLOGY_LEVEL_CORE:
>           return CPUID_1F_ECX_TOPO_LEVEL_CORE;
> -    case CPU_TOPO_LEVEL_MODULE:
> +    case CPU_TOPOLOGY_LEVEL_MODULE:
>           return CPUID_1F_ECX_TOPO_LEVEL_MODULE;
> -    case CPU_TOPO_LEVEL_DIE:
> +    case CPU_TOPOLOGY_LEVEL_DIE:
>           return CPUID_1F_ECX_TOPO_LEVEL_DIE;
>       default:
            /* Other types are not supported in QEMU. */
            g_assert_not_reached();

... return CPUID_1F_ECX_TOPO_LEVEL_INVALID as default.

Can be cleaned on top, so:

Acked-by: Philippe Mathieu-Daudé <philmd@linaro.org>

