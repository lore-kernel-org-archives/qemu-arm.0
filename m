Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1378164ejb;
        Tue, 20 Feb 2024 07:50:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVg7koss6sjVnXayyYFV2aJNwRWXwexpspuryviwl0nPEhcEarqKGFMaqqrzuhQ76374Baq97hJLbP49E5iWr5PcqpKYhqK
X-Received: by 2002:a05:6a21:2d06:b0:19e:cc6e:fcc3 with SMTP id tw6-20020a056a212d0600b0019ecc6efcc3mr16116645pzb.46.1708444206146;
        Tue, 20 Feb 2024 07:50:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708444206; cv=none;
        d=google.com; s=arc-20160816;
        b=ZWpVox1ZUh9j8lSlVc5mEEF890vB3+e0UvamdhWPcwpUPn95uHk/4Ico5qthRhW1YT
         Qk6t06yFPdGbgb0R1Lbb5SBtkDvN6tQUJ+LImCWnd2aj6M7/vDDPGpd6P3cZYfJVx0xn
         fFBrMU0m8/30GSvoVrDy7KNYvlPPv3HzW+bCWednrJWhzY6h0PgKTuhYKxNujRYDaVa+
         ChiWmbhbT0VvKh4H88ecAE8QycldLzJDMGm1ApTM9ilm3zqFGIFsGBNy++FteRDBIy8M
         /R8bLX1I8g9F4fCHUp3XnJtr3ILLLypauNYv6QggTyCBBd+6UVGFajeWZZdVZGiecUAX
         gJEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=awtmUp4GqYdw2gwk9y923Fqr+yt7wdv/rO1gx6b3W9c=;
        fh=M4ob/qCXpnWDtm7CZEZs0D9RX2DQifB2sD8WFyEf+PM=;
        b=z8Sl6+8gyqTEj6RVaFsicbSmdd6gOBuHr4k49x5R80iYXGbqqjYIUQJJ97rkevwBmY
         nE3iKEMKx39UUb8gxFx51Zen5TDYm3k0hSzi2PKI9FftMMpTeAAJnT9S3TTKYFKWgOVS
         xJi0hXubE7zRB0zztx9CF8bG6ayNN6ZWf++sDA0yAOvE1spKGy1Yvn6DXSgbc3Ofl7Wq
         wYSI1IxSPYRTaPK1g85no9bG56XBfYiGd6ODxGob3C3eRtw7u4pDuooKQBWpGQTCVjZV
         CRVE9hnEnKC0M1HimGnWPwRVk7VaYguEa4O20D56O9Rh3YjWuy61nI5O2mVge6dERm6o
         xcgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wl7ZonTh;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h189-20020a6253c6000000b006e02f39ea00sor4203152pfb.6.2024.02.20.07.50.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Feb 2024 07:50:06 -0800 (PST)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wl7ZonTh;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708444205; x=1709049005; darn=linaro.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awtmUp4GqYdw2gwk9y923Fqr+yt7wdv/rO1gx6b3W9c=;
        b=wl7ZonThay0zckKygiHtWSyvDoacf1Tcd+/cFxc0lvI9NgSObUCRja3ZdnoYSduHxL
         HLIKnJ6zIlmP7EZrFtpMWUhDovQoyRN0zfaWEfcI2NHronP0kYzFMj28TO+WgKQ2TQLT
         3XWdIB5qzrG42yk60QwJpnqJLMyidJKQQl4awgjrDUO+TTxaXwug5lakYwLnG+nIFrwl
         +ta22dc79tCZzj6CVgQYMvBim5ng/j5M3ALSv0GwGBjJ41NtnL/SVXPOvi2/3Kp/q728
         eSzT+1ovxciiYXCWyiveJOAGXSnX9XMxD/nEmPyoHvOLBWdWGPgqubnamRsxh+0gK3U8
         Enzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708444205; x=1709049005;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=awtmUp4GqYdw2gwk9y923Fqr+yt7wdv/rO1gx6b3W9c=;
        b=drR/OU1Y0PRs6MYvm6Fyy6yBmP1yACCqRrG7JCXVw95BF51UgXKG5dYB4SCKxCmWHe
         ynUbMtIe5h7UeaqWwqdlhwEUmL/AUkN0jk8O4uk+lML98HJbzphzGivapfR9PnVRdCkT
         BbrijcyTgO//Am91dTPsU9Uy35sXdD5XvLmkIHL5D+BkHUJRd3KoiQFbWitciwiuA2dV
         eKyW+5ACMwooT9sCLTMiJmVorp3TgV80r6RIx2klyz7Ka8FBHA2dChqASoOGIlf+7Goy
         LNm3bEdlv/FvvU3JORx178Wsy3isDhr6+p2GVe5qbMO8t5DpQmlHGD5f/Xe8fpd3Uf8Y
         yBWg==
