Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp581704njb;
        Thu, 17 Oct 2024 20:41:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUGyYZjtKjwS63Vbov0itA0pXUWX1BbJOdqK4hhx45sLfC9LWUsA03rGBhAbcTWW+1SRhET/VFKUnfcJg==@linaro.org
X-Google-Smtp-Source: AGHT+IGiTTnoWo5w2wm/GCv3IkyLtKPvm9DZ5zFCYlx70kkLXzHkn/VoCWMbazHQgTP4Q7oxH5fn
X-Received: by 2002:a05:620a:2492:b0:7af:cdd7:d6e5 with SMTP id af79cd13be357-7b157b43481mr142089985a.5.1729222889343;
        Thu, 17 Oct 2024 20:41:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729222889; cv=none;
        d=google.com; s=arc-20240605;
        b=HH2F5jaSXiCKsZzp0iOQMn+u3yMoYb+eANP4f4bwgoC9hHpCqkJuDqB6mh72vRPjPA
         2V1xyW5pKDsZh28Vtebnx42LCNE8a9F3nZp7BxZD1TOa16QknFLPPCMbuXwew2AAwqBU
         aUV8RH36kAPti7w8QIDE98dmfW9TuHNBXKJUw2/6l0Ln1nzeMNSLMZ+PZNMbF0L0JymR
         S6hqhHk5Q2SrOz6yH/Y3AM6XVpGJ7Mx9JBNBiL/aPkRwJeOBRzFd8cnElcD+3jG7zT0w
         phqUFhKphk8ravrWBDzn0syUuFxB3Fy/lwP1KXHqnTyTmt7z+pfANvvqOo/unHnContN
         A7dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=fojYLYGwuNhCuF+grLgc5CeTURw9xVLTZ9WbrTAQQCc=;
        fh=QQOpfZPnaut2u+2c3+U9/oBko8UmIVD4d84QZgiM70o=;
        b=UCWPDKCw1RSQGq8W/T3U54UX6VcZLJ0s0qKGTyZ74RD+wy/+MTJAp6l2q5Ibh9cKkS
         P0NfCLW1Fega43qQsfL2iLNLwXJuEOTmsPxvHXzYBF5VwHH+zr3ctF5pPDoEubnsDa89
         XvAHvi7UYPnl4nNfqtKASe2O3q0Ay9aq6rNhsCLjsaJvyqShscUnPcPBc9wudtVETQrn
         tPTetaJnyy1BrigCESu3GN3Kdoj/WBn2cVAExGKATGYOi0YULTh8JxiIkNKVm71ERL2X
         NZoo5SEc18Tz32huWWVEJQ1OP87lyPlhvjijlfltr+cFWqa6IHhWK7m7mNRVV4vtLZZW
         LpiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Sa+GhaAq;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.17 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b156fe5faesi92297085a.444.2024.10.17.20.41.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 20:41:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.17 as permitted sender) client-ip=192.198.163.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Sa+GhaAq;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.17 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729222889; x=1760758889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L5YH9Y1EQZKE2ItXEjex7LOcAdkKR8Mn+jEmyjCz4xs=;
  b=Sa+GhaAq9b6BhvvsA79Mry7xLjC0nOHEwNzuXUAvD8/7nH5tlO7Co4+X
   1iZolcyDBHuvrNps9TIBSbq3DfRdjHrQbnJd847iOCPkwWxthv1fiPf29
   s79ZBXMGSaQivuNx4+iME+I9QfhzzbdtFRhPH+rg0iF9P4k2Q1gFxC0DR
   LEbgrakjjijh+qFrr8dEBZBMgQHBWIn8e/3xi6s/nNl9G2hv+evyUlc8d
   gnY8DXa6L+Q8+k9GwHI/on5moVa/N/IFfTcHOYyyLiQbOU/j5Ny3lHg/E
   7x3cTzeafD56BqEoESew0vX2m7/FvLzJTEr5zvoJm6biTEkkvwaOdTHlR
   A==;
