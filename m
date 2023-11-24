Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp1337532ejj;
        Fri, 24 Nov 2023 08:24:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCZEff56ppK3NZn7XFw0sDFLrs4uLUYZD6DfbswWHOkn9GjDAuM02MMWvq0OWtni96Aq3R
X-Received: by 2002:a05:6871:e7c3:b0:1ea:406:4dff with SMTP id qc3-20020a056871e7c300b001ea04064dffmr4787786oac.50.1700843055724;
        Fri, 24 Nov 2023 08:24:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700843055; cv=none;
        d=google.com; s=arc-20160816;
        b=ERyjT7UPqgWcpY2CjxprWdXj5E2oBG62FHEXF38zer425esxuSADS2BbKtQ9ijUz88
         mxejsFqGB3CHTRmzCHg1BHyhBmdaqAsJhywZh+Be5cHFsOdzh845Iqc/MTQT3FjbivKJ
         CAIYZVAiQXS7FP3unXMznKi4gih5Ohocrtpw7YIQkG3k2SKUuFcxUeXJ2ooysj+T1x6K
         6BQIKJTPwjLIGtYL3a3XVloy2jkB5Q80U0EjjxHj/wTzUAe9rNv+vSAnetPDJLRhqZRH
         R7XHCmtNGvMvEyip9B0KfSbJyrt3/1PY9he+wzf6nkhofVfZrjB9uIqVFYbnYYMzn/CY
         AGVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=XvZLC1a3doCjwxJXe9wXGBy327RrszPAUGwfEDg92j8=;
        fh=yBg5jTax3bX/nm/oKv3FgmG4/dEof1Pt7099yXc4tJI=;
        b=JK9CaWOedHiFIdEgneM8Ar1iBht86Co8WI/tZnSm18yhdDT51ukU7wzp1FK4XWmyc5
         ySMy65UXOXn0mSWCyHZt8f/ClksKJULkVjo+qGN6UV5j9bgzLukNbpcXrv9NOE4zCtaa
         vN0s8ZwkCz1k/RyLducvz+xorwhNzDOGZOMsGPKGqGTdsiSL7uru9SO8WPL2OiAn8C7M
         khdjqOzs+7PEzU0rCokoCVFQs3sGf4aG4RC9gxlgCIw0Q+PAb4BdgYGcbUK4CwLOaTuD
         tx9kkxkWTb7d5YtYlEsHLwSYfCPoI9T7NDoIMWeF/xH9Pl2uFJuWYCN9PaVwBZdY4BYY
         zEMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=APMGRqqD;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id w28-20020a05610205fc00b004527acf43c5si880287vsf.534.2023.11.24.08.24.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 08:24:15 -0800 (PST)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=APMGRqqD;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700843055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XvZLC1a3doCjwxJXe9wXGBy327RrszPAUGwfEDg92j8=;
	b=APMGRqqDpMVcpBHnuPrixwL1w9LFsQH4f0ZRBariEWOIHsb+UnaR1H8Jy8vbKtDvOyO6f3
	V7i3N6fXnU+NrAFcBhSPR4qaGIahKh0fJmH/YxDy6/LH8kFL+k0QDg+A+tu36W7QSDgen6
	UEuVTyWaMfI+Wab7AVruwGQLM+Drv8A=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-pGU1C-MXOwiZJee1jZSkaw-1; Fri, 24 Nov 2023 11:24:14 -0500
X-MC-Unique: pGU1C-MXOwiZJee1jZSkaw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a02ccc2fb53so144137566b.1
        for <alex.bennee@linaro.org>; Fri, 24 Nov 2023 08:24:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700843053; x=1701447853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XvZLC1a3doCjwxJXe9wXGBy327RrszPAUGwfEDg92j8=;
        b=GJdw+Nhy6LT5CN7kweCuBHwDc0sCKB1wC+3Iw7ZAKF+Swgyvu1GRsoFm34sN5SIzlQ
         h4CTvX619NTrU4gozxsBilbhb3uMvEybJtf4/HIsv50xwc3T8h3bXeONGwj32PPW5Mhn
         fKdQxRjcnJ6pR2xxIUfqTAw8KFepeNNqB5XQyRoU4BUKfj69nKwA+mfk1hv8dUODWSet
         xdMW7ck9wieHTdqEkL8dv4e21ThdoVQX0RkcjtBXkHf3PxEQzAjY17mM/4S9wI4nrIL4
         7598NaMrGveLKEwbu6T5Kfg64ADEF/wDq0Z5GKnxHVJVXYv3wdItsyOa0ZCJFzwqiEoI
         RVvQ==
X-Gm-Message-State: AOJu0YxCVq0Ic4r7TWoWQ3R5hx6Iov/tQHRhf/mlRbDzEfGDbV9zETPo
	pwJGGSxzx9tawOk9ud5WfWGQTuW4mNgnX2ET0bSK7qjqe9Sj262zsAwCM9wmSvgC3mqiD2Gq/Rh
	yb2C0oKWx676yZ+Wo
