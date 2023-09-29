Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2914868ejc;
        Thu, 28 Sep 2023 17:31:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGZnaxg7SowDl2S9P+yqqeosfO29umz8/gn7L7wzyZm/5eAtbJ7XBrYgTN2PNI/XQXPhUA
X-Received: by 2002:ac8:5789:0:b0:417:9cae:b43 with SMTP id v9-20020ac85789000000b004179cae0b43mr3155614qta.35.1695947465176;
        Thu, 28 Sep 2023 17:31:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695947465; cv=none;
        d=google.com; s=arc-20160816;
        b=U+5af4jLrlZkoq7ec+w3FsiWFbj2US/eVQhoGAeaooNISY+TVSK54+OcRK9g/z+gVe
         z2lf9kykvznTQRTy0qFONw61n2JxHMib7D08fw4dSXwTnVPZLsrjgPkEd0+W5lX/7yE2
         euQS/AxHEZZINkE6MUEHWKh5E3X8WpuvLXPLlwCg4jSGzEhmWlyD+trW+aF+4920QNrD
         oQNSolQxUkGJ7r2t3TIRt7hDyRvnzbRUwDsxXw2WJ0p6NRPF2+s7PaT0HFpu5iU3ud/0
         FiACGUd/jqw+rEatFUrbSzeG8D0EoYThLQJwlwZPcWqJ6hqE4KZepUUXVWrMoUHDhj/W
         nrrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1jON6KnKuRGTS+epyAPrMxGaBZT5dsCo52ZyZXffhw8=;
        fh=fO+ncAaxY0Wf5Oiu0zeLu9be5DWOx71LYjyGHoG8Yc0=;
        b=EMtsdISWr7abWV1LyJGBxxuVcjJi6/s2p2CNNPC8FLENW0KhoZNQXCfh/hvs1d8Ii7
         RLA66q62Jc568h2N7j9RWZJokCNK3pQs9rHoUxzK5kwkp7R/OeXHUfn7rMINs72HIPfZ
         k9IK2ZO21cd84bJnxPAEHprX5J4bRFJOD4GBCIXAshH/QZz2ngHzfWE938vDMWUoQ2M0
         N0U1uyPpbXYLvY+jq+4l8Ngqm4DGRtzehTw1lmRn/zZhS2TFO0wDs6n/W33AyzGj+kIE
         NQvNgi7JxaT1jx5032xKFBU6Cb6KS7/xxIp8ULVdGt03Dt61u13rP7j3MCUBsu8jlzlO
         Mhlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GWGyiEcF;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id h10-20020a05620a284a00b0076d1fb570cbsi9572771qkp.742.2023.09.28.17.31.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 17:31:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GWGyiEcF;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695947464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1jON6KnKuRGTS+epyAPrMxGaBZT5dsCo52ZyZXffhw8=;
	b=GWGyiEcFa28WBzG/SRmxhgJuzchlEVnop+gv6b1QmDmgCmfVpcw1PpvuWOIVldBjhrMY3m
	ffRx5xrpn6qJTTOK4dKA7fz7Am96QaGXg2uvQgmRcj4hAc02v4rRQ6ALjSXvg5yczBE6BU
	trj/TP3gD0aw7KNQdW3hSSzE6QBgV+I=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-AZ99rBABP5KTcUfBjNL4Qg-1; Thu, 28 Sep 2023 20:31:01 -0400
X-MC-Unique: AZ99rBABP5KTcUfBjNL4Qg-1
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-692b5134675so14196227b3a.2
        for <alex.bennee@linaro.org>; Thu, 28 Sep 2023 17:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695947460; x=1696552260;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1jON6KnKuRGTS+epyAPrMxGaBZT5dsCo52ZyZXffhw8=;
        b=HR2z923Xrnv49xQcl6Kn3MsJP2oD66oDl7DXVYXoMuFANCqb43UPn5+2qWA0NLW2zt
         cOIpjDSzytu8yjM7JMlOh0WJDmqYAIALyZkjZX17fNeN2SdHOwaVMxiPKHSNWG+GXjaG
         RU/zCkf2AJ2j6BnjNVOOS5SccmLkHQrTgo8bymK0heCv5JBLoOxC6PjNvJNS4AZcXqAK
         TwUhpNq8o17iNillkYGHeKeFjaS6rws7yLebRZfO67vmuRRtjgjogAeVWm81eFLUNc/w
         3tZcu0m0cWUBoYfRA6VIdV0ClK5Anr0749/5DZuGjiXtheLOh+DsHEzFst+OJ8nwWzmj
         UJmA==
X-Gm-Message-State: AOJu0Yw287o1T+YegRvWZ14lz9COH9qSDfWd6WdPvf0E79PbbQLApef2
	AKEo0u2G72D4fxp78tj4oEwtOUsQl5CRQiGnalAKOwTPE+EXmYo3v4Kwq8uiS1MyzaX2Ufs9CIr
	x54rWUt53zrvC4D5k
X-Received: by 2002:a05:6a21:3d8d:b0:140:a25:1c1d with SMTP id bj13-20020a056a213d8d00b001400a251c1dmr2898179pzc.51.1695947459911;
        Thu, 28 Sep 2023 17:30:59 -0700 (PDT)
