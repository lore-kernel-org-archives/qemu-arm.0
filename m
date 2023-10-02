Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1627114ejb;
        Mon, 2 Oct 2023 16:25:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6dl9EaP153HewxhtupZ2yxSwIIDfMzi3ElTtE92YMBExnuAq1h46YQSCKT08BRGLFMYmu
X-Received: by 2002:a25:d381:0:b0:d81:89d4:ffd9 with SMTP id e123-20020a25d381000000b00d8189d4ffd9mr676475ybf.31.1696289124894;
        Mon, 02 Oct 2023 16:25:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696289124; cv=none;
        d=google.com; s=arc-20160816;
        b=ZgDQ5B3i1qiugsGq5uTHP5NZGtpXmmZmQLnzI1ZyVCTIabmOKvuj9vK7uLA9J4nWBF
         VLZVTehiXpELe4bzsg7eDqituxRJ6YeXqAzjYHr+MbHWQ/M/l12xOmjAPJLBh6tSWATH
         ykARmibSj57Gz8M3WzoNIsFvrmhPVViibvmjyGwR/yLSbTcy0SYAZ12iwynrzsLxiUoD
         0QMNE8CPVH/BjzbS3IFkFdABh8g817LahBA7yUCgu6HYAT7xzJATwPPjWSkFOPYG+GpU
         6RILTdQ1UtRhbIiX5NiASZlTuHfxF2RFTL1xeXXJTaxmLYSsCafkmudda1OyqgC8/NJf
         BHkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=09sAV7Zg1QggcLvG8Ic2iWuh1IUbW2ZGEDw+h086a0Q=;
        fh=UoUFvcIH1Llqwj9lcubayb9wLqiblQuJi8py3jS56vc=;
        b=I+jawxXpXOcjAPfxGSgeWSi3JohA59+CSYuaMguCTCLgd+iN7etmgayT82AbTp/P6A
         T4lTbZ6DEshnBcW7ekfO0Lif534DvOTHgMig1iWa0E2oI7qbzHc0E8lksJS/sXb/+d35
         eQNLwzbLtvneJiyYEOKdWz1LC6vO+LwZKWOq9aAZnBisa+ZG9Mj9l7IrfCEbE2FVw+Ye
         2p3nWCOYkoXBDrRxXCXlaMCV3PuORqNM5aD1+zmdel/199GiszUKfTwR7fdCiMS8pqQv
         P8FzaAq4Zn+icafTo0i+Zk+O740EYPgPdW3p3jU9CZ4sAfPeLgcDjEKsO5cLX7TySYqi
         hpRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QDakutgz;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id a126-20020a25ca84000000b00d8662708f39si27903ybg.505.2023.10.02.16.25.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 16:25:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QDakutgz;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696289124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=09sAV7Zg1QggcLvG8Ic2iWuh1IUbW2ZGEDw+h086a0Q=;
	b=QDakutgzKoDtupxVTZnuPGEvc6+7QoHpgsq7sHVcBDd3XKFgSgnIhFjOXSs9DfEAQsktRU
	AtB14q1Z5Yw/q+ijU15+rTY3oUWu2b1aoccH9RTVhScIIo9DAutKfwCJaX4IK676Oh1jlV
	UThk4S2B7C86kQmz0gAge5msOapqoA0=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-6AY82-SMN32LE8h-vz_Y1g-1; Mon, 02 Oct 2023 19:25:23 -0400
X-MC-Unique: 6AY82-SMN32LE8h-vz_Y1g-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-692a9b68f1aso205341b3a.1
        for <alex.bennee@linaro.org>; Mon, 02 Oct 2023 16:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696289122; x=1696893922;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=09sAV7Zg1QggcLvG8Ic2iWuh1IUbW2ZGEDw+h086a0Q=;
        b=qOjoEjl5emO80uDp2/Q+jTzc504rUo2JdG+oe4j6rTs/eBEET4Ey7o3UJjumuY+IAK
         sZMeFdI8aDc3OIQZM7A78ypx0mguFdg7C/GI187y2bbXrtkd9Vt4WD0AKMSM3ugKBbYm
         hVWz4oeN1zSPNqOhRJn7ivB+zW1PsvFVLJbhgz9xXrvW2hjuezvSUMcJlqu0k8uTNo0g
         QCbC9DVuEnwNDMB5k8BhlzogZ/dKvAlOeWefYhLVmatvt6j6N1Zf06lpHVeISMIL++J1
         uL4+RMGaXxRHY6uexgzeXzQUXubLzBCpCZmi041NEb19DEqA7qphymd6fak2xhCVuPWU
         16Cw==
X-Gm-Message-State: AOJu0YzflbVvZRngZ9EQZ62d3VTIcq0GvWiTpdunN7K+xOpeCw2ltBJF
	TPTG0eUi/Ujc4seV1NJGHDZs5MqjkwBs4SnbXaK1LmYFMUXYO4TRG4T1Ps+tJ0/6U2KulxkCAnq
	r/0WNzqj+yrOdwx1h
X-Received: by 2002:a05:6a00:3a23:b0:68f:c2f7:cef0 with SMTP id fj35-20020a056a003a2300b0068fc2f7cef0mr1634172pfb.4.1696289122057;
        Mon, 02 Oct 2023 16:25:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a23:b0:68f:c2f7:cef0 with SMTP id fj35-20020a056a003a2300b0068fc2f7cef0mr1634160pfb.4.1696289121751;
        Mon, 02 Oct 2023 16:25:21 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id f20-20020aa782d4000000b0069343e474bcsm33981pfn.104.2023.10.02.16.25.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 16:25:21 -0700 (PDT)
Message-ID: <1269fcdc-0b14-2449-2623-9de2948f81fa@redhat.com>
Date: Tue, 3 Oct 2023 09:25:09 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V2 03/10] hw/acpi: Add ACPI CPU hotplug init stub
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com,
 oliver.upton@linux.dev, pbonzini@redhat.com, mst@redhat.com,
 will@kernel.org, rafael@kernel.org, alex.bennee@linaro.org,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 karl.heubaum@oracle.com, miguel.luis@oracle.com, salil.mehta@opnsrc.net,
 zhukeqian1@huawei.com, wangxiongfeng2@huawei.com, wangyanan55@huawei.com,
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
 linuxarm@huawei.com
References: <20230930001933.2660-1-salil.mehta@huawei.com>
 <20230930001933.2660-4-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230930001933.2660-4-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: RgQL9WxHI/t+


On 9/30/23 10:19, Salil Mehta wrote:
> ACPI CPU hotplug related initialization should only happen if ACPI_CPU_HOTPLUG
> support has been enabled for particular architecture. Add cpu_hotplug_hw_init()
> stub to avoid compilation break.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/acpi/acpi-cpu-hotplug-stub.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
> index 3fc4b14c26..c6c61bb9cd 100644
> --- a/hw/acpi/acpi-cpu-hotplug-stub.c
> +++ b/hw/acpi/acpi-cpu-hotplug-stub.c
> @@ -19,6 +19,12 @@ void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
>       return;
>   }
>   
> +void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
> +                         CPUHotplugState *state, hwaddr base_addr)
> +{
> +    return;
        ^^^^^^
> +}
> +

I guess the return is the outcome by following the pattern of other functions ;-)

>   void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list)
>   {
>       return;

Thanks,
Gavin
