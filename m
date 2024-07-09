Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3179523njb;
        Tue, 9 Jul 2024 02:57:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9o2P8Wk5k/mDNVkD3VdZ5SifJF4fvegn34bpmn63rZFe+tKsmHSgAab6g+cUHt8wF9UIJhBEIa9h8Z8Dph5b7Tqhgxgs5
X-Google-Smtp-Source: AGHT+IFLnA7WG/htHjbmoJ17IqekPatTITYEjNqXJJ8xnVVbKq72Km+LUEOp4TjTHvMACslIboFx
X-Received: by 2002:a05:622a:1496:b0:446:603c:5186 with SMTP id d75a77b69052e-447faad63bbmr21724871cf.60.1720519052102;
        Tue, 09 Jul 2024 02:57:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720519052; cv=none;
        d=google.com; s=arc-20160816;
        b=NM3CWX1Svqm9y5BX2nOpdlrCPCSG/Zjsuw7d+ZL0YlHuKG1P8/GtZ2eBsB/oCfSLFs
         fURfOlaaKboNInGcvLnobi3vFQUtcMd4HCaKMhRIC4PTtmQq2PMicABndi6j2JIKRQsN
         RZkVoayQRVs0jKErenPoO0cwek2qnyABeNHL1RBP1dObAYvBYdyBuoCDUYYjznIQLP4U
         zX6LoIzL6/zTkKDQvKfCreeLH2HHs1ShvnyVCwUseoBagNqlP1TVe6mCxrSGzBIrEXD3
         KUH5aaV5lbonrjgq7T8jMzEkhTwwL22bagJq+XIOzO+lSAHJ5kD4FIbNanKsn/ud8MVE
         jZvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=gjx7IAnbusUJ3pcRvZsROp/gNXP9KrHtdDUZ4LqWIrg=;
        fh=HZ23Ce31kgWpnp7Zrrte7fhPmQrTXlsoRqCWW+X3jhc=;
        b=JhlB69btfQcws+LdPQuEnklOG3HXqUJ9H30FFL3p09A5hJAH44cy16n3YSPlryYbgk
         aEkPKSxWxGQEJn5OiQmUKquGnjTqPSy2OFubMjC3VDm8yrtiBHTijbkynWp/rMqeoOhZ
         p8t8eYZ4c/w7866PwDXl2lZPEv/USAsJeZkMoNFRJJF6KvkbhSwUJtsIYuW0nndHA5vL
         VCzG0nrbt8N/bKWe/wUJToK6DrMJyIJ5yBL27yu7rf5JsrbgDZ9rO0RKJNcDR6fjuTvj
         RCDYrjcwkbW6Z4rVWwJ5j/W5BQaSm4hkyx4mMT/CmSEM7C7ME8FQL1esI1Go2jI0T530
         yyzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=ZJ4K6LeL;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.12 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.12])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9be8486si17848571cf.578.2024.07.09.02.57.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 02:57:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.12 as permitted sender) client-ip=192.198.163.12;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=ZJ4K6LeL;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.12 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720519052; x=1752055052;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ql3XWi50DdULpswcLK+rmYBSYuNy0QrKcY67jvFg2+g=;
  b=ZJ4K6LeL23lHyxhzR52RR2gWGoBwelCbkLU2bTEfnHqu6DVbWfwhDQ0H
   aIJ1IYGb+IQbLW3V97bxqcXkCy16Qh7bRQbxO4Ur5UQIdaPM6KF7xa+dh
   J/8MIrUhnl4H0VdQhCTkh8HAhO6ZpQnEg2jMM5r1OqKep1nu3rpjjtefK
   lTB8RDIXIG3LGI/8iXzRsfQV/VmW+xaMECC3jRPOskLpKeHlyEedcBaVG
   dJw8JyirLq+jNe/lb3lWA5dtk6EOirVDm4UZeTLn2CIxtEuVd63F1nuqy
   RSBFLalo22sfzEMX0J0SIZoBohJA+X23QR6ZXd95DDYJanO6T93HJDRNj
   A==;
X-CSE-ConnectionGUID: A2JxZ5vcSYuw7OQrP326fw==
X-CSE-MsgGUID: M7Ado9NeRXOaTZKAVxGYSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="21630497"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="21630497"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 02:57:30 -0700
X-CSE-ConnectionGUID: ijrOueipQbWj08U6YPj+LA==
X-CSE-MsgGUID: GQMV+uZ1SlynX0EEJuSMAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="85349963"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa001.jf.intel.com with ESMTP; 09 Jul 2024 02:57:25 -0700
Date: Tue, 9 Jul 2024 18:13:04 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>
Subject: Re: [PATCH 2/8] qapi/qom: Introduce smp-cache object
Message-ID: <Zo0NMDmYKRVWe9Ht@intel.com>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
 <20240704031603.1744546-3-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704031603.1744546-3-zhao1.liu@intel.com>
X-TUID: iMqhhrMUB+VP

> diff --git a/hw/core/smp-cache.c b/hw/core/smp-cache.c
> new file mode 100644
> index 000000000000..c0157ce51c8f
> --- /dev/null
> +++ b/hw/core/smp-cache.c
> @@ -0,0 +1,103 @@
> +/*
> + * Cache Object for SMP machine
> + *
> + * Copyright (C) 2024 Intel Corporation.
> + *
> + * Author: Zhao Liu <zhao1.liu@intel.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> + * later.  See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "hw/core/smp-cache.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-visit-machine-common.h"
> +#include "qom/object_interfaces.h"
> +
> +static void
> +smp_cache_get_cache_prop(Object *obj, Visitor *v, const char *name,
> +                         void *opaque, Error **errp)
> +{
> +    SMPCache *cache = SMP_CACHE(obj);
> +    SMPCachePropertyList *head = NULL;
> +    SMPCachePropertyList **tail = &head;
> +
> +    for (int i = 0; i < SMP_CACHE__MAX; i++) {
> +        SMPCacheProperty *node = g_new(SMPCacheProperty, 1);
> +
> +        node->name = cache->props[i].name;
> +        node->topo = cache->props[i].topo;
> +        QAPI_LIST_APPEND(tail, node);
> +    }
> +
> +    if (!visit_type_SMPCachePropertyList(v, name, &head, errp)) {
> +        return;

Oops, here I shouldn't return. Whether it succeeds or not, I should
continue with the following free().

> +    }
> +    qapi_free_SMPCachePropertyList(head);
> +}
