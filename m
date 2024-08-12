Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp656581njh;
        Sun, 11 Aug 2024 22:09:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUN3p1baK70u/KfeJnxqVkARa6X3BEHwvXzhCGLjeizfCWUgQ8Aoumfj31o82v7xVI9WNx6sQJ/OQzWkF3srUrxtAYU84jI
X-Google-Smtp-Source: AGHT+IHPY0YvbM42ihc/QUAzSqVfeATz8ZHtjhkriF53BJwZjeMmz9DAU17Lag5eSmdKGa8kEfby
X-Received: by 2002:a05:6214:5246:b0:6b5:e3b7:46f5 with SMTP id 6a1803df08f44-6bd78e08b06mr102449886d6.20.1723439395663;
        Sun, 11 Aug 2024 22:09:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723439395; cv=none;
        d=google.com; s=arc-20160816;
        b=RqipEcacrEJeCHy9w5VDaQMWexBXT7E1LW8Qqb2jKa3f7E0DNdVK8vtUku788ubpA4
         Ldu3agf4fDsaYQaVCkud59vfv2+kwLut4mn+LImd6Q/ZUiq9QLjoATlhWfOK6nYe39Nm
         OChfU1H89kFmD9PZfDHYsHDg/8FgDP+EIgtxhZtwKbTHIBSgmy5sDvUbA9aOKQn4gmTz
         EjjXduGUQI3igtXTisjllcz2H3feQdcFfVEI3a3rqezO2oE5g+NTPoKcAZJsF0tzuTHE
         UCvxRwFeBzehvMjSNFfAuiSh5IX/ddd/0PXBEXsor2hSkuH306cTUlQGD6tr1nkBe3FO
         1acg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=H1ivEWNhs1z53BitTen3mlLbhlu/8FPyYX1oRe5evH4=;
        fh=JSqbFqe+DW6/Hy50OXdNYG53/rj5XRrY3mxmRRWn1GY=;
        b=oEdkEeLP9ptIDjxQ38YQSYg0esHUzivPZ6WJ8AW1X2AElUy9wcf4cBCjm6RWAnQVEC
         kvPkPm5CFdNqOtgp32EjDSPT9M6yh6LhfRI2y8kVgWm+CNo5UuHzuQJ/CFbxhqi4nh2i
         cq/NjpCndGnLuX2eZFiNRIvNTQxuH9Qwvkko2ZJD9WRvIDPl/HDxPRoT2fbDxepwX98z
         9u0Ug8jboWn0vHolk0a+wkEu2alwD307t6RxvNaISKa83ZWddJyd4L9vErYBfAffSYeC
         sdfdujvJ7K4xL80a74/0MLqJNupGQBeZDj8pBvLSaA0W9fQ3zl/IPF1Dt+pkPBeYJAc4
         qT0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gQ4nAF5B;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4531c265f4csi51875321cf.359.2024.08.11.22.09.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 22:09:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gQ4nAF5B;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723439395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H1ivEWNhs1z53BitTen3mlLbhlu/8FPyYX1oRe5evH4=;
	b=gQ4nAF5BJ/FpoAq+cRZlrVMRvvGMz3jLEGHOfaUgyXrL1j4em5gwEyE+qDs9qhy5dHsYk9
	/RO/io1Pu82ejZ+R7o9INQWyH6QipUYpfLcbiv57uymuOCK84ZFwumj8C3/etlYuQEXTJ1
	WdtCufQzy3LOvuuHKRQfG9Zjv/KGuqs=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-Wksrb7HYNAq1tKVznj8gJA-1; Mon, 12 Aug 2024 01:09:52 -0400
