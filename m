Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2592702ejf;
        Tue, 27 Feb 2024 02:51:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWnRMYioceTMWFLx4F9MK37FNfs5ZbdMz/t3OvB5dr1ARqg+XadV3KztJv8vFKKGePM53lvxcoTXwdfTcHJrBfg8OTKnuK8
X-Google-Smtp-Source: AGHT+IE6AmEaqNDJmUIGuPSR3xVdwTUivvJ53RLIOZ8w4wP3betp2HSVnpLm5iZe8XtwBNtHbxGW
X-Received: by 2002:a05:600c:5191:b0:412:a852:78a1 with SMTP id fa17-20020a05600c519100b00412a85278a1mr2738684wmb.0.1709031109060;
        Tue, 27 Feb 2024 02:51:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709031109; cv=none;
        d=google.com; s=arc-20160816;
        b=Tv7f4xMSTL4NnkonP3kCvIptIf8bZ1Nt7sUiR0BYEpobfi9NOtxc2fMHv8tKLdWozQ
         XsKUQlqEovxrJFCRl+Bg1ikQvX1DQITxaQKlAWldZ/LCVQ8/Gs/R4d4ErLCLckY466uM
         wMGg0tuzrvDG+2O8cdHjLMVN8QG8C0vMjadb7+a3CMjvCPmiHegvfBNF6WZK216xNIvr
         7LfZSAL1/5uq0H93Sv1J9Dms52yvba/gX3q79ATmVxQCGnOwiNL4IwXI2bhvFs/03503
         NgNr3kPzx+DD8ofd5KoZUUH45f3qFmve6F2sEHlhtank9IisWMbfSxjj1a8LqeSgFxmb
         K1qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=1j8mYprm4NSXrebBTkMtq/4w1PKjiq0YEBas9xgHgxQ=;
        fh=KFxkXD2Jg0b3l6oSFBvGAJpFB/FvbhxzDjrYzmIHGN4=;
        b=QlK/Pt973B5yN3pJH0mCT1hjxGqW8yKDbNWAE08KU3Ln0jJ1p9s0q7xAW7mbw81XDb
         6Jc+bz0yDSNIOMXKEMas3oHK/bIBTUQ8rVkJalFvvyOcso3UaGVPsqfCYcuSIWlaHu/U
         G8De1y62bhvrKj4fscyACYec2VZh16+71+CH9ZTWTM+LI+oCI8fux2DJgAWPbmQK8tbY
         ZSBmyu5bwBwtwhvpe52Hsgo7pfXtnRyD+esOKwfcrVW6LLFl2yc/pADJf2D6ICS1hZkz
         f+uZsiyNgXmmWDtWDBRhupt1hTfTaJN9Dw4hLcJ3KIYfLKBizVJ3bYNiSjHWFtp9IMsz
         XJjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id q7-20020a5d6587000000b0033d927e7b1csi3574879wru.723.2024.02.27.02.51.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Feb 2024 02:51:49 -0800 (PST)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TkZ1V5Kwjz6J9xv;
	Tue, 27 Feb 2024 18:47:10 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 0695A140F4E;
	Tue, 27 Feb 2024 18:51:47 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Tue, 27 Feb
 2024 10:51:46 +0000
Date: Tue, 27 Feb 2024 10:51:45 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>
CC: "Daniel P . =?UTF-8?Q?Berrang=EF=BF=BD?=" <berrange@redhat.com>, "Eduardo
 Habkost" <eduardo@habkost.net>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>, Philippe =?UTF-8?Q?Mathieu-Daud=EF=BF=BD?=
	<philmd@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Richard
 Henderson" <richard.henderson@linaro.org>, Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?UTF-8?Q?Benn=EF=BF=BDe?= <alex.bennee@linaro.org>, Peter Maydell
	<peter.maydell@linaro.org>, "Sia Jee Heng" <jeeheng.sia@starfivetech.com>,
	<qemu-devel@nongnu.org>, <kvm@vger.kernel.org>, <qemu-riscv@nongnu.org>,
	<qemu-arm@nongnu.org>, "Zhenyu Wang" <zhenyu.z.wang@intel.com>, Dapeng Mi
	<dapeng1.mi@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>, Zhao Liu
	<zhao1.liu@intel.com>
Subject: Re: [RFC 4/8] hw/core: Add cache topology options in -smp
Message-ID: <20240227105145.0000106d@Huawei.com>
In-Reply-To: <Zd2pWVH4/eo3HM8j@intel.com>
References: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
	<20240220092504.726064-5-zhao1.liu@linux.intel.com>
	<20240226153947.00006fd6@Huawei.com>
	<Zd2pWVH4/eo3HM8j@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-TUID: mV5yURDV7xJU

On Tue, 27 Feb 2024 17:20:25 +0800
Zhao Liu <zhao1.liu@linux.intel.com> wrote:

> Hi Jonathan,
> 
> > Hi Zhao Liu
> > 
> > I like the scheme.  Strikes a good balance between complexity of description
> > and systems that actually exist. Sure there are systems with more cache
> > levels etc but they are rare and support can be easily added later
> > if people want to model them.  
> 
> Thanks for your support!
> 
> [snip]
> 
> > > +static int smp_cache_string_to_topology(MachineState *ms,  
> > 
> > Not a good name for a function that does rather more than that.  
> 
> What about "smp_cache_get_valid_topology()"?

Looking again, could we return the CPUTopoLevel? I think returning
CPU_TOPO_LEVEL_INVALID will replace -1/0 returns and this can just
be smp_cache_string_to_topology() as you have it in this version.

The check on the return value becomes a little more more complex
and I think you want to squash CPU_TOPO_LEVEL_MAX down so we only
have one invalid value to check at callers..  E.g.

static CPUTopoLevel smp_cache_string_to_topolgy(MachineState *ms,
                                                char *top_str,
                                                Error **errp)
{
    CPUTopoLevel topo = string_to_cpu_topo(topo_str);

    if (topo == CPU_TOPO_LEVEL_MAX || topo == CPU_TOP?O_LEVEL_INVALID) {
        return CPU_TOPO_LEVEL_INVALID;
    }

    if (!machine_check_topo_support(ms, topo) {
        error_setg(errp,
                   "Invalid cache topology level: %s. "
                   "The cache topology should match the CPU topology level",
//Break string like this to make it as grep-able as possible!
                   topo_str);
        return CPU_TOPO_LEVEL_INVALID;
    }

    return topo;

}                


The checks then become != CPU_TOPO_LEVEL_INVALID at each callsite.

Jonathan

