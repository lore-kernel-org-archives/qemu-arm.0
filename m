Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp976803njj;
        Fri, 2 May 2025 09:39:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWx82BWJBVhfzkutFsrcFEG/Sh1fE3vHxmNyBXUGdjho3vT6Wn7ueORC1XEnyEBYRU0ohyt6AShECV/aQ==@linaro.org
X-Received: by 2002:a05:6a00:4518:b0:73f:ff25:90b3 with SMTP id d2e1a72fcca58-74058b287b4mr5737241b3a.24.1746203980203;
        Fri, 02 May 2025 09:39:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746203980; cv=none;
        d=google.com; s=arc-20240605;
        b=bDLMPHGH6zVUAQm9+KksnLATRMsua8bCBa/MSrDzNuJ1LbgTr/q6QGs3/uwncIE8rk
         PVw5v6n+m81p4xPdkl4+U5IEroG1gA+VMJ5gjcibjqdpDlAQJ/kCdR5ySD+x2wfX9ugE
         1DBXlzxRG4kipz56LNSC+kq4E/bgZZPqk1oBcZaMEUKS20OlQwfRzJDv0q3Mx4cBj8nH
         p8J+TNIeNox4a6/KjIb6SWAsX13kEDnH4CrCeoWLyoJxm0/wYCteR1obTSs3h5tYAFUh
         M4bWbXRDXrafik/6dUFDN/zhoq2HPVfSNjqsXkfGaZl9zqQZgtEFPKCBXWUZJKYFWR5H
         scKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ov2+fSeigHznskBWAHFz17Xla4OiPqdPbenXGIwMlQQ=;
        fh=GrazwJfnIdiUVwtf+iPiqb5ESMG1LTKjRbUzylxWq90=;
        b=B3IpOVQ/d+BmsQou+mNWCBOXabPB3+0Nsj3ubvsjkKUaBvyZ0Q6lrc1MJXFUEIIxxO
         Rx9CCoVdEi6YKojOzTpaJ2c89Ge6fVNuEvq/deP74hA/YkA3dXQhA1ofo7USLOJFUAxw
         jKfKCMM1xkXp1LMIo5RoPJMfM3DzFp+Fb96oESpvZwIf2CDQ6eglngZlz3SGQygPQSg8
         J7Hu0UkoJryQ+fQroDA6NsIgcjYnHr+iJGRpIeKBUQAKi3k5abxzky/U8iNh7kSY2LN2
         pK5LTLOs9I/REB650hUkUQ/MK2exJwuQOmNcCcFooevPn23my0A97tcop1gVF2So+6Vq
         TAng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o5AIH8zc;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404e5abf7esor1697244b3a.0.2025.05.02.09.39.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 02 May 2025 09:39:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o5AIH8zc;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746203980; x=1746808780; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ov2+fSeigHznskBWAHFz17Xla4OiPqdPbenXGIwMlQQ=;
        b=o5AIH8zcKCpxM6+RYPgxvN2/gaJg+2pwve72yC2vIEVtWWFdZoNrRL8ge8Wrc6fKIf
         EtbV19m1jM9LH0Otua4Ub/va+rqo2rKOSlm4j1HgDcsmSDcqdMzY88z+uCTrdbXAFU6E
         KZqqt47lgXm7MLWLwmFXUiQ4fRVahj8IcMi91wCe3zpz94BgU+JGbeGjs/MBvzH0B9Da
         va4TaInTf0c9A2upc+MGlq5Ig6CtqW/bNm6/uQ0Zx0CPKx8JNR8ZKF9No/MVoU0ojQHs
         qby/CHDRm35sZ2YJQknZWgQc8ss8l+Xn+RbgqXFdinaOCFg2P3MV9SfBMSnpGEEcfaPX
         IgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746203980; x=1746808780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ov2+fSeigHznskBWAHFz17Xla4OiPqdPbenXGIwMlQQ=;
        b=es9WOh2pnEu9I/o1fQ9p2ND9zPifJN7i1xbiyPB1qnLlp0rHSEQKfG1dmW+NxMg2O6
         RJ4OyFFFiBlSbbfTx5WzHua0nXQ3o5xE1g+EYVqNmhNEbYSiV3FQ6fTzk6iWGJbENGDc
         4gVI5aQPoN4IcooAhCon9oRdSi39QpdD7IpRiC+BGxqa2+hRGCWuajg5iipD9onLKrNy
         V92oPWvlb0RymezT+Ws7FUG4YwqcjuAXI8Kbny5YGRZJIihs6gFnj735CM+r/VhEWbAd
         jM9+rFc4B59kUV83jKVtlYJ/cfgYZZkebErEZy40FKdj/MOZ2UVg6NMwEUBscFpUdJo2
         S9AA==
