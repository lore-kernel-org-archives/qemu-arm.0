Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1385887ejb;
        Tue, 20 Feb 2024 08:02:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVNeQe+9ALh0IK55jvje8+T2/t55v3hjklIsD3PUid2sFj+dOd1tDkbNIdHdB51LOfp0VT4KShw1ERb5vJPdo8dlozfMgK2
X-Received: by 2002:a05:6a00:1d01:b0:6e4:69f3:f7eb with SMTP id a1-20020a056a001d0100b006e469f3f7ebmr4240959pfx.25.1708444966478;
        Tue, 20 Feb 2024 08:02:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708444966; cv=none;
        d=google.com; s=arc-20160816;
        b=dnHSZnGVXwwqknNzuZ5RRRcFAzBztvQPmYeStpvwtz2f86OvwVR0bdSeyOXVlDzP/O
         qWZFOUSL89xUSa2GKuaPfC686iuKzU2TEKNjR5GXtlHocuO0zrRa6+80WYtyztQeXKby
         1D9ye6ezM4pdpQmeBbPYdNNzHA3uF6BV+B4xDHDqMOV3lo0Vb2mNgi9CMj9GFzLas1bf
         L/kAi0uK+BbbAx6hOw9qXaiyrPtUH3u7wveA0Uady4b0dJP68fhKhganuMKgtzQKne6Q
         KiMVHjs9yhX+s28zCicNIjK/zw5HfFrgufA8Ke901GgHjUk6Z7UeFRYxKQzrXGBwX+IK
         0Hrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=6ydl/S6u/9OOgEpSmetY2JCK7UwKLm1TyTlvWnqCN2E=;
        fh=vFOEblM6/e1vEw/gpArR7BR08hG7+tpEG/Am08EGPqA=;
        b=r3MX7u0UnQmcx2Wi5obrmRglqVU2yMkktZfmFGnxNzlINKF5fsn14VB2kfyq1T7bKk
         3PW+kyO9euFFShKahgWduOrATDLI1vXyiH1wEslsFe2t/bfbbRMvke7y6YbHqCsgiR1o
         4IGqMnGQU0YFpcYI0tNItXWu0rd20YulFtipf+g6nGm44HwOqEBO3Gj7D3yA9XhlFlYC
         SDfOl/+iOgNjJvvn/YsnN6wWChkOZ1PqR25N/dj+5t8Sds1fSuI51mKM85G3PoaQMare
         XU4ywrmIGJUkEqRMDxGT6BP0rtYR6z8u9IZqiWxz9UV+ALFxCkGvnK2xaszryT6ddPAU
         9W/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AXSzUXYa;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e3-20020a056a0000c300b006e36af4a651sor2189745pfj.8.2024.02.20.08.02.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Feb 2024 08:02:46 -0800 (PST)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AXSzUXYa;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708444966; x=1709049766; darn=linaro.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ydl/S6u/9OOgEpSmetY2JCK7UwKLm1TyTlvWnqCN2E=;
        b=AXSzUXYaIVG3BeXwmzNKtIS1YIa5Yg3IrPbgKf0XplMoAz6lzKXA9XQEBWOsdZAP7k
         DP8V/3zoh4w8qH0fJ9l15lChj3+OKfNFBjy7Ufn+pWPZbAE2jVrth52QHi+Sf/5Cs7dr
         9Gg0SMg3CtkoRzkLggFw6srxwn9IzRfk/kD4SHBlZgTgM2hR2Lmsc+I8ew8Cc+USvcf3
         eOGutQIKB8Prw3WBButHACyERTiwjOXHVKwkcRd91vlJ7wtTxLuQ+n/5tj8n0bUrEZZ0
         sF65zrhOXamFnN0DDD5m2EM+hMtA8qR/+mBioObTSFAWWtT3SSc1r9mkSRCBnBJz7xtQ
         V+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708444966; x=1709049766;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ydl/S6u/9OOgEpSmetY2JCK7UwKLm1TyTlvWnqCN2E=;
        b=qlRlnVbZd3eSpFZ5suPHAS+0y7rv843WpQvDEQAUdjS/ztFGicOWijobGrxuUl6Kgg
         D7vxNh2wkUA+n+MzXh34pO5Rfy29Hdpg9jc6B9s6aqWW2T1u7c4krunCxw5fqQbkbPFq
         Qjj2QKl6CzMPLNEt/JUEvwtp4NApoJK8icbDCBR+t9Hm0y2gh+I0tAbdTaEhJkTnYKEu
         mnQWe2SaNCNv5ZXvPsij3MERDg1bGVAWfwmQBsL89YTigkn8/laSmI3XgSbmCucse/tF
         sSIzkmgWalHESLF3+su68XzLUAp/UNZK9bKxNNXQcap1EmhXrt+Vie1gCGCRQPSvRkUC
         +sKA==
X-Forwarded-Encrypted: i=1; AJvYcCWxCdKfkPprw+9GAqnPHggdQxdkWmD2zN59FlCw0GenViSr0S6HDuhXtCiGvyZ25GCLs1qLlra/S5AFGntXDRZ0x/ZMQ0a9
X-Gm-Message-State: AOJu0YxKM8mOuXPI/HoZtf8MUZLhIwNUuEDTRF7ekrSzriQQHy0Rsfzk
	9voe5dsPd5CjVc3jf0RgmaHerrrEbX4jopguBY8wAeFFCc2x7nMofY18seVeBTrCPw==
X-Google-Smtp-Source: AGHT+IEyErO/NpglJns6VC9ddup/MrqmSaIxMwDgnj5X/6lCRzT9OV34D4SXiLedgNdh+nFFOq25Ew==
X-Received: by 2002:a05:6a00:291b:b0:6e4:76cf:190c with SMTP id cg27-20020a056a00291b00b006e476cf190cmr3355185pfb.11.1708444965897;
        Tue, 20 Feb 2024 08:02:45 -0800 (PST)
Return-Path: <gustavo.romero@linaro.org>
Received: from ?IPv6:2804:7f0:b400:1b59:1a6a:7944:fbd6:3f71? ([2804:7f0:b400:1b59:1a6a:7944:fbd6:3f71])
        by smtp.gmail.com with ESMTPSA id k19-20020aa788d3000000b006e464b8aa38sm3999518pff.168.2024.02.20.08.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 08:02:45 -0800 (PST)
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
Message-ID: <b03a659f-fef6-bb4e-b258-3e5a82b7edb4@linaro.org>
Date: Tue, 20 Feb 2024 13:02:41 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20240216144456.34992-3-philmd@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: tfsyMN3LKLoH



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

The doc need to be tweak now as well.


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
