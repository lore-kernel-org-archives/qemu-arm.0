Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2137113ejf;
        Mon, 26 Feb 2024 07:47:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX7ki3eFlgj2Kw9OiPR7GWqEwShSCEKjmYsfwg3+U+zohxRN0Op65RvHVJoTFT0otGBW/Tzx/jPEITJfGo/GcqKeO+s+GR6
X-Google-Smtp-Source: AGHT+IFIMxDM3LZGyFT6Sg58FRKuQX/bs5tX04kJiCyGwcrIv5Gz27gNXLwdQAj97IclGpqtQpz9
X-Received: by 2002:adf:fd87:0:b0:33d:b2d7:6264 with SMTP id d7-20020adffd87000000b0033db2d76264mr4900074wrr.51.1708962456819;
        Mon, 26 Feb 2024 07:47:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708962456; cv=none;
        d=google.com; s=arc-20160816;
        b=eo7toEQGkiEgKBv4NNGE7T9150JEvI484gTG+mRjVHIriAjZ1HRRSToTGj27vsrDlf
         jk5ir31EsP0mdycEZz7oVKKIDtyZjkv8UscU6k7OzuRS88xncRvSxa7HO0ZwXeebpP5i
         40MKRTbKjjp5IPKXiUXEvVDZyK+cXt7Bq2dUbPjuJTUfkLlzsI/SipeOtCtrQQQbUhlK
         5nHlh/eIEH2NGpUk3wqEoxzX9zQstaPwWaWldoNbpdni6NsXcQI/i+9ZqQ/AK8QdJduX
         IXKa5QdiZuR+KfG9pttmImfewje6WYJtevD834R0E109cHhqtu3bDTSRLQSWBemqRuY/
         jtLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=t91U4clDVnQiwk39Uxy/q0kZHu5gkrq3b82tPVkiakI=;
        fh=etCafUcGIfuy9fpedZpS24JHtYkPJpeDuHj2A+BIf6Y=;
        b=BLta9n2OaaDL0j3wKDYDpCP+UaVChsPHDHb6WAzmcLlF/8umIJD74D4kupRGBPtREG
         25443jtx3XIi/umlcZSsL8yffOXqkrkZtPCUeQ2UXRhV7bS8FLveoeDWHjoGzHftAOr0
         TLx7dlScQloxBz8HuQXDmWxm4vaN2dDP/cviEv1PdTJ3kS0zttBOE6zT5a5Bn8dWhAjY
         vJj2W+Y8SrgUlF7eeFc/5xOGRT3UjxYZxEF79290NOX2n93KyqQpNDCS82bi7ErKmS+C
         QLQdLWTLYQcrBTwEEsNyXQsoNHM/eTq1L/ut3VvfD9upo/onbphvHO8g80uLullV/lzl
         aDEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id j9-20020adfe509000000b0033cf4e47492si2719442wrm.49.2024.02.26.07.47.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Feb 2024 07:47:36 -0800 (PST)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Tk4dK68jwz6JBV6;
	Mon, 26 Feb 2024 23:43:01 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id DF0BE140DAF;
	Mon, 26 Feb 2024 23:47:35 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 26 Feb
 2024 15:47:35 +0000
Date: Mon, 26 Feb 2024 15:47:34 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>
CC: "Daniel P . =?ISO-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>, "Eduardo
 Habkost" <eduardo@habkost.net>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
	<philmd@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Richard
 Henderson" <richard.henderson@linaro.org>, Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Peter Maydell
	<peter.maydell@linaro.org>, "Sia Jee Heng" <jeeheng.sia@starfivetech.com>,
	<qemu-devel@nongnu.org>, <kvm@vger.kernel.org>, <qemu-riscv@nongnu.org>,
	<qemu-arm@nongnu.org>, "Zhenyu Wang" <zhenyu.z.wang@intel.com>, Dapeng Mi
	<dapeng1.mi@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>, Zhao Liu
	<zhao1.liu@intel.com>
Subject: Re: [RFC 8/8] qemu-options: Add the cache topology description of
 -smp