X-Forwarded-Encrypted: i=1; AJvYcCWL3OAaSTWWTW7EYUbi4axf9X8y4hKvibKdLjaSMIzrC51g6iQ43bWc3snUWQ32oioUO/y1jj7KMuNXhQ==@linaro.org
X-Gm-Message-State: AOJu0Yw2zTi2kBEX7/nSgGzSKbDyTNNjW+OwYfVX55lg5+U5fKbTQf6u
	ys/UvI3PXe9IvhxIkGZBSSKqWdrRUWsDbFG+4QjqpgxR1WylmV247Z8rNDgm6kwjiQ==
X-Gm-Gg: ASbGncunDbp9JiEJdmsNkc8SMuj0BtPiPOzmHhqaYgl7LUVt75RPlrvcniMNWI0kTXD
	FkYHBAP+mw3mpJD7KBTGzly36eOP0aXi7PvQscc8zEImkLYdrLgYTp89gHXjvKwnHoaYKyEH4kv
	5TzXpf1FKKg443WXvIhMgwdAFrgAH/DYz/UH4oBl1ekmXfOYMWLcCXgwQCm0qZAhz9fwzzfwp0j
	9vCs96IG7woSIaBWZTzq86MaRRjUW3igjIaSTwWHCeQcI3Phrh5OqOJ2pv8QSXU8n59u7JY4t+T
	ewcFu4Z1PiXPfXv7hXM70EF/j9BebXst+voU2ZhHQ94x1byogIyN7w==
X-Google-Smtp-Source: AGHT+IHmVuFWCI2rlgJozk+6E57xaLTpIykHP1/vDuaDAViicHmCpsOUPQZ2ztzUWD8nXUVxU0xBOA==
X-Received: by 2002:a05:6a00:4ace:b0:739:50c0:b3fe with SMTP id d2e1a72fcca58-74058a1a76amr5976300b3a.8.1746203979630;
        Fri, 02 May 2025 09:39:39 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c6d5aasm977527a12.74.2025.05.02.09.39.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 09:39:39 -0700 (PDT)
Message-ID: <ff403231-a36a-46a8-9168-2ac32a44328a@linaro.org>
Date: Fri, 2 May 2025 09:39:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] hw/virtio: Introduce CONFIG_VIRTIO_LEGACY to disable
 legacy support
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Jonah Palmer <jonah.palmer@oracle.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250502132441.64723-1-philmd@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250502132441.64723-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: JNAGG5cAMCoL

On 5/2/25 6:24 AM, Philippe Mathieu-Daudé wrote:
> Legacy VirtIO devices don't have their endianness clearly defined.
> QEMU infers it taking the endianness of the (target) binary, or,
> when a target support switching endianness at runtime, taking the
> endianness of the vCPU accessing the device.
>

Probably it's what you meant, but it is clearly defined by the standard 
[1]. It's just not fixed.

2.4.3 Legacy Interfaces: A Note on Virtqueue Endianness
Note that when using the legacy interface, transitional devices and 
drivers MUST use the native endian of the guest as the endian of fields 
and in the virtqueue. This is opposed to little-endian for non-legacy 
interface as specified by this standard. It is assumed that the host is 
already aware of the guest endian.

[1] 
https://docs.oasis-open.org/virtio/virtio/v1.0/cs04/virtio-v1.0-cs04.html#x1-250003

> Devices modelling shouldn't really change depending on a property
> of a CPU accessing it.
> 

