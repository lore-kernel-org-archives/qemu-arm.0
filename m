Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp678052njb;
        Fri, 18 Oct 2024 01:47:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWjPG4bhUWJYTc/dmCZle4nKyKkOTizTCYc/qvaMHE+z1pAN3PIcHd9e018Zjg10vl+T3cOJy+5rnNbfQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFc6rZuKLia8kkgUB+Bc0qGBihzNpQjIsOnZkZoDZDDWzG9+VQkmgrC8/brSAvt4/JLc/qY
X-Received: by 2002:a05:622a:4e9a:b0:45d:5c76:3b0c with SMTP id d75a77b69052e-460aed41a64mr18326291cf.25.1729241262705;
        Fri, 18 Oct 2024 01:47:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729241262; cv=none;
        d=google.com; s=arc-20240605;
        b=TRbvJvX9+i+F8Dlr7CDWZaG0Xh1vARjGgp3iW6FiScGMk3DlmN+PmEz3Z3E7bJBZsg
         XqPFu8LFA6Da4rBMomNZtEqNyiFtohvv3qff5UoSsDkpVIT8Yxa8/MFsMG6fSLVM9974
         h8vXJpjUHbmBwEeb0nD54PIfTEIGBEDvLMuYMuVhg1IyTSNl3CI4685yoHhLY5dvfRfQ
         4tDPwzZEwGH0dHKKp7LMNa2dYCoWz8jUtW+BsXP19QFV4PTEe7mr5FOilwQ9hyo2Fnuy
         7sxpwSblFlAd27WmEYvCeKQWdfOIabCKhaYPQS7JW3FabpdGmaM25CObcUinJ0tY2omr
         y8cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=qVNp83t4KvP+0JFAeZ0xWJPGUeIV/iwlbrgFZmmXSDc=;
        fh=QQOpfZPnaut2u+2c3+U9/oBko8UmIVD4d84QZgiM70o=;
        b=CT/HOA96E7uxfRPoZbBzCnZjzYWWRtN/kewR2+i/HAq2bzl85GeqlP2aFWuL9fYliY
         El3ZUOifq/JkDPaIXnp1l+/CikhLmLUNfS/xWt+jb35oe4gF+LkFvxgyhtRAm5xMTMZI
         VFraI0CTgbiPWRygCa+kIU7YIt2frdaadRFC2Zs5co8m8Kcc9ioyYIS+IZXyqmcunXAs
         +Confuesw0DzbjohY8quW1WW9xNZuC5yhIkzguYmjqNpaSs+k1WfYlJ9Aseo8DoW/RSH
         mXECVweBG0dICxqfiZVxnggj/Gp6aOhTu7kHMnR2HZXc5DuKcM2a/gFIR/46etmzCeLv
         S+5w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=TxUY4Mp+;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.11 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.11])
        by mx.google.com with ESMTPS id d75a77b69052e-460aea8d02dsi12165761cf.611.2024.10.18.01.47.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2024 01:47:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.11 as permitted sender) client-ip=198.175.65.11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=TxUY4Mp+;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.11 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729241262; x=1760777262;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=plBfgMHQMuI+dLmqLkuBbIQUiwBm4swhKQlf4bzVhk8=;
  b=TxUY4Mp+gb4RmhBdO95HEH9Vu9Cvan1WP8aoOb+AdiR5ub7jodTDinAW
   0gpdGUhzuPGHJrm7JeGbqlVIDhq+o3aIEe5IYzN+lvLq7FPAVxMhKpp5B
   efhsEPLq0yzTMUIttIXwnf1djAitWjTinZF7sLpr4tLuD7kpdicR4QpVB
   3IHdU+JPNDCuqQPKDV9P8ivCxpe3x7NfPYhxqsIUBZIFYbPRcBBgfjx+x
   7ycQZCxCGN9PEFG3A+XTsGo6h4IBrYC4j64hr5cx9PMMkn5FNa51kDGGx
   jhp48qky3hHvsEsE7jIHE+ZWvw2qa6jH5qeAfy50ElkGOJKMXWQZPHvZJ
   Q==;
X-CSE-ConnectionGUID: AnDcNStzT+SdoOtRfqlstA==
X-CSE-MsgGUID: i2JzusxWQiaokoyoFlXYUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39306046"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39306046"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 01:47:40 -0700
X-CSE-ConnectionGUID: 1X6bbWVLRPKGDBLVB3+qyQ==
X-CSE-MsgGUID: 0qGpU8v8T3qusDQ6TdvBUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="102105838"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa002.fm.intel.com with ESMTP; 18 Oct 2024 01:47:35 -0700
Date: Fri, 18 Oct 2024 17:03:51 +0800
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
Message-ID: <ZxIkdyJ2ysibi74R@intel.com>
References: <20241012104429.1048908-1-zhao1.liu@intel.com>
 <20241012104429.1048908-7-zhao1.liu@intel.com>
 <ZxEs3DGGgCqGT5yK@redhat.com>
 <ZxHcsPyqT6MLJ9hG@intel.com>
 <ZxIVC-XQaMqOy6Fw@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZxIVC-XQaMqOy6Fw@redhat.com>