Message-ID: <20240226154734.00000d6e@Huawei.com>
In-Reply-To: <20240220092504.726064-9-zhao1.liu@linux.intel.com>
References: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
	<20240220092504.726064-9-zhao1.liu@linux.intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-TUID: d+mpcUuJGsX/

On Tue, 20 Feb 2024 17:25:04 +0800
Zhao Liu <zhao1.liu@linux.intel.com> wrote:

> From: Zhao Liu <zhao1.liu@intel.com>
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

Hi,

A trivial comment, but also a possibly more significant one about
whether the defaults are correctly verified.

Jonathan
> ---
>  qemu-options.hx | 54 ++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 47 insertions(+), 7 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 70eaf3256685..85c78c99a3b0 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -281,7 +281,9 @@ ERST
>  
>  DEF("smp", HAS_ARG, QEMU_OPTION_smp,
>      "-smp [[cpus=]n][,maxcpus=maxcpus][,drawers=drawers][,books=books][,sockets=sockets]\n"
> -    "               [,dies=dies][,clusters=clusters][,cores=cores][,threads=threads]\n"
> +    "               [,dies=dies][,clusters=clusters][,modules=modules][,cores=cores]\n"
> +    "               [,threads=threads][,l1d-cache=level][,l1i-cache=level][,l2-cache=level]\n"
burns more characters but I'd go with
l1d->cache=topo_level

As level for a cache has a totally different meaning!

> +    "               [,l3-cache=level]\n"
>      "                set the number of initial CPUs to 'n' [default=1]\n"
>      "                maxcpus= maximum number of total CPUs, including\n"
>      "                offline CPUs for hotplug, etc\n"
> @@ -290,9 +292,14 @@ DEF("smp", HAS_ARG, QEMU_OPTION_smp,
>      "                sockets= number of sockets in one book\n"
>      "                dies= number of dies in one socket\n"
>      "                clusters= number of clusters in one die\n"
> -    "                cores= number of cores in one cluster\n"
> +    "                modules= number of modules in one cluster\n"
> +    "                cores= number of cores in one module\n"
>      "                threads= number of threads in one core\n"
> -    "Note: Different machines may have different subsets of the CPU topology\n"
> +    "                l1d-cache= topology level of L1 D-cache\n"
> +    "                l1i-cache= topology level of L1 I-cache\n"
> +    "                l2-cache= topology level of L2 cache\n"
> +    "                l3-cache= topology level of L3 cache\n"
> +    "Note: Different machines may have different subsets of the CPU and cache topology\n"

>  
>          -smp 32,sockets=2,dies=2,modules=2,cores=2,threads=2,maxcpus=32
>  
> +    The following sub-option defines a CPU topology hierarchy (2 sockets
> +    totally on the machine, 2 dies per socket, 2 modules per die, 2 cores per
> +    module, 2 threads per core) with 3-level cache topology hierarchy (L1
> +    D-cache per core, L1 I-cache per core, L2 cache per core and L3 cache per
> +    die) for PC machines which support sockets/dies/modules/cores/threads.
> +    Some members of the CPU topology option can be omitted but their values
> +    will be automatically computed. Some members of the cache topology
> +    option can also be omitted and target CPU will use the default topology.:

Given the default could be inconsistent I wonder if we should 'push' levels
up.  So if L2 not defined it is set either to default of equal to max of
l1i and l1d level. L3 either default or same level as l2.

Won't always correspond to a sensible system so maybe just rejecting
cases where default isn't possible is the best plan.  However I don't
see that verification as the checks on higher levels are gated on them
being specified.

> +
> +    ::
> +
> +        -smp 32,sockets=2,dies=2,modules=2,cores=2,threads=2,maxcpus=32,\
> +             l1d-cache=core,l1i-cache=core,l2-cache=core,l3-cache=die
> +
>      The following sub-option defines a CPU topology hierarchy (2 sockets
>      totally on the machine, 2 clusters per socket, 2 cores per cluster,
>      2 threads per core) for ARM virt machines which support sockets/clusters
