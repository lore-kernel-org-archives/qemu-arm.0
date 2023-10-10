Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp296663ejb;
        Tue, 10 Oct 2023 00:39:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX1Zg/y4k1NWEpJOp76MmDaZlppcOVtSOQ0s+l7SzN2CIsmV7shztEnp/HxZWdGYwDZEZy
X-Received: by 2002:a05:6512:3245:b0:503:182e:1df6 with SMTP id c5-20020a056512324500b00503182e1df6mr14154048lfr.43.1696923565064;
        Tue, 10 Oct 2023 00:39:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696923565; cv=none;
        d=google.com; s=arc-20160816;
        b=HahkAtd85say4DEFIf9EFbC2mT7ZrIZTHLuU+SlFvPtnWl7ZaTtRMDIyPJ3AYVfDby
         WtsFfRVpn0j0yu8euozeTYodf8etUW24DDGTbxGZrrqcZlhp8Hy/JDKuIb3s4aNARZAy
         1qFTCH5iDPY//xpJlVMamicIFkS0zcoUs5PJ1pPoyXlC1BjLeM3U929vlpnWbohqtUPD
         6moAwy62Bidoh++NVcoF5pIa5+uNf7zJhJZpG6d7KyCwMjI1+VgsWIIASG8V73CWNYh6
         u7ly2Ew/P4rtV2H9sckP46lCd0MrjfgcfhErP613WfZgUr6kCWqSpKM1FiCdPO2Ad+Aw
         hIQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zXYDsEbd3BNJe+VerGjSV5r0zWLPidrTXCRvYGol8fM=;
        fh=HQu76LFN0DbKXHr60vGnzTmi359RrU+EPC8eBDHkPTc=;
        b=1D+ATbjElBR8Ag9Z/N9ZjDOk2zE0uBmSHe325dJFs07dBNnOHe5tIR99IMzCnSp5WD
         w7MaEBVSr0sW+Ny+STPHOIYDBySDn47KxMHAU66CWVQasp7syrhAk0jAcz5FzHpzD9yA
         KHpHUs+wtSY2jnEHL2x149Kx4jJeSapojr2M/Q7QNLL2nwXynz8vj0mnQwMHDiPDmSIM
         8iMlLHkSluxeMEmz0ngSDA36+31Tu4gD5TKKDXk01WfNApQ9mhCibD6eMGNndFmGUqWJ
         GLNNyC0wpquPsjLn1Nzmi+PM94QRHG/+yd9fyXTjcsBiBX2yPds8M7pU9MLGx/Ys4w7l
         Tisw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Yt01+uQw;
       spf=pass (google.com: domain of shahuang@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=shahuang@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <shahuang@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id m19-20020a195213000000b0050420b1a0c8si6974376lfb.642.2023.10.10.00.39.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 00:39:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of shahuang@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Yt01+uQw;
       spf=pass (google.com: domain of shahuang@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=shahuang@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696923563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zXYDsEbd3BNJe+VerGjSV5r0zWLPidrTXCRvYGol8fM=;
	b=Yt01+uQwHdMNQPzWFZpwCulo29V7OzFGKeplcy8JOTnBpGSte0/7i2RCZ4WTjzBOevHuQI
	6bWn1BAvExAaJaqo0nOGWzBpO/+SUF9TCxnBL/o8AtQhL4dhGIhV19gD8G5vdzNOlk6uq8
	dipmHWjDGxyN42CLIP74tEtRgq6EAEU=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312-FhOvmcdANUuwH_VCElDU5A-1; Tue, 10 Oct 2023 03:39:21 -0400
X-MC-Unique: FhOvmcdANUuwH_VCElDU5A-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3ae5c4872e8so1576935b6e.0
        for <alex.bennee@linaro.org>; Tue, 10 Oct 2023 00:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696923561; x=1697528361;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zXYDsEbd3BNJe+VerGjSV5r0zWLPidrTXCRvYGol8fM=;
        b=vd40xnPbUOxtVme26ICHwS17eGc0z9xs8qN0NTtBxCJ+3pCDpTz/M645DgAeFGSAGe
         xOqH0T8h8xxJWoFh7vwxT0eW1s0ayA3gLZ7l3B/60VLXnl6b8zw8+M0GaSII1UJMavs6
         VNr/xDkT7PERAxFUmvYXVGcjKn9MSkFpZ3s4eG+T9UpelHgS5oqrZFL4sbDeGbRLGb7I
         wA3U/CZtDhf297c6J+w4iFt65hSnl9nyZ6gO7lSpJJ/UUcqviNPe8ONJXK6kQ0BtwAc0
         P+WXaBBW0P7UmmxtLxA3OSvQq8aTufuFpUmc8uuP+SR1uzW5s8IyAfiHbQlG/TheuxVK
         rOkA==
X-Gm-Message-State: AOJu0YxalJvFviU6SiHOg5zJ2x6WIW6H1RBy0101mfBMLDmaDugb9m3m
	PX0WCIWEWVTMq32WbO05A1E34lbCCyQShoVLijSyhHIsa9FMuV7JYTs9Ys0dL3brqDS3D0kBlXX
	ypBTwi7hJuDs2ijqV
X-Received: by 2002:a05:6808:13c5:b0:3ae:24bb:381a with SMTP id d5-20020a05680813c500b003ae24bb381amr19596979oiw.3.1696923560906;
        Tue, 10 Oct 2023 00:39:20 -0700 (PDT)
X-Received: by 2002:a05:6808:13c5:b0:3ae:24bb:381a with SMTP id d5-20020a05680813c500b003ae24bb381amr19596930oiw.3.1696923560443;
        Tue, 10 Oct 2023 00:39:20 -0700 (PDT)
Return-Path: <shahuang@redhat.com>
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id bt21-20020a632915000000b00583f73b7bcbsm6757001pgb.58.2023.10.10.00.39.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 00:39:19 -0700 (PDT)
Message-ID: <af88682c-aa4b-d457-44bf-fa3bba910d3b@redhat.com>
Date: Tue, 10 Oct 2023 15:39:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V4 03/10] hw/acpi: Add ACPI CPU hotplug init stub
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
 <20231009203601.17584-4-salil.mehta@huawei.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20231009203601.17584-4-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Nf9XqFgsB3n9



On 10/10/23 04:35, Salil Mehta via wrote:
> ACPI CPU hotplug related initialization should only happen if ACPI_CPU_HOTPLUG
> support has been enabled for particular architecture. Add cpu_hotplug_hw_init()
> stub to avoid compilation break.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   hw/acpi/acpi-cpu-hotplug-stub.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
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
> +}
> +
>   void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list)
>   {
>       return;

-- 
Shaoqin
