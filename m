Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp3733494njc;
        Sun, 25 May 2025 08:34:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVFiagxxbk6l0bkWKVBItSin1gIhdrNkAlO/U+xnP8Ezq6wOA5P/lnxk9H0gOkuqoVqe1KGv4dc7+Cg+Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHTgUWOYQOUQ++uerA56vqZlf4lRz+uwt2Hx6HYi9oFu4tG1lpzXwrPcjUVkfc38xxPnT7d
X-Received: by 2002:a05:6602:3684:b0:86a:2373:aa3d with SMTP id ca18e2360f4ac-86cbb7b791amr655912539f.3.1748187295186;
        Sun, 25 May 2025 08:34:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748187295; cv=none;
        d=google.com; s=arc-20240605;
        b=ZyLmovK0gpgsjMVlCPhXQMd6lolBmEyYS3fs7oTotVk7twt85qst+AfUTcLW/aP0aN
         cUOhk3Tsmuj3NsLQ1WWfO3hTYA3oJ4/qFUTVIu2cuUF8ltMv0GLF7AKKpkY9jyGMiMI6
         y2INoYBQKeUTa3A8A79ekS/6UXxGxsjrp9d167YfgGtzTrkQArQJl+AZl4X1436TtlPV
         1+9yoDdx0IVROy7FQ/BLQsSVRbGNxC2yzhrabK+zE5VvGcitSkrBsYQcjJgyi9ZrIf+i
         xbVZk10fTVRZG3YDnbZvt+eA7ERxSSRQmqzCS0D7Y+D8PMwkLvC+n28PwN5sQhlYESVV
         dXpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=nFrHVZJc/szkYeHSnu+6TOGCF3V52dhST6WvOMUXBB4=;
        fh=Cb3Rma3weQZL3goJBsqJ5+XMYqDZn30HwYrOWQsje48=;
        b=LurcrQYm7SdSjC2CKYn7z9rk3gIqg/nuklwBu6ZH2XiYy5LZ8KR642EaLMjmWmIZXk
         8nDJFnVLgIYNUiFe5CCCbJflylRrWF0Ms87m3of2MSfcmFg056/oWxW+WcrSMM3bXO8c
         mGcvHPDzwGimfSao4eyMVYzekhFxJEgI23FIAtOShb6DTI6wXpH2fy6mD86bbHXB2bSY
         lwoMlyoLULed1VO+I8kQ7YX1XDiI5NzMb29tUa9HJ1fjGKSGRXs7xz00rIz2IfMzKNIg
         XGjqKFnfHCViPyQpE7R2jhOqInYkRkgJvXuIKYktR+zQQGvhpaEFLJMDqPpV4e30jxzr
         FH/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RKX8FhdM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ca18e2360f4ac-86a236f950fsi1684526539f.92.2025.05.25.08.34.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 May 2025 08:34:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RKX8FhdM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uJDN6-0004ej-Bn; Sun, 25 May 2025 11:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uJDN1-0004dv-VC
 for qemu-arm@nongnu.org; Sun, 25 May 2025 11:34:40 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uJDN0-0000AL-1c
 for qemu-arm@nongnu.org; Sun, 25 May 2025 11:34:39 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-441d437cfaaso8404895e9.1
 for <qemu-arm@nongnu.org>; Sun, 25 May 2025 08:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748187276; x=1748792076; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nFrHVZJc/szkYeHSnu+6TOGCF3V52dhST6WvOMUXBB4=;
 b=RKX8FhdMFjydjcWlVescIak+qUJuAoQ+vhGPLZqiefJbh5kofSRacsXWGJZWBKFEiX
 LyPzxYjvKLjgTt3MIYhUcneyZsqEcTsvn10zqc3HUt16bNb587xmUct6SrYoJPr82bAI
 9kBrkjKKZdanyPLooPwo+rAQgNMS65zl1byoOJ8gQ8hC34HQ8/Wwl94YC3NjHyoFEPs0
 egQv+wmdNBUStEdRaqAgr20n0jBo3GHNxAKT9moUV8tUGndiuUETmQ3sIJqC6Nn77z+X
 vihF+sUnoZtDZf8CjXMXLvgf3o1XlYAWDUL51MG+jUwJuPaWQ4wy1mdZ/8clu+KtY3Xi
 Hymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748187276; x=1748792076;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nFrHVZJc/szkYeHSnu+6TOGCF3V52dhST6WvOMUXBB4=;
 b=lxNolw3H/nOW9wk2xZ7W9YHBj8qgvkSh6MdElKxkdjqWrhOWeeqlnTMnPKbS1v+3Cw
 lD3N7zR80xhHSh6VvIBwkZRI+2vTRzm7TqSEZpmniHWvWnwba8rhb/yO6l6tMdN3LAdo
 WZTlWwuV+qe2PMnjKkLUB0lhSqNy2zU/VoxKnRKqIZE9uLdZP8HccauFRE+p687HniwT
 YT8RN4omNYJpXBqavNHNtZWveZnY3IpAqIyxE4lQN49z2ma2FMo+FhW2eOWdea9SApDm
 E1nZ8D6UxUyx/Nhl8DdxO9n2rBFY90+fRcm4hlmXJv1NK4dtqb1e21OSOWl5dZXIRnp7
 8ntQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWihxI1U+4jxzAVTScwE9l/JYExew6SeImg6POckJmnPvjR/chz+IU6187tUrcGRk4yqdnlufEnkg==@nongnu.org
