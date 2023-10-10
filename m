Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp294767ejb;
        Tue, 10 Oct 2023 00:34:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkmo+nC0I9Q0RK9X+BKP3G9ZfN1Wg0w6dHA2apt0T0HXFRL1akR+sPNAlFHRbH5RKGuw7n
X-Received: by 2002:a05:622a:1a25:b0:403:e895:155b with SMTP id f37-20020a05622a1a2500b00403e895155bmr23361319qtb.34.1696923275910;
        Tue, 10 Oct 2023 00:34:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696923275; cv=none;
        d=google.com; s=arc-20160816;
        b=qnYkaXnjpOdS2eEg92HKY83HzlHEOJe0OFe0eOENpuJv0GEhQiM4u8X0ZM6aVBlfD7
         O09t9BVyTvxavig4E8VFM5Dj4Nejj8HmXGFWjUNHiHnSWfj7B6HQWWnBOoSHiajh75lU
         ONM/SACtc54rhR2ZqPthTsdTFgndwOlAhi8E8TsRNzGKq2/yPQlMRKqaoxQnnq8YMi83
         a6xXQgHtgGWfxRuc+pS3Eume3DYkDjpdJcaZ9XnhQ/eNl8xJ4BARVXKYt2Nxxezo2/vR
         Dqil5QRJuoCV3iJjL1AYEXZ5e9fPK/wmQ9/gBnY2iMzzCg5dopBW5vF2whCTDLPjh00L
         cd1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VoOVTQEYghYJfkMhPVf3yW590Z5y0rGh3KvHCnyd/dY=;
        fh=HQu76LFN0DbKXHr60vGnzTmi359RrU+EPC8eBDHkPTc=;
        b=uWnY5w0ZLzkt3HeckquvKObDv8+ii16f8xxsIEunGsNffJ6N+UY1VB6j/JvnWfSL0K
         uDv+FLOxNDt0SYPqTIICp4fN19AJldZ9qpjfr6wU2civTdmjMPy27DE2QmRIM8el2kXr
         X/fK/gFGYK5HEwTzekAgjK0oneVr4DnTJ71tCMYdiH5tIM0pFR50qamz4voAVn4Oxd3U
         83OhDX6DoFZ0Q9mWKq60WiYH5GBF2L4VHUTbXeTypPBFavYnX/z3ppo2O/dTgLay+/46
         4z9raWOuqL4H9CumQLKRGAcUaTkaRzZFHNyXzvZ71ZcNEBnl3ddF1dsOBI+dD0XNfyaW
         vhLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HbWqMrYm;
       spf=pass (google.com: domain of shahuang@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=shahuang@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <shahuang@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id p20-20020a05622a00d400b00417b0de7881si7421938qtw.527.2023.10.10.00.34.35
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 00:34:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of shahuang@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HbWqMrYm;
       spf=pass (google.com: domain of shahuang@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=shahuang@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696923275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VoOVTQEYghYJfkMhPVf3yW590Z5y0rGh3KvHCnyd/dY=;
	b=HbWqMrYmOgAiB3m5T6yQrbFE+eRB8gpNV4hqNw/5InnYFLDTUK3LmM1yNT9EFS05KZ8vDr
	PHp+rNOAKGk83lIsoXS7sUc4+V91foXs38jeZ27nPrBvFm680maq3OR6NuMoq+1lrOlE1F
	uuXHzpBiYX9kXCZkN/+pMwNWLH9AcYY=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-Z0zmIm5mOeG5kXn1Gt7-fw-1; Tue, 10 Oct 2023 03:34:32 -0400
X-MC-Unique: Z0zmIm5mOeG5kXn1Gt7-fw-1
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-690be60b13bso1095405b3a.1
        for <alex.bennee@linaro.org>; Tue, 10 Oct 2023 00:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696923271; x=1697528071;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VoOVTQEYghYJfkMhPVf3yW590Z5y0rGh3KvHCnyd/dY=;
        b=pqFedZYTNjW7FZXPUax7cUeyc3YG5uqhgVQ94ygDs1xCCuBNPvDRhs1XMw+kfoxPYt
         36tIaaZwCu6AFRSTHYjxJcg+qYmmw2WFJFr10LW+wttvZYnSxAUO17gemr+4PRU0kahd
         ISua6AE3eRwKPfWy2Qn+ueLFiGaK0h6gYkrEkY6L87PxpszCkTlvn+CUzUIP22aMZ9L7
         VclJcilgn45nA6Ok68vus25pPBb2AKWDPhdgzlsJO7dM9L3CJ04/U9Z1v529PKUZwXtN
         3yZVcjLVqlldCZQjKV6Yylka6koGMbwhCjMNHrxBkMHI1sw5ySJCKH8Dxj9lKniIpVPl
         dJlg==
X-Gm-Message-State: AOJu0YygnQPzOjEsgwrh6UCqH1MVJhbaoZ739ThwcAKCMdwgT/9WY+qY
	JK6pxWbgvvw74Y7TVkoSPWaiv/4n7XcByswGLmBOXrPRkl1EFLmpeLn3erZL/SZmQLx7w3xBOio
	4UeUz+qg7m9pr7Uoc
X-Received: by 2002:a05:6a20:9393:b0:16c:b95c:6d38 with SMTP id x19-20020a056a20939300b0016cb95c6d38mr10342538pzh.2.1696923271375;
        Tue, 10 Oct 2023 00:34:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:9393:b0:16c:b95c:6d38 with SMTP id x19-20020a056a20939300b0016cb95c6d38mr10342507pzh.2.1696923271097;
        Tue, 10 Oct 2023 00:34:31 -0700 (PDT)
Return-Path: <shahuang@redhat.com>
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id g2-20020a639f02000000b00588e8421fa8sm9572129pge.84.2023.10.10.00.34.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 00:34:30 -0700 (PDT)
Message-ID: <e2141d6a-7627-d092-3930-76ba91a77e7f@redhat.com>
Date: Tue, 10 Oct 2023 15:34:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V4 02/10] hw/acpi: Move CPU ctrl-dev MMIO region len macro
 to common header file
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
 <20231009203601.17584-3-salil.mehta@huawei.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20231009203601.17584-3-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 6F4umPzMeHWl



On 10/10/23 04:35, Salil Mehta via wrote:
> CPU ctrl-dev MMIO region length could be used in ACPI GED and various other
> architecture specific places. Move ACPI_CPU_HOTPLUG_REG_LEN macro to more
> appropriate common header file.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
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

-- 
Shaoqin
