Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2892663ejc;
        Thu, 28 Sep 2023 16:36:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUQj/pU0YvyxyeIFv1ByA1VgSll8iNBDiPqUuVY1I2+5CL0ytxl7YTgp8Vkoj9/rsfqkiC
X-Received: by 2002:a0d:ebd6:0:b0:592:9035:8356 with SMTP id u205-20020a0debd6000000b0059290358356mr2985880ywe.26.1695944163474;
        Thu, 28 Sep 2023 16:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695944163; cv=none;
        d=google.com; s=arc-20160816;
        b=spktS7CwSrFkU3uA9CFzLBXZ15sltkuZ1SJMG8funMra/UxhtVFomswlQREPmol6fn
         ozdr/LLB/wVPyEUq+9SmcHAaCgJpCz70mOX453feYpYIhPJ5ld5m+Gr8znauWKGDFPL9
         d+Cc7B6deaOfQ1Mh5lSP0/7noq3aI0hgz2Vv93vWgVHzAWF8u3r88CZLAfjO7krdnr9N
         wqvUgx6lbPmyG+8Y7aOJDPzatzYyx2IOl73epQ0WMg+UsBSb5PeBcypky5V22nBVfgag
         Glhv8i6yXzjfNPU+qBpeUOOWIBt1eY2ciStcsSlC4KfjBqydC5Lep782xkbC1ATVWrB8
         b63Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/NhHiTPhIHts6fXGHDavroBfU4qdkNdxMJ5VMdhZNFE=;
        fh=fO+ncAaxY0Wf5Oiu0zeLu9be5DWOx71LYjyGHoG8Yc0=;
        b=y6yxpP2WlAqdtRzvKuT8XRbSYwjdDstqCp6lRp1utE12A2EwabVoNXqcXqVdPnN35E
         pb7osm2ESwXQ78/idvRrlNJxFAFIi+eGza7Mhpa+vthDmOzp+2MJMFpnI1kPjdyrHIRs
         KsHLrVSxp0RJO2XcuezfPkGG3VdhFSTWKGsHK3Rhua9BSTD4cL8ZuYxejIY7ABXotNiW
         HVLuVSOprBLQsJ/1rW6t+6OdUhGv57qOYAWAYamklqlxzZ1IayGzAUqPtV6Nn/z6AGWh
         Qj1ARWOr08fY+KHNwIpCQmyfSHNk3usVFlSk1YgFQI4xarnhJvohNJdc7cEm7kae3NIj
         S0Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PujATFBL;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id z14-20020a81aa4e000000b0058694b689d9si7451368ywk.444.2023.09.28.16.36.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 16:36:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PujATFBL;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695944163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/NhHiTPhIHts6fXGHDavroBfU4qdkNdxMJ5VMdhZNFE=;
	b=PujATFBLUlIXI4tHqljnZYsn/UuDgF7NfObjGEYbx18a+fqBRathLgLWO1xayz+u2t4wmD
	6ILlEAF3gcMPiD5dGHdy+CfT2SXz7dhHc95d66zDHhbOZzGx89f2XjLkpZvnQ6XFF8ZTI5
	xbdBMazMY20ghUC+ZH7xBdX8AsMYl84=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-5hzmbamXMk2Lc2xpenlW-A-1; Thu, 28 Sep 2023 19:36:01 -0400
