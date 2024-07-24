Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp3136441njc;
        Wed, 24 Jul 2024 07:54:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWCypk0whAWvLW2PxN5ntyFjEnZERxb+F60YB3pr8bZbx4LPNihwWpGmrxsOEgQ0vbQmUX1DxeBEjx5SG0XTmt2If4Q3Qmj
X-Google-Smtp-Source: AGHT+IHT4+5aAnKDgS9BowZeUDrr/m91HJBdQshrrtZUlEvea8b6JLICjeRiFtrNIKlPuKrQg4ga
X-Received: by 2002:a05:620a:1924:b0:79f:176f:747a with SMTP id af79cd13be357-7a1ca19c5ddmr389342485a.66.1721832886978;
        Wed, 24 Jul 2024 07:54:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721832886; cv=none;
        d=google.com; s=arc-20160816;
        b=K/Ks64JOCbk7uQYNfx+Vs0OoIsmsL0DpAOGjbq8OQ8NbNaKM/DpSiW4+ufI76TTnxV
         Tkr+9cOSqHMbFAflwZEm9hL3V0R9xTAGKsMdCflEjOfQ6T00pEeLS05P5f65Bt6+dan8
         QKSVTND9b8aIOy2p8A1wiRSTxdoB3v7Dd62wDVnT6aMpNoHExVs44/8qjaEmKI5zwMUK
         ZeJBd3lrVG0AASsAuxWUzl2E/SjO9TiMS2e3WiSaiiEsv53zSfK5QrbJQZztMETPSA2e
         tOLrBWLUSDO+1wdp7mYZwtJt9FQ7h3X84FCPo3OEfnv4aHuLq6rOfw2/4T3JgSRV1d8a
         TvZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=sGUY2IfMcOrTXEnsuGo6JTeh5PYEYDjedJjOLy55JC0=;
        fh=EetEWCg/4Cn2RTvRRuBOciIpm7ywCMP350zgLqn++Nw=;
        b=HvM/42EE6CGguuktolXwuvhY8ALTqiBAcEMntNbEAtizo0XH1MSTAFjzyOCHgKa+Mk
         n3w4TjfbZ/NFfzDNnORlpD9Fh9uJ0QdxwPzRf0AX2Sq8AwoFlHWFFQiqwD2mvYScmknB
         FXKcSSGTHZLBTHpALfSquh70vDVdVZEyBnGqqofqrQ1r6C6QlOfnTXpvjx0FM0wVXq0k
         YlCoOxqEH10GMM6hhZXabDBhAwA+PvmCYu6zsKMCgR3zLaGQfx5yyob19kwKF55BOHbx
         //ZaIuXejkTyO1Uv/rjxbvSO1tyVdUdxk6Uu4pQIbyZVgk9HNviPcTv2Z/io9Jwr608D
         dI+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=DPhqDZcL;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.7 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.7])
        by mx.google.com with ESMTPS id af79cd13be357-7a199066cb7si1251384785a.390.2024.07.24.07.54.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2024 07:54:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.7 as permitted sender) client-ip=192.198.163.7;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=DPhqDZcL;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.7 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721832887; x=1753368887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nhEKDuTNwPMDwruusMMbK1Dm5j0cygvuqJe3rM266dI=;
  b=DPhqDZcL7XtqzVRH4cUKpXffYfb1ObwvAMtrQSuANBFIaN2XUbwx2gXI
   myMKyFVs8B7O8qS5ATApwokrPY4XjW9ElRr+m/lgiGs4pFFB60aDoKG0J
   6LYw+te7safNen6Wf5Rna/GJP9/KtDVWuo0VFvNqMjMtarUUiSmyFPOu8
   NVZxvxx/lx6r0VV0xI+a+ppzVDua8jdhaUkWp1ltkgWm7Q1Icibs5RN6U
   ZPM/oDqVkA+uRuMrA/odkdTEiOLY5y+l8BIMKYeddMPtUr3yXhqZQrNpi
   QVnC0QrU/W+Sru1O+yG7qdSKjKETzqrXDMYr/moGt4cByXjZMSOj/y0tp
   g==;
