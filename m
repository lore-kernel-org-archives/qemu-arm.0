Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp978547njh;
        Mon, 12 Aug 2024 18:04:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUe5oFQ8sP5WTbM3HFLoDoGvABOVwi5NiDQ6KF9MRmX66ftfZhyAB8y3OUlVufSb1x0JhbQ4MZp6QpVDDDlyxTAz/J1C1Rm
X-Google-Smtp-Source: AGHT+IFGyvyAXRywFjpwenOYS1in8Nyt2KdYk8Y3faQzokJ2VL5aTvspLdi9lbDesmwcX2hXT/3W
X-Received: by 2002:ac8:5512:0:b0:453:4aca:7ad3 with SMTP id d75a77b69052e-4534aca834fmr17015421cf.3.1723511090037;
        Mon, 12 Aug 2024 18:04:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723511090; cv=none;
        d=google.com; s=arc-20160816;
        b=FhjlzHxhn9f+l4SwHgfEdYQPIRywvltQbEmCRAY4iE30OzxVunrqF0IWwtcM+IQuCh
         9jZJgHd7Pics6uur4LdYApcVSACYCYky0Ku70RwssuTlhHkuIGZuY+EX3d6mMv2kuDfv
         kJJQ/R3IPK0nl8dbSds6TWH2fq0JkmY+FWG8ZmYkbWY0gjNfLGphylKbbqCIHvJMAfES
         3SS/Rr1ntqNXUcDVHFMOgCnjW2cJw7rPfCA0tXW5cWCAiiTKhhHNtNbGxdBbR1oOrPh8
         bBs6fs8fDczrwAm/C7ypT81Q5LmY7yJm8AeFQnVCZuEVejBD60nszgikMqJuyVH3B+JL
         M2CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ioazDRmVc3QZtq4wp5en7NtK6ltFlUagoPAs3rc4Ge0=;
        fh=8jPpibSw/B9Kibd69MfWGHj7Q7c0Nbz9uMrD7EEGBrI=;
        b=pkivyqlST9OWoHRH9uq+v7Wxj4XBAxU/Tjk48YzyqSaa0SKNla9GoOvQxdi4nhNNYw
         6PhWlI3h+2QB9uJOWGkGm5S0q5xsatWtckmfqQUH5dW/2GAwp39kmZVfRDEYBuyhlpGo
         ZMZa16T7zbPIGgdlcfQ/lRmaudQ3F/umQzIG5ehrXJPZN1d5CcDr9wFH+iMx5bcTdtR/
         ElhhqEANni6FPA6RzT2yKL5UoS/6+6PspZrgU7+e5JlesqO5+1O81DaKWgIRodsrL0XE
         FB8R7T8uNBqvnOWzcoX/rR/BCBDrbMGXbdDnTiYdnCppV1x0xB+3LH7g1ybF5M73fUau
         v5SQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L59mfBls;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4531c1aebd6si70837081cf.1.2024.08.12.18.04.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 18:04:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L59mfBls;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723511089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ioazDRmVc3QZtq4wp5en7NtK6ltFlUagoPAs3rc4Ge0=;
	b=L59mfBlsOh1tLatjqbztKVJLREPjY9ftBq7TOBVOIvXwpPh8KecPZfH8dDKJE8t9/cvcFO
	0SGSE6feF4HeYXsMU9rIX61cWj8FVa5HWHTipBRFTW4Qy0BUMR/A1hFDlG8LjIbFAZf2Eo
	BpeRcMcuBdBkoCztIUdBHSlhbgfZq8w=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-JFurKzoxM4Kx_y7JwwlmTg-1; Mon, 12 Aug 2024 21:04:47 -0400
X-MC-Unique: JFurKzoxM4Kx_y7JwwlmTg-1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-200aa7dbc3bso31153455ad.3
        for <alex.bennee@linaro.org>; Mon, 12 Aug 2024 18:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723511087; x=1724115887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ioazDRmVc3QZtq4wp5en7NtK6ltFlUagoPAs3rc4Ge0=;
        b=j6iQo6n3SABR+fVnDELKUaLF1tT0w6IxLLGUL7AA96VBOVEEdhMtXO5B6e5EeoG6HA
         I9lREqXKmtM6ZZUdJevB37byPkqBHxFVgjdbWsqVxtfBad1GxEwu8nChYujWedNd8c19
         F+qOrNSbQ9LILX/hqArdtNpzDcq8txtrLP8GHcVvmnrLMw0iYAP+otAzUJddjfLBGi/b
         VJPkbQwuMn//3Xm0RMFJ0gfowAJsM+cbiLXusO88kM9nRDxsyZ0QBjqO/fNMLI9hhPvi
         SLShXpKDQKNU1mEYRja+1ArLTnO4Xu8/Q4cyrt4JLU0QxywMuJLctp1EH8NXsTzZajuF
         HOnw==
X-Forwarded-Encrypted: i=1; AJvYcCVP3WkqegjtGqZ2FJUrL1TGWgqISezGh5gVUvaRBlticykPoqxkIk5pmwjnzmO1EVuwfv8lPc1AJ+n1P/K84VNb2xCDA+uW
X-Gm-Message-State: AOJu0YyaoFG7CjF0Q5Tj3NUPjSRpXWyC74swVkh9Di2gpTituy8uhRvv
	WyFmGAt7jtKjPoXBS/skp0NYY9TEVu2oUND/4PCLz+iU5UC9w3G4QUcEv8TjTrmdrFt0ZxBrZVL
	+g/xPVhMQhe1LYZHIk7b/3StMFkMzms2cUGtu912q0iXfI4Ft6nNlig==
X-Received: by 2002:a17:902:d2c2:b0:1fd:a7a7:20b7 with SMTP id d9443c01a7336-201ca175a05mr24328845ad.30.1723511086762;
        Mon, 12 Aug 2024 18:04:46 -0700 (PDT)
X-Received: by 2002:a17:902:d2c2:b0:1fd:a7a7:20b7 with SMTP id d9443c01a7336-201ca175a05mr24328345ad.30.1723511086342;
        Mon, 12 Aug 2024 18:04:46 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.54] ([103.210.27.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd14ab01sm2753095ad.82.2024.08.12.18.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 18:04:45 -0700 (PDT)
Message-ID: <143ad7d2-8f45-4428-bed3-891203a49029@redhat.com>
Date: Tue, 13 Aug 2024 11:04:31 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC V3 11/29] arm/virt: Create GED dev before *disabled*
 CPU Objs are destroyed
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
 <20240613233639.202896-12-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240613233639.202896-12-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: vaKImMAxaLOr

On 6/14/24 9:36 AM, Salil Mehta wrote:
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
> index 918bcb9a1b..5f98162587 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2467,6 +2467,12 @@ static void machvirt_init(MachineState *machine)
>   
>       create_gic(vms, sysmem);
>   
> +    has_ged = has_ged && aarch64 && firmware_loaded &&
> +              virt_is_acpi_enabled(vms);
> +    if (has_ged) {
> +        vms->acpi_dev = create_acpi_ged(vms);
> +    }
> +
>       virt_cpu_post_init(vms, sysmem);
>   
>       fdt_add_pmu_nodes(vms);
> @@ -2489,9 +2495,7 @@ static void machvirt_init(MachineState *machine)
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

It's likely the GPIO device can be created before those disabled CPU objects
are destroyed. It means the whole chunk of code can be moved together, I think.

Thanks,
Gavin
