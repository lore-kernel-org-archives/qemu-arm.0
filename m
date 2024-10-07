Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1847428njb;
        Mon, 7 Oct 2024 03:46:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWKrq8p6rV22Yc9Vmki7dkBmkfykDg5FoX1RLIEcUPfjmqAS/lZ4frjZRIqFFIgpxyxkwQcXvXY1R+8MQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEbg2Np9G4tYrbHLSDkFWLsoSHGpcjtUSO3zlZZtBAPLA6Zio3zT+PLJ1tojwfFOX8YZ6L5
X-Received: by 2002:a05:622a:1456:b0:453:5ce5:9972 with SMTP id d75a77b69052e-45d9baa02camr197572871cf.16.1728297975552;
        Mon, 07 Oct 2024 03:46:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728297975; cv=none;
        d=google.com; s=arc-20240605;
        b=LUXbCs6jNLw5EkTdG07dmp+LcdkB4ujVP/llZu55bHF4KQxpZgreFGW4uTGsK3V6nG
         KAIXHM+ClUq3p1HX2f+rctLADADtpm+f1awlwAKQ+sfYVu/vW78P3QolMSr7c1DRXzx3
         Ox6Ofcvr+enUDECtZOUjHo5RV0g60+NU1p8jTIrfaNN0vnfjKSHukrM+VZTb2c9Ptf53
         SFr7JSY2uItBtEXbludnZww07krzTQUwBFnsyNDX7hizt8bAo3CnAr6ZmkqFXRaf+a27
         giHZ0jYfRCF1Mr4qeWAK2nFUo3MzYzZ++oJEmilZy/5h0KGJ79kbg28ncRoltMONhP7G
         TBpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=LZEY2dV1GfkX9dA6/uM+UJJtmcUBX2J2uXd8pfWa34Y=;
        fh=lIQK4w5u8hPKTUFD1dgvaVT/MYYXdD5M0XwdCDzhkt4=;
        b=IWeOo/MSeunDC9QF22j1iyylkBhsud40zkV1/EiuDDGqHwx7p3PtBcGKYvQEAfqSw5
         fGKcfcVmoZAahlr/vaQZ/xE5e2B1U+WYpuN3FAY4l90Jf/tnjtgPt2l82rXRT/3wW6cI
         p8iNmoUzsqgnkrtbGaMIewyyBsQc09MJYP+cYhKveMEnJmueHmLLGrWZ1KhWbxsvsFGe
         GxlX/DflOuqCyjHBQ4y22ROvFRJwSqhesAiOtn4LTIJ0oiWdPahvi4Ul2U73z5Wwb01V
         t/0bLPYDLTjIFFK5YiltKG/kLvVoSv8QpyJRx1IVw5Cau4j6U8qVGCIGzRFco9b5ugl0
         9sgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=UzUp5cdB;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.13 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.13])
        by mx.google.com with ESMTPS id d75a77b69052e-45da764161esi57081431cf.477.2024.10.07.03.46.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 03:46:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.13 as permitted sender) client-ip=192.198.163.13;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=UzUp5cdB;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.13 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728297975; x=1759833975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B7T9+eTv/Zw/x8yFPq2kpJfgxfT66Zaq5LvJc4Qn1No=;
  b=UzUp5cdBKNcM/NgCvhG5PPi010YDlKvKLtsSZhnUOG65eza64bG7Dec8
   uLz/YoYdBETGutI4OdmX35Pn5OmT584g53CGddQ55JMqTaxZGDGZ5E6zR
   FQCPFTRWPDbO8Nb/Ba4dcIMOwchXsUooBhwPpC1tMVIcdEuWPoFFQ76vB
   mBoVT8qXbxCbu5ZTAKIWo8lFx4y74nDrZ8SqDNUc+emfbFg6QhltOBxlo
   ZdE6e1JDTb5lKQeVM/dfbC0B17LwG4pR1hB/fa7Bmop2xs8QmVcEwMCxQ
   iixJrrNgN6ZquDTA741CYJeF9AkL99PszLtp9sihsrbNSr5JAzmblQPiq
   w==;
