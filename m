Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2581563ejf;
        Tue, 27 Feb 2024 02:22:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXzufhnWecARtxleLQJKuQG5IxjN+YdJQPJt3W1MMEo17a3sWIU+n0mU18Qa1Vc2nJZ4LQh/wfI6z8LK+oEHhLj/cWbF5L5
X-Google-Smtp-Source: AGHT+IEJ7vm8S146qvpfcqH3ZrOzug1AAuXMavjXIHtxK3D+vQ3PCQBaTU0imdBKxUOS28+vyIXX
X-Received: by 2002:a05:6214:27c6:b0:68f:ed21:d91f with SMTP id ge6-20020a05621427c600b0068fed21d91fmr1829798qvb.35.1709029321155;
        Tue, 27 Feb 2024 02:22:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709029321; cv=none;
        d=google.com; s=arc-20160816;
        b=DUua/+3rjzhPrxgfleNwosrl6YK3CekAYX7iKpwvsLfheErcSRYs0j9UjNI314MWex
         1LPbA7P176IzQqI12BV1y39xmh3hupiOQXvmAtQdCLDUw0h9wMkewcLBDu0Lcb5vXMGA
         Cd7asLdKmRUunS8NXHHQOTVV2cUvZqQb1QyNX7XdRTLSf/BU0jwtLE0jyd7Cczu/xDT4
         Iptr4f78MF8oDasiR0j760R5jRp233VWn3To60zR9PbiU9fddQSKZuaVpQquBBPda/at
         EwnwoFPtpn+p532WRUqTla4nrbAGGtLuVSv7oDWb4wwkKjy79hSh5QHmxSVjOS7VXpxm
         5oCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=H+xE3Gx6S4gl2hYXxwRwZzH9lgbLUHuy42cixxPZEg4=;
        fh=qPrRd1C5QtaWXQ+dPGvyjMJslmYMb40+RDVeGLW6Dl4=;
        b=NkSBZPHZWKZVpNgOUm6KzgGyNJ7pasT5Tcy8fq03iz6rb98BJ788Bvkx4Q1xqxKVbA
         M+s6hx4RToH74ygPFOCBjRtqkRKpzz9DzD7fg0mfz7adGmiCu4vq0LPUiO7ZAi18GBGF
         P8lZfP9DU9tH0Zh5ztEAH7QQyMQianIthEZfhU3Ixx48o/8fO3CU1AefsTHhqGT8tmZT
         tqn9X2w39961oIg7tx0yA9zSRZEOMUBeTGzLW21ZfSjaAXH0t5+ipphvFwZX83bV90sy
         2ulyxTvySL6uTuFa2W5fSTPq2T1Vz5th9aAF51AWlYHJLuHnfVXs7WffcBsFdHvMjBTN
         sObg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Sc0V3Ph9;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.9])
        by mx.google.com with ESMTPS id jp9-20020ad45f89000000b0068f555f32b8si7263390qvb.491.2024.02.27.02.22.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Feb 2024 02:22:01 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.198.163.9;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Sc0V3Ph9;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709029321; x=1740565321;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F6+NTEf+OvKxItgO+SSdOalGV2SCEFkd9K7C26e6mKo=;
  b=Sc0V3Ph93BI2O3lVQDvVtP/Q0pLbDY/9OWrpSB8pTxQanUhPSoid4TtG
   rGNYasHrwV26dYyK9OTnOQolbQ1W1KJCFqjF23Hb+xWz52JJq0NC1Xj8B
   feKjUIw9j19ZsL3Ab7FISLQyhZh8bwXafqdai7yvS/SvKXPX2BuUM4hhI
   SGhFWGoittEf998/kNnCC9lbORj3AVBAkYgvK+9uN9uBgrMRlPbQCin+i
   P+cPUIYBSbdNozLWVGA492BCLGddbEaVTXkVkxYnjOve4dcb95wACh6yW
   OYnWy443nHKuy7DYtqO7DNfy+1bZ+mn79S+rjGRcjYA9U53E20Hfjbu01
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="14071182"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="14071182"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 02:21:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="11587755"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa003.fm.intel.com with ESMTP; 27 Feb 2024 02:21:53 -0800
Date: Tue, 27 Feb 2024 18:35:36 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?utf-8?B?TWF0aGlldS1EYXVk77+9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?utf-8?B?QmVubu+/vWU=?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [RFC 4/8] hw/core: Add cache topology options in -smp
Message-ID: <Zd26+BpXQID95lqm@intel.com>
References: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
 <20240220092504.726064-5-zhao1.liu@linux.intel.com>
 <20240226153947.00006fd6@Huawei.com>
 <Zd2pWVH4/eo3HM8j@intel.com>
 <Zd2ndJghXbmMHzBn@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zd2ndJghXbmMHzBn@redhat.com>
X-TUID: thmdWcGbUdgM

> > > > +        if (smp_cache_string_to_topology(ms, config->l1d_cache,
> > > > +            &ms->smp_cache.l1d, errp)) {
> > > 
> > > Indent is to wrong opening bracket.
> > > Same for other cases.
> > 
> > Could you please educate me about the correct style here?
> > I'm unsure if it should be indented by 4 spaces.
> 
> It needs to look like this:
> 
>         if (smp_cache_string_to_topology(ms, config->l1d_cache,
>                                          &ms->smp_cache.l1d, errp)) {
> 
> so func parameters are aligned to the function calls' opening bracket,
> not the 'if' statement's opening bracket.
>

Thanks for your explaination!

Regards,
Zhao
