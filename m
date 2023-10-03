Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1912226ejb;
        Tue, 3 Oct 2023 04:53:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEarfdJ3VaE3ZKgGVrBQIFqj1CRxcmzS/FSJ203eLynpMms6R7e1t6rmzdkVseBZ6cvkSeI
X-Received: by 2002:a9d:6c58:0:b0:6b9:3f64:4e8c with SMTP id g24-20020a9d6c58000000b006b93f644e8cmr14403875otq.9.1696334037706;
        Tue, 03 Oct 2023 04:53:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696334037; cv=none;
        d=google.com; s=arc-20160816;
        b=qwsdsU6+vBflZ8ZogkTkaRtp3prpWjfEaalkBFU0DDKD9vxK/AoeQ6MnrJ6RXygpzz
         Xy03YogQTJazOASL9Tt72RiX3JT7VtQPgfH3VlQtIBMpz0UjcdKofxsUa0Y1EN2TXuNc
         aqbd+6zgvxUKXUgl8Af82a8BTYLZndn1XrxPpBX7F5oXbjVYP3Ilt1lAIh9jFhukn51G
         UGhUyO2pzSDnfDUxIby/iWZfYkV9dKuScbj34IMjL4pChLYx1Uf7t1GAQVbhS7G2z09W
         gvLU+19/uMbtOukZYSi8lguNCrsx4Kd2m8sqHqNSNLVxkYRT/AFIVCOgENDeysoRf4cI
         WHOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=193YYYRMHnmFbqirf0j51/e0dDHdk0S2pJOmJAE5HOk=;
        fh=cJldi6pGemqSxOtsGTKyEggQwVc4gAdg2lGk8CIZ6M0=;
        b=P46soGdx/pK7ETTkqdWaKsD+b92WG82ihClISoSnRzGfVvyx++2V7xM0Sg3gToLspc
         wGQNGE1gMv3iZkaIQx1HJYBo0ntO22w5pI1WVZpyhGxAEtZLzYzBCtHmhX+/RkBfz1xm
         +ben5wxGALrppKuOKBQ3zkMb32bZe+hQsG/Bzdze8y4zEBs0DxrwgHieqDWrIT3bC7WT
         oZ7/QgjidfUUj/MlXNn3arenlVRrpO6EoDFXDBz4mKowHHSv3NxCGzvlAhEuT5XSggjL
         /YAK2+1H7eAO/Jgxke9ypmslZ0GEI4vj8M6HB904yWj08mWEEtYQtq+fdWVkQosy1fxr
         WMmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id x5-20020a654145000000b00578afd566cesi1232666pgp.594.2023.10.03.04.53.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Oct 2023 04:53:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S0GPF1Xdcz6HJZS;
	Tue,  3 Oct 2023 19:51:13 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 3 Oct
 2023 12:53:52 +0100
Date: Tue, 3 Oct 2023 12:53:51 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Salil Mehta <salil.mehta@huawei.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "maz@kernel.org" <maz@kernel.org>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "david@redhat.com"
	<david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "will@kernel.org" <will@kernel.org>,
	"gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com"
	<miguel.luis@oracle.com>, "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
	zhukeqian <zhukeqian1@huawei.com>, "wangxiongfeng (C)"
	<wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>,
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
	Linuxarm <linuxarm@huawei.com>
Subject: Re: [PATCH V2 06/10] hw/acpi: Update GED _EVT method AML with cpu
 scan
Message-ID: <20231003125351.00004788@Huawei.com>
In-Reply-To: <ed93b18d03ef44c5b37815449bdc10c3@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
	<20230930001933.2660-7-salil.mehta@huawei.com>
	<20231002171423.00003c39@Huawei.com>
	<ed93b18d03ef44c5b37815449bdc10c3@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-TUID: UGMPb2vjvCTJ


> > aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),  
> > > diff --git a/include/hw/acpi/cpu_hotplug.h  
> > b/include/hw/acpi/cpu_hotplug.h  
> > > index 48b291e45e..ef631750b4 100644
> > > --- a/include/hw/acpi/cpu_hotplug.h
> > > +++ b/include/hw/acpi/cpu_hotplug.h
> > > @@ -20,6 +20,8 @@
> > >  #include "hw/acpi/cpu.h"
> > >
> > >  #define ACPI_CPU_HOTPLUG_REG_LEN 12
> > > +#define ACPI_CPU_SCAN_METHOD "CSCN"  
> > 
> > This seems to already be defined in hw/acpi/cpu.c
> > Can we drop it from there given that file now includes this
> > header anyway.  
> 
> Perhaps I can assign this to the macro in the hw/acpi/cpu.c?
hw/acpi/cpu.c includes this header now anyway I think.
So just drop that definition and should all be good.

Jonathan

> 
> Thanks
> Salil.
