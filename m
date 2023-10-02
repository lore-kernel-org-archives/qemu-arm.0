Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1407984ejb;
        Mon, 2 Oct 2023 08:54:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEbMa1nue0lpnZzTGB11peBGg1SoAu+xRgBNZJYXMUzkAZx/bGPbZU0TDRruIr/Gl/m8oG
X-Received: by 2002:adf:f38c:0:b0:320:b1b:86a9 with SMTP id m12-20020adff38c000000b003200b1b86a9mr10973210wro.24.1696262092237;
        Mon, 02 Oct 2023 08:54:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696262092; cv=none;
        d=google.com; s=arc-20160816;
        b=Bosmvda40LToGd0xg9gPjGHn1fG6YnjXJp0biCTm4fSrKQ40i1BsC03UlyHZbAln4P
         gNgaFprU5bv3ZorSuZ1FDHS1twpJC4aILBuZYPL8xf3q0sLDaRR2nwIhlhJnrD+WJxlx
         +JDVPx+UbeKH+F+uhf8gv/2nxwEgNKaPuPr8pDToKqqvjYyNK1KCsTtBcKo2VkcmQt9O
         9+vmhweofykNkjCB/KPdJmFEZP4QJUBBcxPyZwO0HCeVSrwVoHjzUtzn4m3Z/2DoT+9y
         8Id0GV2DbH6Znwf4PwNCqX0bOExULbI+0IvhEw/rT7jlqRMEiFV/5evqrsL2pd1AvFkg
         iuaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=asIz2Sygbqw2G76krpeojtz134gcFxdR4Ka0dp2fXsk=;
        fh=/EBauY3IXh4VobPm5b6w815uXOAKkGQo/xHlRV7Dr5E=;
        b=PvOBzvkxzxvSAU2ggc8YnIh1ldD1Vbm3cT2TQ0oyaS7gyVtVJQz1W2C16FQSQ6cUeS
         k7/4pqdS1nznt6A9mrZvE02cJZfdyVciakaZoismogRU61Q9LKEnIPyZmCceh7+s2fdL
         LsEDxjS6yvA+wUIjpTZBl+lIL0aXX0YdgsFOqjcZ56u7QXIPU48rc7TCdEQVv8iMJoLq
         artvh9QjPobVdjVOxotkkKHbtRCjqHnYsoV1/X82wuTK76V3KeaXqexIKmLJR3rHRbUX
         kSyZujBCudV7MPkQHk5pHRzXNJIeaNlv/c4OcIWxjUSe+gwc9k3pFJrgPmWI9Bmvqvt/
         InAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id w14-20020adfde8e000000b0032480c4f2b0si5241848wrl.1030.2023.10.02.08.54.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Oct 2023 08:54:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rzlrg1HPdz67FbS;
	Mon,  2 Oct 2023 23:54:43 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 2 Oct
 2023 16:54:50 +0100
Date: Mon, 2 Oct 2023 16:54:49 +0100
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
Subject: Re: [PATCH V2 02/10] hw/acpi: Move CPU ctrl-dev MMIO region len
 macro to common header file
Message-ID: <20231002165449.00004e17@Huawei.com>
In-Reply-To: <20230930001933.2660-3-salil.mehta@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
	<20230930001933.2660-3-salil.mehta@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-TUID: n/o/y7p6gsVf

On Sat, 30 Sep 2023 01:19:25 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> CPU ctrl-dev MMIO region length could be used in ACPI GED and various oth=
er
> architecture specific places. Move ACPI_CPU_HOTPLUG_REG_LEN macro to more
> appropriate common header file.
>=20
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>
LGTM=20

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  hw/acpi/cpu.c                 | 2 +-
>  include/hw/acpi/cpu_hotplug.h | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 19c154d78f..45defdc0e2 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -1,12 +1,12 @@
>  #include "qemu/osdep.h"
>  #include "migration/vmstate.h"
>  #include "hw/acpi/cpu.h"
> +#include "hw/acpi/cpu_hotplug.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-events-acpi.h"
>  #include "trace.h"
>  #include "sysemu/numa.h"
> =20
> -#define ACPI_CPU_HOTPLUG_REG_LEN 12
>  #define ACPI_CPU_SELECTOR_OFFSET_WR 0
>  #define ACPI_CPU_FLAGS_OFFSET_RW 4
>  #define ACPI_CPU_CMD_OFFSET_WR 5
> diff --git a/include/hw/acpi/cpu_hotplug.h b/include/hw/acpi/cpu_hotplug.h
> index 3b932abbbb..48b291e45e 100644
> --- a/include/hw/acpi/cpu_hotplug.h
> +++ b/include/hw/acpi/cpu_hotplug.h
> @@ -19,6 +19,8 @@
>  #include "hw/hotplug.h"
>  #include "hw/acpi/cpu.h"
> =20
> +#define ACPI_CPU_HOTPLUG_REG_LEN 12
> +
>  typedef struct AcpiCpuHotplug {
>      Object *device;
>      MemoryRegion io;
