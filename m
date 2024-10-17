Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp266539njb;
        Thu, 17 Oct 2024 08:30:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/ubSLgQdei6Xxp0VLJdPiFna1NhUJt2wLXGhM2B0pyFs6qQd1Um9/vEaP5xsdTfdPGw/lUm5ZYVcgwQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHchGyJBw8szMdDMF/C9dgawAab9XugsF812fcWiiP3peX2ZRK2Xs2buGBOhpSyz/8EeFXJ
X-Received: by 2002:a05:6102:3f09:b0:4a3:ef1e:8566 with SMTP id ada2fe7eead31-4a4659a86b4mr22764424137.17.1729179021351;
        Thu, 17 Oct 2024 08:30:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729179021; cv=none;
        d=google.com; s=arc-20240605;
        b=IoR2AWwz3c6q8Syzz+psSqjCHKMxgdtlEr79jHxors5Cp/4wTUqWXtSYQjOBWF3VuF
         Ri2RMb9PP9dex79bO+s5V6zT1fSUg0f473p9ZXrYqYJlXwDu3PWdHKWNo7I/1dvfw4KI
         WdA4QVI2bl/R32/IblILHZFzzz+Kiml8EhxrXZqCRdi5uEQxF0tzSpwEMerTP+dV66OW
         oRlVhy7deqc2EHMXbubQwbYL0VepsG3tPAlGLzx6yQbeT+zlgoY8E6xBsqgQPuBy5BWr
         z1ZbijykHUUr4kwrI6iQozYQSeFoZsnc9ZW1b6YWVRcyxV8xIyFZlyOLdr6zsfKL42CY
         TP1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=t1Xf++nCYGqvn/3bHmYFDtUgvJ4VAkFrA294hdhwlUo=;
        fh=uLhyhLRRukOpnVfM6/k5PvqMGWdfc4a2doIncLxt/dQ=;
        b=MCUa9OXU144M/Ck2uyDu8V+wQI/S+Ffdq+7WkCIHs9sQITNPdJhocae54AUr977T1W
         xUapUUcrefHA/qsPI/jTWXu/AE7+YFT71aa2F/ar+AZiujEGYfyUoTYgTDzguhaOdynT
         h1ytfb2SelAoeVuDnJvY+OVmM49A1RZyjmJTfPGlTLHFdmSlA9n54jBv/E9JHHSsfBOQ
         lPFALkmGQlQEan7pSVTFAniAgm5vrcDJ/FNi9YSi8kCT1s7it+1+r4FNVzTpnViajTcN
         nWyBerjk1gnlAJgNgH2v+hVwajYqG4GIZuy4y8vPmN3wUkaGkXfcrksX4R7c5QBQP91k
         w4lg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HvZj2vsh;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a5acb23dc4si1639003137.105.2024.10.17.08.30.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 08:30:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HvZj2vsh;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729179020;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=t1Xf++nCYGqvn/3bHmYFDtUgvJ4VAkFrA294hdhwlUo=;
	b=HvZj2vshIAS/qeRj6Xi7DQmDf2duD+sBaX5f79CRMFDb1XT0JaKAQpyqGtlkCd3NAXwIfB
	Aq5TLlySyG/wH4MlzxBH4h8vHqOdZEi5rIVtxQk5hIfMHnMbxI0Ch0+qUfJjvE9zuJCAd6
	EsWXWgPI7KU51isyU7OTnjrvriUtDLA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-651-84ov-eGgM-6A_V_UMaU9cw-1; Thu,
 17 Oct 2024 11:30:17 -0400
X-MC-Unique: 84ov-eGgM-6A_V_UMaU9cw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3453819560BA;
	Thu, 17 Oct 2024 15:30:15 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.94])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CE6E519560A2;
	Thu, 17 Oct 2024 15:30:06 +0000 (UTC)
Date: Thu, 17 Oct 2024 16:30:03 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Alireza Sanaee <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>
Subject: Re: [PATCH v3 1/7] hw/core: Make CPU topology enumeration
 arch-agnostic
Message-ID: <ZxEte1KBwWuCdkb1@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241012104429.1048908-1-zhao1.liu@intel.com>
 <20241012104429.1048908-2-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241012104429.1048908-2-zhao1.liu@intel.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: KOHYDSG46fxG

