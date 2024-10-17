Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp429933njb;
        Thu, 17 Oct 2024 13:25:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXYeh4444VBVtfen8ZSPZWoi09AVzm2NE526BHq79S6uvk1x9Fw4PRTklt33V3etIO7N2V9QIwO2axB4A==@linaro.org
X-Received: by 2002:a17:902:da8f:b0:20b:6f02:b4e5 with SMTP id d9443c01a7336-20e5a70d5d6mr2178585ad.9.1729196732872;
        Thu, 17 Oct 2024 13:25:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729196732; cv=none;
        d=google.com; s=arc-20240605;
        b=RkAQ4eh70vN1hVEoK3SHO46Q6lszZOGTA98McSX0PGdNN0xCWCvGbuAIDxf1eCOamd
         6thIaHf5Yum2mUSUAQkisefNWDMu2VAKDke4EoIIITwWYqXnhUrfh/xQap8vg1xz14ih
         Cl5BiBNcZcU510saQQRaZ9KyR+JyD7WuuBQ9+nAkNvzAmGV3RffjOI+Mhij6XaEjeo5Y
         RKZodmwFUdJM2/KZuK06bLJ3yhlaUw6GiARzCtHtJoCfeapS25aXw+69ViD1EXgPtXbl
         VeR/xrfiIqHVx4uSojmcLt5xb0BgDe0xHr2e4TCSESgn+Wn5pJAiBXQq8Yw+MOVHzuZ/
         BOpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=emq/pF99Weq//+1o2qFlB60qkHZsJbYzWrdr3wg7i5A=;
        fh=WfnOkFD7lEUoU3EPd0p2OICHvFmf+vxF9n5iAhIRl/c=;
        b=jD+HiY7xA5GPea1FK8+vv7kvNlxhe3b29tRcrpTjpq53AwM3siGYnN/1MHjRswrwKy
         Y8d/JTRHXMJGFn2M4JjEF+2qcGhY5xHwu0gx5LsCP3cNSzDHiYjQhUKXSpql3vUKe9tr
         KC56jSpUCoY4Db5kLUK3Fyc+pM71/cKHb7eWk0bSRuHTOqBiGZ3idUwPmPsX6woYlJhO
         ma6n2MLA/6e+vLT0d3BfNuSC9vwuttk88FDclrFuvWYe9JyjtQY8DqhDxv/cqUVZs/3M
         ZQ7ZzsLY1xYYnFxOxtjrTs4thvHMzLSZ2ISANsmcVN+l2NABe7+RcYRhpUnZXtcluxxg
         Izkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZmmAAxzK;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20e5a70d7b4sor584225ad.4.2024.10.17.13.25.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 Oct 2024 13:25:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZmmAAxzK;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729196732; x=1729801532; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=emq/pF99Weq//+1o2qFlB60qkHZsJbYzWrdr3wg7i5A=;
        b=ZmmAAxzKKewR1wSP2nq2ZzPj7j9EvFxGb83rxlRJasVQkuobykm8fVblmOtZUpLEGJ
         hjfF2wUw24aNx7GXl5k2NetWfwbc3la54YNpFB4Yd/wGugkDLwJBqTlkKDyrgasYIFR2
         Ra4tEZaQiyQdjvPsMZYOA9/xyFGya25sQ/1WCuERWh1quCRjduzvEQ8b3WZtV3YfHf+L
         N2UjeWn6B0cX/AVnEGVIQhM+XgiLtUGNGzyhjevk3BFwno72rJgcRWLrYXMoOsrJu1rz
         PMlNm+Yqmlzn6H6St2WhD6m99f2w/4XEasMUkP3df0wbv7arwiD0Cnm9YzfX73lxOTVx
         dtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729196732; x=1729801532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=emq/pF99Weq//+1o2qFlB60qkHZsJbYzWrdr3wg7i5A=;
        b=NRa5pPzYGbIP4mROIh0F5sD9e6yihrmtkbf9rzbophqjKfngzomaic0GhFR7QrRxiu
         PGMHmS3Se7jQpeN+bN5uqPs/xF4Pa4QRrIZfAcmOPCVj1hBG6oUl5VOSeudgLGgQmrfu
         iyElWN5YtPcjp4xvOPL5k8LnHb6GdDtCoUfPgX/LGS/ZET98A83otHwkzPUrREUov0/r
         4+l72lxbiQPvtbePWYPFwpLTlKU+iU35Wx0ow4Hw76wUqiNKYuKLIOGMR3tz7ZyjAZQS
         17GEWsbAaPe7fM30vFAOhvSp85Ep8fVq8CbhsVmYWT03KQQPNXUg7donSroke0b/c1aQ
         sX5w==
