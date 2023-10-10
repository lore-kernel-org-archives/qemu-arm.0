Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp313970ejb;
        Tue, 10 Oct 2023 01:18:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqhymSo99saPNlNn3A7NAfcKLSTZkjMLWNH/YutVaAQ7j6eljgNOQatFezNYdsJJkHVGsk
X-Received: by 2002:ac2:4da7:0:b0:505:7113:1d0f with SMTP id h7-20020ac24da7000000b0050571131d0fmr13130650lfe.13.1696925907586;
        Tue, 10 Oct 2023 01:18:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696925907; cv=none;
        d=google.com; s=arc-20160816;
        b=K+ZQ2+fkMZeHWAm8oxPddjrXY+XNrlaQLp6UOx4zyaVPjzIiKv8QD+pfp3d2eTjnK2
         ZxQad4UA93dMUGYNMeWkHTZZyXMMjYbT5ycB3cwIchH5zo121Uny7gPAZCYzN21Mx7fh
         6tGS4w6PJuws/O3PTRFmhd74vGnXdrIWMhI+k2wTM7V469qYhjMEuGv5L26qdk2fWux1
         eJE+tNXvv6HJ/5BNoCndxPezBCjOASHYwYIc/eA0WHNDEZ9zPCh9BT32FS4ml0x+hzZ4
         ZOAcHMNXoo1HznHmRV2ICvkmQqqgIYWqbiNN3VaiZeHF93OLjtMH8GtQnu6TW0eRs3Ut
         fpMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=OJ0U48nKeGwZvQdg8MpDAQSXjQBTOf1gUWygXvNgjcI=;
        fh=HQu76LFN0DbKXHr60vGnzTmi359RrU+EPC8eBDHkPTc=;
        b=SYD/j5tvibcAF+3wSgazDmnDctSBDcXbgMns/mj3Kg6raffj4H7GoobCzvVAU/FQKj
         K1Gsp3PUWX0haBQGiiNPB0G8lsURDbOqhdsT45Mu9dQ13E5nN92Iou34pHXgtdottssp
         H2kdbdjKMrSSKQaCCuA9A1mxmwtfeQRlL6lZltO9sx1HOSveumvZZE41bdccnwyyfids
         jdU5fUbddw8afwdS57L68YYczfhCymm5hG5rh65y/wROGEDO4kZnyTSUuCACkzW9VEe/
         Ce3YXIYZ/NMwbAozqQ3J6vkD+XKDtexgPCbFi/y0yMIeGDW0oGFG3083aJxae0w1O2Y/
         74JA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="dgy/BlHd";
       spf=pass (google.com: domain of shahuang@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=shahuang@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <shahuang@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id v21-20020ac25935000000b005030b409242si7068873lfi.287.2023.10.10.01.18.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 01:18:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of shahuang@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="dgy/BlHd";
       spf=pass (google.com: domain of shahuang@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=shahuang@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696925906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OJ0U48nKeGwZvQdg8MpDAQSXjQBTOf1gUWygXvNgjcI=;
	b=dgy/BlHdNOlQG0KlUFm1ioNHA7ifJkF+yFQ06OTJarZPFJKXuDgyd6FY0UtgnswgCP7Qxl
	FcJWLvCCSmaoN4YOC/Xg0oIsQ4ymBODLKQRpNJzFekUT4YH72Dmad4nW/oyPaG97lQRo2h
	j1eGf9fVIVgKmsoBhJGwfrJotqHFt/Y=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-gvMVVMB3PAWy1iM_85l-YQ-1; Tue, 10 Oct 2023 04:18:24 -0400
X-MC-Unique: gvMVVMB3PAWy1iM_85l-YQ-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-6927a8c64ceso1479962b3a.0
        for <alex.bennee@linaro.org>; Tue, 10 Oct 2023 01:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696925904; x=1697530704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OJ0U48nKeGwZvQdg8MpDAQSXjQBTOf1gUWygXvNgjcI=;
        b=jUV8FOFvXlaaimUuZsB2QqhD+iPVfRgBrBboVKELa4GOSEHwliCjRe+zHv7pkHL+j6
         iciZpMxlw4pl57L5uIsFjjQqJiVoczoClsOpTB43htPVEWgmPdqUk4tPzq1NY7H4xhmE
         AkEFpYkcZMvvQ20zfNJRw7IlgNpFH6/hT5bWb33k1pgPZwEQRMsxnBoKDGCJjoiX1q5T
         BqeXwOOvt2lHwFbq1SEMI3tB0m7pq7eDom9lcB8mKFEd09axRNrBkGaFmv5pXerAXXOO
         Za1s24WxtlCghLZ9HfkS1n3Ls+NUY6IVn0Bi1VcB7KikpEHd1Y/oke0fNHOpwk3vz5Sz
         /ewQ==
X-Gm-Message-State: AOJu0Yw542C/HI+39UXP5P607Zq0HI1wuPfAFpPoQlQXZgaoGAsY5tgq
	0y8lS/k1YvwXXq2z8IkrTyWdnLhQnT8yiMGU2NWrZQZq9DpA+nVT6luGpKqZzeHb+ZcvLDOFm9n
	Y4h+56tk2CX/Tpj6j
X-Received: by 2002:a05:6a00:2d1b:b0:68e:3eff:e93a with SMTP id fa27-20020a056a002d1b00b0068e3effe93amr18795648pfb.2.1696925903791;
        Tue, 10 Oct 2023 01:18:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d1b:b0:68e:3eff:e93a with SMTP id fa27-20020a056a002d1b00b0068e3effe93amr18795625pfb.2.1696925903417;
        Tue, 10 Oct 2023 01:18:23 -0700 (PDT)
Return-Path: <shahuang@redhat.com>
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id z18-20020aa791d2000000b0068fcb70ccafsm7568388pfa.129.2023.10.10.01.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 01:18:22 -0700 (PDT)
Message-ID: <d9fdeb5b-5da2-8411-7940-e64ad7ebf91b@redhat.com>
Date: Tue, 10 Oct 2023 16:18:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V4 07/10] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com,
 oliver.upton@linux.dev, pbonzini@redhat.com, mst@redhat.com,
 will@kernel.org, gshan@redhat.com, rafael@kernel.org,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, linuxarm@huawei.com
References: <20231009203601.17584-1-salil.mehta@huawei.com>
 <20231009203601.17584-8-salil.mehta@huawei.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20231009203601.17584-8-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: pS00U31II6aJ



On 10/10/23 04:35, Salil Mehta via wrote:
> ACPI GED shall be used to convey to the guest kernel about any CPU hot-(un)plug
> events. Therefore, existing ACPI GED framework inside QEMU needs to be enhanced
> to support CPU hotplug state and events.
> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   hw/acpi/generic_event_device.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 62d504d231..0d5f0140e5 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -12,6 +12,7 @@
>   #include "qemu/osdep.h"
>   #include "qapi/error.h"
>   #include "hw/acpi/acpi.h"
> +#include "hw/acpi/cpu.h"
>   #include "hw/acpi/generic_event_device.h"
>   #include "hw/irq.h"
>   #include "hw/mem/pc-dimm.h"
> @@ -239,6 +240,8 @@ static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
>           } else {
>               acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev, errp);
>           }
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> +        acpi_cpu_plug_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
>       } else {
>           error_setg(errp, "virt: device plug request for unsupported device"
>                      " type: %s", object_get_typename(OBJECT(dev)));
> @@ -253,6 +256,8 @@ static void acpi_ged_unplug_request_cb(HotplugHandler *hotplug_dev,
>       if ((object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) &&
>                          !(object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)))) {
>           acpi_memory_unplug_request_cb(hotplug_dev, &s->memhp_state, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> +        acpi_cpu_unplug_request_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
>       } else {
>           error_setg(errp, "acpi: device unplug request for unsupported device"
>                      " type: %s", object_get_typename(OBJECT(dev)));
> @@ -266,6 +271,8 @@ static void acpi_ged_unplug_cb(HotplugHandler *hotplug_dev,
>   
>       if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>           acpi_memory_unplug_cb(&s->memhp_state, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> +        acpi_cpu_unplug_cb(&s->cpuhp_state, dev, errp);
>       } else {
>           error_setg(errp, "acpi: device unplug for unsupported device"
>                      " type: %s", object_get_typename(OBJECT(dev)));
> @@ -277,6 +284,7 @@ static void acpi_ged_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list)
>       AcpiGedState *s = ACPI_GED(adev);
>   
>       acpi_memory_ospm_status(&s->memhp_state, list);
> +    acpi_cpu_ospm_status(&s->cpuhp_state, list);
>   }
>   
>   static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
> @@ -291,6 +299,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>           sel = ACPI_GED_PWR_DOWN_EVT;
>       } else if (ev & ACPI_NVDIMM_HOTPLUG_STATUS) {
>           sel = ACPI_GED_NVDIMM_HOTPLUG_EVT;
> +    } else if (ev & ACPI_CPU_HOTPLUG_STATUS) {
> +        sel = ACPI_GED_CPU_HOTPLUG_EVT;
>       } else {
>           /* Unknown event. Return without generating interrupt. */
>           warn_report("GED: Unsupported event %d. No irq injected", ev);

-- 
Shaoqin
