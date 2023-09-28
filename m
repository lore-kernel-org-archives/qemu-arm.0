Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2225425ejc;
        Wed, 27 Sep 2023 18:08:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGAKweZ336TBUEYy27SKdpz4GZ+T+rJcUwjJ6qezTuXh8enc3CfUwNvErbWpzKic7nohX3
X-Received: by 2002:a2e:9f54:0:b0:2c0:fa5:8e0e with SMTP id v20-20020a2e9f54000000b002c00fa58e0emr3359149ljk.40.1695863311544;
        Wed, 27 Sep 2023 18:08:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695863311; cv=none;
        d=google.com; s=arc-20160816;
        b=neBZiS8p0cAANl8d/CM7blQU672dlDVT4L0Ajsp/dx7i2ujHVfJcQ1JWP2MeS3NNMS
         rCJH7F+N8WUs3lC/ckyQ84nZd4ESLm0D8FtX3wVJAfk48SSIywlNfWuoM3G6k0II0a2Q
         cvJr5/1uR2A2h52+Ahv42wQsYUw80ItPz9UfdMJRFqHaSv2HDMFGYuPCMj5q/lXrSl9n
         BKdm2xvcfVaPfE2D9cQ+ZTZQoYsbjl/D//zen+alIugiWkTg1uJcYwscicihapIAN5oF
         BZCsXfQOb5t8FdkU36k2XX32NO9UZ6HvSaix8QyqUvZcRNn2jFpTvIc2/z+j1Y6H41f9
         MOqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=e63qvRPH057Klm0EneSQ47/qz7x6enkUS5KEkV9Db78=;
        fh=fO+ncAaxY0Wf5Oiu0zeLu9be5DWOx71LYjyGHoG8Yc0=;
        b=UDWVW7dvII0h8lKM3h65I/lJxrjTeFPkcRvBqQOfwvms/QfzxBZ4A8qtqUHqZ7YNqa
         PS2pT7h4nknKOFnpkV6Rhs+hk3hBanxoagE0faH4QvnkQW+4tg6X8yCr3DfGKSCH0qrH
         g/b1xPUcrZx0LwO/2dXsNguoh5qDD7rGXJVn1CGx4wbN1l1V9+XX1yO0z/mYIEPpvLm2
         kgARhujrbS4F0iq5DA1qoP0uvDTPOjLI2DeNrzI5f242sTHsfDwuASgcj0gE7nQgT6Ae
         S2maOZ+h9afchSkXUYPUN3V3A4KD1Yfszenj9Qy/FGljAdEZKw+4R2sPGC5wl+Q+A4bw
         nP3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="G+c/haOI";
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id e18-20020a17090681d200b0099399ac6fdesi13696036ejx.79.2023.09.27.18.08.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 18:08:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="G+c/haOI";
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695863310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e63qvRPH057Klm0EneSQ47/qz7x6enkUS5KEkV9Db78=;
	b=G+c/haOIWCxMiDWosnX1dpT5oR3d8ZeCXlCKiuHAp0heuQbgBvjAc9Fl8yd3hgJFItTWUc
	f2oEsSeTCf+Wr5T9kb9hrwkOuYaaUKs9qw6dHDPE9+fLX0IeHxAZzv0A14gW3OLCVeAcEP
	kOubleZuqGoUprp2KotGB6gzXKe5idU=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-uSZ1HlsCNtODyDmIKYhFhA-1; Wed, 27 Sep 2023 21:08:24 -0400
