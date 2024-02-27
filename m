Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2552937ejf;
        Tue, 27 Feb 2024 01:06:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVeFgVVLVYAP5Ita2EF23CaROrbYpF6hUYw5OSWqmw0QLxeStQGJ6t02qz41WSeGRfdZWyw83gFT2LVyuSVzbK6Q2O4IUEZ
X-Google-Smtp-Source: AGHT+IGFExLkxUk64VLsHGqdGEUzNLJDfuM2jlvwDkUgJb9dbigeAMRp9bhaECZMowh9HLGZjbFM
X-Received: by 2002:a05:620a:991:b0:787:1873:efc0 with SMTP id x17-20020a05620a099100b007871873efc0mr1811662qkx.48.1709024810531;
        Tue, 27 Feb 2024 01:06:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709024810; cv=none;
        d=google.com; s=arc-20160816;
        b=MmssLACC0ky8PrqVMfmPGa46WpOoRBLpHosjGzG74uR1keOhPwFMrdoPb88oRDAgKM
         UQi+1lvyFjrerB42pnvfCo4B62A1J9ZBC0SRsVckJcyJZUpP4Rj28uSdxsskVV/JzsJT
         Ukq6aKMFHHoiM5IcC7oMtpjB0djZE9gOXPq0qyjkUxkY2yg+9c9uSqpVDLeq2PdvwiMt
         wcNYiPccvvVgd8xxBQ6cL9PztMEcdoAbmUhtj9sWxpt1qHAgyH1Uril1SugyIjQZdW5w
         8mgdIXYbEpkBUSFuSUr3IqbLiFWiRJQ2uKmfuKbfMdApKbGaWRPPYhnFVSuhjEk7f6GE
         lAYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=cA0Z8H0ElmF/rMmsIxphE+mKvBELIESovOYN7z5hxsY=;
        fh=xE0kSxF0WCDtbQjOAA3CLpsfbwhKfJ9P7m1pAcwBsn8=;
        b=Bj0YghV3NjHPsNiQMip8544cCMPK1q3KxA78D5dz7RGcF45JY/YwK+kcjJBpHnvjVN
         FaTzjHAxOfoDMvamqMLN1tFw+qfqbEy+eZ5oD7jPDi6Fx3Dgp2OHipdhB9Gvhd41WSvo
         u0gat+YEuf3CbP+/PZDYUilioGcxJYVHfcZ34E7YoRY6fgfbZzAtqGgnSu7hwG0+xzs8
         ZgQHaaLy8MbkSIXmTGKtqTm3t6R+qxXUwWiBfgLgSb5IP9ZEuh6XvqUV49G2it9+V2M1
         p/7TS6+KLyMqTNTSrBDICwstXlM6E6u64flMBq63ePnl4/8XEw1gBXKdPZ8g6hNLNuob
         SjWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=EpOewoWr;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.9])
        by mx.google.com with ESMTPS id bq7-20020a05620a468700b00787bc4464f4si7797698qkb.263.2024.02.27.01.06.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Feb 2024 01:06:50 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=198.175.65.9;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=EpOewoWr;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709024811; x=1740560811;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/tjKuEbL0I0vIZe6oBP5MOkBmS0O+e/IjNu+fKHM/go=;
  b=EpOewoWryzY0VWxpioqy6/y3/aHbezpiIX55vS4/jMy1Bct+/XGHPE+q
   dFvOiOWnj407evLNWnWo5IJPIt/lszLvoHBwUeeJ6I3Cb77jEMqX0rkrf
   IBODoQZdLAPfM1o8RJGtLZ7yT+VGP7Ozte0nCE/raV+fo0RZ1lKu5QI9c
   dOUThghOVVp3umZVOL5Jh+KaxomHeLM8MXuM+utXcNPUIMPlRSqxW/HdP
   ge/1LrM3JfMd5e5w23wm5JliE78vMu7Vc3PNbD6ipKrRwclSE1ZKQ7Eli
   jNZDD+KebXDdKXcsid7sdsDZcgH0XSy613dgDUMOp0rBs76vjOBtFz/Z8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="25818610"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="25818610"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 01:06:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="6839753"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa007.fm.intel.com with ESMTP; 27 Feb 2024 01:06:42 -0800
Date: Tue, 27 Feb 2024 17:20:25 +0800
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
Message-ID: <Zd2pWVH4/eo3HM8j@intel.com>
References: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
 <20240220092504.726064-5-zhao1.liu@linux.intel.com>
 <20240226153947.00006fd6@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226153947.00006fd6@Huawei.com>
X-TUID: Dur0KUyRrg76

Hi Jonathan,

> Hi Zhao Liu
> 
> I like the scheme.  Strikes a good balance between complexity of description
> and systems that actually exist. Sure there are systems with more cache
> levels etc but they are rare and support can be easily added later
> if people want to model them.

Thanks for your support!

[snip]

> > +static int smp_cache_string_to_topology(MachineState *ms,
> 
> Not a good name for a function that does rather more than that.

What about "smp_cache_get_valid_topology()"?

> 
> > +                                        char *topo_str,
> > +                                        CPUTopoLevel *topo,
> > +                                        Error **errp)
> > +{
> > +    *topo = string_to_cpu_topo(topo_str);
> > +
> > +    if (*topo == CPU_TOPO_LEVEL_MAX || *topo == CPU_TOPO_LEVEL_INVALID) {
> > +        error_setg(errp, "Invalid cache topology level: %s. The cache "
> > +                   "topology should match the CPU topology level", topo_str);
> > +        return -1;
> > +    }
> > +
> > +    if (!machine_check_topo_support(ms, *topo)) {
> > +        error_setg(errp, "Invalid cache topology level: %s. The topology "
> > +                   "level is not supported by this machine", topo_str);
> > +        return -1;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static void machine_parse_smp_cache_config(MachineState *ms,
> > +                                           const SMPConfiguration *config,
> > +                                           Error **errp)
> > +{
> > +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> > +
> > +    if (config->l1d_cache) {
> > +        if (!mc->smp_props.l1_separated_cache_supported) {
> > +            error_setg(errp, "L1 D-cache topology not "
> > +                       "supported by this machine");
> > +            return;
> > +        }
> > +
> > +        if (smp_cache_string_to_topology(ms, config->l1d_cache,
> > +            &ms->smp_cache.l1d, errp)) {
> 
> Indent is to wrong opening bracket.
> Same for other cases.

Could you please educate me about the correct style here?
I'm unsure if it should be indented by 4 spaces.

Thanks,
Zhao