Devices concerning various targets are aware of the cpu and its properties.

> For heterogeneous systems, it is simpler to break such dev <-> cpu
> dependency, only allowing generic device models, with no knowledge
> of CPU (or DMA controller) accesses.
>

At this point, we speculated it could be a problem, without really 
proving it. In case all accesses are done within a given vcpu thread, 
there is no ambiguity on the current endianness.
How about we wait to expose a crash in an heterogeneous system to take a 
decision?

> Therefore we introduce the VIRTIO_LEGACY Kconfig key. We keep the
> current default (enabled).
> New binaries can set CONFIG_VIRTIO_LEGACY=n to restrict models to
> the VirtIO version 1 spec.
>

I think it's a good change, regarding the legacy support.

However, if the only goal is to support a custom configuration for 
heterogeneous emulation, I think it's the wrong direction.

In essence, we are working hard right now to remove compile time 
configuration for various QEMU targets.
So seeing a new compile time configuration to solve something looks like 
the opposite of what we are trying to achive.
A possible alternative would be to enable virtio legacy support at 
runtime, based on a specific criteria. From what I remember, legacy vs 
modern is a property set by disable-modern=bool,disable-legacy=bool, and 
"modern" is the default.
Thus, we can simply restrict the disable-legacy=on in case we detect 
it's an heterogeneous emulation scenario.

> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/virtio/virtio-access.h | 5 ++++-
>   hw/virtio/virtio.c                | 8 ++++++++
>   target/arm/cpu.c                  | 5 +++++
>   target/ppc/cpu_init.c             | 5 +++++
>   hw/virtio/Kconfig                 | 5 +++++
>   5 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virtio-access.h
> index 07aae69042a..b5b471711a6 100644
> --- a/include/hw/virtio/virtio-access.h
> +++ b/include/hw/virtio/virtio-access.h
> @@ -20,7 +20,10 @@
>   #include "hw/virtio/virtio.h"
>   #include "hw/virtio/virtio-bus.h"
>   
> -#if defined(TARGET_PPC64) || defined(TARGET_ARM)
> +#include CONFIG_DEVICES
> +
> +#if defined(CONFIG_VIRTIO_LEGACY) && \
> +    (defined(TARGET_PPC64) || defined(TARGET_ARM))
>   #define LEGACY_VIRTIO_IS_BIENDIAN 1
>   #endif
>   
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 480c2e50365..659ab3cb969 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -47,6 +47,8 @@
>   #include "standard-headers/linux/virtio_mem.h"
>   #include "standard-headers/linux/virtio_vsock.h"
>   
> +#include CONFIG_DEVICES
> +
>   /*
>    * Maximum size of virtio device config space
>    */
> @@ -3502,6 +3504,7 @@ void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size)
>   bool virtio_legacy_allowed(VirtIODevice *vdev)
>   {
>       switch (vdev->device_id) {
> +#ifdef CONFIG_VIRTIO_LEGACY
>       case VIRTIO_ID_NET:
>       case VIRTIO_ID_BLOCK:
>       case VIRTIO_ID_CONSOLE:
> @@ -3513,6 +3516,7 @@ bool virtio_legacy_allowed(VirtIODevice *vdev)
>       case VIRTIO_ID_RPROC_SERIAL:
>       case VIRTIO_ID_CAIF:
>           return true;
> +#endif
>       default:
>           return false;
>       }
> @@ -4014,8 +4018,10 @@ static const Property virtio_properties[] = {
>       DEFINE_VIRTIO_COMMON_FEATURES(VirtIODevice, host_features),
>       DEFINE_PROP_BOOL("use-started", VirtIODevice, use_started, true),
>       DEFINE_PROP_BOOL("use-disabled-flag", VirtIODevice, use_disabled_flag, true),
> +#ifdef CONFIG_VIRTIO_LEGACY
>       DEFINE_PROP_BOOL("x-disable-legacy-check", VirtIODevice,
>                        disable_legacy_check, false),
> +#endif
>   };
>   
>   static int virtio_device_start_ioeventfd_impl(VirtIODevice *vdev)
> @@ -4151,7 +4157,9 @@ static void virtio_device_class_init(ObjectClass *klass, const void *data)
>       vdc->start_ioeventfd = virtio_device_start_ioeventfd_impl;
>       vdc->stop_ioeventfd = virtio_device_stop_ioeventfd_impl;
>   
> +#ifdef CONFIG_VIRTIO_LEGACY
>       vdc->legacy_features |= VIRTIO_LEGACY_FEATURES;
> +#endif
>   }
>   
>   bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 5e951675c60..d01fcb9fd1a 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -39,6 +39,7 @@
>   #if !defined(CONFIG_USER_ONLY)
>   #include "hw/loader.h"
>   #include "hw/boards.h"
> +#include CONFIG_DEVICES
>   #ifdef CONFIG_TCG
>   #include "hw/intc/armv7m_nvic.h"
>   #endif /* CONFIG_TCG */
> @@ -1130,6 +1131,7 @@ static void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
>   #endif
>   }
>   
> +#ifdef CONFIG_VIRTIO_LEGACY
>   static bool arm_cpu_virtio_is_big_endian(CPUState *cs)
>   {
>       ARMCPU *cpu = ARM_CPU(cs);
> @@ -1138,6 +1140,7 @@ static bool arm_cpu_virtio_is_big_endian(CPUState *cs)
>       cpu_synchronize_state(cs);
>       return arm_cpu_data_is_big_endian(env);
>   }
> +#endif
>   
>   #ifdef CONFIG_TCG
>   bool arm_cpu_exec_halt(CPUState *cs)
> @@ -2681,7 +2684,9 @@ static const struct SysemuCPUOps arm_sysemu_ops = {
>       .asidx_from_attrs = arm_asidx_from_attrs,
>       .write_elf32_note = arm_cpu_write_elf32_note,
>       .write_elf64_note = arm_cpu_write_elf64_note,
> +#ifdef CONFIG_VIRTIO_LEGACY
>       .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
> +#endif
>       .legacy_vmsd = &vmstate_arm_cpu,
>   };
>   #endif
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index b0973b6df95..4b6c347bda8 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -50,6 +50,7 @@
>   #include "hw/boards.h"
>   #include "hw/intc/intc.h"
>   #include "kvm_ppc.h"
> +#include CONFIG_DEVICES
>   #endif
>   
>   #include "cpu_init.h"
> @@ -7352,12 +7353,14 @@ static void ppc_cpu_reset_hold(Object *obj, ResetType type)
>   
>   #ifndef CONFIG_USER_ONLY
>   
> +#ifdef CONFIG_VIRTIO_LEGACY
>   static bool ppc_cpu_is_big_endian(CPUState *cs)
>   {
>       cpu_synchronize_state(cs);
>   
>       return !FIELD_EX64(cpu_env(cs)->msr, MSR, LE);
>   }
> +#endif
>   
>   static bool ppc_get_irq_stats(InterruptStatsProvider *obj,
>                                 uint64_t **irq_counts, unsigned int *nb_irqs)
> @@ -7470,7 +7473,9 @@ static const struct SysemuCPUOps ppc_sysemu_ops = {
>       .get_phys_page_debug = ppc_cpu_get_phys_page_debug,
>       .write_elf32_note = ppc32_cpu_write_elf32_note,
>       .write_elf64_note = ppc64_cpu_write_elf64_note,
> +#ifdef CONFIG_VIRTIO_LEGACY
>       .virtio_is_big_endian = ppc_cpu_is_big_endian,
> +#endif
>       .legacy_vmsd = &vmstate_ppc_cpu,
>   };
>   #endif
> diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
> index 7648a2d68da..314185f0016 100644
> --- a/hw/virtio/Kconfig
> +++ b/hw/virtio/Kconfig
> @@ -1,6 +1,11 @@
>   config VIRTIO
>       bool
>   
> +config VIRTIO_LEGACY
> +    bool
> +    default y
> +    depends on VIRTIO
> +
>   config VIRTIO_RNG
>       bool
>       default y

If the goal is to condition virtio_legacy, to maybe deprecate it one 
day, then:
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