X-CSE-ConnectionGUID: Vk9EW7v3TfCYFI8fXpabZA==
X-CSE-MsgGUID: TCXTCnLYT3ekHTG3xrtlPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="44941942"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="44941942"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 07:54:45 -0700
X-CSE-ConnectionGUID: SQlBHtnfSNazf+k8B1Ve8g==
X-CSE-MsgGUID: gsHTaE3GT0aVEU/MKedVwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="57749094"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa004.jf.intel.com with ESMTP; 24 Jul 2024 07:54:40 -0700
Date: Wed, 24 Jul 2024 23:10:24 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ++/vQ==?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?utf-8?B?TWF0aGlldS1EYXVk77+9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?utf-8?B?QmVubu+/vWU=?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>
Subject: Re: [PATCH 2/8] qapi/qom: Introduce smp-cache object
Message-ID: <ZqEZYEAkMhqBRtbx@intel.com>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
 <20240704031603.1744546-3-zhao1.liu@intel.com>
 <87wmld361y.fsf@pond.sub.org>
 <Zp5tBHBoeXZy44ys@intel.com>
 <87h6cfowei.fsf@pond.sub.org>
 <ZqD31Oj5P0uDMs-I@redhat.com>
 <ZqEJlmR3U6g8zq0z@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZqEJlmR3U6g8zq0z@intel.com>
X-TUID: b50Czt9IRYc+

Hi Daniel,

On Wed, Jul 24, 2024 at 10:03:02PM +0800, Zhao Liu wrote:
> Date: Wed, 24 Jul 2024 22:03:02 +0800
> From: Zhao Liu <zhao1.liu@intel.com>
> Subject: Re: [PATCH 2/8] qapi/qom: Introduce smp-cache object
> 
> On Wed, Jul 24, 2024 at 01:47:16PM +0100, Daniel P. Berrang? wrote:
> > Date: Wed, 24 Jul 2024 13:47:16 +0100
> > From: "Daniel P. Berrang?" <berrange@redhat.com>
> > Subject: Re: [PATCH 2/8] qapi/qom: Introduce smp-cache object
> > 
> > On Wed, Jul 24, 2024 at 01:35:17PM +0200, Markus Armbruster wrote:
> > > Zhao Liu <zhao1.liu@intel.com> writes:
> > > 
> > > > Hi Markus,
> > > >> SmpCachesProperties and SmpCacheProperties would put the singular
> > > >> vs. plural where it belongs.  Sounds a bit awkward to me, though.
> > > >> Naming is hard.
> > > >
> > > > For SmpCachesProperties, it's easy to overlook the first "s".
> > > >
> > > >> Other ideas, anybody?
> > > >
> > > > Maybe SmpCacheOptions or SmpCachesPropertyWrapper?
> > > 
> > > I wonder why we have a single QOM object to configure all caches, and
> > > not one QOM object per cache.
> > 
> > Previous versions of this series were augmenting the existing
> > -smp command line.
> 
> Ah, yes, since -smp, as a sugar option of -machine, doesn't support
> JSON. In -smp, we need to use keyval's style to configure as:
> 
> -smp caches.0.name=l1i,caches.0.topo=core
> 
> I think JSON is the more elegant way to go, so I chose -object.

I may have to retract this assertion considering more issues, I could
fall back to -smp and support it in keyval format, I think it's also ok
for me if you also like keyval format, sorry for my repetition, we can
discuss this in this thread:

https://lore.kernel.org/qemu-devel/20240704031603.1744546-1-zhao1.liu@intel.com/T/#m8adba8ba14ebac0c9935fbf45983cc71e53ccf45

Thanks,
Zhao