X-Forwarded-Encrypted: i=1; AJvYcCUYM4mwx4YeWZjbL7e/+0G3mCQyavNdekUS98+63kzvi+hXzq2Ih4CdbqLhNREHoHLwkbrnXNnuSYrgPJFrE7VKqA2gVKXw
X-Gm-Message-State: AOJu0YyCPaf9CyE9jJlkuviKvvPzfZqorVVAZv+KsZJXF8raXwaWfDWd
	r+WrXXTa9t9qDjs6E45FhzunIVgHTLgeXs+z0vtIYLCYrtj4rLZIXLG3nbsaRP9MdQ==
X-Google-Smtp-Source: AGHT+IEjbkyz3MN53LNesbTcwSXP8/S3BOlbOMHSbZ51MTR13gntG7C4cZWl41W5tiT4MAcKl6p+7w==
X-Received: by 2002:a05:6a00:1911:b0:6e0:708c:165a with SMTP id y17-20020a056a00191100b006e0708c165amr17465604pfi.5.1708444205374;
        Tue, 20 Feb 2024 07:50:05 -0800 (PST)
Return-Path: <gustavo.romero@linaro.org>
Received: from ?IPv6:2804:7f0:b400:1b59:1a6a:7944:fbd6:3f71? ([2804:7f0:b400:1b59:1a6a:7944:fbd6:3f71])
        by smtp.gmail.com with ESMTPSA id l5-20020a62be05000000b006e091a254adsm6991839pff.30.2024.02.20.07.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 07:50:05 -0800 (PST)
Subject: Re: [PATCH v2 2/6] hw/misc/ivshmem-flat: Allow device to wire itself
 on sysbus
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Kochkov
 <anton.kochkov@proton.me>, richard.henderson@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240216144456.34992-1-philmd@linaro.org>
 <20240216144456.34992-3-philmd@linaro.org>
From: Gustavo Romero <gustavo.romero@linaro.org>
Message-ID: <c68e86e2-32d5-7351-2aff-c6ef314a0936@linaro.org>
Date: Tue, 20 Feb 2024 12:50:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20240216144456.34992-3-philmd@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: hJ4bJS1K0mEP



On 2/16/24 11:44 AM, Philippe Mathieu-Daudé wrote:
> From: Gustavo Romero <gustavo.romero@linaro.org>
> 
> The following is an example on how to create the ivshmem-flat device on
> a Stellaris machine:
> 
> $ qemu-system-arm -cpu cortex-m3 -machine lm3s6965evb -nographic
>                    -net none -chardev stdio,id=con,mux=on
>                    -serial chardev:con -mon chardev=con,mode=readline
>                    -chardev socket,path=/tmp/ivshmem_socket,id=ivf
>                    -device ivshmem-flat,x-irq-qompath=/machine/unattached/device[1]/nvic/unnamed-gpio-in[0],x-bus-qompath="/sysbus",chardev=ivf
>                    -kernel zephyr_qemu.elf

We need to tweak this example, since prop 'x-bus-qompath' doesn't
exist anymore. Also, the 'x-irq-qompath' for Stellaris machines looks
better now, i.e.:

x-irq-qompath='/machine/soc/v7m/nvic/unnamed-gpio-in[0]'


