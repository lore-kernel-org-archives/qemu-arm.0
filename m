Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp191390ejc;
        Fri, 27 Oct 2023 06:18:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo65lzjaKeLCNwzjF98/ldED0tXeRihv0vvEkH0V9WlUzqjqjlfhk/0cn+qw0PouboqmoZ
X-Received: by 2002:a0c:ef06:0:b0:66f:ac56:fb9b with SMTP id t6-20020a0cef06000000b0066fac56fb9bmr5622408qvr.22.1698412713977;
        Fri, 27 Oct 2023 06:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698412713; cv=none;
        d=google.com; s=arc-20160816;
        b=0GicsTzJJcSlK3gZUPqCXOR6j6B5U5tnTd6+FpsNOkLqskJ8wONKJgOLP69gZVGYTc
         CeXI23xIC59M1VbAI1ouO4/h/8nDUKEbqF8BjSEEA5LK8wUpCBMaSRjf+4Aq2O9saviQ
         DsNqMb9dTy1X1DWpMFtPYrXdrPTd2HrvjnQ3NPcHu/r14NVXG60M2hxAfIwFlIjLNfW1
         0buzu5QmNxEyR1w6OWwC2il/24/3/8u4kT3upYuIlVcIiYf498POcRCKOu1OC6MyjyaB
         Bq4qvdhUSqf57qyLrYbw0qI2oGydraYKNnTpK4tHJw+x/HPuAWBVyP/RWYvU8I3OutV1
         2rLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=TF6VVCxboXhKIs5wCjsGQQ7u5mOJRHdkheC80a1pjWg=;
        fh=yBg5jTax3bX/nm/oKv3FgmG4/dEof1Pt7099yXc4tJI=;
        b=lvQCXNsmsFYlZiuDpDC8X+ybl/bRAebvg5mdl7Qz0lKNvZJPldWOggpsxAtNAVkS0n
         nspNPN8zKTqEhn3mgifgzVKnMf24rqpbOWbEJMBCoXHgUrw+N471+BOI7o+77HHU7DNE
         06TuDXd8nEdloY7MtYcbuW+vZ/TRon2MDQsHAm8tYRmuP1sPTjl4XXno4Gb9JPFNyye9
         l5+nvCDAGkQlC8YUndoEhtxo496rVZ13RMehvE1Zvr+ZSioBRT2N3FNVZr787iiI/Duj
         KJDBj/4JzwVFbTtZMbdJJemoSFWA2o59lmiOoHPbscfVyrhTc3czgnNLPd4drc68NEme
         cbbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hjuvutP6;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id m2-20020ad45dc2000000b0063d00dc9c52si803611qvh.471.2023.10.27.06.18.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 06:18:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hjuvutP6;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698412713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TF6VVCxboXhKIs5wCjsGQQ7u5mOJRHdkheC80a1pjWg=;
	b=hjuvutP6PZwHrvHk7bJAt1MzmOr0viXLNMnYKqOdlxp0FbAL1+q5++tEqc/u7MD1Y0+2w/
	sEEyZ5vIrn1rtRUMf9au+lVMBuWDn7xfK2V1bD+22E//W7S4O0HXm5j3sS+idyX9axXWPO
	8gbqKMD5zC5WCrsbzI6tqaFAjlYCd5Y=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-X_oMGqFOME22rAhmJtS29Q-1; Fri, 27 Oct 2023 09:18:32 -0400
X-MC-Unique: X_oMGqFOME22rAhmJtS29Q-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9bd91ce3033so136997066b.0
        for <alex.bennee@linaro.org>; Fri, 27 Oct 2023 06:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698412711; x=1699017511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TF6VVCxboXhKIs5wCjsGQQ7u5mOJRHdkheC80a1pjWg=;
        b=JBkPTZJ8djyHVWzirk4JGFxYAggsUhexa99XaMfEUW1WlDv47y7Jp+Y5xfi5eZTIUt
         3mh7Onf+33G5wtJto8+OCW/2ztbGphut/3M+DmNpapUbTq/jFicXrx6r3LoVxkJJ70h5
         rDlJ9zTgtSI/5xwk/WLcA6xuTyxi02julw9822NrIDx/yr2VZzhtEcxwcsomJW4IJsVe
         XOvxrEzl4qHHyVm38srCS3rsweMXlk9NhKaPE9c+y7e0QCFS7v2ipWm3XMGd7QYIkkY4
         4zJEAlR7oXeyBcMlT4KJz1JTRGEFHWl6Dab6z5MZMHikaxEbdp5CdrmtxYZBIcj71v97
         3lFA==
X-Gm-Message-State: AOJu0YydQ8642hWvl1oqGePNRKhDqA1U/cx2Dr6H5HikmTVb20SM++w8
	298aFG58ygvolgtb905QPM2TYF+5v09csX0RJx6ucYW/1dleJ/JFBb0zHLVJhDzpfzR67cMV2gO
	q2DnSCJ4HW/fQ4Nce
