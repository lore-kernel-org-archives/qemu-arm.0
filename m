Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp454461njf;
        Wed, 14 Aug 2024 05:12:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVOIWrq2+bRYZlxeM+7Q8BP6gNix2MYucO4mOgOsqdJfG+tPmLNBDEUlKgi3g3y/xlGuDHvJn0+Zz+J2FTUfAVDHMgVSeO9
X-Google-Smtp-Source: AGHT+IG0nfOquV9BOV6CIVCwGgx2d/v4T2g0TActzxzc15ISTQAkrcfLTCkViCBQcg8XirqviLLO
X-Received: by 2002:a5d:440f:0:b0:368:5a86:c1b7 with SMTP id ffacd0b85a97d-3717780ef7bmr1838043f8f.55.1723637554668;
        Wed, 14 Aug 2024 05:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723637554; cv=none;
        d=google.com; s=arc-20160816;
        b=HALqYzwgxX1KMDt6EYvBMp1rdXpj841e113YEUZy9UZKwFq5jjlEIjTMnxrLufFIWZ
         Zna/33QWe0Rcb1fjmYNqvZPvcPGU+ayYQe/IsTdZT1u/9C8A3FE9Vjdzo8SyYPd42xCo
         r1cVmdzeADeQIbPndENyCt1/ktAmRahWkFPfChWAnu/Nclxcd/worXakd91N3z+F9sCW
         lfrDjPngHfBYz9suxsQjVQRDHQfBtdP0IjO06/eyaUqFmX8NVf5bjx4m7/2QohWiPS2U
         HsI9rBemq4RiSNzyneic7FwdTWKcFEtLsRV/s6f15qHu7/PQepso5mSVmV8IM6MRBFKv
         Mpmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=t9vC7Npj2qyu/YibizvlfcaoY4yRDcIZRxvg03M/5rY=;
        fh=G6lv2zw0FMzs9nCFwmwZ3t1fu0414dKNs7dRRXSqle4=;
        b=QcSzmA6dWkp/ULEUbETp0pK5fGXk96HVAIA13QHPYea3V2/Agb5dsXW5HFC2p0rRVH
         6mwUohDfT/2XhTC9aAAstAmKSsMf3hmdZfAxMJ+5u0BpZ1wPleV0ldrkFswMzk5H2lHG
         ofi3UZfLA7oe4j9I3Gk/chdP9UbvXaXag3ncctEUFXYwX6gVb2PdpRk/vqUyuYGTOgfV
         XeBX8jt17vgX9lwPuSjsUfvw3lqoCOOuPwJn5zvnyZEUoDgntUDhnlj0qDW7AY5n1S+f
         zVzua8iSZxR0C3GkwhykICgeswcUHTxklL0OcCFYB6AiKF+obDLDDA8zW/UzTmphy7/E
         fDYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-36e4ecc8dd3si4940635f8f.844.2024.08.14.05.12.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Aug 2024 05:12:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WkRrz2Z6Hz6K9Fx;
	Wed, 14 Aug 2024 20:09:55 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 719EE140B2F;
	Wed, 14 Aug 2024 20:12:33 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 14 Aug
 2024 13:12:32 +0100
Date: Wed, 14 Aug 2024 13:12:31 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: Markus Armbruster <armbru@redhat.com>,
	"Daniel P .\" =?ISO-8859-1?Q?Be?=  =?ISO-8859-1?Q?rrang=E9?= <berrange@redhat.com>, Eduardo Habkost  <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang  <wangyanan55@huawei.com>,  Michael S.Tsirkin  <mst@redhat.com>, Paolo Bonzini  <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Eric  Blake <eblake@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, Alex  =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Peter Maydell  <peter.maydell@linaro.org>, Sia Jee Heng <jeeheng.sia@starfivetech.com>,  qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-riscv@nongnu.org,  qemu-arm@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi  <dapeng1.mi@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>"@domain.invalid
Subject: Re: [PATCH 8/8] qemu-options: Add the description of smp-cache
 object
Message-ID: <20240814131231.00007f49@Huawei.com>
In-Reply-To: <ZrnU25wxuqgST7x1@intel.com>
References: <20240704031603.1744546-9-zhao1.liu@intel.com>
	<87r0bl35ug.fsf@pond.sub.org>
	<Zp5vxtXWDeHAdPok@intel.com>
	<87bk2nnev2.fsf@pond.sub.org>
	<ZqEN1kZaQcuY4UPG@intel.com>
	<87le1psuv3.fsf@pond.sub.org>
	<ZqtXP9MViOlyhEsu@intel.com>
	<87mslweb38.fsf@pond.sub.org>
	<ZqyRik4UHHz3xaKl@intel.com>
	<8734ndj33j.fsf@pond.sub.org>
	<ZrnU25wxuqgST7x1@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-TUID: 0/lq0c1NFK2o


Just picking out one element.

> 
> > If I forcibly ignore all the considerations related to concrete syntax
> > in your message, a structure seems to emerge: there's a set of caches
> > identified by name (l1i, l1d, ...), and for each cache, we have a number
> > of configurable properties (topology level, ...).  Makes sense?  
> 
> Yes, you're right!
> 
> > What else will you need to configure in the future?  
> 
> Maybe cache size, as Jonathan mentioned for Arm side.

Everything that ends up in ACPI PPTT either via the relationships between
the various structures, or as data in the cache entries.
(some of this also goes in system registers, but this is a superset of
what is needed to generate PPTT for a guest on a KVM system by
reading a bunch of sysfs files on the host).

The topology stuff is about relationships (pointers effectively) in that table
the other is probably all the fields in "Cache Type Structure - Type 1"
- Size
- Number of sets
- Associativity
- Line size
- Allocation type (read allocate; write allocate; read and write alloc)
- (cache type - already encoded via l1i, l1d etc)
- Write Policy - (write back, write through)

> 
> > By the way, extending -machine to support JSON looks feasible to me at a
> > glance.  
>  
> Thanks again! Then I made it clear that it would be most appropriate to
> place the cache array in -machine, i.e., it's extensible and consistent
> with the design of the rest of the machine's properties, as well as
> consistent with my long-term needs.
> 
> Later on, if -machine is able to support JSON, it will also benefit from
> it. If I have time, I will also think about how -machine can support
> JSON.
> 
> Regards,
> Zhao
> 
> 
