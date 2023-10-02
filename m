Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1423567ejb;
        Mon, 2 Oct 2023 09:16:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdgaSvnQFUpD1kVmfqVD6irXLpzQ4nRSKkpOUor0B4qUJRHVtkKvNJw7X8U7j/c4fayPPq
X-Received: by 2002:a5d:45c9:0:b0:31f:f1f4:ca8b with SMTP id b9-20020a5d45c9000000b0031ff1f4ca8bmr10338066wrs.40.1696263378633;
        Mon, 02 Oct 2023 09:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696263378; cv=none;
        d=google.com; s=arc-20160816;
        b=Sga71DTsIPd9z357cZ5qeYCKELzg39LmDQyiAyu0l8mLeAmMs4N5kFgckBMYyPMAk5
         l5gfpfKUYju5MIAfIHYOWqE5PHuF9i0vuf92ZI8ULYUM1IViPOABSWeYj1tg52t2h5uh
         CiaS4H0oZnYKxx7P+LpeYd7rjKIlINaUao39s8xzBDX26/aQcA5cAZqwKwqhepUpXD5z
         3qUFLibYBu6fhQER0KNIS/77mHZearN4xXK7CnktRPJwzJNgEiuGeM7zeYXqBcvURYQg
         dWdXlWZ3oeqD2g0ZPevA2clOgX0gFqNrTHJ7zufhDmCscohxCZ46Nh87D+Ed+Gv4X3HK
         QUuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=ktcvBxfk5ZEtfq0+Vmyj50xFIw4Cb8OV9Gq8YWAaSGo=;
        fh=/EBauY3IXh4VobPm5b6w815uXOAKkGQo/xHlRV7Dr5E=;
        b=qA7lUsEWhl+MMlBPndCfRvObIHuzNQ4wV7Wr73ehsNiGqcKdfvCaO84KNBRaPTREVM
         ap4iaS7wcDC5ZnKoSS0jthPA1I3PKtR2aUyMyPRVMVkgXtZQ1TPAf4T80ArOw8Y1lglT
         Bi0N3QpPdAj9pDlZXVF5WfYgfzl7N2ijgnAiY/fcLs70ezsfBdLV1gFSda8o0R4iwFWR
         7agzMbmRBCjO80fsgS7ZvUEy9pMKhjngYkV6ZQftf495maCPuShIjBGZYxbDz2104ypO
         5/oOWxWmiMOc81OxKd24QTnR+pIa40KKCq6TmP8o6e1NTMQhSoFoCTvIExnds5lr22HX
         kJmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id s10-20020adfecca000000b003200597be44si8897933wro.271.2023.10.02.09.16.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Oct 2023 09:16:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RzmGW2PFCz6HJZg;
	Tue,  3 Oct 2023 00:13:39 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 2 Oct
 2023 17:16:16 +0100
Date: Mon, 2 Oct 2023 17:16:15 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Salil Mehta <salil.mehta@huawei.com>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <maz@kernel.org>,
	<jean-philippe@linaro.org>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <mst@redhat.com>, <will@kernel.org>,
	<gshan@redhat.com>, <rafael@kernel.org>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<linuxarm@huawei.com>
Subject: Re: [PATCH V2 07/10] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
Message-ID: <20231002171615.00007a66@Huawei.com>
In-Reply-To: <20230930001933.2660-8-salil.mehta@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
	<20230930001933.2660-8-salil.mehta@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-TUID: uJQrt/8bNvW0

On Sat, 30 Sep 2023 01:19:30 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> ACPI GED shall be used to convey to the guest kernel about any CPU hot-(un)plug
> events. Therefore, existing ACPI GED framework inside QEMU needs to be enhanced
> to support CPU hotplug state and events.
> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

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