X-MC-Unique: Wksrb7HYNAq1tKVznj8gJA-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2cfe41af75eso5448412a91.2
        for <alex.bennee@linaro.org>; Sun, 11 Aug 2024 22:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723439391; x=1724044191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H1ivEWNhs1z53BitTen3mlLbhlu/8FPyYX1oRe5evH4=;
        b=bHTmT7tzcyRKEjGIGdbuOO6hlJjzfUrfYPNvW2hyzlNy0imCY908qiaYAMlIJptg5e
         LNCmh54N8zFiEg9E0ADpEESEfLUYOzYXTdGB3UBiVegzrVC9jVCvCnusQn1R641cwxFD
         fxZukgfcQGww2JTjB3xouJc/TNFn6gktEqiyRy9PCmfkqHqxwiT35H1Gw6WSggGbxFfP
         uqNW0j/zAbXIK5hNULgy1t740f151/ykdtYAnu64CMy9AXpSKvH145MgCdAlAJj/Lu4w
         KWpWNAnQBLUtQg9/C5xzAJr9qTQsfhRpiid7Brg0ikr5+J8TAYBiufWROAzR5bU3tEUw
         qLWA==
X-Forwarded-Encrypted: i=1; AJvYcCUA+e8gDoZ90LkkuTSSDlclUfNFVp8qy+abCXtFjq0uSjD4hIMyLmqUHJr1n/P1fSVBm7NRAj7vCe0gM2oHzw47/cZhyGTK
X-Gm-Message-State: AOJu0YyAOYADp7l1uqxOuoU9KINWu3Jy5Kl8CbLusa1CIkY4FZWc6Ex4
	YLL6rI0lzHi3b7mUgpQFurRKTMjEXEiF1pS21lM9rCfHgaLpy0AZ6UtsU3p+e3zV8PW9GjKzssC
	mf7IMRinsIH5/HtZzWlE2h6esOHevmRmItbtwwzOm2VVmy6YNsVl8hQ==
X-Received: by 2002:a17:90b:e83:b0:2cb:5aaf:c12e with SMTP id 98e67ed59e1d1-2d1e80671d1mr9642347a91.37.1723439391648;
        Sun, 11 Aug 2024 22:09:51 -0700 (PDT)