X-Gm-Message-State: AOJu0YwW/4k/FVCCyeD2IXBwDvN5Tybv285jiG1XDcFvp4oS1TTHU92/
 hQngL1hfzLKIGVPMbTi6xY9eKWKclxFw6Hwz8wwDPUkH0eG2nP47fsEkpXJMimy1eXqvccURtB6
 Eg9ga
X-Gm-Gg: ASbGncvI9ODyUI00cGRZx+jKJFIe+5FlKTJh/mhpY7NK7KHEy4SXwdka1L/bxSsiUcX
 RwMbIgJMGqU6gWrJ+cmT9m+7kWdDYWP7QojD/PEOwRbYCk6x4id8G3dEpYLjzvCjTi58UpS8EMu
 sl2w8DUPBJ9xo7lFGIIKU1pacTaIltXmcESACZF4+27J1qNyR1Yt3d2yw/9a88X3Y03Re7Jat9I
 xQ/TnmoOA0Vumjs93a7eVFGGychupLcy/+hwIM+da3f3g/RmqcTeWiranVeq+4rNbAZqPdHg8aH
 yl39pTMHf8yGRsI742c8k7sIaI6xNr0luQqTDFWFvFSqxTaUvrPlE3sDZ0I8Ew3xwH+3HnK5R60
 Bdib50rYYdYVlKFiJUPk/kTV/r/I=
X-Received: by 2002:a05:600c:1d84:b0:43c:eea9:f45d with SMTP id
 5b1f17b1804b1-44c939c11bdmr58760895e9.18.1748187276289; 
 Sun, 25 May 2025 08:34:36 -0700 (PDT)
Received: from [10.132.0.213] (17.red-95-127-33.staticip.rima-tde.net.
 [95.127.33.17]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f23bfe80sm207012625e9.20.2025.05.25.08.34.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 May 2025 08:34:35 -0700 (PDT)
Message-ID: <f73674b2-74b2-4140-9d3b-5037ad25baf6@linaro.org>
Date: Sun, 25 May 2025 17:34:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/22] hw/acpi/ged: Prepare the device to react to PCI
 hotplug events
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com
References: <20250514170431.2786231-1-eric.auger@redhat.com>
 <20250514170431.2786231-17-eric.auger@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250514170431.2786231-17-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nEuZMRRzu01F

Hi Eric,

On 14/5/25 18:01, Eric Auger wrote:
> QEMU will notify the OS about PCI hotplug/hotunplug events through
> GED interrupts. Let the GED device handle a new PCI hotplug event.
> On its occurrence it calls the \\_SB.PCI0.PCNT method with the BLCK
> mutex held.
> 
> The GED device uses a dedicated MMIO region that will be mapped
> by the machine code.
> 
> At this point the GED still does not support PCI device hotplug in
> its TYPE_HOTPLUG_HANDLER implementation. This will come in a
> subsequent patch.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   include/hw/acpi/generic_event_device.h |  5 +++++
>   include/hw/acpi/pcihp.h                |  2 ++
>   hw/acpi/generic_event_device.c         | 15 +++++++++++++++
>   hw/acpi/pcihp.c                        |  1 -
>   4 files changed, 22 insertions(+), 1 deletion(-)


> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> index bc31dbff39..bda5ea24b5 100644
> --- a/include/hw/acpi/pcihp.h
> +++ b/include/hw/acpi/pcihp.h
> @@ -38,6 +38,8 @@
>   #define ACPI_PCIHP_SEJ_BASE 0x8
>   #define ACPI_PCIHP_BNMR_BASE 0x10
>   
> +#define ACPI_PCIHP_SIZE 0x0018
> +
>   typedef struct AcpiPciHpPciStatus {
>       uint32_t up;
>       uint32_t down;
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 7a62f8d5bc..dc3620553d 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -12,6 +12,7 @@
>   #include "qemu/osdep.h"
>   #include "qapi/error.h"
>   #include "hw/acpi/acpi.h"
> +#include "hw/acpi/pcihp.h"
>   #include "hw/acpi/generic_event_device.h"
>   #include "hw/irq.h"
>   #include "hw/mem/pc-dimm.h"
> @@ -26,6 +27,7 @@ static const uint32_t ged_supported_events[] = {
>       ACPI_GED_PWR_DOWN_EVT,
>       ACPI_GED_NVDIMM_HOTPLUG_EVT,
>       ACPI_GED_CPU_HOTPLUG_EVT,
> +    ACPI_GED_PCI_HOTPLUG_EVT,
>   };
>   
>   /*
> @@ -121,6 +123,12 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
>                              aml_notify(aml_name("\\_SB.NVDR"),
>                                         aml_int(0x80)));
>                   break;
> +            case ACPI_GED_PCI_HOTPLUG_EVT:
> +                aml_append(if_ctx,
> +                           aml_acquire(aml_name("\\_SB.PCI0.BLCK"), 0xFFFF));
> +                aml_append(if_ctx, aml_call0("\\_SB.PCI0.PCNT"));
> +                aml_append(if_ctx, aml_release(aml_name("\\_SB.PCI0.BLCK")));
> +                break;
>               default:
>                   /*
>                    * Please make sure all the events in ged_supported_events[]
> @@ -299,6 +307,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>           sel = ACPI_GED_NVDIMM_HOTPLUG_EVT;
>       } else if (ev & ACPI_CPU_HOTPLUG_STATUS) {
>           sel = ACPI_GED_CPU_HOTPLUG_EVT;
> +    } else if (ev & ACPI_PCI_HOTPLUG_STATUS) {
> +        sel = ACPI_GED_PCI_HOTPLUG_EVT;
>       } else {
>           /* Unknown event. Return without generating interrupt. */
>           warn_report("GED: Unsupported event %d. No irq injected", ev);
> @@ -428,6 +438,11 @@ static void acpi_ged_realize(DeviceState *dev, Error **errp)
>               cpu_hotplug_hw_init(&s->container_cpuhp, OBJECT(dev),
>                                   &s->cpuhp_state, 0);
>               break;
> +        case ACPI_GED_PCI_HOTPLUG_EVT:
> +            memory_region_init(&s->container_pcihp, OBJECT(dev),
> +                                "pcihp container",

Since "pcihp container" isn't just a description anymore, can
we have a ACPI_PCIHP_REGION_NAME definition?

> +                                ACPI_PCIHP_SIZE);
> +            sysbus_init_mmio(sbd, &s->container_pcihp);
>           }
>           ged_events--;
>       }
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 57fe8938b1..e87846a1fa 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -44,7 +44,6 @@
>   #include "qobject/qnum.h"
>   #include "trace.h"
>   
> -#define ACPI_PCIHP_SIZE 0x0018
>   #define PCI_UP_BASE 0x0000
>   #define PCI_DOWN_BASE 0x0004
>   #define PCI_EJ_BASE 0x0008

