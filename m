Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1422148ejb;
        Mon, 2 Oct 2023 09:14:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJhLz8ce1vJvZzmoc8OPsDo5/Z8tzrdl776Y7xJPOfXUYGKyVQxNt8+AWpiSwiDug8mQqE
X-Received: by 2002:adf:f851:0:b0:319:82c9:8e7d with SMTP id d17-20020adff851000000b0031982c98e7dmr11034951wrq.31.1696263266936;
        Mon, 02 Oct 2023 09:14:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696263266; cv=none;
        d=google.com; s=arc-20160816;
        b=CZH2VXXA0yz9wQ1+LDMAjQVP/tqifOOhfVD3c8wu3/1AHp7nqbjjVgviyQflF3P48r
         0bMgmqf9NznzkgRfW/IPA0VDHb9s+Y5E8FUBPYJ2gXRjSAfvyBVXpF684GRFSwgzN62d
         a+jon5w+qdcjq3TvQlnhLiRHp0jOvBAlF8yGdPqZd8bMdvTuFEQOqbZNIiNjYHM7242v
         CHtldEnP6wcej14othGMAlT8ocA/BWE3AlYpFtzhRb6Y29jP8ucpznwYWypUW+QpEiVr
         9Q58+GrYODatRn4T9BCk9RLAyUD4SyQCytsAJL/6etg+23r6vnngp69nvE4NQ+VsaWoI
         bMYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=Tyb0p8hitoAk8hhk2VaEct0Cik0XSwA8MSs03k6RGGY=;
        fh=/EBauY3IXh4VobPm5b6w815uXOAKkGQo/xHlRV7Dr5E=;
        b=rOxBKG42GL7tKZv94C7OKu7blxgjED6EVl4QgBiK75ZT3zHHG5PYXLc5/pQ/nono7f
         1hj2by02ZLJvgej9g74FdbFQ5TdsP02PJ/A6q4Yk6sf31OTZxjV1dBH35Saljom4GvJn
         frVtmXUK75svNCQ6vLYwxjoUNnDk3kfkDheKm0HfjwVwO08zJkAF86eulmMwhzyqBPei
         XrVToGDZGkvH5nxaxeLGt1o2j7PlNWiIDTET0x9lJnlAbUU+kBKESeh7x892e1LYlTHo
         jwgCwfDBWiqRJrS2lqc6/6GhKD3fAk0JENn/R4bu1abZsKOmJRgG2Yfmhulxe0VdA+u2
         LQWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id x13-20020adfec0d000000b0032181a57630si5423188wrn.929.2023.10.02.09.14.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Oct 2023 09:14:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RzmDM5BdSz6HJZ3;
	Tue,  3 Oct 2023 00:11:47 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 2 Oct
 2023 17:14:24 +0100
Date: Mon, 2 Oct 2023 17:14:23 +0100
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
Subject: Re: [PATCH V2 06/10] hw/acpi: Update GED _EVT method AML with cpu
 scan
Message-ID: <20231002171423.00003c39@Huawei.com>
In-Reply-To: <20230930001933.2660-7-salil.mehta@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
	<20230930001933.2660-7-salil.mehta@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-TUID: 4bBhFqQTxZOh

On Sat, 30 Sep 2023 01:19:29 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> OSPM evaluates _EVT method to map the event. The cpu hotplug event eventually
> results in start of the cpu scan. Scan figures out the cpu and the kind of
> event(plug/unplug) and notifies it back to the guest.
> 
> The change in this patch updates the GED AML _EVT method with the call to
> \\_SB.CPUS.CSCN which will do above.
> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
One trivial suggested addition inline (dropping existing definition that this
replicates). With that tidied up

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  hw/acpi/generic_event_device.c | 4 ++++
>  include/hw/acpi/cpu_hotplug.h  | 2 ++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index d2fa1d0e4a..62d504d231 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -108,6 +108,10 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
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

This seems to already be defined in hw/acpi/cpu.c
Can we drop it from there given that file now includes this
header anyway.
 
> +#define ACPI_CPU_CONTAINER "\\_SB.CPUS"
>  
>  typedef struct AcpiCpuHotplug {
>      Object *device;