X-Received: by 2002:a17:906:da84:b0:9be:30c2:b8fd with SMTP id xh4-20020a170906da8400b009be30c2b8fdmr2323625ejb.66.1698412711102;
        Fri, 27 Oct 2023 06:18:31 -0700 (PDT)
X-Received: by 2002:a17:906:da84:b0:9be:30c2:b8fd with SMTP id xh4-20020a170906da8400b009be30c2b8fdmr2323580ejb.66.1698412710706;
        Fri, 27 Oct 2023 06:18:30 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id mb6-20020a170906eb0600b009adce1c97ccsm1184408ejb.53.2023.10.27.06.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 06:18:30 -0700 (PDT)
Date: Fri, 27 Oct 2023 15:18:28 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <maz@kernel.org>,
 <jean-philippe@linaro.org>, <jonathan.cameron@huawei.com>,
 <lpieralisi@kernel.org>, <peter.maydell@linaro.org>,
 <richard.henderson@linaro.org>, <andrew.jones@linux.dev>,
 <david@redhat.com>, <philmd@linaro.org>, <eric.auger@redhat.com>,
 <oliver.upton@linux.dev>, <pbonzini@redhat.com>, <mst@redhat.com>,
 <will@kernel.org>, <gshan@redhat.com>, <rafael@kernel.org>,
 <alex.bennee@linaro.org>, <linux@armlinux.org.uk>,
 <darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
 <vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
 <miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>,
 <zhukeqian1@huawei.com>, <wangxiongfeng2@huawei.com>,
 <wangyanan55@huawei.com>, <jiakernel2@gmail.com>, <maobibo@loongson.cn>,
 <lixianglai@loongson.cn>, <linuxarm@huawei.com>
Subject: Re: [PATCH V6 7/9] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
Message-ID: <20231027151828.5c9d499b@imammedo.users.ipa.redhat.com>
In-Reply-To: <20231013105129.25648-8-salil.mehta@huawei.com>
References: <20231013105129.25648-1-salil.mehta@huawei.com>
	<20231013105129.25648-8-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: JPPKIkKMAprp

On Fri, 13 Oct 2023 11:51:27 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> ACPI GED shall be used to convey to the guest kernel about any CPU hot-(un)plug
> events. Therefore, existing ACPI GED framework inside QEMU needs to be enhanced
> to support CPU hotplug state and events.
> 

This is a part of hw wiring which you started to introduce in 4/9
Given patches are small, I'd merge this into 4/9 to avoid broken context.
So essentially GED improvement would consist from hw and aml parts.
with some extra refactoring (5/9) in a separate patch.

> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Tested-by: Xianglai Li <lixianglai@loongson.cn>
> ---
>  hw/acpi/generic_event_device.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 62d504d231..0d5f0140e5 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -12,6 +12,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "hw/acpi/acpi.h"
> +#include "hw/acpi/cpu.h"
>  #include "hw/acpi/generic_event_device.h"
>  #include "hw/irq.h"
>  #include "hw/mem/pc-dimm.h"
> @@ -239,6 +240,8 @@ static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
>          } else {
>              acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev, errp);
>          }
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> +        acpi_cpu_plug_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
>      } else {
>          error_setg(errp, "virt: device plug request for unsupported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -253,6 +256,8 @@ static void acpi_ged_unplug_request_cb(HotplugHandler *hotplug_dev,
>      if ((object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) &&
>                         !(object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)))) {
>          acpi_memory_unplug_request_cb(hotplug_dev, &s->memhp_state, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> +        acpi_cpu_unplug_request_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
>      } else {
>          error_setg(errp, "acpi: device unplug request for unsupported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -266,6 +271,8 @@ static void acpi_ged_unplug_cb(HotplugHandler *hotplug_dev,
>  
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>          acpi_memory_unplug_cb(&s->memhp_state, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> +        acpi_cpu_unplug_cb(&s->cpuhp_state, dev, errp);
>      } else {
>          error_setg(errp, "acpi: device unplug for unsupported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -277,6 +284,7 @@ static void acpi_ged_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list)
>      AcpiGedState *s = ACPI_GED(adev);
>  
>      acpi_memory_ospm_status(&s->memhp_state, list);
> +    acpi_cpu_ospm_status(&s->cpuhp_state, list);
>  }
>  
>  static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
> @@ -291,6 +299,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>          sel = ACPI_GED_PWR_DOWN_EVT;
>      } else if (ev & ACPI_NVDIMM_HOTPLUG_STATUS) {
>          sel = ACPI_GED_NVDIMM_HOTPLUG_EVT;
> +    } else if (ev & ACPI_CPU_HOTPLUG_STATUS) {
> +        sel = ACPI_GED_CPU_HOTPLUG_EVT;
>      } else {
>          /* Unknown event. Return without generating interrupt. */
>          warn_report("GED: Unsupported event %d. No irq injected", ev);
