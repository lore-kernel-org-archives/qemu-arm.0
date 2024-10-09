Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp649450njl;
        Tue, 8 Oct 2024 23:30:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVC5yMIQPaKAEaBVz5w/lB2Wj0UYI8vWaA6gdnVtr8XybAoh6bREq8WBzA52ygEkk8MlbGrpFqi0rF72w==@linaro.org
X-Google-Smtp-Source: AGHT+IFaNjWPqSAv04vQZt+kiGF1Igb349j8lQseYlux2nZt7QcgTLcoTDXBBDAcJ+BhRJ5sHnJg
X-Received: by 2002:a05:6214:2c01:b0:6cb:2e7c:a10e with SMTP id 6a1803df08f44-6cbc9581aa5mr20071206d6.48.1728455425200;
        Tue, 08 Oct 2024 23:30:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728455425; cv=none;
        d=google.com; s=arc-20240605;
        b=AXxy7jbJXoIPXwwugPdD3EH7XLPuldFBYyZ4YIYTO4RVVnSVh0q4SoM1QWVcrEb/Rm
         VlBnYB5oFceZcjDOpDnWOd9zlOHbJlWFlHPj0p7DEt8RkcqFT/GgFVm0AFmECtE1xcfx
         Hi/0MectOgoNG0PrjH9EJTGsFPQoqcnLw0a8a/uSBXsWvp4RMyusaGWlWgRDWg0iEAPl
         2U1mUeW3C/daOJKM6hRyIeVaiTeOSh50puQ+/ehrT0XR/PsqfTWf9hpmnurit/UxfMZN
         F/NwbO4BzxROKuo+iHuNacuIOtAzu9EH99zwRv+3F1eTbYjCQAf2Ox+zRf6Xk+y8GWKR
         NqVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=iHpJuscPNG3n+My/sNxIVYXgApEtaY9ekjyYb07/+nI=;
        fh=cbAkY1/lrVZFl1Psii4/bRd63SJu8f7sXg2Y2adsxd0=;
        b=XR7Ei4R9vGoXuS8/9vXdlB1VrVoCl+g6IyftkMs9iz/ROIkp5tnfsqrWBVOt4uJ6gf
         CPSonpq8Pb+TqytzJvfK7a0TGWM2gS4L9M4dozbIGkFHcnl9tPS4QMOZkJEeUrUCBiO0
         nU8/RhPLGUtTJXLG3qh9OXdkTHFk0UrAyr7f4vSzypLtM1UKPETTugt9v/UO4Pkj4qGg
         hthVTrvRoHvWWLwQkTUB5rGAXBSbfbfrM0U4ryNvDRVzXxHBUEnDEp91eKHVAL89vulu
         buwUKNq+fH2ZKIdwybvXKzzj3JdmAHxfS3hsPNRsilQ3QLykjbVBnsQH83PLBOl59s89
         y1TA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=PbBD73wb;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.16 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.16])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cbd052c52fsi1413546d6.113.2024.10.08.23.30.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2024 23:30:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.16 as permitted sender) client-ip=198.175.65.16;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=PbBD73wb;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.16 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728455425; x=1759991425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8Oj98Uxc6eq05Llc2jkbHDeCDUw7ET0i2OlqlNyHDGM=;
  b=PbBD73wbwKOPra0vxqO3m/MHWFliX9+AxsSFcYUHTSrMzi825fk7thkn
   0oJ1/+VU+o/3fLurbzrzEFIhRwxmiWS/LWouKQ8IK/oXiME5wJpw9KeWo
   yqi2/eFiv6Ae6UO0ixTSBv9uLHni+rnMzTRk07Q5dHoQfjB5HGrEnpqj+
   kGt3la2RR0GadDFzim5kV/A2ihzeTuY6+IO/4XM+zu4jbXPtHKfCJ0gki
   8f6FjUYnls2vxfg2wyhdt0lWm/kTQnQb3L2nCUVYUGqyPDSffr0OqzocP
   mLoZwIgw+g5VeDinWOWtFfisDv5OuV14YQU/OSJrXa4F+2bFIU0GqVIDm
   Q==;
X-CSE-ConnectionGUID: wowp2QYvSUGPZ+KOWJpkeA==
X-CSE-MsgGUID: kiLLDzu0QqufT33IMHDLuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27820290"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="27820290"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 23:30:23 -0700
X-CSE-ConnectionGUID: 7AY6nrLnSbiismYVr75Unw==
X-CSE-MsgGUID: WKYSmQ/hQLO3QpcWbNAMlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="80127512"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa003.fm.intel.com with ESMTP; 08 Oct 2024 23:30:16 -0700
Date: Wed, 9 Oct 2024 14:46:28 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5n77+9?= <berrange@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?utf-8?B?TWF0aGlldS1EYXVk77+9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Sergio Lopez <slp@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?utf-8?B?QmVubu+/vWU=?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>, Zhao Liu <zhao1.liu@intel.com>,
	