X-Received: by 2002:a17:906:6809:b0:9fe:42aa:425d with SMTP id k9-20020a170906680900b009fe42aa425dmr2564498ejr.76.1700843052864;
        Fri, 24 Nov 2023 08:24:12 -0800 (PST)
X-Received: by 2002:a17:906:6809:b0:9fe:42aa:425d with SMTP id k9-20020a170906680900b009fe42aa425dmr2564471ejr.76.1700843052504;
        Fri, 24 Nov 2023 08:24:12 -0800 (PST)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
        by smtp.gmail.com with ESMTPSA id qx23-20020a170906fcd700b009d2eb40ff9dsm2249210ejb.33.2023.11.24.08.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 08:24:12 -0800 (PST)
Date: Fri, 24 Nov 2023 17:24:10 +0100
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
Subject: Re: [PATCH V7 4/8] hw/acpi: Update GED _EVT method AML with CPU
 scan
Message-ID: <20231124172410.327865fd@imammedo.users.ipa.redhat.com>
In-Reply-To: <20231113201236.30668-5-salil.mehta@huawei.com>
References: <20231113201236.30668-1-salil.mehta@huawei.com>
	<20231113201236.30668-5-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: vahdpgPHU8P7

On Mon, 13 Nov 2023 20:12:32 +0000
Salil Mehta <salil.mehta@huawei.com> wrote:

> OSPM evaluates _EVT method to map the event. The CPU hotplug event eventually
> results in start of the CPU scan. Scan figures out the CPU and the kind of
> event(plug/unplug) and notifies it back to the guest. Update the GED AML _EVT
> method with the call to \\_SB.CPUS.CSCN
> 
> Also, macro CPU_SCAN_METHOD might be referred in other places like during GED
> intialization so it makes sense to have its definition placed in some common
> header file like cpu_hotplug.h. But doing this can cause compilation break

hw/acpi/cpu.h  would be a better place for it

Also, I'd rather rename w/acpi/cpu_hotplug.c:CPU_SCAN_METHOD to LEGACY_CPU_SCAN_METHOD
while keeping newer CPU_SCAN_METHOD as is and making it public.

> because of the conflicting macro definitions present in cpu.c and cpu_hotplug.c
> and because both these files get compiled due to historic reasons of x86 world
> i.e. decision to use legacy(GPE.2)/modern(GED) CPU hotplug interface happens
> during runtime [1]. To mitigate above, for now, declare a new common macro
> ACPI_CPU_SCAN_METHOD for CPU scan method instead.
> (This needs a separate discussion later on for clean-up)
> 
> Reference:
> [1] https://lore.kernel.org/qemu-devel/1463496205-251412-24-git-send-email-imammedo@redhat.com/
> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Tested-by: Xianglai Li <lixianglai@loongson.cn>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>  hw/acpi/cpu.c                  | 2 +-
>  hw/acpi/generic_event_device.c | 4 ++++
>  include/hw/acpi/cpu_hotplug.h  | 2 ++
>  3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 4b24a25003..de1f9295dc 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -323,7 +323,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
>  #define CPUHP_RES_DEVICE  "PRES"
>  #define CPU_LOCK          "CPLK"
>  #define CPU_STS_METHOD    "CSTA"
> -#define CPU_SCAN_METHOD   "CSCN"
> +#define CPU_SCAN_METHOD   ACPI_CPU_SCAN_METHOD
>  #define CPU_NOTIFY_METHOD "CTFY"
>  #define CPU_EJECT_METHOD  "CEJ0"
>  #define CPU_OST_METHOD    "COST"
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 57b0c2815b..f547b96d74 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -109,6 +109,10 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
>                  aml_append(if_ctx, aml_call0(MEMORY_DEVICES_CONTAINER "."
>                                               MEMORY_SLOT_SCAN_METHOD));
>                  break;
> +            case ACPI_GED_CPU_HOTPLUG_EVT:
> +                aml_append(if_ctx, aml_call0(ACPI_CPU_CONTAINER "."
> +                                             ACPI_CPU_SCAN_METHOD));
> +                break;
>              case ACPI_GED_PWR_DOWN_EVT:
>                  aml_append(if_ctx,
>                             aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
> diff --git a/include/hw/acpi/cpu_hotplug.h b/include/hw/acpi/cpu_hotplug.h
> index 48b291e45e..ef631750b4 100644
> --- a/include/hw/acpi/cpu_hotplug.h
> +++ b/include/hw/acpi/cpu_hotplug.h
> @@ -20,6 +20,8 @@
>  #include "hw/acpi/cpu.h"
>  
>  #define ACPI_CPU_HOTPLUG_REG_LEN 12
> +#define ACPI_CPU_SCAN_METHOD "CSCN"
> +#define ACPI_CPU_CONTAINER "\\_SB.CPUS"
>  
>  typedef struct AcpiCpuHotplug {
>      Object *device;
