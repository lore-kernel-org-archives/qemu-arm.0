Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1973098ejb;
        Wed, 21 Feb 2024 07:03:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUiXnXChoPZNuUJ1tq6GH31iZmBOKZ930JICkudYMD9G3xP0dMDw13C3aevjv0oC2qY1EQzAbWNZx8Jy7lLRM9agYnfjD9I
X-Google-Smtp-Source: AGHT+IFwMBfC1eBTiR0MLmBce2BdLhJge3M3X2Ix+/1pLUfoOWrV71gT2u8KtW0SoEoLJp4NAIW3
X-Received: by 2002:a05:620a:2283:b0:785:6fea:907a with SMTP id o3-20020a05620a228300b007856fea907amr15634808qkh.31.1708527828233;
        Wed, 21 Feb 2024 07:03:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708527828; cv=none;
        d=google.com; s=arc-20160816;
        b=w3Y7lIYkakg6DfkCtvjqjAedRuMSdMcMZRi2Wf1ZWUI83HJEF/zPdZyTujVPP+c//f
         AmIBUynOgKSOeGDnZceViU1m2zESP3h2T8IzQqSfx55hSvlN2TRqPY6FvTFiHyPJxc7T
         EQAGIb4QuWjKyoYnxPgUyVWz6VtQwkwvV0h7J/rq8hxYs1vfON/0ESeaRNnlEgZ5gEDJ
         4QKMGEDnvR6ug0QKtqPdUV8/3nmz82M5blas+CqkU5cQw6iDVzYB7bgowvEmyPCkqO8c
         TJllAjgll+LmWWxPI+cct+iFiSvP54pib7l+Ruymg1cP24YI1S5WDOwsLWV3xnunFZJj
         X/3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=FrRHH9rEWcdcu63c3eIhUTthKozhGq8AYwLzZgz9RfM=;
        fh=/SuGyH9Z+2qdudrF3MMchhydDowkh6kG2XbW0DvYvXM=;
        b=NDCwWhSRPsGkgqYR3p2IeAciOqyd13cnKmsHl8QChj5N9PR/tb7gc5B0ADNyLk5RQU
         AXPhU5mahogAvpWBs09PlZu/v7f7c+ErX0qLOmCPvG4OWrgmzsnFZyX1U8eW4H5ON9xU
         jNW8ffrwV/CVVFEjHxUNc5bXpydR1D/14qmeH8zVB6PULITL2fELZIG4AZfvbAGSueR6
         9UC2znQV1PDw1TKpvXyrmwa3061HoMhOsvg1eeKxCisiBjNA/apcYgPADwgXjft7ZsJB
         q9UobY1u/GinLNAmfZVH9fLbjA/WaCBGzpLqtBP1xUz2dhYHVQHwasLBgAPTH1UTbI4/
         mvlQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=T4PqPjV9;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.7])
        by mx.google.com with ESMTPS id f17-20020ac85d11000000b0042c711416c1si12210034qtx.697.2024.02.21.07.03.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Feb 2024 07:03:48 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.198.163.7;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=T4PqPjV9;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708527828; x=1740063828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=icf79m790ezLNPPZJLTw/l5EOQt2t+L55q4q0lXCEZI=;
  b=T4PqPjV9VLl08b/LB5uAXPFJ+M9r+J/4udGgC4dN/yGo+4+gDw8cj2rK
   bxKe/vKrY7TYnKxS8VWz47LpNaGauL+pa9GYRho1DdbCbxirENdnUwHA/
   JOPB9qLlJP9NW6AgvJNChC0N2xMtzC6vJ7rlia92YvitcKhDVRFiocvcW
   qrj2Nh6nWRittmdbCLMbMygzc75xqh4EWcExz5NMmmmDWJSUcEPuEy8rE
   BMaNy3GGISMm5a/pDpnYtVGrNJ2Jg2c0cdftaxKBDzf6d/+SjGviHh9Ca
   ABGfGp0Sm6e0JT+nh8AVXAfoGEVYLd/kJ9m669EdILbxirChzcAtlIpj4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="28131334"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="28131334"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 07:03:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="827362818"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="827362818"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orsmga001.jf.intel.com with ESMTP; 21 Feb 2024 07:03:31 -0800
Date: Wed, 21 Feb 2024 23:17:11 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [RFC 4/8] hw/core: Add cache topology options in -smp
Message-ID: <ZdYT94zKGTgG/ipH@intel.com>
References: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
 <20240220092504.726064-5-zhao1.liu@linux.intel.com>
 <871q9656jm.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871q9656jm.fsf@pond.sub.org>
X-TUID: xg/pkKXeKpkH

On Wed, Feb 21, 2024 at 01:46:21PM +0100, Markus Armbruster wrote:
> Date: Wed, 21 Feb 2024 13:46:21 +0100
> From: Markus Armbruster <armbru@redhat.com>
> Subject: Re: [RFC 4/8] hw/core: Add cache topology options in -smp
> 
> Zhao Liu <zhao1.liu@linux.intel.com> writes:
> 
> > From: Zhao Liu <zhao1.liu@intel.com>
> >
> > Add "l1d-cache", "l1i-cache". "l2-cache", and "l3-cache" options in
> > -smp to define the cache topology for SMP system.
> >
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> 
> [...]
> 
> > diff --git a/qapi/machine.json b/qapi/machine.json
> > index d0e7f1f615f3..0a923ac38803 100644
> > --- a/qapi/machine.json
> > +++ b/qapi/machine.json
> > @@ -1650,6 +1650,14 @@
> >  #
> >  # @threads: number of threads per core
> >  #
> > +# @l1d-cache: topology hierarchy of L1 data cache (since 9.0)
> > +#
> > +# @l1i-cache: topology hierarchy of L1 instruction cache (since 9.0)
> > +#
> > +# @l2-cache: topology hierarchy of L2 unified cache (since 9.0)
> > +#
> > +# @l3-cache: topology hierarchy of L3 unified cache (since 9.0)
> > +#
> 
> Too terse, just like my review ;-P

;-) Yes, I'll add more information to improve the readability of the
code and comments.

Thanks,
Zhao

> 
> >  # Since: 6.1
> >  ##
> >  { 'struct': 'SMPConfiguration', 'data': {
> > @@ -1662,7 +1670,11 @@
> >       '*modules': 'int',
> >       '*cores': 'int',
> >       '*threads': 'int',
> > -     '*maxcpus': 'int' } }
> > +     '*maxcpus': 'int',
> > +     '*l1d-cache': 'str',
> > +     '*l1i-cache': 'str',
> > +     '*l2-cache': 'str',
> > +     '*l3-cache': 'str' } }
> >  
> >  ##
> >  # @x-query-irq:
> 
> [...]
> 
