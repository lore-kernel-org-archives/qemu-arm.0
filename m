Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp42932njg;
        Tue, 17 Sep 2024 01:51:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXuuiccH0oQmNXvcHWafw/o89f9DKC/PEw7g9iYnRliIQj+W5WnX5o+ZOc9x5FC6xlD0XHc5aSkzapayA==@linaro.org
X-Google-Smtp-Source: AGHT+IGDXfaZprhgqmc+VI6zSQjE3Fzl/zwaK2OPI08kAm4fLw3qel2E4QO7mULEeKl5y0XpA8Yv
X-Received: by 2002:a05:600c:4f83:b0:42c:b950:680b with SMTP id 5b1f17b1804b1-42cdb54a0c8mr109111485e9.20.1726563091358;
        Tue, 17 Sep 2024 01:51:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726563091; cv=none;
        d=google.com; s=arc-20240605;
        b=Z5I92UPOL+O0Gi/O7dKKKJ6iksfVswu0c8MmBe3txfYt9K57PbWWWDY6EQIaaM/JWO
         CUvxTp6kO7n4+09mQ7rcM/Fm38k2/6naWi90a1xf3DgX0IUN5zpmnskzQakhsPFSK2l5
         my69W014X/nwt3rNBPtVSkn7SjXWfcpXI0lJOKMmMhKHCacCB8jl1de6iAiq4Uj4tbhD
         8vB9rBgk6QrAiJwV5+SXD0JOONZP6E81BnoiJC8lLQ+scZVB9w4+ocZ48hT126DZN9uB
         w5RSPMJy9kRRcoSLd1wYI9uzMop+41x2+usLZh8vSW4UqLnDJPh6oIr+/7nsTpd115GR
         JZ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=y2LxsdUWBjciDro7auaUcPbKPS5CDXjcBJ+cegcyH2o=;
        fh=rz0whkzKUoIAfodBYJKNiVKk8Ex0Rrp+MqNzSzdvwN0=;
        b=dyeiQLyVjEwgFdZzYF8K8JjdeDhuhO9QzSdHZ83K65Y7Kcx52Hj8YhayHccZCJE1Xp
         7EqHPtcgsmPnrBsj1upBFb0x+ltF64zGC06Hzim7mHIGiDJRohdwhAraTEOU/ukJUGF1
         3YCzMVRyLbHcqHgYSr8dSyXPcxj6YXRL2iThqcKfNbUsZbYKto+WxRqlqUNqpQJlfKB6
         Gzr7L1ykhDJq42wM+z1gjrrZFhdy9YxLpiA3YK9HWrA5XLgbPZrGY1REIrVQRZAEONX2
         8qDv/x7D/+9VBTmlYaljJ6DGCPPEVCSqLgVXYUtvnc6CS4StC0Ngg3utsfKkgR4Fl686
         bXNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-42d9b1925d5si44279945e9.200.2024.09.17.01.51.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Sep 2024 01:51:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4X7FlR55gRz6K5rh;
	Tue, 17 Sep 2024 16:47:15 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id AC8E4140CB9;
	Tue, 17 Sep 2024 16:51:29 +0800 (CST)
Received: from localhost (10.48.145.97) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 17 Sep
 2024 10:51:28 +0200
Date: Tue, 17 Sep 2024 09:51:26 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P .\" =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Igor  Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel  Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Ma?=  =?ISO-8859-1?Q?thieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang  <wangyanan55@huawei.com>,  Michael S.Tsirkin  <mst@redhat.com>, Paolo Bonzini  <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Eric  Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Marcelo  Tosatti <mtosatti@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=  <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, Sia Jee  Heng <jeeheng.sia@starfivetech.com>, Alireza Sanaee  <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org, kvm@vger.kernel.org,  qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhenyu Wang  <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, Yongwei Ma  <yongwei.ma@intel.com>"@domain.invalid
Subject: Re: [PATCH v2 2/7] qapi/qom: Define cache enumeration and
 properties
Message-ID: <20240917095126.000036f1@Huawei.com>
In-Reply-To: <20240908125920.1160236-3-zhao1.liu@intel.com>
References: <20240908125920.1160236-1-zhao1.liu@intel.com>
	<20240908125920.1160236-3-zhao1.liu@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.145.97]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: 5KFe4SAD+8PP

On Sun,  8 Sep 2024 20:59:15 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> The x86 and ARM need to allow user to configure cache properties
> (current only topology):
>  * For x86, the default cache topology model (of max/host CPU) does not
>    always match the Host's real physical cache topology. Performance can
>    increase when the configured virtual topology is closer to the
>    physical topology than a default topology would be.
>  * For ARM, QEMU can't get the cache topology information from the CPU
>    registers, then user configuration is necessary. Additionally, the
>    cache information is also needed for MPAM emulation (for TCG) to
>    build the right PPTT.
> 
> Define smp-cache related enumeration and properties in QAPI, so that
> user could configure cache properties for SMP system through -machine in
> the subsequent patch.
> 
> Cache enumeration (CacheLevelAndType) is implemented as the combination
> of cache level (level 1/2/3) and cache type (data/instruction/unified).
> 
> Currently, separated L1 cache (L1 data cache and L1 instruction cache)
> with unified higher-level cache (e.g., unified L2 and L3 caches), is the
> most common cache architectures.
> 
> Therefore, enumerate the L1 D-cache, L1 I-cache, L2 cache and L3 cache
> with smp-cache object to add the basic cache topology support. Other
> kinds of caches (e.g., L1 unified or L2/L3 separated caches) can be
> added directly into CacheLevelAndType if necessary.
> 
> Cache properties (SmpCacheProperties) currently only contains cache
> topology information, and other cache properties can be added in it
> if necessary.
> 
> Note, define cache topology based on CPU topology level with two
> reasons:
> 
>  1. In practice, a cache will always be bound to the CPU container
>     (either private in the CPU container or shared among multiple
>     containers), and CPU container is often expressed in terms of CPU
>     topology level.
>  2. The x86's cache-related CPUIDs encode cache topology based on APIC
>     ID's CPU topology layout. And the ACPI PPTT table that ARM/RISCV
>     relies on also requires CPU containers to help indicate the private

Really trivial but CPU Containers are a different ACPI concept.
For PPTT they are referred to as Processor Groups. Wonderfully they
'might match a Processor Container in the namespace' which rather implies
they might not.  In QEMU they always will because the next bit of the
spec matters. "In that case this entry will match the value of the _UID
method of the associated processor container. Where there is a match it must
be represented."

So having said all that, CPU container is probably fine as a description.

>     shared hierarchy of the cache. Therefore, for SMP systems, it is
>     natural to use the CPU topology hierarchy directly in QEMU to define
>     the cache topology.
> 
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Seems fine but my gut would be to combine this and next patch so we can
see how it is used (assuming no one asked for it to be separate!)

Version numbers need an update I guess.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> +##
> +# @SmpCachePropertiesWrapper:
> +#
> +# List wrapper of SmpCacheProperties.
> +#
> +# @caches: the list of SmpCacheProperties.
> +#
> +# Since 9.1

Needs updating to 9.2 I guess.

> +##
> +{ 'struct': 'SmpCachePropertiesWrapper',
> +  'data': { 'caches': ['SmpCacheProperties'] } }