Subject: Re: [RFC v2 05/12] hw/core/machine: Introduce custom CPU topology
 with max limitations
Message-ID: <ZwYmxH8sl5v8ZpNZ@intel.com>
References: <20240919061128.769139-1-zhao1.liu@intel.com>
 <20240919061128.769139-6-zhao1.liu@intel.com>
 <20241008111651.000025ab@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008111651.000025ab@Huawei.com>
X-TUID: fvTRqTZCJuvR

> A few code style comments inline.
> 
> J
> > diff --git a/hw/cpu/cpu-slot.c b/hw/cpu/cpu-slot.c
> > index 1cc3b32ed675..2d16a2729501 100644
> > --- a/hw/cpu/cpu-slot.c
> > +++ b/hw/cpu/cpu-slot.c
> 
> > +
> > +bool machine_parse_custom_topo_config(MachineState *ms,
> > +                                      const SMPConfiguration *config,
> > +                                      Error **errp)
> > +{
> > +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> > +    CPUSlot *slot = ms->topo;
> > +    bool is_valid;
> > +    int maxcpus;
> > +
> > +    if (!slot) {
> > +        return true;
> > +    }
> > +
> > +    is_valid = config->has_maxsockets && config->maxsockets;
> > +    if (mc->smp_props.custom_topo_supported) {
> > +        slot->stat.entries[CPU_TOPOLOGY_LEVEL_SOCKET].max_limit =
> > +            is_valid ? config->maxsockets : ms->smp.sockets;
> > +    } else if (is_valid) {
> > +        error_setg(errp, "maxsockets > 0 not supported "
> > +                   "by this machine's CPU topology");
> > +        return false;
> > +    } else {
> > +        slot->stat.entries[CPU_TOPOLOGY_LEVEL_SOCKET].max_limit =
> > +            ms->smp.sockets;
> > +    }
> Having the error condition in the middle is rather confusing to
> read to my eyes. Playing with equivalents I wonder what works best..

Figuring out how to clearly express the logic here was indeed a bit of a
struggle for me at first. :-)

>     if (!is_valid) {
>         slot->stat.entries[CPU_TOPOLOGY_LEVEL_SOCKET].max_limit =
>             ms->smp.sockets;
>     } else if (mc->smp_props.custom_topo_supported) {
>         slot->stat.entries[CPU_TOPOLOGY_LEVEL_SOCKET].max_limit =
>             config->max_sockets;
>     } else {
>         error_setg...
>         return false;
>     }
> 
> or take the bad case out first.  Maybe this is a little obscure
> though (assuming I even got it right) as it relies on the fact
> that is_valid must be false for the legacy path.
> 
>     if (!mc->smp_props.custom_topo_supported && is_valid) {
>         error_setg();
>         return false;
>     }
> 
>     slot->stat.entries[CPU_TOPOLOGY_LEVEL_SOCKET].max_limit =
>           is_valid ? config->maxsockets : ms->smp.sockets;
> 
> Similar for other cases.

I prefer the first style, as it's more natural and clear enough!

Many thanks!

[snip]

> > +    maxcpus = 1;
> > +    /* Initizlize max_limit to 1, as members of CpuTopology. */
> > +    for (int i = 0; i < CPU_TOPOLOGY_LEVEL__MAX; i++) {
> > +        maxcpus *= slot->stat.entries[i].max_limit;
> > +    }
> > +
> > +    if (!config->has_maxcpus) {
> > +        ms->smp.max_cpus = maxcpus;
> Maybe early return here to get rid of need for the else?

Yes, it's better to reduce else.

> > +    } else {
> > +        if (maxcpus != ms->smp.max_cpus) {
> 
> Unless this is going to get more complex later,  else if probably appropriate here
> (if you don't drop the else above.


I can organize it like:

if (!config->has_maxcpus) {
    ...
    return true;
}

if (maxcpus != ms->smp.max_cpus) {
    error_steg...
    return false;
}

return true;

As you suggested to get rid of a "else". :)

> > +            error_setg(errp, "maxcpus (%d) should be equal to "
> > +                       "the product of the remaining max parameters (%d)",
> > +                       ms->smp.max_cpus, maxcpus);
> > +            return false;
> > +        }
> > +    }
> > +
> > +    return true;
> > +}

Regards,
Zhao