X-Received: by 2002:a05:6a21:3d8d:b0:140:a25:1c1d with SMTP id bj13-20020a056a213d8d00b001400a251c1dmr2898156pzc.51.1695947459583;
        Thu, 28 Sep 2023 17:30:59 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id 9-20020a17090a018900b002772faee740sm180884pjc.5.2023.09.28.17.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 17:30:59 -0700 (PDT)
Message-ID: <4d8980ac-f402-60d4-fe52-787815af8a7d@redhat.com>
Date: Fri, 29 Sep 2023 10:30:45 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC V2 29/37] arm/virt: Update the guest(via GED) about
 CPU hot-(un)plug events
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
 <20230926100436.28284-30-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230926100436.28284-30-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: mcFZvwaDrMI8

Hi Salil,

On 9/26/23 20:04, Salil Mehta wrote:
> During any vCPU hot-(un)plug, running guest VM needs to be intimated about the
> new vCPU being added or request the deletion of the vCPU which is already part
> of the guest VM. This is done using the ACPI GED event which eventually gets
> demultiplexed to a CPU hotplug event and further to specific hot-(un)plug event
> of a particular vCPU.
> 
> This change adds the ACPI calls to the existing hot-(un)plug hooks to trigger
> ACPI GED events from QEMU to guest VM.
> 
> Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/arm/virt.c | 33 ++++++++++++++++++++++++++++++---
>   1 file changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b447e86fb6..6f5ee4a1c6 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -3157,6 +3157,7 @@ static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>       VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
>       MachineState *ms = MACHINE(hotplug_dev);
>       CPUState *cs = CPU(dev);
> +    Error *local_err = NULL;
>       CPUArchId *cpu_slot;
>   
>       /* insert the cold/hot-plugged vcpu in the slot */
> @@ -3169,12 +3170,20 @@ static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>        * plugged, guest is also notified.
>        */
>       if (vms->acpi_dev) {
> -        /* TODO: update acpi hotplug state. Send cpu hotplug event to guest */
> +        HotplugHandlerClass *hhc;
> +        /* update acpi hotplug state and send cpu hotplug event to guest */
> +        hhc = HOTPLUG_HANDLER_GET_CLASS(vms->acpi_dev);
> +        hhc->plug(HOTPLUG_HANDLER(vms->acpi_dev), dev, &local_err);
> +        if (local_err) {
> +            goto fail;
> +        }
>           /* TODO: register cpu for reset & update F/W info for the next boot */
>       }
>   
>       cs->disabled = false;
>       return;
> +fail:
> +    error_propagate(errp, local_err);
>   }
>   

'fail' tag isn't needed since it's used for once. we can bail early:

     if (local_err) {
        error_propagate(errp, local_err);
        return;
     }

>   static void virt_cpu_unplug_request(HotplugHandler *hotplug_dev,
> @@ -3182,8 +3191,10 @@ static void virt_cpu_unplug_request(HotplugHandler *hotplug_dev,
>   {
>       MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
>       VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> +    HotplugHandlerClass *hhc;
>       ARMCPU *cpu = ARM_CPU(dev);
>       CPUState *cs = CPU(dev);
> +    Error *local_err = NULL;
>   
>       if (!vms->acpi_dev || !dev->realized) {
>           error_setg(errp, "GED does not exists or device is not realized!");
> @@ -3202,9 +3213,16 @@ static void virt_cpu_unplug_request(HotplugHandler *hotplug_dev,
>           return;
>       }
>   
> -    /* TODO: request cpu hotplug from guest */
> +    /* request cpu hotplug from guest */
> +    hhc = HOTPLUG_HANDLER_GET_CLASS(vms->acpi_dev);
> +    hhc->unplug_request(HOTPLUG_HANDLER(vms->acpi_dev), dev, &local_err);
> +    if (local_err) {
> +        goto fail;
> +    }
>   
>       return;
> +fail:
> +    error_propagate(errp, local_err);
>   }
>   

Same as above, 'fail' tag isn't needed. Besides, 'return' isn't needed.

>   static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
> @@ -3212,7 +3230,9 @@ static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
>   {
>       VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
>       MachineState *ms = MACHINE(hotplug_dev);
> +    HotplugHandlerClass *hhc;
>       CPUState *cs = CPU(dev);
> +    Error *local_err = NULL;
>       CPUArchId *cpu_slot;
>   
>       if (!vms->acpi_dev || !dev->realized) {
> @@ -3222,7 +3242,12 @@ static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
>   
>       cpu_slot = virt_find_cpu_slot(ms, cs->cpu_index);
>   
> -    /* TODO: update the acpi cpu hotplug state for cpu hot-unplug */
> +    /* update the acpi cpu hotplug state for cpu hot-unplug */
> +    hhc = HOTPLUG_HANDLER_GET_CLASS(vms->acpi_dev);
> +    hhc->unplug(HOTPLUG_HANDLER(vms->acpi_dev), dev, &local_err);
> +    if (local_err) {
> +        goto fail;
> +    }
>   
>       unwire_gic_cpu_irqs(vms, cs);
>       virt_update_gic(vms, cs);
> @@ -3236,6 +3261,8 @@ static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
>       cs->disabled = true;
>   
>       return;
> +fail:
> +    error_propagate(errp, local_err);
>   }
>   

Same as above.

>   static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,

Thanks,
Gavin