X-Forwarded-Encrypted: i=1; AJvYcCVqkhvSCp7j2hEdUaCHU6H9B2ve+M7rLoPQEnV9D3PmPdXTKTyMEUn4Xdhjm4MnyBMr6DcM5Qj+ESjRmA==@linaro.org
X-Gm-Message-State: AOJu0YyzPYFbHLN3WifTYZJuin9e26pJ3w6dYAmTayLXG005Euo+cJ6+
	MVfLJxbTBdle4pCWD6Pf4b70h42cRTq6x6bs21WH8BUlDFaANre0VrR0B3Mvek0yUw==
X-Google-Smtp-Source: AGHT+IEhW9vljHw/FMQFX4+mOjH2vadhvy01NFUe4yUDQRSW05QQw5/Sgu9UF0E1asKtThsAGlbTPQ==
X-Received: by 2002:a17:903:990:b0:20c:d428:adf4 with SMTP id d9443c01a7336-20e5a8f3e51mr2130685ad.38.1729196732288;
        Thu, 17 Oct 2024 13:25:32 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([187.121.94.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e5a90f1eesm355085ad.262.2024.10.17.13.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 13:25:31 -0700 (PDT)
Message-ID: <ebf3ba9c-6891-4fb7-80e4-1169011b2e6d@linaro.org>
Date: Thu, 17 Oct 2024 17:25:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/4] hw/acpi: Initialize ACPI Hotplug CPU Status with
 Support for vCPU `Persistence`
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com, will@kernel.org,
 ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 gshan@redhat.com, rafael@kernel.org, borntraeger@linux.ibm.com,
 alex.bennee@linaro.org, npiggin@gmail.com, harshpb@linux.ibm.com,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 karl.heubaum@oracle.com, miguel.luis@oracle.com, salil.mehta@opnsrc.net,
 zhukeqian1@huawei.com, wangxiongfeng2@huawei.com, wangyanan55@huawei.com,
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
 shahuang@redhat.com, zhao1.liu@intel.com, linuxarm@huawei.com
References: <20241014192205.253479-1-salil.mehta@huawei.com>
 <20241014192205.253479-2-salil.mehta@huawei.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20241014192205.253479-2-salil.mehta@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: K0rB0/a3jsqN

Hi Salil,

On 10/14/24 16:22, Salil Mehta wrote:
> Certain CPU architecture specifications [1][2][3] prohibit changes to CPU
> presence after the kernel has booted. This limitation exists because many system
> initializations rely on the exact CPU count at boot time and do not expect it to
> change later. For example, components like interrupt controllers, which are
> closely tied to CPUs, or various per-CPU features, may not support configuration
> changes once the kernel has been initialized. This presents a challenge for
> virtualization features such as vCPU hotplug.
> 
> To address this issue, introduce an `is_enabled` state in the `AcpiCpuStatus`,
> which reflects whether a vCPU has been hot-plugged or hot-unplugged in QEMU,
> marking it as (un)available in the Guest Kernel. The `is_present` state should
> be set based on the `acpi_persistent` flag. In cases where unplugged vCPUs need
> to be deliberately simulated in the ACPI to maintain a persistent view of vCPUs,
> this flag ensures the guest kernel continues to see those vCPUs.
> 
> Additionally, introduce an `acpi_persistent` property that can be used to
> initialize the ACPI vCPU presence state accordingly. Architectures requiring
> ACPI to expose a persistent view of vCPUs can override its default value. Refer
> to the patch-set implelenting vCPU hotplug support for ARM for more details on
> its usage.
> 
> References:
> [1] KVMForum 2023 Presentation: Challenges Revisited in Supporting Virt CPU Hotplug on
>      architectures that don’t Support CPU Hotplug (like ARM64)
>      a. Kernel Link: https://kvm-forum.qemu.org/2023/KVM-forum-cpu-hotplug_7OJ1YyJ.pdf
>      b. Qemu Link:  https://kvm-forum.qemu.org/2023/Challenges_Revisited_in_Supporting_Virt_CPU_Hotplug_-__ii0iNb3.pdf
> [2] KVMForum 2020 Presentation: Challenges in Supporting Virtual CPU Hotplug on
>      SoC Based Systems (like ARM64)
>      Link: https://kvmforum2020.sched.com/event/eE4m
> [3] Check comment 5 in the bugzilla entry
>      Link: https://bugzilla.tianocore.org/show_bug.cgi?id=4481#c5
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   cpu-target.c          |  1 +
>   hw/acpi/cpu.c         | 35 ++++++++++++++++++++++++++++++++++-
>   include/hw/acpi/cpu.h | 21 +++++++++++++++++++++
>   include/hw/core/cpu.h | 21 +++++++++++++++++++++
>   4 files changed, 77 insertions(+), 1 deletion(-)
> 
> diff --git a/cpu-target.c b/cpu-target.c
> index 499facf774..c8a29ab495 100644
> --- a/cpu-target.c
> +++ b/cpu-target.c
> @@ -200,6 +200,7 @@ static Property cpu_common_props[] = {
>        */
>       DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
>                        MemoryRegion *),
> +    DEFINE_PROP_BOOL("acpi-persistent", CPUState, acpi_persistent, false),
>   #endif
>       DEFINE_PROP_END_OF_LIST(),
>   };
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 5cb60ca8bc..083c4010c2 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -225,7 +225,40 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
>       state->dev_count = id_list->len;
>       state->devs = g_new0(typeof(*state->devs), state->dev_count);
>       for (i = 0; i < id_list->len; i++) {
> -        state->devs[i].cpu =  CPU(id_list->cpus[i].cpu);
> +        struct CPUState *cpu = CPU(id_list->cpus[i].cpu);
> +        /*
> +         * In most architectures, CPUs that are marked as ACPI 'present' are
> +         * also ACPI 'enabled' by default. These states remain consistent at
> +         * both the QOM and ACPI levels.
> +         */
> +        if (cpu) {
> +            state->devs[i].is_enabled = true;
> +            state->devs[i].is_present = true;
> +            state->devs[i].cpu = cpu;
> +        } else {
> +            state->devs[i].is_enabled = false;
> +            /*
> +             * In some architectures, even 'unplugged' or 'disabled' QOM CPUs
> +             * may be exposed as ACPI 'present.' This approach provides a
> +             * persistent view of the vCPUs to the guest kernel. This could be
> +             * due to an architectural constraint that requires every per-CPU
> +             * component to be present at boot time, meaning the exact count of
> +             * vCPUs must be known and cannot be altered after the kernel has
> +             * booted. As a result, the vCPU states at the QOM and ACPI levels
> +             * might become inconsistent. However, in such cases, the presence
> +             * of vCPUs has been deliberately simulated at the ACPI level.
> +             */
> +            if (acpi_persistent_cpu(first_cpu)) {
> +                state->devs[i].is_present = true;
> +                /*
> +                 * `CPUHotplugState::AcpiCpuStatus::cpu` becomes insignificant
> +                 * in this case
> +                 */
> +            } else {
> +                state->devs[i].is_present = false;
> +                state->devs[i].cpu = cpu;

I think it's better to set cpu here explicitly to NULL in both cases
(persistent and non-persistent cases). Also, 'cpu' here is always NULL
since it's inside the else block of "if (cpu)" conditional. So how about
setting cpu to NULL at the end of the else block:

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index d34c1e601e..b830c0e85b 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -251,14 +251,14 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object 
*owner,
               */
              if (acpi_persistent_cpu(first_cpu)) {
                  state->devs[i].is_present = true;
-                /*
-                 * `CPUHotplugState::AcpiCpuStatus::cpu` becomes 
insignificant
-                 * in this case
-                 */
              } else {
                  state->devs[i].is_present = false;
-                state->devs[i].cpu = cpu;
              }
+            /*
+             * `CPUHotplugState::AcpiCpuStatus::cpu` becomes insignificant
+             * in this case
+             */
+            state->devs[i].cpu = NULL;
          }
          state->devs[i].arch_id = id_list->cpus[i].arch_id;
      }


Cheers,
Gustavo

> +            }
> +        }
>           state->devs[i].arch_id = id_list->cpus[i].arch_id;
>       }
>       memory_region_init_io(&state->ctrl_reg, owner, &cpu_hotplug_ops, state,
> diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
> index 32654dc274..bd3f9973c9 100644
> --- a/include/hw/acpi/cpu.h
> +++ b/include/hw/acpi/cpu.h
> @@ -26,6 +26,8 @@ typedef struct AcpiCpuStatus {
>       uint64_t arch_id;
>       bool is_inserting;
>       bool is_removing;
> +    bool is_present;
> +    bool is_enabled;
>       bool fw_remove;
>       uint32_t ost_event;
>       uint32_t ost_status;
> @@ -75,4 +77,23 @@ extern const VMStateDescription vmstate_cpu_hotplug;
>       VMSTATE_STRUCT(cpuhp, state, 1, \
>                      vmstate_cpu_hotplug, CPUHotplugState)
>   
> +/**
> + * acpi_persistent_cpu:
> + * @cpu: The vCPU to check
> + *
> + * Checks if the vCPU state should always be reflected as *present* via ACPI
> + * to the Guest. By default, this is False on all architectures and has to be
> + * explicity set during initialization.
> + *
> + * Returns: True if it is ACPI 'persistent' CPU
> + *
> + */
> +static inline bool acpi_persistent_cpu(CPUState *cpu)
> +{
> +    /*
> +     * returns if 'Presence' of the vCPU is persistent and should be simulated
> +     * via ACPI even after vCPUs have been unplugged in QOM
> +     */
> +    return cpu && cpu->acpi_persistent;
> +}
>   #endif
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 04e9ad4996..299e96c45b 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -542,6 +542,27 @@ struct CPUState {
>       CPUPluginState *plugin_state;
>   #endif
>   
> +    /*
> +     * To implement the vCPU hotplug feature (which simulates CPU hotplug
> +     * behavior), we need to dynamically create and destroy QOM vCPU objects,
> +     * and (de)associate them with pre-existing KVM vCPUs while (un)parking the
> +     * KVM vCPU context. One challenge is ensuring that these dynamically
> +     * appearing or disappearing QOM vCPU objects are accurately reflected
> +     * through ACPI to the Guest Kernel. Due to architectural constraints,
> +     * changing the number of vCPUs after the guest kernel has booted may not
> +     * always be possible.
> +     *
> +     * In certain architectures, to provide the guest kernel with a *persistent*
> +     * view of vCPU presence, even when the QOM does not have a corresponding
> +     * vCPU object, ACPI may simulate the presence of vCPUs by marking them as
> +     * ACPI-disabled. This is achieved by setting `_STA.PRES=True` and
> +     * `_STA.Ena=False` for unplugged vCPUs in QEMU's QOM.
> +     *
> +     * By default, this flag is set to `FALSE`, and it must be explicitly set
> +     * to `TRUE` for architectures like ARM.
> +     */
> +    bool acpi_persistent;
> +
>       /* TODO Move common fields from CPUArchState here. */
>       int cpu_index;
>       int cluster_index;