X-CSE-ConnectionGUID: ubHkw865Rcika/W2OFTCpw==
X-CSE-MsgGUID: mXgBtTYbR7OU9dXcfudwEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28623131"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="28623131"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 20:41:27 -0700
X-CSE-ConnectionGUID: uN0AIhknT6ORiSDRsmYrVw==
X-CSE-MsgGUID: oZCzeqvgTuSFPN9dk1XFsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="83818764"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa004.jf.intel.com with ESMTP; 17 Oct 2024 20:41:21 -0700
Date: Fri, 18 Oct 2024 11:57:36 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>,
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
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Alireza Sanaee <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH v3 6/7] i386/pc: Support cache topology in -machine for
 PC machine
Message-ID: <ZxHcsPyqT6MLJ9hG@intel.com>
References: <20241012104429.1048908-1-zhao1.liu@intel.com>
 <20241012104429.1048908-7-zhao1.liu@intel.com>
 <ZxEs3DGGgCqGT5yK@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxEs3DGGgCqGT5yK@redhat.com>
X-TUID: xpeeWrU2mIhO

Hi Daniel,

> > +    ``smp-cache.0.cache=cachename,smp-cache.0.topology=topologylevel``
> > +        Define cache properties for SMP system.
> > +
> > +        ``cache=cachename`` specifies the cache that the properties will be
> > +        applied on. This field is the combination of cache level and cache
> > +        type. It supports ``l1d`` (L1 data cache), ``l1i`` (L1 instruction
> > +        cache), ``l2`` (L2 unified cache) and ``l3`` (L3 unified cache).
> > +
> > +        ``topology=topologylevel`` sets the cache topology level. It accepts
> > +        CPU topology levels including ``thread``, ``core``, ``module``,
> > +        ``cluster``, ``die``, ``socket``, ``book``, ``drawer`` and a special
> > +        value ``default``. If ``default`` is set, then the cache topology will
> > +        follow the architecture's default cache topology model. If another
> > +        topology level is set, the cache will be shared at corresponding CPU
> > +        topology level. For example, ``topology=core`` makes the cache shared
> > +        by all threads within a core.
> > +
> > +        Example:
> > +
> > +        ::
> > +
> > +            -machine smp-cache.0.cache=l1d,smp-cache.0.topology=core,smp-cache.1.cache=l1i,smp-cache.1.topology=core
> 
> There are 4 cache types, l1d, l1i, l2, l3.
> 
> In this example you've only set properties for l1d, l1i caches.
> 
> What does this mean for l2 / l3 caches ?

Omitting "cache" will default to using the "default" level.

I think I should add the above description to the documentation.

> Are they reported as not existing, or are they to be reported at
> some built-in default topology level.

It's the latter.

If a machine doesn't support l2/l3, then QEMU will also report the error
like:

qemu-system-*: l2 cache topology not supported by this machine

> If the latter, how does the user know what that built-in default is, 

Currently, the default cache model for x86 is L1 per core, L2 per core,
and L3 per die. Similar to the topology levels, there is still no way to
expose this to users. I can descript default cache model in doc.

But I feel like we're back to the situation we discussed earlier:
"default" CPU topology support should be related to the CPU model, but
in practice, QEMU supports it at the machine level. The cache topology
depends on CPU topology support and can only continue to be added on top
of the machine.

So do you think we can add topology and cache information in CpuModelInfo
so that query-cpu-model-expansion can expose default CPU/cache topology
information to users?

This way, users can customize CPU/cache topology in -smp and
-machine smp-cache. Although the QMP command is targeted at the CPU model
while our CLI is at the machine level, at least we can expose the
information to users.

If you agree to expose the default topology/cache info in
query-cpu-model-expansion, can I work on this in a separate series? :)

> and avoid nonsense like l1d being at socket level, and l3 being at the
> core level ?

Thank you! I ensured l1 must be lower than l2 and l2 must be lower than
l3, but missed l1 must be lower than l3.

The level check is incomplete due to the influence of "default." I think
the check should be placed after the arch CPU sets the cache model,
so that "default" is consumed.

> Can we explicitly disable a l2/l3 cache, or must it always exists ?

Now we can't disable it through -machine smp-cache (while x86 CPU support
l3-cache=off), but as you mentioned, I can try using "invalid" to support
this scenario, which would be more general. Similarly, if you agree, I
can also add this support in a separate series.

> The QAPI has an "invalid" topology level. You've not documented
> that as permitted here, but the qapi parser will happily allow
> it. What semantics will that have ? 

Because the current this patch throws an error for "invalid", so I didn't
included it in the doc.

Thanks,
Zhao