X-Received: by 2002:a17:90b:e83:b0:2cb:5aaf:c12e with SMTP id 98e67ed59e1d1-2d1e80671d1mr9642316a91.37.1723439391266;
        Sun, 11 Aug 2024 22:09:51 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.54] ([43.252.112.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1fd0217dcsm3942433a91.54.2024.08.11.22.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Aug 2024 22:09:50 -0700 (PDT)
Message-ID: <a7fa47aa-c960-4897-bcb4-41ec74b72804@redhat.com>
Date: Mon, 12 Aug 2024 15:09:36 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC V3 03/29] hw/arm/virt: Limit number of possible vCPUs
 for unsupported Accel or GIC Type
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
 zhao1.liu@intel.com, linuxarm@huawei.com
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <20240613233639.202896-4-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240613233639.202896-4-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: ew1s8f4k8fUg

On 6/14/24 9:36 AM, Salil Mehta wrote:
> If Virtual CPU Hotplug support does not exist on a particular Accel platform or
> ARM GIC version, we should limit the possible vCPUs to those available during
> boot time (i.e SMP CPUs) and explicitly disable Virtual CPU Hotplug support.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/arm/virt.c | 66 +++++++++++++++++++++++++++++----------------------
>   1 file changed, 38 insertions(+), 28 deletions(-)
> 

Most of the code changes are moving the check between @max_cpus and @max_supported_cpus.
It would make the review easier if the code movement can be put into a preparatory patch
if you agree.

Thanks,
Gavin

> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 11fc7fc318..3e1c4d2d2f 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2082,8 +2082,6 @@ static void machvirt_init(MachineState *machine)
>       unsigned int smp_cpus = machine->smp.cpus;
>       unsigned int max_cpus = machine->smp.max_cpus;
>   
> -    possible_cpus = mc->possible_cpu_arch_ids(machine);
> -
>       /*
>        * In accelerated mode, the memory map is computed earlier in kvm_type()
>        * to create a VM with the right number of IPA bits.
> @@ -2098,7 +2096,7 @@ static void machvirt_init(MachineState *machine)
>            * we are about to deal with. Once this is done, get rid of
>            * the object.
>            */
> -        cpuobj = object_new(possible_cpus->cpus[0].type);
> +        cpuobj = object_new(machine->cpu_type);
>           armcpu = ARM_CPU(cpuobj);
>   
>           pa_bits = arm_pamax(armcpu);
> @@ -2113,6 +2111,43 @@ static void machvirt_init(MachineState *machine)
>        */
>       finalize_gic_version(vms);
>   
> +    /*
> +     * The maximum number of CPUs depends on the GIC version, or on how
> +     * many redistributors we can fit into the memory map (which in turn
> +     * depends on whether this is a GICv3 or v4).
> +     */
> +    if (vms->gic_version == VIRT_GIC_VERSION_2) {
> +        virt_max_cpus = GIC_NCPU;
> +    } else {
> +        virt_max_cpus = virt_redist_capacity(vms, VIRT_GIC_REDIST);
> +        if (vms->highmem_redists) {
> +            virt_max_cpus += virt_redist_capacity(vms, VIRT_HIGH_GIC_REDIST2);
> +        }
> +    }
> +
> +    if (tcg_enabled() || hvf_enabled() || qtest_enabled() ||
> +        (vms->gic_version < VIRT_GIC_VERSION_3)) {
> +        max_cpus = machine->smp.max_cpus = smp_cpus;
> +        mc->has_hotpluggable_cpus = false;
> +        if (vms->gic_version >= VIRT_GIC_VERSION_3) {
> +            warn_report("cpu hotplug feature has been disabled");
> +        }
> +    }
> +
> +    if (max_cpus > virt_max_cpus) {
> +        error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
> +                     "supported by machine 'mach-virt' (%d)",
> +                     max_cpus, virt_max_cpus);
> +        if (vms->gic_version != VIRT_GIC_VERSION_2 && !vms->highmem_redists) {
> +            error_printf("Try 'highmem-redists=on' for more CPUs\n");
> +        }
> +
> +        exit(1);
> +    }
> +
> +    /* uses smp.max_cpus to initialize all possible vCPUs */
> +    possible_cpus = mc->possible_cpu_arch_ids(machine);
> +
>       if (vms->secure) {
>           /*
>            * The Secure view of the world is the same as the NonSecure,
> @@ -2147,31 +2182,6 @@ static void machvirt_init(MachineState *machine)
>           vms->psci_conduit = QEMU_PSCI_CONDUIT_HVC;
>       }
>   
> -    /*
> -     * The maximum number of CPUs depends on the GIC version, or on how
> -     * many redistributors we can fit into the memory map (which in turn
> -     * depends on whether this is a GICv3 or v4).
> -     */
> -    if (vms->gic_version == VIRT_GIC_VERSION_2) {
> -        virt_max_cpus = GIC_NCPU;
> -    } else {
> -        virt_max_cpus = virt_redist_capacity(vms, VIRT_GIC_REDIST);
> -        if (vms->highmem_redists) {
> -            virt_max_cpus += virt_redist_capacity(vms, VIRT_HIGH_GIC_REDIST2);
> -        }
> -    }
> -
> -    if (max_cpus > virt_max_cpus) {
> -        error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
> -                     "supported by machine 'mach-virt' (%d)",
> -                     max_cpus, virt_max_cpus);
> -        if (vms->gic_version != VIRT_GIC_VERSION_2 && !vms->highmem_redists) {
> -            error_printf("Try 'highmem-redists=on' for more CPUs\n");
> -        }
> -
> -        exit(1);
> -    }
> -
>       if (vms->secure && (kvm_enabled() || hvf_enabled())) {
>           error_report("mach-virt: %s does not support providing "
>                        "Security extensions (TrustZone) to the guest CPU",
