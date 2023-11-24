Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp1225834ejj;
        Fri, 24 Nov 2023 06:20:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHH4pG3PdlyxIyi3QZEkpvH4IWYvAB4i3t+fGWuqFJmGmCRunpBKiJ6JLnwsFqm25smIeZR
X-Received: by 2002:a05:620a:4084:b0:772:63d9:6e69 with SMTP id f4-20020a05620a408400b0077263d96e69mr10452776qko.35.1700835652847;
        Fri, 24 Nov 2023 06:20:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700835652; cv=none;
        d=google.com; s=arc-20160816;
        b=apiiNc+QV/duqLZ09saDFpXDVRgF2SxgK3RgxuUUz5GAtBHOsWVLNRUTVp+BcCOi7u
         kbJXiEtb57EnKpOe9Qj5ktplb5/iI4uXxk4OwUxES3nwsc0euA15IOSpqxY4D4aB6q51
         i9zJaeuqv1zvnyxpi48lUbnSrQDUPJ96oTamHUiL8UblciR80c2eaNXSNthH8UmjKuxy
         pPWhPJcuIbLeDLPqcm8TJSWAL6avGOrZh7gOBA3tC8IekbgPGrw+GozF5AmveTRNetuV
         g0TZoDJN2rP05ciWrZpCbZjfk8KJE95krxRFlERx+rLrGpejCF+W+KMRevuS6PmvvD4S
         kksg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=WTKV6OEsy6m8PvThuLjAJxOw/15CMWf5C183Zc3nApo=;
        fh=yBg5jTax3bX/nm/oKv3FgmG4/dEof1Pt7099yXc4tJI=;
        b=WlOxMRuRKHPb2qEWTiZ5cPCgil8OYL2g8NXQE2fTWHv0pnY8BbP+GpjSb3HcN5WBw8
         uOOWdYj7b19AImVp3J6abbGgY8T1L/1X/77R8qwoojEiHydrXlcH7N+MoZhuWDHnVXRD
         f9m2E+YsXz4cifVWSgRi3uOMtgRYlz2h946X/Gy38dgrPS0n2HMu92bR0+Pq7GWmVKIw
         YkPoy41DyKPhaZ9R0lVbj/7W5CUYXlwBx6UdraRwS4PKa51Snj9vCyBqMHorrZGdBSPb
         OJKEYOFeLfKCgZibi4xBwe/C5YN5Tgp+LsBCXmEFxeq64VlCJi+MvQgZ5JnFUXSi2oWu
         J4cA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QtuIwPWG;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ea13-20020a05620a488d00b0077d783c7ee9si2757718qkb.193.2023.11.24.06.20.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 06:20:52 -0800 (PST)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QtuIwPWG;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700835652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WTKV6OEsy6m8PvThuLjAJxOw/15CMWf5C183Zc3nApo=;
	b=QtuIwPWGaP7915dZrWk6o62fqU9XNes2bIIITGiOzvkEeRBhogBF9OItwHUBmY0lMkmAVJ
	4H4vsnAiB0MV9//EWY4d/u1NaWT8gsLobOz++dlekgWwunj1tHVQGveYI5L5kAaZFzpPj6
	TZXVUaJQWUIRXpKrwCCA8qy8OrfTIeU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-wjHdG0GvOW6fu6aeSLNXww-1; Fri, 24 Nov 2023 09:20:51 -0500
