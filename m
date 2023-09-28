Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2206296ejc;
        Wed, 27 Sep 2023 17:19:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHItQ9SeNmlYU0VFJTznuf8yRYn1eq5fSkT94I8kVQFLoDD53UVRqW4YjTa+LZNM8Uq8N01
X-Received: by 2002:a0d:e645:0:b0:578:5e60:dcc9 with SMTP id p66-20020a0de645000000b005785e60dcc9mr3923107ywe.10.1695860399375;
        Wed, 27 Sep 2023 17:19:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695860399; cv=none;
        d=google.com; s=arc-20160816;
        b=Zjd+Lqq/Efqykgp5o1kX4YTfd/lqdqEljmIFsZd9TLyzURy++bdLmIm3wQ8IuJ5EX5
         wCdmO6sO86Obz/xnLBnLIyx6FMdEPyyge7Zxaw+oyh9CG7N13Bh8/JnLXKB/4bQBhU7q
         C3vdS26MtfBE4bi8V8H886fv1s+jAJz81U8ctJUAsbgPBCTsCitX90ZAD8NAkXUV1eB4
         fRB7ju21fbw91Vd7tz7taXnVMog/3dev3nAEQ0FNSs8RuW2/dmUmKn2q8SsQ18QlhZlg
         tpFwXpf8sgQry54jLNoTzrCpqpNPMR6u/Wh35+6yB2xazB+rjUFEnsO+ZIiKajAtqgGS
         s6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vti1iKlQh+xqVfVl8OL6V2rWcMCL1f9cRENDpFGOnus=;
        fh=fO+ncAaxY0Wf5Oiu0zeLu9be5DWOx71LYjyGHoG8Yc0=;
        b=PLWYLyNzhat9Cl4HrCDJUZlFx/rExDwnSfMxKPj7lY6RjrrADvQS+Gub7kKhtm8mGv
         uQjk7LTDrN/94G5GVdAAXV/xhg0F1RdYkSuSgFlriIQW3fFPdeChnkM2f/0BTsMNBiy/
         SwgEmUtfClmBFJDMp0mGg/C+U2CUsza5bupU6sAL+d1TIior/3hAg149ns51V5aqCXke
         bZ3AuIXiDnsoG8AerwCBl4i77UgG70/wcNpTOWmsNUgofdBLLjjV/tqVEA3DXICbU+Rc
         NPa39C9wnZQ8eJRszNsd8BvqsT5wzhmtz9/8oygqs3tA0H1kQ4HnK8QlgsNuSM7K/RAv
         Rt4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L9aOyMxh;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id q68-20020a81b247000000b0059be7cfde94si6164107ywh.219.2023.09.27.17.19.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 17:19:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L9aOyMxh;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695860398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vti1iKlQh+xqVfVl8OL6V2rWcMCL1f9cRENDpFGOnus=;
	b=L9aOyMxhqZzSXdsaoQil11D6V0OJZafEACHXLxfu0Y+5wDnc1n/Zz5/CnHpy/WVwcOWpHr
	flP458sSuG6yS5c6OfP4v20eEoaynJ+EY5fWpCUdZdY/mGTFHYaMxuz4Gn6+F8sOHPxOW0
	3IdF5frJ2h/sWV2SYldDxnOuDCSe+ds=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-Vl0_02xePgCWd0R-GU2FAg-1; Wed, 27 Sep 2023 20:19:57 -0400
X-MC-Unique: Vl0_02xePgCWd0R-GU2FAg-1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1c5fa742182so121306535ad.3
        for <alex.bennee@linaro.org>; Wed, 27 Sep 2023 17:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695860396; x=1696465196;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vti1iKlQh+xqVfVl8OL6V2rWcMCL1f9cRENDpFGOnus=;
        b=TaIN3wXzT2iq4npNnxJWKL/n+Ie+M5r3YAtmuPWQuSW9aPcd+faXAwceIYmZlRkTq6
         TBBztT4YI7UXe2dZSbF2ZFYIKa9cAzYLxhk38VWFUzn3YGBYQ+f0Q2eiHc2jSCraCawg
         E0TjVmSyqMbBjOBB8VeCcTg5oVQ04BiS2eXy9uH3uqF4zjpXZKtEhgZtIME6ZvEc5Zh+
         3yH9Lxuxb08elpTGXvTHMWOkgtdru6gfZL8DhbYvQO7pypTA0UdRSkFOxsLH5Khlvzin
         5trsgSEb3bBgx4NGIEQuE+Vr3qEQLpY0aUCAZvhmgnL8jAS6HSiPW7sIDoN1WdiaOMUU
         WvaA==
X-Gm-Message-State: AOJu0YyC7bBLiVxT6fna8T3gnlMe1yfaXW81AGFSwtDBbm/m/9hej4OT
	093tuBxiST8i/DJA4bajKlTGSFbe3dxcdIaJ6XCjSx18rm+X9LiXSyprkK22ap14ZZ7FaRhzWV8
	46X4zThi9/6oWVjJ1
X-Received: by 2002:a17:902:ced2:b0:1c6:a38:ebcc with SMTP id d18-20020a170902ced200b001c60a38ebccmr3760808plg.43.1695860396218;
        Wed, 27 Sep 2023 17:19:56 -0700 (PDT)
X-Received: by 2002:a17:902:ced2:b0:1c6:a38:ebcc with SMTP id d18-20020a170902ced200b001c60a38ebccmr3760767plg.43.1695860395892;
        Wed, 27 Sep 2023 17:19:55 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id ix22-20020a170902f81600b001b05e96d859sm13753816plb.135.2023.09.27.17.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 17:19:55 -0700 (PDT)
Message-ID: <a478929d-9b43-4e87-c16a-e33f82aa20da@redhat.com>
Date: Thu, 28 Sep 2023 10:19:41 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC V2 09/37] hw/acpi: Move CPU ctrl-dev MMIO region len
 macro to common header file
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com, will@kernel.org,
 ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 mst@redhat.com, rafael@kernel.org, borntraeger@linux.ibm.com,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-10-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230926100436.28284-10-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Mi58fDQCkSKy

On 9/26/23 20:04, Salil Mehta wrote:
> CPU ctrl-dev MMIO region length could be used in ACPI GED (common ACPI code
> across architectures) and various other architecture specific places. To make
> these code places independent of compilation order, ACPI_CPU_HOTPLUG_REG_LEN
> macro should be moved to a header file.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/acpi/cpu.c                 | 2 +-
>   include/hw/acpi/cpu_hotplug.h | 2 ++
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

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