X-MC-Unique: 5hzmbamXMk2Lc2xpenlW-A-1
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-5789f2f13fcso13200470a12.3
        for <alex.bennee@linaro.org>; Thu, 28 Sep 2023 16:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695944160; x=1696548960;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/NhHiTPhIHts6fXGHDavroBfU4qdkNdxMJ5VMdhZNFE=;
        b=j7NqYTkPqNPuKndZQ5tf0QTr/DdUmbY/n3D6OKEej3WlNfuxGMGnb8sOxkHCtMIRaP
         mVE5ClSBtoKvb6P2cK1cYTYGsDJKnrwiCjq0nOHDLsoiI+TqntpUSoc5VBI5X3coHYsT
         bkmr5O32YqhMmBKVvPdqYq6u2jpfC2Hu/TBYBJ4mY84GQ9kEmqjl0wauUmIQRBWjpZ2X
         PiVph2edruxDSz9B5zBuv9wxXOnEDAOTC2Tte9oA2j+oeCwIee+qcd991DA8Cn4RAHtI
         dR0rFajI7GCgOsdb/ov3R5P/oH/afvEv+LyVfBizcvFjQ0hAer60xjO3WaRPnY22oDoL
         whDw==
X-Gm-Message-State: AOJu0YyM+i60oVJb019gyjBjwjzqsYsyM3ZkhamXvtrwhHTIgq2lDqIY
	ANVj89UxXjoHwb/44dEmB3PND5dqyY9Wr936qbx+y8yoOTAoyxUqAmNMM81JDO6l+/0JYWcR96J
	C07HuwKFvRzkTbVMh
X-Received: by 2002:a05:6a20:4292:b0:157:b453:dbb9 with SMTP id o18-20020a056a20429200b00157b453dbb9mr2907372pzj.6.1695944160288;
        Thu, 28 Sep 2023 16:36:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:4292:b0:157:b453:dbb9 with SMTP id o18-20020a056a20429200b00157b453dbb9mr2907335pzj.6.1695944159967;
        Thu, 28 Sep 2023 16:35:59 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id k9-20020a170902c40900b001c56157f062sm15541080plk.227.2023.09.28.16.35.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 16:35:59 -0700 (PDT)
Message-ID: <14b334c1-0b5f-7f56-6f35-809925085dcf@redhat.com>
Date: Fri, 29 Sep 2023 09:35:46 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC V2 20/37] hw/acpi: Update GED _EVT method AML with cpu
 scan
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
 <20230926100436.28284-21-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230926100436.28284-21-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: jxmFwtUyj2Ke

On 9/26/23 20:04, Salil Mehta wrote:
> OSPM evaluates _EVT method to map the event. The cpu hotplug event eventually
> results in start of the cpu scan. Scan figures out the cpu and the kind of
> event(plug/unplug) and notifies it back to the guest.
> 
> The change in this patch updates the GED AML _EVT method with the call to
> \\_SB.CPUS.CSCN which will do above.
> 
> Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/acpi/generic_event_device.c | 4 ++++
>   include/hw/acpi/cpu_hotplug.h  | 2 ++
>   2 files changed, 6 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index b84602b238..ad252e6a91 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -108,6 +108,10 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
>                   aml_append(if_ctx, aml_call0(MEMORY_DEVICES_CONTAINER "."
>                                                MEMORY_SLOT_SCAN_METHOD));
>                   break;
> +            case ACPI_GED_CPU_HOTPLUG_EVT:
> +                aml_append(if_ctx, aml_call0(ACPI_CPU_CONTAINER "."
> +                                             ACPI_CPU_SCAN_METHOD));
> +                break;
>               case ACPI_GED_PWR_DOWN_EVT:
>                   aml_append(if_ctx,
>                              aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
> diff --git a/include/hw/acpi/cpu_hotplug.h b/include/hw/acpi/cpu_hotplug.h
> index 48b291e45e..ef631750b4 100644
> --- a/include/hw/acpi/cpu_hotplug.h
> +++ b/include/hw/acpi/cpu_hotplug.h
> @@ -20,6 +20,8 @@
>   #include "hw/acpi/cpu.h"
>   
>   #define ACPI_CPU_HOTPLUG_REG_LEN 12
> +#define ACPI_CPU_SCAN_METHOD "CSCN"
> +#define ACPI_CPU_CONTAINER "\\_SB.CPUS"
>   
>   typedef struct AcpiCpuHotplug {
>       Object *device;