X-MC-Unique: wjHdG0GvOW6fu6aeSLNXww-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-548cf45e962so1391138a12.2
        for <alex.bennee@linaro.org>; Fri, 24 Nov 2023 06:20:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700835650; x=1701440450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vegpZ4SEXUpYZ9JFohP3hK+vi7e/r3dObUb4fKl4quY=;
        b=K7V/VZZFEkzJ4r9FnR6ErkdkCqrt5YSZnRaxJLhy5Id/BUwoTm7+hB11D2AL06+Bin
         vv9LbOuAn08FCa0Rx/IpQkPBnedSi0Apn7MwL4ijB3yDkRJBH/+5V53fyxve0B8zhH+Q
         UDynM6GCcPae/0LuNbmVn6C8jXkIPt/Xe1AlWE5gjOmWFeMrQ4QqkWr17Dnn0GJll4VV
         UJGfm8WOeDqbGbCLwQTTxtK0N01yUNdOgFptM9A33hIlwdGXx/NYHzAqKfgz8m0eMY13
         zCZd1sLwrwxjtrClL6JL46LGrMvMejMkbv3jTRF/6m5fYO6ziYsGSTNL5FsyPW3oIv9u
         370Q==
X-Gm-Message-State: AOJu0Yxu6S+briPZospy+qSo3A0NFBOqbX22x1btfP1QSdYPJSib+9SG
	qGimg7K0Ra5IrPvIn3k9jbbHN0+OjUzH8J8ZXcZF0F/6qVx2VxLWy4fes2JTht5X4+IrWvgw/Ym
	qaoblQ8KBpYYKO6jj
X-Received: by 2002:a50:d55e:0:b0:53d:b839:2045 with SMTP id f30-20020a50d55e000000b0053db8392045mr2358129edj.25.1700835650037;
        Fri, 24 Nov 2023 06:20:50 -0800 (PST)
X-Received: by 2002:a50:d55e:0:b0:53d:b839:2045 with SMTP id f30-20020a50d55e000000b0053db8392045mr2358072edj.25.1700835649658;
        Fri, 24 Nov 2023 06:20:49 -0800 (PST)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
        by smtp.gmail.com with ESMTPSA id u11-20020aa7db8b000000b00543525d9fddsm1798204edt.21.2023.11.24.06.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 06:20:49 -0800 (PST)
Date: Fri, 24 Nov 2023 15:20:47 +0100
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
Subject: Re: [PATCH V7 2/8] hw/acpi: Move CPU ctrl-dev MMIO region len macro
 to common header file
Message-ID: <20231124152047.1160a5af@imammedo.users.ipa.redhat.com>
In-Reply-To: <20231113201236.30668-3-salil.mehta@huawei.com>
References: <20231113201236.30668-1-salil.mehta@huawei.com>
	<20231113201236.30668-3-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: fYvBooq7pAnc

On Mon, 13 Nov 2023 20:12:30 +0000
Salil Mehta <salil.mehta@huawei.com> wrote:

> CPU ctrl-dev MMIO region length could be used in ACPI GED and various oth=
er
> architecture specific places. Move ACPI_CPU_HOTPLUG_REG_LEN macro to more
> appropriate common header file.
>=20
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Tested-by: Xianglai Li <lixianglai@loongson.cn>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> ---
>  hw/acpi/cpu.c                 | 2 +-
>  include/hw/acpi/cpu_hotplug.h | 2 ++

the header holds legacy stuff (mostly) and I'd say is destined for removal.

include/hw/acpi/cpu.h  would be a better place for it.


>  2 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 011d2c6c2d..4b24a25003 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -1,13 +1,13 @@
>  #include "qemu/osdep.h"
>  #include "migration/vmstate.h"
>  #include "hw/acpi/cpu.h"
> +#include "hw/acpi/cpu_hotplug.h"
>  #include "hw/core/cpu.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-events-acpi.h"
>  #include "trace.h"
>  #include "sysemu/numa.h"
> =20
> -#define ACPI_CPU_HOTPLUG_REG_LEN 12
>  #define ACPI_CPU_SELECTOR_OFFSET_WR 0
>  #define ACPI_CPU_FLAGS_OFFSET_RW 4
>  #define ACPI_CPU_CMD_OFFSET_WR 5
> diff --git a/include/hw/acpi/cpu_hotplug.h b/include/hw/acpi/cpu_hotplug.=
h
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
