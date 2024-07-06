Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp1755474njb;
        Sat, 6 Jul 2024 06:20:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWus//kAWGDKKd+nFMO73Rq3cJu57BJ+qo5o/kEATQU5Vx6yZ7EM/qbA8BnGqinhWjHq3EtcTtWwRgDmrZyHIpJr4G3IHY2
X-Google-Smtp-Source: AGHT+IEeHqFwqo4q0P8w5MlQGNZZ1LMpzF+0pDe2QRjBrMPtBHw/3beNS9xkO+Q700ase4BH8b49
X-Received: by 2002:a05:620a:4453:b0:79f:776:a9f2 with SMTP id af79cd13be357-79f0776ab04mr21327585a.56.1720272056716;
        Sat, 06 Jul 2024 06:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720272056; cv=none;
        d=google.com; s=arc-20160816;
        b=bBXfkuSvRd3Dz7X4OrqkUwd2C/UCGHjQ4mPTGCFXUhCVZNCsV9dtDumuBEh0BNNdj1
         cIRmQzJV72CO1tZpcLzzS9D3ufhiDXyc87fi2eYocHPqFbAQTU4dqi8kqiAvBszGSGRW
         uuUTKvVlr9O3ERzTtOKQ+T2A5lB5ufBEgQqZuE6j50uKFcw5adNQ6LqWApUa18qHsj+b
         rMveLktKmHHv62CwyEgPcf6A3pElWy8AnYqD7cFnoivo3KDGkI/WdKGSbxQG4oQyLUY6
         m74YuuUwdJltfoyrciGr9D2KkSXoCsShbqwR+94LdkXiYxz5ASu54eJOYSN+jTKVLTtJ
         48tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=z/oYyO1PvynKToRD38TGVga9DNkeTkO/J+biDu8RAEU=;
        fh=U7K3Yu1ALXmTCJoDJsPS9FAjKO8h9w3cfTqICrEpJSU=;
        b=rgpOB8ceAwDIu4icH7qhJn8svGv/1ZZvTaGqyuzjvd2J5p0prV/Hl6CqB0HZ48WUfK
         Y6UYHFVWMIsBSlgROSXGImkowVL6v4z1YT12d58Cs0RDoiBBF9tWH5EhzXCYBINlkQC9
         aoaW/Jjq2ZW3M3/1mHoCPsztegvzj/a/wVOW+GXG17dTNd+lIXEea00gMto9Dsar6VsO
         nLzC0mb+aEAxKvin+P7VLtB1wb+VQAR+MtqlW0PQLl6QL3ZLiC3ABcmBQVGMbX2MZ2er
         +uh2iXDr+a7vBsPwy8OEcqg7qswjFq58ezjUPWG+cF+g9lgn3WUQPzDMn44QclIbiZV2
         7xqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jb3Sg4By;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-79efc96fdc7si255940785a.350.2024.07.06.06.20.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 06:20:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jb3Sg4By;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720272056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z/oYyO1PvynKToRD38TGVga9DNkeTkO/J+biDu8RAEU=;
	b=Jb3Sg4ByWdk123fIsi91iphIpifPlu4aNWV75Hcry6EXfdb8P+rtwNM1eG4gCxPNXHa6gy
	jeKNjhvhCJsm8NYCnRrb29PRNEqxg3+Z+WmjhXL3bB7m0eN4Zj3Jz104s/i2g2y/5EdI9e
	OJ176OUA+qlZiJEluoYX9dMLUsgz7Iw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-Fq2lVQ7wN_WLp8AK1WFQQQ-1; Sat, 06 Jul 2024 09:20:54 -0400
X-MC-Unique: Fq2lVQ7wN_WLp8AK1WFQQQ-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3678ff75122so1862827f8f.0
        for <alex.bennee@linaro.org>; Sat, 06 Jul 2024 06:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720272053; x=1720876853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sDkcqj2p7zjlaR6kdl0itNxFGJFmI88DVgz+HCfhMi4=;
        b=MO3MM0LK4xfpBAWRvAHncZ+xAHDjVYnD5YcLBy5hhnept6AIrQknrYotpq9wgcTmB1
         N+ayoOVposxTIruW0go8aZTvdl0ir+d2FWhfW5O8vUnty2uQF0DzG8xNZXrEVMjds3Fc
         ak1iqK/49MQTF4n9UrIOp9UdYICzWOf4LJHR6N++R9K8zQG20/S+92KZi49F/00D9KUZ
         MEFAM6g47m5sfwv24AlBNCHY7iiY0/lTRGmotrA0V1UoT0ueiBstlpgx3vi/k00VCpuL
         3YmrYR9HtqPQrSJxbznC+fT9z8cGJSZONUGiWUFkDzQVLwwwzylyK72w33NPGgqc0mvw
         6zsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb+GVH/nxsonpsL4QOg1H4l552FEmQ7SquglQHSzydgjmXxtkLvN7ZXLyMv7F/Y0/9Dh7RWo3xu5RlFU7hUGIYapPRzX3U
X-Gm-Message-State: AOJu0YykWtBhXEtOcg0++lBXLaQ28WrxmqRHdXfs121VepNiPhA+8Yld
	92F3hVLXMijcEFdN1fdIFHHOojAoHlCURkPi8k85/8k0MO38y4wpcD0Jo80zz9Z6O58F79t7Mr1
	GZref576DQsi6aKc7zN4IFfAKdJ/nm6hGC4rvB/1XS1r81neDkZYU1w==
X-Received: by 2002:adf:e9d1:0:b0:360:7971:7e2c with SMTP id ffacd0b85a97d-3679dd66b01mr5080962f8f.54.1720272053619;
        Sat, 06 Jul 2024 06:20:53 -0700 (PDT)
X-Received: by 2002:adf:e9d1:0:b0:360:7971:7e2c with SMTP id ffacd0b85a97d-3679dd66b01mr5080944f8f.54.1720272053208;
        Sat, 06 Jul 2024 06:20:53 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a2ca4dbsm96364735e9.33.2024.07.06.06.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 06:20:52 -0700 (PDT)
Date: Sat, 6 Jul 2024 15:20:50 +0200
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
 <lixianglai@loongson.cn>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
 <linuxarm@huawei.com>, Shaoqin Huang <shahuang@redhat.com>, Zhao Liu
 <zhao1.liu@intel.com>
Subject: Re: [PATCH V13 2/8] hw/acpi: Move CPU ctrl-dev MMIO region len
 macro to common header file
Message-ID: <20240706152050.4f5f8109@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240607115649.214622-3-salil.mehta@huawei.com>
References: <20240607115649.214622-1-salil.mehta@huawei.com>
	<20240607115649.214622-3-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: jPNDWMHvuzaO

On Fri, 7 Jun 2024 12:56:43 +0100
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
> Tested-by: Zhao Liu <zhao1.liu@intel.com>
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>  hw/acpi/cpu.c                 | 2 +-
>  include/hw/acpi/cpu_hotplug.h | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 2d81c1e790..69aaa563db 100644
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

this file has deps on x86 machine and contains mainly
legacy CPU hotplug API for x86.=20

> @@ -19,6 +19,8 @@
>  #include "hw/hotplug.h"
>  #include "hw/acpi/cpu.h"
> =20
> +#define ACPI_CPU_HOTPLUG_REG_LEN 12

the better place for it would be include/hw/acpi/cpu.h

>  typedef struct AcpiCpuHotplug {
>      Object *device;
>      MemoryRegion io;