> 
> The IRQ QOM path for the target machine can be determined by creating
> the VM without the ivshmem-flat device, going to the QEMU console and
> listing the QOM nodes with 'info qom-tree'. In the Stellaris example
> above the input IRQ is in the NVIC IC.
> 
> The MMRs for status and control (notification) are mapped to the MMIO
> region at 0x400FF000 (default), whilst the shared memory region start
> is mapped at addr. 0x40100000 (default), but both addresses can be set
> when creating the device by using 'x-bus-address-{mmr,shmem}' options,
> respectively.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Message-ID: <20231127052024.435743-2-gustavo.romero@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   docs/system/devices/ivshmem-flat.rst | 56 +++++++++++++++++++++++++
>   include/hw/misc/ivshmem-flat.h       |  9 ++++
>   hw/core/sysbus-fdt.c                 |  2 +
>   hw/misc/ivshmem-flat.c               | 63 ++++++++++++++++++++++++++--
>   4 files changed, 127 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/system/devices/ivshmem-flat.rst b/docs/system/devices/ivshmem-flat.rst
> index 1f97052804..a10446a18f 100644
> --- a/docs/system/devices/ivshmem-flat.rst
> +++ b/docs/system/devices/ivshmem-flat.rst
> @@ -31,3 +31,59 @@ the IRQ mechanism is disabled). The shared memory region is always present.
>   The MMRs (INTRMASK, INTRSTATUS, IVPOSITION, and DOORBELL registers) offsets at
>   the MMR region, and their functions, follow the ivshmem spec, so they work
>   exactly as in the ivshmem PCI device (see ./specs/ivshmem-spec.txt).
> +
> +
> +Device Options
> +--------------
> +
> +The only required options to create an ivshmem-flat device are: (a) the UNIX
> +socket where the ivshmem server is listening, usually ``/tmp/ivshmem_socket``;
> +and (b) the bus type to be used by the device, which currently only supports
> +"/sysbus" bus type.
> +
> +Example:
> +
> +.. parsed-literal::
> +
> +    |qemu-system-arm| -chardev socket,path=/tmp/ivshmem_socket,id=ivshmem_flat -device ivshmem-flat,x-bus-qompath="/sysbus",chardev=ivshmem_flat
> +
> +The other options are for fine tuning the device.
> +
> +``x-irq-qompath``. Used to inform the device which IRQ input line it can attach
> +to enable the notification mechanism (IRQ). The ivshmem-flat device currently
> +only supports notification via vector 0, ignoring other vectors.
> +
> +Two examples for different machines follow.
> +
> +Stellaris machine (``- machine lm3s6965evb``):
> +
> +::
> +
> +    x-irq-qompath=/machine/unattached/device[1]/nvic/unnamed-gpio-in[0]
> +
> +Arm mps2-an385 machine (``-machine mps2-an385``):
> +
> +::
> +
> +    x-irq-qompath=/machine/armv7m/nvic/unnamed-gpio-in[0]
> +
> +The available IRQ input lines on a given VM that the ivshmem-flat device can be
> +attached to can be inspected from the QEMU monitor (Ctrl-a + c) with:
> +
> +(qemu) info qom-tree
> +
> +``x-bus-address-mmr``. Allows changing the address where the MMRs are mapped
> +into the VM memory layout. Default is 0x400FF000, but this address might be
> +already taken on some VMs, hence it's  necessary to adjust the MMR location on
> +some VMs.
> +
> + ``x-bus-address-shmem``. Allows changing the address where the shared memory
> +region is mapped into the VM memory layout. Default is 0x40100000, but this
> +address might be already taken on some VMs, hence it's necessary to adjust the
> +shared memory location.
> +
> +``shmem-size``. Allows changing the size (in bytes) of shared memroy region.
> +Default is 4 MiB, which is the same default value used by the ivshmem server, so
> +usually it's not necessary to change it. The  size must match the size of the
> +shared memory reserverd and informed by the ivshmem server, otherwise device
> +creation fails.
> diff --git a/include/hw/misc/ivshmem-flat.h b/include/hw/misc/ivshmem-flat.h
> index 97ca0ddce6..d5b6d99ae4 100644
> --- a/include/hw/misc/ivshmem-flat.h
> +++ b/include/hw/misc/ivshmem-flat.h
> @@ -25,6 +25,12 @@
>    *    socket
>    *  + QOM property "shmem-size" sets the size of the RAM region shared between
>    *    the device and the ivshmem server
> + *  + QOM property "x-bus-address-iomem" is the base address of the I/O region
> + *    on the main system bus
> + *  + QOM property "x-bus-address-shmem" is the base address of the shared RAM
> + *    region on the main system bus
> + *  + QOM property "x-irq-qompath" is the QOM path of the interrupt being
> + *    notified
>    *  + sysbus MMIO region 0: device I/O mapped registers
>    *  + sysbus MMIO region 1: shared memory with ivshmem server
>    *  + sysbus IRQ 0: single output interrupt
> @@ -68,9 +74,11 @@ struct IvshmemFTState {
>   
>       /* IRQ */
>       qemu_irq irq;
> +    char *x_sysbus_irq_qompath;
>   
>       /* I/O registers */
>       MemoryRegion iomem;
> +    uint64_t x_sysbus_mmio_addr;
>       uint32_t intmask;
>       uint32_t intstatus;
>       uint32_t ivposition;
> @@ -80,6 +88,7 @@ struct IvshmemFTState {
>       MemoryRegion shmem;
>       int shmem_fd;
>       uint32_t shmem_size;
> +    uint64_t x_sysbus_shmem_addr;
>   };
>   
>   #endif /* IVSHMEM_FLAT_H */
> diff --git a/hw/core/sysbus-fdt.c b/hw/core/sysbus-fdt.c
> index eebcd28f9a..40d7356cae 100644
> --- a/hw/core/sysbus-fdt.c
> +++ b/hw/core/sysbus-fdt.c
> @@ -31,6 +31,7 @@
>   #include "qemu/error-report.h"
>   #include "sysemu/device_tree.h"
>   #include "sysemu/tpm.h"
> +#include "hw/misc/ivshmem-flat.h"
>   #include "hw/platform-bus.h"
>   #include "hw/vfio/vfio-platform.h"
>   #include "hw/vfio/vfio-calxeda-xgmac.h"
> @@ -495,6 +496,7 @@ static const BindingEntry bindings[] = {
>       TYPE_BINDING(TYPE_TPM_TIS_SYSBUS, add_tpm_tis_fdt_node),
>   #endif
>       TYPE_BINDING(TYPE_RAMFB_DEVICE, no_fdt_node),
> +    TYPE_BINDING(TYPE_IVSHMEM_FLAT, no_fdt_node),
>       TYPE_BINDING("", NULL), /* last element */
>   };
>   
> diff --git a/hw/misc/ivshmem-flat.c b/hw/misc/ivshmem-flat.c
> index 998c78a5ee..433a47c8d3 100644
> --- a/hw/misc/ivshmem-flat.c
> +++ b/hw/misc/ivshmem-flat.c
> @@ -421,16 +421,75 @@ static bool ivshmem_flat_connect_server(DeviceState *dev, Error **errp)
>       return true;
>   }
>   
> +static bool ivshmem_flat_sysbus_wire(DeviceState *dev, Error **errp)
> +{
> +    IvshmemFTState *s = IVSHMEM_FLAT(dev);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +
> +    if (s->x_sysbus_mmio_addr != UINT64_MAX) {
> +        trace_ivshmem_flat_mmio_map(s->x_sysbus_mmio_addr);
> +        sysbus_mmio_map(sbd, 0, s->x_sysbus_mmio_addr);
> +    }
> +    if (s->x_sysbus_shmem_addr != UINT64_MAX) {
> +        trace_ivshmem_flat_shmem_map(s->x_sysbus_shmem_addr);
> +        sysbus_mmio_map(sbd, 1, s->x_sysbus_shmem_addr);
> +    }

If we can't map the MMRs or the shmem, then I think we should
not create the device. I understand these two resources are
the base requirements for this device. Are you ok with that?


> +
> +    /* Check for input IRQ line, if it's provided, connect it. */
> +    if (s->x_sysbus_irq_qompath) {
> +        Object *oirq;
> +        bool ambiguous = false;
> +        qemu_irq irq;
> +
> +        oirq = object_resolve_path_type(s->x_sysbus_irq_qompath, TYPE_IRQ,
> +                                        &ambiguous);
> +        if (ambiguous) {
> +            error_setg(errp, "Specified IRQ is ambiguous. Can't create"
> +                             " ivshmem-flat device.");
> +            return false;
> +        }
> +
> +        if (!oirq) {
> +            error_setg(errp, "Can't resolve IRQ QOM path.");
> +            return false;
> +        }
> +        irq = (qemu_irq)oirq;
> +        trace_ivshmem_flat_irq_resolved(s->x_sysbus_irq_qompath);
> +
> +        /*
> +         * Connect device out irq line to interrupt controller input irq line.
> +         */
> +        sysbus_connect_irq(sbd, 0, irq);
> +    } else {
> +       /*
> +        * If input IRQ is not provided, warn user the device won't be able
> +        * to trigger any interrupts.
> +        */
> +        warn_report("Input IRQ not specified, device won't be able"
> +                    " to handle IRQs!");
> +    }
> +
> +    return true;
> +}
> +
>   static void ivshmem_flat_realize(DeviceState *dev, Error **errp)
>   {
>       if (!ivshmem_flat_connect_server(dev, errp)) {
>           return;
>       }
> +    if (!ivshmem_flat_sysbus_wire(dev, errp)) {
> +        return;
> +    }
>   }
>   
>   static Property ivshmem_flat_props[] = {
>       DEFINE_PROP_CHR("chardev", IvshmemFTState, server_chr),
>       DEFINE_PROP_UINT32("shmem-size", IvshmemFTState, shmem_size, 4 * MiB),
> +    DEFINE_PROP_STRING("x-irq-qompath", IvshmemFTState, x_sysbus_irq_qompath),
> +    DEFINE_PROP_UINT64("x-bus-address-iomem", IvshmemFTState,
> +                       x_sysbus_mmio_addr, UINT64_MAX),
> +    DEFINE_PROP_UINT64("x-bus-address-shmem", IvshmemFTState,
> +                       x_sysbus_shmem_addr, UINT64_MAX),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> @@ -439,13 +498,11 @@ static void ivshmem_flat_class_init(ObjectClass *klass, void *data)
>       DeviceClass *dc = DEVICE_CLASS(klass);
>   
>       dc->hotpluggable = true;
> +    dc->user_creatable = true;
>       dc->realize = ivshmem_flat_realize;
>   
>       set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>       device_class_set_props(dc, ivshmem_flat_props);
> -
> -    /* Reason: Must be wired up in code (sysbus MRs and IRQ) */
> -    dc->user_creatable = false;
>   }
>   
>   static const TypeInfo ivshmem_flat_info = {
> 
