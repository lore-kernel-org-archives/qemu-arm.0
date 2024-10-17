Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp46250njb;
        Thu, 17 Oct 2024 01:53:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXmxa5tYYAEKuO1FpW6CX1def9z1Jtqu/xP4e8PLr8DXv1VU1J4g2q/zhdVoYQA7KItm3XC5CWew2CFJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHtBQBKp9LMNSdqLjYbImHt9BT/PQurO7x3WLOBBqvkBk3cr/5vmjv9IJI+VDyEIWDPBFIi
X-Received: by 2002:a05:6870:818e:b0:287:471:41eb with SMTP id 586e51a60fabf-288eddb6348mr5723588fac.6.1729155187982;
        Thu, 17 Oct 2024 01:53:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729155187; cv=none;
        d=google.com; s=arc-20240605;
        b=byZQyHWtj4soLHACRJcSG/p79g7cc3tL8zovmSA1Q2Z/ljbGVeIB4I6b2ZfNqNWmt4
         ZOYGY6OZeTwf/rkal1FiMtH9MLFbeHEw5HSciES9GEJAKlaUC6qaj/dzSa5dSErc7/8E
         VLKSWv3XC6TfzZnsMgJHZWdql/Ssqcg9Rgya649pE23SCl4ajWQewMZhQljvGDnUPrzu
         BGx/qe80gUvu86dtuDWIb5yro3EBIJnSHvz1UelBejeYziv+eqHHB79tx13gpgXZqbaf
         TXE1kE1gHH+pGQ3NPEFbROQ1Joxa5OryrjfTUTcwYQyLOSO0mLVP1Zu0w81jeUPkfJss
         2i9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=vX3gnW8EUk95GMXTQ1fdNTbwgN7XDzE9UQxrXczmg74=;
        fh=rz0whkzKUoIAfodBYJKNiVKk8Ex0Rrp+MqNzSzdvwN0=;
        b=AO4Kf3ZFm1v62PP9Pf+hcQu75Z35dOSZhTCRRnJv5JbDHNxYaYmsq4787rHl0YwUig
         ZFjnjeCfa90X05dBBHcmTYXSnb6/WfcKATxqNdPI8lfrKgPuJqPwBCfCGos2iNcTgvj0
         eroTJ/G3bEFjXesXiXsAWxZsP5I76Pmw0bN2ZRTTUPnUhIB84kAO4e0DChsbc01AlL8k
         O2GF50k5y8Of7JOo68yfrgxwzKn7lLIdYHyrP7Xrrw3UK+ZqkJaipIOzvXY3MQdYKyqd
         WWVOrHTjGGZxSx84nF8+b2Nb5y7cOVFGaCT+arqJOLfYrwn+DHBDq9s6/HQ0kWA0X0Fq
         Uq4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d2e1a72fcca58-71e774b829esi6144958b3a.258.2024.10.17.01.53.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2024 01:53:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XThM45JL0z6LD8Q;
	Thu, 17 Oct 2024 16:48:32 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 1278D140B33;
	Thu, 17 Oct 2024 16:53:04 +0800 (CST)
Received: from localhost (10.126.174.164) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 17 Oct
 2024 10:53:00 +0200
Date: Thu, 17 Oct 2024 09:52:27 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P .\" =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Igor  Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel  Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Ma?=  =?ISO-8859-1?Q?thieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang  <wangyanan55@huawei.com>,  Michael S.Tsirkin  <mst@redhat.com>, Paolo Bonzini  <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Eric  Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Marcelo  Tosatti <mtosatti@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=  <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, Sia Jee  Heng <jeeheng.sia@starfivetech.com>, Alireza Sanaee  <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org, kvm@vger.kernel.org,  qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhenyu Wang  <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, Yongwei Ma  <yongwei.ma@intel.com>"@domain.invalid
Subject: Re: [PATCH v3 1/7] hw/core: Make CPU topology enumeration
 arch-agnostic
Message-ID: <20241017095227.00006d85@Huawei.com>
In-Reply-To: <20241012104429.1048908-2-zhao1.liu@intel.com>
References: <20241012104429.1048908-1-zhao1.liu@intel.com>
	<20241012104429.1048908-2-zhao1.liu@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.174.164]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: 2RBmxu5iyb3e

On Sat, 12 Oct 2024 18:44:23 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

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
LGTM with one incredibly trivial comment inline.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

>  #endif /* HW_I386_TOPOLOGY_H */
> diff --git a/qapi/machine-common.json b/qapi/machine-common.json
> index b64e4895cfd7..db3e499fb382 100644
> --- a/qapi/machine-common.json
> +++ b/qapi/machine-common.json
> @@ -5,7 +5,7 @@
>  # See the COPYING file in the top-level directory.
>  
>  ##
> -# = Machines S390 data types
> +# = Common machine types
>  ##
>  
>  ##
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

Really trivial but why a capital I on Invalid here but not the
t of thread below?

> +#
> +# @thread: thread level, which would also be called SMT level or
> +#     logical processor level.  The @threads option in
> +#     SMPConfiguration is used to configure the topology of this
> +#     level.