X-TUID: FSjUz0plf4+N

On Fri, Oct 18, 2024 at 08:58:03AM +0100, Daniel P. Berrangé wrote:
> Date: Fri, 18 Oct 2024 08:58:03 +0100
> From: "Daniel P. Berrangé" <berrange@redhat.com>
> Subject: Re: [PATCH v3 6/7] i386/pc: Support cache topology in -machine for
>  PC machine
> 
> On Fri, Oct 18, 2024 at 11:57:36AM +0800, Zhao Liu wrote:
> > Hi Daniel,
> > 
> > > > +    ``smp-cache.0.cache=cachename,smp-cache.0.topology=topologylevel``
> > > > +        Define cache properties for SMP system.
> > > > +
> > > > +        ``cache=cachename`` specifies the cache that the properties will be
> > > > +        applied on. This field is the combination of cache level and cache
> > > > +        type. It supports ``l1d`` (L1 data cache), ``l1i`` (L1 instruction
> > > > +        cache), ``l2`` (L2 unified cache) and ``l3`` (L3 unified cache).
> > > > +
> > > > +        ``topology=topologylevel`` sets the cache topology level. It accepts
> > > > +        CPU topology levels including ``thread``, ``core``, ``module``,
> > > > +        ``cluster``, ``die``, ``socket``, ``book``, ``drawer`` and a special
> > > > +        value ``default``. If ``default`` is set, then the cache topology will
> > > > +        follow the architecture's default cache topology model. If another
> > > > +        topology level is set, the cache will be shared at corresponding CPU
> > > > +        topology level. For example, ``topology=core`` makes the cache shared
> > > > +        by all threads within a core.
> > > > +
> > > > +        Example:
> > > > +
> > > > +        ::
> > > > +
> > > > +            -machine smp-cache.0.cache=l1d,smp-cache.0.topology=core,smp-cache.1.cache=l1i,smp-cache.1.topology=core
> > > 
> > > There are 4 cache types, l1d, l1i, l2, l3.
> > > 
> > > In this example you've only set properties for l1d, l1i caches.
> > > 
> > > What does this mean for l2 / l3 caches ?
> > 
> > Omitting "cache" will default to using the "default" level.
> > 
> > I think I should add the above description to the documentation.
> > 
> > > Are they reported as not existing, or are they to be reported at
> > > some built-in default topology level.
> > 
> > It's the latter.
> > 
> > If a machine doesn't support l2/l3, then QEMU will also report the error
> > like:
> > 
> > qemu-system-*: l2 cache topology not supported by this machine
> 
> Ok, that's good.
> 
> > > If the latter, how does the user know what that built-in default is, 
> > 
> > Currently, the default cache model for x86 is L1 per core, L2 per core,
> > and L3 per die. Similar to the topology levels, there is still no way to
> > expose this to users. I can descript default cache model in doc.
> > 
> > But I feel like we're back to the situation we discussed earlier:
> > "default" CPU topology support should be related to the CPU model, but
> > in practice, QEMU supports it at the machine level. The cache topology
> > depends on CPU topology support and can only continue to be added on top
> > of the machine.
> > 
> > So do you think we can add topology and cache information in CpuModelInfo
> > so that query-cpu-model-expansion can expose default CPU/cache topology
> > information to users?
> > 
> > This way, users can customize CPU/cache topology in -smp and
> > -machine smp-cache. Although the QMP command is targeted at the CPU model
> > while our CLI is at the machine level, at least we can expose the
> > information to users.
> > 
> > If you agree to expose the default topology/cache info in
> > query-cpu-model-expansion, can I work on this in a separate series? :)
> 
> Yeah, lets worry about that another day.
> 
> It it sufficient to just encourage users to always specify
> the full set of caches.

Thanks!

> > > Can we explicitly disable a l2/l3 cache, or must it always exists ?
> > 
> > Now we can't disable it through -machine smp-cache (while x86 CPU support
> > l3-cache=off), but as you mentioned, I can try using "invalid" to support
> > this scenario, which would be more general. Similarly, if you agree, I
> > can also add this support in a separate series.
> 
> If we decide to offer a way to disable caches, probably better to have
> a name like 'disabled' for such a setting, and yes, we don't need todo
> that now.

Yes, "disabled" is better.

Regards,
Zhao

 