On Sat, Oct 12, 2024 at 06:44:23PM +0800, Zhao Liu wrote:
> Cache topology needs to be defined based on CPU topology levels. Thus,
> define CPU topology enumeration in qapi/machine.json to make it generic
> for all architectures.
> 
> To match the general topology naming style, rename CPU_TOPO_LEVEL_* to
> CPU_TOPOLOGY_LEVEL_*, and rename SMT and package levels to thread and
> socket.
> 
> Also, enumerate additional topology levels for non-i386 arches, and add
> a CPU_TOPOLOGY_LEVEL_DEFAULT to help future smp-cache object to work
> with compatibility requirement of arch-specific cache topology models.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> Tested-by: Yongwei Ma <yongwei.ma@intel.com>
> ---
> Changes since Patch v2:
>  * Updated version of new QAPI structures to v9.2. (Jonathan)
> 
> Changes since Patch v1:
>  * Dropped prefix of CpuTopologyLevel enumeration. (Markus)
>  * Rename CPU_TOPO_LEVEL_* to CPU_TOPOLOGY_LEVEL_* to match the QAPI's
>    generated code. (Markus)
> 
> Changes since RFC v2:
>  * Dropped cpu-topology.h and cpu-topology.c since QAPI has the helper
>    (CpuTopologyLevel_str) to convert enum to string. (Markus)
>  * Fixed text format in machine.json (CpuTopologyLevel naming, 2 spaces
>    between sentences). (Markus)
>  * Added a new level "default" to de-compatibilize some arch-specific
>    topo settings. (Daniel)
>  * Moved CpuTopologyLevel to qapi/machine-common.json, at where the
>    cache enumeration and smp-cache object would be added.
>    - If smp-cache object is defined in qapi/machine.json, storage-daemon
>      will complain about the qmp cmds in qapi/machine.json during
>      compiling.
> 
> Changes since RFC v1:
>  * Used QAPI to enumerate CPU topology levels.
>  * Dropped string_to_cpu_topo() since QAPI will help to parse the topo
>    levels.
> ---
>  hw/i386/x86-common.c       |   4 +-
>  include/hw/i386/topology.h |  22 +-----
>  qapi/machine-common.json   |  46 +++++++++++-
>  target/i386/cpu.c          | 144 ++++++++++++++++++-------------------
>  target/i386/cpu.h          |   4 +-
>  5 files changed, 124 insertions(+), 96 deletions(-)
> 

> diff --git a/include/hw/i386/topology.h b/include/hw/i386/topology.h
> index dff49fce1154..bf740383038b 100644
> --- a/include/hw/i386/topology.h
> +++ b/include/hw/i386/topology.h
> @@ -39,7 +39,7 @@

>      unsigned threads_per_core;
>  } X86CPUTopoInfo;
>  
> -/*
> - * CPUTopoLevel is the general i386 topology hierarchical representation,
> - * ordered by increasing hierarchical relationship.
> - * Its enumeration value is not bound to the type value of Intel (CPUID[0x1F])
> - * or AMD (CPUID[0x80000026]).
> - */
> -enum CPUTopoLevel {
> -    CPU_TOPO_LEVEL_INVALID,
> -    CPU_TOPO_LEVEL_SMT,
> -    CPU_TOPO_LEVEL_CORE,
> -    CPU_TOPO_LEVEL_MODULE,
> -    CPU_TOPO_LEVEL_DIE,
> -    CPU_TOPO_LEVEL_PACKAGE,
> -    CPU_TOPO_LEVEL_MAX,
> -};
> -

snip

> @@ -18,3 +18,47 @@
>  ##
>  { 'enum': 'S390CpuEntitlement',
>    'data': [ 'auto', 'low', 'medium', 'high' ] }
> +
> +##
> +# @CpuTopologyLevel:
> +#
> +# An enumeration of CPU topology levels.
> +#
> +# @invalid: Invalid topology level.

Previously all topology levels were internal to QEMU, and IIUC
this CPU_TOPO_LEVEL_INVALID appears to have been a special
value to indicate  the cache was absent ?

Now we're exposing this directly to the user as a settable
option. We need to explain what effect setting 'invalid'
has on the CPU cache config.

> +#
> +# @thread: thread level, which would also be called SMT level or
> +#     logical processor level.  The @threads option in
> +#     SMPConfiguration is used to configure the topology of this
> +#     level.
> +#
> +# @core: core level.  The @cores option in SMPConfiguration is used
> +#     to configure the topology of this level.
> +#
> +# @module: module level.  The @modules option in SMPConfiguration is
> +#     used to configure the topology of this level.
> +#
> +# @cluster: cluster level.  The @clusters option in SMPConfiguration
> +#     is used to configure the topology of this level.
> +#
> +# @die: die level.  The @dies option in SMPConfiguration is used to
> +#     configure the topology of this level.
> +#
> +# @socket: socket level, which would also be called package level.
> +#     The @sockets option in SMPConfiguration is used to configure
> +#     the topology of this level.
> +#
> +# @book: book level.  The @books option in SMPConfiguration is used
> +#     to configure the topology of this level.
> +#
> +# @drawer: drawer level.  The @drawers option in SMPConfiguration is
> +#     used to configure the topology of this level.
> +#
> +# @default: default level.  Some architectures will have default
> +#     topology settings (e.g., cache topology), and this special
> +#     level means following the architecture-specific settings.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