X-CSE-ConnectionGUID: 7E578YZFTJqwtTYojEQmxg==
X-CSE-MsgGUID: MyXswNrwRYCnvG4Op1PHYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="30323834"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="30323834"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 03:46:14 -0700
X-CSE-ConnectionGUID: AX+g0EMbQD6q55DiWdQOyA==
X-CSE-MsgGUID: dW1FG9hzTJijhkJ9dGXajQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="75004461"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa006.fm.intel.com with ESMTP; 07 Oct 2024 03:46:09 -0700
Date: Mon, 7 Oct 2024 19:02:19 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S.Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Alireza Sanaee <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH v2 3/7] hw/core: Add smp cache topology for machine
Message-ID: <ZwO/u0T+65b2/cFg@intel.com>
References: <20240908125920.1160236-1-zhao1.liu@intel.com>
 <20240908125920.1160236-4-zhao1.liu@intel.com>
 <20240917100048.00001bcf@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917100048.00001bcf@Huawei.com>
X-TUID: iExJKXi4srmo

On Tue, Sep 17, 2024 at 10:00:48AM +0100, Jonathan Cameron wrote:
> Date: Tue, 17 Sep 2024 10:00:48 +0100
> From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
> Subject: Re: [PATCH v2 3/7] hw/core: Add smp cache topology for machine
> X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
> 
> On Sun,  8 Sep 2024 20:59:16 +0800
> Zhao Liu <zhao1.liu@intel.com> wrote:
> 
> > With smp-cache object support, add smp cache topology for machine by
> > linking the smp-cache object.
> > 
> > Also add a helper to access cache topology level.
> > 
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > Tested-by: Yongwei Ma <yongwei.ma@intel.com>
>
> Minor stuff. The property stuff is something I seems to mostly get wrong
> so needs more eyes but fwiw looks fine to me.

Yes and thank you!

> With the tweaks suggested below.
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> > ---
> > Changes since Patch v1:
> >  * Integrated cache properties list into MachineState and used -machine
> >    to configure SMP cache properties. (Markus)
> > 
> > Changes since RFC v2:
> >  * Linked machine's smp_cache to smp-cache object instead of a builtin
> >    structure. This is to get around the fact that the keyval format of
> >    -machine can't support JSON.
> >  * Wrapped the cache topology level access into a helper.
> > ---
> >  hw/core/machine-smp.c | 41 ++++++++++++++++++++++++++++++++++++++++
> >  hw/core/machine.c     | 44 +++++++++++++++++++++++++++++++++++++++++++
> >  include/hw/boards.h   | 10 ++++++++++
> >  3 files changed, 95 insertions(+)
> > 
> > diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
> > index 5d8d7edcbd3f..b517c3471d1a 100644
> > --- a/hw/core/machine-smp.c
> > +++ b/hw/core/machine-smp.c
> > @@ -261,6 +261,41 @@ void machine_parse_smp_config(MachineState *ms,
> >      }
> >  }
> >  
> > +bool machine_parse_smp_cache(MachineState *ms,
> > +                             const SmpCachePropertiesList *caches,
> > +                             Error **errp)
> > +{
> > +    const SmpCachePropertiesList *node;
> > +    DECLARE_BITMAP(caches_bitmap, CACHE_LEVEL_AND_TYPE__MAX);
> > +
> > +    for (node = caches; node; node = node->next) {
> > +        /* Prohibit users from setting the cache topology level to invalid. */
> > +        if (node->value->topology == CPU_TOPOLOGY_LEVEL_INVALID) {
> > +            error_setg(errp,
> > +                       "Invalid cache topology level: %s. "
> > +                       "The topology should match the "
> > +                       "valid CPU topology level",
> 
> I think that's too much wrapping for an error message. Makes them hard
> to grep for.

I understand you mean the last sentence should not be on separate lines
but should be continuous in one line, right?

> > +                       CpuTopologyLevel_str(node->value->topology));
> > +            return false;
> > +        }
> > +
> > +        /* Prohibit users from repeating settings. */
> > +        if (test_bit(node->value->cache, caches_bitmap)) {
> > +            error_setg(errp,
> > +                       "Invalid cache properties: %s. "
> > +                       "The cache properties are duplicated",
> > +                       CacheLevelAndType_str(node->value->cache));
> > +            return false;
> > +        } else {
> 
> returned anyway in the above path, so can drop the else and reduce
> indent a little.

Sure.

Thanks,
Zhao

> > +            ms->smp_cache.props[node->value->cache].topology =
> > +                node->value->topology;
> > +            set_bit(node->value->cache, caches_bitmap);
> > +        }
> > +    }
> > +
> > +    return true;
> > +}
> > +
> 
> 
