Received: by 2002:a17:505:e96:b0:1be9:327d:8ee3 with SMTP id w22csp146310njz;
        Wed, 16 Oct 2024 22:35:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVrlwQ4xHGqa9+L/3rC1mOKXL3vQNQLtvqbo3CKuFImu2pf2j4Fjq+BnWuq7HCC9HYffKyNowetnUG7uw==@linaro.org
X-Google-Smtp-Source: AGHT+IH0hT9RmbI5wT1qLn+FK5RA8779tXkAoEYrix6lFkYlQv0CJfPa+CoU0SEvLAXi7UC1u8/D
X-Received: by 2002:a05:620a:44c1:b0:7b1:1269:44b4 with SMTP id af79cd13be357-7b11a37957amr3074017085a.36.1729143319019;
        Wed, 16 Oct 2024 22:35:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729143319; cv=none;
        d=google.com; s=arc-20240605;
        b=SIzsnL8OdLCXLW8toPlIpR9StbW4TpJaCBY/x3vlnvRpHH+UuPqMTv80l3skShkhOG
         43EMQFawiI8oHFex/WizuFWm5HKsH4ktz3qj6GpfrRH3tmAAJpzpzM1ulEe9vxRcUDWd
         fZdaQx5rqRyP3L83PphHBmomTafjAJm8Yqsq4YWYT7dtuTUBhfVTiEuB0iKrmBdXk6uQ
         mLB/Ih9IFymxGyZ2KyMbz4KNMjgls8AViojOKRlOYvfSwjTJKc7kOMXpyt3T2hVMwqGK
         jY7MVFN4c2IhCHpUpnBuuteCYR0J3NLoGNsg5R9toI0HDz9vNzCCLXbHGiTI0J6AXUxW
         tLVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tv63YOIP9q8YGBw2rs4krQFFKyf4BlLlIOosdPx8iJk=;
        fh=b35cTTVQXKEWuk4G+Ii+cQtlWv34VVtrAZrE4cWD1sM=;
        b=cOEC59wFBj6ROuhBAN1kJMEU1vpKs/6bu/E/HIueavMd8Ls7e8XMNKQ1c/RoFEj9f1
         J7KAm/YThApovATjjMwKXl8MAcent2np8E931Mdiff+y/LYv6eKDmXcHohHtVMRKktMe
         NT7F9OUx4h8Dvs3xhrtr0Jf50tCUnexG7L6vJH+n+29dlN6bnB2J/jzEZtSwlc/g55ha
         OvvCMaX4yTc+G+WokzDwepN2lkHC2Y8H6grHGTHCvmxTM2nwrNAuu3AbTJWGow5EZtN7
         HW03dHm6RGLS//ixb93q4rTH/Dhnia4CcI2zJuqG7aJnXtPDWkEoEzzTad9JyuaTuQZA
         S5uQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QLaUBHoh;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b1363d73f4si508825585a.227.2024.10.16.22.35.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 22:35:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QLaUBHoh;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729143318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tv63YOIP9q8YGBw2rs4krQFFKyf4BlLlIOosdPx8iJk=;
	b=QLaUBHohJ72iSV0jKBWAbMVlMWZJ4wVvgyjB7jiGeCRuRjuIl28mHoMlnanKYMUDy8zRDb
	N2ZNqCbeY4/tTRVdRg8m6zh8/5HuJQ1ySb+uH1mPsgNtq8eD0WsMWVy2HK1Y8RBexZzhQh
	+73264QYGOoHB2xUHhoMCexJA060Q/Y=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-4PWJn4E5Mz6EIBGkVoouIg-1; Thu, 17 Oct 2024 01:35:17 -0400
X-MC-Unique: 4PWJn4E5Mz6EIBGkVoouIg-1
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-5eb584e7aacso478963eaf.0
        for <alex.bennee@linaro.org>; Wed, 16 Oct 2024 22:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729143316; x=1729748116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tv63YOIP9q8YGBw2rs4krQFFKyf4BlLlIOosdPx8iJk=;
        b=JYMoOeJU4Nio4NvpXZPWYfA3Jx4DMCkFhJOFp2eu2JLfbn9cVFqv09v/hWYXR0pduS
         LDKr+ofGTQKmCOXUmVYB1Dr3H9mvMplsLpVYY5L/2Sd4Lm6NtzNkHWFBZdi1Rf90vsdI
         CBGMmzQVmwoEKWZoDBIguHMxvctWFSBOhILHG/DFhxYtkBNwJHL41EAjtqtiqh5vccnw
         d8HP6aki/IgCMrDclzZCmUzjhrtzaEW7/Ew5+gg7U3uBUY+PKnlQO9JUuQOCApy61bQc
         nztuzqDWoDOvrzj04rzZXr7T/bzHal7vHLY/JPpErKDYl7aUE3BmSWsRvxCGDPPZD7aX
         9bSw==
X-Forwarded-Encrypted: i=1; AJvYcCXSQCKWBkFEftCU7Vws/89PDAxoog/d+vd1e4bpsdsjmbwo7e3wOYZ1PlkchazmbKA4QqjxTo5YC2Q3/Q==@linaro.org
X-Gm-Message-State: AOJu0YyxJsjzbwerZRXs5rHeCiSw0uhgvqFZA0cbafwyteRFSZFZdgHm
	+ryAU8J+hBN+8OZ+/jQqXpM5UP56S9Dde34CfeMfLYOLJ+TrIfh+Az3NiZIY7pBdSVeJKFRM8pU
	iUd4Qfu+0oQWdujqEXqelVlC1ZC+Sm+a2uzrNazLOMMT+tqti4rsNxQ==
X-Received: by 2002:a05:6358:7e49:b0:1bc:d1b9:ccc8 with SMTP id e5c5f4694b2df-1c32ba78da2mr1393201455d.14.1729143316619;
        Wed, 16 Oct 2024 22:35:16 -0700 (PDT)
X-Received: by 2002:a05:6358:7e49:b0:1bc:d1b9:ccc8 with SMTP id e5c5f4694b2df-1c32ba78da2mr1393199255d.14.1729143316200;
        Wed, 16 Oct 2024 22:35:16 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.54] ([180.233.125.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77370a83sm3981518b3a.5.2024.10.16.22.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 22:35:15 -0700 (PDT)
Message-ID: <a45bd567-3570-40e6-8c59-070199512496@redhat.com>
Date: Thu, 17 Oct 2024 15:35:01 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/4] hw/acpi: Initialize ACPI Hotplug CPU Status with
 Support for vCPU `Persistence`
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com, will@kernel.org,
 ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 rafael@kernel.org, borntraeger@linux.ibm.com, alex.bennee@linaro.org,
 npiggin@gmail.com, harshpb@linux.ibm.com, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, shahuang@redhat.com,
 zhao1.liu@intel.com, linuxarm@huawei.com, gustavo.romero@linaro.org
References: <20241014192205.253479-1-salil.mehta@huawei.com>
 <20241014192205.253479-2-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241014192205.253479-2-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 7rGTM1Ok2FkO

On 10/15/24 5:22 AM, Salil Mehta wrote:
> Certain CPU architecture specifications [1][2][3] prohibit changes to CPU
> presence after the kernel has booted. This limitation exists because many system
> initializations rely on the exact CPU count at boot time and do not expect it to
> change later. For example, components like interrupt controllers, which are
> closely tied to CPUs, or various per-CPU features, may not support configuration
> changes once the kernel has been initialized. This presents a challenge for
> virtualization features such as vCPU hotplug.
> 
> To address this issue, introduce an `is_enabled` state in the `AcpiCpuStatus`,
> which reflects whether a vCPU has been hot-plugged or hot-unplugged in QEMU,
> marking it as (un)available in the Guest Kernel. The `is_present` state should
> be set based on the `acpi_persistent` flag. In cases where unplugged vCPUs need
> to be deliberately simulated in the ACPI to maintain a persistent view of vCPUs,
> this flag ensures the guest kernel continues to see those vCPUs.
> 
> Additionally, introduce an `acpi_persistent` property that can be used to
> initialize the ACPI vCPU presence state accordingly. Architectures requiring
> ACPI to expose a persistent view of vCPUs can override its default value. Refer
> to the patch-set implelenting vCPU hotplug support for ARM for more details on
> its usage.
> 
> References:
> [1] KVMForum 2023 Presentation: Challenges Revisited in Supporting Virt CPU Hotplug on
>      architectures that don’t Support CPU Hotplug (like ARM64)
>      a. Kernel Link: https://kvm-forum.qemu.org/2023/KVM-forum-cpu-hotplug_7OJ1YyJ.pdf
>      b. Qemu Link:  https://kvm-forum.qemu.org/2023/Challenges_Revisited_in_Supporting_Virt_CPU_Hotplug_-__ii0iNb3.pdf
> [2] KVMForum 2020 Presentation: Challenges in Supporting Virtual CPU Hotplug on
>      SoC Based Systems (like ARM64)
>      Link: https://kvmforum2020.sched.com/event/eE4m
> [3] Check comment 5 in the bugzilla entry
>      Link: https://bugzilla.tianocore.org/show_bug.cgi?id=4481#c5
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   cpu-target.c          |  1 +
>   hw/acpi/cpu.c         | 35 ++++++++++++++++++++++++++++++++++-
>   include/hw/acpi/cpu.h | 21 +++++++++++++++++++++
>   include/hw/core/cpu.h | 21 +++++++++++++++++++++
>   4 files changed, 77 insertions(+), 1 deletion(-)
> 

[...]
    
> +/**
> + * acpi_persistent_cpu:
> + * @cpu: The vCPU to check
> + *
> + * Checks if the vCPU state should always be reflected as *present* via ACPI
> + * to the Guest. By default, this is False on all architectures and has to be
> + * explicity set during initialization.
       ^^^^^^^^^
       explicitly

> + *
> + * Returns: True if it is ACPI 'persistent' CPU
> + *
> + */
> +static inline bool acpi_persistent_cpu(CPUState *cpu)
> +{
> +    /*
> +     * returns if 'Presence' of the vCPU is persistent and should be simulated
> +     * via ACPI even after vCPUs have been unplugged in QOM
> +     */
> +    return cpu && cpu->acpi_persistent;
> +}
>   #endif

Thanks,
Gavin