X-MC-Unique: uSZ1HlsCNtODyDmIKYhFhA-1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1c6181dacf6so110723495ad.1
        for <alex.bennee@linaro.org>; Wed, 27 Sep 2023 18:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695863303; x=1696468103;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e63qvRPH057Klm0EneSQ47/qz7x6enkUS5KEkV9Db78=;
        b=mGob4eN7s0/lHyrvZ+0HRVgY2ONJ2HIZplvmGNrsJzrkmAUr36SjxhOM/PewVEmNgi
         TZdsZsRbEMANjEAHgVdHXsSzu9GcNspAFz2+SJoK77wOjqS/pWdud1KJoqDtCMpt/qNA
         d1Z0xUeTT781x6Brk3NMxn/FzpZpbXbav+Bh7MI3bQeQNgF4bOas2fLNk7jVwiiD8jvd
         LW3F554sJAewxWDgfqZunVaGEwo28KYzS6gu2cXB3k1OOWPAypQ9xXR1AAjKmYXjLjLg
         mMXbxdPxR+LcGrtCV7MPTACo4WbmgsN/gt4kA/7J1yre69+Mjg5SVfb+BzlA5z7gQrJr
         TFXA==
X-Gm-Message-State: AOJu0YxaEgsw3vWmbiA5t4DpzjGJBbo6XYjYU+/jmybmKJZTISq04yVj
	Vjl/cSUXxQfLmScV7HjkpdOZXq+lozqremGm+xCj0KJ+r2sMu+kKJ09pnd2CoZCq2ku7xNa+r0L
	hlmCPjzp076eNiMlQ
X-Received: by 2002:a17:903:25d5:b0:1c6:1928:59b9 with SMTP id jc21-20020a17090325d500b001c6192859b9mr3563120plb.10.1695863303245;
        Wed, 27 Sep 2023 18:08:23 -0700 (PDT)
X-Received: by 2002:a17:903:25d5:b0:1c6:1928:59b9 with SMTP id jc21-20020a17090325d500b001c6192859b9mr3563093plb.10.1695863302945;
        Wed, 27 Sep 2023 18:08:22 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id z12-20020a170902708c00b001c407fac227sm7427746plk.41.2023.09.27.18.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 18:08:22 -0700 (PDT)
Message-ID: <37064f7b-1ad5-b636-3cdb-97208d995c95@redhat.com>
Date: Thu, 28 Sep 2023 11:08:08 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC V2 15/37] arm/virt: Create GED dev before *disabled*
 CPU Objs are destroyed
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
 <20230926100436.28284-16-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230926100436.28284-16-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 72pP0D9crnQq

Hi Salil,

On 9/26/23 20:04, Salil Mehta wrote:
> ACPI CPU hotplug state (is_present=_STA.PRESENT, is_enabled=_STA.ENABLED) for
> all the possible vCPUs MUST be initialized during machine init. This is done
> during the creation of the GED device. VMM/Qemu MUST expose/fake the ACPI state
> of the disabled vCPUs to the Guest kernel as 'present' (_STA.PRESENT) always
> i.e. ACPI persistent. if the 'disabled' vCPU objectes are destroyed before the
> GED device has been created then their ACPI hotplug state might not get
> initialized correctly as acpi_persistent flag is part of the CPUState. This will
> expose wrong status of the unplugged vCPUs to the Guest kernel.
> 
> Hence, moving the GED device creation before disabled vCPU objects get destroyed
> as part of the post CPU init routine.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/arm/virt.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 5c8a0672dc..cbb6199ec6 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2376,6 +2376,12 @@ static void machvirt_init(MachineState *machine)
>   
>       create_gic(vms, sysmem);
>   
> +    has_ged = has_ged && aarch64 && firmware_loaded &&
> +              virt_is_acpi_enabled(vms);
> +    if (has_ged) {
> +        vms->acpi_dev = create_acpi_ged(vms);
> +    }
> +

I prefer the old style. Squeezing all conditions to @has_ged changes what's
to be meant by @has_ged itself.

        if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
            :
        }

>       virt_cpu_post_init(vms, sysmem);
>   
>       fdt_add_pmu_nodes(vms);
> @@ -2398,9 +2404,7 @@ static void machvirt_init(MachineState *machine)
>   
>       create_pcie(vms);
>   
> -    if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
> -        vms->acpi_dev = create_acpi_ged(vms);
> -    } else {
> +    if (!has_ged) {
>           create_gpio_devices(vms, VIRT_GPIO, sysmem);
>       }
>   

Thanks,
Gavin
