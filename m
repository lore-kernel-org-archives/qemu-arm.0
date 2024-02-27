Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2752164ejf;
        Tue, 27 Feb 2024 07:42:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWXqK4MqJt+NEQc2dr1bJ7QFxc9YVEZkl8mL9o5Q0V2LYNyj0ZmzFDcDG4ZYfklrvuZXmQpT7dvVxLLkIe0JhaRwfZanUcx
X-Google-Smtp-Source: AGHT+IGN9PqIhH0VxxneXjSYlcjNdA8OOqQI14jPIBGj0gGvpEWHhtAw6SCnw+px9upRvzRnK0xF
X-Received: by 2002:a05:620a:4689:b0:787:b817:213b with SMTP id bq9-20020a05620a468900b00787b817213bmr3147876qkb.14.1709048530630;
        Tue, 27 Feb 2024 07:42:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709048530; cv=none;
        d=google.com; s=arc-20160816;
        b=frnV7p9kllDMLk/L0yYweLz6UveXVslMj+xNORS1z9zo3mw7kNC6xw17yB1gJsepIJ
         ag2SxEYogcfOCzII7qBolTOT8l/BUbDNkyOL4GBLt0zlKRjBa+fBfuE+Yq/HYtDM7ts2
         zDyChfldOVFpRPZqHAq6qk+SSTaJrjYrdWxHt9K871CDaPWRBo+GmqGpUQL7MGqwwTan
         aFXnvwRmnm1zlsjqxWTXKQC1adnlbDN9OoBzKLpron4QpEqYxMe8hYyo12aAG694xYT1
         KO7MF0UGIKl4LALNo4IgURF9CN+6TDUUMEqMBsksxALksNB0jbJsDgUsxHvjlOqgu9tQ
         z3Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=mILa5K4XepqKcH6OQ6NVb2VC5bmxLxx4tDY+FDiKQvg=;
        fh=xE0kSxF0WCDtbQjOAA3CLpsfbwhKfJ9P7m1pAcwBsn8=;
        b=VEVl+WWFd8KEzrj8acZW459PoDJIvn2pN2ARZ+ieozjWhToRmZ0hT2DdO1KAejVMb2
         V+PBZszUuxnD+YDJFrv72DG3g7X26Y/p+yMMDXPDiKOzcu45+g8o37Ok3iG7ZAjTioQb
         uhwQwp3Z5ln57SB+BsDFC94kCSX0wzkTj5hjLqlGurSz/n4UFsKOAg1/7AsjGkDoZa1b
         QNn6fZlNGsQbW75oFrKo0/zi17FGVb/nYDzImV55ccXN2MuX8kg3piS4uNS6Oe5yHpFI
         IhOX77fYqCiPfijRrKBdCTNYXuqMOROC75WrVsUrQN2WNBAXKB7LM58bs2egXL1m0ARL
         1aTQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=LyYAnjpw;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.18])
        by mx.google.com with ESMTPS id b27-20020a05620a089b00b00787b199c899si7683831qka.277.2024.02.27.07.42.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Feb 2024 07:42:10 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=198.175.65.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=LyYAnjpw;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709048531; x=1740584531;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PpopX1xgqsSGu+ibkHdRkgrvQaMYRWvsytFX1WWOZtI=;
  b=LyYAnjpwPhSMe/HyVPXvBVjKLknaBKjW7DoEKew1B0zp183vpsoVy+/p
   orUi+Vp6gby4soH8tXoZJlCuiVj1vCn8Fyxcx9Cf5lgqk+HTg5KXjYOp2
   kFYF4PT4heNLodq6/+VHULvSoNhMCk4YVyThMRtpsfNG9vEE/afvlirWM
   twARQgq+VtE+BFJyBFGazwRsrR3LXrp3y/1jVWwJ6c0sruyvhpmiPgs+T
   LqlHSh96DOt1pvYLlQfmZk9m2lPeXMjjB7ctZ2/DOtgDcqgHuVrODgRly
   cLEz3V0j1yCDSomuTohWT/8DSzzXo+AH7bk+TNCM9cmAMQPLoyMKfir7V
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3513681"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="3513681"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 07:42:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="11697786"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa004.fm.intel.com with ESMTP; 27 Feb 2024 07:42:04 -0800
Date: Tue, 27 Feb 2024 23:55:46 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5n77+9?= <berrange@redhat.com>,
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
Message-ID: <Zd4GAhwpw/w0QUth@intel.com>
References: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
 <20240220092504.726064-5-zhao1.liu@linux.intel.com>
 <20240226153947.00006fd6@Huawei.com>
 <Zd2pWVH4/eo3HM8j@intel.com>
 <20240227105145.0000106d@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240227105145.0000106d@Huawei.com>
X-TUID: xY2MIvPtLfiv

On Tue, Feb 27, 2024 at 10:51:45AM +0000, Jonathan Cameron wrote:
> Date: Tue, 27 Feb 2024 10:51:45 +0000
> From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
> Subject: Re: [RFC 4/8] hw/core: Add cache topology options in -smp
> X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
> 
> On Tue, 27 Feb 2024 17:20:25 +0800
> Zhao Liu <zhao1.liu@linux.intel.com> wrote:
> 
> > Hi Jonathan,
> > 
> > > Hi Zhao Liu
> > > 
> > > I like the scheme.  Strikes a good balance between complexity of description
> > > and systems that actually exist. Sure there are systems with more cache
> > > levels etc but they are rare and support can be easily added later
> > > if people want to model them.  
> > 
> > Thanks for your support!
> > 
> > [snip]
> > 
> > > > +static int smp_cache_string_to_topology(MachineState *ms,  
> > > 
> > > Not a good name for a function that does rather more than that.  
> > 
> > What about "smp_cache_get_valid_topology()"?
> 
> Looking again, could we return the CPUTopoLevel? I think returning
> CPU_TOPO_LEVEL_INVALID will replace -1/0 returns and this can just
> be smp_cache_string_to_topology() as you have it in this version.
> 
> The check on the return value becomes a little more more complex
> and I think you want to squash CPU_TOPO_LEVEL_MAX down so we only
> have one invalid value to check at callers..  E.g.
> 
> static CPUTopoLevel smp_cache_string_to_topolgy(MachineState *ms,
>                                                 char *top_str,
>                                                 Error **errp)
> {
>     CPUTopoLevel topo = string_to_cpu_topo(topo_str);
> 
>     if (topo == CPU_TOPO_LEVEL_MAX || topo == CPU_TOP?O_LEVEL_INVALID) {
>         return CPU_TOPO_LEVEL_INVALID;
>     }
> 
>     if (!machine_check_topo_support(ms, topo) {
>         error_setg(errp,
>                    "Invalid cache topology level: %s. "
>                    "The cache topology should match the CPU topology level",
> //Break string like this to make it as grep-able as possible!
>                    topo_str);
>         return CPU_TOPO_LEVEL_INVALID;
>     }
> 
>     return topo;
> 
> }                
> 
> 
> The checks then become != CPU_TOPO_LEVEL_INVALID at each callsite.
>

Good idea! This makes the code clearer. Let me try this way. Thanks!
