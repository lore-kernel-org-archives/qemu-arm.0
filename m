Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1925603ejb;
        Mon, 9 Oct 2023 05:21:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtJwQg/9U8Gwm+wCVlz18eUYyF1o/d85V0sElggfYwgGGfwYuwbnR1ib4zBT7vfvVPsfZy
X-Received: by 2002:a05:622a:1109:b0:418:1dc6:b909 with SMTP id e9-20020a05622a110900b004181dc6b909mr18167647qty.26.1696854097685;
        Mon, 09 Oct 2023 05:21:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696854097; cv=none;
        d=google.com; s=arc-20160816;
        b=hJF0tW00hpk2RFssmcvklCxsRVJJbPtIu6tYEzvvJ3/0mb/4ZoaJ5SjTsOBbQHagoq
         ZEKQyG09yJgO6Py1MugadCCvaNaHMc8h34aE6Sq3u/efMAFsDzuAruVD1BQyFfL13Yi+
         F/M7m7KjzKavxsT6AGuZUh7C8AZKD/u89Fjj8uQqHvcz251RifOhKG8Tjs9amZQxQWUv
         vXY7BsRj59ApOddPuuJa8oNqMJIUjscek54Uibo9Q8+upaDko53zFbi/k22D4iuzItx3
         xUcLtx8I1TwneIIj+508gdsY9/SQHMnFoCryU8NgpOy33exQheyHVdDnovA5BeKtUCdQ
         WFpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:organization
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=2bZXzUGcxBYinFudKQFkuxnigBSI9gHMfNXLyVDqtV8=;
        fh=GPxWsKePQQOQbx3DUz1WcTM7+aHXsm9W/SdNx32dskg=;
        b=Zi106RCFT3bGzTYmrIlXTMRtnvSZr2aOsx9wukEtmbn7Xly4RY31kaz8izWzifrrNJ
         JoMH+2MmFrI6V1Z///6412bwmgXP6NnKPirtwHcpaQQFnZaeasskRUa8UUwTpvq/lnPh
         ZlUwvzTJ1o8XLerwCHamwiabclUloPUgo1hJh6XnwXntKTatt/IhkO1BkKQz/yIIljhW
         W8XXeP+TfCUickhIPv0kJaEiDKN7S6Sj7y/dpxgR/WyW4bh6onV3SpsGgyg3euN7Yayg
         HGjBG6ljjsK7KC2SLnyRRKQa5P6kuAz4YhLogjFX0Cy3xeiUYv0q9ka5o3urLKR1zUOP
         uGDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OOWnoBGm;
       spf=pass (google.com: domain of david@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=david@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <david@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id n8-20020a05622a040800b00418142e801csi6071598qtx.485.2023.10.09.05.21.37
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 05:21:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of david@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OOWnoBGm;
       spf=pass (google.com: domain of david@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=david@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696854097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bZXzUGcxBYinFudKQFkuxnigBSI9gHMfNXLyVDqtV8=;
	b=OOWnoBGmk7+oCa2iymhROK/uoB3vw4dVUQxNhC1WPAWYoKuQTmBt7O4p6kpgoLXCNUWfe1
	k207VxZPpA2d0Ib6pNoZFbb37GnAIKtE0ma7BGZJBEXKyt0HVeXhEfrre926iXozBEiwa4
	S8igQ4F77TQy6RmTgN8m7mQjC09OVo0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-hPGO18DZPhauFuBO5Ljzcg-1; Mon, 09 Oct 2023 08:21:36 -0400
X-MC-Unique: hPGO18DZPhauFuBO5Ljzcg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3296bd73d91so1809044f8f.1
        for <alex.bennee@linaro.org>; Mon, 09 Oct 2023 05:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696854095; x=1697458895;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bZXzUGcxBYinFudKQFkuxnigBSI9gHMfNXLyVDqtV8=;
        b=gFwNwApXWbxtrTCiuGp2Nrnf2Qe55TkPUwyNQjnbbWNgqIPol4tLMf34SfMBhmS2FT
         4xp7RVxdhM0XesuzoF6LvBq63CZkhIGGEDhpeJNWDjg2LtiLkeGQaoTVOCmGegtm8KnM
         vceLIkzSdgNHNuBgM/5zfwCky+KFi3eoTgbyEfX41luSZCK5rxWMWbChVJEFRUtgV4vK
         +OvphCPnuNphOOWHqAnAFuWnMbr5HJ823Z1sK63aDEiS2k82KZKkkG55VpCC42qtSYO1
         trTjVuXVRQ49tOZlH2UHAB+kXlTlxxjGUbmtvP4CcVpAy0dcw9TX3KDi3wdtM/15wXdT
         DKtQ==
X-Gm-Message-State: AOJu0YwAM9J+e32tu+JasPKb+m5PKxR9EMz5VprtZbUIIAgYw3VxsX8T
	/CYEOHoXXhQd2VREQdw/HGUwu5JBxLNzwx1LKd78scNdfh9YhWNs5AqalOYTZwiNyL3kHIqallv
	acZOGuZwz+JeKhXIs
X-Received: by 2002:adf:f08f:0:b0:325:cafe:a687 with SMTP id n15-20020adff08f000000b00325cafea687mr15113779wro.51.1696854094724;
        Mon, 09 Oct 2023 05:21:34 -0700 (PDT)
X-Received: by 2002:adf:f08f:0:b0:325:cafe:a687 with SMTP id n15-20020adff08f000000b00325cafea687mr15113741wro.51.1696854094301;
        Mon, 09 Oct 2023 05:21:34 -0700 (PDT)
Return-Path: <david@redhat.com>
Received: from ?IPV6:2003:cb:c733:6400:ae10:4bb7:9712:8548? (p200300cbc7336400ae104bb797128548.dip0.t-ipconnect.de. [2003:cb:c733:6400:ae10:4bb7:9712:8548])
        by smtp.gmail.com with ESMTPSA id x3-20020a5d4903000000b0031fa870d4b3sm9431127wrq.60.2023.10.09.05.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 05:21:33 -0700 (PDT)
Message-ID: <3380adbe-fbbe-797f-19c2-76aa2e4cfe30@redhat.com>
Date: Mon, 9 Oct 2023 14:21:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V3 02/10] hw/acpi: Move CPU ctrl-dev MMIO region len macro
 to common header file
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 philmd@linaro.org, eric.auger@redhat.com, oliver.upton@linux.dev,
 pbonzini@redhat.com, mst@redhat.com, will@kernel.org, gshan@redhat.com,
 rafael@kernel.org, alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, linuxarm@huawei.com
References: <20231009112812.10612-1-salil.mehta@huawei.com>
 <20231009112812.10612-3-salil.mehta@huawei.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20231009112812.10612-3-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: FqpYe2ZBbVvP

On 09.10.23 13:28, Salil Mehta wrote:
> CPU ctrl-dev MMIO region length could be used in ACPI GED and various other
> architecture specific places. Move ACPI_CPU_HOTPLUG_REG_LEN macro to more
> appropriate common header file.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/acpi/cpu.c                 | 2 +-
>   include/hw/acpi/cpu_hotplug.h | 2 ++
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 19c154d78f..45defdc0e2 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -1,12 +1,12 @@
>   #include "qemu/osdep.h"
>   #include "migration/vmstate.h"
>   #include "hw/acpi/cpu.h"
> +#include "hw/acpi/cpu_hotplug.h"
>   #include "qapi/error.h"
>   #include "qapi/qapi-events-acpi.h"
>   #include "trace.h"
>   #include "sysemu/numa.h"
>   
> -#define ACPI_CPU_HOTPLUG_REG_LEN 12
>   #define ACPI_CPU_SELECTOR_OFFSET_WR 0
>   #define ACPI_CPU_FLAGS_OFFSET_RW 4
>   #define ACPI_CPU_CMD_OFFSET_WR 5
> diff --git a/include/hw/acpi/cpu_hotplug.h b/include/hw/acpi/cpu_hotplug.h
> index 3b932abbbb..48b291e45e 100644
> --- a/include/hw/acpi/cpu_hotplug.h
> +++ b/include/hw/acpi/cpu_hotplug.h
> @@ -19,6 +19,8 @@
>   #include "hw/hotplug.h"
>   #include "hw/acpi/cpu.h"
>   
> +#define ACPI_CPU_HOTPLUG_REG_LEN 12
> +
>   typedef struct AcpiCpuHotplug {
>       Object *device;
>       MemoryRegion io;

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb
