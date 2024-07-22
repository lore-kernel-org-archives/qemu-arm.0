Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1887720njc;
        Mon, 22 Jul 2024 05:39:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXexGpeaBATR03MueMryj8HJ01+MGHcdcOXSKR0YPoT2evcXsKbhSycyq7g0Zpsg+kwXMyf19kvdK2qQX6ly5OGpDoZiIWJ
X-Google-Smtp-Source: AGHT+IFqD+nxi8zZ/J/ogBckCerrb+noLQCs0uUXXzNOjOekUP0DO7TM8Clu+veCR485HVu6bILn
X-Received: by 2002:adf:a3d7:0:b0:367:40e6:46bd with SMTP id ffacd0b85a97d-36831792398mr9852802f8f.61.1721651997053;
        Mon, 22 Jul 2024 05:39:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721651997; cv=none;
        d=google.com; s=arc-20160816;
        b=q8MkjciiC5aXa8Vd0vZ1zf10NYAPky68mit/ivlDeiGlxaA8Vzr7CJNzs5tszKnh5E
         iWypDaxVDf91oCMyoYPe3oXua1S7B89QgSfwJV53wNGFB26pAnLUqEquqjvW0LVaGG1J
         xnUmiYBNu8lP/KrVlT5YAreRH2uPKe5m/+Y0gbXKsibOQb4hTu4yomHsNBnWUIYzPXiT
         JOVEMOZXTBoy5F17ak2bEYQwmQGg707tL2GuXGuHvDGq+wgPSabRMYMqK2Ga/5Pr1sJ+
         Gh9Vo/T/QJLDgOelbkcLpfKhpFuzFK/BlA3fSNoqRyldV41tPT7zn28TKCiyW5F9cTMe
         yk2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=JRxE4Q3gFqG3GmdU6woOrp2v+IpwrvDQKFxm5O21Tcg=;
        fh=jt4Zy3NzMmUgST0sEyRdQDVF0OT2XWa8Qtc4C5tGS+A=;
        b=nxZ8BSA3EaGPSRPcbXpfhwOmsvw9XbWmv4ZPogH4fcCTJdt+afx1gwyPsa8FcXweGL
         lvJusvwjyayzYVmAxYrmmGx77A6g1UbPn9z7RJK/q/NqNsnxVrczC9HJtrgh2k9PSSra
         qwlBEUB/Ky12wksjt2Ly0fREu+WqOg8WplUGhhtvOBJmUGh88iNS48N9utceDxqIHr0i
         XbXRT/TsDAyYit1u6pV48aZMX3Kt7GoAo+tKprlEuwnaXi8HmG3/tDE6D3p4X1h8jdrt
         w/2EyfisXa5F8eYQGHklOQ1xJ4COWKwDANu4d4qNb1JVwPvRdC42iV1a4vVM6Tbalutk
         QTDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-368786a6d4asi2816995f8f.479.2024.07.22.05.39.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2024 05:39:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WSKYV45hSz6D8X7;
	Mon, 22 Jul 2024 20:37:34 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 2DE41140CF4;
	Mon, 22 Jul 2024 20:39:56 +0800 (CST)
Received: from localhost (10.203.174.77) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 22 Jul
 2024 13:39:55 +0100
Date: Mon, 22 Jul 2024 13:39:54 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P .\" =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Eduardo  Habkost <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang  <wangyanan55@huawei.com>,  Michael S.Tsirkin  <mst@redhat.com>, Paolo Bonzini  <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Eric  Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Marcelo  Tosatti <mtosatti@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=  <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, Sia Jee  Heng <jeeheng.sia@starfivetech.com>, qemu-devel@nongnu.org,  kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhenyu Wang  <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, Yongwei Ma  <yongwei.ma@intel.com>"@domain.invalid
Subject: Re: [PATCH 3/8] hw/core: Add smp cache topology for machine
Message-ID: <20240722133954.00007a34@Huawei.com>
In-Reply-To: <20240704031603.1744546-4-zhao1.liu@intel.com>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
	<20240704031603.1744546-4-zhao1.liu@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.174.77]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-TUID: D5IOZh25thNC

On Thu,  4 Jul 2024 11:15:58 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> With smp-cache object support, add smp cache topology for machine by
> linking the smp-cache object.
> 
> Also add a helper to access cache topology level.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Trivial comment inline.
FWIW 
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>


> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 655d75c21fc1..09ef9fcd4a0b 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1045,6 +1045,15 @@ static void machine_class_init(ObjectClass *oc, void *data)
>      object_class_property_set_description(oc, "smp",
>          "CPU topology");
>  
> +    /* TODO: Implement check() method based on machine support. */
> +    object_class_property_add_link(oc, "smp-cache",
> +                                   TYPE_SMP_CACHE,
> +                                   offsetof(MachineState, smp_cache),
> +                                   object_property_allow_set_link,
> +                                   OBJ_PROP_LINK_STRONG);
> +    object_class_property_set_description(oc, "smp-cache",
> +        "SMP cache property");

Given there is space, maybe align with just after bracket?

> +
>      object_class_property_add(oc, "phandle-start", "int",
>          machine_get_phandle_start, machine_set_phandle_start,
>          NULL, NULL);

